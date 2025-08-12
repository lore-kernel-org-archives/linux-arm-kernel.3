Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0065DCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTvAXVm/KmJ2pPrPEXJ+9Ur9rEmzRCQ86E5VM0COq/I=; b=gDjcqII37nE6xCHkiwPaTvaUzJ
	CA8QjVL9sAcqrQzgtWnV40XB6h8pmaOhb5Ukz2u9iJVk3C1zxUsXsYYg5ksc6LPpg9MXVnNLcmK5W
	JXyk/FcTutZQJsYYD89VjaNErTJZ8r1rAJ+EmFg0B76Ug7/vLXIR6/mJt8YguIgjVgyyLA3WQjIue
	m4UHnEHlWPpZkuzWyREvnS76e0qRvZLipECB6St9T3zvhwmfjsDdHkTK5cVp4ILTJEMmG+bvz6m4s
	PJbThJJy/HNaCE2cP5drERo4Xthet60bCN6iShXSXTK8Qx0LRYy2xxt5nAQ6blwbdyYNbm2/UsANv
	rAOfaREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHi-0000000Alhc-3DG4;
	Tue, 12 Aug 2025 12:39:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkmr-0000000AJBk-1uIU;
	Tue, 12 Aug 2025 08:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lTvAXVm/KmJ2pPrPEXJ+9Ur9rEmzRCQ86E5VM0COq/I=; b=BHehO2ukza9bGsevuX1RsMJZfk
	WG8f2dN1PlR503jrqjhgKiq7Eip2+PTi6dYpps4VSWRpBMwSyK/EnjshNbD/OCzl+UwMsWITbfzq1
	e2aW1clqixucU8uoa+ssL/uH0dN0CSuj+h+zizHBnfeAg4MKnyZj9f1L2WRdlsKWIuG2FtCyUk3mG
	GNjebyx/3d6lyJIF/dAIFsu/XL17TML2B67A4AZNU1E61Q7QJYcpFiok5LLNIOgiofg+uAGvGttOR
	jjaXcQwNPMzJPfcIF19RVQEnL00ZppYUurgnEgvV+V74CLNf6VOdR1PIuWjSZ6Ik7NHPrPBSiJ5yP
	fULVhSPw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkmo-0000000FlGY-0P2Y;
	Tue, 12 Aug 2025 08:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F8A75C658D;
	Tue, 12 Aug 2025 08:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74246C4CEF0;
	Tue, 12 Aug 2025 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754988912;
	bh=D5p6Ycjb+TLwUgdojPUyJJLdzqDj0US7QUkvj3u+Yok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JlhMGelfVzXLX0u23DmiEy1PAw3Li3frBqx+eX25g2ZLSJ8GMcQ8ecdEOlqWLZCL6
	 FmWY7MtUY1zzcXTKk+iZhFJoz+WE6CKzsMnVZz44XgeI8UJPglRLIPpsDhF2H139Kg
	 KME4LaVDVaYTW2bbGDS6PcLbAhYpCmDzTjucEmf6zB7VuKiyTw1DkCePxSmoIju1oW
	 qjITLhU1Y33oxrZhDgUKMQqD/lNTK1J2er71vT0cknB7SiAwN7x4K7w2tEJnUr3+uR
	 8lYIrT8wcVYz6C61WnpgF/oQcCSj4d/T3qDDJqYCf404u7UMXSfzMelXwYl0cch636
	 XFcxElEWFyD8Q==
Message-ID: <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
Date: Tue, 12 Aug 2025 10:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC
 warning
To: Andrea della Porta <andrea.porta@suse.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 kwilczynski@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iivanov@suse.de,
 svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Cc: kernel test robot <lkp@intel.com>
References: <20250812085037.13517-1-andrea.porta@suse.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250812085037.13517-1-andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_095514_543180_C578C907 
X-CRM114-Status: GOOD (  14.20  )
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

On 12/08/2025 10:50, Andrea della Porta wrote:
> The devicetree compiler is complaining as follows:
> 
> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
> /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_nexus' was unexpected)

Please trim the paths.

> 
> Add the optional node that fix this to the DT binding.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> index 812ef5957cfc..7d8ba920b652 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> @@ -126,6 +126,15 @@ required:
>  allOf:
>    - $ref: /schemas/pci/pci-host-bridge.yaml#
>    - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2712-pcie
> +    then:
> +      properties:
> +        rp1_nexus:

No, you cannot document post-factum... This does not follow DTS coding
style.

Also:

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

... and nodes should be anyway defined in top-level and only customized
per variant. I am surprised that DTS patch carries a reviewed tag,
because it was never checked/tested :/

> +          $ref: /schemas/misc/pci1de4,1.yaml
>    - if:
>        properties:
>          compatible:


Best regards,
Krzysztof

