Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZkIZE07OmYSk4DK1TncPSDCSBW3v5Bo/6rKnMUHhA4=; b=t3jYkn7b1SQDg9oEDwvPR6nPn0
	7y9Pcl1QY4XWiAsbk/fHnVGpWx4XPXtsVKS6iPzHLaPPjNfto9FsrAo9dCdlB/4kQHpkuRfDFfFee
	nTDCmmDIXDc4+Cy13cVw1Blv8JEK5Yu9u035AqfddzPgZIjKutGdZFLUACVJQfs1J2EZsgWNvrXDH
	HYZaewoJWeR7553k/h6rxT4IB8SwlZVxKa5ZqzPa5u/LvC+kWCuSkbsU6SP3JNDK7d8p1rPKZZeza
	/0xeL59K4yzW7idheHuK/5reqRTDTXhK4ml5Mc77w4sgHoOeKa1hyU5+1Xd+m0cjFFEJEqGWA+nQJ
	jQaDOalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FYH-0000000C2DY-1laM;
	Thu, 17 Sep 2026 17:05:37 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FYE-0000000C2CZ-2QvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:05:35 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cc4aa0248cfso226547a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664734; x=1790269534;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xZkIZE07OmYSk4DK1TncPSDCSBW3v5Bo/6rKnMUHhA4=;
        b=2fldmeVMkq9kP8AS8yNG9uoIqbp+PyHZXRLWEK0zKKk38/TCFPChfz+dDrBKQcvzHv
         beGq7XpIsaA0fSa1qcuLT6WHaM59Wmlp4lD8TTkmCr50PDwrPEnCOBed1qKk78QsPode
         H5TftLP9VVCXA2fAFTCEKdGnSMMmMwzG53/ej2D6Bnk12kZPMvVUchu53uves+EUL406
         bZn//qwR1cV9a3TY7cn9VXrTD+Q5UJCjzIc/4fRMlPOE5cLmmZ04lnQ42UjzPJ1zKV2a
         uyamI911tAcAqZT4lmL53aCUVYXrl7nwjUL6ybNZ9/OmWhmwZXoF0WsTp5Q7TErpd/Bf
         t2iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyc+6m8RELOhBrdWTOBmmhH1KOSb1fO5auRfOFeFiGC3fq6vx5ctSmsB7sNLJOpCF49PhN0znUTfFYhMOc2BcU@lists.infradead.org
X-Gm-Message-State: AFuF++mmF4CWaI0VNmKXkm8GQE/48VUSH69Ad7lRK2MKh0B3MiHXltqR
	6KGdxegNx6oVRZInaOWBX6qXsNWKchZ1HT9QztaHtoi+LOY4s6EQImcioLF8hvKPu78btdZberH
	tKTyI4QphRwPmC9jJnN8RSb9nbGiOjq1GlOL85KDc9mB6qNAwkASOLHD7ZIRTAvSbn5h8zYpbNr
	LP9852fv2o4TFIjiooopOvDZSMCh0OMPSTE4r1GPBKa05yaOxF9uhg33bcvtqo5MgojG/MDyCww
	vqJHdMfBnhnvy5sIshZ4oTwVIJdWPXBL4w=
X-Gm-Gg: AYBFou1gg/vBtS6yWFSjO1b6puPQa/bZTU3/alJU7BfLq3XrkR+1BmvfaAB4vfcN0kE
	hWiRHIM3wvxGamWNyH+7MCFs1ZyC+TvRzSNCw9/fG1efep4KhhWhgHmHNvmA9ozlmht6CZYcar8
	rLzC3YZxzswrfnZSRgbaGmiPKKa4oXdKkzNG7GtvbkVJVq5j03rsAvtFJ+h/4RL4PjxTRx11jmC
	MREADLjvTRpK7owlYTcGjzyjb/co3HsyNvXZZ63fwPJ9Q9+cbX23KAHdbCDciDv9KjBlUarEhpy
	70EpxnuIF/ZLkwIjDcvcfPz2w91B8StyxYDt9ntXykasqxH2mizGCvtdsljRvmTGbshO5N8I2St
	luErTKKgc2gb/7dBtvTrUDPx1qTuMFYVeQzq44Qvk2BWOhSDk/15oKnN/8MqJtze/afBO8WKQ/K
	Kiry9VtuvRzsn537qV7gYduMh+TJLs8x9oyCG2PC3n
