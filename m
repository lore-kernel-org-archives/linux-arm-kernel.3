Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3ACC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oowGCRlPnH53+dvEhVfbik3/aGzqGnubNjPU1FCxSc=; b=KLPuw5LYcyvOXJiAOFGsKVCROq
	v873tP9JUlNse8Mg7/umvMPGfdc5HERMMAZuVTDu/Nu4/a5MJMkYv6PdFrwmDa+65fUJ7Kt1SpR/t
	2WNggCofEzvjfnljvuatNOGpRz8+Bfc0amP/GVrTJsKWeFGh+3eNGFe1xh8Jo0LUwujfGqMRozzPN
	tkbHzJofa9lUEbIJEyRlFmJg+CDMKvsvsGhHqWvNakYG7xm0hK+Tw7DJ/jYY8FyEFvVQiRGvfn6Qp
	nVZe/iNZU1HJFrQyxi0HZ8FkHwfUV+XQBQq/dIu6yXYVXZuWEX4IkEn/O13N2ryXKnUhJx93eL0ba
	ZKTayzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCalp-0000000Erk9-14wd;
	Wed, 07 May 2025 09:08:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZGP-0000000EXvv-0PMY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:32:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-441ab63a415so65446855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746603139; x=1747207939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/oowGCRlPnH53+dvEhVfbik3/aGzqGnubNjPU1FCxSc=;
        b=Imt5875eyYtp9Dl5Xtrm4gn+A4Oxr8c1h+ov8QLNR7LwpR++dUdYDX8KGWMhGUrqFR
         Sqa2krnuFbuUpENSl725O9yY5Zq1cSHPGFr4IkffqUhe6WWyDWu2oMoYFIj5pFl8SxKb
         4+duIWH7AtoDFQ0dqcgcxn9Mt10MKZ09qLVC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603139; x=1747207939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oowGCRlPnH53+dvEhVfbik3/aGzqGnubNjPU1FCxSc=;
        b=pMx057BMzYptgLH6sbFIw6A5rOuO5SkoaQ082jro2YWR/5lTndcdjAtq9xSb0NWH4w
         TcawJuZih/Ora0uR54+VAzFWYLDXhfjfU0dOJfRsYuaa8r9lLKLwVSoPeppapoIVaZlg
         HgbJH7K8hl6FgOD5/uegC584hn5TMEhYqnTg4GKzNaaZIp51xNA6ip4WOf1T0ZxKZT/U
         c2pOIN63zaU0JiPmTlmXr5DYJ73KIqpaph0l7mWwN0oA7PyjCuG/3Ycgp4rvnUpi9oZY
         Obl9nHaCwxvD8CkTS/EEQXsvzzrTpVwF99WKvFkFpNW8HBPjU4pMvIKq+ibBd5VhrpIm
         yv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVumcmw2Vxj0DfiCFmzlXiqvqaWbiB0Kh8JlzliMX+zmI+TntCU7URdAAKS0wJrt7mVZxz5a5XsauJIUG0V5pfo@lists.infradead.org
X-Gm-Message-State: AOJu0YyFfMDfsBGWzrlDsbdZDeuuUQ+UmLOhC2I+wkI9aJKmwpmQwEPF
	ypqQN6r3XgljTv5c3tKLYv8+Sd6mGvp/gpPvxIVJyiYNxuBTSy/BwkrpbSiQxA==
X-Gm-Gg: ASbGnctzkKeox4gO8+13L/oqdEpy8AhyGH+kJAsViMoEeNBYYy0TXqMLeiNFGSmtu2y
	ucJT/8pFh+VbmovLpMAMhf+NsElyM/0fx3NVml3K45sjOM4pD3VlY1JQdkmIsebWx5XRBzv56Vd
	7dQ8qSfXS79i4sH9A8nqBkYLDqTvJ4ikUpSqrN0MSsZngqHFoXGsmolFmEpGV6ywxviWIipMQk+
	nbYtdsXntZece7ZDYnacIZxYKcJesWYtqUlmh4XyUFMT3cHa6QJu4bVHNQrlL7UZjG/lNq2cO2N
	TG/mGoBz6WZdzHmF4BHaXiZNKQySByIzj5ZEvWi8fgPYWO05PP2xbdb+6tJncckbeJsvi5edLpr
	cLV7OJE4gxfmfDtSZQk/agCIYpunU7yvT2i85UVk=
X-Google-Smtp-Source: AGHT+IHhnQ0XoKBKM5DMQ7zEqqg7TzLxsMCpqS1ZcloLnADNH5WKFeYw2vsLW0QXNRCZ5zE1p7gAJg==
X-Received: by 2002:a05:600c:8289:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-441d44bbf50mr17486185e9.2.1746603139011;
        Wed, 07 May 2025 00:32:19 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442c98fd955sm5285245e9.7.2025.05.07.00.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 00:32:16 -0700 (PDT)
Message-ID: <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
Date: Wed, 7 May 2025 09:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
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
In-Reply-To: <aBp1wye0L7swfe1H@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_003221_234786_0C52AB33 
X-CRM114-Status: GOOD (  19.91  )
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



On 5/6/2025 10:49 PM, Andrea della Porta wrote:
> Hi Florian,
> 
> On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
>> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
>> Add clk_rp1_xosc node to provide that.
>>
>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> A gentle reminder for patches 8 through 12 of this series, which I guess
> would ideally be taken by you. Since the merge window is approaching, do
> you think it's feasible to iterate a second pull request to Arnd with my
> patches too?
> 
> With respect to your devicetree/next branch, my patches have the following
> conflicts:
> 
> PATCH 9:
> - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
>    reference at the end, my patch was rebased on linux-next which has them
>    while your devicetree branch has not. This is trivial to fix too.
> 
> PATCH 9 and 10:
> - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
>    added by Stefan's latest patch for RPi2. The fix is trivial.
> 
> PATCH 11 and 12:
> - arch/arm64/configs/defconfig: just a couple of fuzz lines.
> 
> Please let me know if I should resend those patches adjusted for your tree.

Yes please resend them today or tomorrow so I can send them the 
following day. Thanks
-- 
Florian


