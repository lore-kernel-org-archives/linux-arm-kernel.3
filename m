Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB235CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjbdeHMBEOSMPFX+Z3uePz1MMNxDwCdB8xF7r1cvcC4=; b=RF1R1sQ2Q2CDTpiyvQO7mFQh7P
	iYaI+8QMLdyVCapUCTE2j7XKyK/uTtrd2du6E3nF/6y0MhpvYrvFV38V01fCn2FrwWUtKtKbHZ8vX
	BC1vgeSz5nVaCz5Jmo85IKc/4o3+ckSIDzFXn5k1HWPraNf4oP6Xs+MZ9KcW/RsWuvWPIGfrHVziE
	XyThgUUEGKhJCAVTnmTLdPTknGphQKYt5qm+ci+uakhLasqAw9uMvUU/3SrUiuEm7XxQYtSNGHNQr
	1JnMnYPwr4E3WLAUEGhYnjtWbQVZk6iZ1MtzD8yvAQVp2fOfbiDaZQuzWLHKTM1CwWCsYkNyfwvfY
	Urm8DW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZps-00000000Cs8-2Zyb;
	Mon, 25 May 2026 18:15:32 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZpp-00000000CrR-1g1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:15:31 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3698e34a567so9026232a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732927; x=1780337727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yjbdeHMBEOSMPFX+Z3uePz1MMNxDwCdB8xF7r1cvcC4=;
        b=UA1/nSQadf7PK5oehFC96Oc8aalCVIrQo5OdqC+0EZvuK0ry7eN/ABBAQfNaoxrZtG
         bGvplpNu6RaiBc08ocLn8ug9ME7wlZ7/hAkGYS5aTN/pbjwj3z5PQR1abRU/LDyFtnW+
         ZNWZVeWWTAcK18r/pRGF0Z82taMe7gg0G2asMLOEDnS3NWGWtUh2cIojytPsuXntn25V
         yRstMCoWESnnv8tSjSfSQC2IyhHGZIAft30Zj7/S7ciHe/kKu7NX9+OrqMz5vGIvZ+cK
         /FK97bQZzTPT7qQpCc+YQcykfHpVRnSvzSYnyhX86FNtrOznUqrJlvi3AyhixbpMOdLc
         f1hw==
X-Gm-Message-State: AOJu0Yw0Xv31xxl18fRQORh6wXNDgiFjaaIOSMVvpODvIYa/8buAHspt
	yhjM7QXkQT+5CmTsSgp1+TTxNEA7pOqRb7qHi05lKyZyPzaMCoQnJzqYJ00XqCg7FahH57XMrJX
	7Q/ITeWXNvBhMJZFcLRJwNqLEGUxMUhXylfp51r4HRHOEArcX1gsxg8rIaDm3vlxBAvHP76fMv6
	1+JXYzjW4aq89BhsedZM3J5iXIbMiQELAD9kGnIUM8upLx06qGa+HqkkNo5LDmkU3zyxAZ8QBi+
	0Vy8KiYkN05jCv2i01Y/ar75GW9SvbjLg0=
X-Gm-Gg: Acq92OER26uvl6dmjonCnF1enx+UQZiWhsAPFQSDikVOOHKAi1nib4Q4URhi2maJAug
	Yaa1e/cTskLH62KIDh/oSRkigrd1z83AfpUvBbeNFBZ1ptylJc6EtNa8OIf4coVksWAfUJupbcI
	bh0X8sVklSIhF2ACmi52sboqTbEnBgwKtO4HAJP9GMWpse+WhJKXEBJJemcYcQX44doHbXgOAY1
	id20HXdDBaSwPJOKfexIxwvaWj6sdarxrH0266GrDGWw3DWlWmclO/SU+XqoE9nuWU2eiaXxhkS
	R9SGlhG3oKgBmVnFlmknXPPMWw1Vn+5+OLAwlULEKpSoPzywFdwPOYQw5YXqZtVdd1hzEK1sl3x
	3cAdfpkPt/vuvvSWFZkDko4W/nQKxIifvHe6PpmZ8a/ea63TEq/ka30rpwNh7ESVqwJP+Zc8s8v
	oR60aYyN6XK3c0GjSYqTGM4nRUUfqMQ+dEnogc+jaSzPcR7DBzNIQIL7tz6vSdLpOL
