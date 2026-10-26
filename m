Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4z5h0GK;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uesWt4mf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BKmKriFXy7STc0ChdV4GVkhXybSuVhKoMJ3vCyY6ebQ=; b=P4z5h0GKvG6RCW
	gBOqBOzhnAmB0dXehiYZJwYtbz3qo2/vFX5Ep1xxHIxUog+xMddTeoiwKMVvMgn7ZcqXkFWjvXMV4
	8aGhoZHwBjjNqRp1rDeW83qoi9aiFtKZo5/hhYDCe2bTxWpYsPnMtiP/7ImsqQ6bd8gwXgydZZy8X
	CEUW+f2rWpfd3rTmsMHWNttzUwfGGlfoQTo/zEtmwZPjDkb+SR6LIw2LHBItR6aUuhZUMHMtXJnX0
	IiPLHWYOas48pyD3LTxO88fleSz9pU/vjQ4pevr8YDxKtkSRZpZf6OfvA3uJ4JnO040xSf1KV9wu8
	OBVFkDUUo6mjfOn5MZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGmG-000000021Nd-2mdY;
	Mon, 26 Oct 2026 09:14:00 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGmA-000000021N1-2mtU;
	Mon, 26 Oct 2026 09:13:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026091349euoutp0260a6484cdb132677f41b85104a90e968~iCXwB5PQU2933229332euoutp024;
	Mon, 26 Oct 2026 09:13:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026091349euoutp0260a6484cdb132677f41b85104a90e968~iCXwB5PQU2933229332euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793006029;
	bh=BKmKriFXy7STc0ChdV4GVkhXybSuVhKoMJ3vCyY6ebQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uesWt4mf7L6uH2e2D0Uz0HVRucHuV8HZkP6w6G5X4a91jpvD/uKc3BJqBUmuRXjve
	 GgrdbGaDFfjJl73WiJG4wPNL+OImYScLzZ5eCyyvPV3LlJUGczWGKuH07jKOHSZaRq
	 J4j2ifjZbGqdQZI5IPmFXPvANcfdee4i8r50bnPI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026091348eucas1p104a72aa9c878c637a7ef778613c492a9~iCXvH8nmx3193831938eucas1p1i;
	Mon, 26 Oct 2026 09:13:48 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026091345eusmtip1dd488ccf4592aee32b30711c858f6c13~iCXsMa8873092630926eusmtip1x;
	Mon, 26 Oct 2026 09:13:45 +0000 (GMT)
Message-ID: <943aa2e7-3945-48f9-9a87-9c963f97099d@samsung.com>
Date: Mon, 26 Oct 2026 10:13:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] phy: Add common Innosilicon HDMI PHY helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
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
In-Reply-To: <asEPmpQTwXYADwTk@parshuram>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261026091348eucas1p104a72aa9c878c637a7ef778613c492a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153242eucas1p1394a6a5e272f106b9cab2a0f709ddeb8
X-EPHeader: CA
X-CMS-RootMailID: 20260915153242eucas1p1394a6a5e272f106b9cab2a0f709ddeb8
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153242eucas1p1394a6a5e272f106b9cab2a0f709ddeb8@eucas1p1.samsung.com>
	<20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>
	<asEPmpQTwXYADwTk@parshuram>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_021355_317702_8CBB2635 
X-CRM114-Status: GOOD (  28.07  )
X-Spam-Score: -3.1 (---)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinod,

On 10/3/26 16:22, Vinod Koul wrote:
> On 15-09-26, 17:32, Michal Wilczynski wrote:
>> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
>> where the PHY register block sits in the register space and in which
>> pixel clocks they support, but the pre-PLL programming sequence and the
>> layout of its registers are the same.
>>
>> Add a small library holding that shared part: the pre-PLL configuration
>> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
>> and the pre-PLL register programming. Callers pass a regmap, a register
>> offset for the PHY block, and their own pixel clock table.
>>
>> No driver uses it yet; the users are converted separately.
> 
> Is there anything in phy patches here that has dependency with rest? If
> not consider splitting it up...

The phy patches don't depend on anything else so they apply cleanly
from this series alone. The helpers and the Rockchip conversion are
self contained and the JH7110 phy driver only needs its parent at
runtime not at build time.

I kept everything in one series so a single posting applies and boots on
its own. The patches already target three separate trees and everyone
testing this has been applying the full set splitting would force them
to assemble two postings in the correct order, given that the JH7110 phy
driver build depends on the helpers. The v5 cover letter lists which
tree each patch goes to.

That being said, the helpers and the Rockchip conversion are the two
patches independent of the StarFive work - happy to send those as a
separate series if you'd rather take them that way.

> 
>> +static u8 inno_read(const struct inno_hdmi_phy_pre_pll *pll, unsigned int reg)
>> +{
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(pll->regmap, inno_reg(pll, reg), &val);
>> +	if (ret)
>> +		return 0;
>> +
>> +	return val;
> 
> why not just return regmap_read()
> 
> There is no logic here, nothing. This is really not ideal.
> Also why add a wrapper and not use regmap directly?

The same IP block is used by both Rockchip and the JH7110 but on the
JH7110 the registers sit at a 0x100 offset.That is what inno_reg() is
for.

Dropping the error is wrong though - nd comes from one of those reads
and then becomes the divisor in do_div(vco, nd * 5 ) so a failed read
feeds in 0. I will make it return int and have recalc_rate check.

> 
>> +/**
>> + * inno_hdmi_phy_pre_pll_determine_rate - clk_ops.determine_rate helper
>> + * @pll: pre-PLL instance
>> + * @req: rate request, updated with the rate the PHY would produce
>> + *
>> + * The PHY can only generate the pixel clocks described by its table, so a
>> + * request that does not appear there is rejected rather than rounded.
>> + *
>> + * Return: 0 on success, -EINVAL if the rate is not supported.
>> + */
>> +int inno_hdmi_phy_pre_pll_determine_rate(const struct inno_hdmi_phy_pre_pll *pll,
>> +					 struct clk_rate_request *req)
>> +{
>> +	const struct inno_hdmi_phy_pre_pll_config *cfg;
>> +	unsigned long rate = rounddown(req->rate, 1000);
>> +
>> +	for (cfg = pll->table; cfg->pixclock != 0; cfg++) {
> 
> Is there a chance of null/garbage if we reach end of table? You dont
> know the size of table, and incrementing pointer without bounds does not
> look good to me.

Fair. For now both config tables end with a sentinel, so it cannot
happen. I can add the count of the bounds though.

> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

