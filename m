Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67408C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx1W/uYoTm0BdkabVOlbrhGJirehMcNk67FagdK4oOw=; b=vgNkVfdbmIi+5uEyjDW7fA1TC9
	y1ooskuhFuIclxYA/UyvGbnGWuMmPF8NfVhixw5W3hp3oUZk63raZTjoLaehYAXFCLytIdhewASKE
	DW0eWMb6azTSrH07PAzh6xY+0QfpyI6WF6luxOGIHexCg6+VTkEMpqORdGlAJ6QL1a1gvBdVJhe0a
	All9lkvryNksU69GB0TpdlwCjCN2Eit8a30zRtYxu3fil7OVfVnsnn9PnHpNlZPiwAtZBuDswe2Tj
	Us4ArogZBLbTPlPsQjMM82r3DjFo6ZdubniUDII8muwSIFgsTFQQlC3F1Ft4J5GOR81x5vD6Q58E0
	1wSyqEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpLh-00000002hJV-0TOc;
	Thu, 09 Jul 2026 14:03:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpLd-00000002hID-21sM;
	Thu, 09 Jul 2026 14:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605807;
	bh=ebi8GJI9/lZKf3AA3RpD8Pnml58iLOulJKMht+JSC6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TUtZHbt72S8Pig54Zw6VmDB/bcbKwANwpSrXjwPLGtvugVeQA8Z00o4QYTSB4fe10
	 YVXVfj4ZjvSAGpjvgkqV79NLff1EpHORUAwu9wLsiRQt57TQJE4xXsuZb718T57SK8
	 8Iy4JhaW4ONJi+vACxxPfsOrTQoJ8itTMFLUFGEeE6mrrQT/YPd6ssDjuMBXVNBgNt
	 4daC286mTjy0rJsNp+SGWgKpNSWZwPo5CQtXaH/w2A2qLfNyNlebTQyqKR+Ix7d/2w
	 7xG8U0tjmptEFWaPRx3YBg4UrWT4n+ngkodFq16qAWmN+FbCmrcewWV/v9jtJT+6NE
	 9b4AtLgaD+x/A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE68617E071A;
	Thu, 09 Jul 2026 16:03:26 +0200 (CEST)
Message-ID: <7366c2b4-cd69-44ec-96c2-541c61a2708f@collabora.com>
Date: Thu, 9 Jul 2026 16:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/18] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
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
 netdev@vger.kernel.org
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-5-2926da3db6cf@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-5-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070329_671654_9E2C6482 
X-CRM114-Status: GOOD (  12.55  )
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
> Regroup the MT8188 clock and system clock dt-bindings into MT8186 ones
> to ease maintainability and have common files for several currently
> supported SoC or new future ones, that have the same kind of clock
> controller design.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>   .../bindings/clock/mediatek,mt8186-clock.yaml      | 50 +++++++++++-
>   .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |  6 +-
>   .../bindings/clock/mediatek,mt8188-clock.yaml      | 93 ----------------------
>   .../bindings/clock/mediatek,mt8188-sys-clock.yaml  | 58 --------------
>   4 files changed, 54 insertions(+), 153 deletions(-)
> 

..snip..

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
> index 6733dafbde16..199eac2034f2 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
> @@ -4,7 +4,7 @@
>   $id: http://devicetree.org/schemas/clock/mediatek,mt8186-sys-clock.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: MediaTek System Clock Controller for MT8186
> +title: MediaTek System Clock Controller for  Mediatek SoCs

"for<space><space>MediaTek SoCs"

You should really fix the double space, or if that can be fixed while applying,
that's also fine for me.

So, with that fixed, either by you or while applying...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

