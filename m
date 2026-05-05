Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009C5CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euKFIAQCeM55RulM535j7KBn6cys8J5H/Q721o26Boo=; b=SoQrkRnEdlsp0ZToUruOK9kcsT
	OPTY2XlLEHD2vqdyMH/xqlCaDzGz4fMNs+wsGq4MdRYR1jWFsOTi1qb+KpHEycx2y9kprD6gninGF
	ygHP6TdEf/xNYUkJie1MPs7B3dIDS94Jb7Qwq2CgDI/Ar1SgyCCaimG6I61J2PUXo8hx59wkp22s4
	eZ8cj7aajAA+gKE21ijaLujrAIhMcQ13tkyPZP7fguNjms2kTmzWPO5SF3koz1CH5eKzq6jzjxqDW
	4dB6cKbj21lR75FbtMWZ9gP4W6iONElYg6eYQBPBjtvn57C7fIazTS9fbuwPUOuTDhMSCxIx+6Gf7
	oAytAByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK2u-0000000H6ix-1cuk;
	Tue, 05 May 2026 17:59:00 +0000
Received: from mail-dy1-x1361.google.com ([2607:f8b0:4864:20::1361])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK2r-0000000H6hp-110N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 17:58:58 +0000
Received: by mail-dy1-x1361.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso1978451eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778003935; x=1778608735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euKFIAQCeM55RulM535j7KBn6cys8J5H/Q721o26Boo=;
        b=jXbwLsHPzaxm/gYngOLRz/JvsTcBlHjUQBWJLHNX8+fsx1oYkHu5vNQsnp+mvH1D3Z
         LxJmxGtIuLFowSVHdwlYOTUYh71qNrGVSwG9vc5H3fIXdipzk1PlF9zW8i7Mv5GJuSlK
         9chmd1toqGlWVEdPZF/Pjohnf2h+T+T68/nR/nDxjhw9xJE1L0qvBKZusJlVLbmoDpKp
         cPpIyl6n1MChU1L66arKGRoB2h7NVzM45d3fCLZPlCY2uYHuHXd9rOe+192bITpu5Fyi
         xTQSXZi74kgVzCaxrFFA3m8QpiMgd0q0zil4vA0Ih9UQ0ccKV+hyl2uKLnxi8v0xxdvi
         mzng==
X-Forwarded-Encrypted: i=1; AFNElJ8aLb24hJ4BBYPIrBi2LyKt8BETN1FT/GiDr5XgfQkX8MmAPfU8cc93Zkmg67cCmDUDbCzvBpMYae1oQGX/p4Zc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf1UKEJ/Sd01m/jEXOjwX4xHobF73SD+ylumTX9jqLBUB7DJzd
	6b+VO21M6dA41n8cQUS6ip+cxc9HPgoA9S1NuKR3aBgGcxEBa6q5oVAY5gqFYLG5CEDnY40cYgK
	Tg4rDwf3MX5w5BSTYVvSv05Mr3h8G0cUB8/R3+qPvMSzTnKcRYJZFQVMyC9Wj+e4avowU75geGg
	YMmrcPNwlDWhWAJsTu0g4xTDlJUIWZpGRHJnm7Vl8at7f3fgYb3nxPlYOCqMk66bmd//E2cABX9
	8JqItsDngaaMjeqLZYRuk2Wl4RgaRd49VU=
X-Gm-Gg: AeBDietZyANUdCTNtbS0O+o/5BAeyvtHnZHvI2p4fz//Dk8x5DdwjgXzEnfoouYD09u
	eDzHtpZ9pUE+trExcxkAF4OhqbVIgUJdh6NS6fmum8B9K59Q5RZ1v8NCO9dlS+nNloaDMF3mH/4
	0goNvjEtj+0PFHjA2Y7Z6B6S0lJZhv05FP2/eSeydZ+jaSrsAgCQtLZp+MdD9wUJVDyI7W4k3gd
	ZOwkLoAt18fXm2sIOJubBYBMzKh5AKnlgEzywHIKC8gPS0KgD/TJmu/UDdBlIzxFDutzGFyVHKj
	uJ6OW/vcigupAZIWFj0Wf118a5k8iNvefoN3rN5YetYVV2oRUbqINqTN6yz8OzDpPczCz+yOaLo
	I/ivJBwxnUC4CVyqJoDbBoae2iNw5Q+5ftq2QSBNIc87rwoUbgeHSGTOqkuSPnGbb+YRuOe7pSm
	2d6+MU41brj4DDyPMZ3oVR8Vh/9xiivjDnz/XFhtuICQBJZz3UQ8rZzaSQvo7no9tHWSSW6Ios
X-Received: by 2002:a05:7300:a507:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-2f5459a2137mr227453eec.0.1778003935345;
        Tue, 05 May 2026 10:58:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2f13980c9b3sm591603eec.28.2026.05.05.10.58.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 10:58:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1309f4ee9a3so1896932c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778003932; x=1778608732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=euKFIAQCeM55RulM535j7KBn6cys8J5H/Q721o26Boo=;
        b=eCtZdX0ChTAnkneW0JT0ybjxA3nhbgsRnMUwnGm89aXtV5mLa2nEVTfSNBNE+UqoP2
         cmVL/w8zxIfReH54iYY9PXEmXq2yCT9tzA3uFNqSKWf+qmJF8+6eI8YSrNzsqCsffxAQ
         9Vg2iCADMc2vqDSwu5Vp4F0yVc8hd8VDZUXxo=
