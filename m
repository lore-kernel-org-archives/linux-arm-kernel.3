Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9223AD65533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+FEXwLB6//geiqjFNY1WyB2SjNLASYZoSGVYSlhPrE=; b=44TeMlacgqGHZVsQz/6Ara4khz
	w2//7GnkjnUuPUwILGr5Z/nHxadm8YDkC0Pp/hIVSMlfDDseGP+Dk2pUXwE7FHYyMOGsUd7wkCqNe
	tnCDFScfPsYqDQ/nFhDHdMpi/XDwYr5UKtGN992PQiaNembO2SNNVO61cBvxj8ud1k+mQAB2q9Mob
	3DTPYORxHrTx04Fnh+p2W56fcrII4rTbwCxd8gEHoswBISHzrx4+G1KYxEMxB6Y90/86seZecQmTl
	5GvFF0RMYzyY1kJTuOJ4hih6hkuGZhpV54Ryna3xef7mfXcAU1ddkdg0o3z3Pj64Je2aNsYPjSMbd
	5k+KiZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVody-00000006c1h-2yAY;
	Wed, 17 Dec 2025 10:20:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodJ-00000006bIe-2DsA;
	Wed, 17 Dec 2025 10:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966787;
	bh=egAszwG9tB/q++tDA1sT9mHPYlbOp6SzpoQMWzWwofQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hI0Okw5M8NBDptDjoVZWfelX4zUbpANDRgk5E8CtCepAf3hrvyDUMTg2MbfX9cxlL
	 aCwmEh2AX+qWiGnu1Sl7pZjbDMgzd9o609wA0VFqv+6mf1J37aeF5Rx0GBuP6hM1dA
	 3juuwu8NWQI/L7QmR4HrEvfA3TnUa4cHyWtid5zi/c7pK89ufSNsa9VptPvlV7vSty
	 KHw0GjbVKIQAUzYi2IQ+ZFzi13SYZA6o2yd7ZZeOuSN3QVg0KjV3bWms8w1rMdHsFN
	 8WdN/WnMZaWrR1tB5aPMzq5KC6k7yUbZzY4L0IRlARVr3ialCWyK1KkU5kjqaXPATV
	 kazRVD5JAP8pw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7964117E1154;
	Wed, 17 Dec 2025 11:19:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:11 +0100
Subject: [PATCH v2 12/12] arm64: defconfig: Enable Mediatek HDMIv2 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-12-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=792;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=egAszwG9tB/q++tDA1sT9mHPYlbOp6SzpoQMWzWwofQ=;
 b=7gtSv9z3v5G4gNkpdsay8zynkZN/QfDiWjrlhe9hMdCxd9fpyIgQPWM1Vwta1QWUBOilZO4oq
 jLMwG5Kbcb+BsTz9s2twbj9FZdOx4XQILA1pZLQPeVWLQXJjfOJ12Us
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021949_752792_69233528 
X-CRM114-Status: UNSURE (   7.57  )
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
index 982b894a36d29ebbdda025a3ae9713ddfd7195d8..975297e8c01a28fe4fd90185635d654e970ae83c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1016,6 +1016,7 @@ CONFIG_DRM_HISI_KIRIN=m
 CONFIG_DRM_MEDIATEK=m
 CONFIG_DRM_MEDIATEK_DP=m
 CONFIG_DRM_MEDIATEK_HDMI=m
+CONFIG_DRM_MEDIATEK_HDMI_V2=m
 CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_MESON=m

-- 
2.52.0


