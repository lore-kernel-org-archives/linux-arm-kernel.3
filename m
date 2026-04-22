Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D006F9B5F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My6EacjSNjmZHU0CTpNvEYFjVGs69rZoNa95xb2tQH0=; b=V3V/8NE/6z7WMdLd/ZEn1IXh31
	m//dxGXHXEO7VmJI2FkFRLGH7islpHQo6pHGKJS+kVRPR5fDjlTGv3OSB6hIaO0SadTgo+M13p4E8
	s5WsCIh4c0A2mZjUUkR3HXAKyCuDXhLsZ8+64PXRwTOfDZu1caWgqgl2OSMTCaP6w2BleFjXNGKyz
	8BT71WLiecSn7LSQhDtId3pTDt2QY7yg+AoNRI0cCzJadi0WuJeCDS83+Nl3e6illjfKNPzoL39Hr
	bv7rQ/BL/Ix1iTbQe4WYaL4LQyYpPEmucwGwf6D26JbQ3dZh7uOqwZpQttHLLer3UYMy34cCr2PUb
	uxAs4YUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTtF-00000009qG0-2cje;
	Wed, 22 Apr 2026 09:29:01 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTtC-00000009qFG-3pcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776850135;
	bh=My6EacjSNjmZHU0CTpNvEYFjVGs69rZoNa95xb2tQH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hG1d0IPj/EyGS5LZMAA6yIpL1c8xXk4rWtgLrNGHimeE0qcN5W5sSXpxH5FN5OJn/
	 BZneeaUHe5uQQqh6S20EqP1eFg8Ixf8DGx+ARanhRTYvsM5DUmolan2RIUUpb+ZEbi
	 xEqg9o3FRJIb49u7ANOxUo7srsCc3Y5WwMsC0n4I=
Received: from LAPTOP-LEO.yizhu.local ([61.169.175.90])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 735968E0; Wed, 22 Apr 2026 17:28:53 +0800
X-QQ-mid: xmsmtpt1776850133tw656rhmy
Message-ID: <tencent_361CADF43F93DCA4D5489881006382FF4006@qq.com>
X-QQ-XMAILINFO: MIoti6gokNxFG89lDdt/Ih6wjJqL2qXZRDgYysB5haN0dSdvhD8KKtT4+mwQ2K
	 s0SsaXzcyN4ptUbs/odxnD+TBA3tSKEMyQ2HInL4H0n9sfmqlbn53bjcJlZM5ad7sjq6+Ev6CxmZ
	 Ozn2c0sXUl5yps02x95b/CrXVubw5B3ZSRrymB+o70of8X9ASlUqUMcZ1aZzX0MWHPR+nvjIv9re
	 wkqC6xFLqlWdOh7mUE90TFnC9IIjTfkCa0fdwNAQKMxD9aamVwUhwbBClWCjiAtrxt8z9zmz3u1N
	 /jauqWukPI7W10c/iu6AQyVrDenlzMIH6VcQKQdAN4WVHQPUm4tiMqwK/pqB1Kc30JDoxVJYrGea
	 qWXEdbidWzLUGiDjU+SureWFBYe8Gj9p5NQ3tcXCVY51ge27/lKos/i02qAWzGvE/hkN3SZ+ZmGL
	 1qghN10rVbZh/ho2ZV71BmTJ3Ax4sJjA3iBwesCUpjbJ3FthON2vYXzYko9ZWMlJTT0NpQLoU7/w
	 G9XDLDwfPlAUT8TZSRZM8U7opKV9pUo3ESLM0xBBJsrBX6shmxjcQuS2Ufp1h8C1UclZMhWsCrhB
	 xw+G2xs3bUP472D7u2Hq/Hd2NyuDbYbnPnEJ7Hc12prmMeNVUgNPXO3yZj2YJmUCykDBkhRFqHil
	 JB59BcO0jh8sGz7yv6ktx9yYzRjDZFE0ZeyiHXhm/9UBmKmzE/1y/AxsIbmBJ/VXlSz0djroXLCb
	 BjKEg0qbr5FEfRJ9laXtLsqvyuj2grcl0w1xglagmO+x+KnK9lZ7Eu36pgj56Za+IBnTbauJ1SIB
	 lO5fknXIwLaSP4sqjbxIxJzbnLlEH5i/WRkEsqEpWNK5Srjuw+cqe1dvfCegrdaZhSYOUqIvVPrH
	 1nEHrXab6y3oQoj6CbNlvOQFmX40ZYX5CcGocEmAqrm4MmlHyFiClaepOCkY3rTzpetirijVlzYZ
	 mqzrnZr3zmTx46MfStKCxIgk1r/vFIYgZkjBIZjVQ1tHqeJFSuvMtPoraNpjQx7OWMLmdwvBNO7F
	 lAxPoQlPIikfX/5MVzqxeCFKKUPIYhVdfnCIZCG2SrRpPtRQT5BhT6cMbXxiaDmfl3pRENh068oq
	 mPKgAvYBo3xQq3h21dTAitDGRuQVRWqAbXeNE7WTQi5NnZnKAK9gd78sLeXlNDcOy1rJxm24cX8T
	 Xzbw2r754Bfl2v3k4VP1YTxN+O
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Leo Jiang <leo.jiang1224@foxmail.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Leo Jiang <leo.jiang1224@foxmail.com>
Subject: [PATCH v2] iommu/arm-smmu-v3: Limit queue allocation retry boundary to PAGE_SIZE
Date: Wed, 22 Apr 2026 17:28:52 +0800
X-OQ-MSGID: <20260422092852.1824220-1-leo.jiang1224@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_DA99B62735469A0CD219E9FC73E234A47309@qq.com>
References: <tencent_DA99B62735469A0CD219E9FC73E234A47309@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_022859_290307_6AABEE4E 
X-CRM114-Status: GOOD (  11.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In arm_smmu_init_one_queue(), the driver attempts to allocate the largest
supported queue and retries by halving the size on failure. Currently,
the retry logic allows the allocation to fall below PAGE_SIZE if the
PAGE_SIZE attempt fails.

While dmam_alloc_coherent() can theoretically return allocations smaller
than a page in certain configurations, it is preferable to limit the
retry boundary to PAGE_SIZE for SMMUv3 queues to align with the
original design intent.

This patch ensures the retry loop terminates when qsz reaches PAGE_SIZE,
per the feedback from the maintainer.

Signed-off-by: Leo Jiang <leo.jiang1224@foxmail.com>
---
v2:
- Use real name "Leo Jiang".
- Remove code comments as suggested by Will.
- Limit the queue allocation retry boundary to PAGE_SIZE

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..4a0b15b1d4d2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4418,7 +4418,7 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
 		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
 					      GFP_KERNEL);
-		if (q->base || qsz < PAGE_SIZE)
+		if (q->base || qsz <= PAGE_SIZE)
 			break;
 
 		q->llq.max_n_shift--;
-- 
2.34.1


