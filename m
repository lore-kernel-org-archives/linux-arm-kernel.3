Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D722C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG8+gWff0Kb6xp+rIzHqMb+FVejaqE783kZJda9sveQ=; b=vPfX1IPRyw4R2xdvTkhMqMQIoo
	tdvAfE76h1R7v5/S2KQtc15/nr2ZlZhflFxX0JAcZFF0vlFNr/kHwEjUB9mV8BIVbWMmp8FOTUdw+
	FC0BUpaQmsPahUKm9nc9kafhbMOG2bhmeCWWSi7zWRQxemNxnSa88WfCJGGbs/eQixP/SoGMpsxpa
	DPgWvSEpZRX0muK1cF10V5UYWG6bIEpcYsIC5seiihl4QBaAmsc2s3StrgdVeiFP0NA+refgLrKqG
	0u2B46IGLCz6NXwHRzJr8W8KxmzB6p/Jetony3QH4kg2HHKR2iT8LNYlehTo6TwqNw8N7/Yxl2RDd
	oKKiW8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAndc-0000000GHwY-1Iy7;
	Sun, 27 Sep 2026 12:05:48 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAndY-0000000GHvf-2er4;
	Sun, 27 Sep 2026 12:05:47 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927120537euoutp019c6217f2f172d5798b71ccad819cde66~ZLAeRpbfb0961109611euoutp01G;
	Sun, 27 Sep 2026 12:05:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927120537euoutp019c6217f2f172d5798b71ccad819cde66~ZLAeRpbfb0961109611euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790510737;
	bh=XG8+gWff0Kb6xp+rIzHqMb+FVejaqE783kZJda9sveQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GfNjHoD7g834Dcl8ZapG6XaA2n8JLOknTzlw7hqfOTAo9LAYC2MsOnIIDyjT8ZLP2
	 l5hKnOlzHW9ec1yco0+wCoH4olnd4//rBjjAIeXDtkaOcBZYd7z4B8k29ZiShT270L
	 oFgdZaGafVbmpg9ZujF/q9SlESV9rt/e7uROppyI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260927120537eucas1p2940a6c268f23ab72fb7eb581fe0bfee8~ZLAd4yZaM2953129531eucas1p2J;
	Sun, 27 Sep 2026 12:05:37 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260927120535eusmtip28a1a6cb637e2a20e2b9abd75be01ad38~ZLAbod2Iw3245532455eusmtip2F;
	Sun, 27 Sep 2026 12:05:34 +0000 (GMT)
Message-ID: <4b1d51e9-1d83-4ad7-ac60-36de54e57bc2@samsung.com>
Date: Sun, 27 Sep 2026 14:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/20] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Dominique Belhachemi <domibel@debian.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260927120537eucas1p2940a6c268f23ab72fb7eb581fe0bfee8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153246eucas1p289987fd8757c89ff865c99b6465708a8
X-EPHeader: CA
X-CMS-RootMailID: 20260915153246eucas1p289987fd8757c89ff865c99b6465708a8
References: <CGME20260915153246eucas1p289987fd8757c89ff865c99b6465708a8@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
	<CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_050545_227780_9E7DC1E5 
X-CRM114-Status: GOOD (  19.87  )
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

Hi Dominique,

On 9/26/26 05:31, Dominique Belhachemi wrote:
> On Tue, Sep 15, 2026 at 11:32 AM Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> +static int starfive_hdmi_phy_probe(struct platform_device *pdev)
>> +{
>> +       ret = clk_set_rate(inno->phyclk, 297000000);
>> +       if (ret) {
>> +               dev_err(dev, "Failed to set default rate: %d\n", ret);
>> +               goto err_del_clk_provider;
>> +       }
> 
> Hi Michal,
> 
> Can we drop these 5 lines?
> When my 4K monitor comes up in mode (3840x2160@30, 297 MHz) the screen
> stays blank.
> 
> When the first real modeset requests a mode whose pixel clock is also 297 MHz,
> clk_set_rate(hdmi_pclk, 297000000) then sees cur == want and does nothing.
> So the pre-PLL is never actually programmed.
> 
> Without these 5 lines inno->pixclock stays 0,
> so the first modeset's clk_set_rate() always runs .set_rate() for real.
> 
> Together with my forgotten fix from May we can have working 4K@30 on the VF2.
> https://lore.kernel.org/all/20260528184145.384114-1-domibel@debian.org/

Yeah, these lines are a problem in another way too. Marek Szyprowski
reported that v4 hangs when everything is built as modules, which
is what made me look at them.

The write lands in registers gated by the controller's system clock,
inside PD_VOUT and the PHY holds neither - it cannot hold that clock
without creating a probe cycle with voutcrg. His config is as follows:
CONFIG_CLK_STARFIVE_JH7110_VOUT=y with the vout subsystem, hdmi
subsystem, controller and phy all as modules so voutcrg is up long
before the PHY arrives from userspace. If nothing is holding hdmi_tx_sys
by then - clk_disable_unused() gates it at late_initcall_sync  and the
write wedges the bus. I could not reproduce his exact failure, but could
reproduce this with fw_devlink=off hopefully this is fixing his issue as
well.

Anyway this code will be removed in v5.

> 
> Best
> -Dominique
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