X-Forwarded-Encrypted: i=1; AFNElJ8y3O9+Lk1DW2z0plDQAtVzR0PFvf7tMxS6AWSNDtHzVyLE0Nq5QkUmzQixMvGw5MUiToQUYQYJmjOLkfImxXwx@lists.infradead.org
X-Received: by 2002:a05:7022:238f:b0:127:3f2a:af21 with SMTP id a92af1059eb24-131852d9084mr151516c88.15.1778003932556;
        Tue, 05 May 2026 10:58:52 -0700 (PDT)
X-Received: by 2002:a05:7022:238f:b0:127:3f2a:af21 with SMTP id a92af1059eb24-131852d9084mr151495c88.15.1778003931997;
        Tue, 05 May 2026 10:58:51 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d634sm25912919eec.3.2026.05.05.10.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:58:51 -0700 (PDT)
Message-ID: <d13eb4ce-a868-4b10-b044-83fa1ddea1e9@broadcom.com>
Date: Tue, 5 May 2026 10:58:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, linux-pci@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 Jim Quinlan <jim2101024@gmail.com>,
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
References: <20260505160144.GA732689@bhelgaas>
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
In-Reply-To: <20260505160144.GA732689@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_105857_288592_1851F536 
X-CRM114-Status: GOOD (  24.62  )
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

On 5/5/26 09:01, Bjorn Helgaas wrote:
> On Mon, May 04, 2026 at 04:46:03PM -0700, Florian Fainelli wrote:
>> On 5/4/26 10:26, Hans Zhang wrote:
>>> On 5/5/26 00:58, Florian Fainelli wrote:
>>>> On 5/2/26 04:40, Bjorn Helgaas wrote:
>>>>> On Fri, May 01, 2026 at 01:24:38PM -0700, Florian Fainelli wrote:
>>>>>> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
>>>>>> pcie->gen stopped being assigned and as a result the established PCIe
>>>>>> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
>>>>>> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
>>>>>>
>>>>>> Link: https://github.com/raspberrypi/linux/issues/7343
>>>>>> Reported-by: Dom Cobley <popcornmix@gmail.com>
>>>>>> Reported-by: Phil Elwell <phil@raspberrypi.com>
>>>>>> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
>>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>>> ---
>>>>>>    drivers/pci/controller/pcie-brcmstb.c | 3 +--
>>>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/controller/pcie-brcmstb.c
>>>>>> b/drivers/pci/ controller/pcie-brcmstb.c
>>>>>> index 714bcab97b60..6138fc4bc064 100644
>>>>>> --- a/drivers/pci/controller/pcie-brcmstb.c
>>>>>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>>>>>> @@ -2072,8 +2072,7 @@ static int brcm_pcie_probe(struct
>>>>>> platform_device *pdev)
>>>>>>            return PTR_ERR(pcie->clk);
>>>>>>        ret = of_pci_get_max_link_speed(np);
>>>>>> -    if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
>>>>>> -        pcie->gen = 0;
>>>>>> +    pcie->gen = pcie_get_link_speed(ret);
>>>>>
>>>>> Take a look at https://sashiko.dev/#/
>>>>> patchset/20260501202438.376033-1-
>>>>> florian.fainelli%40broadcom.com
>>>>>
>>>>> The notes at https://github.com/raspberrypi/linux/issues/7343 assumed
>>>>> PCI_SPEED_UNKNOWN was 0, but in fact it is 0xff, which means you might
>>>>> want the more defensive patch instead.
>>>>>
>>>>> I'll be happy to replace what's on pci/for-linus if so.
>>>>
>>>> I am starting to think a revert is the simplest path forward, it's
>>>> not clear what pcie_get_link_speed() brings to the table honestly.
>>>
>>> The pcie_get_link_speed function is designed to prevent other Root Port
>>> drivers from accessing the array pcie_link_speed out of bounds.
>>
>> Yes, so that's useful in the first hunk of your commit where we were
>> printing the link speed without checking that the 'max-link-speed' would be
>> bounds check, however it is not really useful for assigning to pcie->gen in
>> our case, so I would prefer the second option:
>>
>>            ret = of_pci_get_max_link_speed(np);
>>   -       if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
>>   -               pcie->gen = 0;
>>   +       pcie->gen = (ret < 0) ? 0 : ret;
> 
> The point of this validation is to make sure we don't program the
> brcmstb hardware with something it doesn't support.
> 
> of_pci_get_max_link_speed() only returns an error (ret < 0) if DT
> didn't contain a 'max-link-speed' property.  That doesn't tell us
> anything about what brcmstb devices support.
> 
> I think this test should be something like what advk_pcie_probe() or
> rockchip_pcie_parse_dt() do.  If of_pci_get_max_link_speed() fails or
> returns something not supported by the hardware, they default to the
> fastest speed known to be supported.

Doing that could be challenging because it varies on a per-controller 
instance on some chips like 2712, this would also be a behavioral 
difference compared to today where the driver resorts to HW-defaults if 
the property is not specified.

There is also another aspect we have ignored which is that don't 
currently support anything beyond Gen3 at this point, but this is not 
enforced. Let me cook another patch.
-- 
Florian

