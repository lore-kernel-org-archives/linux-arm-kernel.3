Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7516C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V5Rhzl+UaSq7NkWq0KZryRLkoi/5M8dAQSxp5ngWDmI=; b=Qrh2kqqqJ9GtC/KcQ4LMrU/uJf
	NfDVWMbbdKLHWvX+HI38e0jPa7GRMTfNaR2aBcsf5S+L3SdSX9fwAYgVQsMpSsmumOE6eHovgG66i
	q6QroM6SAHPkYEtWYrIxchW3QNwvFK33lhbwuiK+4q6bul2KSAXOD7azoimFguPlY5Uqlq3/vhfeo
	/Dhdk3/UjFkEpHmd9ca+/UESXsBA+ym1+kttle91loVt39dMUdOGZtsXce0EzmwXi2j1sn95AOq1r
	X8lu986Ls+RaH7k3fe7GY7na+ChN4OZS8fYVsrnW3F6shud2CCKmvTq3dJd0Vs9d//+IUgUlwQKvl
	+s141BvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FZ4-00000005LUd-2Byy;
	Tue, 08 Apr 2025 20:28:58 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FXH-00000005LH2-48bs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:27:09 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CDED01F9EA;
	Tue,  8 Apr 2025 22:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144023;
	bh=V5Rhzl+UaSq7NkWq0KZryRLkoi/5M8dAQSxp5ngWDmI=; h=From:To:Subject;
	b=cTpjVuaWekEYhcb7/2HVXTC8QJpR2hXnQ3HLHRKFHoYwAhlF2TKWCiPZE+A5xLJNn
	 Xl0xZxbLpKrgPLKJHEXDXTNkVfq3rFgLnqK2wqNu1vsDnN9B9WcHfHov7P5pGAMhlA
	 hTfnlxKj17+XG7tD4ybZCx6UhsAhSbyUibGrEgWTCO/2YTXcRzRYUf+Qtx6DbMjQgM
	 zQ4LipkNXDuoIxTcBXyEnkv3ZkA/XTc3llUx2FthTbghqiV6kUL4usvWn9t2hMUGXi
	 ZOXu5idauxq/vFSSeYeGYW6zeFMmExnbatSnGO39uQljyFk/o/HRz8aiSkhEl7/yDc
	 UVB5KfOMXcl9g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am625-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:26:55 +0200
Message-Id: <20250408202655.6329-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_132708_215111_95E096B4 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

According to the AT24 EEPROM bindings the compatible string should
contain first the actual manufacturer, and second the corresponding
atmel model.

Add the atmel compatible fallback accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
index fcc4cb2e9389..2b5f5e50b578 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
@@ -114,7 +114,7 @@ sensor@4f {
 
 	/* EEPROM */
 	eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x57>;
 		pagesize = <16>;
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi
index 7372d392ec8a..9a2483cf5d70 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi
@@ -118,7 +118,7 @@ sensor@4f {
 
 	/* EEPROM */
 	eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x57>;
 		pagesize = <16>;
 	};
-- 
2.39.5


