Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9DC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+Zyx/6f+av6RaItPqWjq5QgqXvSeXSnOyIGM0o0Vks=; b=qqSPV8NFjr+blMdP50DLXOxicv
	irCbgvHbyyXciwPQjzTUNYK9iE5YMaLQawQ1sOuttyyHUbDaI/LKON8wRmEuvdyco3IGFy5XrhJNK
	KVTeuT68wIaONTHsfOugY7SBLh/YpSpyqq3mL24utnNQ0YRoVlCb7ue227WgBNCdr1WhJejl18mCv
	lexX5Ej2mUUDcaNnM6f1QwY2I206oy2NhlrQ5mRgFRVG6J3+v3ND687K3NwrDOpa0JvDJtBKIF8SZ
	8teBvy9+8kDePPCAstaSs+WIiFHgHgWI5Z5eA2o1cHrXOtNdsiGqXg0Q/Uja52zrbgDbY3YM04ecn
	+oykYy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWQu-0000000D67t-2AXh;
	Fri, 04 Jul 2025 02:45:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWMh-0000000D5bz-0rml
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:41:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so457862b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 19:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751596886; x=1752201686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s+Zyx/6f+av6RaItPqWjq5QgqXvSeXSnOyIGM0o0Vks=;
        b=WS6KlBCkx7ZYRp9kUOJI8pWnoYTfNSBvDNMXDqxEqbo+lCOsgVm/yEbCRrV9X7IkhX
         SAdSbbfhc6kq9vr1cvukfwZp4Fn+C4FSKDrsXF1c2cgwPeovq+bmODuFse5AZ1DS73nh
         +sCOT05U5Cp3mAZGafv8rvGbOKwMZ9/BALEpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596886; x=1752201686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+Zyx/6f+av6RaItPqWjq5QgqXvSeXSnOyIGM0o0Vks=;
        b=b5pwRiNkvDH+3uxIXI0IqrXqwzttbyvWDeir2QLDsGptIVmaKFmsSoEorJ/NnUiDP1
         V8XZsVl4doeBPwcH8/V/BXVUc0m14KbOlhcoVho3zvdEy25PQbLJokp6zFEsohNZxKg6
         3+Q7FXBC4EMJGFk6GHmBBlFRz7y7NIYkIW9vsQcRfqUtrRYpUYNdQqzHk58EhKcS41Vp
         CReygNkITvkPXf1AjQ27pfoQE25feE7xpTG8qZm19KnRITyC1KzN0nPp+nLliostUJWz
         eMIponbBzKlXEfi8vqMsRHbRfQP7T3P07MhuC6/W5o/UcFk7uFj4xYMGd6sho3qUARA3
         9b3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/Qf7xG1X1Tlo9cK2z8b4j7yJpeXtEqCrIUBNwP8zWjzKunwTsoxdGHgBmLlswIqfv2Bo2OOeT8TcUhWuGbsHh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy24gaU2HHPoK2Dzg9YZPmBkvJf4ULpVi8CJTuIFLu2rt+qkiJk
	e9cctnWvjoQsEW9FFmQuBRCLPCiujmuZM9SOIj/ts91G2I4mvW8xU6cNyt+AGZFIrw==
X-Gm-Gg: ASbGncv25f3DUeGoI/UGOUz+Eg2/9UQ6RdNR1g6xgeZ2dMrN4QZpiVPDXRkvDsL+erE
	2itQMDdYVWws4lG2ep3jEbWY78yEigH1hmnja3tawD6Z2ncK+XAMMk+KTXzsUY82n61T5vNeJe8
	fRh6RJEuUBIR2wvUlYN2hABx/YIURrIUw3q48oty8mdCYhOjoqGxkapTrqqopCklGBjjVGdtZWQ
	eSiripOIv4VW0e/Qts2Mto6Tbyb1eGOEHeHgRU5AOxEMsap7fQM25tfCbJA3ymaXaumTlGf3PbN
	+99qZFg6i8f9y0qLL+ltzwS5sy9SyVpBpSLKK4vqnA0vEoQSzcChytlLlhWs6bs2YisQZDhrFji
	Ee/hrmtzkH9q8yhdikw==
