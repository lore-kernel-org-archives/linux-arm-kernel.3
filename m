Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyCuQfx6deCrzI3S90GQXXhYycWHkOUav5G7qScYADI=; b=GyQa5RgsuxLIkg8vzexSb6p2AE
	cWhXBAV1kNo+62aOswieh+Llg/Db53JmpVJOELCSp/CykF9KJdg5TX9gBWZa88lmsLClpU+Uaq3Rb
	4EsaDtdtNFX8tWr/4qO4iuS0l7VbgQz4qCab5qMFpcJuRLY5I+LgHlmYHkdotiTEUGcZS+3lo9SUO
	Vtqfx0iZryrgptRaEcv1H4fnGAnk8Ld4fCjYV96Prg/Q6wLDDeKmu5NoBm693pjs36/ivSwKs/Wn7
	Bnz2s72YgYUmU7Ox291N6Zo/C703m8Nb3H5irzNCXEMk3wxrGnj2h7yBdf/lipx4tN8ZqZaKgun5l
	Vda1u0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfsX-0000000A5Gn-2CKi;
	Sun, 31 Aug 2025 11:05:45 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfjb-0000000A4OG-1oWk;
	Sun, 31 Aug 2025 10:56:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7720b23a49fso3826010b3a.0;
        Sun, 31 Aug 2025 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637791; x=1757242591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyCuQfx6deCrzI3S90GQXXhYycWHkOUav5G7qScYADI=;
        b=mQXuhu4M3Dxqvndsa24OIgpxe8Xc0xOFp+02eh5HpcCEIK2ko1kMZU6xLvQFHjIM2I
         jh64TjCtXUoU7k2HhpqyA4O5Oxy6+16pOOR8FTGg6Yrj0AQc7OjqAKxBaMddTTos0iKM
         u7SCRgZAGsO0vodjsQFQGcROZkcqUNVPTcGdkp3NHcbz0epFaybXCQzCHmk3d7VGfjGf
         zC/pUdbjDhyFhUBe6+P3OMa2n6wIcuDhTXbg0C20zE1SE7DeSwbAEVlnxypTA+JkZFtK
         17A+CU0FTunS1dqe45yhygNdrxgrEz+lfDaK0LbZXFBAOFOmJt30ouzRWjMCaQdAAE1w
         pBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637791; x=1757242591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyCuQfx6deCrzI3S90GQXXhYycWHkOUav5G7qScYADI=;
        b=RbJp9OJb6JLHKEn6juqoHNxITy0xbzx8yjl2ROCGJzJZ89ZPTB5308PGNfZc009FAi
         TBXngus78xcpbr7os/6EUKKGSSAtJAEAOHKbfjqYolMykecp3TToTZNF5hA72lGveiGk
         Vw/CocIZ7vgE0cqYBAsqjptIUyebZdW2ECVeTwoBWAuOEeiHGuS1sT69Efau91tigXxc
         6ukq2YYzrITsLAzy+dTOJzuvuefB+NqlZmZMLl3RJcFqI6SNz+I8kGAMMk4+oD8LDwxw
         XWSRj9kvaaZBSCmN4dSG91tYYrGOeQ1EV2CWkU/tKtE9uEsbwvhR5XltPx8pdu9yLkkx
         GNhg==
X-Forwarded-Encrypted: i=1; AJvYcCVKkhCRpmK3LkAf7HbsKF0mGzpXqAkM8bL1Z2R2q4g9P65fP51jxsLX/O/+K33npmnU4wSENWKf4oP54x/LdkdP@lists.infradead.org, AJvYcCVWcCdWcbi5uZH6Jl9YN0T0fHxaPEr1CwoAwVELqNuoRkzJx5lcX0koUr9G0jWYe9RkpAEDjsycBelBnVLSg94=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHBRwWEir6F3KImMQtaZumqkHdnphMgAEPEdVdg04yDfYOWuQ3
	2FH0X6v//cCEamR7QZm595+4DLgY6jV4RzO3aHiBZt4Xt6ih9PZnfRKzZPH+nsCosVC8pw==
X-Gm-Gg: ASbGncu6rCCuJcQaQcGDXlg3plxPvF7b3DVRfWnZEl/xaGkU8JzjdpEf+CGRthXhGLF
	AC2UQn9INge0jTWz50lI2MnWebWBMpFkjtuWk5Nabd7sSj++KH34wh36u7j0SpvxLVYGxUo0U1j
	240HRj/B+AaFwj7yQhWP55nmQ/oOqn2WPSIK0fqC47NJ6wuQu+nJVQiVkqidiVQuzLwABAmDQr2
	q5K8Gwtc9+cf8kkSk0wxzQ64Lk6A3GFw6B/EY26rKWb4idPOkll3NaQKsC/lQoMDMVsOQpO0M+f
	9adEgmv+88fdXczRHERpnOFzhxSNt8Rq+bdMP3tL2Gkx7i5YQ9s0QmYflBhojDgKYCW3g329QPY
	m547WOFuizD2GrK15FmfYHJyz2S/kN24pP+Yvef1JUVj+nMfbDA==
X-Google-Smtp-Source: AGHT+IE6r9QjMdEHo8v+4WkgO4Gaj1FQsN6g+kaTvt9XXtQpNPUIIt05Wv/m+Q/CEazER1X8WXX29A==
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id adf61e73a8af0-243d6f02e27mr5147570637.28.1756637790601;
        Sun, 31 Aug 2025 03:56:30 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:30 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 1/7] drm/rockchip: dsi: Add support for RK3368
Date: Sun, 31 Aug 2025 18:48:49 +0800
Message-ID: <20250831104855.45883-2-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035631_470651_EDEC84CB 
X-CRM114-Status: GOOD (  12.36  )
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
index 3398160ad..5d76e3e04 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -162,6 +162,11 @@
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
@@ -1530,6 +1535,18 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
+	{
+		.reg = 0xff960000,
+		.lanecfg1_grf_reg = RK3368_GRF_SOC_CON7,
+		.lanecfg1 = HIWORD_UPDATE(0, RK3368_DSI_TURNDISABLE |
+						RK3368_DSI_FORCETXSTOPMODE |
+						RK3368_DSI_FORCERXMODE),
+		.max_data_lanes = 4,
+	},
+	{ /* sentinel */ }
+};
+
 static int rk3399_dphy_tx1rx1_init(struct phy *phy)
 {
 	struct dw_mipi_dsi_rockchip *dsi = phy_get_drvdata(phy);
@@ -1693,6 +1710,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
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
2.47.2


