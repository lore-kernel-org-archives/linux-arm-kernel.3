Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9800C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0gJbLAjrAkHetISJ9E7BaKmcamQMw9Vv0f9TbXVRXo=; b=lZiic0DFfuwtp2aMmOj7ftXVXQ
	RzHucnND8LD14t4k2ieyY0XUcOYCMBD3j+cJBAa2smxqJdRxelX69Ap86qV/bYEG600REi119nZ3x
	BjgtTcRp52/yDRsp2QnB990eJslI4ItnjytYmhsYHhj1QlDYWZsEV05inWaJeIR3M4zVGYKmvFyrX
	qvOjrR3BgeCs7Y1W7CiUHtdt/qV6dz+STOBc3jwZCH1aAU5gM2o/Op1ZOGNPPtGGpqK/iPSgKg8uY
	ioqH/y03YdAzwSxrsQHnm0gKFr5cUUfj65ik/oEDFj2MsfBmQfk9CJHBkn89fR850wFK4o8Z30FHp
	QCoNfVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMia-000000039Ky-0QMs;
	Wed, 26 Aug 2026 23:07:40 +0000
Received: from mail-vs1-f99.google.com ([209.85.217.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMi8-000000038Xh-3ZFO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:07:26 +0000
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-74a9ac9cda6so1051834137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785630; x=1788390430;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q0gJbLAjrAkHetISJ9E7BaKmcamQMw9Vv0f9TbXVRXo=;
        b=Puo39hcc5GJkHbSot2SvhnfmbHkrfLnrHPwT9M1ILw3dVPnQXmxBfSfpr+AiUfxUnE
         6GfIXpMyrmDgJFvqPYSgixs2bxyVSo4cvZ6qeJ4EovwuXE9lS/qEimQzmVt9v6XwdsJI
         bXe3y9GPVqntlV8caPqoogKr36zQ3rxoaVUxbyKD5AtWUeQfEy1jwqUmff+FrEMy1Uyc
         qD7CGMkZunPF7CyisJ2IXo8qKqbijhtXAioVyMzjNOsd62ahkIRejBN7HQqnqUH7fk+Y
         J6UdsLCOpjB5n4QJsSr6ihlDU9/pCNdmnMs8aRizdkipabgIDUhXixRF+Wp79A8+W6jG
         R59w==
X-Forwarded-Encrypted: i=1; AHgh+RovGrKmBdAVFzyXDvjXSmpfDGVpiDBxpV+T3jQ6ED4r8yK+EW7KY4PWJZhzz2u0X/eJO620s5wfKzsO/6P1Mi+H@lists.infradead.org
X-Gm-Message-State: AFuF++nKIJ1P4rp/zNtVnGb3IGS0uYXqhQGApRERjNyhiRRen096tX2K
	QAEJ43kKNAiHtF856abr2QhPEo7AZ7cu4UlxjJRoLH7wVF9IHsZEfvTza83IIp/XgK3mAri3Jn1
	e/T4cRVdadfiDacVD7GThko5LmVdM6evEFcT/oELA90quyGEfjA9auGbnLN/WsCaVm1X+VNvL7Y
	fdkuPonkbhuZ3Q+AvHWCj3OXwZR+XF6W8P7pm52/Y0agYbeFnzL3KpTtOdeFdcC/yOYb6wui3Wa
	GYeAgXJqux6l8zxvNxo8iZeeVv/U1Y4B8U=
X-Gm-Gg: AR+sD11Rl9Y+EdGsUtssWSpZV6LT/oMe/KIDN214Id0uWfDuP0q89FDtaSRKrZ2CziA
	Yo5SYkSKLraFYcU2YIem3HNqLtvol3RITO761a01wxWz7x/CWYLW8lzZfurN4Dcu33LW1SMd/AF
	hVGyNARGNuBgGbEP+NuWks6GWQ5TkDSS16j8Q+heRZQitX/6Xbtcfye4wrQDJlvzBQl37rcUNfy
	8inoSQTLWye5kty2Zt9Mm/GrYHEYxxt9E6iee0jn6rVqiMPG7LM39k3QzjgLI/5EruI+2dAmw0G
	nytOlnCIa1dSvn+R2kEp1mxZNnk/Slt2nWcK0hTpaZ4AJt/j4PhDAJA3lZ9BNnroO1Qmk/FyYLK
	ra/bNDq0CILeb9dvM5DjhsdFZ3R2w1summJGG8JyqrvQb0eEXchmNkg3zy5B8PKjwVl5u4KFVQ2
	L8KS0c4p6dD4t2zFYmd73r3h2tdvn6Fu2LEOZYx9nc
X-Received: by 2002:a05:6102:3ec7:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-782bf9bfb45mr4399190137.3.1787785630375;
        Wed, 26 Aug 2026 16:07:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-97cbe240fd4sm829164241.5.2026.08.26.16.07.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so17269235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787785629; x=1788390429; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0gJbLAjrAkHetISJ9E7BaKmcamQMw9Vv0f9TbXVRXo=;
        b=FusZ0rOdIfLkIHj/a3A1EEByt1zHAr6vuYmP/OSR4izsxAn9X95z6Yt9ljkTNJJr3C
         g68Tv8U2z6V5t66SwJox9U6PHkdsz+BkobqTNLpBVlaSCRIm7vJCfexbWg/NSnvG5yIl
         Ih9h1YZgOb1fyHRu7RfXJdbOfjldm8e5LLARw=
X-Forwarded-Encrypted: i=1; AHgh+RqyhvdYwQRvmo+aPbhf/sc78xgrNNkKWSBwGVTYaoliRhXuYzkfSDl9w9nyNZ3Rb70+gnmbxoZDD7UL0RAx/SGD@lists.infradead.org
X-Received: by 2002:a17:902:f689:b0:2d6:dfaa:c26a with SMTP id d9443c01a7336-2d707aca9c0mr173277145ad.8.1787785629081;
        Wed, 26 Aug 2026 16:07:09 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:2d6:dfaa:c26a with SMTP id d9443c01a7336-2d707aca9c0mr173276045ad.8.1787785628341;
        Wed, 26 Aug 2026 16:07:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm11957547eec.14.2026.08.26.16.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:07 -0700 (PDT)
Message-ID: <f4b6ab1a-44f1-4e50-ae43-c55b080ab327@broadcom.com>
Date: Wed, 26 Aug 2026 16:07:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to
 DCPU offset
To: Danesh Petigara <danesh.petigara@broadcom.com>, mmayer@broadcom.com,
 krzk@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-2-danesh.petigara@broadcom.com>
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
In-Reply-To: <20260826201500.3000125-2-danesh.petigara@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160713_162905_706ADE7D 
X-CRM114-Status: GOOD (  14.64  )
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

On 8/26/26 13:14, Danesh Petigara wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> On API v1/v2 boards, the DCPU coprocessor can steer kernel readl_relaxed()
> and writel_relaxed() to any address within 256 MB of the ioremapped DPFE
> dmem or regs base. The DCPU firmware provides a 28-bit offset which the
> driver adds to the ioremap base without any bounds checking in
> get_msg_ptr().
> 
> This allows a compromised DCPU firmware to trick the host kernel into
> reading or writing arbitrary memory-mapped I/O registers in vmalloc
> space. When combined with a root-writable sysfs file like dpfe_refresh,
> it provides an arbitrary MMIO write primitive. Similarly, world-readable
> sysfs files can be used to leak other devices' register contents.
> 
> Fix this by recording the resource_size() of the dmem and regs ioremaps
> at probe time, and rejecting any offset that, along with the largest
> field accessed (DRAM_VENDOR_ERROR + sizeof(u32)), exceeds the recorded
> mapping size.
> 
> Fixes: fee5f1ef6cf7 ("memory: brcmstb: dpfe: support new way of passing data from the DCPU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

