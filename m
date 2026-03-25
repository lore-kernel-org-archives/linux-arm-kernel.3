Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081BE109E520
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw946c6lD7idOvtVe7nhLfI1R1dfcg4B93P+3dXRKWA=; b=PGzsjvgQAoBL1yHiWYSNaqmU1I
	ewV3zwOd4P9XvURgOVRTy6sECCN6m5H2ALQ/QVf8wqoW4n8Y5TOlfmAIa51Fo522AuDhc6IcfolqM
	kWOXqe6Gd6Ebzsc2pA9JcKTdjcbZIR16Qihp+594iDgMij4kcxNwFvWRje5QKLGrXElL8XTswhaVz
	nnpyJOUCR057I3ufOi/DS+Gy8kuKacjBjcdJ1SEHGlNZUqU5YIIO8Y/tInjmlHTAVevjmH1uLyX3Q
	tD36WuSE8onqodMAwTzhsx0p2UtEhpFWVF95pUUO8b9JyMNiMx145IXSBDzZXg2jnasxOss3Vd81Z
	F3u4wWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WBt-00000004ImC-0CWA;
	Wed, 25 Mar 2026 21:55:05 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WBp-00000004Ila-37oU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 21:55:03 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-89cab686a9bso2307186d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 14:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774475699; x=1775080499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dw946c6lD7idOvtVe7nhLfI1R1dfcg4B93P+3dXRKWA=;
        b=FsucueEpg6w0XFOr57fo1is54r+bKh9G43jUtThSvUwX1uaeHRkcBJWxMtJA1T3UH/
         LMCgygdZNdEDUjHJP0YMRbwPmU5C7bAKBwp8QWhTsAZotPWEmUSuGgapW/CH/jpY0PsY
         iWJDtTC/Zp7IXwmFd6Lpeyew5Nf3HefJjTf1KqlsFGS726+Yed2VA62KS/xHa/0IxvCm
         Xo4ozcRenGubx6jrvhhQkvo7TUxjQmWP8a6DJFjwRW85qALib+SRPNmbjcK4u48zDUAi
         +Gl6KFcNowM2wZ5o5+jHeVOibE38AcE8uwvej4IkaTdm3Za6o0YXj9VLaaLDdw7/fw0P
         44ew==
X-Forwarded-Encrypted: i=1; AJvYcCXpzmQew7vd6Z4EC5WzdPuviEeHZ4WD4LYxyD1ffOCJFcHF5vyyIFT7QsDHQV1j69x6YBbp1cea4qgloIBgxy8f@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1N1NkzwxmTlAVsCcgqRAj0R5R+gRwtIpgswjVTAB96aWfiUAT
	lFC23iMQFc4fzohUAwFYG9L/Bdj5aseS1F7Llii5aIst7ijWm8ZvEsJdZImK2Yd6v1RL1f7x7I0
	KHnEZ6bnrhGqkTBpPM5vgB0p/wqAppkHdUbDthCHB7k19A8F5hD+RhAf5FM76MKUbTtZ/2wlsMW
	bLLvwqPwCXophAC71GEkS57IJDFaNglywSZ3ZF7r4+lMtI6YFjbOH5duClWHFiLjjHhs/Zi225R
	MQjC9EIqv0fVF+wLhlz0I0NjtT4vBkNeac=
X-Gm-Gg: ATEYQzz/E7N8SN4KNVMr2uPuWmyoiNlpul8Ia+qzoJn3XIV2CrjrwkaQChQjEHIvz/y
	CxUbzgjyIQzE7hauVlIJJH9W+jAzxVgwT4ZCTDOPWG8H2v4PhcoZ8kRDG9KkyO7JL9fw3HokGHi
	0/VsIObv/AQciOI4uuSpqvqRsprHir0Wm2fw5EyygGVcafPqVCHNh3aAWkT42xy13Pj7mbR4PjC
	9vXtdDgJfcHE86b/OXZtU/8rDd/ck9MnM4EejDT5FRtk2q21yl8Br1GVZJXFGuQThIJJ5TVTbsE
	08xpfN9B/vGro+C0PfW9+cGVaz24Us7bSId3fS2uUmpHafSvhDyvwHrv+jyCjT/gCaWQS5fpuTv
	mKjvp+OPbGoIgiN3nqwb5VEm9ajSD8bAq35vCASg26MewE9tC8fL68cb86DIpv9LPjSZLadiybZ
	Ma95AyJ2VOqY5JR4f9+QzOPX0U1llGGXtODkI4LdR9CPseIv+I+dDlt9Dj+bwbtA==
X-Received: by 2002:a0c:f202:0:b0:89a:321:a198 with SMTP id 6a1803df08f44-89cc4a9b258mr73699376d6.45.1774475699275;
        Wed, 25 Mar 2026 14:54:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89cd5875659sm816066d6.12.2026.03.25.14.54.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 14:54:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc1634e43so78127585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774475698; x=1775080498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dw946c6lD7idOvtVe7nhLfI1R1dfcg4B93P+3dXRKWA=;
        b=Bq6LrWtwHOqV9N3wzCbvk07ZUvv0kMKSaigWndTn1ApfLHZL9PXLV2i5OB9DLsgZWN
         WQmKxRCeZ9JHLiqHf22oh4mPfxckykIz++tA9faoW50McG5Ar+VA5W14s4ke2cCmARes
         yUHkiveTDbafX8LbHvhtP5BWHpKizS3A1wWAo=
X-Forwarded-Encrypted: i=1; AJvYcCWieYd0IAU/wi9CtK7O+isCCoDXcIHEvuaYzh+COURrb26FwJul0VnzOmp0B67fzlKGRJhv/mtEw44rpFyFaa2I@lists.infradead.org
X-Received: by 2002:a05:620a:44c1:b0:8cd:81cc:556e with SMTP id af79cd13be357-8d00100bcccmr709588585a.40.1774475698353;
        Wed, 25 Mar 2026 14:54:58 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:8cd:81cc:556e with SMTP id af79cd13be357-8d00100bcccmr709586685a.40.1774475697803;
        Wed, 25 Mar 2026 14:54:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e4ce917sm116872485a.31.2026.03.25.14.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 14:54:57 -0700 (PDT)
Message-ID: <e03f9a55-54c3-4bbb-8709-3c8e02facb12@broadcom.com>
Date: Wed, 25 Mar 2026 14:54:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: brcmstb: consolidate initcall functions
To: justin.chen@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: kees@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20260325174619.3761964-1-justin.chen@broadcom.com>
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
In-Reply-To: <20260325174619.3761964-1-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145501_949722_02D9FA00 
X-CRM114-Status: UNSURE (   9.62  )
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

On 3/25/26 10:46, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> Merge the separate early_initcall and arch_initcall functions into a
> single early_initcall. This is possible thanks to commit 6e12db376b60
> ("base: soc: Allow early registration of a single SoC device"), which
> allows soc_device_register() to be called during early_initcall by
> deferring the actual registration until the soc_bus is ready.
> 
> Replace static family_id/product_id variables with a dynamically
> allocated brcmstb_soc_info structure.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

Will wait a couple of days before applying it to the Broadcom SoC tree. 
Thanks!
-- 
Florian

