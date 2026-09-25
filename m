Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB390C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qk8Ge4T09jwT9y52eGQdabyjZGZHTm4rz1alzvhqzEo=; b=Po24rCV0jdFfh97h2jH7RwsoJN
	PL0RowGM0EAL6RJgpHtHJC0B4lDnPL9gPtRRFMzdcO/3+1BVF+wBwUWVPS/OrIKu/87Vtj4y4Z8lf
	cKpKKVEV+10Ok4ghJVA7Y5HM3YJRYOZIrhdwnCjz9v7n9hr3zSJuhpmggnxuEJdcCMCAfniP2Vu2H
	NobF4gJFjGzSXNrBfYMJtHx4kIvzdvDO3jcYH6WWHSdCh63iU7aFRqM0cH3iB38/vnAytROuaIYm4
	KZ3XVmb1qrG3cYItE5oa5O5N8IKjvykRNeWocFb6YzB5pn+OatJouimULJsUVYS0y/62VfUqFljrF
	lT9dcBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAD7G-0000000ESdQ-2vCJ;
	Fri, 25 Sep 2026 21:05:58 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAD7B-0000000ESc8-3dCp;
	Fri, 25 Sep 2026 21:05:56 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260925210544euoutp0243b789d72a0438105cf8c503582698ec~YrFfDN8xy1957819578euoutp02g;
	Fri, 25 Sep 2026 21:05:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260925210544euoutp0243b789d72a0438105cf8c503582698ec~YrFfDN8xy1957819578euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790370344;
	bh=qk8Ge4T09jwT9y52eGQdabyjZGZHTm4rz1alzvhqzEo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=CVZtL4P01wXy1+ugGq9YEKbXZtnS2m47LDVMgeukd6k9aRE2PKTyTewEyd+xd1xUz
	 8XKsChiKzsHX6DVkdi2FeObuR4HvgrN2iAyS5sv8IPM1Qj2rOSydSod94INXrs4zeX
	 5ElvIi0+nZqcmJqlTKr1DtZBGumK+I3xrSlCxzds=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260925210543eucas1p2a1839e7e4c6489c00394e4e8a41e38dd~YrFdyTFmE0692106921eucas1p2t;
	Fri, 25 Sep 2026 21:05:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260925210541eusmtip20e82e1fc97240a09f0da0d95e25d9799~YrFcD3k-g2562925629eusmtip2U;
	Fri, 25 Sep 2026 21:05:41 +0000 (GMT)
Message-ID: <1a1a9b49-430b-4218-b27d-e133d488e8d9@samsung.com>
Date: Fri, 25 Sep 2026 23:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
To: Krzysztof Kozlowski <krzk@kernel.org>
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
In-Reply-To: <20260917-mutant-chamois-of-competence-46ca77@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260925210543eucas1p2a1839e7e4c6489c00394e4e8a41e38dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125
X-EPHeader: CA
X-CMS-RootMailID: 20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
	<20260917-mutant-chamois-of-competence-46ca77@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_140554_480615_F34DC8C7 
X-CRM114-Status: GOOD (  27.99  )
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



On 9/17/26 08:51, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:32:09PM +0200, Michal Wilczynski wrote:
>> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
>>
>> This device is a child of the starfive,jh7110-hdmi-subsystem node. It
>> functions as both a PHY provider for the controller and as a clock
>> provider for the variable pixel clock (hdmi_pclk), which it generates
>> from its refoclk.
>>
>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> 
> While I appreciate other people looking at this, I don't think review
> here applies. It was a blanket tag, given to the entire series, with
> exception that it is from newbie, thus I want to ask: was this binding
> REALLY reviewed by Joshua?
> 
> Are the rest of the patches actually reviewed or just "looks good to
> me"? I see no comments from Joshua on v3, v2 and v1, which is usual sign
> of doing review.
> 
> 
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f838fcc238ec7db0a8e794234bdceec36cb6d9e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://protect2.fireeye.com/v1/url?k=1b336029-7ab87530-1b32eb66-74fe485cbfec-59631fa23f87244c&q=1&e=7e2eb06f-7b14-4bec-84e5-b60bb954d80a&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fphy%2Fstarfive%2Cjh7110-inno-hdmi-phy.yaml%23
>> +$schema: https://protect2.fireeye.com/v1/url?k=46734e4d-27f85b54-4672c502-74fe485cbfec-9b6e35999c41723e&q=1&e=7e2eb06f-7b14-4bec-84e5-b60bb954d80a&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>> +
>> +title: StarFive JH7110 Innosilicon INNO HDMI PHY
>> +
>> +maintainers:
>> +  - Michal Wilczynski <m.wilczynski@samsung.com>
>> +
>> +description:
>> +  The PHY portion of the StarFive JH7110 INNO HDMI IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-inno-hdmi-phy
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: Reference oscillator.
> 
> This barely counts as a resource, so usual question: no resources here?
> no MMIO? Even the user of this phy is the block itself.
> 
> This makes me wonder if this should be a device node in the first place
> (instead folded into the parent).

The PHY has no reg because the reg is shared with the controller and
owned by the parent - patch 9 lets the bridge take its regmap from
there.

The user of the PHY is not only the block itself. It is the pixel clock
provider for the whole display subsystem, voutcrg takes hdmitx0_pixelclk
as the parent of its DC8200 pixel MUXes, and while HDMI output is active
it is the only intended source for that clock. The parent has to be
assigned explicitly so the general PLL does not end up driving the pixel
clock, and so a DSI user does not reach the HDMI PHY clock generator.

So it has to be its own node. The HDMI block has two independent
functions with different clock inputs and one of them feeds back into
the SoC clock tree. The PHY generates hdmitx0_pixelclk which voutcrg
consumes the controller consumes pclk/mclk/bclk from voutcrg. Folded
into one node that node is both a provider to and a consumer of
voutcrg which is a cycle in the hardware description, not just in Linux.

> 
> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

