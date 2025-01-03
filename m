Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA79E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blpJvCE+64DASk+ANElQCfdBW1sWdd6hVDmFs46bAhY=; b=B19VcCKyGJaPxn7/Qr2kuU8Iys
	hqIf6JElNJDiH5BqP6Xz2EiEG60qfVnbwmdfAfTGaUxClYoPWdsxU/8yof3yVX6ydf4LopfnF0fD4
	ujAn2Dunz9ooI6jWoxNEDVvjeBcekaer9Z/2VnNcsEtlMjHL7eV/kWYLAQr5U+0BtTelBymRq04Hn
	VqkAy1TiHovLYCO/yHP0gj377Pe3vn5oVIoVzdL+I/dYoiZCyJrBX9zCV+22F3yEFa7KB39EiS+Ds
	KBKBN9SfG8iIfPxMX2aKkuFHsAZtB4ESxC1hkjpDctmN0IvsJUtsFBXrwJSabKKsESg27+rtz+Q7c
	faxo4loA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdyR-0000000Cbt1-3Nh8;
	Fri, 03 Jan 2025 09:28:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdwo-0000000CbTv-0dU2;
	Fri, 03 Jan 2025 09:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735896383;
	bh=tq0BNbwUpTeePu6kJCwpL8zpGNCOv2kH1BZGfG9AtRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SD7VUe/BqaCP7/jdawDnHvwK3xeH5gwaU4kXML+3nwWJ6Sh6EdlCUO9t0j+L/o2pv
	 tsuknYq5B//KtfX/b4fhaqb9D+LG4sN+UO6ObpmjR+A6dpmdJuYsG45115A4DPg2pQ
	 4BchYpp8X4yZSuCgbeOALEqm4PbcuzONJgezhMKMaWCDYVHrQK8VG+iPPPNeMGV1BZ
	 mOqysn57+PQvlgt6+UA4nt8e/ZM4r2t45CaYzxmjby1v4uUe3DGZxeD9FMQNX8nudq
	 M5S3hp9cYWiW9syrQ5/4A7yqZpvv19ktrSvnXiUn7bMTHlIB0DJ3qn+Vtc1rQtYq+e
	 5U5ciLldwJyyA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75DC317E153E;
	Fri,  3 Jan 2025 10:26:22 +0100 (CET)
Message-ID: <0555fb64-312d-4490-9b03-89fca580c602@collabora.com>
Date: Fri, 3 Jan 2025 10:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Xavier Chang <Xavier.Chang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-2-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250103060035.30688-2-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012626_346514_739CE240 
X-CRM114-Status: GOOD (  12.78  )
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

Il 03/01/25 07:00, Jianjun Wang ha scritto:
> Add compatible string and clock definition for MT8196. It has 6 clocks like
> the MT8195, but 2 of them are different.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml      | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index f05aab2b1add..b4158a666fb6 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -51,6 +51,7 @@ properties:
>                 - mediatek,mt7986-pcie
>                 - mediatek,mt8188-pcie
>                 - mediatek,mt8195-pcie
> +              - mediatek,mt8196-pcie
>             - const: mediatek,mt8192-pcie
>         - const: mediatek,mt8192-pcie
>         - const: airoha,en7581-pcie
> @@ -197,6 +198,34 @@ allOf:
>             minItems: 1
>             maxItems: 2
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8196-pcie
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: peri_26m
> +            - const: peri_mem
> +            - const: ahb_apb

ahb_apb is a bus clock, so you can set it as

- const: bus


> +            - const: low_power

Can you please clarify what the LP clock is for?

Thanks,
Angelo

> +
> +        resets:
> +          minItems: 1
> +          maxItems: 2
> +
> +        reset-names:
> +          minItems: 1
> +          maxItems: 2
> +
>     - if:
>         properties:
>           compatible:



