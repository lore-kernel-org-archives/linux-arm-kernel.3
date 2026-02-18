Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0209E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uoQVBxJ3BbS2KybUO7O3FILsEEJ+ro5f2F6+ScA4U4=; b=MFctZ/rAWw4KaxNU0O8vN34rAs
	PUv94ASO7itgvqcms8t2HaM36KkNR0bKk/AcsvaqWRu/NjPvt0ajPMoO9or6T1Zrv/3oBdYZD+v89
	GW3wvFqzc00fwiXdndv9qddXXaqYp7UNBRCs+ayAvwroY9PXQEhJbscRn9wvpNA4o7vg/z6SCLd06
	ScIvN+otw1lgJDXCXhN+jKj6pX7RVWe1xJNWBkSfBKW+s1sHhaSKaMO8E+lsh6njn1aDtMb9AsSSz
	i64osL+yDNCt/kX5TSCV+R0g7rjWRrqRNDHwL9nEi3jO+ZT6EpZ6s1RvhvGno180Uuhlq3nafB3eF
	eELaaF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmj-00000009XIA-13xj;
	Wed, 18 Feb 2026 09:23:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmf-00000009XGW-40x9;
	Wed, 18 Feb 2026 09:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771406626;
	bh=TgZ+DLlkvLfG/Wfxf7z4TGRSZUBz59EnjarV2GXABeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T6TesFBgmbUrvso6N2iOElT4oWluAXQOvDR0ZTUSHIUQYZcj+rj/iP3j3tWnKtPst
	 /dCTBe5HanA04bbDQHInRQwTv94i+r5f7rokILjGgeSF5k8TJDkx4A/7dADlg3Lfys
	 5RiyKalaJZs7xKGsHP1quNA5ic5KUJ9Cvc0yUE9qv2IDfCq2RZz+Prb+gRkZ0LUbjR
	 EK7dBOYOtnz2QcRVeCXTktBDk0fum1dk5Y1Dex1RPvqXaiinvAps13IrP0wbuR21Fe
	 8U4Q5dedO75uW4ZXGvfwiRCXp6lwkNmt+kHWPdtmX3aZoHwRKAGxwaujw26ZYPYrk6
	 PJCn9OHCZaXDw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1616617E1301;
	Wed, 18 Feb 2026 10:23:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 18 Feb 2026 10:23:02 +0100
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8395-genio-common: add mmc
 aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-mtk-genio-mmc-aliases-v1-1-e218e9f771c5@collabora.com>
References: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
In-Reply-To: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771406625; l=935;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=TgZ+DLlkvLfG/Wfxf7z4TGRSZUBz59EnjarV2GXABeA=;
 b=kcFqSvWw1W77FScjAqh+wdOWdReQD8Y4we7M3J6IUP3SdpJn0FyJ/X9PBpMdsh1IDeLR6jK0D
 Wy6ADJrF+zGAfpa1sHMWjI39Ea1GUmz8/Zfi+JkjjbmhL55S53X8tEm
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_012350_181753_E98ACAC6 
X-CRM114-Status: GOOD (  10.43  )
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

Add aliases for mmc nodes, so that the eMMC and SDCard host controllers
get enumerated in a consistent order for the Mediatek Genio 1200-EVK
board.
Also, reorder serial0 so all aliases are sorted alphanumerically.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index d849af4d36134df6a7b9f7967efd0db13c372d7a..62c336e215009e03cf9aef9aa099228aba5918cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -18,8 +18,10 @@
 
 / {
 	aliases {
-		serial0 = &uart0;
 		ethernet0 = &eth;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
 	};
 
 	chosen {

-- 
2.53.0


