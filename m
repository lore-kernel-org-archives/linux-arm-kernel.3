Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B8DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVzrrzbDeBdvXS36mfiV19TOlGxvz78KHj4olurcwO0=; b=FHq6HnfKDnVlfDe+1oBPXNlYe4
	IE3AbKdxp8VC0D1JEOCBlObwrW+DMFcfZWgiXfIiPTbLOd8/IsQ5PN3Zqbx1JG13/jqXjIklQ5gNQ
	/OBWsn7yO+2XZUxtznF5+iRJdNQOXCWVH9GIIv9Z3jEIU63qqm6U8ZLepwnvluZdEdYbvKKWp9fxI
	JZWbz3hpMrDJAhZicphAxfkXmDGHDBPJ+USgayM920/P0eY8JPMcunoJ//vca9brmCUk3TKnVuXGU
	VllGlA0DnECHIYXiA4sfekSJW58iUWCapocFssisndTHeSfNMSvjYUEHs0yKIZR5aX9ZTYFbI3I36
	VdKC0pVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSZ-0000000Cw9p-2QNW;
	Mon, 20 Oct 2025 10:49:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSR-0000000Cvy4-0FTh;
	Mon, 20 Oct 2025 10:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760957380;
	bh=I+YIClIz20Rq9+WEu53+FWQ6hYP5ElMvgvG8sAmQxW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TpewgXYsijilmoIMmUUpMgdkfJFJReq3OTbo1AsZEUEFLxnVnQGhRvGFb/Vm3H2qC
	 qcreg7872Lm/1HwpFl8lf+yx0YL9saa+oQkk5H4PKOC0plGlQWbyiA0VWJ1r5fNOsO
	 Fyf0VbUIOcl6vXDtGNFLnC5vZ2rQ/bNFUlWFTuNLQvgIEuLUDCZK6tEuiMkLqwX1iH
	 ZSbQmZZDUjRIHo+M0zqSY9Op5U7O7VW37zrWlGRv/kKxq+RIvZFxWrh6Ymu4O1fhg0
	 j9cIUprsIA4Qss6fySTinczaWWKxgbA7vY9djbQyYjkQKnCTY20Tgm+9G0Jp6ZxXxS
	 Q7TLYKf780Ipw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E108717E13F9;
	Mon, 20 Oct 2025 12:49:39 +0200 (CEST)
Message-ID: <e22e4d18-a481-4332-8b99-ec8386023091@collabora.com>
Date: Mon, 20 Oct 2025 12:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/13] dt-bindings: soc: mediatek: add ovl yaml for
 MT8189
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251020074211.8942-1-xiandong.wang@mediatek.com>
 <20251020074211.8942-8-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020074211.8942-8-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034943_293768_C82E4046 
X-CRM114-Status: GOOD (  12.75  )
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

Il 20/10/25 09:40, Xiandong Wang ha scritto:
> Add compatible string to support ovl for MT8189.
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Please change the title and write a .. descriptive .. commit description.

dt-bindings: display: mediatek: ovl: Add compatible string for MT8189

Add a OVL compatible for the MT8189 SoC. This SoC's OVL IP is fully compatible
with the one found in MT819.. 5? 6? Which one?

Also do the same for all (well, most of, actually) of your bindings commits.

Cheers,
Angelo

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 4f110635afb6..578e90d0e3b9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -25,6 +25,7 @@ properties:
>             - mediatek,mt2701-disp-ovl
>             - mediatek,mt8173-disp-ovl
>             - mediatek,mt8183-disp-ovl
> +          - mediatek,mt8189-disp-ovl
>             - mediatek,mt8192-disp-ovl
>             - mediatek,mt8195-disp-ovl
>             - mediatek,mt8195-mdp3-ovl
> @@ -44,6 +45,7 @@ properties:
>             - const: mediatek,mt8192-disp-ovl
>         - items:
>             - const: mediatek,mt8188-disp-ovl
> +          - const: mediatek,mt8189-disp-ovl
>             - const: mediatek,mt8195-disp-ovl
>         - items:
>             - const: mediatek,mt8188-mdp3-ovl




