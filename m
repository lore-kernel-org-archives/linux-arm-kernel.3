Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lK7ohFdEAMIwgPt7gLEpD5YoicRl00ld7oZBGaVtP6I=; b=IAaMEM9O5v4HhRctrEdBkA5Gso
	0PAkriTzqiIuM60xyfDevtxmPmF01LOLY4doqVOtaP68fkmbeaxw2uXLn/BKtwhivDvlTAtt3INCD
	LD/uZ+5QzsqUNR0YGCZqNE3+JGP80aanupIDDmyiRIDdhtUD2TFSAUfNpQiO80+y6TN1wkMZkg/50
	dQdeQlSHqy9FmwbugtbIFyLO+8k3SnjQ4INGvHzXkQ4+8FSoQgEh793kuy2cZj1X7wZmz4slrOmPK
	CbUyNx3X3FL1hACzdsl5M62SOgOA3eiYtjH6oH8Z8sf81WYgyJI8wx0AD47+X9vFf8NDZy7UIAIsn
	kmaLQUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLbmt-00000008Rpk-0nU2;
	Sat, 09 May 2026 07:07:47 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLbmp-00000008Rp1-3qIN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 07:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778310459;
	bh=lK7ohFdEAMIwgPt7gLEpD5YoicRl00ld7oZBGaVtP6I=;
	h=From:To:Cc:Subject:Date;
	b=smQtIsGYPSJ+gEP+tBxu2dNCZzxgSw7VYylxBUaKGh22HxwnCCiSV/5jgyeWtfa7w
	 yCmVxCLjR5vm4MAlrvHxGt9DWt8J5EqBspawUJ/vd/K7tDs+dPQctp8+0Ajr5hc6oY
	 FYxyWUbh7Xt5p6ctJmy6Ln7kMg6woVuERvBzM194=
Received: from LAPTOP-LEO.yizhu.local ([61.169.175.90])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 1E528A4D; Sat, 09 May 2026 15:07:37 +0800
X-QQ-mid: xmsmtpt1778310457togr8xore
Message-ID: <tencent_F13723B53F68DC857410D3DBE4F6C895C106@qq.com>
X-QQ-XMAILINFO: MJf32pulH481fEIAojPZ1aL2Obd/WH1jnkB3OnJ8p9BS4LEZKHvj8ckfFRQGTE
	 DhUpEQqnkOUC1uqR/falbX4f12fellpoyAFtAudqK/AVzyDUccZFeBhO20qtvsrDYaX7F4dyaSv4
	 CN5bdC9rykHSjjAAR4/pqW2B0BC//wGHg+cg+Z3hEsvDR2ZPX3aUNcJ/00EsLgSRc1Y5ub4wWCY+
	 2pbiV/GDNOEPOBFrGLXr3wNhA7ZT+6gmbyOqjfgXExHxAmp1QPAk5Gyc9TLauLvL3/NfctzgKwBF
	 D71PNegdAZamz9cmaHhxt44iY/P09fjZ36k5Tc02ERxWyurBdKhRDgiHrhuyVY06amtAZ+C1r/Pa
	 p0XUN5AcT8LwoYApg5TR2lEdgMGBUJk9JvqL7UOMLGxP0C08ECLVEGqgy7mZ/F3NQ/puITug38tz
	 y/6uEOmWb+/JxY8tpZvHs12GUatTrbH/hZiSA1KXZQRCRr7Vmu0V16oqz+IVBz+WOedcN+EK5tml
	 9VcK1KUoMtTTL0Bn9IzFibHAoD9uygtY4yyp52LwhQddqAOt828s5tz26QfYpgMzN4kLR7MWzBhX
	 yL4h/dCCjtw9dmakxbVmPUKzuBJmcminocNzROhKxOBNzx1AOnPC27fAJoV69fcsrD+7UVKp9j8D
	 v4qyFV5yRaGZ3XyCdRYWrrlIcV2FxpfVxZ7RUYWsQNFUCm876tq5zJ9mfdAJhCJc/W4/J9DpC7zd
	 KW8atni+Zrusy19Blq5QNbEn0xvSPcpJoxq6YSkMpMcBoHCWhMUYEIJ97AJe6afy+OtQbaPbqVVu
	 XPplw85WGw8kHnukoSSdpQ3JGIkoukhe94my9wXZMcekmb+nD2gjBZZ9NeNC8jl76fprR7S5wJy+
	 5wnVOXmLm9yvn6RPA3PWJA/3t2xA31ZpCQjoXWWSfL5hpNvPEhat82awO+bixvQq6H5H0ikyOK05
	 kcBIgo/igBSu4aR6Wniewd8u+OxGaWZgM60OJY9vU9IWLLuc5i4VFQcWZEmm8xeMC3myYi0kP9KL
	 IjyqJW9ay3yWZGtlkuSPPCvqHEoyY9PBQ7O6E+S9SeN+S8P3eV8+/w6C3+1wZb5rZFXFZHXm53an
	 3PLwNA8oac2yQDOdk4xytsvaAfXw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Leo Jiang <leo.jiang1224@foxmail.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Leo Jiang <leo.jiang1224@foxmail.com>
Subject: [PATCH v2] iommu/arm-smmu-v3: Limit queue allocation retry boundary to PAGE_SIZE
Date: Sat,  9 May 2026 15:07:33 +0800
X-OQ-MSGID: <20260509070733.950260-1-leo.jiang1224@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_000744_272227_A68831DC 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Stop retrying queue allocation when qsz reaches PAGE_SIZE.

Signed-off-by: Leo Jiang <leo.jiang1224@foxmail.com>
---
Changes in v2:
- Use real name "Leo Jiang".
- Remove code comments as suggested by Will.
- Limit the queue allocation retry boundary to PAGE_SIZE, per the feedback from the maintainer.
- Link to v1: https://lore.kernel.org/linux-iommu/tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com
---
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


