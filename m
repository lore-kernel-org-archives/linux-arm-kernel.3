Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDB1C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbmjJn4KRbF8oVMPpkd76I/qR3hSpCdh5Z2V63vUrww=; b=nfovguNa5Fav81ARKGJ+fwiB9w
	IWGPZn/+0jUklObXdNJR0QzCv5VELoOEE/5Jl6AVKISCeVbqB7WpMHkuGDr0WzWtB6tS18PL1WcLJ
	dRktxFvMieA80hO3chqVQJieMjygZfW4hUVuykqpLvEJtB/gfP2D0phtkFX6mrynJuBrsiyYYpeZ6
	zoqR0Q1C6acbF88hKysFfNZ5xmBSJpGVGsSW/YZ+gcRUiZRd2qzcjCmqxk7RXOKGmzfTCueqY62tS
	ifXC6RpVu9AvNqWRajySgGn3xo8YsPFNPpMHUFLqqlymccBv+rw1Ka8RROQtKY5NQf/Kv/03tbptS
	nOmE37DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DF8-00000000UXz-3ge7;
	Thu, 03 Sep 2026 19:37:02 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DF6-00000000UWl-3AuC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:37:02 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-c96c92c0980so217617a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464220; x=1789069020;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wbmjJn4KRbF8oVMPpkd76I/qR3hSpCdh5Z2V63vUrww=;
        b=Ms4zOLqijEfsJoSpziKBCPLiKloyO1tbezEA+l3zJCjwxHVOVHk+bJrljZ29XUxaVD
         YqoRPStTagzCj4b9GKU75sm7RjVhI+BjQle0p4JUP9ZVp3mbLlWYhdya8DpvDS7GaDT9
         L8dfI3UkeKPRXbamk8gAxU1cejNxau+4+1xBN4IxQ6qeaJ+07TDMKqh1gtthrYC8r2uT
         GF4UHGJzHCsqB+Dkjus62XmfLeUvvU4BpzmQZPO/2Z1Kn0yWrAi8HYR/gctJLz8Wk3qL
         4RV6BybSUnWJVNxXi9BOpJUNR2fo2F7wfZS+xJ8sGUlFmJLNIWYaisdtl0jfrzA3auaV
         MYBw==
X-Forwarded-Encrypted: i=1; AKwUvBySAt4XFgO8G7/oFew5SC/rnw7VqhpdOyGP4Fs4iKRNvkWRP1/gnqADULOA3vL52SAkLjdvly0zcK1S/qKDUski@lists.infradead.org
X-Gm-Message-State: AFuF++kNEEuyHgWJ/MBoaiPAYdX29Ncwmsr5OWxnAQP1hu81bgIkUPUn
	h9VrZVpRXomf1XPQC/oOPxeuJQhClbg23cllnWFf5d/IazdJZ+ysAcMn44bUnkfHhqBP1Lo9VKF
	1DTGhzn5U96/MXgBjmUC9i1/NkJiNAMjup8A44972OGmI/RxAX49JlCRtTIBk6q5vPgEYyrnNU+
	HD9BMtqlQHkzxFws94763vdPJb/LimkZbXn88BjHbGcOUKH0EkUhTC+kEOh4gPZS2O+7Mp+fium
	L3PnBGMChu8Vt2mLgXURowOrRJy43hlF+s=
X-Gm-Gg: AYBFou2H7Mw5RBMkL4SIbv/bf/VZdlLPzYOA/3k1kitBNJf6qJTycM7VdRbjqbVC9pX
	2gT7JArBACtkGjWWURbowh3L5MSsv/d54uYkuP3lpGYyoIAI598agdnlcrLH/owPENcUdhBc/sT
	rbAnOJdhd7qXmU7hevooZgB1iOmUCuDJxS8dPDJs8lh7Lat3fIlIPsgWngHE6TCF+feXxi1kdHf
	NMkgl8+hqT02ypp6QHVn3Y8rDAZctrayZbxJQSxz49V/1tlhIOiRrT8bLLiZOkTZzYhG8tmgjbj
	9vb/g2UAvR3VYfrNjaL0q9DkIyN5+DbN2wynK12AqdCeiipt10B3get3eZ6ryRTkwYfSJxMSMwh
	hng7MBvTaXNyU8QQHwsaAfYDRZla9SMimYOAMMDB+G0jkA5a3ai9zKCRuuBwtel2AAH1dOYhNyv
	ZNlZLFHrnzoP8RSpoTB+e/CFtCmkWyv2qX6Ulm17SZ
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr1269507a91.15.1788464219795;
        Thu, 03 Sep 2026 12:36:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b15aca3fcsm1492541a91.0.2026.09.03.12.36.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:36:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso6411481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464218; x=1789069018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbmjJn4KRbF8oVMPpkd76I/qR3hSpCdh5Z2V63vUrww=;
        b=NCjjGHylRizaADT3YLl22uaFq4N3VNcE7sqHSxd6wyyKRbWSPtrXRK+wUCekQNSO8M
         22K+SYvbKTaYZXtVZYO8r6ziYgoLIXu9YY4l5Y/jPeMDsrd1FSQ4bh4f13nQ0txarZQh
         11JDzccoE5aJhA9vVk2/V3sCbOHkiX78Wo7Gs=
X-Forwarded-Encrypted: i=1; AKwUvBzByg0wILeaJodCXpLZ0C/rkJtHyf9XoIvcrpfqtc8kChDJUV3XwIkozwEj7C0nEGXSMC3dy1ErrrwpbiMj1OVM@lists.infradead.org
X-Received: by 2002:a05:622a:4d8f:b0:527:7027:cc1b with SMTP id d75a77b69052e-5305499cdddmr13859111cf.32.1788464218341;
        Thu, 03 Sep 2026 12:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8f:b0:527:7027:cc1b with SMTP id d75a77b69052e-5305499cdddmr13858541cf.32.1788464217801;
        Thu, 03 Sep 2026 12:36:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406af144sm1966286d6.40.2026.09.03.12.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:36:57 -0700 (PDT)
Message-ID: <fa26224e-9f93-4a65-a265-2427bef7094c@broadcom.com>
Date: Thu, 3 Sep 2026 12:36:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d
 compatible
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
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
In-Reply-To: <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_123700_932826_0D53BEDB 
X-CRM114-Status: GOOD (  14.51  )
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

On 8/16/26 07:05, Maíra Canal wrote:
> "brcm,vc4-v3d" is the compatible string V3D support originally shipped
> with in commit d3f5168a0810 ("drm/vc4: Bind and initialize the V3D
> engine."). Commit 90d7116061f8 ("drm/vc4: Recognize a more specific
> compatible string for V3D.") added "brcm,bcm2835-v3d" in v4.6 and kept
> the original one around, because the Raspberry Pi firmware was shipping
> device trees that used it.
> 
> That string was never part of the binding: the documentation added in
> commit 4653f22e9ab0 ("dt-bindings: Add binding docs for V3D.") describes
> only "brcm,bcm2835-v3d", and no upstream device tree has ever used
> "brcm,vc4-v3d": the first in-tree V3D node, from commit 49ac67e0c39c
> ("ARM: bcm2835: Add VC4 to the device tree."), already carried the
> specific name. The firmware device trees the compatible was kept for
> predate v4.6, released in 2016.
> 
> Drop it from both match tables.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

