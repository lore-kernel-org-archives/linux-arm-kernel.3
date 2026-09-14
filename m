Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B5EC88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5quPaYobLEbeMOu5MqGjHlx1gGO6GYM4Ci77INCJQLA=; b=FRMspk56hp8Ld5mCS7hKRXPd7p
	goH3oJFU5vqc17H8MHGdZZJQnHWePDEb2pn9wzL8Oqxt06ZMx6ellYPOxnO8E7wYP9pNfXJl29kjx
	xOowBVRDy25fmCWr2zFztvTLwnzPB2wlKEkTr/hZZFtyD1NXhpsNAgXHOGzDc0b8pMV8lDIlkhotE
	6tKAPv9JrwUXi05E4imy+N6Fz68/CXQg5lzcQmJamC8zgoPF+ecutiru3LnsrgLoXrSn9RDyuPpAU
	VQvLliUI2egcxnhhVHd3dx++ll6+BhuxxdkzY33HzGZzhqG+7IlancG8AD2T3bk/v1oxB22ckkkdG
	v8gGh3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CVB-00000004XYt-2pIP;
	Mon, 14 Sep 2026 19:38:05 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CV7-00000004XYD-2ju1;
	Mon, 14 Sep 2026 19:38:04 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914193754euoutp02981281706c8e3139fb5b93cfbd25526a~VRyqJA0Bb0156301563euoutp02C;
	Mon, 14 Sep 2026 19:37:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914193754euoutp02981281706c8e3139fb5b93cfbd25526a~VRyqJA0Bb0156301563euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789414675;
	bh=5quPaYobLEbeMOu5MqGjHlx1gGO6GYM4Ci77INCJQLA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TZKarI6Fzswot9c4aVXuInO0XRxf9GfzbOMlt7onjkVzeL1ZbqAInBvs4atJ/oDi0
	 AUtj/OANEEt5ewm+9Sk6Wb7zy4Ml9/IM+VLkFU4eqSkZba+0uuGUKYDcVqnkJKj0Lt
	 oxPYASnd7d7htQ9OwYLZimxgp4UXzR/izU9JOwv4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260914193754eucas1p1c5e933b8753ce6d75f7c5f34e3bb72d6~VRypvtokG2298422984eucas1p1x;
	Mon, 14 Sep 2026 19:37:54 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260914193752eusmtip20be6a60002305f9f5bc9e993970a2799~VRynuwkCl0478104781eusmtip2P;
	Mon, 14 Sep 2026 19:37:52 +0000 (GMT)
Message-ID: <782506ab-70b8-40a0-98f6-239e74351c1e@samsung.com>
Date: Mon, 14 Sep 2026 21:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260910-amorphous-vigilant-jaybird-d65c4f@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260914193754eucas1p1c5e933b8753ce6d75f7c5f34e3bb72d6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132719eucas1p1c900149ffa1b8771aca238e6441482ee
X-EPHeader: CA
X-CMS-RootMailID: 20260904132719eucas1p1c900149ffa1b8771aca238e6441482ee
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132719eucas1p1c900149ffa1b8771aca238e6441482ee@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>
	<20260910-amorphous-vigilant-jaybird-d65c4f@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_123801_961307_C73FDBF9 
X-CRM114-Status: GOOD (  14.71  )
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



On 9/10/26 10:34, Krzysztof Kozlowski wrote:
> On Fri, Sep 04, 2026 at 03:27:07PM +0200, Michal Wilczynski wrote:
>> The JH7110 embeds a DC8200. The binding requires an SoC specific
>> compatible ahead of the generic one, so add the JH7110 to the enum.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> And this one must be before patch #5 or switch in your patch #5 to
> compatibles-style for children, instead of $ref (see some recent
> display/msm/*mdss* bindings like sm8750).
> 
> Best regards,
> Krzysztof

Thanks, I think I can do both for the v4.

> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

