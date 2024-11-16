Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14470D68BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPbam/hqk2QR/wXTH/4/tBGNCnFHw4Qhbd8fGZD6CC4=; b=mtENdRgST1WLVG7oLqG0qcMUb/
	MO/CGc5WTn968cM1O+xOwgMVcWgo/JWZ8O+P3MQ8hHhmA8jTEey5eCDFCNgLSvkocqhkznLkxkwO0
	SWOoBcPzlUFnt8uKiunLZuc7Inua9obMVpKoqhPOCUVF5f40W9tGY0CMfUW/K96gzGWw/upimVu2M
	aCOXbrIh88yOp8WQnAiLbXsLA+/cz7nkpPCh0mODo3btseDYXuUyYbqGr8+j4qvEvGhF6TI2AXNWa
	4sbmrt2RrzDcpQlx5m5j7kFa/nm56B+Q1I87a7b+yOqE9GhZHhhPo8DT2u1myQXv5GDwNRy+GZsIf
	hgfzY4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCP5y-000000069kJ-1cuB;
	Sat, 16 Nov 2024 20:08:38 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCP51-000000069gr-3fGp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 20:07:41 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C2DC389378;
	Sat, 16 Nov 2024 21:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731787653;
	bh=xPbam/hqk2QR/wXTH/4/tBGNCnFHw4Qhbd8fGZD6CC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ejCltd7GiaHHmcgRz64KB54p0NIqVHI/bz37T1H8yzSbZgpBOkY8pUdUXVQvZdpVV
	 Z/3Mhsy+Q17DgxsZC3+gJY9OAyxSH/ETaQn1DpN/ZlY0UEu+FLk+qNBiGoxL8S8r3n
	 cVFjpNYUJuHLMvVo3BK2M/C7Tu9SSPtKWP5WczyXnlsH54w4BXpBoj8dX7LhnbvUvX
	 LRMv6xPTiZFzQEIQi9iyGwvQm1z1cecDVz2iKYE9bnFAkhBEp+IVB/8OyWT4hreqEy
	 eeLPz/TfBIg6qkpEqAm9Ynj9iiYUEqFQEK1k84oT8gU7a814JVdH9+TfkBaE3tuuYm
	 o2ayNt6C6pPkw==
Message-ID: <6bc5b8d7-ff10-4860-ac46-1460a7d850da@denx.de>
Date: Sat, 16 Nov 2024 20:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Anson Huang <Anson.Huang@nxp.com>
References: <20240531202648.277078-1-marex@denx.de>
 <20241112234206.558d5d5e@booty>
 <79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
 <20241113120622.3501db73@booty>
 <130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
 <20241115180936.4ab56be3@booty>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241115180936.4ab56be3@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_120740_238165_C2452736 
X-CRM114-Status: GOOD (  24.12  )
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

On 11/15/24 6:09 PM, Luca Ceresoli wrote:
> Hi Marek,

Hi,

>> Commit 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>> frequency to 506.8 MHz") configures the Video PLL1 to a frequency from
>> which both your panel pixel clock and LDB serializer clock can be
>> successfully divided down.
>>
>> Which panel do you use ?
>>
>> Try this -- Revert this patch, check /sys/kernel/debug/clk/clk_summary
>> and compare it with (I assume) panel-simple.c entry for the panel you
>> use, and notice the disp_pix clock are likely a bit off. That's because
>> the lcdif driver did its best to divide those pixel clock down from
>> 1039500000 set in imx8mp.dtsi .
>>
>> If you really want accurate pixel clock for your panel, you need similar
>> change to 4fbb73416b10 and configure the Video PLL such that the
>> accurate pixel clock can be derived from it. The Video PLL cannot be set
>> to pixel clock, because the LDB serializer clock are either 7x the pixel
>> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL
>> has to be set to 7x or 3.5x pixel clock of the panel, then you should
>> get accurate pixel clock and a working panel again.
> 
> I found that I'm having the same issue that has been discussed in some
> related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
> later LDB tries to set it to 7x that value, failing.

Right, which is solved by configuring the Video PLL to the correct 
frequency in DT up front ... unless you have more than one output 
supplied by that Video PLL.

> I would have guessed your "[PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB
> serializer clock reconfigure parent rate" would have fixed it, and it
> actually allwos the LDB to set a proper (7x) rate for video_pll1, but
> then also the media_disp2 goes to the same rate. Apparently the
> video_pll1 is not propagated to media_disp2. I haven't dug into this.
> 
> So this is not the bug I had suspected about video_pll1 rate
> computation.
> 
> For now my workaround is to set the exact rate to video_pll1 via
> assigned-clock-rates.
> 
> However this breaks the case of using both lcdif1 and lcdif2. For that
> I have added a reparenting of media_disp1 to sys_pll3 and it looks like
> working.

See the patch link in the previous email, if you can use one Audio PLL 
as PLL for the other DISP PIX, then you will be able to achieve accurate 
pixel clock on both outputs. Can you do that ?

> Would you mind keeping Miquèl and me in Cc in following discussions
> about the imx8mp video clocks? We are also facing this topic and we are
> happy to contribute.
Sure

