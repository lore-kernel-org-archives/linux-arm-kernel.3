Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F7CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq2bh31wVJEqzkyFJlgDPXd4ErLVOZNLSFfdQyUd90s=; b=HlRSvJvN3nzlowcbabvA4Yqrch
	f2x7xwA9dTOVfX0Z+7Se4IEYWgTvFHWO0ZpTCyRTKFsfv5AjH9hl0rgwBSWUhR9rD1anT3s8yiapZ
	XXUkySP8WDuiKt8yXei5ieb6H9dbbx9qZByTDjLo1hC+BLqOEv+WmMgK9hc7BjJl8n0yAkhKZEyMi
	hLhnQ9eoZ5psRHqy+hx9GHFcg2Iz61zXNmJatWDTW/d/MHH3G3oC8SKZ7FzEU4n+P5Zzr722V4xHJ
	cQ1JqoG75gfk0oFk7Qw4KLM2Z1BJVA0blmq3tiUIcUHbj3TL7d6PWk3+WOFC8dilGcGWbqbrrImae
	Ar60tHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2zO-0000000EdGI-2gHt;
	Mon, 04 May 2026 23:46:14 +0000
Received: from mail-ua1-x962.google.com ([2607:f8b0:4864:20::962])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2zL-0000000EdEz-1cL7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 23:46:13 +0000
Received: by mail-ua1-x962.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso1169369241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 16:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777938369; x=1778543169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tq2bh31wVJEqzkyFJlgDPXd4ErLVOZNLSFfdQyUd90s=;
        b=DGwa+40fbW6RdZziNBuOKLqq8dq1FNVP6ooDOpTPY2XxKwyQ+D0wytEYJO6CkuElTm
         VJxnH0CcsQLjTzwpFzhxspzXv3qiRrpNW3GyKj3O84xesgOB33K3yT9qWbx4tVWiXIl2
         V2HDsTOaK/JyDFtaZ4v3HUrXYK4L0IKftUd+tWsxoEnSs26r4SL/Crh4eQUuOhP3OG+l
         hDXWuL2i2f9uSr40In4qELfmPqS5+c1V7fb7f3N9NYSMWQhCwZprFOFIcmlZlUK7cQZO
         DBM5HTYcC85+k2EnQ1lNKTYfaPcj/JUtdjICgzQwwOvTk4kvlYM+u/1NysLPlaJjmbJE
         DfWw==
X-Forwarded-Encrypted: i=1; AFNElJ/buaNSx0MjQ+K+KCE25idclMyNMKnPb/34bJvYUP3G7UzvxzImj/NCKNDF3jaaeoggi0jSfLVKGe7VOpfRFF07@lists.infradead.org
X-Gm-Message-State: AOJu0YzQhdz3XrGKbOPVvOg0+FXA95BlU9zveRyNjiHDRMTKOwJ5A5C3
	512UpiJ5tXfPu+FUwS6Lv3qr9x34JwpgLZoPEp9XanogAxKnImGi7oC+28/vSdaevrtVAyh4ZVd
	FT4w59Hmim9zIhcQcZzA6/FiRe4UgtrvujQIvQEyqRGywxb7oaO0SwXn/IfG/pZ8YO8cNQuEXxu
	i0HT+GxCgAGgzU/IdTNKp1XDeGgymoHofAyBIZGJOxoNb93HR4Qy2535U7Wew4IRo2NKQ+OxxJv
	8SNdOMehxLutmEgCjx1m5YwQPWqI5yBhEM=
X-Gm-Gg: AeBDies6R2YOsxJbxP0+Mb8nfB+AxIplQH8VUWDy1VYt39dTHTASl5kpSClTFMxGpni
	ss8VoWa8OhplPSfdKL3+3Nwwz9zgxtSH86XEfP6BI5nEUDrg8SS4QGNj8yAQGLWkaNA4lLJ7mkf
	Is0O2mN0Qaqf3hDpYkw6UWo/FhcTpgker8bUcWol5k205URUsSsFJJpl1dFOE+2Xrqtj/27J4Pr
	u+RY35Hqjj6IPunx3rsSTTdjcA6LzMshYlH/2VLsMhqXKqHkT/xanO6balV0d7wdbrcg8rr2q3g
	R1Ry1i+IwpuVLoZOi7UWkqFcbWUF1Wl0C6x+Q6Kas5wNcMqc7/qD6syb8tHfRzJZKVCI3OaUok3
	70gXOA9e1QtDFNZs/sUjKOdCcthUa87axmkjCR3+vOrk+VAyuaYEqDJihzCWKjAhHLD6nVrWYPn
	7tXC55K8fsanrGyZQoG6t1
