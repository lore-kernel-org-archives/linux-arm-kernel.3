Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8285FCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oGyWpIhyoI9oStPoX0uFmiv4c60kZfDNY5EZEpFV2c=; b=HKvSlP4M9q9Ey0B7s1qnkVHTB0
	05ki42eEO+dOsTtO8z1NnydsFHl5ZZ37hVoaW/Y0wGPeymFcnCnVFoTMWevIMdytbsncNP1AuNr3B
	wUdZVUO75SxrPLQ6+0vaV8bYa9gVKKV4wXDDadXsIZIzRYiHA+596cihD+vAB/uEq9K0RCDdVVqkq
	KHZTLj68FShoXYOjvzj0H+8aF1/AT9PDrvpushoXOqA3p1fpzGsGvHbMSJE43BxT+x4MPzAwSKXDq
	yqVDt8s7Urph3HII7UNjeptNlSHHva0GK4CRDumui+f/TpkI2YG4Vnw54004iikIkLBjxQqOSEdRZ
	0BWvr29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwD9-00000007om9-19qb;
	Wed, 03 Sep 2025 22:44:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsa6-00000007M4N-1NO1;
	Wed, 03 Sep 2025 18:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756925500;
	bh=YnhD0OKVZkq8xMeukg7WRlgfoZMiD/56bfTry9LelCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gf3FK+2Vp2Hp/DNu0P6ZOfHVs++FmxovFYxyW6oWa9UFCCzgMB7ACqQmE3PGZxA7p
	 uLMyCvM1YR54mi/f/kp4+bjKwBKybEhg+vnRRNYUqFZDn2S77WDnWWGw489DH4rJ8s
	 Oki4oTP9YJRMogXeJa13bSde7zCqf04L3eAAms07w3OADXWqIrVYqm6Dh8xWTr2WcG
	 nzHkcwbxA4iUuTYyj+xo4ODjrlLoj1GVB1CK2DYmQsY75HB9Mdzhn01e9yHssrMcnX
	 4F/wogylIizz9d1+xG28fZ1015E18mV1w6dm/ExJi21yMV4uiGHUXGVp1INmtMPujX
	 kcUt+qKCRIqdw==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7F24017E138B;
	Wed,  3 Sep 2025 20:51:40 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 03 Sep 2025 21:51:04 +0300
Subject: [PATCH v4 6/6] arm64: defconfig: Enable DW HDMI QP CEC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-rk3588-hdmi-cec-v4-6-fa25163c4b08@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115142_550721_9447CCD2 
X-CRM114-Status: UNSURE (   8.50  )
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

Enable support for the CEC interface of the Synopsys DesignWare HDMI QP
IP block.

This is used by all boards based on RK3588 & RK3576 SoCs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index acb6807d3461384929e84f4c939fcd00c4b509ae..346ef79c1ddd0a317f0b9a8056c680c29a4e0baf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -966,6 +966,7 @@ CONFIG_DRM_CDNS_MHDP8546=m
 CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
+CONFIG_DRM_DW_HDMI_QP_CEC=y
 CONFIG_DRM_IMX_DCSS=m
 CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m

-- 
2.51.0


