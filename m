Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928B6CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xclY5ZY6I6M+MMUhy+w96bAdYd7mbDw5BEiQwvO2aW0=; b=zA1pS1Jx0NtdFsX2CQkpDomP0i
	P3+r2THgBbcPbyQS7MeG4ODHU6SGU9e/bqH/iwAj7RJYnUsmgaM5mKWpLfJO24tra9aq4fgBB2dxu
	DuHmoPUevptan6F0zXtaVK0CDtE0+jovRHnjA7kWCGrHaEIPzACLmTK0ummsSSxBI7rZDwmqwTAtI
	QOFk6dFmRPBCWpcJwm9BtIGXQDKRnDwtBedt6e99VgwWijfR48gvJw7Di12lZGKB13rA10LQIdeDC
	EoYIsqULmzLs2t8DZPgGRqWFFnYa5h+i2nMUJ9fjfxiwZKFFW6axana3j0bBAvPB61fWRqfWdHf5b
	36jbBN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVw1-0000000DljV-1bOY;
	Tue, 02 Jun 2026 20:42:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVvz-0000000Dlj7-1aJ9;
	Tue, 02 Jun 2026 20:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xclY5ZY6I6M+MMUhy+w96bAdYd7mbDw5BEiQwvO2aW0=; b=fvfp7CB2qRSdYm1fA/eC4IJh8C
	eR4cVrTQxR7bQcWvxce+HF+lQOw0HQFyGTjcdIFHlD6/0WRXgbFKSTsxNDpmk3w5t2z0fn/HIehGj
	qULblnQ99U5i/c4ILZ0N27Tfjd1BzKKH4Y05OqJafU96lClb+3sAQ1eclB46dyHdze7fxlsIVaX1H
	fhv6AJgA8N6685NOExXFIqF7MW64YdCWYoBg7gAmj28WIYo5TBPxIz8SFC15haVM/S256rFaQPg5x
	zW/bcwant+o30nq7F8j92k4eNpU5AjfyXSb6+NFRmMUoSV2oTiszPDVaT6UTnxNmMST7ICiQSeiwl
	I/zyU1pA==;
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 00/11] Add eDP support for RK3576
Date: Tue,  2 Jun 2026 22:41:33 +0200
Message-ID: <178043288414.700628.1161981255624036929.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601065100.1103873-1-damon.ding@rock-chips.com>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_134159_418248_3FD2E4E6 
X-CRM114-Status: GOOD (  11.59  )
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


On Mon, 01 Jun 2026 14:50:49 +0800, Damon Ding wrote:
> Patch 1-5 are to add missing clock "hclk" for RK3588 eDP nodes.
> Patch 6 is to use automatic cleanup to fix OF node reference leak
>         reported by Sashiko.
> Patch 7-8 are to add the RK3576 eDP node.
> Patch 9-11 are to support the RK3576 Analogix DP controller.
> 
> Damon Ding (11):
>   dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock
>     for RK3588
>   dt-bindings: display: rockchip: analogix-dp: Add per-clock
>     descriptions
>   arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
>   arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
>   drm/rockchip: analogix_dp: Enable hclk for RK3588
>   drm/rockchip: analogix_dp: Fix OF node reference leak via auto cleanup
>   dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
>   arm64: dts: rockchip: Add eDP node for RK3576
>   drm/bridge: analogix_dp: Rename and simplify is_rockchip()
>   drm/bridge: analogix_dp: Add support for RK3576
>   drm/rockchip: analogix_dp: Add support for RK3576
> 
> [...]

Applied, thanks!

[07/11] dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
        commit: 473e50b27b0020ade5fd97ca04d941e448c5659a
[09/11] drm/bridge: analogix_dp: Rename and simplify is_rockchip()
        commit: 709445fb6fc57aa96d48c8492e84ed4b2a9a4b5e
[10/11] drm/bridge: analogix_dp: Add support for RK3576
        commit: 5442cdc38470ecd6b51562d378b6ed852a4d9d45
[11/11] drm/rockchip: analogix_dp: Add support for RK3576
        commit: 7e60c4e19fd3d3f1203fbb1fdd9b2bb1a1201e65

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

