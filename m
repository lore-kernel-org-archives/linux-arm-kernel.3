Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9A8C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WtKtiSzYCp277IiLimE78OZqsRgc7cWGLsFATmTw1E=; b=P9wWcOox1NzWUIcCMnINsWoRr9
	EGXK2NrUHtrih7x6SikHdaTTi9B3M56ytD9mxY42M0yO8Teng2451hvFI945QcETbe1PBWVlCvLIr
	L9ZfzPw2ekrtNTzewNkRUZsUigIHwtkqGYzKx2/Rqw8cJIc4i2AWfAHwFNvMsfFG0Sir50bz1l1PO
	f5yDYGy8De3y58daVSzsNuPozP4PZmCRz6RrN3J4daXouXgp6j6ho06TC2xEol0vKErx+07n1MFjh
	nXG0icwVrdLp93D3KQGgOmY3xglVSaSR+65fvcNOwD6cDy8p36HPR6h+KcbGWPPXVJg74S/InVmn2
	GmT6HqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FoP-0000000C4kM-2pGE;
	Thu, 17 Sep 2026 17:22:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FoM-0000000C4jQ-321R;
	Thu, 17 Sep 2026 17:22:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260917172208euoutp0150132b34809348820d8ba580cbf71ba6~WK399rJ9Y0164201642euoutp01M;
	Thu, 17 Sep 2026 17:22:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260917172208euoutp0150132b34809348820d8ba580cbf71ba6~WK399rJ9Y0164201642euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789665728;
	bh=0WtKtiSzYCp277IiLimE78OZqsRgc7cWGLsFATmTw1E=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VOxLMdss8ZyVY8BfR85gXrDrglNJ8tt+tRyIRy34jspUqU6Tu6fH7k4IIRxxxXpHz
	 tavqrMHAweRf1Js/R3ZW2sD9k5Czxee/0C9FYVHtvUe/S5KKtnbQdi/kswqFi00MoB
	 ulGFKEi5ek5Q3N8AhJ1OxMwZsSONTxYMV+bMrihk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260917172208eucas1p2a1f43f12fe05dd5a7cb640c4cec85744~WK39uT1rB0077700777eucas1p2z;
	Thu, 17 Sep 2026 17:22:08 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260917172206eusmtip266a4da637fbe5ad68f6836811ac14898~WK38DTFaD3000830008eusmtip2I;
	Thu, 17 Sep 2026 17:22:06 +0000 (GMT)
Message-ID: <136d6789-2f0c-4a91-ab2d-de3a3f119d5d@samsung.com>
Date: Thu, 17 Sep 2026 19:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] drm: starfive: jh7110: Enable display
 subsystem
To: Joshua Peisach <jpeisach@ubuntu.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Marek Szyprowski
	<m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng
	<zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <DLGBPXP4F8E0.9X0QMZ9GFQVF@ubuntu.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260917172208eucas1p2a1f43f12fe05dd5a7cb640c4cec85744
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61
X-EPHeader: CA
X-CMS-RootMailID: 20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61
References: <CGME20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61@eucas1p1.samsung.com>
	<20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<DLGBPXP4F8E0.9X0QMZ9GFQVF@ubuntu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_102215_362316_7E0EC3D9 
X-CRM114-Status: GOOD (  21.47  )
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



On 9/16/26 02:45, Joshua Peisach wrote:
> On Tue Sep 15, 2026 at 11:32 AM EDT, Michal Wilczynski wrote:
>>
>> Testing
>> =======
>>
>> Tested on a VisionFive 2 v1.3B using modetest.
> 
> I.. got nothing. I did have to manually modprobe the modules, but
> unless I am doing something wrong.. I didn't get anything and modetest
> just gave -2.

Hmm have you also changed the DTB not just the kernel and the modules
(you can also built in everything).

Also note modetest needs -M verisilicon.

If that is not it, could you send "dmesg | grep -iE
'verisilicon|inno|hdmi|vout'" and "ls /sys/class/drm/"?

> 
>> ---
>> Michal Wilczynski (20):
>>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>>       dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-controller
>>       dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem
>>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-syscon
>>       dt-bindings: display: verisilicon: Add starfive,jh7110-dc8200
>>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-subsystem
>>       drm/bridge: inno-hdmi: Split probe out of bind
>>       drm/bridge: inno-hdmi: Allow the register map to come from a parent
>>       drm/bridge: inno-hdmi: Add .disable platform operation
>>       drm/bridge: inno-hdmi: Add .mode_valid platform operation
>>       drm/bridge: inno-hdmi: Make the PHY configuration table optional
>>       soc: starfive: Add jh7110-hdmi-subsystem driver
>>       soc: starfive: Add jh7110-vout-subsystem driver
>>       clk: starfive: jh7110-vout: Allow pixel clock rate propagation
>>       drm/bridge: starfive: Add JH7110 HDMI controller driver
>>       phy: Add common Innosilicon HDMI PHY helpers
>>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>>       riscv: dts: starfive: jh7110: Update DT for display subsystem
>>       MAINTAINERS: Add StarFive JH7110 display subsystem entry
>>
>>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++
>>  .../bindings/display/verisilicon,dc.yaml           |   1 +
>>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        |  95 ++++
>>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>>  .../soc/starfive/starfive,jh7110-syscon.yaml       |   1 +
>>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 ++++++++
>>  MAINTAINERS                                        |  13 +
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 121 ++++-
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi           | 105 +++-
>>  drivers/clk/starfive/clk-starfive-jh7110-vout.c    |   6 +-
>>  drivers/gpu/drm/bridge/Kconfig                     |  11 +
>>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>>  drivers/gpu/drm/bridge/inno-hdmi.c                 | 112 +++-
>>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c          | 297 +++++++++++
>>  drivers/phy/Kconfig                                |   8 +
>>  drivers/phy/Makefile                               |   1 +
>>  drivers/phy/phy-inno-hdmi.c                        | 298 +++++++++++
>>  drivers/phy/rockchip/Kconfig                       |   1 +
>>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 168 +-----
>>  drivers/phy/starfive/Kconfig                       |  20 +
>>  drivers/phy/starfive/Makefile                      |   1 +
>>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 579 +++++++++++++++++++++
>>  drivers/soc/Kconfig                                |   1 +
>>  drivers/soc/Makefile                               |   1 +
>>  drivers/soc/starfive/Kconfig                       |  43 ++
>>  drivers/soc/starfive/Makefile                      |   3 +
>>  drivers/soc/starfive/jh7110-hdmi-subsystem.c       |  73 +++
>>  drivers/soc/starfive/jh7110-vout-subsystem.c       |  82 +++
>>  include/drm/bridge/inno_hdmi.h                     |  10 +-
>>  include/linux/phy/inno-hdmi-phy.h                  |  85 +++
>>  30 files changed, 2337 insertions(+), 188 deletions(-)
>> ---
>> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
>> change-id: 20251031-jh7110-clean-send-7d2242118026
>>
>> Best regards,
> 
> By the way, something weird happenined while I applied the patches
> using git am. Somehow, some were out of order. The 10th patch
> adding .mode_valid tried to be applied before .disable even though
> in the series, the order is correctly set? git would obviously
> fail because the .disable entry did not exist in the header, so I had
> to manually put those in.
> 
> I guess it's possible that something went wrong here? I personally
> pulled the mailbox from the lore.kernel.org mbox.gz file.

I would recommend using b4 shazam instead

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

