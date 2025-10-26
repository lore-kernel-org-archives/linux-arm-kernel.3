Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C50CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fYvW75mpSyvpvtiweDwsolagmegJ85pd3qFJm05W9s=; b=Hxl+Tq9//ZSCc2k4UDzfl+UUUP
	4SXnV4elOo61H8bIWLL85Ht5DzGUdAjXSgerX28HawbbXHsDOKEPW4Afsz9UaBeerimWtNtrITtkV
	f8k/LeVxs2O6JaV7ud8p/uMIxIsr8RFfGuV4jmHGAbUtqgluQwxOOthv6iniKrFY4B0Ojahhd302/
	FiE8h4Ce7YYQFakAtblKhGUV5MJJ15AV93Bno/rJ40p2c8m11wtFh0Kx9SoPncMmvkUdKd8kMQ8aH
	9SEdJJ4E5tbk+e0FJpvYRVJFKg6NKyKENBDl75t1AdzB5YgpliuDQerm4tBb8fQBcj0EHzRCGRasi
	V/ECvonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7DJ-0000000Chro-3NEg;
	Sun, 26 Oct 2025 20:19:41 +0000
Received: from mail-il1-x162.google.com ([2607:f8b0:4864:20::162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7DH-0000000ChrE-0M2p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 20:19:40 +0000
Received: by mail-il1-x162.google.com with SMTP id e9e14a558f8ab-431d65ad973so16440035ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761509978; x=1762114778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fYvW75mpSyvpvtiweDwsolagmegJ85pd3qFJm05W9s=;
        b=Y9mwt01ktc8eMPi4JypdDltjH0bwLHRu6OEk9aAsXApsEIsJ2u+BLxLEQ2EfmNUKPm
         TK3EhFeadt7a7qIQv+Z0/PD4AVgSpSCmy9IZy9N1/hp2PDZ1gatc3E6PwL7Yg6ARUNKN
         yf+fPHAzgi+gjIDHW0DKPeyJdfQo709OnuAL8CYG1i87EFgOi34DkN2mV56osz4rSRIA
         JnyayrJrVfHhsmL74gi7/B44ed1lMQprivN6PtqSF+z5cf+VtrikRz3HPDqP9gjbuIxC
         7IQ3B2VvA6ComkW2TlR2a5wivHbRfB5Co2auECwCpboKkAh8Z2KkI5VeYvRSr8zwrjcE
         uIXw==
X-Forwarded-Encrypted: i=1; AJvYcCVc/ezwMMrc0BJm+lmprQhJubdjtX4aA2AndoVCAtJkbD/bnyMdQqirRF16BadR/ut6OYs0yxcR1t6tkj46cuhE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5AT5wjrzQy0nqO/pztjqISNUa7D114fJ1Z5sDenRK4Ymdp7F9
	OqTaAd6YpmOgGM91nrNlwl+X3DngmCq0V6JheUSzG3SM4VAukJAJYtRVCVaflg48JeI2gEIOUnD
	o6/oTykpWKxMr2d86q6rUbiwCLrwSdVMJea5P2S9fkm8NS6ouvxDkHrIH4ZLciowUHlY6X02ai9
	aArStOrWC7CCQZmUeNQ14fepww0KdlmOpxYpR0+yF+dN99PWPpnd5gJZa1NCRxOgCEcvEWYDJ9g
	Ylvp7Up2kqIt+PT3SOSbnuW6QkB7IEv7sw=
X-Gm-Gg: ASbGncsB7HeTDUxH2gbTXefRmLrsniY13uDxGazk7ZcoW7AViqC4/Cn6h74q744SOvr
	reFLLIUodg476hsLdzGcIOZF+/V1ogQ50iZHN7eKzFykFHsgN96+3ftehs31iReBFCzPWUmv7Ib
	XdoP4LJYodXR+flVepoXWFAo4/+GOORD5mDnk0x7Bzi2SiscJkPgerPTE+z49ml2/t6n+BLmodq
	/3wGeF00H3f4cEnwVVnrB2F+Fc+Ds7gMYVc6oaFDHpudi14hwgAe4oSmYywWG3dfTXO0SF8krwK
	gbGd05+hzfK7UnCvRkFn32q2Wv0jgkxn+1kFgK8B0ZZpvUpwKv1TNlBXGBtbIX0oFRtGVBVNSUe
	kxygl6DseeRckO0FsI7r1Ex0SFE0fBuZVwKvdoKgwYO2AZxZ7uWowiF8552DZNxRFqI+WSCiDRy
	sFjvtFyFSw7/D6rxykFLR7GQwRsPMXpiXWn80zfxc=
X-Google-Smtp-Source: AGHT+IFWRaDDrCdb/x6y6rJqNd38UwXPxYDc9fV+40/x6jyANMLiV+tPo1y6pPJXR4nb7IslPlSRT/rX0O34
X-Received: by 2002:a05:6e02:164c:b0:430:8bff:c5a2 with SMTP id e9e14a558f8ab-431ebef1db7mr109116455ab.30.1761509978160;
        Sun, 26 Oct 2025 13:19:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-431f671bb4asm5399985ab.0.2025.10.26.13.19.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:19:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-294a938fa37so23391165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761509976; x=1762114776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9fYvW75mpSyvpvtiweDwsolagmegJ85pd3qFJm05W9s=;
        b=WZfoAYPcs0pGI/9mEnRh1B034aQ1my38pvaLAeZ1Ydj5RkYwyDBthLLHVBAlN30baI
         6RITZxY/gFcWSn0k6lJjOm/Wn5dRJ+qGocRmxG+TMPC8Grfvyf5LxdTn6ahdhyBDS5f0
         lWABjjwGFWnU1QgoRwMg0SGXvXT8xojbWn8Cw=
X-Forwarded-Encrypted: i=1; AJvYcCWXcHpL7fzsDilu/CdJwf50K1z55CBY2ZroxzX8UDYSs9gQzFhSDmEzew3bH6ApMFqidBtRDE+D15vcKdH7kOgU@lists.infradead.org
X-Received: by 2002:a17:903:228e:b0:290:cd9c:1229 with SMTP id d9443c01a7336-2948b9a0af8mr101404525ad.19.1761509976467;
        Sun, 26 Oct 2025 13:19:36 -0700 (PDT)
X-Received: by 2002:a17:903:228e:b0:290:cd9c:1229 with SMTP id d9443c01a7336-2948b9a0af8mr101404275ad.19.1761509976090;
        Sun, 26 Oct 2025 13:19:36 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf49easm58133635ad.9.2025.10.26.13.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:19:34 -0700 (PDT)
Message-ID: <eeb428cc-44fa-4d8b-892c-74401bab5c4a@broadcom.com>
Date: Sun, 26 Oct 2025 13:19:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mfd: bcm2835-pm: Add support for BCM2712
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250917063233.1270-1-svarbanov@suse.de>
 <20250917063233.1270-4-svarbanov@suse.de>
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
In-Reply-To: <20250917063233.1270-4-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_131939_134673_986E401E 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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



On 9/16/2025 11:32 PM, Stanimir Varbanov wrote:
> The BCM2712 SoC has PM block but lacks the "asb" and "rpivid_asb"
> register spaces, and doesn't need clock(s).  Add a compatible
> string for bcm2712 to allow probe of bcm2835-wdt and
> bcm2835-power drivers.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


