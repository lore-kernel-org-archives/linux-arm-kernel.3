Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08717CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faOI5W+NOaiamFpm7prjE2bXLwM58plu3qwpg+EeMUk=; b=AJhw7Jo424JGQXGMqDIfZ2r9CA
	VxvGzl6I7rBXEDfOAYyLT7KA7YGSyPxVZz7UL2EmPZRyWynIsFetotzRXhr5tiZEblQYFngJg2+sr
	6ke6P7dzsB9Srz74RMynqUANJuPitHrZprXrerv81YZFhVVU25GGeh0Gla9zb123HCeYQNUBHfoJU
	0JSJ3UbQj0e+OW4dextyPMsnCnEqEuMX5nqqJ0Oa4CivMGu6Dn5KfQatGOXKxHBXZig0Yl9Wh2EyK
	3Tuvh8LIh2OvwCo0ZbWz0bR8IEgdbdhQhdqA6LLPvb/sxaSUdt0nUOMv4ngrG00SfWYkuP+nbrNrr
	ewf4fhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwch-0000000DmNx-068E;
	Mon, 04 May 2026 16:58:23 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwcd-0000000DmLW-48mb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:58:21 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3651fa24c6bso1334026a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 09:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777913898; x=1778518698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faOI5W+NOaiamFpm7prjE2bXLwM58plu3qwpg+EeMUk=;
        b=Y4txDkfG7sEM8rOjCxPnOqLnyeDwmmoxXJuJYouIg6+JQfpY1k2fDucD9J9MfBIVSK
         mPLppH63WGbm85XCLs19xrjuaSU2dctEiNr9cvTPNBkj/8HEHIXpqc2G3pNHkZA+m7Xa
         rh221e+Cv2Be5vU9I7pVPeKCQuUUbYiGx9+wvhRxwWFwLuB9Dor4JMmx2PQKD81+EfQM
         8pga1z94oIt7NmjD4jrdb45g6meb0mWX6JUGTV36XZrv7SLZvRoH0YKAEB54eyVOOxgn
         dEmZxK66VJorSsCSK1yRAPNv7NCTZEVrnDwCsxYo7dhZegodtQi3SY88r2y2CvgbHHUk
         SVvw==
X-Forwarded-Encrypted: i=1; AFNElJ8NMVQcy11ygov2wRIn+I/zksI6AO9UVVZW0WiR1copOX4Kx5xlRKtcP9vk42FZGriVL45PsTPAep5Xy1GdpYj0@lists.infradead.org
X-Gm-Message-State: AOJu0YzvkoSY5Yw866jV9IUVST5vDNVk/Tpzs3LK1jAVIv6kqw53a4E/
	uP8NIwA9XGxKg9E4qUCl3kad3B9A/AjkY17nqktA6v5hzd/FXtHH4LXB83QqdDHZUNfdby9Lv3r
	EuEL4kpkUosqmy3Rj9iPZpV+mmA1Rb0gPIkpyWnwzhrQF8xc5BbbNcX2+Bi3TJD9hgy01D0PTxc
	w2Yb5Afd6oVqRXoMZiw0i14wuvzEGS/o8cWx2iNoqcTDNI5/w7gYJOUoYZ7DWJLNaS655u7MNzI
	2ehdZ7eKMvI4HIsgwOSMzRmGa54/YNAhBo=
X-Gm-Gg: AeBDiet9yEfWCbZGEzVXe+Q9T5UYLcZEs/+M08ws8obz/zt1M/dDdTIqYUnmvdw1+0P
	6ZG0PCz5tqnXG3KOhoOIULhBr6XqOOV3EHymTD67/gsBK/YISWmo8/CQyuqqJtREQ/tqOVdJhvJ
	BDDP4M7L5BBt3kDh156kdaQndL7FQZFLHOMpaqoJdpWhILlUD5ZsqTkF8p9BaPMHf/EUW2PSJiT
	SEYZmv+LY8L+G4xu5HRsx9/wm7+UpAzAIlHby1DWd7cuf42fqKXBgd9Aaq7XQQeytx1xG07Gxeu
	Sop5Q/2+urCritk2FY+jT/F+fSfT6xIqguGixgq6PAp87RAmvmrvtnYS2sSiW5JsliyHPLoz4Cf
	JAd/Vx0hHOpmv77P4mF2WRAoC6RhOMLedEw4EALPGIb/+b31ca8KqM0at7Tswq0C7V0c8Sbq+i5
	iPl2ifztlm/4FJE9yxig04dt/GvZYBLf/6k/arR/6xv5lNySUtVj2rGrXqLtiG9Ke8hgADzqQX