X-Google-Smtp-Source: AGHT+IGJwgT9LS+NWb/RXEybr1oxVH38tHMmZgho/2z5OGzaAVRcM/LGf9l41KlgP5Y8Fve3tnJckA==
X-Received: by 2002:a05:6a00:10ca:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74ce6027efamr1481354b3a.11.1751596886362;
        Thu, 03 Jul 2025 19:41:26 -0700 (PDT)
Received: from [10.230.3.249] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417dd7esm905211b3a.97.2025.07.03.19.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:41:25 -0700 (PDT)
Message-ID: <df093a8f-916c-4afb-ae53-4736f2368ade@broadcom.com>
Date: Thu, 3 Jul 2025 19:41:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: brcmstb: Add 74110a0 SoC configuration details
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <20250703215314.3971473-4-james.quinlan@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250703215314.3971473-4-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194127_255716_B6D005F1 
X-CRM114-Status: GOOD (  18.98  )
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



On 7/3/2025 2:53 PM, Jim Quinlan wrote:
> Enable PCIe for 74110a0 SoC.  This chip uses a simple mechanism
> to map inbound memory regions.  Both the "ranges" and "dma-ranges"
> are identity-mapped to PCIe space.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

> ---
>   drivers/pci/controller/pcie-brcmstb.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 362ac083e112..bfedab15a162 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -276,6 +276,7 @@ enum pcie_soc_base {
>   	BCM7435,
>   	BCM7712,
>   	BCM33940,
> +	BCM74110,
>   };
>   
>   /*
> @@ -291,7 +292,7 @@ enum pcie_soc_base {
>    * power of two.  Such systems may or may not have an IOMMU between the RC
>    * and memory.
>    */
> -#define IS_NG_PCI_SOC(t) (0)
> +#define IS_NG_PCI_SOC(t) ((t) == BCM74110)
>   
>   struct inbound_win {
>   	u64 size;
> @@ -2046,6 +2047,14 @@ static const int pcie_offsets_bcm7712[] = {
>   	[PCIE_INTR2_CPU_BASE]	= 0x4400,
>   };
>   
> +static const int pcie_offset_bcm74110[] = {
> +	[RGR1_SW_INIT_1] = 0xc010,
> +	[EXT_CFG_INDEX]  = 0x9000,
> +	[EXT_CFG_DATA]   = 0x8000,
> +	[PCIE_HARD_DEBUG] = 0x4204,
> +	[PCIE_INTR2_CPU_BASE] = 0x4300,
> +};
> +
>   static const int pcie_offset_bcm33940[] = {
>   	[RGR1_SW_INIT_1] = 0x9210,
>   	[EXT_CFG_INDEX] = 0x9000,
> @@ -2162,6 +2171,15 @@ static const struct pcie_cfg_data bcm33940_cfg = {
>   	.num_inbound_wins = 10,
>   };
>   
> +static const struct pcie_cfg_data bcm74110_cfg = {
> +	.offsets	= pcie_offset_bcm74110,
> +	.soc_base	= BCM74110,
> +	.perst_set	= brcm_pcie_perst_set_7278,
> +	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
> +	.has_phy	= true,
> +	.has_err_report	= true,
> +};
> +
>   static const struct of_device_id brcm_pcie_match[] = {
>   	{ .compatible = "brcm,bcm2711-pcie", .data = &bcm2711_cfg },
>   	{ .compatible = "brcm,bcm2712-pcie", .data = &bcm2712_cfg },
> @@ -2177,6 +2195,7 @@ static const struct of_device_id brcm_pcie_match[] = {
>   	{ .compatible = "brcm,bcm7445-pcie", .data = &generic_cfg },
>   	{ .compatible = "brcm,bcm7712-pcie", .data = &bcm7712_cfg },
>   	{ .compatible = "brcm,bcm33940-pcie", .data = &bcm33940_cfg },
> +	{ .compatible = "brcm,bcm74110-pcie", .data = &bcm74110_cfg },

Nit: if you need to respin, it might be nice to order numerically here?
-- 
Florian


