Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324F7606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V2VVTHhZ;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=EsMB1AEs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iC1G3JxUI9CHkJmI4Q8KQjR5+g3muYzWduWPCxUVDN8=; b=V2VVTHhZVFEXNy
	6A1/QON57oynHBVvWyy43TE1BAi3BVXMUwUaw8b2ZrKYz7sSqrEeBeuGQjJWyu4Kq8nUd5e4wQyZJ
	WoY18xoEEc5pYIf/C5E+XflrgHjOFnQzKwSUHGgCO+a/m0yrz3Hn2tMtJkJNet0z4Iebt47S97vcP
	yvBjaVMDdLJ5Ljk/oLidTUxADwVCXf/oNUXr1XL+Ht4y6UpCEsLjZIl113/3DiOCxS96qedZN6iOe
	gQmFFdz2354JEljiIPJH4ObuiYu6e4sWeY+95X6OM1XzBKeogdk0u1Vr7NqB1Q9g/2dAzjGiyCmyN
	ZKaWhussvGdC8cAjFMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJ2g-0000000CInc-3Wrh;
	Fri, 06 Nov 2026 12:27:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJ2d-0000000CImZ-3QVp;
	Fri, 06 Nov 2026 12:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iC1G3JxUI9CHkJmI4Q8KQjR5+g3muYzWduWPCxUVDN8=; b=EsMB1AEsVbddRhEkNqtxR4Dku/
	fCd8WF3c9UeC7SvcAmlG/+G5YdOXXAUvdsppn12hLTNUVaxiyhPP2elO38AJpkk28kZhJfjQzzgSs
	AfwrA/Q3BBUQ8AQ9RK5Drp+P6yV/9tE3PIHdGJU0xdxFqcNoFHjbbPWqTpGrTrR8Z/ELyMnl0DlLd
	Jua0m1uTJGsz3uIUAsrBVa4/u5Firs3XRnoyUiiKZdSluT2LLlf7NW3tLTANbAD6R/sAzqp+GbWmK
	9oiEiVsHQ/IJWB41oycCsZX1vojJV6wZRy6RSeZdgNHokRv2kuk40u4H3se5kmXJ9grK4DAVSE8RA
	QrUz+FuQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Stone <daniels@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: (subset) [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color format on DW HDMI QP
Date: Fri,  6 Nov 2026 13:27:00 +0100
Message-ID: <179396799756.1259812.6287557543031614029.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_042735_872405_A2CC1946 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 03:00:34 +0200, Cristian Ciocaltea wrote:
> This series extends the output color format support of the Rockchip DW
> HDMI QP controller to cover 10-bit YUV 4:2:2 and 8/10-bit YUV 4:2:0.
> 
> Patches 1, 7 & 15 improve VOP2 robustness on RK3588, helping recover
> from exceptions and preventing random display output glitches observed
> when switching modes that also change the color format, e.g. from RGB to
> YUV 4:2:0 and vice versa.
> 
> [...]

Applied, thanks!

[01/15] dt-bindings: display: vop2: Add missing reset properties
        commit: be1734125b3e1c598c6ce35b4731d80e7acb7329
[02/15] drm/rockchip: vop2: Fix resource leak on vop2_enable() error path
        commit: b571f72ef923c31427f7058dd40a876023e75f32
[03/15] drm/rockchip: vop2: Disable core clocks before dropping runtime PM reference
        commit: ceb90f6ef6d5039189d4be7872eae33a8c635a0a
[04/15] drm/rockchip: vop2: Balance state on atomic_enable() error paths
        commit: b0e41d0609ce58e69ac43a2406bd3d6945454a8a
[05/15] drm/rockchip: vop2: Avoid division by zero when computing max_dclk
        commit: d0b0039a9a579dc4504a9af68e197c47187770dc
[06/15] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE overflow on 32-bit
        commit: 2cc46e2ca621923bd14fce6617000c218ea8b16f
[07/15] drm/rockchip: vop2: Reset AXI and DCLK to improve robustness
        commit: 67a391e50271e4e6cee833d31a7846de6a5717ab
[08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL clock parent switch
        commit: 99bd1f8ae90101f25c65f544a3dfed2ad01824d3
[09/15] drm/rockchip: vop2: Use TMDS character rate to select DCLK source
        commit: ae98bc626336af920ecaee18c3b1d962b4e40d3e
[10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
        commit: 95642d0e806d2fb97a02daf6caa657009a76ca13
[11/15] drm/bridge: dw-hdmi-qp: Log resolution and refresh rate in atomic_enable()
        commit: c1681020b47bec265f8c5b06de7b321139f3f545
[12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code in atomic_check()
        commit: a6cc582884f78f0fdd6345eba9bbad32ddb5734a
[13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format
        commit: 6352f4538ef03eda8346e79e4eb63bdead6c9a38
[14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
        commit: 09b4318c0e8a3d27b1fe6a2765163c1c52e321fb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

