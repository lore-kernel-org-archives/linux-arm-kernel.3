Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C340EFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ot9nm/pABtLTPSGzXe0swiSAfOvabkyS/b+zLNGI4wM=; b=yFGa9k30fV0ed9BgynyQNOz0QP
	5LTwUSnhcQT2uaMR4uy5cNVWmIstUBBBKxbCzO1elI4aLkvNk0Ga/e0repEPa0uqgyMaa+fZlxkak
	1SiHl4VQTgFwCBxfjuhIgJyHlLriME4jwH0VtdXdPNOu5/y9CBKAOgVDlrhMIhL/Lvq1QSqv+ZtrC
	+0pM1Zw+ADLTwR1/Ykkqd0G/l24UN1sKOgkl+qiqdZs9tiDKB7Ius21NtoLVsR5xDb7dCj2U8QCIL
	/2xvidMaHlIEL5oWGDtd6Jc2QHrsVN9R6wuF93JDUxNGHEl53MSBvf+8i9QR89Rs2UpJoIEjMLXXI
	T/kjN1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCk-00000000wW8-48g0;
	Tue, 28 Apr 2026 08:54:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCX-00000000wGa-0vtY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:54:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7758D4E42B5F;
	Tue, 28 Apr 2026 08:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 480C6601D0;
	Tue, 28 Apr 2026 08:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAC41107284E5;
	Tue, 28 Apr 2026 10:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777366429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ot9nm/pABtLTPSGzXe0swiSAfOvabkyS/b+zLNGI4wM=;
	b=hMmHvkOpAARovz4G6rVIkwrisOvaml+RgESItu+Mu9YZE8vZ+hqc/1/L3Tod43SgmQn1uL
	hz/RPLq28++lpLFTfigtI0YvwSO5R7pUIKVwYWUNgUKdqp+qI8SX2qFbBj/S7nU0op/nIg
	4cRaL0xVcT7HHUJNJhgr4UeJvravpS57n8/bThh+AHro2KYpcDsG7mIheGsJ6K4A4V0uLu
	YmJIuRSmrWynkWfvx73P19M8nuupJvmOo1TzU8pdRRlhFsG0RZ8CL/BmMTwczFJJZmcfg0
	5EgWOws940xEht6Pmfh7rtzI1zxTlf8TZyelxAX2ZrYwf02AcwzOZNGJUucDfA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Tue, 28 Apr 2026 10:53:41 +0200
Subject: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJR18GkC/x2NwQrCMBAFf6Xs2QfpNhr0V8RDErd2lTQhERFK/
 93gcRiY2ahJVWl0GTaq8tGmee0wHgaKi18fAr13JjZ8MpYdXhOejsfGaDkh5PwuC0oVVJ9Qkkb
 YCGftHM4mmKOfqKe6n/X731xv+/4DqU5SFXYAAAA=
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
X-CRM114-CacheID: sfid-20260428_015353_456900_A6A37DBF 
X-CRM114-Status: UNSURE (   7.09  )
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

On j721s2, pmic@4c is needed to exit the DDR from retention after
suspend-to-ram. Add bootph-pre-ram property to make pmic@4c available to
the bootloader in the phase that sets up the DDR.

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
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


