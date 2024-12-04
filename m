Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF5BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV+fzjkuUAXvunQLcKjpBbQhkQYXpBIz4gwClKxSjmo=; b=Mpxx5FfBry0fMBWVrRF2HGTNAn
	lq2dI8ehJ53PRujNh1CtsWBcwo1kUJ7VtUXvBx6zPrHOvx7Vt5OlmxzrV2L110tJlOIbh5X2uG0E7
	TcrE9HTPbq8oiveFuaZeo9miJuPxJH7MNfQRqBMAcPEqtKh5/PqkQg0uCYuYMrx3ILjfboqdoSpDw
	OWTkQV9X1Zf02jiOf+bzmfftIJQY71V+wxDW19xAZlUKff/uxJ3uhmor1vUJ1/SQS7V6HRPgFa/Hz
	u+giNZ1qbl5kZu4/H2VAVTmVfX9P9VEsKlsAOTUxiumUIBcBfFwpFjJSsydUlo3CWBnfqHjYpm3Wq
	E2bpB37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzEA-0000000EGEL-3Q41;
	Wed, 04 Dec 2024 23:56:18 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzD9-0000000EG8T-10wJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:55:17 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A3306A073D;
	Thu,  5 Dec 2024 00:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=RV+fzjkuUAXvunQLcKjp
	BbQhkQYXpBIz4gwClKxSjmo=; b=oTge788a+OuVgJY0sV2M8WcxdjJ6F2IvlAd1
	vdMrVNePMOVQ/Y8sTk1alPYuiRaQOLBGgVVsMWHYyaZ/JNswfSO9iwv74HB8hrhR
	5KzFAyqb2rrXr9Wk5JsS48ojEY0EyJ+emz7+zvXcu26IqzW2devn+fAcT8WLoGf+
	DI+05sneW3Sw/WnQ8V9yAMzIP+VIQQdKDUuhGpmG7ZGYIscUKwze3TEkTtO9HZ5f
	VFnYbo5oNa2y8kgTjLj+HYuyTyjSvSYMQVxuyOkkCxP2QByzEJslY1bjRFjj6uKE
	P1M3Z9fr8f/Sv11uls8QYDquYfUH6qHd9Y8d5ZicTjfPS9Surahbc/JZoksBgAg6
	FSbu2dHZcjdHgXBw/eEUPHstfyylrSDVj/HCn/EKhX6cF1sdo0u+c0DOOuSR1VbC
	dCt//H35zQpUzHY4c+MSDmrZioSmMraRVwyVlUliTZrzyc2b5D1FNLjIrdXYVANw
	l8L2dc1GiI+p/IdcX0y3u0kJbyk2sioSrTemWrXBPfuR/B3RxxeThiOQIJKpa4T2
	a2s5wCfpDIj79gkYr7KMRbMUm0GH15wFL2y+ASXL7PyXnLYwU1stH0ZsdDpPtbyR
	4F6XdKUjohYMayzyNu81mXg0jwUMikaCaRPgreXLoQ1mbGIi4xCjgHN3ijMbwCjL
	x9oDtQ0=
Message-ID: <932d4f7a-c9cf-4e48-afd3-476b6c0fbc86@prolan.hu>
Date: Thu, 5 Dec 2024 00:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 0/5] Add support for DMA of F1C100s
To: Vinod Koul <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Mark Brown <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor.dooley@microchip.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Amit Singh Tomar <amitsinght@marvell.com>
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
 <173331833897.673424.223627111827356616.b4-ty@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <173331833897.673424.223627111827356616.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.2]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855627561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_155515_743574_AC66236E 
X-CRM114-Status: UNSURE (   8.46  )
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

Hi,

On 2024. 12. 04. 14:18, Vinod Koul wrote:
> 
> On Fri, 22 Nov 2024 17:11:23 +0100, Csókás, Bence wrote:
>> Support for Allwinner F1C100s/200s series audio was
>> submitted in 2018 as an RFC series, but was not merged,
>> despite having only minor errors. However, this is
>> essential for having audio on these SoCs.
>> This series was forward-ported/rebased to the best of
>> my abilities, on top of Linus' tree as of now:
>> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/5] dma-engine: sun4i: Add a quirk to support different chips
>        commit: eeca1b60138189ef1b9636709e578d0c9e0de517
> [2/5] dma-engine: sun4i: Add has_reset option to quirk
>        commit: 1f738d0c2f67ae3551e4543e8dddbfb44cdd9f53
> [3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
>        commit: 1ad2ebf3be836e62792788f4cd105b30ca9178b6
> [4/5] dma-engine: sun4i: Add support for Allwinner suniv F1C100s
>        commit: 61785259d1eb4e4c4acef8551a2524441683dbf3

Thanks! Though unfortunately, b4 has once again mangled my sign-off, 
leaving it empty :/

Bence


