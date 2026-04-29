Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB4FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umQT6FTIxdphMXQFtg30XzGrHeATYZt4GaKs6EI1if0=; b=RE4/M22txijwCSDKTEL4yt6e1X
	U6GqIqynRvB9dMjTstkxNRGYAxRgcjG+/Qy4YCHv35WUVOidi86aYkFncAc1O6I8ECwQ+7UJbEfsX
	bqY5Sxfw/UQzIs5eZYhU5rYX7IoO8mH/CwR/Z7j3Fs9014+CAmvSQwKiTkLGYg2/lkRJgOnuGX1vk
	Avj5m5PJtbAanzSbXBSJOrcQQzjWuYDUFFAuDxqszvI3ejTP0RyhvTmutLbQZJe3YUw0L+hdJpvie
	z4m1p0qnpdxhpDfjVXtggKHSksyCFXyou2DdNKTEQuA1MZ5EO9lPrxwmg6XeTVaHxlYSkX4Vqf+qP
	CsQWKvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3tf-00000003ZFs-2peA;
	Wed, 29 Apr 2026 12:20:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3td-00000003ZFI-09o5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 12:20:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B5CC4E42AF1;
	Wed, 29 Apr 2026 12:20:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBD91601DF;
	Wed, 29 Apr 2026 12:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FB0D10729CA0;
	Wed, 29 Apr 2026 14:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777465196; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=umQT6FTIxdphMXQFtg30XzGrHeATYZt4GaKs6EI1if0=;
	b=RuSqv6yooHTYsSxzqrh948SqOEAAXaTjq7OnNfTwRCzdoLojlF9G8BB7mxdXSyWngxl8RL
	jdt6qbQhvc6wuIdXMlggk/5fQo9nPN7ArhGm17U4wdARqT9oOifrKhwMFkFk0pcIYqU0vl
	OrAjV2Nl6jvxNUeSTFtAXjhOG5oRohqGLKuzq+7Vxax4eshVcaSqC8UQV4NHYW6FuOeqJ5
	GlFRnNpqdVL82/AhbTwLhTy962QUXcTpMgk/0jgSKi1BvbQVyoSRyUcqo7UFc6zt4HaPPA
	rxBTxfzvQUYPM/1UaPYsv9Dq5kzNepIhRiLLzvikzEy7walibapPOCbhX0YrKA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 29 Apr 2026 14:19:48 +0200
Subject: [PATCH v2] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to PMIC-B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-j721s2-som-bootph-pre-ram-pmic-4c-v2-1-31a0e7677216@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGP38WkC/42NQQ6CMBBFr0Jm7Zi2FAFX3sOwKHWQUUtJS4iGc
 HcLiXuX78//8xaIFJginLMFAs0c2Q8J1CED25vhTsi3xKCEOgmtSnzm+CiVjAqjd9h6P409joE
 wGIejY4vaYql119aiFYXJIb1K947fu+baJO45Tj58dusst/QnqP4TzBIlUpVGluqiMOKyFV88H
 K130Kzr+gWoaCUs2gAAAA==
X-Change-ID: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 richard.genoud@bootlin.com, u-kumar1@ti.com, a-kumar2@ti.com, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_052005_240824_0323A28B 
X-CRM114-Status: UNSURE (   9.18  )
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

On j721s2, PMIC-B is needed to exit the DDR from retention after
suspend-to-ram. Add bootph-pre-ram property to make PMIC-B available to
the bootloader in the phase that sets up the DDR.

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
For the v2 I just updated the commit title and message to use PMIC-B
instead of pmic@4c.
---
Changes in v2:
- replace pmic@4c by PMIC-B in commit message.
- Link to v1: https://lore.kernel.org/r/20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 12a38dd1514b..a19e535f4946 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -250,6 +250,7 @@ buckb1: buck1 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+				bootph-pre-ram;
 			};
 
 			buckb2: buck2 {

---
base-commit: 59b04cb2325c07ddc1cc7d984bd8c8f89f161746
change-id: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>


