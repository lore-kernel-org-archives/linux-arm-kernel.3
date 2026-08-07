Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAEBC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ec8B47hlt2QyQ3zcaph7YMLpbvr6L1xFafTmB3Xq0Q=; b=kF9xDoy0tfufQwx2PAVOM9D5TC
	tuzcNRGavnFwV068NwxqCXpcumq/1/jZb+i1BYuL51v1MgrMZhBE+pafD96mVK9H1ju3Wmn8uQqMp
	0cOcwyYimaQmxsk6+e89BlrvW8gE92IQb3P9NqGyRiZY+iW64j0aL5t0ddM0nShZzw9TQptC6S9xc
	2wYBJ5K5MyJh+GZzx5fTsgUqTYb7+0QjzPZ8muI1FavbAM24YcqjOrzNE3e9ald5hQ6gs33t3KOzo
	tPXORvxeDgtycGTjxyKlykiXJsIfTC/agnWrptvqmgqW0vRuC44u5ImqnOvPofA211GXDWRRU4z3X
	h0VXvamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKJQ-000000084kw-3gdo;
	Fri, 07 Aug 2026 13:08:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKJQ-000000084kJ-1Arn;
	Fri, 07 Aug 2026 13:08:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6A8A60A6F;
	Fri,  7 Aug 2026 13:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB14B1F000E9;
	Fri,  7 Aug 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108115;
	bh=7Ec8B47hlt2QyQ3zcaph7YMLpbvr6L1xFafTmB3Xq0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UhRxO5XZ9xogxBPqw8oQ1LnFNfJE3CVSQSz1JgG1PaT4OoET2Vg2zBI/cDDcA5nY5
	 wlbmhJf180BoYgvfS6nzTEkOzXaZkt/C4y5a64FT35mKZE4XySAkdfEB9xrkVaOphc
	 XqByW0/VNyGsdaxpZGmFdO27YXOnTVGpMO13afXShOizn/rIkQ5nqP9zTzTHf0apYT
	 ql6DuR9Q+VyTmVmlwq65S2Aq/P0wHiv3hNZUjkxyXMuCbOU4mMW1PYYxDO2sr9zdEC
	 3aUsHDM1aZ4qIWmmPonBpNHxTCKwfDLdwbPsGUP5Ib/QX3/hAZpD0Uyrd0RiEcpLKo
	 FyLjNOrqVVJ4Q==
Date: Fri, 7 Aug 2026 15:08:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Niederpr=C3=BCm?= <dubito@online.de>, Simon Wright <simon@symple.nz>, 
	Diederik de Haas <diederik@cknow-tech.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/10] phy: rockchip: samsung-hdptx: Drop
 restrict_rate_change handling
Message-ID: <lywozahedvcvbyqqxp2heg3cv73qpkrz6tu2k2bt24gpybmtxj@fnuvunfvfwh2>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-8-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-8-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:51PM +0300, Cristian Ciocaltea wrote:
> Since commit 6efbd0f46dd8 ("phy: rockchip: samsung-hdptx: Restrict
> altering TMDS char rate via CCF"), adjusting the rate via the Common
> Clock Framework API has been disallowed.
> 
> To avoid breaking existing users until switching to the PHY config API,
> it introduced a temporary exception to the rule, controlled via the
> 'restrict_rate_change' flag.
> 
> As the API transition completed, remove the now deprecated exception
> logic.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

