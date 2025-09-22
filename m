Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7167FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MWyvMybaYbQ6YIkMofY68AihnOlOrmM/BcMpGqORHs=; b=WgDmirYGSGFIRHzFbDwO+jm2Ii
	8sgBnkovSFFZyj54PlI1dRHn0gMlwcgsg4tzrrfQ74ReyjmwWpgEJqdbjMS0iPgEfPMKg/G07flvN
	PDIAJGVCTympw5OwvyH2MKpRNR1Uo/VSqdCfyolDi/wpZ4vMG4eAzte4n4fhM49aNpXB3OOMVuhZr
	OiDRlPR6DEJEZD6nzFlXLytoIJMeeZcYtdjPymkz73mlVUJAb/X18cbQ5pii0+zd85jYQHCMPJ5Yh
	8wc++nVNce/NZ6JVtWamcdsetDU5kbTplBZFedojJlxByHGF2TWxjCBpyhWCUjPxvhxX8Lgk8gk+T
	dSBNczBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eo8-0000000ADgb-2AxD;
	Mon, 22 Sep 2025 11:34:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eo5-0000000ADev-2Rx2;
	Mon, 22 Sep 2025 11:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758540847;
	bh=2AUbZaIKOwlzTX82erdBzqXPBetRqjw6oBC7QipEoLM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UnQ+7rt7p6bm8fqURMk8uIg+fzkgNXeN9miaVyrdlgG6UWsCPwLnKOL2V1Aa1VAeM
	 Ei2XHl2RCGyLJb4G2H34kD9Ahkf6uYpG2tLCX4nQbpLWYIvJ/2I9KD7hfWSvS2NuA+
	 LGn0WYE36FG8H9si6wJ+ea+a+h6hZmSACC5lUDdgc62XIojfRQs1toxI/fI99gnSUh
	 lihJExOOpaPYCraAgf5JVjvLxU5h44E19Sa709Q9AvQJLSald+Tty6LuyfRaQ6fhmu
	 eSAayBxov7y0c2JTHmHjSbOQy3Rj14/Qot4lv34MgEEQC4oDuKhGxPQMRKqobE+RXE
	 sRsZnLErho1zA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A2CE317E01CC;
	Mon, 22 Sep 2025 13:34:06 +0200 (CEST)
Message-ID: <40efb310-e63b-47ea-b62b-cc3d614c47b4@collabora.com>
Date: Mon, 22 Sep 2025 13:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com
References: <20250920092612.21464-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920092612.21464-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_043409_799848_227DAA31 
X-CRM114-Status: GOOD (  13.79  )
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

Il 20/09/25 11:25, Christian Marangi ha scritto:
> Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
> binding.
> 
> This differ from the Airoha EN7581 SoC by the fact that only one Gen3
> PCIe controller is present on the SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0278845701ce..3f556d1327a6 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -59,6 +59,7 @@ properties:
>         - const: mediatek,mt8192-pcie
>         - const: mediatek,mt8196-pcie

"an" comes before "en", please move it here.

Also, for consistency with all of the other compatibles, this should be just
"airoha,an7583-pcie": please rename it.

>         - const: airoha,en7581-pcie
> +      - const: airoha,an7583-pcie-gen3



>   
>     reg:
>       maxItems: 1
> @@ -298,6 +299,26 @@ allOf:
>               - const: phy-lane1
>               - const: phy-lane2
>   
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-pcie-gen3

same for this if block, please put it before en7583.

Everything else looks good.

Cheers,
Angelo

> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          items:
> +            - const: sys-ck
> +
> +        resets:
> +          minItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: phy-lane0
> +
>   unevaluatedProperties: false
>   
>   examples:




