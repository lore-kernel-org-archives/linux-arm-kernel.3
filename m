Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE727C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRsV/Mmf4uLraDXUNpqoepJhEX/1ILD1zeqCVLUgR5k=; b=nMxYNb6BWCgQ28Zs85MCoSSbI2
	YlxBwB4cg+pR37U4W5jREz9X0xRP7Nlaw7QSdMFpYtpdMCSvfMB+IJfwKoPwbmyUR95PJ3PBr9YOC
	T5dR28aus2BOLYf6u/pNan+toVrwQdnIR/0sSAgm4h81SkzyXIMoVZBkcDkVpPKVpa1PsEc3pV8cI
	Osd4zh895n3wIg7c9ID2wB0DRv039/295x4DGAM+ILfuyj1UEIEkwzxyY6IBDVDj9deNpLg4wV3qW
	au3BoIbSbVK5TZ+6vWQZCajiam9XnFhodTOBwDNC9I1gNiWwJ/zo7QqVoOtbLlRjYkgxXU2Kawrzn
	M5/QuYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYpR-00000000lgd-2kma;
	Thu, 15 May 2025 13:40:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYgg-00000000jui-2sQH;
	Thu, 15 May 2025 13:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315909;
	bh=8VVU8NVRnTpjcLWUjqNAgSssaH4toawfwMWnPXvh4zU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n1iegtnaJRMXTSutf212UUiX+v9k41CzAhn8UMiV+FHxiMozVyEhPasaFgmbDOXsf
	 9ydE7VuFRNJi1ESO2sIOqYlgRl6+8RTzkX7XfldCKOjiPq8ZO8ZTn4iAgr7+oPxzOX
	 zve5KuPj+UOEp8gvbWnf54YcCdK5jTUDlOb8nhAHzQwGy6WbfwE7kxUWkQMtWVbXHj
	 tNYd9woATMW8GSRsV+4FioHg9JzBhxemu9srWBt+VZtAFVGF7n74y6g4kOdskW6c4y
	 WK6uxnrAqQdS8joyiXWnp492ZS2TqCL18WnJ6prwN+6S6VD688b5mYZQHXxkBPHyaZ
	 1CbpZrR9RTRTg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77B4017E00F0;
	Thu, 15 May 2025 15:31:48 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 15 May 2025 15:31:45 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188: gce: add missing
 'clock-names'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
In-Reply-To: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_063150_870295_66588449 
X-CRM114-Status: UNSURE (   8.67  )
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

The 'clock-names' property is required by the dt binding.

Fix the following dtb-check error:
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

Fixes: 45682a4fffdd ("arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index dec6ce3e94e92c8e1e2c3680cb3584394d9058bd..d5892ca35bc29f830d7894ba592aca3f58dc3bdc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1372,6 +1372,7 @@ gce0: mailbox@10320000 {
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
 			#mbox-cells = <2>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+			clock-names = "gce";
 		};
 
 		gce1: mailbox@10330000 {
@@ -1380,6 +1381,7 @@ gce1: mailbox@10330000 {
 			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
 			#mbox-cells = <2>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+			clock-names = "gce";
 		};
 
 		scp_cluster: scp@10720000 {

-- 
2.49.0


