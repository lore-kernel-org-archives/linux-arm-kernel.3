Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D830DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Wd1oeWyHI9gXwuqG0xZ0ivGODmZaK+fUcpqdzaY6Nw=; b=QRbdTxVOZRofN+O04Veobr9Yrl
	FnWcCI/1wbOYTair4I+0TbnTfqgyknPkTB4eDz0qQqPP4zDSA4WGWHMPfVd5yn5oZoNtJS+A6jJXJ
	lbRam3M3rlcT7SOmGELoRuzGBJGVccXz8eTBxR1+iftImQFgTnBYe4pSuxCei35T8tORoL1mMz/7x
	e3wAG1A8BR+0bcr3ZTA1pDr/oTC4rm5oAInZmul78Xzei3f3JWiFP6fqdU4OicyIJlzkMA0v+K1/d
	DV9yDxSzY4q0yeAte5KfyQhbb4OX5DVUNzlLqwdQ4XxtJ0K1zdxbLXGZVeTYvDwEKJBaxeA4z7frV
	M6GxitSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUGi-0000000FlOr-409A;
	Thu, 16 Jan 2025 18:07:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUEA-0000000FktY-1a6N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:04:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2164b1f05caso23585535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 10:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737050661; x=1737655461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wd1oeWyHI9gXwuqG0xZ0ivGODmZaK+fUcpqdzaY6Nw=;
        b=VDaEQ06JmmAO0NDfrsaVRhRFilFTVKjqtfR61FFSMd92h+UO+3rslBq6ZkSd6G8a8H
         Jc31WNzRxOgUZvm9krB53jdCU0FGYYJwzkAwRQyQhgtrquEZ99s5c6q+TZiXk+jOikOs
         8Uaokh8W3+ogAe3WJSa6Q+MxUyv4bxOqHglQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737050661; x=1737655461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Wd1oeWyHI9gXwuqG0xZ0ivGODmZaK+fUcpqdzaY6Nw=;
        b=WDImBO3iXuoZ83iiCzCM27MjMvC7GzsxmNT7IHsqSosl8PnB98qyeMkCEMEbxGn0PV
         qYVxagFPWMnhFqwKqgjYmwUsf9I16WcxZk9VDyUrGvIXF4rWhwm8NGF8l+HmZuI7fKOl
         uWvBCu3LxH6FgRgkHmctKed80UYWu52Hkf9lhyotflIQSndX+b8Sk+tsSi3SJc7kZnXd
         dqhA7jErzpDnQu4OeZrO8aoGfngmhr15ykKvunPvUkraHwr5oUIaZCeFDyTnHbgteZa3
         lxuxiKln6/+uIgEpKpTiemyN2QZUJxQ/H/JmXKDvPJgpP4EqqGnHagoIQw+t/Ywy+tgt
         sMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJOZ+RMRKDS76HIC9zxUL+clhmHFn8K85iBWRDb2HXnauR4u7dw02z+Uduzarj6RbsJfCOwMAryVhvm3JUR3Wy@lists.infradead.org
X-Gm-Message-State: AOJu0YwXqBF7+V+qJ+W6BSkqY3Clh2q+q2jlgNZbagw5f9HPiXLVlQy0
	Y6P9oY+qPTrjEFexBfHSRgyy71DUXoAMmUyooxMJP5UxTVORp02EMa1g0LyY3w==
X-Gm-Gg: ASbGnctJ/ytFru8I5fvn5fPMUJJnwJj+6oQmgVWmeYa03yYJ7O+AwYga8W3NTDc6zsM
	6G5QMQlKn130TLRECqne2Q3NHr01Oas6IDaYSuZHr3rF8HMwGZ6Grn4HXdyJBNTGXn06hK8bpJQ
	SstSaOUDK2DVMGbNPAmPwn6fsjQMzF3qmX91CVuoNN6UwQ1oCc8fUISvUndq4Tu4TfFr/BruPba
	MY0LPp7uCyJIY8hEuGvoVVKXOrV6s7JXQe7R3jqeFJKI8r0//cl/dEQB/YFt0yej3z4a2fxTxml
	WbsyfElp6nT+XlwV9NlC
X-Google-Smtp-Source: AGHT+IHdMjYWYUPWi30MlBFs8sU8F6TlSjCCIdRcJHouC8fvOgy8yNmIwKVXpO733Awqz9ZjlbG2TQ==
X-Received: by 2002:a17:903:1245:b0:21a:82b7:fea2 with SMTP id d9443c01a7336-21a83f592edmr479108815ad.15.1737050659554;
        Thu, 16 Jan 2025 10:04:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9b3asm3086255ad.75.2025.01.16.10.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 10:04:18 -0800 (PST)
Message-ID: <967278a1-a2e9-44c3-90ee-ae9a57a54421@broadcom.com>
Date: Thu, 16 Jan 2025 10:04:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
To: Celeste Liu <uwu@coelacanthus.name>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 Thierry Reding <treding@nvidia.com>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
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
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_100422_414791_34D1D7C9 
X-CRM114-Status: GOOD (  14.65  )
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

On 1/14/25 12:41, Celeste Liu wrote:
> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
> 
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[2]
> 
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> 
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.
> 
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> 
> Tested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>   arch/arm/configs/bcm2835_defconfig   | 1 -

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> # 
bcm2835_defconfig
-- 
Florian

