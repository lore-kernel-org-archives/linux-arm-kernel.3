Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23300C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j1/5iqjr/RGywJZu38YF3LoGUD7Xwgn18+HpJbhRhg=; b=DOpErySBxsO1xLqblVWzCPxQdL
	4QBb5J4LXMxlMb5NflqD5r4A1TDCMmsbUxDS7LVVhQBa02Gkmc0KtXnXxszGXKoQMNhm3UZvcOlgM
	QINslyK9AOO3yatOcxHDzGbUlA0qW5SpyHpOg1YpOUIQ74kVKH7TmzLLYLsItnqgV3SiRq8iLtJgv
	OIQO2KUVJYiJ/tbSoS8iykqyPJpl4Xehfbso9YNEpWhoEj6J3zxK8Qw87pU/aQflkTMsb37xPZYHY
	b73OjdZQuavq17EUKZz876wIrxJLLL147WBT2Z++GNEn+7WUe+MnENNTuNz3YlQ8y51GSOFD5A9g5
	8h3xjYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpNk-00000002htC-49YD;
	Thu, 09 Jul 2026 14:05:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpNi-00000002hsO-0u6s;
	Thu, 09 Jul 2026 14:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605936;
	bh=22XW+V5XF0iLnR9+YP/enVD7BjheUREeDzPkDNifOPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E2gh5g0kBLcL0tlvGP5nqHnNOU9SxBdqIErJCJ08vhsQe96SukRtXPz0bsZ31RePJ
	 heP8e84zIwb2JQlb79rVImPzBDdiu6WMid3f1JVswovoT0UVHBJsLz5cKuu2mPR3J8
	 vdQ//iJB/Ewhm7tFUxQTIUHJt1y8BCctSOj+xi6+swIyxdqNOj5iVKDsfE0E7WA4ih
	 6xXs5SJkWULzDLLjdRtyMDq1reTPelSSTxCaqElhEmaT0j6DOLIfH1caWtr6/yBa65
	 cqEAblwdhI6KY9XPbbO+UhVkiQTtltwIxsSxaX9BOxMkILfdmYaOolzgtpgKutMal6
	 R0XunXKcYLiSQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84B4D17E01AC;
	Thu, 09 Jul 2026 16:05:35 +0200 (CEST)
Message-ID: <39ba7e37-bdd7-41ab-b72d-fed0bdbfc3b6@collabora.com>
Date: Thu, 9 Jul 2026 16:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/18] dt-bindings: clock: mediatek: Add MT8189 clocks
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Irving-CH Lin <irving-ch.lin@mediatek.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-8-2926da3db6cf@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-8-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070538_406065_32670E46 
X-CRM114-Status: UNSURE (   9.30  )
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

On 7/9/26 15:42, Louis-Alexis Eyraud wrote:
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and subsys (eg. peri, scp,
> ufs...).
> 
> Also, add compatible for frequency hopping and spread spectrum clock
> functionality and reset controller header file for MT8189 UFS reset
> controller support.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Both the commit description and title are misleading, as in, you're not adding
MT8189 clocks, but *both* clocks *and* resets.

Fix it please.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/clock/mediatek,mt8186-clock.yaml      |  15 +
>   .../bindings/clock/mediatek,mt8186-fhctl.yaml      |   1 +
>   .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   5 +
>   include/dt-bindings/clock/mediatek,mt8189-clk.h    | 433 +++++++++++++++++++++
>   include/dt-bindings/reset/mediatek,mt8189-resets.h |  17 +
>   5 files changed, 471 insertions(+)
> 



