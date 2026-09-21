Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C639C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6CuawVxIWhEs6YC068dOAO7JxwWhj6Ln8+UX+AQKf0=; b=jfX4vxg89Saeg9dtqwfZFT53o7
	4d2sDpwpx0fv+D9s/GCFCJQvqtvdJzzECMuUvf+SxjEPhLQpeRmmaQT25l3DTjz1meViHc4CIuWOV
	KoaSjPQcpg6xrjbFIrUSOHBTgV/SSpSBWceYEPZslMOkKzejBODQSzpBFJoDO7RyAJsiPNMeEM/W+
	eZgLlvPvegmQx10g4YNeQ5B7w7StFD+JZd+L5BuH65q5UQA2e7VbVLa8ky+N482xHBvta0fMmGbjA
	gUJTdWL7yTu3HPuusmK29mF2rcGts4TeFZo7fCgunWI3Av9NmHisOGG7XdecHSuZWmbEPzjewybpm
	og1LG2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g00-00000002csx-37UD;
	Mon, 21 Sep 2026 15:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzc-00000002cYl-0RuW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t6CuawVxIWhEs6YC068dOAO7JxwWhj6Ln8+UX+AQKf0=; b=n0M4QvP+EM0/eOXlAzq1jNHXc8
	FQ4Rv9Hj+1ec7ryGl7+MCSdEx+nMtOEqMOpZ/zF948yFDJcK4HVtX1Uk1V50MusmYWDtELp1g3w1J
	Xkd8JZnSdNfHtsnRpiCrDGa+gMYXVDAg5Cf/ujEj8ckrc33PitAyOiMwaOekMWiyJ1DdvRj1oIHVe
	KxkNwl2pOawalobKs/PQxKYnQVxKyH8boudHrtrbhoqTidHsgoGBLPrUJcTcYnR7gYrRhzEjVI2Ky
	dxK+Oz4EA5ZcsyBFXt8RLRrAw24M0Qav3GFGsZBKs+PhX6pmPHHtMaSBAGkSBHyHQaZ19K0DLnLot
	FPaZg0DA==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fzV-0000000CTgv-2H0y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:31:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4843e397f74so1488f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004696; x=1790609496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6CuawVxIWhEs6YC068dOAO7JxwWhj6Ln8+UX+AQKf0=;
        b=ri5dgXERpdVU6EgMJNKgbKJ2eZkYC2h5XlrNVnUKvjxAHmzZ+cOr+ihyMixuiBGOqC
         aLNTP2epiyrl6NRujISdTeeWSHa4pz9Pz6EFjtitv2NftwH5Lp1VocItdaTE6SRA3QiE
         kvpLSbEnX8yFLl+yw0c4n/uOThYlItJXipS9xXJfr95edQpbuhtT17dNoZWphTSxjg3C
         M0Qhn2GIdezUh1V5Q/aQK6/2mziGTctupyHWtseeW2f7myf6fJSYh+iIz5HmjZOiz9p2
         f80ZCz/uzUdSpjEmi/XNO4d5XxELJAHAXAVfADEUHpiQIyCKwamaXEpHE19nokhxt92k
         2OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004696; x=1790609496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6CuawVxIWhEs6YC068dOAO7JxwWhj6Ln8+UX+AQKf0=;
        b=s1bHcE3QboowHBRyhid2KzLtkORIZw3e1sgtrF7tp4u2NWEt1UuWJsqA0C3htC/YmU
         FAPlkqlC+999x+ndNsnowgcklR3ehT2hJmOX9+b3gGwu8HW+7ZQFU74TlX/8Q9VnTTJJ
         lc548Qe7NOhblMZqzZc03noZXg9nIOB1MJmtd/aLE0CnQ0yZTtKvyqYsjLONCpxkiWA9
         S/zuY97JfgLAlW9FSDIHB78500qxLJtRqaw5s0h17FXyzzAU6D4lxyDi8RSUazws/7Dt
         6/OWBsoZU2W5ugpmV20WO5KNWR5BoSsTcXtNG+T7oZWrYi/hyMgbgBFjoOxbA1/EKzku
         hI3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxluB2X1DhOVg7eOopA9KWSrNOeIjIwnPSHXDC8I6jrc2jg4h2f1S9zGJq6l9n44w1jFZZokCU/1AIGD1D8Tn8P@lists.infradead.org
X-Gm-Message-State: AFuF++kRNka+KHIVayv0a8+9QfM9+fo6g01LELV9nZ3xzzFjNu/4vjF7
	FkmVph8lCgdA8eIghcSZP3kgAAstZsGMCxbNWaBkyVIx+R6cjSWmmkKa
