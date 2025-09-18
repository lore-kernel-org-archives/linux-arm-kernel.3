Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E068CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2xLGGV6x4k/jHiQxQ4AgKrjwHh5GaWwD98boBUpDGo=; b=hs/5DirGRZgLLwVIES9d7qOA13
	EkFlwIHaAMA8csy/D3mzzNwtOrQir7XQ3hqCClR5bAUBO7fOiMW3WM/1mxfTcc/bfWh+DiAK/3jVT
	ltn6QOQpJEuy3MsQETFPjFgOCG5F0usGWAnrn9qSHnqW7Kdxe8/6yea0L9tayqddG/88DzVovMbCA
	Bs+yvj1rJ70uTvWscmm5Eh0RjYNo6yjgjmQhvdMM9hwVaN7BtNuzRiKqvQY00duff9UeSyk7RWvoB
	o3ZvGQmYT8HYuC5D+rSFekNQrXbo5uXzOYNvvpZ4hVhgWdLtYIrcDFcMGnbHJ80fU+rjJHU3nFjc5
	Dq7+dlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCm3-0000000HD2O-22IR;
	Thu, 18 Sep 2025 11:26:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCm0-0000000HD1c-1hKJ;
	Thu, 18 Sep 2025 11:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758194757;
	bh=Oiap5ri9qx0u1p7+O1mgP8sl6KQHs1DP8B50ceS+q0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FZhAcqWU5e+LkAoukxYOBqTCHOb5EjvvLavJU1mWoe5KZT89kTeIGnRUtP2TEnAr5
	 Xvq506cBFeY5jiepakxzIODaJa4W3lCc+v74ydqn55JmVaTK/uEbCm7Cn1c+P7T4NG
	 sK//IcEObtEXCUOY4Ky0b6INN/YLC06VrmrldwcOtv0gPlzm5tlu+zBDxf6fPbPoBj
	 ykNuq5wn+rl2Mf+dDX35HzobVQoFxPoHG/Xqk2BkW9T7/KXsAENu9J0Hr5Xu/F+yQN
	 u+z8NDroEmdboajlt3sIMeRxWeNaCh1aTp8fJXfoAadynYO5WcHNvNsHS4pvTlXSOm
	 MqQMZqAQZsV+A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28E1017E12C4;
	Thu, 18 Sep 2025 13:25:57 +0200 (CEST)
Message-ID: <c24901fd-fa64-45f6-a6f7-57f09afe9707@collabora.com>
Date: Thu, 18 Sep 2025 13:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
 <89356c625715c984fcdca4e275df1a8747866909.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <89356c625715c984fcdca4e275df1a8747866909.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_042600_618861_E1ACCEEA 
X-CRM114-Status: GOOD (  24.46  )
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

