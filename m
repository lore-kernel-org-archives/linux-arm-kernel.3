Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F75C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u4pmteNiZYFsZdE5aO2Vb1vL6vq7YhBb/NzlG505K0=; b=k0gLO5kHd+EBk/ZQ6y687khUUe
	S2bi03EpNrSd24ljq1Kz2vMqU06W4tRDCeR+Vl/OvuUyWO8g9ax31olMtL6LCPHx9VCtug/giju/l
	E6/bhTIh3SpEjEpLYa028zK1LkhAkpIZ8PhvIMiqmXVlOpxSQ5nnFadmaaqzf4qUMtELvLYPfeTKD
	7WNZMYXidTWbiu98GN6498eLhAC3wdS31QigzcLG21/dX58LkdyygAUMBXDpUiaica2qKKE//ZogP
	cuR0v0bAbd8quC32uVNHa9MUMFUq5JhlRP5TPH5wDI/q5RdBffJFrm/KTd9CYP9HLlUbWrkzvEA6k
	G6YCXq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf01T-00000002rci-1hSo;
	Wed, 01 Jul 2026 18:50:59 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf01Q-00000002rbk-2od6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 18:50:58 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782931843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9u4pmteNiZYFsZdE5aO2Vb1vL6vq7YhBb/NzlG505K0=;
	b=I0/ovo7nLUuCM6+HSchB9d0K3LcYYcf3K8TthQG7aQpr5LnmCvFP34F/FZSgY9GxC0kYXA
	sGJ9ghp4p8qMP/aZdwg+SNcwTk0V4F+uo94vUO0zPQUh2bFBHEwsGol2V73RkJ6JG4EqZZ
	rDZ0avqpfpIQD2dhrbzgC+Zwx5DzaVeszi2tY7IsOUCCAeJdpcsJHabYI31A0VR0xy9j3+
	XpCmlFLe7eSs2T2cIymWx09fJ4W7koYHxQXcbI3GMlMNJ6lly0m8hTbOJOtulfsMlcau6m
	CBH9s4rHl3bVRBMmtuIRwMgJ2aCroYuzyEa+FMs6hKI2UQT2fr35EgoGnAmj7Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 20:50:16 +0200
Message-Id: <DJNGKXB1O3FN.SHBNQSJO8MN0@cknow-tech.com>
Cc: <kernel@collabora.com>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, "Simon Wright"
 <simon@symple.nz>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 0/8] phy: rockchip: samsung-hdptx: Clock fixes and
 API transition cleanups
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Algea Cao" <algea.cao@rock-chips.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_115056_998317_682831F5 
X-CRM114-Status: GOOD (  24.85  )
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

Hi Cristian,

On Fri Jun 12, 2026 at 1:46 AM CEST, Cristian Ciocaltea wrote:
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
>
> The first part of the series addresses clock rate calculation and
> synchronization issues.  Specifically, it fixes edge cases where the PHY
> PLL is pre-programmed by an external component (like a bootloader) or
> when changing the color depth (bpc) while keeping the modeline constant.
> Because the Common Clock Framework .set_rate() callback might not be
> invoked if the pixel clock remains unchanged, this previously led to
> out-of-sync states between CCF and the actual HDMI PHY configuration.
>
> The second part focuses on code cleanups and modernizing the register
> access.  Now that dw_hdmi_qp driver has fully switched to using
> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> and the restrict_rate_change flag logic.  Finally, it refactors the
> driver to consistently use standard bitfield macros.

I built a 7.2-rc1 based kernel with this patch set and used that on my
NanoPC-T6 LTS connected to my 4K TV. The kernel also has the HDMI 2.0 patch
set, so I can get 4K@60 with it. When I then tried to switch to 10bpc with
``modetest -M rockchip -w 86:'max bpc':10`` nothing happened.
But that's expected as my TV only supports HDMI 2.0 and not HDMI 2.1.

When I add ``video=3DHDMI-A-1:1920x1080@60`` to the kernel command line, th=
en it
starts up with 10bpc and I can change to 8bpc and back to 10bpc.
So feel free to add my

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS

Cheers,
  Diederik

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v4:
> - Added new patches to address new findings from Sashiko:
>   * Prevent divide-by-zero when computing clk rate
>   * Fix rate recalculation for 3.2GHz FRL
> - Updated patch "Consistently use bitfield macros" to handle a few more
>   bit operations
> - Link to v3: https://patch.msgid.link/20260611-hdptx-clk-fixes-v3-0-67b1=
b0c00e16@collabora.com
>
> Changes in v3:
> - Replaced div_u64() with DIV_ROUND_CLOSEST_ULL() in Patch 1 (Sashiko)
> - Fixed theoretical usage_count unbalanced issue in Patch 2 (Sashiko)
> - Rebased series onto latest phy/next
> - Link to v2: https://patch.msgid.link/20260511-hdptx-clk-fixes-v2-0-664e=
41379cab@collabora.com
>
> Changes in v2:
> - Collected Tested-by tags from Thomas and Simon
> - Fixed a typo in commit description of patch 1
> - Added a comment in patch 2 explaining why PLL config errors are
>   ignored for rk_hdptx_phy_consumer_get()
> - Added a missed FIELD_GET conversion for lcpll_hw.pms_sdiv in patch 6
> - Rebased onto latest phy/fixes
> - Link to v1: https://lore.kernel.org/r/20260227-hdptx-clk-fixes-v1-0-f99=
8f2762d0f@collabora.com
>
> ---
> Cristian Ciocaltea (8):
>       phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
>       phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing=
 clk rate
>       phy: rockchip: samsung-hdptx: Fix rate recalculation for 3.2GHz FRL
>       phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
>       phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
>       phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
>       phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_W=
M16()
>       phy: rockchip: samsung-hdptx: Consistently use bitfield macros
>
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 266 +++++++++++-----=
------
>  1 file changed, 130 insertions(+), 136 deletions(-)
> ---
> base-commit: 293e19f416fa3f233a2fb013258f7abcb39ad6ed
> change-id: 20260227-hdptx-clk-fixes-47426632f862
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


