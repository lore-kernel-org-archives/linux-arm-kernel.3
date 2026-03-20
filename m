Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718111099B29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJqGquqzkfxqS4IFo/Hi5ODMiGLpsYRxUO+ZevxPhno=; b=Y2zXlRDzvJcznyWY3Ht/G1pCnA
	h22/HwajuqQbW9hfZ39bQuiN/7oEIEh9T+QVTmFkUPLlEWu/4mnh4mDHHOhps1LSi502fTRrh4n9y
	POZjZkZHc7mJ7VthomiLhy954iWsPxZ2bvfjFMJ73R2FEP3eFZfl5040u/EctFhYjoq+ptni7YbBd
	up+4KOUj5XsCOz2Boi2Co/3nne+THaZvQ1Hw1xFztdHDBN638kgecQFu3MSUF/6FZ2lAAYsvMSmxU
	7wWG1grKu8rGkppw52EnNSJxdvBazCqnClgwwlv+47gX15o5/Xu2NhAsA40hF6SC96wz/UANmuyhd
	JkX8fRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dYl-0000000DEeU-0wKu;
	Fri, 20 Mar 2026 17:22:55 +0000
Received: from mail-oa1-x63.google.com ([2001:4860:4864:20::63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dYh-0000000DEdm-2046
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:22:53 +0000
Received: by mail-oa1-x63.google.com with SMTP id 586e51a60fabf-40ede943bf0so415964fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027370; x=1774632170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJqGquqzkfxqS4IFo/Hi5ODMiGLpsYRxUO+ZevxPhno=;
        b=qxUUzQOS6cZcxu7NbK9Z/IketqOztWplFzlYwVZrW+YFz9XAFUbhq0nz2KBtQEl9Oo
         5bcK7lG+1Tw3XGFcYv1GSxlliHuV3xxAmxZ69A8U52o7yyAtSdADlVEQyqsLahVRLI57
         bRWiHRUexz3sz1S8MzW3peOECGONfOjPp9VL/lsVzdvM3IHue0rAZDoQv6Vhy4KG6N39
         2ryuRkiuiyr9fY9uyED7NMtkXrHdFmZTnbtFeiddNXHst49HM1LMbqP+F1CWHw81aVjs
         EYPhpLalRM95xKuTnTj9pcC8kL8apAkC1lMkLBhUaQGgEjV8RmPZj6TvGaj3KqqlV4UU
         eDQg==
X-Forwarded-Encrypted: i=1; AJvYcCVXk53kYnh8xZ3bQUff1cxeyWM5z5Vlwngt13hgXr8hHJ4cjfdPxJtCG6iFdy3TsCYcaKRnSeIEHzuAALB9WcWD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/UXRuRvVMTCweBd3iW+tuS3mC7aKDrDlgONVmDN1D5j9GCR5K
	egKgd8zPSmshZgyn0Ew5/xiWhacMiEX2ZBiaAJ+7YmS7QNa0IK1qfUSXt77T03T3HfOKOva88ot
	SP2C96ri3IlhMpoplP8Jkm6pS5M9Pcg6kNVzkku5RhEBBZP1rO6LJL9fSmK1qhNjTOlfJkNoKFg
	+Bi6o2Er4hoOij+7h2jHhf8ukmG+AiGroW2/x4wsqhXZ5dcrYCP9R8WemXzza+nFBlmCOlDwEXz
	3oXJaumYSX7VH83YIcxnmId7eQXaHNVqkU=
X-Gm-Gg: ATEYQzzXqA/NScNMWB1m2GnJTvpxeHa8x971yKuEe9yNWSwRmhGlpq2VRB0dcuX3SQ3
	yvWM+wXl9s5yLKKvcaVaANxQ/d9sfs4jX387lgP6/LuoS/Ucpv5U41DcHFzHFt3hIimMybMWJ9x
	Xo0laWt20bxQv73BVBoHKeyGoVBwSMhXERKKoF48hehXKH2cSFyf467WxigE5MbLEMExMCNACAP
	PkS2DYFuwzA9XeRLMqXE5VDrT15Vffa+LRHusVXprDU540pTcmvtEtYpuWRr1dIGuFsUTLwSeC4
	BIATtZ0SUjuPXFOdYWzoSHl0Q/O+afXNUd9ICFAEdfxDjaSHD1awShzfgfU8CIB1kH35QhUmF92
	gBSCiespQOfspUbp0MoyJ448KpXM4l2NWYOJgI4nUyyjobq6hNqW0hcWnzA0mGovAF/SzDRODDe
	AGdJR1Bg9N+4pZPxEHpZKDX1iCBWUpDfWlIhMJ8K/6WnsDmzm8YYkhybKU4sx7mdXC
X-Received: by 2002:a05:6871:60c8:b0:3ff:46a0:a25a with SMTP id 586e51a60fabf-41c10eff775mr2571873fac.4.1774027370149;
        Fri, 20 Mar 2026 10:22:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-41c149df254sm401246fac.8.2026.03.20.10.22.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:22:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso37286901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774027369; x=1774632169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oJqGquqzkfxqS4IFo/Hi5ODMiGLpsYRxUO+ZevxPhno=;
        b=MTWt6ATZhrxLOwz0DfRwNRxmuJimoVSgfsaRIJ+E50xiMq5tDEBRo6ZfO6E7e9l3bp
         gubfYfJEvmTrF8wHjPJWupVfWK8Gza1wA8rnjFHH/hTGOs8e8RzIG6aroIkKVu27xqs6
         7u0qph+GdM6Uwf9AGSrs6gYewEnfuEVUgU7aE=
X-Forwarded-Encrypted: i=1; AJvYcCWuwayTGHCV789INeu7UqrqUxaESXtull5zkSIH+jDrCZU/Dtdr+V6u2rcL5z2tyQ8wWBlIOcKisY0ea1nsu4Ze@lists.infradead.org
X-Received: by 2002:a05:622a:1e92:b0:501:4d61:f02b with SMTP id d75a77b69052e-50b3759199cmr59306941cf.59.1774027369142;
        Fri, 20 Mar 2026 10:22:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:501:4d61:f02b with SMTP id d75a77b69052e-50b3759199cmr59306491cf.59.1774027368639;
        Fri, 20 Mar 2026 10:22:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm24884096d6.39.2026.03.20.10.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:22:48 -0700 (PDT)
Message-ID: <68148c62-1cf7-4b65-a3b3-3b2da86a4a3b@broadcom.com>
Date: Fri, 20 Mar 2026 10:22:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: broadcom: bcm2835-rpi: Move non
 simple-bus nodes to root level
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260320154809.1246064-1-robh@kernel.org>
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
In-Reply-To: <20260320154809.1246064-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102251_972780_C238A89D 
X-CRM114-Status: GOOD (  12.52  )
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

On 3/20/26 08:48, Rob Herring (Arm) wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
> under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
> is part of the firmware, so move it under the 'rpi-firmware' node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Florian, you have the fixes for the prior versions in your tree, but not
> the original commits they say they fix. These apply without the fixes.

If you were referring to these:

https://lore.kernel.org/r/20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org
https://lore.kernel.org/all/20260106-dt-dtbs-broadcom-fixes-v1-3-ba45874e4553@kernel.org/

I did take them as a prerequisite to apply your patches but a combined 
set of patches works just as well.

Thank you!
-- 
Florian

