Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0736CCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dRmwJqq2SxsiFB6VEpR33/U1NputiwE3QM2SDlba7Y=; b=H5PmRw3aftPhop+odqBx4dcKlL
	Z0fETCToRWpZvjI1RZ4KiP9rErj/9c5B5gpg7nBpKlInSBmQ9RuPLOnBDrTMHVQDfHdOlYpF3DmIJ
	xojlR3uKLZ7lL5WHN0D5ezd9MI/0OfxZ0PsrolJlO9NC9EAjHasF2iS2AZF43THrUp7g+ebPBHnOq
	wB8wHgKBZPjjz3ePo5pnVH+/W5CvLoG9+qQrrc91XFDc8HzXy7JtX+mP5qey8O/h7j+2yYN1cNmOh
	smWdzEXnBHEVKpq7OX8Do3VX/1Bfw78Q1WYGo2x2qvwXTjZMK7VwSVy8B7nb/Fe74B0NdH1ailPta
	A4Lk6SRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Dl4-00000003ocV-3nIT;
	Fri, 26 Sep 2025 19:05:30 +0000
Received: from mail-qv1-xf62.google.com ([2607:f8b0:4864:20::f62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Dl2-00000003obF-2D0j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 19:05:30 +0000
Received: by mail-qv1-xf62.google.com with SMTP id 6a1803df08f44-7960d69f14bso13595226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 12:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758913527; x=1759518327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dRmwJqq2SxsiFB6VEpR33/U1NputiwE3QM2SDlba7Y=;
        b=CjitCoPssOAlKlAPSE2kmCGZwPO2cyKEz6+M/gn1S2i6NhS3Hz70VMzCpVvIQ4CZPG
         8xtAy3txoy2g4cGFV/TO+WIk9Ed7/ax4p7ziUZKNYDzT4ThfGlKsw/y1P/XRr/aZpgzd
         vCz9ELEcYCDmDM9uID6n2fI+tNjj6bQkwOjzhy2ptmE+cBPP6PmS1VEkz1YTtZXWZn86
         KwUecU1uqmVZivEIbkrpvDpXi9lPVSPc8Bf6E0R3PLNQeYjFWX3r1XMn9iG4mZmTy15R
         60yy+PgXeAzJ/HXzLsgQ7BvAC3aeXl72i6Ob7JycixAqhZeJf0gKgoFR6xwwHb53TShf
         Ipaw==
X-Forwarded-Encrypted: i=1; AJvYcCULtIPxlRz+qO53eK7RDR+a4Amw4imFOYfEzIoib9BfLX8w++uCvZCwO/847jASj6DFryVNB+9VXNVZ91vOwfxV@lists.infradead.org
X-Gm-Message-State: AOJu0YznRrzIeyzqxwPsMV7a4SgDp1ME4NZdZ4YQwuKzGNmke6J+E5Wt
	AZq8n+xZy8gNYP65a1wm6kohRSlN6geIaksn5R/9iFLFiK2Od9dMEA3rz9wRopETS7TVfmOo07C
	Ah9qY8htuvvEcOFNeDeGxRY+vhFkxwbB5YGRDdteogGKLO7XB5S5vp5m04HKguIEntIxe4xv6t7
	42sIPSZPQ7XI51bu/RGc6+DnqZdsWS4okqYkZzQ9Zeb6cjbR54uob/PQrOjSl/uZgSyObFfWAf3
	9cJFpPQdgWK2m+6NFcZ+h1ypY9WRkHd8Z8=
X-Gm-Gg: ASbGncv62a15VI/Et+iNtJS/Fiszq/1lNsT+IEzWKk4Mx4b5lUJnw/tK1NPYdlq67zM
	FDnyFeLDsov2dtJGZX4fEpePeHUYPoZ0Fz5s3Xp8jB2uqp847aKpDLfJ7redPoQbae8viBtfnfd
	XZi1QPLXu87tlZSILJdebRt3QdxGJr11kFZM5zIBcdtl3hX4+3k05F8Ph2R63m21K9ITgaVr2C2
	zN3vuA1v5Wlh6cei4mC8fAyiO7rCRwq67VFX/qJ34luxjJQvvnQcJjf4gVmWTJ0kM8AGW+AJU7h
	BYgzL3Jr+5F/zaUOGSxWDvppI2uzlCNrZUSyCGmMpxIBtB+WWGAW4Zb6JVaV0hzeYsO0PxU8cQ4
	DC2nImohb9m2VRrxwfT0wpcCs6l6uVfEEjeySOVHkrMBcDuEcqpGzGZIr7capiUB0ie5Yok0Zry
	bImT2g
X-Google-Smtp-Source: AGHT+IEmByEO88eI7lrAdpQogiSlQwISmYLP3IfHsb85WjrXU/NLJlF3mbYeXNYdbB+sNqP2WSW0bY+A94Ai
X-Received: by 2002:a05:6214:2aaa:b0:78d:8414:e4c1 with SMTP id 6a1803df08f44-7fc3db4ff82mr147040666d6.48.1758913526813;
        Fri, 26 Sep 2025 12:05:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-801325caa89sm3401906d6.2.2025.09.26.12.05.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Sep 2025 12:05:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26985173d8eso46225125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 12:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758913524; x=1759518324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0dRmwJqq2SxsiFB6VEpR33/U1NputiwE3QM2SDlba7Y=;
        b=K7NADwssJC5jzkBhyBXiNPiZawXJKNqlU4Azkg1C8+n2XmbfOflW23YqmXRvCJtL6Y
         ey091IK8YfdYod67oSXsMAwhPEKCNAO79CF/D1N/e8lGFBOho7KnILzra1bLnJozd5ti
         6kFSMpgD3KwF9GwKUIKmssEu+lss9r9fSy4T4=
X-Forwarded-Encrypted: i=1; AJvYcCVKbduu5ZFXMylyyDjC4mj5UbARSv7ZUg7/c5/XN/EZNCjDq0xXhJR//UFrhVYaCjixe2KaoNb/CPz2z41YNqGe@lists.infradead.org
X-Received: by 2002:a17:902:db01:b0:272:dee1:c133 with SMTP id d9443c01a7336-27ed49ded13mr86956845ad.22.1758913523900;
        Fri, 26 Sep 2025 12:05:23 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:272:dee1:c133 with SMTP id d9443c01a7336-27ed49ded13mr86956455ad.22.1758913523442;
        Fri, 26 Sep 2025 12:05:23 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac9ae0sm60832835ad.140.2025.09.26.12.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 12:05:22 -0700 (PDT)
Message-ID: <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
Date: Fri, 26 Sep 2025 12:05:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/4] net: stmmac: stm32: add WoL from PHY
 support
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
In-Reply-To: <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_120528_619869_C05EDF98 
X-CRM114-Status: GOOD (  31.28  )
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



On 9/26/2025 10:59 AM, Russell King (Oracle) wrote:
> On Wed, Sep 17, 2025 at 05:31:16PM +0100, Russell King (Oracle) wrote:
>> On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
>>> If the "st,phy-wol" property is present in the device tree node,
>>> set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
>>> the PHY.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> @@ -106,6 +106,7 @@ struct stm32_dwmac {
>>>   	u32 speed;
>>>   	const struct stm32_ops *ops;
>>>   	struct device *dev;
>>> +	bool phy_wol;
>>>   };
>>>   
>>>   struct stm32_ops {
>>> @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>>>   		}
>>>   	}
>>>   
>>> +	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
>>> +
>>>   	return err;
>>>   }
>>>   
>>> @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
>>>   	plat_dat->bsp_priv = dwmac;
>>>   	plat_dat->suspend = stm32_dwmac_suspend;
>>>   	plat_dat->resume = stm32_dwmac_resume;
>>> +	if (dwmac->phy_wol)
>>> +		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
>>
>> I would much rather we found a different approach, rather than adding
>> custom per-driver DT properties to figure this out.
>>
>> Andrew has previously suggested that MAC drivers should ask the PHY
>> whether WoL is supported, but this pre-supposes that PHY drivers are
>> coded correctly to only report WoL capabilities if they are really
>> capable of waking the system. As shown in your smsc PHY driver patch,
>> this may not be the case.
>>
>> Given that we have historically had PHY drivers reporting WoL
>> capabilities without being able to wake the system, we can't
>> implement Andrew's suggestion easily.
>>
>> The only approach I can think that would allow us to transition is
>> to add:
>>
>> static inline bool phy_can_wakeup(struct phy_device *phy_dev)
>> {
>> 	return device_can_wakeup(&phy_dev->mdio.dev);
>> }
>>
>> to include/linux/phy.h, and a corresponding wrapper for phylink.
>> This can then be used to determine whether to attempt to use PHY-based
>> Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
>> PMT-based WoL if supported at the MAC.
>>
>> So, maybe something like:
>>
>> static u32 stmmac_wol_support(struct stmmac_priv *priv)
>> {
>> 	u32 support = 0;
>>
>> 	if (priv->plat->pmt && device_can_wakeup(priv->device)) {
>> 		support = WAKE_UCAST;
>> 		if (priv->hw_cap_support && priv->dma_cap.pmt_magic_frame)
>> 			support |= WAKE_MAGIC;
>> 	}
>>
>> 	return support;
>> }
>>
>> static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
>> {
>> 	struct stmmac_priv *priv = netdev_priv(dev);
>> 	int err;
>>
>> 	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
>> 	if (phylink_can_wakeup(priv->phylink) ||
>> 	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
>> 		err = phylink_ethtool_get_wol(priv->phylink, wol);
>> 		if (err != 0 && err != -EOPNOTSUPP)
>> 			return;
>> 	}
>>
>> 	wol->supported |= stmmac_wol_support(priv);
>>
>> 	/* A read of priv->wolopts is single-copy atomic. Locking
>> 	 * doesn't add any benefit.
>> 	 */
>> 	wol->wolopts |= priv->wolopts;
>> }
>>
>> static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
>> {
>> 	struct stmmac_priv *priv = netdev_priv(dev);
>> 	u32 support, wolopts;
>> 	int err;
>>
>> 	wolopts = wol->wolopts;
>>
>> 	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
>> 	if (phylink_can_wakeup(priv->phylink) ||
>> 	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
>> 		struct ethtool_wolinfo w;
>>
>> 		err = phylink_ethtool_set_wol(priv->phylink, wol);
>> 		if (err != -EOPNOTSUPP)
>> 			return err;
>>
>> 		/* Remove the WoL modes that the PHY is handling */
>> 		if (!phylink_ethtool_get_wol(priv->phylink, &w))
>> 			wolopts &= ~w.wolopts;
>> 	}
>>
>> 	support = stmmac_wol_support(priv);
>>
>> 	mutex_lock(&priv->lock);
>> 	priv->wolopts = wolopts & support;
>> 	device_set_wakeup_enable(priv->device, !!priv->wolopts);
>> 	mutex_unlock(&priv->lock);
>>
>> 	return 0;
>> }
>>
>> ... and now I'm wondering whether this complexity is something that
>> phylink should handle internally, presenting a mac_set_wol() method
>> to configure the MAC-side WoL settings. What makes it difficult to
>> just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
>> that could be a "force_phy_wol" flag in struct phylink_config as
>> a transitionary measure... so long as PHY drivers get fixed.
> 
> I came up with this as an experiment - I haven't tested it beyond
> running it through the compiler (didn't let it get to the link stage
> yet.) Haven't even done anything with it for stmmac yet.
> 

I like the direction this is going, we could probably take one step 
further and extract the logic present in bcmgenet_wol.c and make those 
helper functions for other drivers to get the overlay of PHY+MAC WoL 
options/password consistent across all drivers. What do you think?
-- 
Florian


