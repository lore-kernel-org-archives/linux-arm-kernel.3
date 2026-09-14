Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E53C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+S2Onhngb3QQb5M8d8baXat0zr7TDEklDXfpK9pyK4=; b=k46QqPtwO6nVtkyv9YiY3gGzG/
	BiYrqAFfmQgbXEEE+NlEubp/iA1C+DWviY9XRDpFpCpvY2WH15we6GxKpnqAeu0ijHb+4uYfcOUZG
	0+F/jQehae4fXlvYB8OVVahlukzbv6v1oqVZy/7yTlV9CxzPvajR+o4K7C2FhHe6HRQhoXstNh9hD
	J8f+kM+fPKt3Jq5+LcHxx3AN75kwLWf3Lx+LMvy/SPYRtMcUnwSbxeNcXVVedeOIMy9olbfJIRIE1
	ycZ5QyI9RIRQ7Yud1i8K4pkbkU48ISLdwNW04GFdPTywVFUmybc1hAiW4GiZpPcGo//CRlrVf34hH
	dlydvzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x672o-00000003qxE-1dXb;
	Mon, 14 Sep 2026 13:48:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x672m-00000003qwC-18eW;
	Mon, 14 Sep 2026 13:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789393702;
	bh=sqm232wL8WeQzLs2jOKgbSNxH7ke3GuXlQGXo8yJQk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ppLT7Hd2WVLs8uYNpUu5s+TTm1uVg/17FO1N+akh3gXmRprLckeYvUZYclQ8A+ej/
	 5b61o4zyKcZEKYqp0BGPsfADvf8U4o4/S0Tv4pgFh7WaC9zEgTewYSj1jJ7QvioVq9
	 8r8MgxyjLBD3w2d7dQeqcStjxltDHSkmyBt4ptaAUnbaNWqNTSUMHUwbq4BVspZaep
	 pfyoJhfhorVIiyEfYSRn7yqRgmWC1W4ObKxBknAPZMxEWmK5vADCBE2xvlLj1XW+RQ
	 U5tEP42bvP++JeIRK2Cgsut81NOnNfaR+nSPPD+B5FrOrLBMgmVb8acscT5rCO6aRb
	 gcH0RHmaow1XQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5676717E05D3;
	Mon, 14 Sep 2026 15:48:21 +0200 (CEST)
Message-ID: <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
Date: Mon, 14 Sep 2026 15:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
To: Brian Masney <bmasney@redhat.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, kernel@collabora.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Irving-CH Lin <irving-ch.lin@mediatek.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
 <aqf6NH-xrMtCQppv@redhat.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aqf6NH-xrMtCQppv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064824_475080_9E7A6214 
X-CRM114-Status: GOOD (  14.24  )
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

On 9/14/26 15:44, Brian Masney wrote:
> Hi Angelo,
> 
> On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
>> On 7/30/26 20:22, Brian Masney wrote:
>>> Should there be a new MAINTAINERS entry added? There's currently 221
>>> files under drivers/clk/mediatek/ and there's currently only one
>>> mediatek maintainer entry:
>>>
>>>       MEDIATEK MT6735 CLOCK & RESET DRIVERS.
>>>
>>> Is there anyone from mediatek (or elsewhere) that could act as a clk
>>> subsystem maintainer similar to what the other SoC vendors do? Help with
>>> reviews, send in pulls, etc?
>>>
>>
>> I may be able to step in, but I have to check if it's feasible, time-wise, on
>> my side.
>>
>> Though, that won't happen until mid-September... because, well, I'm about to go
>> on holiday (in a few days from now).
> 
> I'm checking in to see if you would be willing to be clk submaintainer
> for the MediaTek clk drivers?
> 
> Brian

Time is lacking, but I get that one hour from me is more than zero, which is
a good thing.

Let's do it.

Cheers,
Angelo

