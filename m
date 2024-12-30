Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E01E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 02:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeWo63al5Q9jX6hi9OUFCf7WTwROUVRvfEBDDGUsRVE=; b=Bkr79ZEp7hn5JPKD3ZStDTP8mz
	7OiuFH+gbBEcmYFxHOo0g4kw8OqNRjNVoCfXLNaYZ7aUkMY37+uXJwNPbjLiO5ovAp5R0GzMHAxy3
	wN0eqjIGtBj5Rm9mp3TQEKbLvYvw4FZtm8yA0DmW5LYz285zMCV4hO7+dvZPQtJrthYXkGH6YIKh9
	/hpenOsItwaYMtt+vGABhVs/bb7Ew4SX5zEbao4VyaJmGlJnGbZjuJL3aWHz6SCaGGWPmVcNo4CsI
	T1Pdi6ON7gmOY1qdvmRm8qXEmnsHQ9/LhDKCNDiz8tJCkpalo4b+dajeVpmOWxZPHJ05EXUVUA3OJ
	Juq9H/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5gR-00000004Mp3-3XPw;
	Mon, 30 Dec 2024 02:39:07 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5PQ-00000004KVk-1HPU;
	Mon, 30 Dec 2024 02:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BeWo63al5Q9jX6hi9OUFCf7WTwROUVRvfEBDDGUsRVE=; b=UuxtOpUjYXKk5/JoecKoQ3msk4
	F+Oljxs5RTcVAhtK+npvBAieFFYxYAhDVpKs15tdmNiu/SFuOG6/KxUkIGwcbfjgnpjT62dTNA4TX
	F9blddjoK/oa8yVfLbTjOUq23hObaMLDJD1cCgBmX2JFgPotpQEaAFDwikB8egvFPoipQ5jRWIwTe
	h+gxPqvsuybuw2IfwcpGkyvx7d8hugEGE9clxi5KDXbSc0Vi6SHHSbq7B5LqPjM+xAAlCW2nNqvAI
	ESRZNKlamxMxtlhphmh//+8D15akoxpsdKhTrCHxT3o+nsVSMGeEJKDYTSQyRusd0MLybo9b2Eyh4
	ogfVAjgQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <zeha@debian.org>)
	id 1tS5Or-005cYz-TA; Mon, 30 Dec 2024 02:20:58 +0000
Date: Mon, 30 Dec 2024 03:20:55 +0100
From: Chris Hofstaedtler <zeha@debian.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
	Daniel Semkowicz <dse@thaumatec.com>,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v4 1/3] drm/bridge/synopsys: Add MIPI DSI2 host
 controller bridge
Message-ID: <Z3IDh0TOAKqaovz2@per.namespace.at>
References: <20241209231021.2180582-1-heiko@sntech.de>
 <20241209231021.2180582-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209231021.2180582-2-heiko@sntech.de>
X-Debian-User: zeha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_182132_359539_0F04996A 
X-CRM114-Status: GOOD (  15.08  )
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

Hi,

On Tue, Dec 10, 2024 at 12:10:19AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> DSI2 host controller, based on the Rockchip version from the driver
> rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
> 
> While the driver is heavily modelled after the previous IP, the register
> set of this DSI2 controller is completely different and there are also
> additional properties like the variable-width phy interface.
> 
> Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
[..]
> +static void dw_mipi_dsi2_set_vid_mode(struct dw_mipi_dsi2 *dsi2)
> +{
> +	u32 val = 0, mode;
> +	int ret;
> +
> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> +		val |= BLK_HFP_HS_EN;
> +
> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> +		val |= BLK_HBP_HS_EN;
> +
> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> +		val |= BLK_HSA_HS_EN;

For all three of these: is setting an ENable bit the right thing to
turn features *off*?

> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		val |= VID_MODE_TYPE_BURST;
> +	else if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		val |= VID_MODE_TYPE_NON_BURST_SYNC_PULSES;
> +	else
> +		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
> +
> +	regmap_write(dsi2->regmap, DSI2_DSI_VID_TX_CFG, val);
> +
> +	regmap_write(dsi2->regmap, DSI2_MODE_CTRL, VIDEO_MODE);
> +	ret = regmap_read_poll_timeout(dsi2->regmap, DSI2_MODE_STATUS,
> +				       mode, mode & VIDEO_MODE,
> +				       1000, MODE_STATUS_TIMEOUT_US);
> +	if (ret < 0)
> +		dev_err(dsi2->dev, "failed to enter video mode\n");
> +}
...

Chris