X-Received: by 2002:a05:6102:5a:b0:62e:c54:fccb with SMTP id ada2fe7eead31-62e0c550ad3mr3370551137.28.1777938369095;
        Mon, 04 May 2026 16:46:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-62f57c7c4fbsm59301137.28.2026.05.04.16.46.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2026 16:46:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so115732451cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 16:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777938368; x=1778543168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq2bh31wVJEqzkyFJlgDPXd4ErLVOZNLSFfdQyUd90s=;
        b=SIh74tJwdF1vmZVB8rv4VcPjQdt7bcLUBG4imOKY4invpWi6dRUYheABafTTFFOr2X
         9zkrUYDfW8IQ0q9AgQjyoPiJPiAzdlcjyNTnZGCps6f+o2AYncDrx9vGzNJsqvPHpj6f
         R2LF13tEMCZa0ytuTLTE1RMkpTPyH5BCJOIjM=
X-Forwarded-Encrypted: i=1; AFNElJ+4hqpNV3920aAYQnX4qHMftbbataee0fzMqcoxPSNPUX17xkb8lEIwN9sJY1Dau0KNBynYH7LPxNB4sl+dENHa@lists.infradead.org
X-Received: by 2002:a05:622a:514:b0:510:1463:4fc3 with SMTP id d75a77b69052e-5104bcb8b83mr170265141cf.0.1777938368315;
        Mon, 04 May 2026 16:46:08 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:510:1463:4fc3 with SMTP id d75a77b69052e-5104bcb8b83mr170264661cf.0.1777938367629;
        Mon, 04 May 2026 16:46:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-510416dfc75sm129427311cf.3.2026.05.04.16.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 16:46:06 -0700 (PDT)
Message-ID: <631c8f3f-3d38-42e0-b89a-64281d269bfd@broadcom.com>
Date: Mon, 4 May 2026 16:46:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
To: Hans Zhang <18255117159@163.com>, Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, Jim Quinlan <jim2101024@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260502114019.GA551304@bhelgaas>
 <2f453b89-0ce8-4ef3-ae93-c282a2d08fd7@broadcom.com>
 <a491a592-5576-4987-a866-a8491f8612e8@163.com>
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
In-Reply-To: <a491a592-5576-4987-a866-a8491f8612e8@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_164611_439313_EDA590AF 
X-CRM114-Status: GOOD (  17.71  )
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

On 5/4/26 10:26, Hans Zhang wrote:
> 
> 
> On 5/5/26 00:58, Florian Fainelli wrote:
>> On 5/2/26 04:40, Bjorn Helgaas wrote:
>>> On Fri, May 01, 2026 at 01:24:38PM -0700, Florian Fainelli wrote:
>>>> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
>>>> pcie->gen stopped being assigned and as a result the established PCIe
>>>> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
>>>> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
>>>>
>>>> Link: https://github.com/raspberrypi/linux/issues/7343
>>>> Reported-by: Dom Cobley <popcornmix@gmail.com>
>>>> Reported-by: Phil Elwell <phil@raspberrypi.com>
>>>> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>> ---
>>>>   drivers/pci/controller/pcie-brcmstb.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/ 
>>>> controller/pcie-brcmstb.c
>>>> index 714bcab97b60..6138fc4bc064 100644
>>>> --- a/drivers/pci/controller/pcie-brcmstb.c
>>>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>>>> @@ -2072,8 +2072,7 @@ static int brcm_pcie_probe(struct 
>>>> platform_device *pdev)
>>>>           return PTR_ERR(pcie->clk);
>>>>       ret = of_pci_get_max_link_speed(np);
>>>> -    if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
>>>> -        pcie->gen = 0;
>>>> +    pcie->gen = pcie_get_link_speed(ret);
>>>
>>> Take a look at https://sashiko.dev/#/ 
>>> patchset/20260501202438.376033-1- florian.fainelli%40broadcom.com
>>>
>>> The notes at https://github.com/raspberrypi/linux/issues/7343 assumed
>>> PCI_SPEED_UNKNOWN was 0, but in fact it is 0xff, which means you might
>>> want the more defensive patch instead.
>>>
>>> I'll be happy to replace what's on pci/for-linus if so.
>>
>> I am starting to think a revert is the simplest path forward, it's not 
>> clear what pcie_get_link_speed() brings to the table honestly.
> 
> Hi Florian,
> 
> The pcie_get_link_speed function is designed to prevent other Root Port 
> drivers from accessing the array pcie_link_speed out of bounds.

Yes, so that's useful in the first hunk of your commit where we were 
printing the link speed without checking that the 'max-link-speed' would 
be bounds check, however it is not really useful for assigning to 
pcie->gen in our case, so I would prefer the second option:


           ret = of_pci_get_max_link_speed(np);
  -       if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
  -               pcie->gen = 0;
  +       pcie->gen = (ret < 0) ? 0 : ret;

Thank you for stepping in!
-- 
Florian