X-Received: by 2002:a17:90b:3852:b0:35b:e52a:6fe5 with SMTP id 98e67ed59e1d1-3650cd26470mr9834613a91.5.1777913898394;
        Mon, 04 May 2026 09:58:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-21.dlp.protect.broadcom.com. [144.49.247.21])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-364f3c3cd7dsm261052a91.0.2026.05.04.09.58.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2026 09:58:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so5121342eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777913896; x=1778518696; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=faOI5W+NOaiamFpm7prjE2bXLwM58plu3qwpg+EeMUk=;
        b=UO9i74j2Qw7bL0X/xK8Zampi3+gSqQ9vVP96IVKwr+qr3Z2ZIwVkwUWjiGdD2+XkBR
         uR/eG4sNZu7Xq3UVbv/z607tsfkehOkQiusL90NLUNWCMKD9oxhlYZbZ7KhqODWNJV1N
         lxVoIRzhIK7aOomtfcwqur/S2TN7ToICpSuAo=
X-Forwarded-Encrypted: i=1; AFNElJ+/UAQrF2CCEj3//AZSTrh/ALFlBIT3WCrgfxP9KVyRr4lkW4J/GBzSYOAsw0gVml14PX//mP2qb3mlqcl2/tjn@lists.infradead.org
X-Received: by 2002:a05:7300:8c28:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-2efbb7718e3mr4770354eec.31.1777913895957;
        Mon, 04 May 2026 09:58:15 -0700 (PDT)
X-Received: by 2002:a05:7300:8c28:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-2efbb7718e3mr4770325eec.31.1777913895339;
        Mon, 04 May 2026 09:58:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f194556795sm6594936eec.2.2026.05.04.09.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 09:58:14 -0700 (PDT)
Message-ID: <2f453b89-0ce8-4ef3-ae93-c282a2d08fd7@broadcom.com>
Date: Mon, 4 May 2026 09:58:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, Jim Quinlan <jim2101024@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans Zhang <18255117159@163.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260502114019.GA551304@bhelgaas>
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
In-Reply-To: <20260502114019.GA551304@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_095820_042122_8BD27A76 
X-CRM114-Status: GOOD (  17.97  )
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

On 5/2/26 04:40, Bjorn Helgaas wrote:
> On Fri, May 01, 2026 at 01:24:38PM -0700, Florian Fainelli wrote:
>> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
>> pcie->gen stopped being assigned and as a result the established PCIe
>> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
>> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
>>
>> Link: https://github.com/raspberrypi/linux/issues/7343
>> Reported-by: Dom Cobley <popcornmix@gmail.com>
>> Reported-by: Phil Elwell <phil@raspberrypi.com>
>> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/pci/controller/pcie-brcmstb.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
>> index 714bcab97b60..6138fc4bc064 100644
>> --- a/drivers/pci/controller/pcie-brcmstb.c
>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>> @@ -2072,8 +2072,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>>   		return PTR_ERR(pcie->clk);
>>   
>>   	ret = of_pci_get_max_link_speed(np);
>> -	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
>> -		pcie->gen = 0;
>> +	pcie->gen = pcie_get_link_speed(ret);
> 
> Take a look at https://sashiko.dev/#/patchset/20260501202438.376033-1-florian.fainelli%40broadcom.com
> 
> The notes at https://github.com/raspberrypi/linux/issues/7343 assumed
> PCI_SPEED_UNKNOWN was 0, but in fact it is 0xff, which means you might
> want the more defensive patch instead.
> 
> I'll be happy to replace what's on pci/for-linus if so.

I am starting to think a revert is the simplest path forward, it's not 
clear what pcie_get_link_speed() brings to the table honestly.
-- 
Florian

