Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AACC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzwmlZtvFpg2AOez8m/hqypC64fc3dq0u0IIv+1djjI=; b=m7VWKxGwsGPHTosVjh2wg6p6pu
	I00bcAkk+rd0+Ti9639A7TFgL7GX5OtOSx6RUhzHp8nHcQf1bDvHmybq2ekEl7rfCMiAc4CvLDFmx
	gpptlXYR6RbDUomv+ukgDqQO2lFJEMH2qV2pP/cUNvh6Jmn8ORaIFPIp5PUHaGHdz/TOGkCJ96e88
	ZgVih+Um5XmXal6VLvVoPSKMY14z83emfLszldej6X8r6qYuQnS25JeLCS4OjbpzUNsTh8nnxd4m0
	Ec76aiUqN2t1l9xgA7hhQ//Rvm/99i1/FRX6QYWs95ZcxmqqRbU/FXwTWfPgGKLpe6g2xpqOF9pwg
	nkDr4rtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqTP-00000009vwF-1bra;
	Mon, 04 Aug 2025 08:23:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq6g-00000009sUr-2RqZ;
	Mon, 04 Aug 2025 07:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294381;
	bh=IBXZ7nSQOKi0kqZYEQGLEV58gS4Z53xGfxUWv08M4f8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ltw4DBWglDgA5GAc6JaQwwgXfzFmD0Ngc/7DTsm/ftT4OLSHJg+9t+fB2+eEAOp/G
	 xp+aEw/HrAL2sTNdcXPUiePzn99rqHR3k6pLb2VZYwPH7YNbCBg2AJMrCnfcLz8RPk
	 KF4qq4/BN3c9VnNtXCNNd5xGD6LQ8depQpJQdDE/xHgMDu7wM5Rn9koqEGs9/tsFDw
	 9j+pn9SP2d/9O95CZa8fsAtz/TF4LHQJbwtVm7MmUT4fIpLSEMqBcSz3OcsUZklYhF
	 pHMoeA7SJb1Clk5+sVZVN/WpyQeEhL1RkcYvUCFTkyd4ekJRVcTxYAUaRnp7N38Rj/
	 V+GJHXPhHnUjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1135E17E04DA;
	Mon,  4 Aug 2025 09:59:40 +0200 (CEST)
Message-ID: <ab97489a-9493-4005-9a1a-9f88ad970b05@collabora.com>
Date: Mon, 4 Aug 2025 09:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005942_770909_0F45AEDB 
X-CRM114-Status: GOOD (  14.79  )
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

Il 01/08/25 13:18, Julien Massot ha scritto:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Is MT8183 the only one?

if:
   properties:
     compatible:
       contains:
         - const: mediatek,mt8183-mfgcfg
         ^^^^^^^(if it's not just mt8183, this should be an enum)

then:
   properties:
     power-domains: true
else:
   properties:
     power-domains: false

(check if the above is correct, don't blindly trust what I wrote! :P)

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

(if it's not only mt8183, keep the R-b on this commit regardless)

Cheers,
Angelo

> ---
>   Documentation/devicetree/bindings/clock/mediatek,syscon.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
> index a86a64893c675ac134af609b3a49242565db6ad8..1011bc46cfcb97b90b86019e95a7e4bc8a819342 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
> @@ -76,6 +76,9 @@ properties:
>             - const: mediatek,mt2701-vdecsys
>             - const: syscon
>   
> +  power-domains:
> +    maxItems: 1
> +
>     reg:
>       maxItems: 1
>   
> 



