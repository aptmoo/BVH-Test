#ifndef BVH_H
#define BVH_H
#include "raylib.h"
#include <cstdint>
#include <vector>

enum class PrimitiveType : uint32_t
{
    NONE = 0,
    MODEL,
    __FORCE_UINT32 = UINT32_MAX
};

struct BVHNode
{
    BoundingBox aabb;
    std::uint32_t leftNode, rightNode;
    PrimitiveType primitiveType;
    uint32_t primitiveId;
};

class BVH
{
public:
    void BuildBVH()
    {
        BVHNode& rootNode = m_Nodes.emplace_back();
        rootNode.leftNode = rootNode.rightNode = 0;
        rootNode.primitiveType = PrimitiveType::NONE;

    }

    void UpdateNodeBounds(uint32_t id)
    {
        BVHNode& node = m_Nodes.at(id);
        // TODO: You know what.
    }

    void Subdivide(uint32_t id)
    {
        BVHNode& node = m_Nodes.at(id);
        
    }
private:
    std::vector<BVHNode> m_Nodes;
};

#endif