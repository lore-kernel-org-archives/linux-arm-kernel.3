Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3385CC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Ksm9mowr5e76oy9bv/8McEmzTkr4pMHatHJvGkvcI=; b=2vk6XL2ruJwe9gBuzEbdVhnFaL
	2W1aoACJNFPDx46fd1tQWmS5Rtq/9SL8gC4KepXLhbpMDO9AasmpIAl/G/z85SAP5IFcGfpchAdPN
	GZj3ijRWPFA2On4oULAooPeWuPy5++IjwILz3eL+EtrnjpeIYKPGhNPcPYCaNUKDKO+LVl/OJ7Sd+
	ub1f7oX4i0kMfmKz9nLPx5XVOsGaAblS/wvReHH05KLxfjdEi/LKbHPvTq46WpVCYNZg7AbibGT3D
	sqxGfN2f/O0/KMJlAtPSB5FXUkbqQjS0tJmWpG/6BxdelKmr7YmWHaTP2st5YfdHO1+BsFMpW4WJE
	VClOCndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMia-000000039LG-1FZY;
	Wed, 26 Aug 2026 23:07:40 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiH-000000038rX-12Wd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:07:32 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2147722a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785640; x=1788390440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w+Ksm9mowr5e76oy9bv/8McEmzTkr4pMHatHJvGkvcI=;
        b=Lonx1Jdi2NlQd6tZomSD5/rTFwb952byXKwUKVQWdkR17BPVQs3qbOg/Xz484S4zbc
         BViTPY2F7wQgFgWzNiRTrQCbaJsTTPzl0qUf/9SUs1YmvBCIsIxmeY/iDxxFaXgJDnE5
         bdAnvRs65Rv9HlYkgm8v80NSwbYn2g1E2GSGjBHyzRuBT8rGSzSwLz2CRv0fX+n/JxB0
         sEX4ZptwrM8C3lDgcHxrEZIs8WYzdXsQz6NaTyCcx2XVoTP69ZPZZXukFHktiev63AKZ
         Xs6uDR2bGgdNzBIwTNXND0Q0NTZQwUw/MrSLR4gds2ijHvj4o4UFYR/GFovRYbmLsHQi
         P7KQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOYz3ZtCzsLffel8K8tsJOJkJuMjT9MZNL0YIwO0jqwGMW2vIti8PzpoUajruEChzqHaE1GGUuf871sTATmxiO@lists.infradead.org
X-Gm-Message-State: AFuF++kK4cHgvP7dZYmALD3nVDOMZD+ylt1XXFCsdsgqZbgaJclh22eA
	wLvEQWfHf7lJ+uezSycsQlSkB1dALrbG8Xgd1VNH1Fp0S6MgSl3p8eofK5KcRejF5qsCXqsxIv1
	hotU97pI+XrXQwcEmqwcEskuMiK4EbIrlFq3dezzy5aTAVa0GNfGvjjCjrsGgnNGqEtKYv9hi1e
	E54TPZ0aCqEYwnky4SIZx+5yhSqHbgGIOew7gHEW13S6ZMV2fATPKDSZXAbnKdHLQzI/WaknLAC
	7dRPfG5AgvtV+90CfpPfGDQ8AOeNyLDAj4=
X-Gm-Gg: AR+sD12I03JjTwECjn1KQVQ0RooCkw0sTezaLWDEJIL3eStecMU5fZ4jGF3bj+PW4MC
	LMFWkKfXNeaHn1IrUUg14yj2vD/mdGXzz0JCtvJnrF/O1bX25hO4dVfFmBEJAWoOkYP4EjSlNYG
	Nvoy9pXELovPeMPigg1VGYIB6aXqmtiXYlVgDXbRAYXLr/Lfy5kzbgCUyFogTMllSY9wDi7ixdm
	onl70J/L+DLz4imUedND9NJcazFvkS1QYqCAg9OF3Ga1nXdZGHLWQScxjYG3K7UdwGg7koHB4jL
	VmggRnoLtHTNq/6MePIyD4U3deBxfg3c5Ty1IDdi8h4MovKjqXTmj534tJygovTcr+I1S3ucgsm
	yo3H/eBpaH1C1Bj1jgPH4u/pton3TDRGX8D6GOtxp+IP3/VZlfKJBY61GqC6YXjPtAcNa3B3IeW
	25fO1VTbwngn1Bqv3w4N1Wbhog8KndFw1h+Pxo9MMh
X-Received: by 2002:a17:90b:4e88:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3966d3e1aa7mr23890810a91.9.1787785640013;
        Wed, 26 Aug 2026 16:07:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-396b0d800absm42760a91.5.2026.08.26.16.07.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2259232a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787785638; x=1788390438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+Ksm9mowr5e76oy9bv/8McEmzTkr4pMHatHJvGkvcI=;
        b=EnOFC9/fDzq2JyPYkSvPuFgRUVvU8U4Tyb7/nU8xb+ie5p2D0UqFUBOfpMbtLFUQci
         Z+7fmwlVefIgrf/yNy+nGgpsfiebiCDv/waEKIlnPX5nu9u+PROXv3K2RE3rVatxvKXo
         sCao2SueEZWNSSItzlLEFKS9oiRx/9ygG1Z+M=
X-Forwarded-Encrypted: i=1; AHgh+RqMFPj47+JWxBMcQVnxBzXnEBkpQLW5JlrTi7J1ORoFeZeKAKBvA0UGnx3ZCq6GtXDuLsbO5w2YQUYqNdz/mPB4@lists.infradead.org
X-Received: by 2002:a17:90a:dfd0:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3966d144247mr22371187a91.1.1787785638361;
        Wed, 26 Aug 2026 16:07:18 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3966d144247mr22371084a91.1.1787785637871;
        Wed, 26 Aug 2026 16:07:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d769d81sm12061409eec.13.2026.08.26.16.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 16:07:17 -0700 (PDT)
Message-ID: <3e5ec697-8f8b-426d-ac11-4c851aa5204a@broadcom.com>
Date: Wed, 26 Aug 2026 16:07:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] memory: brcmstb_dpfe: Bounds check DCPU-supplied
 MSG_ARG_COUNT
To: Danesh Petigara <danesh.petigara@broadcom.com>, mmayer@broadcom.com,
 krzk@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-3-danesh.petigara@broadcom.com>
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
In-Reply-To: <20260826201500.3000125-3-danesh.petigara@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160721_351114_684B980B 
X-CRM114-Status: UNSURE (   8.67  )
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

On 8/26/26 13:14, Danesh Petigara wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> A compromised or buggy DCPU coprocessor can make any user who reads
> world-readable /sys/devices/.../dpfe_info|dpfe_dram trigger a kernel
> stack out-of-bounds read of arbitrary extent. This bounds checks
> chksum_idx against MSG_FIELD_MAX after reading the response from DCPU
> message RAM.
> 
> Fixes: 5d06f53d9509 ("memory: brcmstb: dpfe: Compute checksum at __send_command() time")
> Cc: stable@vger.kernel.org
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

