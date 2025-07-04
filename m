Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC54C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJgWP6I1twyHLy0xIpRm0gmNC/tlODsphLrB6DOoBfQ=; b=kFBhZSRQJnlqwv/6/ZTacbnHUc
	n+q9eI1bHNfMp+0P08q8WdSJfiHtveoiEUQvL1ZfiAXqyUsITY2D48Exq58HsFIfzdRecIYeGZmsT
	p7Lnm5tL/26zn+b8cFx5/KKmVFCq1kcgc2a7aeosnNLK+5zdEZdbVzJLiNCdFN88rOiCDvfQs4sR0
	h6dftXs408WyCAaHy+72DpBK+h6Wux0/+RH2kDSSiQZV8KjYNoL8a3d/JNDJ1IDC1yZ3efzz8gk5F
	I3a7SrDRuBVtacUZWRePQyQqc0zyht27y0LSeHfDr3gO/q/+naL/5uOyGgJ+khhOmp3JwiyuF/D7x
	5tQ7B5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhha-0000000Ei5b-0e0u;
	Fri, 04 Jul 2025 14:47:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhKC-0000000Ef1D-3jft;
	Fri, 04 Jul 2025 14:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639015;
	bh=gj4rXTi5xhvc6UX7OZe6K8Cx8rlffm0qUchexNCC4L0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iw3CUVpAyfZir4XEsTPjG5HuHvHHttxjJ8tA2DNO7nE2SUAeIVVZoggYhW3v8QQjL
	 EMwya6C7CY7j3J7xkC1oElN/2mYvpRumzRy/pZUVA2WxiCWAUkcKvx2RjGhtjQXYxE
	 xdZVR8kyQ97ZriC9bEXoenGZn8FFRaAgXmCry7weStgFcAkRlWNwPkQvdSWXrYkXTE
	 mDu9sFcKaxsIcq7fbVGK+MTZQ6PLW0XlYkpUfOmmhn7mtZt3XTLMhw7ACU339ESko7
	 g/4p6cP1olCYlo+buESrIiAkJONqpPaAv+E3mSfW/7/r6ozjscsli/y0qjfyuV4Li3
	 PIIKxkcB/2RDg==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 589AA17E0F3F;
	Fri,  4 Jul 2025 16:23:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:26 +0300
Subject: [PATCH 5/5] arm64: defconfig: Enable DW HDMI QP CEC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-5-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
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
X-CRM114-CacheID: sfid-20250704_072337_114445_05EEC7C0 
X-CRM114-Status: UNSURE (   8.24  )
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
index 739b19302865fe8edc54911213321d6f1278aae4..0363ba916e0ed7e7d9dc1169f447f3726580de18 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,7 @@ CONFIG_DRM_CDNS_MHDP8546=m
 CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
+CONFIG_DRM_DW_HDMI_QP_CEC=y
 CONFIG_DRM_IMX_DCSS=m
 CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m

-- 
2.50.0


