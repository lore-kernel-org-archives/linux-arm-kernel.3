Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2295C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltPMBWdpitIAr/1lqIvGJ/KYikU2UivViANg4djpIMI=; b=QF8/NmZctpaWlgZF5+zGSe8L6n
	W2EGBavBnRswg3K4q/UdCfkgm8JF0oOvQ/FjvJOp1y8G/wHeYQMDR3ayU5w+eQQJwmrS+AVy+UTAq
	+U6F7Ih4ryuyRumTMDOgLxKsPszsIGW6KaAS5M5Fdyj4ryeUHX36CMNQh7PPEv+VTyWGy4z17Jdca
	ElLG1223oxF2qPs4Rg7NUHv1+u5+4IGypQYct1Qu2EHwWVx014iFfiPeG8l8MD//vPZu7uwkdgWs7
	1+E9Lqig2Z2eg/ytFmbLoGLXh7qgeEedYpudPhDSqeewyiPprWqN6+jxKHlHtasT/7c/O1IU/s0i9
	XlVgq01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqUZ-0000000GQNA-3zY3;
	Tue, 25 Feb 2025 08:40:39 +0000
Received: from mail-m15574.qiye.163.com ([101.71.155.74])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqT2-0000000GPsS-21Ic;
	Tue, 25 Feb 2025 08:39:06 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c1f11c0c;
	Tue, 25 Feb 2025 16:38:54 +0800 (GMT+08:00)
Message-ID: <478b8972-07b9-483b-a3ef-bdea10c4e4cc@rock-chips.com>
Date: Tue, 25 Feb 2025 16:38:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Simon Xue <xxm@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250224074928.2005744-1-kever.yang@rock-chips.com>
 <20250224-gifted-piculet-of-amplitude-a91ecd@krzk-bin>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20250224-gifted-piculet-of-amplitude-a91ecd@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx0ZTVYZH0NJHRoYHR1ISkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a953c4253a003afkunmc1f11c0c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTI6ERw5EDIOHRYjHB9MLRUU
	EB8aCRlVSlVKTE9LT0xJTEhNQ0pOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIT0xPNwY+
DKIM-Signature: a=rsa-sha256;
	b=WwmsGDczbRBij3SrocnQVsTJaDABZZZ39b0m72Yb797JBiACL+JGw6Mh3E8ANIgWQy+mGdZx1HvDwxj7H+dVw9Oxh3vYiqupcihCxfuvIPmmjPRctB0IS4h3HQCttRJXe8NCQF9KVRQCS4Hotu39VTGVMsIUYNwyZoGzqFwsO40=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ltPMBWdpitIAr/1lqIvGJ/KYikU2UivViANg4djpIMI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_003905_057074_C5B0577C 
X-CRM114-Status: GOOD (  18.84  )
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

Hi Krzysztof,

     Thanks for your review.

On 2025/2/24 17:28, Krzysztof Kozlowski wrote:
> On Mon, Feb 24, 2025 at 03:49:27PM +0800, Kever Yang wrote:
>> rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
>> instead of using GIC ITS, so
>> - no ITS support is required and the 'msi-map' is not required,
>> - a new 'msi' interrupt is needed.
>>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> ---
>>
>> Changes in v6:
>> - Fix make dt_binding_check and make CHECK_DTBS=y
>>
>> Changes in v5:
>> - Add constraints per device for interrupt-names due to the interrupt is
>> different from rk3588.
>>
>> Changes in v4:
>> - Fix wrong indentation in dt_binding_check report by Rob
>>
>> Changes in v3:
>> - Fix dtb check broken on rk3588
>> - Update commit message
>>
>> Changes in v2:
>> - remove required 'msi-map'
>> - add interrupt name 'msi'
>>
>>   .../bindings/pci/rockchip-dw-pcie-common.yaml | 41 ++++++++++++++++++-
>>   .../bindings/pci/rockchip-dw-pcie.yaml        | 19 ++++++---
>>   2 files changed, 52 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
>> index cc9adfc7611c..e1ca8e2f35fe 100644
>> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
>> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
>> @@ -65,7 +65,11 @@ properties:
>>             tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx,
>>             nf_err_rx, f_err_rx, radm_qoverflow
>>         - description:
>> -          eDMA write channel 0 interrupt
>> +          If the matching interrupt name is "msi", then this is the combinded
>> +          MSI line interrupt, which is to support MSI interrupts output to GIC
>> +          controller via GIC SPI interrupt instead of GIC its interrupt.
>> +          If the matching interrupt name is "dma0", then this is the eDMA write
>> +          channel 0 interrupt.
>>         - description:
>>             eDMA write channel 1 interrupt
>>         - description:
>> @@ -81,7 +85,9 @@ properties:
>>         - const: msg
>>         - const: legacy
>>         - const: err
>> -      - const: dma0
>> +      - enum:
>> +          - msi
>> +          - dma0
>>         - const: dma1
>>         - const: dma2
>>         - const: dma3
>> @@ -123,4 +129,35 @@ required:
>>   
>>   additionalProperties: true
>>   
>> +anyOf:
> There is never syntax like that. Where did you find it (so we can fix
> it)?
>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3576-pcie
> This does not belong to common schema, but to device specific. I don't
> see this compatible in this common schema at all.

The common schema covers rockchip-dw-pcie.yaml and rockchip-dw-pcie-ep.yaml,

so I though I should add the if condition here.


>
>> +    then:
>> +      properties:
> interrupts:
>    minItems: 6
>    maxItems: 6
Will add this back.

Thanks,
- Kever
>> +        interrupt-names:
>> +          items:
>> +            - const: sys
>> +            - const: pmc
>> +            - const: msg
>> +            - const: legacy
>> +            - const: err
> Best regards,
> Krzysztof
>
>

