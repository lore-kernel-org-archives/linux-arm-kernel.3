Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BABC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fqpA/Lpac9+JlswIBpsVSCZtAGmxs1CgIvPDGfFS84=; b=Tj2MXOt0G0TQwfdgO968s14ipB
	LJu4vz1QTZPruDPEP/DWy/sk3Xf7ui/Ni3iY3mVNp3gxj0DZK/kymiSTiDfEwf30rONqNFfnyWh9p
	VEWCrjtWVUQTEhPtHFvPj9RVDhdKO8Gti/6ZGp8GB6NQBqGMC2OCS4x+Axo0EhnzVTxmRudDki1nj
	hZYpKNtbrfXmor6GJb7ypPR7QhXNURP2ojT7OdTvOUlxGqp4Dbi3Afj9Ivw9k/SLlO7cRt3QM+PGX
	xFo9PpLgTVJkqm/U4KPcgwVYPRfC0rcMJKkob9Hm9d/H9LaImADnTReD7s13fk4pzPz0QsQZXRl9m
	XFJ4BI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAjb-00000001k8T-1g3H;
	Mon, 30 Jun 2025 09:23:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAbX-00000001j1F-2CbM;
	Mon, 30 Jun 2025 09:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+fqpA/Lpac9+JlswIBpsVSCZtAGmxs1CgIvPDGfFS84=; b=p+mVLfZ6Sbj4jjBCwKAaXU3Eh1
	BQ99XI07HJ0uWwEVHEhluIiblIYNyzteiu1sClMHdiViQuFQv9vaL+EHhkDWTefKVtNq7H9Kv/DwN
	WrvFu7bkHcLzdUQ5FeJRWha2fWeH3X38S+6GSE/7Ey7ZUcqB3n/xlMv38L5tlPqUTsgFLLnTy7ENu
	9Riljpgx4CyvPsr9fYiTfOOc98BULHfeQ4F6W8vDaCuJ88QY/YuuTtCuvjmIa2XEaLx6zUBOtnAwB
	VhYe/9iU26D7U0XmPloUlvO575XgXzYLPEzaJxXN8SopKWtsSPrBb0EoJZSHWVCMJdtvwFYyi4NDE
	Qa3cWGnw==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWAbC-00068L-5E; Mon, 30 Jun 2025 11:14:50 +0200
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
Date: Mon, 30 Jun 2025 11:14:38 +0200
Message-ID: <175127486757.133006.13048263625888495346.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_021511_568698_0CEEC271 
X-CRM114-Status: GOOD (  12.99  )
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

[1/3] dt-bindings: display: vop2: Add optional PLL clock property for rk3576
      commit: 3832dc42aed9b047ccecebf5917d008bd2dac940

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

