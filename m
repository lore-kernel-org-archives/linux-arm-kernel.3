Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22758C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=copIDOk9MPWo/ov98Kor/uunS41vMva72FnQRKJ6hn0=; b=i62Kku/sS8ru7iIbyDWGBK41aj
	cy8nAvTJE2IrcGQZFYjK7V3AiujmMx7kpVO87tzgfFgzHTAJFTGBBtu7UcOxfltq2IAhou92IUwM2
	Go3415dRRSljWD95UzGZ7Z/GWa6+/Gb0Azv6DmhfMKuG5Q83EyBA3Ez6OQbHamr9P31ibRgK615yr
	o8UdIA9YStVvn0B+XrX2kj87qNeTSKwp0vAf7Nahg2CbAadCYdxtxr4zxz/ZpwC0iPL1GY5xHS3Vd
	kdt1zN2VZVVeirVplRosIbDdJFEaYg63i72CD9pQIAt1OwMGp6heGinotu/Q4geHphuQCCmu91SrE
	tPCS8u2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAo86-0000000GJlp-0mJD;
	Sun, 27 Sep 2026 12:37:18 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAo7u-0000000GJgW-2ZE4;
	Sun, 27 Sep 2026 12:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=copIDOk9MPWo/ov
	98Kor/uunS41vMva72FnQRKJ6hn0=; b=aE29hHC5gz8S6ghSp3XCSwSTHiznpde
	i5w4eYoZRSE5vhjgnMiaAEcH/HSzG5T2N7RhRbKCJO4McWZ+hlsHiLv+9dEZc9yQ
	mC5gIYzugCotRXtG3tEKFkNFCbW/WN85xG0JVo9DDCcmQGmseOZsyp1EDjw2hHiW
	audXVx07DvaE=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
Date: Sun, 27 Sep 2026 20:37:03 +0800
Message-ID: <179051262312.4055.11698105707712320261@163.com>
In-Reply-To: <179051260955.4055.15953866975694461812@163.com>
References: <179051260955.4055.15953866975694461812@163.com>
X-CM-TRANSID: _____wD39xzvDblqvR2yBA--.43291S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry3CF48Cw47ur1xCr1xXwb_yoW3ArXEk3
	WxuF15uFWrXFyFgw4rAFs7WFyqvw42krZ3AF1UAF1kA3yvkrs3KFZ5t342ya4xWr43urn3
	CFn5tryxWFnxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjp6zUUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3g+H9Gq5De98IwAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_053706_956757_92102FB8 
X-CRM114-Status: UNSURE (   4.09  )
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

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.

Signed-off-by: BG9OXA <bg9oxa@163.com>
---
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board
-- 
2.43.0


