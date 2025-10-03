Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A62CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhq5Xd4Igc9fjcR+TCYBH/u4+ukG5nbOgfFURkP/fuM=; b=kvaUti4WMP8r8CqTbBER7SYhHa
	E4yLRPSU/5TPC5fI2ziXR+JtfsuCc7EUbc8WWWT3K5/75NgLL4DUFoxMIHL7jEtuvgEgY0xxii174
	wECpZgrlnYaXKiLJMx4GA/9TU8IFOJCe7cP6hzFsjg8GrzxNLT4XWITHQHiLofu5xF9PPB5DJ/dy0
	jK65qtq1yxJNW1PvjODxcwAFf4dXABk+SvP/5MBE/dQ+nvidJc3NRodBPHquiK0KRUpqyVssr4R+r
	jqekbjI2z+ohunaBXPLDBkU4YE+t6sDX1TVhlYxXQW8W3FGWspH4GoWiWyp4l9ZCp8P59XfVrRNpN
	O888i/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jHw-0000000CnYq-27MX;
	Fri, 03 Oct 2025 17:09:48 +0000
Received: from mail-ua1-x961.google.com ([2607:f8b0:4864:20::961])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jHt-0000000CnY0-3X3p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:09:47 +0000
Received: by mail-ua1-x961.google.com with SMTP id a1e0cc1a2514c-89018ea5625so950588241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511384; x=1760116184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rhq5Xd4Igc9fjcR+TCYBH/u4+ukG5nbOgfFURkP/fuM=;
        b=akd9u7g2y4TA3KzStyYiIUsvxCD6aJ7M67bqXuSFTVUcDk0w/l8HQbXTEj/1CBlHHO
         4gP8EzGKiMN0YiBJx5eHmRSlYFMmfAHoHIz2sO1KP+KUPfdlNbHSw8sYqrIoGrKkkQq8
         xnRzwXwnSP+ImyNM/B8UESm+/MMY4s5waBW/J7JP/fYiXqkQPJwtQcYZ50MtqEfr1JG1
         n9WcUNm9x4E2t8a/mfcXkRfB9iPx7gB7IhNl+X0rKzmjkJ+jzfu2Dj23fOjBfmU/YsCn
         CnQ84CypeaKG/Q7dYQa0b25GDCGM5Ut9T1Guj0wgq0tUUjYJd5Vmbqv0kFOGlBCycxLm
         qEuA==
X-Forwarded-Encrypted: i=1; AJvYcCU38b1X2+PI5RUS3FNp4S/gJOkRyd6UBLmuxeZgbzYdg57zSAcDUZOT4xshdoKATFa8/o6hgFOhM3z10sqZ5GP/@lists.infradead.org
X-Gm-Message-State: AOJu0YwrVESJJWsvdqIF5gIG1MD4T9jHw8K9uxwmtRkDK4+E8WHOGgeR
	6u1icj3pBrcePa9YfYaVvzd90MK65o77Ge3xmMHmdj2IR+sTKiUg7LN2YRur3nRxF8wRuQaE5S/
	Ea5c+K3R12BU6iIU3lsBzar176gU4HTBRywXAjYhvtOUgMhpgonA9En7wUMEm9kVj/wGuMvT4I1
	I1WgLVFgnT1KZfTvrtO/aP2hfkC2BWsQ82mG/bEFWOYbFLbQqxVyzsaaQUSYc8umrA265J1Y2fn
	+pwimQXmHldiCLNfVYEYOsAt9FmjhiFulQ=
X-Gm-Gg: ASbGncv1NDHo1bGrd9ef7MNu4vnkltX9iXKEMSZQvPzBNVXYCV7QZqMNcgiCFEkYKo5
	86LnxgLTne2L2tOo2uciwiqVmOQMDw10L5wsom/YEis/XAaX0yzZY0Dom7LvAvzNqZbseFAYMR1
	SYDvM8lKBQHDLzBi9NiqmaVt+PuHO+Aaq9jXDbfRCxlKXvqjAIXEqf1x3l2mwlozFKQHtpOmYK6
	uMNHxasZuaL1TQN7IsjDGtb//hND77arh4c1PR+LLSWSDi+QugNKsI0hQZfheyfhaYk164vAJ7m
	I0xBoqdl0eKPM4AZDd4gy2U9ciZHCYzhgGZ0v3SFHCd4PHDmo9hrLSCyrl3HCN0Py87kvnZaLMV
	cmBpj/bVEVT+TqTjmm+04yabbsJUUdVZNmlmvvq1YX99X0/yF9BpZ/OnDQMtapRRzEt1RtG3yYp
	gFZI/OfLrRJ2hg
X-Google-Smtp-Source: AGHT+IFxgZ7a2oXKc+XY/El2whoXfG2v77BsnWrvaAh1fj0VKAmQTf7BrUfroMaECYT7xY3wDfSlq8smHP3a
X-Received: by 2002:a05:6122:3181:b0:544:b862:1055 with SMTP id 71dfb90a1353d-5524e8b17ecmr1382517e0c.6.1759511384464;
        Fri, 03 Oct 2025 10:09:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5523cffacc7sm511784e0c.3.2025.10.03.10.09.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:09:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so2039352a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759511383; x=1760116183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhq5Xd4Igc9fjcR+TCYBH/u4+ukG5nbOgfFURkP/fuM=;
        b=dTRAPztBK6CMJpsBTlXLVJg/IV7865h33GAsJXwqveyHIYk2Y70YYb1TkHNH1VY9uA
         iENp5fJ+D6QQ55CWQZvo2wU1YrTcFYB7OR/npYSiIJ5ogWGaVyW3bp3gA7imseqZi1hr
         ohhuG8+X7qMvWZyv6Ox6WSTzFB2eNMZMFKss0=
X-Forwarded-Encrypted: i=1; AJvYcCWe9/NqdqHwXYYrCG3YbpEaolT3cBLoTm4loXai2kqfiP9DJLGFQs9VVg2X11qbYaQ7HciY8PG5ykNTJH1G1Vbw@lists.infradead.org
X-Received: by 2002:a17:90b:33d1:b0:336:b563:993f with SMTP id 98e67ed59e1d1-339c27b9360mr4610180a91.34.1759511382725;
        Fri, 03 Oct 2025 10:09:42 -0700 (PDT)
X-Received: by 2002:a17:90b:33d1:b0:336:b563:993f with SMTP id 98e67ed59e1d1-339c27b9360mr4610148a91.34.1759511382294;
        Fri, 03 Oct 2025 10:09:42 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a1a19csm2669228a91.7.2025.10.03.10.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:09:40 -0700 (PDT)
Message-ID: <72d1e09d-f30a-4f8e-95c3-b9a40e1e1b73@broadcom.com>
Date: Fri, 3 Oct 2025 10:09:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Add support for BCM72116 and
 BCM74371 SD host controller
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
 <20251002210426.2490368-2-kamal.dasu@broadcom.com>
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
In-Reply-To: <20251002210426.2490368-2-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_100945_897527_84CB070C 
X-CRM114-Status: UNSURE (   8.36  )
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



On 10/2/2025 2:04 PM, Kamal Dasu wrote:
> Updating compatibility to support BCM72116 and BCM74371 SD host controller
> similar to other settop SoCs.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


