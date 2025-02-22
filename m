Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 06:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipBg/kh10xlLbTfqW90iojp94rB9+YUQQbr3OHMLVXY=; b=1AUsqgUjZZt7X/LSiQgZgBWTmw
	NgA2KCLAe9TzivUGf9Xmq2/Sz1z9cX3ynksmrr1cT/MLDpuSBJ1/3VQF9isiMO/qal8ZPI3S0cJ2z
	GSJ/kClWrJ2n3nInvhbtPMHzztT6qr3N+T22wO1YZ0fMo/uUJzpEm0ajt5yc7h0mZaeESOhrHnnxU
	FVigjX/2rbfVK8f0q1cP7baYE4XaQILS6dowP4VYgPSeGig2MlQuPg6m48v1+XqbnE3gz5QXqLExT
	hjfFy/zqf1iQVdXvtYJjYk/GXxvMwp9ursHaTOlpFmLq6S7K4PXqHv6S1ix7TipKAVnP8j7TWJjWP
	EiL9ybOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlipB-00000007WJP-1nMw;
	Sat, 22 Feb 2025 06:17:17 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlinh-00000007WBo-20Sp;
	Sat, 22 Feb 2025 06:15:46 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 9DDFA8A0A03;
	Fri, 21 Feb 2025 22:10:43 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 8445F160036F; Fri, 21 Feb 2025 22:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1740204643;
	bh=ipBg/kh10xlLbTfqW90iojp94rB9+YUQQbr3OHMLVXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uV73Vx4sYe6+zf3jjzrwt+ECW446OAMMZzdBgrfnLwS0sg+2CL30u2R73aA5DxYnl
	 7zGJFwOIa47n8pyBbaz2HQA4i+QHZtwNJYfU2M9GMUIDBsUNddjp4oUf+mneWRdxff
	 SK+LnfDuirmuLBci97mXWUpZILvcPoCSkgWk7tu0=
Date: Fri, 21 Feb 2025 22:10:43 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	simona@ffwll.ch, devicetree@vger.kernel.org, conor+dt@kernel.org,
	robh@kernel.org, maarten.lankhorst@linux.intel.com,
	hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	mripard@kernel.org, tzimmermann@suse.de, andy.yan@rock-chips.com,
	krzk+dt@kernel.org, kernel@collabora.com, airlied@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Message-ID: <20250222061043.GW16911@sventech.com>
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
 <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
 <2425191.NG923GbCHz@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2425191.NG923GbCHz@diego>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_221545_638442_6BA6F6AA 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Feb 18, 2025, Heiko Stübner <heiko@sntech.de> wrote:
> I was more thinking about fixing the correct thing, with something like:
> 
> ----------- 8< ----------
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172f..50faafbf5dda 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5258,6 +5258,10 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
>         if (!clkspec)
>                 return ERR_PTR(-EINVAL);
> 
> +       /* Check if node in clkspec is in disabled/fail state */
> +       if (!of_device_is_available(clkspec->np))
> +               return ERR_PTR(-ENOENT);
> +
>         mutex_lock(&of_clk_mutex);
>         list_for_each_entry(provider, &of_clk_providers, link) {
>                 if (provider->node == clkspec->np) {
> ----------- 8< ----------
> 
> Because right now the clk framework does not handle nodes in
> failed/disabled state and would defer indefinitly.

I've been testing the recent patches Jimmy Hon has posted to add the
Orange Pi 5 Ultra DT and I ran into this bug. The Ultra uses HDMI1 for
the HDMI TX.

This patch successfully fixes the issue I was seeing.

JE


