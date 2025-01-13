Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46213C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybO6ITDKL39JrzdH2h1fx5NTW8wMD1w8dNTpzC9u4NU=; b=U+QPZ540zSTEiyW5W4hO49wuFa
	IqTuXBzU3pq2N6/jy9tY9G+UOwPEPTKto5ACZIPaGO3UCIyMZKdUTL14a8w1KVYkvpewlsxq3vFsU
	/yjNDduCtgphaRMDKIgwOPGAFETfCXCnnmu2XaujJRsAdYgfslVkMc5DuPtyb+uAfIvluaU8a/xnA
	5RYx3F1WQKaHNATm6L8i3M40KkQ7o7kdoVAWu9ehL9Xb18ofa+nnUzFzGp6GXPmMhXwpxuNvHzJUG
	rKC/ez52BgnhccwCzhI3u4IbG9BaTqV6xqtThSCNP3sbM9b3rH5PiL9HSf5MqvG8orTPcvqqBFafo
	1EDClKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN5x-00000005o9R-36pd;
	Mon, 13 Jan 2025 16:15:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMcY-00000005hPt-0aYI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:44:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2162c0f6a39so97392435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736783092; x=1737387892; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ybO6ITDKL39JrzdH2h1fx5NTW8wMD1w8dNTpzC9u4NU=;
        b=Q+QDICcfwC8XGrE0iJev/BDHCgtI2zrujKaJ+8jTkwu/mcdN+E2+DjdhfiHZKH5GPy
         yOH9K4cwVjzCI70oUlJa661BlOjDEW7ZefPKX2/iolJdEHxtNzdt5RprMUy3AG+iNuQG
         Q8Ilpg/3he5yte+7EoiHKN+HuPZhpFl7lMg9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783092; x=1737387892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybO6ITDKL39JrzdH2h1fx5NTW8wMD1w8dNTpzC9u4NU=;
        b=fArvCxdxv72oT5ifpWRkEaMajAUCeP/yfBf24buZkc6iCpk2yAFQm0lJshFEDz0jMv
         AhnOTbNh/TR5AduCCOWXruoG30m0MJoEMMY2PrbgRySPHnqj/g5r6zXiq5t1KbqwVt1/
         ZHlY+DwuCCe4nME9Ubcc+umY5VyiRTC91SkQ6nIEupKR5KZgCqGgXDYb1zg+iMkPBJ+8
         9FG5LIQEYFXR6/GkqXLcU/Jn+/Uww+THxBvrdPYfdSPt5q+4Dyc8sxdKpZ2QzFUaBqpM
         7u5JL78sSLwnj5mrliqczNgMPijpMo5IgjSb9gcJMXRtmOyG80UalrdXAJDN4Px53+lj
         ldrw==
X-Forwarded-Encrypted: i=1; AJvYcCXEmn1af0zy5uqP++xz9SvGjxZP3h6wMOTGbMlltdUrMSPGK7N+J+6MBwxQ0A2HWm89CRzS5ZLe7nXDRqHo+Owy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3pBsga2/KTPk0Pf3MKZiuQCp7HXR2HMpKq5umDGp3lk/FRTZQ
	I41NraCjpjHflTRtqnYbNF/pKX1XUyWSX2KK0O5ZrmkDIoDcHfCmlV3EdOm0Vg==
X-Gm-Gg: ASbGncuia1jdsfAXWZSIzaHU9YNegHbg59F1GJAbwxDjEEj4cdO/OwpGFBOTRZXu6lt
	sbD1o0QK5Y/SVgjLH17290JOwVfb7FSG9KcSis/c9LmasxsMZCloEYqYr1Ko4np0TWb/mFWGqsd
	5JpNdAszz4GotigFoyNN2gTOTOQ79RjUVm0/8ygHs08aw+R4ZU9emxjVqASr26jHkxkv5rxFKOq
	UtuLlgm1DG9MGbSYb9Wuf20+fmM+5x50o7bQm1iJz8ejWfEy+v8YB1O/eXQzif2KiRXXEAh3z4y
	XLT/OFUgGpDPGB9tnOjLbXYSe0JzT5g=
X-Google-Smtp-Source: AGHT+IGlAhNAFoSw1pfaDXYYvQLgA24oACquxpnCb8GPzdZGolbKjMMQc6+01MzaSXFKM8+X02TZhQ==
X-Received: by 2002:a05:6a00:1747:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-72d30393fa8mr28590318b3a.8.1736783092544;
        Mon, 13 Jan 2025 07:44:52 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658a73sm6047441b3a.119.2025.01.13.07.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 07:44:51 -0800 (PST)
Message-ID: <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
Date: Mon, 13 Jan 2025 07:44:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: account for hotplug memory when randomizing
 the linear region
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon
 <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Petr Tesarik <ptesarik@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com>
 <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
 <2025011247-enable-freezing-ffa2@gregkh>
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
In-Reply-To: <2025011247-enable-freezing-ffa2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_074454_275325_84281B45 
X-CRM114-Status: GOOD (  15.57  )
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



On 1/12/2025 3:54 AM, Greg KH wrote:
> On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
>> On 1/9/25 08:54, Florian Fainelli wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
>>>
>>> As a hardening measure, we currently randomize the placement of
>>> physical memory inside the linear region when KASLR is in effect.
>>> Since the random offset at which to place the available physical
>>> memory inside the linear region is chosen early at boot, it is
>>> based on the memblock description of memory, which does not cover
>>> hotplug memory. The consequence of this is that the randomization
>>> offset may be chosen such that any hotplugged memory located above
>>> memblock_end_of_DRAM() that appears later is pushed off the end of
>>> the linear region, where it cannot be accessed.
>>>
>>> So let's limit this randomization of the linear region to ensure
>>> that this can no longer happen, by using the CPU's addressable PA
>>> range instead. As it is guaranteed that no hotpluggable memory will
>>> appear that falls outside of that range, we can safely put this PA
>>> range sized window anywhere in the linear region.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>
>> Forgot to update the patch subject, but this one is for 5.10.
> 
> You also forgot to tell us _why_ this is needed :(

This is explained in the second part of the first paragraph:

The consequence of this is that the randomization offset may be chosen 
such that any hotplugged memory located above memblock_end_of_DRAM() 
that appears later is pushed off the end of the linear region, where it 
cannot be accessed.

We use both memory hotplug and KASLR on our systems and that's how we 
eventually found out about the bug.
-- 
Florian


