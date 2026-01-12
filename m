Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D861D25050
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QBSIQiFn1pJ8WxGR+6gHaHWmEyf1wSX1ElHds5zTP8w=; b=AZuZDoDFs39sVD5vAKKZfXOd0Y
	jxL3vSDW38liIV4dL7wJe/EHPCkNtx3zZh3gKGCKXpLVcaBHHc0zrHNzVudO/8+L/pSTKT2kzw0su
	NrKuU7myu7e8jH39qdNUpOou0yCINLp8+NgFVSDEl+gMbdIc+ra64ilpIEtwdD09LkNFp1yM7GGHw
	eG99FisJ5VTa8ZWdy1bMTVQZX6+LaX3WRAOi75XUjOt1V6trFCc9sxdbZSa2ufrO6X3pCdLcPWKNN
	OViUm9BwRrEFPUeNl5IPBxNxwq5MzfbD7NGrEPsjxRE8hMjDqSdcNl5/t8jyxMJ/we2J5wVcOzWYv
	hpOZZZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDiU-0000000523L-0io2;
	Mon, 12 Jan 2026 08:56:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDiR-0000000520m-2gky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:56:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso43713665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 00:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768208159; x=1768812959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBSIQiFn1pJ8WxGR+6gHaHWmEyf1wSX1ElHds5zTP8w=;
        b=PNjgwOft4HZ3wyD+rdaxo54mOieNzWuiiuq3uDGU8tpRuTqkr5O6mCSQ/hNuQI2FOc
         ojlM+uvHLD3ixy63pBCUMODEy73zGnGeRrNW+nis+tMvVrFXrb110UXFI54RHl7FcqrA
         va6tKHNdNShJzJncVZvjRDuWahZpeiL+ByQmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208159; x=1768812959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBSIQiFn1pJ8WxGR+6gHaHWmEyf1wSX1ElHds5zTP8w=;
        b=KbTilaOjimYpC58hB2vAecipEQFz/nSY9vC6RTO3Jz6hvSOPx+BWdGBKNEdkBkyity
         P8wUbTNUnc68e7z242P7/600p30aIlTz1mT8nJLdKADWtArsearklfj7CmrV8U/8qJLK
         9nWu8mZbWLq2LaSQuEs85qzmed7ZL1V6UmSKq6SMAD5ihpUvYJy/Ui9jFjDSIc30fKdX
         2xFDOx7DAeLb6s1HKzlPH2zHJaZCeJtNJ2ik/i6oQsAfsrxW2dOs2wcmhQUuL73r63Gc
         LEFzwZnkc4c3BGse5FRyj6gnR8TVabvnDDKsTyBkchRTz9EQ2CelJ1OpZ7Ze+iO7oFFO
         MHuQ==
X-Gm-Message-State: AOJu0Yy4mqHdVu1PgiWjLd+tVWMGKyltseM1Ah+G/3jfpM3uqQ3OgOs9
	tCqkE8VJjjjEEbIsclhRsD+eLMUbHTLYa+p34xhQzguF954eprVLHCMs8bae3UvF6A==
X-Gm-Gg: AY/fxX4KPY/TvG9u+OQNcK09DhJC74NalQHoZ8xPk7VVZLXGeSaxH3JwHVM5He69kR4
	b13w99LPCrhmKcoclayjW5CsxYTaEpYCZhs2LPkmTbxbG6s7V47F1nk0ZaUiYyPRrwM1tf6Glzd
	orsUr+f4QSAzVIPEzZWVL7iIe2eRo7dcbmD8vhWRVRmjI+Nf15//k9H3lG5wdvGDrSE+V94TEvC
	TM/h+QggluRDCfDapCVkR3SElKa9FZY5Z7p6uZLHtqRGEBOdIOlEtCxGrcNlC/jFqaiNUcPKi1K
	AAjDtgA0++z55DD9KtNLc4LdZsOGFqX2SLfObCTZ/kOsL3FudmUSskLlAFvQp1x8re7na9CRKGS
	6a8oEQCxszzSAdL2D3CCJVTP7mvhQWh6dNWQ6mo/uzzoQ0S2isbxbwxKMlH4R4wQ6cC1v+xc3tG
	QL72DxSoONhEpTlji/DIri0fWJjmvOVLH49TOeKSw6ScW+qgXsFzX1B9ZW0oJrhQX0wCQ=
X-Google-Smtp-Source: AGHT+IGtB+k7knNOCZZSJhn6Was/koQjz+fojMEFU4VcO+xFjd8RphFsKRaQZGCbTaB+WqAm20+R/w==
X-Received: by 2002:a17:903:2f8a:b0:29f:251b:c9d7 with SMTP id d9443c01a7336-2a3ee40d593mr149472035ad.12.1768208158695;
        Mon, 12 Jan 2026 00:55:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:aba6:4082:c9d:6c7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c491e7sm170227935ad.38.2026.01.12.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:55:58 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Macpaul=20Lin=20=28=E6=9E=97=E6=99=BA=E6=96=8C=29?= <Macpaul.Lin@mediatek.com>
Subject: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first SCP core
Date: Mon, 12 Jan 2026 16:55:42 +0800
Message-ID: <20260112085544.2959250-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005559_726199_94A70154 
X-CRM114-Status: GOOD (  11.17  )
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

Arnd pointed out that having firmware-name in the device tree is wrong.
Drop it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Drop fixes tag

 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 7fedbacdac44..8e423504ec05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1166,7 +1166,6 @@ &scp_cluster {
 &scp_c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
-	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem_reserved>;
 	status = "okay";
 };
-- 
2.52.0.457.g6b5491de43-goog