X-Gm-Gg: AYBFou393V3x6R0SzP4Xk2ScssaZxH7P60oHayTNhgsw5s1gdynQTWG2tjC/w48b+sM
	qCZ9tM5KyMcmaGgYdi8+iQeBRSXPELm1VaXZ3J6f0mI1SEepUxW+aKYs0/Fy8FJqMsyFA0IU/rL
	6TyURpEwSqTNc/qSGrHj4dlcz94F4skT0fzXs1VN6licaXTOcN/xi/j2MOdLMRURcULsg6HA9Uc
	PsgqdUcisCbXOFZX04FbpeDQJcwqkXQ4K3GorABC+43gWdEsNWXozH7G4kn7xpHl3TByoT2sibY
	RvBGSjEzg8zvnHPkvOExSOivoTeq15ry8bBRUoVvTz41sgZKuUB2g2fQPQeaJoRF0e53NXkGOxa
	8KQnnUcC5RnrmE9F6lji1vp2Y8RKsF73LWmJNCc04k26p46LcIUgcHEpCP3K5uLRuGKPb99HnZP
	VYeoFaAxcGZ4LIOd8EL6cK72QnOUYH+3k7ihgIZPm4TuEwgro5S6DoEsAS8yJ7JidzvuIJ8+xpb
	Q8ATTdHMY6fgIW8MEllnAAGJap1B3xAAMUQj0/qCxYm2Bv3aQdL5teb5w==
X-Received: by 2002:a05:6000:2f83:b0:487:fb2:1a0f with SMTP id ffacd0b85a97d-48860f7ec9bmr21822f8f.6.1790004695614;
        Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:30:00 +0200
Subject: [PATCH v2 4/5] media: rockchip: rkcif: add support for rk3576
 vicap mipi capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=8452;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=lMxXbWh9gcYq1Rca1IdpzxHKsuHkIoF7ppljfHLIC0Y=;
 b=uMI84BK2y4kV3gSqKg2dSq1XehFV36psClHlnyAtlUyBK1MQg1r5+4FFHzVj8Os+6OuL27QV3
 29RLUz2gtu8BidgcVolA3Vt/KDpL9ZSjfGc7/UKGmWD11PVWIOJSTC/
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_163137_857277_7233DEFE 
X-CRM114-Status: GOOD (  17.69  )
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

The RK3576 Video Capture (VICAP) unit features a Digital Video Port
(DVP) and five MIPI CSI-2 capture interfaces. Compared to the RK3588
variant, the MIPI register blocks are laid out differently (there is
no block at offset 0x200), the ID_CTRL0 bit layout has changed, and
the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1. The capture
size, which the other variants configure in ID_CTRL1, lives in the
ID_SET_SIZE register.

On the RK3576 the pixel clock of each MIPI port enters the VICAP
through a dedicated CRU gate (CLK_VICAP_I0CLK to CLK_VICAP_I4CLK),
so the variant claims these five clocks in addition to aclk, hclk
and dclk.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 140 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 ++++
 4 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 432f47a1fc23..53e62d059764 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -30,6 +30,14 @@
 #define RK3568_MIPI_CTRL0_CROP_EN     BIT(5)
 #define RK3568_MIPI_CTRL0_WRDDR(type) ((type) << 1)
 
+#define RK3576_MIPI_CTRL0_HIGH_ALIGN  BIT(11)
+#define RK3576_MIPI_CTRL0_WRDDR(type) ((type) << 8)
+#define RK3576_MIPI_CTRL0_PARSE(type) ((type) << 4)
+#define RK3576_MIPI_CTRL0_DMA_EN      BIT(3)
+#define RK3576_MIPI_CTRL0_CROP_EN     BIT(1)
+
+#define RK3576_MIPI_CTRL1_DT(dt)      ((dt) << 2)
+
 #define RK3588_MIPI_CTRL0_DMA_EN      BIT(28)
 #define RK3588_MIPI_CTRL0_HIGH_ALIGN  BIT(27)
 #define RK3588_MIPI_CTRL0_WRDDR(type) ((type) << 5)
@@ -490,6 +498,138 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 	},
 };
 
