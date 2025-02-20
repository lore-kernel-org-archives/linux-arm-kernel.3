Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B818C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKf1vcFL6xViBeT7BvtPbIy9sFenGIBAFVayL6IZB0U=; b=KUuxVB5lGIA84v0Gp2+DIF7BDz
	H7dnpA78M9Rir/aoeza2v5aUuQhiZHRkc4yycLNF7Y6ZTbE+zYOUEubaN5+SRCMy+DmztPZ/CeEHa
	JnG5mDefrIWKGLmodqE+ZJXSe5ZqWc5OHgePLXmhusL52OxXAG4HReFOoxnigXpDGj2nXBz1zWRTW
	L4td4hyC3Rfl1g1vLSCGkhF+8LU2PDJOI6BcYV5aMTR181GdlWiHxsgR+JBVb/KueUBPFIvSdcU+G
	CLmg0Bv4dxa/L/xVnP0sFP5lo3xIANXSpyHu8UY5TRxGvxRwJZ9gstl9MQrOd1Gnc1iHaclkmRmtr
	i3S9V3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAPY-000000029m0-0eUF;
	Thu, 20 Feb 2025 17:32:32 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAMI-000000028kD-0reH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:29:11 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5fd0adce179so530587eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740072549; x=1740677349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dKf1vcFL6xViBeT7BvtPbIy9sFenGIBAFVayL6IZB0U=;
        b=f5ifwwfdZmyId7axsfux53j6HAp2pmLQ9Z5lDopNgv/2Zj/anqQyvahZxltI+pauKb
         2Wxar68EocA6P6B4jSnVUlswSeGeBhilTlkqE6tlt4PQeLwf/ffHi/EeChAFne5SYfq0
         CZyZ4ilFkGnQKSj6YmmbqTDK03VLHpG0TDxp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072549; x=1740677349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKf1vcFL6xViBeT7BvtPbIy9sFenGIBAFVayL6IZB0U=;
        b=IjtPJf62b5SQCgcn+hTNqOfEyuwV9YGrDkK0CZEPApg6Z4vgX7fXVaxCDrb6i2YqxI
         i0delb8ZbGm3fm1pkM/x9iSEpvWA/cnCsUF5eQNdAwkrelbIiGSP37f1r7o8l5U9H784
         ICJVEAYRlru3kjCZ5gxAjhiB28I2FkUacW5D5jjMDzM55R5tNyCHpEdw42BjwQfOuJUi
         MhREeH9QObot+dvyepVIz7LsHiT0I53KivFpNC/kyF7vU/PhuqmPtdrv9g0iFY0EtQBj
         22/Q/iaj3y5lUIkkn323QcoQn+pd9jppOSkmmc10zfs3xjir8MEYofYqKxn/AekO8+8r
         2xEg==
X-Forwarded-Encrypted: i=1; AJvYcCVYBQ0zLXtZmuZBYdr03nOJkB5SoQEEpYiWgdyyo5+v4O2vev2LqSHIhjuBkRyxeUodrCjh7hkCQDOZZrzjMAsR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3vXEBBSNY7vRT+tR8ZQpENN/+Ty4At2LVZ3F70HFYzSz3Uc2Z
	7xknMlGMOeu7/reXy5fo6z1FpV7DLXP5tK0mc01k5/CYX3vyak8zDte7JSGpTA==
X-Gm-Gg: ASbGnctKb+SLB1rZSaotif2mkPIlnGT2iifBSWu0kNoaHYDiodsn+oMh5Fp8Y+AYkHX
	oGOkm/Zb/IPNoIc6DnoRjasW60L4CWKQMHvFqczd+NolnqV02t8hm/i/6yeEcYdkS9LzW5WO5bH
	WfsKfcR6CJ5U575d6esFfgjI8yfpPLES9UsapYzE0it0KoIkkvhnamp5vbY+BuQBaI3+rE7fxVb
	sDgrxD37SDVUKEdRWEu09FvI7nB3aZOA/TaaUHRA3AioFYQlz4tPRRMACYh4wkvgomQHbFxp3dT
	snKm7hcBTnTmDRkkWEk87Iq3Hy9Zq5pHNVuXYGtjV5bT3nKEjEHrKQ+of1kH48nzeB132h/PD0M
	tJ41+
X-Google-Smtp-Source: AGHT+IGHUYuXkflX6Xl2ci+0XBC0DnCcaMzZUD3gJQT0dFe4tZ5U3wxWcguP1LzcW4V9sDRX10JEUw==
X-Received: by 2002:a05:6820:270c:b0:5fc:b059:7597 with SMTP id 006d021491bc7-5fd194df6fcmr160232eaf.1.1740072549114;
        Thu, 20 Feb 2025 09:29:09 -0800 (PST)
Received: from [10.171.122.29] (wsip-98-189-219-228.oc.oc.cox.net. [98.189.219.228])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fd0aa506acsm497034eaf.31.2025.02.20.09.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:29:08 -0800 (PST)
Message-ID: <d18d4b5d-2356-4e2a-a318-14d0c328261a@broadcom.com>
Date: Thu, 20 Feb 2025 09:29:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] PCI: brcmstb: Do not assume that reg field starts
 at LSB
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-4-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-4-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_092910_247433_71418FC9 
X-CRM114-Status: GOOD (  11.84  )
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



On 2/14/2025 9:39 AM, Jim Quinlan wrote:
> When setting a register field it was assumed that the field started at the
> lsb of the register.  Although the masks do indeed start at the lsb, and
> this will probably not change, it is prudent to use a method that makes no
> assumption about the mask's placement in the register.
> 
> The uXXp_replace_bits() calls are used since they are already prevalent
> in this driver.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


