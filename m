Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FDBCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSm+aabJuGQQVAHdFRseyG4Ifw03HE1bx3RoCtswd04=; b=r+apUcTqUjoV87Qhd8mUOU90Xq
	BKSDY/KEk2dkLpI8mr6DvN+otBTxCJrkMUB6UyeMRkIRd+TL3lX4D0Ncm71kyUsSWCI+9UcHa/5IN
	gKi4zzVXwie9F3vWfD/lUPBbYa1MQmysTpYjSi5fCQ5ZmorMXIW6ly61/TdgeWO86j+m+D18rpI6d
	P2kH3te6KlX6Fh66P577S1pBraAxreq8Bcu/rx881m0GBX/DGD9oJ8vvT68y4PEcEuEFYUiDEok/f
	IwUwnX5kNUrPsd8g4w+9FY+vUVjvhEZCEnGhobMyG2o09xzUj7McG0EvgktLprNNCGdQNz4+Du5T0
	2qtAV5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMif-0000000GKFo-0io0;
	Fri, 05 Sep 2025 03:02:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdI-0000000GIJr-0mYo;
	Fri, 05 Sep 2025 02:57:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24456ce0b96so18466605ad.0;
        Thu, 04 Sep 2025 19:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041019; x=1757645819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSm+aabJuGQQVAHdFRseyG4Ifw03HE1bx3RoCtswd04=;
        b=FWs5I+RTYZ54QM02q7O4O4qKiRwtAD43STqx8EyoAGoNWAKpQhVAS7mhrB1tTJlRQT
         hZl51cc/uVUUYUyhflw1ZLj8k53f3tHcMaoNZY8QrmMuhL+8/BKUKf9t2mUJL+OZbkSh
         JZ+PvR/tC85hWW444T3KwLoQlqRBSMxv+8JrmQ6LPFsObRADJcNiCOoyQzYfnWH/vIf3
         PKPfOApoLoWrzYCj7WaLG+3NgwzNWByLIGn6LzrPAnCWucmjk/A7X6IISN1z9AWdpjel
         JN3j72bQBkVbCzmi5Pg5xG9oKRL6W+5k/sYw2VnxBRwcKhZSYM7Y1H/GNdeFk07D31JE
         aKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041019; x=1757645819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSm+aabJuGQQVAHdFRseyG4Ifw03HE1bx3RoCtswd04=;
        b=WxXK1BAnrlK6RUrjB6p6oBizSLdkv+V+PBnopvMDgvuitF3mmG/LYGallW7RPk/l3I
         Kl0+y9AmtYJaCwaI1UahHI9W5CFa/aRVx3ONJiHhMsdS29fjfq1N40yJRpjp1NSo3JhM
         2FY4ZX21yG1PKX5rYnnoEOVC3oUFmsrf0XbQDnwfwSC1nBSeAuJBJesvJ9/aocjVBhAQ
         qLtnSyahjB/Jk9/b8Y0mnd4IGZRDgi3apQ8xth7TSdwpymYo5Lz5b9JAXImXefhjUOp7
         w2JyFrYaD7R8DXTGGa0z387QVMRImveHwGzauuA2M+cczqXBY0/oHA8wkDoewrx8MzuA
         SbZA==
X-Forwarded-Encrypted: i=1; AJvYcCWIH3Ul2MARERJLcXORKLRoOL2s5jM26j5NFmTZeYrkOD1kMWkp3gR73O9qnIWRR/28KyEXHaz2W16sMBlwdhg=@lists.infradead.org, AJvYcCX/9lTy4u3b+t64HYXTOwA4uMpGkA3ZlCp/lECDhbYsnRvAKFpVpf2L0JKnLpGjl83nvxI5VZEjvEMH5l4gojJN@lists.infradead.org
X-Gm-Message-State: AOJu0YybakR+td4l+UDMhmkUn7/lOTPXcz1/npY2NZPIqEBGIIIGV6m/
	1lpZy/gI9Sx7Qltyx3i/ZUY4BF8wlbmAbMsMWZXbMG9vIZor4hStfMiH
