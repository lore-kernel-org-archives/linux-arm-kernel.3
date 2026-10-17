Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A50CCF2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flMBGY41EGoDAI7ETuBnT4GorZ4XpKflNGkIAnWjCZo=; b=OISmTbDEwVM0/I/RRkMNMHaOf3
	sSM7olQHiNQeeWIT7+YPQLWoKX59K0Bg8s2se83NwjW0BtFQ29YxC259em16ABJJowmkAFWAd/Ggd
	q9ueiI3KIYKP2z3ucdV8qucO6m2VJ2LYO89wB4cITVbxjylawGcR3hddcsTBmtBjU7K8CS9v/ZwPB
	98XRAYmZCG0xLvlT+hO77vZsvX9TS8fz4c0fKFWGOT6/vpDWHomIV739wST/khGnhlo7Du70jH5Q8
	bmG5SUc79oz3KlNNBF2v6sjnoQuRMb++EIWdIK3M+8guI0fP6wDjKIPxe83utbOlVtPVukT47uTgc
	1vwdvR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8IP-000000050QI-1MnH;
	Sat, 17 Oct 2026 17:34:13 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8IL-000000050Oh-1bWX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:34:10 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j6TSV0mK2zKmy7;
	Sat, 17 Oct 2026 19:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792258442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flMBGY41EGoDAI7ETuBnT4GorZ4XpKflNGkIAnWjCZo=;
	b=Ef+FvwkVgR1R1J47Lb1BrSoIDlUiMg0nlJQy3kcjnzuFdESYRY8UPC9BXAIC9uRxpIoN0x
	xgJeIL1jUgnt/B1/fG8dXbzvJg3fanJlzRqMKJbHIbizCVkIbohYG6JLDD9W+RxZJ5XZ4T
	2bH6Pnex+Bzk4QprghZLsa9eUbDQUoDxqWqNJTPAVx1G5j6DFoXy7p1Lp9H3u4pv0AHn6y
	qR6RjY6RnXZwOpF2xT3E7aFwcZ6W1OzF2SCNEhavKrxLud/Z/V/4MarYfPPMK7SN3jVkkB
	42o/kFKnKkezR5P+SC2ReZfbEawiBMyi6NA/cmz4OdAgbPiHNgjQ76I3hPbvuw==
Message-ID: <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
Date: Sat, 17 Oct 2026 19:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1792163045.git.geert+renesas@glider.be>
 <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 19b5cfb291ce5ddd7a6
X-MBO-RS-META: rcst5wwoaupxhedzsu64aao9k3oaqo6b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_103409_609841_8B881169 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
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

On 10/16/26 5:55 PM, Geert Uytterhoeven wrote:

[...]

>   static int r8a78000_cpg_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct r8a78000_cpg_priv *priv;
> -	const struct clk_map *map;
> -	int ret;
> +	const struct clk_map_in *map;

Super-nitpick, use reverse xmas tree ordering here if there will be V5.

>   	map = of_device_get_match_data(dev);
>   	if (!map)
[...]