+static u32
+rkcif_rk3576_mipi_ctrl0(struct rkcif_stream *stream,
+			const struct rkcif_output_fmt *active_out_fmt)
+{
+	u32 ctrl0 = RKCIF_MIPI_CTRL0_CAP_EN | RK3576_MIPI_CTRL0_DMA_EN |
+		    RK3576_MIPI_CTRL0_CROP_EN;
+
+	switch (active_out_fmt->mipi.type) {
+	case RKCIF_MIPI_TYPE_RAW8:
+		break;
+	case RKCIF_MIPI_TYPE_RAW10:
+		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x1);
+		if (!active_out_fmt->mipi.compact)
+			ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x1);
+		break;
+	case RKCIF_MIPI_TYPE_RAW12:
+		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x2);
+		if (!active_out_fmt->mipi.compact)
+			ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x1);
+		break;
+	case RKCIF_MIPI_TYPE_RGB888:
+		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x7);
+		break;
+	case RKCIF_MIPI_TYPE_YUV422SP:
+		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x4);
+		break;
+	case RKCIF_MIPI_TYPE_YUV420SP:
+		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x5);
+		break;
+	case RKCIF_MIPI_TYPE_YUV400:
+		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x3);
+		break;
+	default:
+		break;
+	}
+
+	return ctrl0;
+}
+
+static u32
+rkcif_rk3576_mipi_ctrl1(struct rkcif_stream *stream,
+			const struct rkcif_output_fmt *active_out_fmt)
+{
+	return RK3576_MIPI_CTRL1_DT(active_out_fmt->mipi.dt);
+}
+
+const struct rkcif_mipi_match_data rkcif_rk3576_vicap_mipi_match_data = {
+	.mipi_num = 5,
+	.mipi_ctrl0 = rkcif_rk3576_mipi_ctrl0,
+	.mipi_ctrl1 = rkcif_rk3576_mipi_ctrl1,
+	.regs = {
+		[RKCIF_MIPI_CTRL] = 0x20,
+		[RKCIF_MIPI_INTEN] = 0x74,
+		[RKCIF_MIPI_INTSTAT] = 0x78,
+	},
+	.regs_id = {
+		[RKCIF_ID0] = {
+			[RKCIF_MIPI_CTRL0] = 0x00,
+			[RKCIF_MIPI_CTRL1] = 0x04,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x90,
+			[RKCIF_MIPI_SET_SIZE] = 0xa0,
+		},
+		[RKCIF_ID1] = {
+			[RKCIF_MIPI_CTRL0] = 0x08,
+			[RKCIF_MIPI_CTRL1] = 0x0c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x38,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x40,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x48,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x3c,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x44,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x94,
+			[RKCIF_MIPI_SET_SIZE] = 0xa4,
+		},
+		[RKCIF_ID2] = {
+			[RKCIF_MIPI_CTRL0] = 0x10,
+			[RKCIF_MIPI_CTRL1] = 0x14,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x4c,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x54,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x5c,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x50,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x58,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x98,
+			[RKCIF_MIPI_SET_SIZE] = 0xa8,
+		},
+		[RKCIF_ID3] = {
+			[RKCIF_MIPI_CTRL0] = 0x18,
+			[RKCIF_MIPI_CTRL1] = 0x1c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x60,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x68,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x70,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x64,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x6c,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x9c,
+			[RKCIF_MIPI_SET_SIZE] = 0xac,
+		},
+	},
+	.blocks = {
+		{
+			.offset = 0x100,
+		},
+		{
+			.offset = 0x300,
+		},
+		{
+			.offset = 0x400,
+		},
+		{
+			.offset = 0x500,
+		},
+		{
+			.offset = 0x600,
+		},
+	},
+};
+
 static u32
 rkcif_rk3588_mipi_ctrl0(struct rkcif_stream *stream,
 			const struct rkcif_output_fmt *active_out_fmt)
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index 7edaca44f653..4e17cbc04b76 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -13,6 +13,7 @@
 #include "rkcif-common.h"
 
 extern const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data;
+extern const struct rkcif_mipi_match_data rkcif_rk3576_vicap_mipi_match_data;
 extern const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data;
 
 int rkcif_mipi_register(struct rkcif_device *rkcif);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index f83c8099b78e..08a213438d34 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -27,7 +27,7 @@
 #include "rkcif-regs.h"
 
 #define RKCIF_DRIVER_NAME "rockchip-cif"
-#define RKCIF_CLK_MAX	  5
+#define RKCIF_CLK_MAX	  8
 
 enum rkcif_format_type {
 	RKCIF_FMT_TYPE_INVALID,
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index be3a174b9aab..2a5758776b3e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -53,6 +53,23 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.mipi = &rkcif_rk3568_vicap_mipi_match_data,
 };
 
+static const char *const rk3576_vicap_clks[] = {
+	"aclk",
+	"hclk",
+	"dclk",
+	"iclk",
+	"iclk1",
+	"iclk2",
+	"iclk3",
+	"iclk4",
+};
+
+static const struct rkcif_match_data rk3576_vicap_match_data = {
+	.clks = rk3576_vicap_clks,
+	.clks_num = ARRAY_SIZE(rk3576_vicap_clks),
+	.mipi = &rkcif_rk3576_vicap_mipi_match_data,
+};
+
 static const char *const rk3588_vicap_clks[] = {
 	"aclk",
 	"hclk",
@@ -76,6 +93,10 @@ static const struct of_device_id rkcif_plat_of_match[] = {
 		.compatible = "rockchip,rk3568-vicap",
 		.data = &rk3568_vicap_match_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-vicap",
+		.data = &rk3576_vicap_match_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-vicap",
 		.data = &rk3588_vicap_match_data,

-- 
2.43.0