X-Gm-Gg: ASbGncuVMcZGxU2y7/8oZz4v1Kd2PNz0Zeazx2mX0JDcktvKSJfWfBRL0RQjxjWUfLG
	HtZru+M8wocrjzu+Yc/DebPjYklqUvwD8nog0ilBTDCT+6SMMbm21fg7fJLi7yPpptsmrSd32Gj
	EPyU+QSz19RdXVZeqSTHRBBv48qGP8bXA+vCuyTOaXPIb6HJbsugDa0xx8Y1k3ThqGs+pd41TD5
	Ci4I34XcJYO4oqjAQjh2qtAk3Tao1w1LF4Z8eU3jewfKBJDJ43BrbXMdrDkSySiK9ijtXb0STIj
	i5ScDW4zUIHpPbnJKqW1VujAJ/3YsjQlfHnqFWyUYzPCWKB5B9MpS+strbCq+sy3pi8Fm5fyLQo
	w7c/TVsIUmtyD6ocuumQCZA==
X-Google-Smtp-Source: AGHT+IGiCiFlHf1mtHvOyU5iKaEmLyatGv7/gGlkix1p+pQFsrakTBSwM9VngVTFGiMaNmLO0Ctoyg==
X-Received: by 2002:a17:902:d487:b0:24a:acb7:a1a4 with SMTP id d9443c01a7336-24cedc8e40fmr22018125ad.9.1757041019191;
        Thu, 04 Sep 2025 19:56:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:56:58 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 1/8] drm/rockchip: dsi: Add support for RK3368
Date: Fri,  5 Sep 2025 10:56:25 +0800
Message-Id: <20250905025632.222422-2-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195700_225517_84578976 
X-CRM114-Status: GOOD (  12.26  )
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

RK3368 has DesignWare MIPI DSI controller and an external inno D-PHY.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 5523911b9..de8405ee8 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -163,6 +163,11 @@
 #define RK3288_DSI0_LCDC_SEL		BIT(6)
 #define RK3288_DSI1_LCDC_SEL		BIT(9)
 
+#define RK3368_GRF_SOC_CON7		0x41c
+#define RK3368_DSI_FORCETXSTOPMODE	(0xf << 7)
+#define RK3368_DSI_FORCERXMODE		BIT(6)
+#define RK3368_DSI_TURNDISABLE		BIT(5)
+
 #define RK3399_GRF_SOC_CON20		0x6250
 #define RK3399_DSI0_LCDC_SEL		BIT(0)
 #define RK3399_DSI1_LCDC_SEL		BIT(4)
@@ -1528,6 +1533,18 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
+	{
+		.reg = 0xff960000,
+		.lanecfg1_grf_reg = RK3368_GRF_SOC_CON7,
+		.lanecfg1 = FIELD_PREP_WM16_CONST((RK3368_DSI_TURNDISABLE |
+						RK3368_DSI_FORCETXSTOPMODE |
+						RK3368_DSI_FORCERXMODE), 0),
+		.max_data_lanes = 4,
+	},
+	{ /* sentinel */ }
+};
+
 static int rk3399_dphy_tx1rx1_init(struct phy *phy)
 {
 	struct dw_mipi_dsi_rockchip *dsi = phy_get_drvdata(phy);
@@ -1687,6 +1704,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	}, {
 	 .compatible = "rockchip,rk3288-mipi-dsi",
 	 .data = &rk3288_chip_data,
+	}, {
+	 .compatible = "rockchip,rk3368-mipi-dsi",
+	 .data = &rk3368_chip_data,
 	}, {
 	 .compatible = "rockchip,rk3399-mipi-dsi",
 	 .data = &rk3399_chip_data,
-- 
2.39.5


