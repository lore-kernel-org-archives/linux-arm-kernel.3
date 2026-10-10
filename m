Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DF1CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sk2ivrLQi5NtsGavnRBGVN+4kbbD0Snm+DscMMG5MBY=; b=gCsHqdXukRHF688+p2ndSf6YFX
	qjPNw16b+/WmEyyKOmL5j6VkaFOy1hFSRqqzb4fcbFHgCcvnvjts0m5DH6wrcd5aC2oRjhdTm3qaq
	ERLMujuFR4G20aAS6DdpUD2zStkeD2uYpQUQzds8/+bQeptiXYdYE8SRmEyg6oYhPDRMcbaeZ1Jtk
	M1vCp98X0JABurms7HG7+tJt55tdAZXjiqchvIC0D4l7gQLvR5YwZu6GTqCv56Aw2WK9tUdUs7dRO
	m3ptyAgt9xXA0TSCEgbSzr65AT/v83CzmE1T4wduburdhyVCZVFjWO7u5MYU5wMr5JbSZC8oSfgpY
	qWJ0gojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFez1-00000008T2i-0vJj;
	Sat, 10 Oct 2026 21:51:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFez0-00000008T2Z-1oRz;
	Sat, 10 Oct 2026 21:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97FE741942;
	Sat, 10 Oct 2026 21:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C34DC2BCB9;
	Sat, 10 Oct 2026 21:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791669117;
	bh=FxeeGnUnF2T3tAbw1CVrJPxzZ/AfexZI161cKG8bLAk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VdenR65rsLe+ESlFBzGy3CFc6IdcWhr97l23ZZ1YEPC6kb2+4c0gtJsS0CFCsgvjk
	 yvmKTN32M3uBi+vE1L3f99hwe0q18KSQVnSpS24g3gMV/pqrxEPuoWk3GXOMn1ETDX
	 BZKxeNiJH+SrgEQmlF9KspQiL9z8GPixlI0BEg556GBa+i3aNMJ/qH6O1HqA0H2T5e
	 1C17Ae4UhKv8ACq9JMUxfY5oQ0IOzgFfueYFhKkEhOHSpf05yx4T4naGHhll8Bsfvs
	 gln+2sFrCdRcd+/ztVbASE2Yw1jVKHJIJurq0mp6tOHNk93zMw4HlOHg8J+2N/4OeA
	 YHbzZr+JkNjTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E1ECA9ECA;
	Sat, 10 Oct 2026 21:51:57 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 11 Oct 2026 00:51:50 +0300
Subject: [PATCH] arm64: dts: rockchip: Enable USB host0 on Kobol Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-b4-helios64-usb-host0-v1-1-693fe316701b@iav.lv>
X-B4-Tracking: v=1; b=H4sIAHWzymoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ND3SQT3YzUnMz8YjMT3dLiJN2M/OISA10TgyTjpORkC1NDQ3MloN6
 CotS0zAqwudGxtbUAu+CJwmcAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=sOQzi5FpUnQRY9CzfpIrcgu8d6QPkrlieETtWvyjiVY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmnNpf/zlN1581VmqNuLyprdcWlMpZj80sDU8ZykT6+D
 RcWO0h2lLIwiHExyIopskw4pHErY8nVv/4e5g9g5rAygQxh4OIUgInwczEybH/0/9C+3PN1zzZI
 LUzmOJf4997RfcUb2KbPe/G8KPL1KkFGhvM7tePOGvs3n8i02n5VSWP2g1/RBw1qf11NXiIj8PP
 WW0YA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

USB host0 of the RK3399 (USB0_DP/DN) is wired to the USB 2.0 pins of
the M.2 Key-B slot J2. Enable the host port of u2phy0 and the EHCI and
OHCI controllers behind it.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheet 33:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on mainline: the EHCI and OHCI root hubs come up. The M.2 slot
is empty here, so no device was attached.
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..ae887806f21d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -639,6 +639,15 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+
+	host-port {
+		/* phy for &usb_host0_ehci and &usb_host0_ohci, M.2 slot */
+		status = "okay";
+	};
+};
+
 &u2phy1 {
 	status = "okay";
 
@@ -653,6 +662,14 @@ &uart2 {
 	status = "okay";
 };
 
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
 &usbdrd3_1 {
 	status = "okay";
 

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261011-b4-helios64-usb-host0-40b3bcc85117

Best regards,
-- 
Igor Velkov <iav@iav.lv>