X-Received: by 2002:a17:90b:2e04:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36a677c7a77mr14216407a91.17.1779732927220;
        Mon, 25 May 2026 11:15:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-36a721b37b0sm1001274a91.6.2026.05.25.11.15.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 May 2026 11:15:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fded513994so1486987eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779732925; x=1780337725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yjbdeHMBEOSMPFX+Z3uePz1MMNxDwCdB8xF7r1cvcC4=;
        b=dbRfH9oJEsfN27xo8xTBTOd0mItuNEb2Me4Ad80IYcfRIXcvvo7dAzeI36DQmAKC18
         YGNhzDoW5SyBdDr25cco0QFUG/SfDU4NFRvfDt3/cpHdjqdt7ka6PzWgOL675sH99MDb
         BgKfoPWjx/UR6bhgLj0dKJTqiqUc6/i/Wf1gk=
X-Received: by 2002:a05:693c:68cc:b0:304:5a9c:6452 with SMTP id 5a478bee46e88-3045a9c6cd5mr4157845eec.17.1779732924942;
        Mon, 25 May 2026 11:15:24 -0700 (PDT)
X-Received: by 2002:a05:693c:68cc:b0:304:5a9c:6452 with SMTP id 5a478bee46e88-3045a9c6cd5mr4157826eec.17.1779732924127;
        Mon, 25 May 2026 11:15:24 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f3feadsm10921365eec.13.2026.05.25.11.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 11:15:23 -0700 (PDT)
Message-ID: <724e103e-ebc2-403c-887e-d91e403754d9@broadcom.com>
Date: Mon, 25 May 2026 11:15:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: mm: fix kexec and hibernation with
 CONFIG_CPU_TTBR0_PAN
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Kees Cook <kees@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260523000839.430550-1-florian.fainelli@broadcom.com>
 <CAD++jL=QxG=e62aOBXCzuud-nMEKtiUd-6_iUAudB0DJRWJwzw@mail.gmail.com>
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
In-Reply-To: <CAD++jL=QxG=e62aOBXCzuud-nMEKtiUd-6_iUAudB0DJRWJwzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_111529_485181_92E16A60 
X-CRM114-Status: GOOD (  18.23  )
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



On 5/25/2026 6:35 AM, Linus Walleij wrote:
> Hi Florian,
> 
> thanks for digging in and finding this!
> 
> On Sat, May 23, 2026 at 2:08 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> 
>> Commit 7af5b901e847 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0
>> page table walks disablement") implemented PAN for LPAE kernels by
>> setting TTBCR.EPD0 on every kernel entry, disabling TTBR0 page-table
>> walks while running in kernel mode. The commit correctly updated
>> cpu_suspend() in arch/arm/kernel/suspend.c, but missed two other code
>> paths that switch the CPU to the identity mapping before jumping to
>> low-PA (TTBR0-range) physical addresses:
>>
>> 1. setup_mm_for_reboot() in arch/arm/mm/idmap.c, used by the kexec
>>     reboot path. With TTBCR.EPD0 still set, the subsequent branch to
>>     the identity-mapped cpu_v7_reset causes a PrefetchAbort because the
>>     TTBR0 page-table walk needed to resolve the identity-mapped address
>>     is disabled. This manifests as a hard hang or "bad PC value" panic
>>     on LPAE kernels booted on CPUs that strictly enforce EPD0 for
>>     instruction fetch (e.g. Cortex-A53 in AArch32 mode) while the same
>>     image may accidentally work on Cortex-A15 due to microarchitectural
>>     differences in EPD0 enforcement.
>>
>> 2. arch_restore_image() in arch/arm/kernel/hibernate.c, which calls
>>     cpu_switch_mm(idmap_pgd, &init_mm) directly without going through
>>     setup_mm_for_reboot(), leaving TTBCR.EPD0 set while the identity
>>     mapping is active.
>>
>> Fix both sites by calling uaccess_save_and_enable() before switching
>> to the identity mapping, mirroring what the original commit did for
>> cpu_suspend().
>>
>> Fixes: 7af5b901e847 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 page table walks disablement")
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Assisted-by: Cursor:claude-sonnet-4.6
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Please put this patch into Russell's patch tracker.

Thank you, now done:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9476/1
-- 
Florian


