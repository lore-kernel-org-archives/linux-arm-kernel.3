Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D4CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7fXrZLvCRFmk9WpluWQQ1P1QYEFwV4WeL0Xbrr9+7Y=; b=dCmrkqNNpQCojI7k3xtNm3wMHE
	Mg4o4obSORfRxcP8V9E0IKwFOtemUESlLzbX8EdF4DMfbbsPztj09qzVAcX7Noqfl+jwK0lXgWtTl
	KyuOB2nI6mjcEmEBqCusW+Aw9Q5FljpDr9v2y+cBVDCbTpwqERb2fsryv8jchlQhtz9RkUe6CI/XU
	QAbRGnf1zvvY2/zqQjYcbVm7q520N+nY7c+I60pb3NoinWDgC38pIh/KCXTWs66Mxb0y79fbNkF9p
	cYyHPovsubYUFTShPr8ACYl4zD67KxDnFEaI1l7dJmH01JQW+p7acMoMCdo9GWLehBuiy83rI+eqi
	mtlX22Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBSW-0000000HWDj-1kcS;
	Mon, 31 Mar 2025 09:29:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBPV-0000000HVts-0CxF;
	Mon, 31 Mar 2025 09:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743413183;
	bh=V0QnODFma7S+d+i8t9LUBD0xftnJaXWgg/npE55QrOk=;
	h=From:Date:Subject:To:Cc:From;
	b=XjRCeMaGKoIibd5ArzvYY4UhDyCmc+Kj4graExuUIoRBv11nQU/oDhdlNiurBiXLI
	 Ycb7NLunmgbgTlsUuncORlnS2ugQVPl3s7SY0dbtFwaNVkAXNqEYDfUcnyKyOegEfl
	 F7e5e993KjP8p2/NEK4Ok8XXByFdKLfAU/KtkxniJOj4jWb4ZtLg4djBAnJPuC9R1c
	 isdY2zmd4Ti8UeAST1RR1WG/lKG6OY69eOgyLyJSysXLOR8yge1qQCe3JGmGSV/d8s
	 1DZcMJ/ibVOCN20YyDU694ylCyx169opo2NlicD8pelofnp+1c59b7iDDvhy82YXb9
	 1WGDAndx+MVEQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85D7917E07F3;
	Mon, 31 Mar 2025 11:26:22 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 31 Mar 2025 11:25:52 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJ9f6mcC/yWNwQrDIBBEf0X23AU1DSn5lZJDNNt0KWqrmxII+
 fdKPb5hZt4BhTJTgVEdkOnLhVOsYC4K/HOOKyEvlcFq2+vO3jDIC1eKnLA3Gget8cE7OsGFhLz
 UOdrBGO+8c5auUI/emWrnL7lPjTN9tuqSFoKbC6FPIbCMKtIu2Hydgek8f9JfStGlAAAA
X-Change-ID: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743413182; l=1967;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=V0QnODFma7S+d+i8t9LUBD0xftnJaXWgg/npE55QrOk=;
 b=8e0zsYdWGNiu/yvRlNY1uOiQBoNeYQPzIvLrdLdob0CYYVrRaPu9O2HT1NPa0DBmndQ9/SS0J
 5ne4ZxT0a/8DLY94DhWT3DqJ4Soll0EGLzeupDpS88N3h2aAvP3IozF
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_022625_242179_E2E3756A 
X-CRM114-Status: GOOD (  14.83  )
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

On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
one but has two ports: one is routed to the M.2 slot, the other is on
the RPi header who does support full OTG.
Since Mediatek Genio 700-EVK USB support was added, dual role mode
property is set to otg for ssusb2. This config prevents the M.2
Wifi/Bluetooth module, present on those boards and exposing Bluetooth
as an USB device to be properly detected at startup, so configure for
the ssusb2 dr_mode property as host instead.

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
I've tested this patch on Mediatek Genio 510-EVK board with a kernel
based on linux-next (tag: next-20250331).
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
 };
 
 &ssusb2 {
-	dr_mode = "otg";
+	/*
+	 * the ssusb2 controller is one but we got two ports : one is routed
+	 * to the M.2 slot, the other is on the RPi header who does support
+	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
+	 * USB line goes obviously dead if switching to gadget mode.
+	 */
+	dr_mode = "host";
 	maximum-speed = "high-speed";
 	usb-role-switch;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;

---
base-commit: 1c4df70331c0dc7f82f724166575c16931ec66b3
change-id: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


