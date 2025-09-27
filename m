Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A660BCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc5vo+Rb9ClONgmTiHxfZM7CLOGpUGWCRjHz3GTHRlQ=; b=XO2BQzO65j4OxxdB1fWy4QOmsY
	vkVgHSlncg65rj7dOcbniFIcWVzXNUQGEWatYDeztu2indZzdaMfcv9k93riKZhxk7c3891YDswwZ
	NrS8Vt3DNOeoxw2TuVNGHc3YkXZuraAnOwc0U9HcuXzSa4H+kk5CCSqCBUu4Y43LMnwiadqj11k+t
	HTeEKk8QeKMe2Yte2lJJnUzJgwMGI/2X/Xwo/qgo8PhiLt6c5grT1etB6qKLW5OLhBK3rQapHrXsk
	x8iJ7XxIiDBOBH34h06YlzcdMDZv/YECfsjf/5UvxFO30eRGsWe1WZxM5yHid/mu1G/hXy4kwvgLH
	xUdsUYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2c5m-0000000CXbW-24Dy;
	Sat, 27 Sep 2025 21:04:30 +0000
Received: from mail-oa1-x61.google.com ([2001:4860:4864:20::61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2c5j-0000000CXZa-1v6g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 21:04:28 +0000
Received: by mail-oa1-x61.google.com with SMTP id 586e51a60fabf-30cceb749d7so1543878fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 14:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759007065; x=1759611865;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oc5vo+Rb9ClONgmTiHxfZM7CLOGpUGWCRjHz3GTHRlQ=;
        b=XNK9AlRKgReohgFlxs4RIsO1JMp3qkDl2gnJpQXnlb9xX5VPh0cVv03zrjVrgw5ecL
         p5gVwTVv9exRT551s4PpX30IXm0xIuzzabDDj2EEysrkFsnzQYLWXQQNdBt9kx9brQOH
         8BobB49LCk3nz3ERIlcQQoH7EAs4BppPb+5s4dF+cIM++xNpnUMVgEgXqcbxi6S1cXwj
         yuTU7IdAbeg4WBecsL7UcpdtxOMZ1MjiuZuwdOtdFzqMSxWOUL3QzEdP0kaPnMQ9hXqv
         gA69qedkTqFAgI/tLn1fGN0PcaJtoW1cR9aVSJMzrn4gFeBPBR965jILuQPy5r8DWlC3
         wzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmvAh7du7j+dOu/4dWjBiq5tPY5V8yPemVfGKq4wwqGT16ylJALdd6DkOCh9AoZ/A9k4VIYkClswbGjR9+ipcQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw46kcFXvtqrSWvtotQx/SEi3EqDYwnWgKxoM2o+JrEAFCV4tha
	6kGZqY7rTwRuTesHgr66H+4Y4ioqyPuxx/NfL9uDQcDKli+oAkVf1x40N75T6jDPJobRhwjiyy+
	65El/3RHhwqt7acR3lclYElnZRWyl4y9Zk5cdLe5/Fh+FtFrvVJoXKjhNfDXDYWHxbfPCuoyNKh
	kzGtXYiB1o3/M5HlprE3iMMld7wPzHYP5sgARxfVM0NHROSVoROXjpehZwXgNnbkXTSfCpgw5T7
	LN1ACjjdSwDIoIu1GQDaeI79ispy5zCmVY=
X-Gm-Gg: ASbGncuE4VBSRfqpyRNSP1Lo2y3ukbiYz6c5Rcd9mcNQXxgy40YxV4VL1eCU0NbBwJc
	1oPHkBnKlTbqRBSRWu48IMBOPmgUUw4EAexluOJpTHhR3Livhp9P7Zk9NsPGLA8AvwrwUbD5kKv
	OAM4Ju2jUDtORGIYlbDWu0gVHn2KMNXSbxJ3zFU5l1653uXXVFGRYaxh1jNLASO9lYc9+2/66Uu
	mFe0i435om3FQptpkb2LbzUllNCUeNfca62Cf0xGwoNows6SuFq/IZ19WL7hC08XdvQlbXcdr/O
	9xJziKSzow7uZnoQu1+iM1aP7qMkUHu/1mJd3WeSco2kLBtbWV0ajHOD74m4ckByKj/KQ2QnFuN
	sIYZVZxHCrrWCXM5Ec7JDV0pcB+/z7jj2Y3JOANrJ3aA9QTgqrkhGMvPn1uoEzZ6efxdDXgazR0
	qVdMkKTZM=
X-Google-Smtp-Source: AGHT+IGjr70381Fkk42D6GDf2lKcoT9S8mEvBxg0GT3b+YbpfrKrtr7Th9xOULdk2tipd3uPCGKYuIXScqkL
X-Received: by 2002:a05:6871:58a5:b0:30b:85e1:d3ea with SMTP id 586e51a60fabf-35ec18dbd20mr5943800fac.21.1759007065322;
        Sat, 27 Sep 2025 14:04:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-363b9d6dcd5sm654692fac.26.2025.09.27.14.04.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Sep 2025 14:04:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-335276a711cso2699306a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759007063; x=1759611863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oc5vo+Rb9ClONgmTiHxfZM7CLOGpUGWCRjHz3GTHRlQ=;
        b=UGXCl8q+3a6HCiNURIb0Kv8i2U9r/wHmuo7fqk5vsIzLkPrX9GkI//22h3NZNDjZ+S
         1euRuqvQbfRtc7ckNTyAPptMHYXjF+cfv8GjbeitY2UycgRhVd2DIaACCo+l4UlturdY
         rmyzIN7jupKHArXL6ECOgwfiOWJHZd0+zwFQ4=
X-Forwarded-Encrypted: i=1; AJvYcCUWMdun2PbtB5cAP4+HwIFpyalT5Zt/jQQShwR9PkTwGPV5K2/ZjppRz5nyQzCoRtSLBQ9A8iCmQ5gPU9Vv5llj@lists.infradead.org
X-Received: by 2002:a17:90b:55c6:b0:330:84dc:d11b with SMTP id 98e67ed59e1d1-3342a2bed9dmr11453780a91.18.1759007063481;
        Sat, 27 Sep 2025 14:04:23 -0700 (PDT)
X-Received: by 2002:a17:90b:55c6:b0:330:84dc:d11b with SMTP id 98e67ed59e1d1-3342a2bed9dmr11453750a91.18.1759007062992;
        Sat, 27 Sep 2025 14:04:22 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a3afe09sm4481311a91.1.2025.09.27.14.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 14:04:21 -0700 (PDT)
Message-ID: <34478e1c-b3ba-4da3-839a-4cec9ac5f51e@broadcom.com>
Date: Sat, 27 Sep 2025 14:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/4] net: stmmac: stm32: add WoL from PHY
 support
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Simon Horman <horms@kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
 <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_140427_547843_363B15E3 
X-CRM114-Status: GOOD (  28.30  )
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



On 9/26/2025 12:05 PM, Florian Fainelli wrote:
> 
> 
> On 9/26/2025 10:59 AM, Russell King (Oracle) wrote:
>> On Wed, Sep 17, 2025 at 05:31:16PM +0100, Russell King (Oracle) wrote:
>>> On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
>>>> If the "st,phy-wol" property is present in the device tree node,
>>>> set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
>>>> the PHY.
>>>>
>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>> ---
>>>>   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/ 
>>>> drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>>> index 
>>>> 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>>> @@ -106,6 +106,7 @@ struct stm32_dwmac {
>>>>       u32 speed;
>>>>       const struct stm32_ops *ops;
>>>>       struct device *dev;
>>>> +    bool phy_wol;
>>>>   };
>>>>   struct stm32_ops {
>>>> @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct 
>>>> stm32_dwmac *dwmac,
>>>>           }
>>>>       }
>>>> +    dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
>>>> +
>>>>       return err;
>>>>   }
>>>> @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct 
>>>> platform_device *pdev)
>>>>       plat_dat->bsp_priv = dwmac;
>>>>       plat_dat->suspend = stm32_dwmac_suspend;
>>>>       plat_dat->resume = stm32_dwmac_resume;
>>>> +    if (dwmac->phy_wol)
>>>> +        plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
>>>
>>> I would much rather we found a different approach, rather than adding
>>> custom per-driver DT properties to figure this out.
>>>
>>> Andrew has previously suggested that MAC drivers should ask the PHY
>>> whether WoL is supported, but this pre-supposes that PHY drivers are
>>> coded correctly to only report WoL capabilities if they are really
>>> capable of waking the system. As shown in your smsc PHY driver patch,
>>> this may not be the case.
>>>
>>> Given that we have historically had PHY drivers reporting WoL
>>> capabilities without being able to wake the system, we can't
>>> implement Andrew's suggestion easily.
>>>
>>> The only approach I can think that would allow us to transition is
>>> to add:
>>>
>>> static inline bool phy_can_wakeup(struct phy_device *phy_dev)
>>> {
>>>     return device_can_wakeup(&phy_dev->mdio.dev);
>>> }
>>>
>>> to include/linux/phy.h, and a corresponding wrapper for phylink.
>>> This can then be used to determine whether to attempt to use PHY-based
>>> Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
>>> PMT-based WoL if supported at the MAC.
>>>
>>> So, maybe something like:
>>>
>>> static u32 stmmac_wol_support(struct stmmac_priv *priv)
>>> {
>>>     u32 support = 0;
>>>
>>>     if (priv->plat->pmt && device_can_wakeup(priv->device)) {
>>>         support = WAKE_UCAST;
>>>         if (priv->hw_cap_support && priv->dma_cap.pmt_magic_frame)
>>>             support |= WAKE_MAGIC;
>>>     }
>>>
>>>     return support;
>>> }
>>>
>>> static void stmmac_get_wol(struct net_device *dev, struct 
>>> ethtool_wolinfo *wol)
>>> {
>>>     struct stmmac_priv *priv = netdev_priv(dev);
>>>     int err;
>>>
>>>     /* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
>>>     if (phylink_can_wakeup(priv->phylink) ||
>>>         priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
>>>         err = phylink_ethtool_get_wol(priv->phylink, wol);
>>>         if (err != 0 && err != -EOPNOTSUPP)
>>>             return;
>>>     }
>>>
>>>     wol->supported |= stmmac_wol_support(priv);
>>>
>>>     /* A read of priv->wolopts is single-copy atomic. Locking
>>>      * doesn't add any benefit.
>>>      */
>>>     wol->wolopts |= priv->wolopts;
>>> }
>>>
>>> static int stmmac_set_wol(struct net_device *dev, struct 
>>> ethtool_wolinfo *wol)
>>> {
>>>     struct stmmac_priv *priv = netdev_priv(dev);
>>>     u32 support, wolopts;
>>>     int err;
>>>
>>>     wolopts = wol->wolopts;
>>>
>>>     /* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
>>>     if (phylink_can_wakeup(priv->phylink) ||
>>>         priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
>>>         struct ethtool_wolinfo w;
>>>
>>>         err = phylink_ethtool_set_wol(priv->phylink, wol);
>>>         if (err != -EOPNOTSUPP)
>>>             return err;
>>>
>>>         /* Remove the WoL modes that the PHY is handling */
>>>         if (!phylink_ethtool_get_wol(priv->phylink, &w))
>>>             wolopts &= ~w.wolopts;
>>>     }
>>>
>>>     support = stmmac_wol_support(priv);
>>>
>>>     mutex_lock(&priv->lock);
>>>     priv->wolopts = wolopts & support;
>>>     device_set_wakeup_enable(priv->device, !!priv->wolopts);
>>>     mutex_unlock(&priv->lock);
>>>
>>>     return 0;
>>> }
>>>
>>> ... and now I'm wondering whether this complexity is something that
>>> phylink should handle internally, presenting a mac_set_wol() method
>>> to configure the MAC-side WoL settings. What makes it difficult to
>>> just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
>>> that could be a "force_phy_wol" flag in struct phylink_config as
>>> a transitionary measure... so long as PHY drivers get fixed.
>>
>> I came up with this as an experiment - I haven't tested it beyond
>> running it through the compiler (didn't let it get to the link stage
>> yet.) Haven't even done anything with it for stmmac yet.
>>
> 
> I like the direction this is going, we could probably take one step 
> further and extract the logic present in bcmgenet_wol.c and make those 
> helper functions for other drivers to get the overlay of PHY+MAC WoL 
> options/password consistent across all drivers. What do you think?

+		if (wolopts & WAKE_MAGIC)
+			changed |= !!memcmp(wol->sopass, pl->wol_sopass,
+					    sizeof(wol->sopass));


Should not the hunk above be wolopts & WAKE_MAGICSECURE?

-- 
Florian


