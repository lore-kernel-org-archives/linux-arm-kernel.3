Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0E2CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 20:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tv4EJsASL1wPUSDcCCUa8FCSZ/HO6INTApnbMDnxMQ=; b=xfFd5QUUp70Hvi98udwGNPN/3N
	wODe93uQYXon/SDGMing8Jck9hfM1Oe0vZfOKryuH5oxxr160WsAFku1CCZEbyBX3niCt4oA4ArnI
	Ow0FcRZkhn/WERWGVysPJ2rSnAoCL68DnesZNekaCqNVFRaHxPZEuSIE1iNv+CL5a6LodVw3zllmF
	f13etMjNMfkly9xxaOKth1XiaK2On/bdsmXuZ+K9RaxzJMa7vX0n7ej9J2xeKPqVAWPWRcBGSmpMM
	Dkfb6KDuzLSOLJnh+5Mqywg0aOu6hISYsZx6j5bpXjokdD6QjAlBkECOZSbI6VyBiybAVPNQxA8RE
	L1GV944w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7Gg-0000000CiK3-0PK1;
	Sun, 26 Oct 2025 20:23:10 +0000
Received: from mail-il1-x162.google.com ([2607:f8b0:4864:20::162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7Gd-0000000CiJM-3DB1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 20:23:09 +0000
Received: by mail-il1-x162.google.com with SMTP id e9e14a558f8ab-430c97cbe0eso40354365ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761510187; x=1762114987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tv4EJsASL1wPUSDcCCUa8FCSZ/HO6INTApnbMDnxMQ=;
        b=s7GvUCpLAWkd9ZGEVKscTlo7G7Yky9ZdAXXy76l1gwyo2qyfhUGe5hQPjKixYPI6P2
         M2sp82wUbcrspBw1XkKNtK7ipujDehxEvLazYffKtc2+ZFEAY/MPXe0eCvtv2JNJ3Bwn
         RLABdMNwBx70eKMZYdf+siI0AY6UYcynEdk9Fv0DPk4uqYZmGzZlZ+cUyOBBeK4XTq7k
         eYstjK41zmv8t4P1zu97aTvhMI3eoOQKtz03p02hsTgWlJE27hUcqN90E9jsWk/H9e/e
         QOELCkhRGHQlX3RbM0fgsBaxieoeI3j5C4xvBu5f/Qhtl5TsuQAz7Kg7FbUjXzMCn70g
         UxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtxlzKU49onLrAZR+uMPJmimW5co01ClFR8IOHzd8wVOmdB2qcV4jl5oa1qyOXchcdZC78iG8hBaK3EFOaRrc1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/5IX75wGU/82yRVmE686y4irRnTnOyVorqXnJdVusF6of8ml
	L9PI/C1zNPCJScm7TSGpIduAA4bLxQp7biQ6WUXmiaaDyULwR3ryt3VaIOWKT5hiegUU39f0zdr
	Q/yNksfNX5ajYN14yrnNqDBE5ARMRrhOF1kkdbd7YmlOAeS4BDFFo8FI8cksI+hWAHnUiujWgyq
	+9TKnH0eIHsmekbhCWYs5frwAxpBCCCHZzVeZL6OOUW0e9bUOjzqFRUud/itxIv5N6/pVbaJb8s
	yTYTYHkcEnsIXC8hd6ZJF2D6VYpmxbCdoY=
X-Gm-Gg: ASbGncuLM6PJOUB1nL+9n584JHWxIHZDxDp21mRYxp7szPrgKIBTQBEcs7y4TbjEGK7
	c/Oqu60lYM6EWAFAdWs2dMYgn1JDVHNl7LzwCeMf+0GU2Py0c7n0vJQEpOJUXxm5Q0QIZPgo3Um
	aW5oSl2PC69+ccbHWz4jha5ss7RhLeWaoXEPmTKM9yP0w9wpXgk3xVLoMye0noOjTz+9Ghfjxsd
	Gx5jYhGPfuGeb7rn++D2bg977HP9oSKcUqG6tgqHAWLVDi6QSgqpgdm9Oiglu3H/TLbXmwCKenf
	Yy1XVNfnzIZAkEIGD9QsCb7razClzQSOsJGxpTTqJpmjn6bY7kWF90Q2ohp1o+IIL+0oKziur/H
	PZcoq35npgZmqG58JPZeExi61LsxxXnt7erOjr+79QHJGSc5KtGbHp/YVjmv9ld9BR4s6xbkPE9
	HUb0khSGKJjQMbqR6vKHJj2qhJajW+uZTPpwHrAhFUNw==
X-Google-Smtp-Source: AGHT+IEojBJ3HZmA2n41c06izt4UHPEfc42oE5QGLf32NA0rJA2QaNeZClOvNC1bUhlUk/PiseZTLviNZoHv
X-Received: by 2002:a05:6e02:1707:b0:430:ab98:7b1f with SMTP id e9e14a558f8ab-431dc1e2718mr182206125ab.18.1761510186974;
        Sun, 26 Oct 2025 13:23:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-431f689a695sm5403655ab.29.2025.10.26.13.23.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:23:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so3281767a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761510185; x=1762114985; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8tv4EJsASL1wPUSDcCCUa8FCSZ/HO6INTApnbMDnxMQ=;
        b=d4kXB064VCRoZxRJC6iKwpTmydLmsBTU6ILZ9zFDmmidI59sHj1e4Kotne4c4eifzI
         gKn/YUkRJCPb2boWLH9E8c9htRGc5zNwI1/8V5qqVg2ynrM3UGVTgZp6E5GQ52W+cSts
         OEpzAfy9AJMqOW39gsUlqUouUgcSopWlyEdOc=
X-Forwarded-Encrypted: i=1; AJvYcCXC/ecR2mPJZkyubmDzEmRsRn20TiD3ppRnuIzv4wn8RbUwmELXjK92YzoAKRm0G4viZ5Lt4qtx2gxt+57iUfQv@lists.infradead.org
X-Received: by 2002:a17:90b:38c6:b0:33b:c853:2d95 with SMTP id 98e67ed59e1d1-33fafc8a042mr16326562a91.33.1761510185410;
        Sun, 26 Oct 2025 13:23:05 -0700 (PDT)
X-Received: by 2002:a17:90b:38c6:b0:33b:c853:2d95 with SMTP id 98e67ed59e1d1-33fafc8a042mr16326533a91.33.1761510185004;
        Sun, 26 Oct 2025 13:23:05 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm5951572a91.16.2025.10.26.13.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:23:03 -0700 (PDT)
Message-ID: <c379087c-1702-44b7-a890-beb5b77d794b@broadcom.com>
Date: Sun, 26 Oct 2025 13:22:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add watchdog support for bcm2712
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250917063233.1270-1-svarbanov@suse.de>
 <CAPDyKFpus05RAkYAoG7zjyvgAJiuXwRt3=z-JB5Kb7mo0AK4vw@mail.gmail.com>
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
In-Reply-To: <CAPDyKFpus05RAkYAoG7zjyvgAJiuXwRt3=z-JB5Kb7mo0AK4vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132307_816417_1A5EDE34 
X-CRM114-Status: GOOD (  14.20  )
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



On 10/13/2025 4:08 AM, Ulf Hansson wrote:
> On Wed, 17 Sept 2025 at 08:33, Stanimir Varbanov <svarbanov@suse.de> wrote:
>>
>> Hello,
>>
>> The following patch-set aims to:
>>
>>   * allow probe of bcm2835-wdt watchdog driver for bcm2712.
>>   * prepare bcm2835-power driver for enabling of v3d for bcm2712.
>>
>>   - patch 1/4 is preparing bcm2835-power driver to be able to
>> control GRAFX_V3D pm-domain. This is a prerequisite for the follow-up
>> patch-set which will add a v3d DT node for bcm2712 (RPi5).
>>
>>   - patches 2/4 and 3/4 are adding bcm2712-pm compatible in MFD driver
>> and update the dt-bindings accordingly.
>>
>>   - patch 4/4 is adding a watchdog DT node for bcm2712.
>>
>> Comments are welcome!
> 
> This looks good to me!

How do you want to proceed with merging those patches? I would assume 
you would take patches 1-3 and I would take patch 4.

Thanks!
-- 
Florian


