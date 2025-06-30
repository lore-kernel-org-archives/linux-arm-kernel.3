Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8DCC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9NDST3Jz+7qAkVnnzdeFtTSjYFFZgsmdrwgsOErAQY=; b=mFtMpow9yIrvda7v2XYM9dOP0Z
	K5pTWa2SBo4+K+iZZY4q0Wvo4rn28rkaobQ28yhd+VV7F771A9QZ4y6jAvLIi2ZvEEC5iBzorfVTv
	ZRwXWluvOLjl40StXnhX1RDH0Hvzke0ivGO5IK/c7tkd+8CgSWu/GJ+LUlok4P+D3KWJ7QG8o49ti
	Hyl1qJyXaU142Jcm3DRWj/E0pFRf62kpoCojAhCw5+AmKPUAY3cQ5n1CvWIL03IWtvBqfcz3g46iD
	rUPK/9sHaFW6O0CY0JRbaiLgzcA4ghRYP8L0Ba2PpHs1/Q8z1XCu0YSt0SVGZ5pIMHkzicHTxduaH
	LX6GZOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBJY-00000001oj1-3urJ;
	Mon, 30 Jun 2025 10:00:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB5d-00000001mlr-388Y;
	Mon, 30 Jun 2025 09:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Y9NDST3Jz+7qAkVnnzdeFtTSjYFFZgsmdrwgsOErAQY=; b=Pu/fibC1BioK2jFS+/Suan3gfe
	zBYwD4ZBY7ZB1zEtAPgJm2z3UNMA+PnhtTqRzjvNcvb2KuMnEWkHaxxUCCHHEQXpWGq20qDhRLWU+
	G+wtiuiql6xdkh6SD9oiHa53LDdVNnmwh1AoRN/Y1RAiWEqA2sx+mW2pCf99z5xSyw0NYAXItuI5V
	Ce/KUF5+ZK7a9RrW3DQsMM8EAhCh1Elb69rFXWZA38eEQCx8AsIed1xwO1+Au+ILf4RaTNOxuHZEy
	XA7OR98Su158f5OEA3BxePxjf1vptmkojr1my+NDYGstJnVBCVo4c/wBt7IGPXyWj9cJXDWDc3jzE
	VAWVHt1Q==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5J-0006Zc-NW; Mon, 30 Jun 2025 11:45:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	Andy Yan <andyshrk@163.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: dts: rockchip: Fix HDMI output on RK3576
Date: Mon, 30 Jun 2025 11:45:43 +0200
Message-ID: <175127673170.138768.2750019660187884094.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_024617_781044_D08123EF 
X-CRM114-Status: GOOD (  13.26  )
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


On Thu, 12 Jun 2025 00:47:46 +0300, Cristian Ciocaltea wrote:
> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
> char rate via phy_configure_opts_hdmi"), the workaround of passing the
> PHY rate from DW HDMI QP bridge driver via phy_set_bus_width() became
> partially broken, unless the rate adjustment is done as with RK3588,
> i.e. by CCF from VOP2.
> 
> Attempting to fix this up at PHY level would not only introduce
> additional hacks, but it would also fail to adequately resolve the
> display issues that are a consequence of the system CRU limitations.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
      commit: aba7987a536cee67fb0cb724099096fd8f8f5350
[3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576
      commit: 4ab8b8ac952fb08d03655e1da0cfee07589e428f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

