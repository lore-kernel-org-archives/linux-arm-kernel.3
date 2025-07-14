Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92RcswpXKR8nnR4kCkhhdWK401kw6AdsqCyXA6ofXGc=; b=HXluzUFNBaAB6FIa3+qC+c9Qce
	1GPWx5ldA2F53YLzi1hjVEz4F+wMRdgfoEJMDEFjABUjtxEnPR/wnvXJrDJ65bvGr4Qs36zujlhxY
	7fUYwt4yXxqeiSRg7R+j3J1lba8xPGhlOBIRJB9v46PLIeaCf5JnKjRXws+0f25JpDhVBlMSzq1sM
	aizFrbG5rlToJm0eBvs1DVnQCHYQp/i05CLfVbaR+2Bxt+z7V5Y9X8gh/GdSvsb6XorXMRAA18MZQ
	TKG1OKiQ7sAGXwnoMvqRqGBsd2oL6eLh5Yue+kGCwA9eeu0/1oTmLPbHsJMiyYi24NK6cYRitHI9c
	YAdaJ5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKs0-00000002c85-4459;
	Mon, 14 Jul 2025 15:13:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKN3-00000002VYP-2t0D;
	Mon, 14 Jul 2025 14:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752504092;
	bh=Fz/d3uILd9FczXZOmPm/sOeGs9pVqLhoY4n9Jd808lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DWqN3P1gZB07xBDPA94x9vftku2YsQluF4nLOPZsKQcPfqd989ajB1sq6zTe8whzK
	 xhdSryo4lp8qEa3OgV+z5FTy1b09RHlPqknRNW8+hoSLzWhoU9gceoOSa94iVbQDqm
	 4hD2aNkCHMmzrRGd++OSkCz9S6sDoVS23Wo9rBH5PNzubIbgJqQqn4YiHTW8wEuMfw
	 awiyxdXkvilc8qYRSecHdRcWwAH6bhpV4NGj7UsHcUW8UtM6oUVA1BV4MOSIjoRPL2
	 +uXF4GISJoWiXJqa30pZasMQwSxrxczPgw4N2vZwpOVXzvHudLDMkPPRh0MxOr+fWi
	 bYp6HXUxT6pkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B5F017E0DD7;
	Mon, 14 Jul 2025 16:41:31 +0200 (CEST)
Message-ID: <fd561a8c-f1a7-41c2-a686-abc89f5fa555@collabora.com>
Date: Mon, 14 Jul 2025 16:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: cpufreq: Add
 mediatek,mt8196-cpufreq-hw binding
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
 <20250714-mt8196-cpufreq-v2-1-cc85e78855c7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250714-mt8196-cpufreq-v2-1-cc85e78855c7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_074133_883103_51DD9A6D 
X-CRM114-Status: GOOD (  22.60  )
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

Il 14/07/25 16:08, Nicolas Frattaroli ha scritto:
> The MediaTek MT8196 SoC has new cpufreq hardware, with added memory
> register ranges to control Dynamic-Voltage-Frequency-Scaling.
> 
> The DVFS hardware is controlled through a set of registers referred to
> as "FDVFS"; one is a location from which a magic number is read to
> ensure DVFS should be used, the other is a region to set the desired
> target frequency that DVFS should aim towards for each performance
> domain.
> 
> Instead of working around the old binding and its already established
> meanings for the reg items, add a new binding. The FDVFS register memory
> regions are at the beginning, which allows us to easily expand this
> binding for future SoCs which may have more than 3 performance domains.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   .../cpufreq/mediatek,mt8196-cpufreq-hw.yaml        | 86 ++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml b/Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..26bf21e05888646b4d1bdac95bfba0f36e037ffd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/mediatek,mt8196-cpufreq-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek CPUFreq for MT8196 and related SoCs

title: MediaTek Hybrid CPUFreq for MT8196/MT6991 series SoCs

> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +description:
> +  MT8196 uses CPUFreq management hardware that supports dynamic voltage
> +  frequency scaling (dvfs), and can support several performance domains.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-cpufreq-hw
> +
> +  reg:
> +    items:
> +      - description: FDVFS magic number register region

As already said in the other commit, we might just be able to avoid adding the
magic number register region :-)

> +      - description: FDVFS control register region
> +      - description: OPP tables and control for performance domain 0
> +      - description: OPP tables and control for performance domain 1
> +      - description: OPP tables and control for performance domain 2
> +
> +  "#performance-domain-cells":
> +    description:
> +      Number of cells in a performance domain specifier. Must be 1.

The description is redundant and doesn't add any real information, I think you
should drop it.

Bindings maintainers, please, opinions?

> +    const: 1
> +

Everything else looks good to me.

Cheers,
Angelo

> +required:
> +  - compatible
> +  - reg
> +  - "#performance-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cpus {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            cpu0: cpu@0 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a720";
> +                enable-method = "psci";
> +                performance-domains = <&performance 0>;
> +                reg = <0x000>;
> +            };
> +
> +            /* ... */
> +
> +            cpu6: cpu@600 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-x4";
> +                enable-method = "psci";
> +                performance-domains = <&performance 1>;
> +                reg = <0x600>;
> +            };
> +
> +            cpu7: cpu@700 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-x925";
> +                enable-method = "psci";
> +                performance-domains = <&performance 2>;
> +                reg = <0x700>;
> +            };
> +    };
> +
> +    /* ... */
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        performance: performance-controller@c2c2034 {
> +            compatible = "mediatek,mt8196-cpufreq-hw";
> +            reg = <0 0xc2c2034 0 0x4>, <0 0xc220400 0 0x20>,
> +                  <0 0xc2c0f20 0 0x120>, <0 0xc2c1040 0 0x120>,
> +                  <0 0xc2c1160 0 0x120>;
> +            #performance-domain-cells = <1>;
> +        };
> +    };
> 