X-Received: by 2002:a05:6a21:110:b0:3dd:85a9:55b9 with SMTP id adf61e73a8af0-3dd85a962bdmr2115511637.36.1789664733451;
        Thu, 17 Sep 2026 10:05:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc50acd606esm2809469a12.5.2026.09.17.10.05.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:05:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so23310425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664731; x=1790269531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZkIZE07OmYSk4DK1TncPSDCSBW3v5Bo/6rKnMUHhA4=;
        b=BgN3rzNc15R9CZ4DOXPHFi+CU6A2BOKklLtWHCZGnC0kMJ9TekZ0R8GW0gmE8ff7Zn
         MZLZenwWVowAR/A6zet2gqPi6cGDvn0lK7TNzhPRSWk3c8WLAbcK0CU9clkvyIavyiwD
         ObPjaWBYrkIFtyRjifebqdzGs3RezIHNfUk9M=
X-Forwarded-Encrypted: i=1; AKwUvBw7CeR1lkmgybLUUvtrxoQ2auIyFXIts5/U6P8pu8+vhglSV8smvui85fksgoHEWltHVewvbe0URb5StyVzhy8i@lists.infradead.org
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr153789325ad.2.1789664731367;
        Thu, 17 Sep 2026 10:05:31 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr153788385ad.2.1789664730579;
        Thu, 17 Sep 2026 10:05:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb7c87sm29904485ad.34.2026.09.17.10.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:05:29 -0700 (PDT)
Message-ID: <6ce4208a-3869-4eea-9ae1-06985c9774e7@broadcom.com>
Date: Thu, 17 Sep 2026 10:05:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] PCI: brcmstb: Put max_burst_size setting in
 cfg_data
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-12-james.quinlan@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20260911233541.1650895-12-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100534_619642_DA8D5876 
X-CRM114-Status: GOOD (  22.67  )
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

On 9/11/26 16:35, Jim Quinlan wrote:
> Rather than ascertaining the max_burst_size setting by comparing different
> SoC IDs, specify the setting in the config_data structure for each SoC.
> Also add a comment on each SoC's encoding of this field.
> 
> Note: Previously, the max burst setting used for the 4908 Soc was 2.
> However, it appears that the setting of 2 is illegal for this chip.  Set it
> to 0 as (a) this is the safest (smallest) choice and (b) the 2 was probably
> interpreted by the HW as a 0 anyway.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>   drivers/pci/controller/pcie-brcmstb.c | 29 ++++++++++++---------------
>   1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 047783e33ae4..8bca98e6f5fa 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -317,6 +317,7 @@ struct pcie_cfg_data {
>   	u32 flags;
>   	u32 quirks;
>   	u8 num_inbound_wins;
> +	u8 burst_setting;
>   	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>   	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>   	int (*post_setup)(struct brcm_pcie *pcie);
> @@ -1153,7 +1154,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>   	void __iomem *base = pcie->base;
>   	struct pci_host_bridge *bridge;
>   	struct resource_entry *entry;
> -	u32 tmp, burst, num_lanes, num_lanes_cap;
> +	u32 tmp, num_lanes, num_lanes_cap;
>   	u8 num_out_wins = 0;
>   	int num_inbound_wins = 0;
>   	int memc, ret;
> @@ -1188,20 +1189,6 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>   	/* Wait for SerDes to be stable */
>   	usleep_range(100, 200);
>   
> -	/*
> -	 * SCB_MAX_BURST_SIZE is a two bit field.  For GENERIC chips it
> -	 * is encoded as 0=128, 1=256, 2=512, 3=Rsvd, for BCM7278 it
> -	 * is encoded as 0=Rsvd, 1=128, 2=256, 3=512.
> -	 */
> -	if (BFLAG(pcie, IS_BMIPS))
> -		burst = 0x1; /* 256 bytes */
> -	else if (pcie->cfg->soc_base == BCM2711)
> -		burst = 0x0; /* 128 bytes */
> -	else if (pcie->cfg->soc_base == BCM7278)
> -		burst = 0x3; /* 512 bytes */
> -	else
> -		burst = 0x2; /* 512 bytes */
> -
>   	/*
>   	 * Set SCB_MAX_BURST_SIZE, CFG_READ_UR_MODE, SCB_ACCESS_EN,
>   	 * RCB_MPS_MODE, RCB_64B_MODE
> @@ -1209,7 +1196,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>   	tmp = readl(base + PCIE_MISC_MISC_CTRL);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_CFG_READ_UR_MODE_MASK);
> -	u32p_replace_bits(&tmp, burst, PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
> +	u32p_replace_bits(&tmp, pcie->cfg->burst_setting,
> +			  PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
>   	writel(tmp, base + PCIE_MISC_MISC_CTRL);
> @@ -1961,6 +1949,7 @@ static const struct pcie_cfg_data generic_cfg = {
>   	.perst_set	= brcm_pcie_perst_set_generic,
>   	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
>   	.num_inbound_wins = 3,
> +	.burst_setting	= 0x2, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */

Not sure this one is much of an improvement, especially if we end up 
repeating the comment, also there is inconsistent decimal versus 
hexadecimal.
-- 
Florian

