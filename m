Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C721ECD582A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPGLTAdLtUxXVPmc9GB5jPU14KHN83FRTbXX/sWRqhQ=; b=12+P6h5hvdoK6PkaH0PY2Qf468
	XoHE77/QYLtrb/s1utXCWVEbqWubH62SB2WcRohQjl4OsedhSCZu2FAtcK0OHpsCZKIIwiVELHIBJ
	FwfzHMU+oNh6HKCxQ4/3Qn2rzp62nYeIDE6PyVMYZunk7Bg6Qsg+osS+/Lfaj7FEAHB8wDZg033ZL
	M2AtuxWCAxQwBTmXpms9Zl/A6k03l+Ex9LeMT8egkZW8aeZzT+tVkCwrHwe5DAng7Vm82268TM6e8
	iWmhkrlGh0DJinZ1MxeyxACGPzv7jh85lGTJ6jWT+6XNTO1pGXM8YSCVA8OZVcyGyZfSzuHRUZbRG
	sM4D/6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQUh-0000000EetL-2amM;
	Wed, 07 Jan 2026 10:10:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQUd-0000000EeoC-21Wq;
	Wed, 07 Jan 2026 10:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767780617;
	bh=WA6auRFS5Bfnp0uakdsPfWC/OFowwBAKHJjwEBGZtZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jmpkTyQhF6IjrPhTHQY6R+1A52SAiMX/zCayQz6gJ8yYs+JLLbI3Hmmr/dVBHjbPU
	 4Fcl+R1uK6E/AJEF0MVvVxFfePQBEROGy7nR9SDExYt8eDywhiJFr81MeUMtP7aXrL
	 6qqmjA8Bw5posKOtWIjYbzdkmw9uINdiwgxFFWa6+rG5drID8kfTPHHodavUNkzYZE
	 0P443Wsc8p7/XPLp0NCc5ThRnxfQn8+rOytUGP4AHrRQIJsJzErUBlP2pnGF8KARAn
	 8j8nmIJSz6q1UodSfXJKTCqoIb3n2O4FZ23Qk0SVOgUSt6dJSCfh430R+R1/YMxRPo
	 i2GkzHveQkgrQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7e36:2305:d47f:6e43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7F2E17E35C6;
	Wed,  7 Jan 2026 11:10:16 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v11 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Wed,  7 Jan 2026 11:09:54 +0100
Message-ID: <20260107101005.84039-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_021019_670847_550C2213 
X-CRM114-Status: UNSURE (   8.39  )
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

Add maintainer for Verisilicon iommu driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648..baf09a3d60b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27315,6 +27315,14 @@ F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h
 F:	include/uapi/linux/media/v4l2-isp.h
 
+VERISILICON IOMMU DRIVER
+M:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
+L:	iommu@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
+F:	drivers/iommu/vsi-iommu.c
+F:	include/linux/vsi-iommu.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
-- 
2.43.0


