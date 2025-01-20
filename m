Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50FBC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9UtmECkUOGKbPSUc5188JHwLBFmNC0aGmF3i6qmQOo=; b=HU5HKuFriASIGpr08nVU/LrYZn
	KG9nEXZJaIVomGV39cBy9rFznWCUVr8adUC9CdfWA+260xD+x4Xz7EXMt7L/+4RV7ukUaKLBDB0ws
	V6WnZ6yRIl4NZ6ttNsoCtJdcgLxQhc20OhFGuCP4n4yJClASLd4ORQf5JWDBmu0LF3X/1qZTMTXAE
	0avpIufb7HPhSt0sy9wplGgI0iqgVBhYpbhtz2sdw0op2nFK2aHTaZ410eCSFSIHasO+UW6IeT9yS
	MoRhpBBJuGQ2nQsaUTYAvhQvj3MN2bSIThRA2+9tOSl6RJbuMgWuIRf8ultqxUlQkot8/meSUsgkI
	Ow8V+Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZujQ-000000060Rn-0Fy4;
	Mon, 20 Jan 2025 16:34:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZui8-000000060HK-1mqq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 16:33:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-218c8aca5f1so107281805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 08:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737390791; x=1737995591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C9UtmECkUOGKbPSUc5188JHwLBFmNC0aGmF3i6qmQOo=;
        b=WXJ7nc3281rlnjIBnB1iiZ+TgrmtlDbUIS44n0fqgDAqTHl0+sr/UdcjwT52MK9t9t
         0RuxDaRaVnlSBbia0R/yU6tXD5IU2g/4y0Yx90QuBEcxefm8aqlgbhMYmSOZ3HlwMwGL
         0AJ/zP64KQtwdrO2NDnN5gXMsl8+kAJoXzu4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390791; x=1737995591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9UtmECkUOGKbPSUc5188JHwLBFmNC0aGmF3i6qmQOo=;
        b=ah6MFomvTjXNxB1ULhZQ5HhjA6H7G7xRMuuw9aU3xKyLUT98vhiWBkp48Ou6hveKSA
         uEQdT/0L6Qg5Z9pqBTV2peE3iu+vziHeN28LfG03+QVUkSpk5WR/tk14H5vvLritTS7A
         ac+0bt9Xt6BPLMN9c6+YGji92MhEYNYrokSj44HODNz843Oe2jQOy7x3UaBIe8GZtnEt
         Qf1h8RABf+4Q1dRQNXjKoX5kkgmWAmcvoiIc7u5FE/8zCC7GwQ9aPs1iI1CMRkAPHaAQ
         1QBGxprW+H/Z5y3ktUoaAWBRMRyd4gjY8u3CK5FU07qvNNNYLEN/FDqZb5AJ1RCqVVHp
         +HHw==
X-Forwarded-Encrypted: i=1; AJvYcCXIfOyM6Yp8bp7v5+6Yx4K1zM3PpZxSWzsywlO277nc1uGyMyQSVZV7ecO6GikPs0VzNiVVtofq9ej6uzpw/yig@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4h7zluSR/Cait4+schhKuMnbT5WlMQhAe4Z2VFi4LoscWh/aG
	sy+gjBz1jZT2d6ncMOEeF92NwV9t57X1i92u1t0/5YZ7F3kTgsLxZ1nWYRw5ug==
X-Gm-Gg: ASbGncvpGCoLubZocfQYSFnW76+9ZLXu6hFNxibOUwJk+hnic1i3zP3/wo5p/oY8eyg
	wn0CxVfLC0wV8oYtQUkKWQeWbzExeC5fdYXd9nxlX0Xw6jC7HcmEYiramJrW7ux4mZxdBNe0caY
	24n7wVQPTjW3g20vaXeiSXXTY4W1ba1p0vAUqvUF4oGIHUiJg4EC6rub86wolEkiWgvDK4pqbS7
	J8pNwIPjrrvD5y6St5pe6UpkqmczHn4oVfXHUOJ3e+XsKmFWAJlVMd0dShi3yr5IqPdckbpfBTx
	zly/r/kX4+ZYpI5IYn7NM0VmtrU88PkhJ+TEGSslDQTx
X-Google-Smtp-Source: AGHT+IFMpRo8h8RDCjagWiVwQZq/mBuVjymV9n8680cV1bdSUPqob1X9eEp6TCLVDGnqJlSrty23Sw==
X-Received: by 2002:a17:903:2449:b0:21c:1140:136d with SMTP id d9443c01a7336-21c355fb6bbmr230924425ad.40.1737390790581;
        Mon, 20 Jan 2025 08:33:10 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3acf2csm62483555ad.121.2025.01.20.08.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 08:33:09 -0800 (PST)
Message-ID: <41550c7f-1313-41b4-aa2e-cb4809ad68c2@broadcom.com>
Date: Mon, 20 Jan 2025 08:33:12 -0800
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
 <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
 <2025012002-tactics-murky-aaab@gregkh>
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
In-Reply-To: <2025012002-tactics-murky-aaab@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_083312_532500_1E465026 
X-CRM114-Status: GOOD (  23.37  )
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



On 1/20/2025 5:59 AM, Greg KH wrote:
> On Mon, Jan 13, 2025 at 07:44:50AM -0800, Florian Fainelli wrote:
>>
>>
>> On 1/12/2025 3:54 AM, Greg KH wrote:
>>> On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
>>>> On 1/9/25 08:54, Florian Fainelli wrote:
>>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>>
>>>>> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
>>>>>
>>>>> As a hardening measure, we currently randomize the placement of
>>>>> physical memory inside the linear region when KASLR is in effect.
>>>>> Since the random offset at which to place the available physical
>>>>> memory inside the linear region is chosen early at boot, it is
>>>>> based on the memblock description of memory, which does not cover
>>>>> hotplug memory. The consequence of this is that the randomization
>>>>> offset may be chosen such that any hotplugged memory located above
>>>>> memblock_end_of_DRAM() that appears later is pushed off the end of
>>>>> the linear region, where it cannot be accessed.
>>>>>
>>>>> So let's limit this randomization of the linear region to ensure
>>>>> that this can no longer happen, by using the CPU's addressable PA
>>>>> range instead. As it is guaranteed that no hotpluggable memory will
>>>>> appear that falls outside of that range, we can safely put this PA
>>>>> range sized window anywhere in the linear region.
>>>>>
>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
>>>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>
>>>> Forgot to update the patch subject, but this one is for 5.10.
>>>
>>> You also forgot to tell us _why_ this is needed :(
>>
>> This is explained in the second part of the first paragraph:
>>
>> The consequence of this is that the randomization offset may be chosen such
>> that any hotplugged memory located above memblock_end_of_DRAM() that appears
>> later is pushed off the end of the linear region, where it cannot be
>> accessed.
>>
>> We use both memory hotplug and KASLR on our systems and that's how we
>> eventually found out about the bug.
> 
> And you still have 5.10.y ARM64 systems that need this?  Why not move to
> a newer kernel version already?

We still have ARM64 systems running 5.4 that need this, and the same bug 
applies to 5.10 that we used to support but dropped in favor of 
5.15/6.1. Those are the kernel versions used by Android, and Android TV 
in particular, so it's kind of the way it goes for us.

> 
> Anyway, I need an ack from the ARM64 maintainers that this is ok to
> apply here before I can take it.

Just out of curiosity, the change is pretty innocuous and simple to 
review, why the extra scrutiny needed here?
-- 
Florian


