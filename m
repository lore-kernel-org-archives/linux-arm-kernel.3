Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD43CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOTKj8tpz01MaGMVzsSQtC4OpLArhDy9QDma/4n/B48=; b=wAgYsUqWW2bjdzGhT/y5J4nRjY
	yrvMNCqYtRaF4IDsFayzR4YCY28g/c69kzqdlvZrb9vUsX+zCJO+FOiE7o/F9fiEn3woa4DsR1qUb
	RL9D4F9R3t3+uUrIVTVPEgisOMEdNs5KUVDYEhqEi6dEyOGAsNovNEhh4Xg3m0Of0SCVvjVUnMZuj
	PTk6MYKfMkXAXY//FuBvvS/zS+QO9jU54t+H2vI+Pvupvw9y1Z5eO5AIBJI7hDW94SQVFMsj91Yi3
	jzAzBRXxVOTlu5A8V6vjAj7sd64SEudYqFVVjUtA9XU/av37GOjBCDp07ZSe2Gxq12tOb0qsyPb2X
	fDmhqCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgKu-0000000ExxL-2wkp;
	Sun, 16 Nov 2025 17:14:48 +0000
Received: from mail-io1-xd63.google.com ([2607:f8b0:4864:20::d63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgKr-0000000ExwF-40LW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 17:14:47 +0000
Received: by mail-io1-xd63.google.com with SMTP id ca18e2360f4ac-948c66f367cso224602039f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 09:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763313284; x=1763918084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NOTKj8tpz01MaGMVzsSQtC4OpLArhDy9QDma/4n/B48=;
        b=FnfuBZtUHjFD2Y6Gqh5WGJ7utCe+Fp0Ra0IK2/PF7vMrrgtdZCAm2gS3H+ePjyzt9X
         PhYdD5b5EuKsVZV5tss9L6MnaHVlRrEP7IyC7WClreB+iZgzcq9zN48xVZWdBj3Mib5l
         ykmoO1UxFzYu0x4xuE8ThFKkMZ8XkrMS5xqABQWxxESNhLOUdzbcb20sfv5eDdBnK5tV
         BJnfLRVPpCqPK1AnO/OoDrETuJFCar65R0eMAEJV9jvC46rRn8mj8Xilh2zll4oSyu+v
         JpejOecj+v5wme1Bj6EsROFazROf98uzUBS0ACUtwlUFNTu/ZK/MU93LwNf6NUDpWjXR
         sd5A==
X-Forwarded-Encrypted: i=1; AJvYcCUfcZJEHstn47Rcf2Ps6k4WGHHjdmsLllWgvr2u7UpzYGc91LewViaD3Hq4yhoiTEAmoW1P+CpVg483E1N3e90p@lists.infradead.org
X-Gm-Message-State: AOJu0YxUpHwn9co+JGLBm0aiH1QbG89yK22PwVFJxGml6JvXt2VgfbcR
	ia6s+noPee8pZS7CLk5ZTs8+7TyQb1P718yYVXRLWaEjXppJf+HI0Xkio7hv/E6KRtoeeTC+34O
	MQUpblmqmW3ijwhWm5Omi+lIJN0iJXaaNuG0HBMdEkCuIMgYKwi7AUZNHNRhQhnvgJ0/LvYEzhT
	LXiap5JTHSiUXxl2DufoVdu9elkicGBV53AkPGmhZeiOoxlbz1soWDaFMwaf7scy891e/+DGeyh
	Ib3r+K//dzu9+Hdx9X3sPW6CujJuIIpbDY=
X-Gm-Gg: ASbGncsjCteMLwISErLKWmaP2n5XrpKNpGGRrR/3yxXjMuRukF5yph5sewVJdSxQiE0
	HONy/Gsnr1DS5qlFToLVR1tpCaB88OS+H1hMKEc+pXhoTf8N4dz0STz/NVuBOL+SDoEFHwiReMp
	iwErDvE4mzHCTb77DfKJDoeTtiQ0q+/mXMw+TWEpNykWRBJ0Iegb7NLFHLrUop/D8s0iVEFGZhy
	6FGiHdHy08hxz7DrCARgzk8DzPH565tX4/AB4KCohdTGN2Maqm2/yXrE8zC9iJesnMU7ktJF7BQ
	RrCrEDmjpN3FTrKgsegYAyg/kGczdRmQaIBevB7IXx+rp1ssnFlNE6L9TdzNCPHV2THvLuStBpG
	p/CyS8umSR85qVTgeB/KjjBAAhS2dEd+yidEkb1JWNlhvk1cqhgnJS14LxNaVhpi3pcv9Ucdjw+
	Zwq0eQhchadiV6HURQLI5ETxW0GFLxMXKd3HOiO6m8iQ==
X-Google-Smtp-Source: AGHT+IFDk+Vh7jAFryQoValiZxwwUo/1vUdPIu2f+LkUkaC05M5Zz+XbCd0yY0zsSiWzcWA/xMzVUmTXfhsM
X-Received: by 2002:a05:6638:4d20:b0:5b7:12b4:475e with SMTP id 8926c6da1cb9f-5b7c9d5accamr4409444173.11.1763313284220;
        Sun, 16 Nov 2025 09:14:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-5b7bd319dcbsm678022173.20.2025.11.16.09.14.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Nov 2025 09:14:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3438744f11bso5841020a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 09:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1763313282; x=1763918082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NOTKj8tpz01MaGMVzsSQtC4OpLArhDy9QDma/4n/B48=;
        b=OpRydXRsRtGDgw1TTVAfZfKK7sYKMa7do7hHT1jRtsre6v6K9rve/agraCJHbpfzCp
         /USWywH5bpDaUL6qHV1vnW6knzeaP7g4OGrJVJ+ofNafQFJRjYrXLdXnB/7enJcuxHNv
         NvjCpwPJEg7Is5wCf2AKTgu6aof85CzDIi62U=
X-Forwarded-Encrypted: i=1; AJvYcCXFWeRTg4XBB0H7oH787SruACYAV6RtCVOw35XQj+kNqRBwglyjWsdxsEp44KRYzNddcO4k4XEuBBQZS62rqXrA@lists.infradead.org
X-Received: by 2002:a05:7022:e0a:b0:11b:bf3f:5251 with SMTP id a92af1059eb24-11bbf3f5610mr1981579c88.16.1763313281951;
        Sun, 16 Nov 2025 09:14:41 -0800 (PST)
X-Received: by 2002:a05:7022:e0a:b0:11b:bf3f:5251 with SMTP id a92af1059eb24-11bbf3f5610mr1981564c88.16.1763313281466;
        Sun, 16 Nov 2025 09:14:41 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11bf23d6967sm7117621c88.3.2025.11.16.09.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 09:14:40 -0800 (PST)
Message-ID: <a56e3318-b29f-438c-9da3-556555d633d8@broadcom.com>
Date: Sun, 16 Nov 2025 09:14:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Fix V3D deferred probe timeout
To: Mark Brown <broonie@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kernel-dev@igalia.com,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251104174518.11783-1-wahrenst@gmx.net>
 <cbb49407-5b66-409d-8a0b-260e50932156@gmx.net>
 <aRnXMzuxPXfmRf30@sirena.co.uk>
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
In-Reply-To: <aRnXMzuxPXfmRf30@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_091446_126379_56A2BF0C 
X-CRM114-Status: GOOD (  13.31  )
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



On 11/16/2025 5:52 AM, Mark Brown wrote:
> On Wed, Nov 12, 2025 at 06:20:38PM +0100, Stefan Wahren wrote:
>> Am 04.11.25 um 18:45 schrieb Stefan Wahren:
> 
>>> In case these kernel modules are provided via NFS this takes too long and
>>> the PM domain core give up before the clock driver could be loaded:
>>>
>>>     v3d fec00000.gpu: deferred probe timeout, ignoring dependency
>>>
>>> So resolve this issue by making this critical driver builtin.
> 
>> can you confirm, that this fixes the problem in your case?
> 
> Yes, it seems to work.  Given that this patch was applied I had been
> expecting it to show up in -next but that doesn't seem to be the case?

It was applied on Nov 14th:

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=020e792ca39b
-- 
Florian


