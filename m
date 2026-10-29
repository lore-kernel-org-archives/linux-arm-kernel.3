Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A38606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yUdENxg0;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G/V/D9xK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LNO2F+RkIlNcamMaL3GuwTqaLUzBlGoQvXn9YjXH54Q=; b=yUdENxg0Znie1j
	0MvT0Z/DI7n24qH+9yANz3vQP7LwdhYgtrb1i4EzZW2VxHnKWipJ98BZok49LDLFeP0pohasNQf7P
	Ump8KmY0M0XUjswKoKXE/8eClXj+UZx3T86Qryqjjuxo30y75CV4LpkOOE6EmHdEbf9ZIC6uA6DqA
	mfZC2N99g9dmKCRIgznXE0ZLDZmtsGOLgigREKt1s1f+FOhCOTrafXPs33tmZxqDZsqaxpVXxMou+
	mN+oMGe9AY2shr8blmuWy/9m3pkkFAQSRLlYGc1HFm0gR2shAbEa2lJaZE9D9pwZaV4ThIdmad4Cf
	vOUrjEKqBEodVRBKU1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT51-00000009o6u-1iOq;
	Thu, 29 Oct 2026 16:34:19 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT4y-00000009o31-0dcV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:34:17 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so1132749a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291654; x=1793896454;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LNO2F+RkIlNcamMaL3GuwTqaLUzBlGoQvXn9YjXH54Q=;
        b=QOsi4bdOLmyta1BR4TKJSuKGCLoE/ceqHwuFe7M44qCFuHJY/+0IOCl4G/9HbM8g0c
         5uTuSXjnIfBdVcX2EMfWEG+eNAwqfPybxhfVnX1ukipgzT0TXiyhSe7uKaNcY9ffqvbT
         kZEYX+xkvVHDvB8C+ogRnbcyMfvA2A61rTrW5Brel2leE5BZsOkQe3BhE7mT4Sqlt8cr
         IxzouZ3YQWUTaaVqcdw45piB2tL9loJqy8z5f3A1f7sT4idG/a/dOhEYuOn8mimkxa0r
         EDs7vX270AMmIPqPdyKeIBIebHFj7A5Ncva6jl9sRtqCyJjQXTykF1t8EsF3CFX+/aBk
         8ySQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdLUNzK7ZIzO9BBgjp142KITZHWv263Oa9mFjMmNYcHKs7j9iDwX/OiLqeToOArlNn8fDah3J5aQQV5z3xrAUa@lists.infradead.org
X-Gm-Message-State: AFq9FYJFwC7SkxOkVImlOizq8rHNMM/R6WUYYsT6spXArlokLpbi1CHD
	pK74CQrN8hrGRjX6LDSBO60arU7H507ENnmPWrLXeNVMsj03g+bODttDZuWNIbb+JNxcW6zBu3E
	x6KleFyq2iTLySBfaFgA/9ahaiBerdp9ZqDHnOVwI+kUsMqLoT1dXSu8nfJXt/HJSXyNMvBJun0
	o88vTkbyg/qWsGgGgBjgyFfPlMJ44pYgwzEbbvC3KIKgTzm7t4qH8ciUkY3sWTEQ3POdN8HN1jr
	Lq+p4emXk5pgzfRQpqtt+ASRzzVo22nsvIrqQ==
X-Gm-Gg: AYBFou30ZgsvZCbxJtUBfhwfXcnqmhuH52x3R6keMD5iamarIji38wUI/kXxl+A7A1M
	7lvPNPWkQ11ZBJCyuWpxD5sXD7EDv5uD+xvtmmX/A2/yt2i5+35QqjZfWTkHeN7HUMMlEfOUI/c
	XvFWO6WAOf+EJqGSdrWKcckirqgtpqr5ovBnWTkgopBIxklMMYCDTTkfJv1MxqMqSJpUob7WvTB
	paW8SFhkn9gh5cakaybvOKZA1IkZTdn7tMfU7ddmfgVvU1azaxL6gXvuK0EcAIXTAdOuB0g15xo
	nW8dViW+axvDLdU9EjG57dg5yjKZOAbXwGFnS6HfTTctzgsqsjCfhoH8GFnDhwiO2LhhQsN9D29
	SCv6+aLnZ91Z/6EPPUjt3U4bruJ5HvensoKzHT0N5pB6SmHEKpPums+Fx9tE0lgKdzlllrYQhF5
	gRSiQblK3xf7a8M9/VpOaT036cnM2UA6E+ghrSSQr2
X-Received: by 2002:a17:90b:1647:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ae580cce76mr4432016a91.23.1793291653911;
        Thu, 29 Oct 2026 09:34:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e6ec859sm2446532a91.2.2026.10.29.09.34.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:34:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5351f1b26e6so37946311cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793291653; x=1793896453; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNO2F+RkIlNcamMaL3GuwTqaLUzBlGoQvXn9YjXH54Q=;
        b=G/V/D9xKrmVMXvLIKsAPohThncydo2DXFay7l37IklmZoYuhduirGdN+eL92JItHup
         DEH2bKXzHJpxVwXpYeEbT7GyRJKhRk7yyxwVh4AAfobQvWI3DdT1LN+AiNuv8/pZlQ0B
         oZmqha7qKTauo/H8YY03CrgUdvndQ0dVHvuao=
X-Forwarded-Encrypted: i=1; AKwUvBxYY0DDbWqSOWwAmqnlqu5OFT/3Ys4WbKB2kTXPCDnbMOG0eouHc2+HN9+2GQJxlNF2nP0an18s3+gU3PP1sQIm@lists.infradead.org
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr887708285a.31.1793291652735;
        Thu, 29 Oct 2026 09:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr887704785a.31.1793291652182;
        Thu, 29 Oct 2026 09:34:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94420a8b71bsm208785a.20.2026.10.29.09.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:34:11 -0700 (PDT)
Message-ID: <47109427-e5f3-4923-b250-8bca019a3158@broadcom.com>
Date: Thu, 29 Oct 2026 09:34:04 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT
 registers
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261009003201.68288-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_093416_208459_B77466F5 
X-CRM114-Status: GOOD (  16.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/8/26 17:32, Karl Mehltretter wrote:
> The BOOT register range is optional: the probe function ignores a
> failure to map it and the suspend/resume code checks for NULL. It is
> mapped with devm_platform_get_and_ioremap_resource(), though, which
> calls dev_err_probe() when the resource does not exist. Every
> non-removable host without a third reg entry therefore logs an error
> at probe time and then works normally.
> 
> The binding only describes the "host" and "cfg" ranges, so this is the
> case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
> where the SDIO host of the Wi-Fi module is non-removable, each boot
> prints:
> 
>    sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)
> 
> Look the resource up with platform_get_resource() first and map it only
> when it is present. Hosts that do have the range are mapped by the same
> two calls as before.
> 
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
Florian

