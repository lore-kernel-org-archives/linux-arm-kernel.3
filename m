Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381D6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TK5vzJweSgW33JTnaPCG/BD4PbLJ7pkFD4LK297UYbM=; b=1K5+MGMHqBOiWNwIVietH/iHm5
	yXpTsBi+6/kVqVv5R/wK0LqnobbJCv/MBKY5OpJ7UQDeRmNBYvaudcaM4r7BgWDmyK54rdVoyuStR
	gLm0cWrWQ9ZZdJywigeTOI/buSWp2Z7uEyHOmcQI895LsRvZZOkA/KiQONxVaZlT6S+7e5HSa1Cvz
	RSV7QQ+QzADivCJM453emXBFMKI8cdOQzyFOL1fz+gXJUBXudhNJ7rQmyOTRMol9oRPEnV9KmLWTK
	55XqoBBEBIu1OoX1N5TqwKbDV3+cVFlWbaQFQfKNbuDS09r8e5ULjBolMlzUnK+FCRwybXMLwI9aV
	U6OdvdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOlp-00000004n3L-0fXr;
	Fri, 21 Feb 2025 08:52:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOk0-00000004mTl-02Y2;
	Fri, 21 Feb 2025 08:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740127834;
	bh=kAmfHxvkLgWR7k83UqfnKWY4sjAmD73vzTZvLCcH7uk=;
	h=From:Date:Subject:To:Cc:From;
	b=DaeFTekZoGfEbfMsEmBjPUJb9hcbPpHtowUG65h3wbXAiKimBIoQO03IT7OhsNFG2
	 pJzxCvCbnhl4dy7/EGUi9KYz4Y0UrQMMkdeobuyc4UUEFE0iS1Yv4/fw3EYr2BOrOp
	 tTlfdkGcaSvhJzj7AO8IS6B+9lphoU1spy2jfjha4sMwTWOPLLxZWZrXKiXYuc2iqR
	 W/JRn8uMRdyMAMINLdBA9CAO9tpaSjezK0T9hYXlybfBtgdZpG3evA91oxIoAhyCEH
	 WO7CcsaaX3s9FKn1gI/fKNHtjtRQwmtd5pIOBk3egeZbAnf9YOSKIJBbJQVjvINAiu
	 lyBrcMTBNaVUg==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95D6817E09C0;
	Fri, 21 Feb 2025 09:50:33 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 21 Feb 2025 09:49:52 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix duplicated
 regulator name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-fix-mtk8390-genio-common-dup-regulator-name-v1-1-92f7b9f7a414@collabora.com>
X-B4-Tracking: v=1; b=H4sIAC8+uGcC/zWNQQ6CMBREr0L+2p/UqkG4imFRYMAfbYttMSSEu
 9tAXL5J5r2VIoIgUl2sFPCVKN5lOJ8K6p7GjWDpM5NW+qa0VjzIwja97pdK8QgnnjtvrXfczxM
 HjPPbJB/YGQs2qr0OKFEqVJSNU0C+77VHc3DAZ87RdIzUmohdKKkuHJbE/zA12/YDjFHiva4AA
 AA=
X-Change-ID: 20250220-fix-mtk8390-genio-common-dup-regulator-name-a0b4fe7e70e9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740127833; l=1267;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=kAmfHxvkLgWR7k83UqfnKWY4sjAmD73vzTZvLCcH7uk=;
 b=wzn19VohCl90bGUdg4UQ1oIyYlM5PwUBAb5LDiLwlAbpmH9TnJvIQOtiV3Ton8dFgAR/58mNV
 253Axf747UuCgLwhypEmgukFtH9uxklEZOBVvTHsv/7lf08qVan9/6R
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_005036_217876_3EFD78CB 
X-CRM114-Status: GOOD (  10.39  )
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

usb_p2_vbus regulator has the same regulator-name property value as
sdio_fixed_3v3, so change it to avoid this.

Fixes: a4fd1943bf9b ("arm64: dts: mediatek: mt8390-genio-700-evk: update regulator names")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a37cf102a6e928440cc88e7e8fe0225fc28ec962..e828864433a6f4195944ff67bb7bb4808d1fd262 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -213,7 +213,7 @@ usb_p1_vbus: regulator-8 {
 	/* used by ssusb2 */
 	usb_p2_vbus: regulator-9 {
 		compatible = "regulator-fixed";
-		regulator-name = "wifi_3v3";
+		regulator-name = "vbus_p2";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;

---
base-commit: 964b0ceed00032fa0fa841fd61e5f315880a2d36
change-id: 20250220-fix-mtk8390-genio-common-dup-regulator-name-a0b4fe7e70e9

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