Il 18/09/25 09:01, CK Hu (胡俊光) ha scritto:
> Hi, Rob and Krzysztof:
> 
> On Thu, 2025-08-28 at 16:06 +0800, Paul Chen wrote:
>> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
>>
>> Add mediatek,exdma.yaml to support EXDMA for MT8196.
>> The MediaTek display overlap extended DMA engine, namely
>> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
>> for reading data from DRAM with various DRAM footprints
>> and data formats.
>>
>> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
>> ---
>>   .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml b/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
>> new file mode 100644
>> index 000000000000..eabf0cfc839e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/dma/mediatek,exdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!mjQH2qNKhXsl47d3xz2_Qmo7Wadq5-kD0GJaAVjh7XY8W3NgI_dDpBNinME7NVW1PKdO9IEUsObOTugjypqo5j8$
>> +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!mjQH2qNKhXsl47d3xz2_Qmo7Wadq5-kD0GJaAVjh7XY8W3NgI_dDpBNinME7NVW1PKdO9IEUsObOTugj3hMMPhU$
>> +
>> +title: MediaTek display overlap extended DMA engine
>> +
>> +maintainers:
>> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> +  - Philipp Zabel <p.zabel@pengutronix.de>
>> +
>> +description:
>> +  The MediaTek display overlap extended DMA engine, namely OVL_EXDMA or EXDMA,
>> +  primarily functions as a DMA engine for reading data from DRAM with various
>> +  DRAM footprints and data formats. For input sources in certain color formats
>> +  and color domains, OVL_EXDMA also includes a color transfer function
>> +  to process pixels into a consistent color domain.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8196-exdma
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  mediatek,larb:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      A phandle to the local arbiters node in the current SoCs.
>> +      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
> 
> In MT8196, the data path that EXDMA access DRAM data is shown below.
> 
> EXDMA (dma device) <-> LARB <-> SMMU (mmu device) <-> DRAM
> 
> In MT8195, the data path that OVL access DRAM data is shown below.
> 
> OVL (dma device) <-> LARB <-> IOMMU_VPP (mmu device) <-> DRAM
> 
> These two are similar, and LARB works like a bus.
> 
> In MT8195 device tree [1] (upstream), OVL has an iommus property pointing to IOMMU_VPP,
> 
> and IOMMU_VPP has a larbs property pointing to LARB
> 
>                  iommu_vpp: iommu@14018000 {
> 
>                           compatible = "mediatek,mt8195-iommu-vpp";
> 
>                           reg = <0 0x14018000 0 0x1000>;
> 
>                           mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb8
> 
>                                              &larb12 &larb14 &larb16 &larb18
> 
>                                              &larb20 &larb22 &larb23 &larb26
> 
>                                              &larb27>;
> 
>                           interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>;
> 
>                           clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
> 
>                           clock-names = "bclk";
> 
>                           #iommu-cells = <1>;
> 
>                           power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
> 
>                  };
> 
>                  display@14009000 {
> 
>                           compatible = "mediatek,mt8195-mdp3-ovl";
> 
>                           reg = <0 0x14009000 0 0x1000>;
> 
>                           interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
> 
>                           mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
> 
>                           clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
> 
>                           power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
> 
>                           iommus = <&iommu_vpp M4U_PORT_L4_MDP_OVL>;
> 
>                  };
> 
> In MT8196 [2] (this patch), EXDMA has an iommus property pointing to SMMU and a larbs property pointing to LARB.
> 
>                   mm_smmu: iommu@30800000 {
> 
>                           compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
> 
>                           reg = <0 0x30800000 0 0x1e0000>;
> 
>                           interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
> 
>                           interrupt-names = "combined";
> 
>                           #iommu-cells = <1>;
> 
>                   };
> 
>                   disp_ovl0_exdma2: dma-controller@32850000 {
> 
>                           compatible = "mediatek,mt8196-exdma";
> 
>                           reg = <0 0x32850000 0 0x1000>;
> 
>                           clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
> 
>                           power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
> 
>                           mediatek,larb = <&smi_larb0>;
> 
>                           iommus = <&mm_smmu 144>;
> 
>                           #dma-cells = <1>;
> 
>                   };
> 
> Both hardware data path is similar, but LARB is pointed by IOMMU device in MT8195 and LARB is pointed by DMA device in MT8196.
> 
> Should LARB be pointed by the same device (DMA device or IOMMU device)?
> 
> Or another way to describe these three device?
> 

Read dt-bindings/iommu/mediatek,iommu.yaml for a nice block diagram from Yong Wu:
as explained, the Local Arbiters are arbitering multimedia IP block memory access
between either IOMMU translation or EMI DMA.

This means that the LARBs need knowledge of both the INPUT device (EXDMA) and of
the possible diverting paths (SMI, or IOMMU).

What has been done in previous platforms is a borderline (but imo, acceptable for
multiple reasons) almost-hack, done to avoid having a vendor property on each of
the nodes and to avoid overcomplicating the actual code, as if the LARB is a child
of IOMMU, it can get knowledge of the translation tables (and since LARBs come from
SMI, those also have knowledge of SMI properties).

For this reason, I agree with CK and I would also suggest to still go with LARBs
assigned to IOMMU, as this eliminates all those vendor-specific properties from so
many devicetree nodes, makes code simpler, and also works with PM (larbs need smi
clocked/powered and iommu clocked/powered in order to work correctly), mimicking
the same devicetree structure as the previous SoCs.

Besides - as far as I know, hardware-wise the tree is very very similar anyway.

Cheers,
Angelo

>   
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/mediatek/mt8195.dtsi?h=next-20250626
> 
> [2] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/6253459/2/arch/arm64/boot/dts/mediatek/mt8196.dtsi#3127
> 
>   
> 
> Regards,
> 
> CK
> 
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  '#dma-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - power-domains
>> +  - mediatek,larb
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        exdma: dma-controller@32850000 {
>> +            compatible = "mediatek,mt8196-exdma";
>> +            reg = <0 0x32850000 0 0x1000>;
>> +            clocks = <&ovlsys_config_clk 13>;
>> +            power-domains = <&hfrpsys 12>;
>> +            iommus = <&mm_smmu 144>;
>> +            #dma-cells = <1>;
>> +        };
>> +    };
> 


