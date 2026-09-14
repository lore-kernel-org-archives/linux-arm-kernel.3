Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B37C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PG34NheEGUUklmbyGFWYH3mof2VB5KJYIWGOux9Ay9A=; b=H/7SlgspQwkyrwRDujs5Uhz5iV
	qCu5E1EypWOHQdoA+InWC0C+DYuUqIq6fh1TTzM57tLKXaEoW22e7jfJ4+Kc4l1T2A23nN04lbEzs
	dLX/HDjEXrfeozPVI7L99kjEikSRa7AYldfD793hTQF5Ww0HDouJh6DCNVjMJkUBR9YPco9RV2mw5
	1pSED6zZUwxbwsg8LeIdfgcsVxDhmjGL5eyHolTbn2tiVSDSCZJrgzBncISTMv1W8dATKHLE19feI
	dKba1VKt0tynVgIo1IFRFJph1i1qYPUQgJFGuOVHjgJN9H/K/3WuU33XCIl2hPXJnh9GUgHFRCkzR
	4cd6uwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68wc-00000004DTx-1yJd;
	Mon, 14 Sep 2026 15:50:10 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68wZ-00000004DTR-2l6A;
	Mon, 14 Sep 2026 15:50:09 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914155005euoutp024857e7c81b11d5fa43dd19719ba10c24~VOrvnkiwZ2332323323euoutp02q;
	Mon, 14 Sep 2026 15:50:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914155005euoutp024857e7c81b11d5fa43dd19719ba10c24~VOrvnkiwZ2332323323euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789401005;
	bh=PG34NheEGUUklmbyGFWYH3mof2VB5KJYIWGOux9Ay9A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=B0aPZ9smvU/W3vvxmV5yAM2Ch3FcHIHY/3mfNFpS9oQ99QhxWXbYADiggA+iaBKMX
	 fwhPEzKL7GeEg9ncES+hJrw4lapRIImw5Q7M1TBAKBr+qQfLiMhaaBMFYW5Q3887Ok
	 Gu6F9PZ9ipRUXQfKhJM8CbHNPb8Wb0Ut3yRW0p/A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914155004eucas1p298df2ff60a38fa5dc11e23802962b7f3~VOru0bBrZ2376623766eucas1p29;
	Mon, 14 Sep 2026 15:50:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914155002eusmtip115f5f2e6e07eb44713898bdf244ca8e7~VOrsrfT6w0990109901eusmtip1F;
	Mon, 14 Sep 2026 15:50:02 +0000 (GMT)
Message-ID: <4ba79aa9-6a21-41f6-a088-98207d32a098@samsung.com>
Date: Mon, 14 Sep 2026 17:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] drm: starfive: jh7110: Enable display
 subsystem
To: Dominique Belhachemi <domibel@debian.org>, Maud Spierings
	<maud_spierings@murena.io>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp
	Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal
	Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Andy
	Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Graham
	Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAAvaLCzU_-JdPHSSQS2HxGnrkRk+u_QOZ91SmxcC+nouubCtXA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260914155004eucas1p298df2ff60a38fa5dc11e23802962b7f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915
X-EPHeader: CA
X-CMS-RootMailID: 20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915
References: <CGME20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<ea529e06-2eab-4e3b-92af-ba17de44091c@murena.io>
	<CAAvaLCzU_-JdPHSSQS2HxGnrkRk+u_QOZ91SmxcC+nouubCtXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_085007_960719_2DAA809A 
X-CRM114-Status: GOOD (  20.79  )
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



On 9/6/26 05:55, Dominique Belhachemi wrote:
> On Sat, Sep 5, 2026 at 1:21 AM Maud Spierings <maud_spierings@murena.io>
> wrote:
> 
>> Hello Michal,
>>
>> This new version added some more issues on my fml13v01 board, this time
>> 2 registers in the VOUT_CRG are misconfigured that were correct in v2,
>> namely:
>>
>> 0x295c0004 was 0x00000004 on the previous version but is now 0x00000006
>> 0x295c001c was 0x81000000 on the previous version but is now 0x80000000
>>
>> xx04 sets a slightly different clock divider, but it doesn't seem to
>> matter, display also works with this changed value.
>>
>> xx1c seems to select the wrong clock mux?
>>
>> After correcting 0x295c001c (and the ones that I mentioned before in the
>> hdmitx block), the display comes to life again.
>>
>> Not sure why these are changed.
>>
>> Same here on a VisionFive 2. The dc8200_pix0 mux register (0x295c001c)
> comes up 0x80000000 instead of 0x81000000 (which selects hdmitx0_pixelclk
> from the PHY).
> 
> v3 added CLK_SET_RATE_NO_REPARENT to stop clk_set_rate() from silently
> switching which clock feeds the display, but nothing then assigns the
> parent,
> so it is left on whatever the bootloader selected.
> 
> You could pin the two pixel-clock muxes to the HDMI PHY, is that acceptable?
> 
> dc8200: display@29400000 {
>   +                             assigned-clocks = <&voutcrg
> JH7110_VOUTCLK_DC8200_PIX0>,
>   +                                               <&voutcrg
> JH7110_VOUTCLK_DC8200_PIX1>;
>   +                             assigned-clock-parents = <&hdmi_phy>,
> <&hdmi_phy>;
> };
> 
> I tested this on the vf2.

Thank you Maud and Dominique,


I've tested this as well and it does seem like a good fix, will include
this in a v4.

> 
> Best
> -Dominique
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

