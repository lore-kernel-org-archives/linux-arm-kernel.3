Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40195D3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/WVDIAKmr+NSH65p84a1hhZrM9EjkKg+B/gxnk7sYE=; b=sChcV5hKljzQNhLQzBTKmqPL1I
	lOctP1U7EFbvBBEQdxFDnQKWaTytWGkq8jx40eoJ5jqYI1kA4uDB+StK3wvsIX1iswz6JbF79gLoQ
	sygPfga3n+bgd70CCb9cCboKWvJpOJeUG9gNqxth9Z/0juSwDiWTwPRNlaf1k9Jr4Jagz6rtK265Y
	/Bwgc8Bd0S3wHZ4DKxN4agIGy1h14OgHgDC5lWqWjDZIy1V/dNDrOnYC4pnQikhYOR6JndvM4NRdF
	VcHOlsZKxaNRLh3J4B0M5to8ygdyRQYm3bhahvX53xLE2gfikINc2jOnMFfCtzER3rQYOTiqzoe5f
	phxdz1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0gF-0000000EX9N-2Gdl;
	Tue, 09 Dec 2025 16:35:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fx-0000000EWfY-3840;
	Tue, 09 Dec 2025 16:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298095;
	bh=KcsnWznaCJU8MOVAN1wmTGeLu//ZGdwoIZ+6tcgUhIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y5jvpwnGObyceyDShDTX7w66eOP8zN97wJsEr60gjKcgeyTB0/gAW1RfFxzvEtAXQ
	 jOh0Affa3ZBBamJKOvASGwD8VmWVnECKUBa29lX9gr+1LepbPAuvpLvQ1Si0i0TYSZ
	 MOV7CcrtyJWGSd2vT5D60D3cpG56jgvZkegFOfdIcScPTpQXdGH9tzOFQHZXN1yllu
	 sVgQs6wXYSi2HdGO9Tu+PzQSDVTE1qxH1PGCtTbEuE/S6qa5agejIPkATvp6xy8y6R
	 ShzKndAMD7ZttSN94Ay9Q7iGtcf3pD7UjM0NuqjH1jngLfcWF9FSlpBRNOidizlhwj
	 lp4AA05EgzcUw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8ABCC17E1541;
	Tue,  9 Dec 2025 17:34:54 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:42 +0100
Subject: [PATCH 12/12] arm64: defconfig: Enable Mediatek HDMIv2 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-12-9a6106effba6@collabora.com>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=792;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=KcsnWznaCJU8MOVAN1wmTGeLu//ZGdwoIZ+6tcgUhIE=;
 b=oIVEXIknM/gDRvQKglYE1HyEGdUXUQRTBpy8aFDzYu1FlRQMCNRqtRtxbE9YHNCd3Ymc1Zzlv
 ssH9z75vXp6A8Uyh+ccCpIk/d3bMbAiFpgyordgKieCT3sakZxys0xo
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083458_019682_20FDC4EC 
X-CRM114-Status: UNSURE (   7.69  )
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

In order to enable the HDMI output support on Mediatek Genio 510-EVK,
700-EVK, and 1200-EVK boards, enable the driver for it in the default
configuration.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cdb7d69e3b248975557e141481a88fd86115cf40..24c1670e5bfd4ed0902d5440d43fdb4e5dd676f1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1015,6 +1015,7 @@ CONFIG_DRM_HISI_KIRIN=m
 CONFIG_DRM_MEDIATEK=m
 CONFIG_DRM_MEDIATEK_DP=m
 CONFIG_DRM_MEDIATEK_HDMI=m
+CONFIG_DRM_MEDIATEK_HDMI_V2=m
 CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_MESON=m

-- 
2.52.0


