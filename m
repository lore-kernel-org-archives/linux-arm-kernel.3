Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A69606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lo2kDLuH;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nWQGHyd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jgpI6S0BaFwhfvc2kywHp6Ib11nXJqnK3KboerxnZkI=; b=Lo2kDLuHnymZsu
	0E+R70ffQCoQ4h8ABSSTFnVhkmooCB9RQDRgxFyNTcztdFBUurirBw1VufKv1BFvZE4MN+XW3UYKU
	hi0G66FpDTUKN4faZqj/oI3K+i6tCIybaUJ6QmJQkQOXavWNHqPiESsS8S2fw+nueZDOGt2NoG9nz
	ohIiqxaIC4aKZZpT6l9OjZzvGdAqv01JTHCOSIrnc+OzZ0uSVuwvkZOWrpToy1ByKRgVrujsoPNaU
	5P47ACcqlUDVyUp87LGsS00fJ4KowRZLeEaOQ071WFpkQ7MODbk3QUg3lY5E9J4GDszv4DE3GgosI
	y6UkPWX72pnD5L1gY40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLewd-00000004NiM-0T8p;
	Tue, 27 Oct 2026 11:02:19 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLewY-00000004NhQ-2iaj;
	Tue, 27 Oct 2026 11:02:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261027110211euoutp02cbe365840510890b9fa3fbb50e26a3cf~iXfpITuJq1916619166euoutp02O;
	Tue, 27 Oct 2026 11:02:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261027110211euoutp02cbe365840510890b9fa3fbb50e26a3cf~iXfpITuJq1916619166euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793098931;
	bh=jgpI6S0BaFwhfvc2kywHp6Ib11nXJqnK3KboerxnZkI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nWQGHyd3uZO8npHAsI3x3z0bNTOciXEMk5qhW0TGGp6BSguiBE0ZHfqmHLqbvDF0H
	 jAsgFMaUbTRuJ/IN+QVwxm1C8lUaP1wIQPSboyhdv4t1SqODkP1rSY8nYzjAcyepN4
	 5vIolx8QDptEdhqq8Oq8lgHHH5v1igum0Z1fTOLc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261027110210eucas1p200692a459e47eae4b88f5f8620738cfd~iXfokDezE2283022830eucas1p2N;
	Tue, 27 Oct 2026 11:02:10 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261027110208eusmtip1bba8e474a6d53be6ac9f0bd553f1da2d~iXfm8DZVs2613526135eusmtip1G;
	Tue, 27 Oct 2026 11:02:08 +0000 (GMT)
Message-ID: <b9380a0a-49f1-4bb9-a6b7-ca233319b8ad@samsung.com>
Date: Tue, 27 Oct 2026 12:02:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/21] phy: rockchip: inno-hdmi: Use the common
 Innosilicon PHY helpers
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Vinod Koul
	<vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <7069377.kQq0lBPeGt@diego>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261027110210eucas1p200692a459e47eae4b88f5f8620738cfd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103243eucas1p25abf97a357cfae14640092e35fe479fc
X-EPHeader: CA
X-CMS-RootMailID: 20260929103243eucas1p25abf97a357cfae14640092e35fe479fc
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103243eucas1p25abf97a357cfae14640092e35fe479fc@eucas1p2.samsung.com>
	<20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
	<7069377.kQq0lBPeGt@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_040215_284608_8CCDF42D 
X-CRM114-Status: GOOD (  15.16  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 9/30/26 12:14, Heiko Stübner wrote:
> Am Dienstag, 29. September 2026, 12:31:15 Mitteleuropäische Sommerzeit schrieb Michal Wilczynski:
>> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
>> determine_rate implementations are the generic Innosilicon ones, so drop
>> the local copies and use the shared helpers instead.
>>
>> The RK3228 pre-PLL sits at different register addresses, so it keeps its
>> own register level code and only shares the table lookup.
>>
>> The now unused RK3328 pre-PLL register macros go with it, as does the
>> local pre-PLL config lookup wrapper; both call sites already have the
>> TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.
>>
>> The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
>> shared helper logs it too, and reports the actual VCO frequency
>> alongside the rate, which is the value with the 1.4-3.2 GHz constraint.
>>
>> The register writes, their order and the values written are unchanged.
>> No functional change intended.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> Only thing I cannot really make up my mind about, is if this and the
> previous patch should be merged ("move common code from rockchip
> variant to shared helper").
> 
> As I said, can't really decide what would be the better solution ;-) .

I split them deliberately as I don't have Rockchip hardware. It's easier
to verify this commit's correctness and the claims 'no functional change
intended' and 'the register writes, their order and the values written
are unchanged' when split, as the previous commit only adds the library
and this one only deletes the RK3328 copy and calls into it.

> 
> 
> Heiko
> 
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

