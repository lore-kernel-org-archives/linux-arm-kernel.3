Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551DFC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HB1hz+ricoDCLB7RNvWCnPHdSK4a0MIDQPyM96qZLrk=; b=Mzdoh80+oNAAe+hOnc9b2CugO9
	dtvGDHEZNNv+aH+vqUJi/gtgOomT9S8Rvfb8ahZKCZcGB+XZO40L73+He5J1+F8Kf66d6bo3TMTne
	ClFkK6nChFfkhtB78CoGu0gM8ylZhYsvD72TzoJSd2pqj6iDMpSD4byK3Sk42RLvv1opJCEz9CUO3
	pkP2RUI5NX5xBbEUxRVUQc26IeLIn/S7jYspXmnNCV2Nz1RQihtBOMrWNtc8FSE09RAPjyu4WJHcX
	JsSJA86ucj5Hm40AooN931cDRX7F0P7XbugygNvJUinctLSRkuhoRV+GMVdILgQg8HTjFNP6+Bur/
	EdxVRADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uad1I-0000000GndP-3b5H;
	Sat, 12 Jul 2025 16:24:12 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uacyu-0000000Gna3-1Hmd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 16:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1752336989;
	bh=HB1hz+ricoDCLB7RNvWCnPHdSK4a0MIDQPyM96qZLrk=;
	h=From:To:Cc:Subject:Date;
	b=CxyoSBkT5zD1U4U0BAScl2G0/2v6aoluF/JbafR+mGvo8DZQKwmAn9BbvBF4HfqW6
	 3hqjT5chbAvhqowp0px+qEvIm3/eigNdxcJdUqneytoWyoq0YnTUfkYYtlT4mS4LaD
	 Fpzb0PKyoYqzRLXkXSds9VUxx/FZTZ3NmaGtz0NA=
Received: from KernelDevBox.byted.org ([115.190.40.10])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 419B4E38; Sun, 13 Jul 2025 00:16:25 +0800
X-QQ-mid: xmsmtpt1752336985tmnmdg17y
Message-ID: <tencent_22664B08ACDCE35DE10E5546C2FB26B59605@qq.com>
X-QQ-XMAILINFO: M84Ob7gbJGBWc01xJ7vkYkFSoybpZ2krgmPfjVOYXJ91Ln8jjLUHzFW0alz+Oj
	 X2oy1OQm8f+cdzMidft6pl81ZjcmuCSuDXpQcWuPMfG2Pi2YWF62hfR0OiwNYK1f7e2gYmxXErba
	 OV7OBlODTowdCIiY16gYCTeGutRSKz75a2MSsjGe2GuEwNMeHPrJf6ijIQrbxB+qneOp9rPMFuDx
	 xcdRQx1RZe+Ekc740wBdVOhxVWHe0qBhGqDIsjPpjSOLzbCyBqxKMP3gtxLSDRLSbqH8I6/TFqCo
	 BWwrR/FKIVeOdAXRCzVNlpckbMWjW3TyePIoo+NeTLN4uFLh0LWzJPY9JihqVXqXozr8F3+kjqLQ
	 ZS8LqGw8tsRGY2c8bQgMsWCLd11LSKtu86Us787fVGi15F06adnHgjGoqyI1eHf3w1R+eqI4yZv9
	 oUHyhMrOvUE/YVSrRIhSD5kx0fXU/yhTjDHmCr3bv3GTgZP1xxt2pGWlzs1nFuubEX+XsdL35YWz
	 ArVv+QR8Jd4psGTurfjNH85xlAbGM94TSc/noMf++dyXNYkJG0uqEx0EhyhziY8IqW94DRAz9WLH
	 /9YhpQ08Zqff0uiR07UbAhSk0/7e/yhdSMx5bvn7FXO5N7lBpJ7d5CAnae6f8zSKfOQz8Tpn2bJp
	 ik268Hs2psc9pqOYzKvZ2KXDq0jW+LADhrBC3VcObXcynvpXJULaDGFvTSGplHjgmDW+TEmlKVRQ
	 2tyyasOsfVRwFBxTTav88lw4fARkWW7obuGmqd+ZXMXCqgDUOMcY+OVathhVzp6hZAjTqKqZnHPW
	 14P+87DYKbw8xD5xTDA/vqRsrX5AnyCh37RnTcaRVQL75pHe76/lK79rcxcaLVY2qFpUlDbvPrgP
	 eWImY5bNSZaiKsuvIglIVgaR9O9Cp5il0GBWmx+5SQd2wHSJfu+07Y59c/FSrT1QiAZ6k8z3Hcos
	 7EKs10ZOvXHhB8BD2Mqiwtx6e/WACgJ+PxuA6Wwx+51uX+WPJvwl/HXTt1dSBsVChhma/vFTg/Cg
	 MtibJS5w==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: sven@kernel.org
Cc: j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] iommu/dart: add missing put_device() call in apple_dart_of_xlate
Date: Sun, 13 Jul 2025 00:16:24 +0800
X-OQ-MSGID: <20250712161624.1850171-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_092144_638356_BD8AC540 
X-CRM114-Status: GOOD (  10.96  )
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

The apple_dart_of_xlate() function obtains a platform device reference
via of_find_device_by_node() but doesn't release it with put_device().
This patch adds proper device reference handling to prevent memory
leaks.

Fixes: 46d1fb072e76 ("iommu/dart: Add DART iommu driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/iommu/apple-dart.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 190f28d76615..811bf5176568 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -796,8 +796,10 @@ static int apple_dart_of_xlate(struct device *dev,
 
 	if (!cfg) {
 		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
-		if (!cfg)
+		if (!cfg)  {
+			put_device(&iommu_pdev->dev);
 			return -ENOMEM;
+		}
 		/* Will be ANDed with DART capabilities */
 		cfg->supports_bypass = true;
 	}
@@ -805,8 +807,10 @@ static int apple_dart_of_xlate(struct device *dev,
 
 	cfg_dart = cfg->stream_maps[0].dart;
 	if (cfg_dart) {
-		if (cfg_dart->pgsize != dart->pgsize)
+		if (cfg_dart->pgsize != dart->pgsize) {
+			put_device(&iommu_pdev->dev);
 			return -EINVAL;
+		}
 	}
 
 	cfg->supports_bypass &= dart->supports_bypass;
@@ -825,6 +829,8 @@ static int apple_dart_of_xlate(struct device *dev,
 		}
 	}
 
+
+	put_device(&iommu_pdev->dev);
 	return -EINVAL;
 }
 
-- 
2.39.5


