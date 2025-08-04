Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOTf6pV3LzmnQ02iE94Jg1OWbOXSh+fy/hEhVoUC5xk=; b=SQxAFQ6Yb5jWJpjUrZrXmiGzWk
	4Z8dWc5jU46+KWJZHUiKnEkIRNNAqnR2Cw4B2m98Oiiv972y69Ix+8lAa9t4Fxvzr++kXcEV4Fgz8
	hn2OZmgUPk1+jH+igdZa9AhS+huvdAidKsWmwpeNjRjmeGsp28yEQLbrcoJZeXV6krldB+B2US2BN
	ctFBL1jyatMedunWvFHGQYy4rHSMRYZM7ZADv/Pr6Axlu6O+Hcmg8BkfBcDmymc5wnXgnogBgJI4J
	QyhpFPv/QFtMatmGs4N0c7bAYpkceGbNkcwZS+yAASKGRcUKNwnpcfPNX1bXDlbPYJJDHMuVnIRZu
	HXau37tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uix1s-0000000AmGi-2kcZ;
	Mon, 04 Aug 2025 15:23:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwDU-0000000AfwG-1HaC;
	Mon, 04 Aug 2025 14:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754317866;
	bh=4Ew1ywqUKPBO3FXPRYx2L2fqAw4faKlxhYE2ck+WihQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U1/KmwBSdPRaTX6WxZkf4hn47f/lTLATOi+gjmN8tRShdeQG6k1GbH645vXQpUQ1r
	 F0O9OIFMeooX6WriLO7TGJ0Id/o7NYW3Nckzy9qFOMTKBVbUyhYrDvJLvPxlI/7SL1
	 g8kJz86jAvMVSaQXsNV4e3+Ypk9YAR4unNFP/0vR+0cgfJBYv1k0YhZen6NRqFnIQY
	 E1ujbFBjsob7s1cpBuEqgOQnf5nft3fiLvpj39ezlEKqbxzZLJsWPHeQRBwFDaRbt2
	 6ChluzgqH6pXw4UGNDH1TS61z3WMm6twxNOO9LbsJbn7BPPxRWt5IjjWotbSe7OLy0
	 0DcScdV7Pqr4w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A729517E0DD0;
	Mon,  4 Aug 2025 16:31:05 +0200 (CEST)
Message-ID: <3a499702-ba75-4d8a-b38d-222a62bffb34@collabora.com>
Date: Mon, 4 Aug 2025 16:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, wenst@chromium.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 guangjie.song@mediatek.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, netdev@vger.kernel.org,
 nfraprado@collabora.com, p.zabel@pengutronix.de, richardcochran@gmail.com,
 robh@kernel.org, sboyd@kernel.org
References: <fbe7b083-bc3f-4156-8056-e45c9adcb607@kernel.org>
 <20250804083540.19099-1-laura.nao@collabora.com>
 <373f44c3-8a6a-4d52-ba6b-4c9484e2eac1@kernel.org>
 <1db77784-a59a-49bd-89b5-9e81e6d3bafc@collabora.com>
 <e9ee33b0-d6b0-4641-aeeb-9803b4d1658a@kernel.org>
 <00a12553-b248-4193-8017-22fea07ee196@collabora.com>
 <2555e9fe-3bc0-4f89-9d0b-2f7f946632e7@kernel.org>
 <ed0884fc-e43a-4f5b-8701-3645c406b37d@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ed0884fc-e43a-4f5b-8701-3645c406b37d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_073108_505298_B6967CB2 
X-CRM114-Status: GOOD (  24.22  )
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

Il 04/08/25 16:19, Krzysztof Kozlowski ha scritto:
> On 04/08/2025 15:58, Krzysztof Kozlowski wrote:
>>>
>>> So, what should we do then?
>>>
>>> Change it to "mediatek,clock-hw-refcounter", and adding a comment to the binding
>>> saying that this is called "Hardware Voter (HWV)" in the datasheets?
>>>
>>> Or is using the "interconnect" property without any driver in the interconnect API
>>> actually legit? - Because to me it doesn't look like being legit (and if it is, it
>>> shouldn't be, as I'm sure that everyone would expect an interconnect API driver
>>> when encountering an "interconnect" property in DT), and if so, we should just add
>>
>> Why you would not add any interconnect driver for interconnect API?
>> Look, the current phandle allows you to poke in some other MMIO space
>> for the purpose of enabling the clock FOO? So interconnect or power
>> domains or whatever allows you to have existing or new driver to receive
>> xlate() and, when requested resources associated with clock FOO.
> 
> Something got here cut. Last sentence is supposed to be:
> 
> "So interconnect or power
> domains or whatever allows you to have existing or new driver to receive
> xlate() and, when requested, toggle the resources associated with clock
> FOO."
> 
>>
>> Instead of the FOO clock driver poking resources, you do
>> clk_prepare_enable() or pm_domain or icc_enable().
> 
> I looked now at the driver and see your clock drivers poking via regmap
> to other MMIO. That's exactly usecase of syscon and exactly the pattern
> *we are usually discouraging*. It's limited, non-scalable and vendor-driven.
> 

If the HWV wasn't BROKEN, I'd be the first one to go for generic stuff, but
since it is what it is, adding bloat to generic, non vendor-driven APIs would
be bad.

> If this was a power domain provider then:
> 1. Your clock drivers would only do runtime PM.

The clock drivers would have to get a list of power domain that is *equal to*
(in their amount) the list of clocks.
But then those are not power domains, as those registers in the MCU are ONLY
ungating a clock and nothing else in the current state of the hardware.

> 2. Your MCU would be the power domain controller doing whatever is
> necessary - toggling these set/clr bits - when given clock is enabled.

That MCU does support power domain voting (for two power domains in the main
PD Controller, and for all power domains in the multimedia PD controller), and
this is something completely separated from the *clock* controllers.

Just to make the picture complete for you: the power domains that this MCU can
manage are not in any way related to the clocks that it can manage. At all.

> And it really looks like what you described...
> 
> 
> Best regards,
> Krzysztof


