Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6A3C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7FGE6AoH/vHRtSya56lZy9yBi0uF/F6VeFnCBB1JOM=; b=Thzw86jcekwobXqgg7I/j+EAyP
	RynB11DlFSF5+FBE/4R/xBderuPjTUaqm3YI8JYJEePnm67zD19LTjNnm/0Wm9OsQPO+KentUPw/7
	IWOJIB6+EJJaTCaA83tM1Y0MI6E3Aw9E5q7JROkwLW+VJ+iczhq78UPZ7lTbC7MPe3thk2yYHIN9F
	CkZbn/uzVi/F1a6oHnsyv5nPd3jnO3eg8YQYSP94zYmu10ybguSGl0mTuj7nH+9zJECfPCHYLydOE
	5aLCgnUs2EHP3xx0/rbvunJLu8p4QzljSlfbepGfm4PNzZGvJ0kQ++g22TgyQYqD29KWoQKmRFsBq
	wmWA25WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAiy-0000000APU2-48SE;
	Tue, 06 May 2025 05:20:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7wi-00000009j2n-2C11;
	Tue, 06 May 2025 02:22:14 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CDEBD257FC;
	Tue,  6 May 2025 04:22:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JOhvh70GMPC; Tue,  6 May 2025 04:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746498124; bh=RzobY4XVcgkDJ0doe1YwuuhTaZEvjGgriYp4dbdw2KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LGeMnYHh13eXvQTo6b7jVRLViK27EHHbt6IGVuHYYHpsIFoAkHvSmHGbngDO7cfAz
	 wAsobVQPuGvv4+GR4WyjeK9NNLXQMp4Ov1vGVlIpk4dtb2liJA3MXhc38OlFxaMU9j
	 oAEUu46pPkg24ZfAdG7sMr8L4CLSgOzPjJMjKhDWKB7y4JjZiJopx5LtZLzPHqWnDT
	 UDaPlS9B27kMd8W9tEo0PLmUBQtLqFyGDJ7dtc2EY/YdGr9pzXMluLcTsHdPUw8yCk
	 xArCj1nQZ7LzlKsbwlRfcStwfM25FiVr7y5bIMV+7hpL7JRqgXEHbYIub5rU9vq1lj
	 C51EJbsxNlGmg==
Date: Tue, 6 May 2025 02:21:48 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v4 2/5] clk: rockchip: Support MMC clocks in GRF region
Message-ID: <aBlyPL_1TFh9lNr3@pie.lan>
References: <20250417143647.43860-1-ziyao@disroot.org>
 <20250417143647.43860-3-ziyao@disroot.org>
 <2737556.Isy0gbHreE@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2737556.Isy0gbHreE@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_192212_983551_4DE90108 
X-CRM114-Status: GOOD (  19.23  )
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

On Mon, May 05, 2025 at 11:39:05PM +0200, Heiko Stübner wrote:
> Hi,
> 
> Am Donnerstag, 17. April 2025, 16:36:44 Mitteleuropäische Sommerzeit schrieb Yao Zi:
> > Registers of MMC drive/sample clocks in Rockchip RV1106 and RK3528
> > locate in GRF regions. Adjust MMC clock code to support register
> > operations through regmap. Also add a helper to ease registration of GRF
> > clocks.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> 
> > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> > index cbf93ea119a9..ce2f3323d84e 100644
> > --- a/drivers/clk/rockchip/clk.c
> > +++ b/drivers/clk/rockchip/clk.c
> > @@ -590,6 +590,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
> >  				list->name,
> >  				list->parent_names, list->num_parents,
> >  				ctx->reg_base + list->muxdiv_offset,
> > +				NULL, 0,
> >  				list->div_shift
> >  			);
> >  			break;
> > @@ -619,6 +620,11 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
> >  			break;
> >  		case branch_linked_gate:
> >  			/* must be registered late, fall-through for error message */
> > +		case branch_mmc_grf:
> > +			/*
> > +			 * must be registered through rockchip_clk_register_grf_branches,
> > +			 * fall-through for error message
> > +			 */
> >  			break;
> 
> please don't create separate structures for specific clock-types.
> Being able to "just define" clock branches is helpful and starting
> to require separate blocks just causes issues down the road.
> 
> For handling multiple GRF sources, I just merged Nicolas' patches for
> handling auxiliary GRFs [0] and GRF-gate clock type [1] .

Thanks for the hint, it does look like a better style which I'll adapt
in the next version.

> So ideally, please base off from there.
> 
> Thanks a lot
> Heiko
> 

Regards,
Yao Zi

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=70a114daf2077472e58b3cac23ba8998e35352f4
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=e277168cabe9fd99e647f5dad0bc846d5d6b0093
> 
> 

