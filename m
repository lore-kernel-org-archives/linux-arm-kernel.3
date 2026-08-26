Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D876CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=; b=XgGEYZzpZrOU4HNhya5b+g1qWv
	cQzjChyraYIsVMotPqp0c4+R/hLZtZi6nnB0bUJH1kqdYncAOH6RhOAzWp417ZKx325V/xYIqdCY2
	YIdbRNDtz9NB3BIiY26SSDzh2oMLpRnE34fjFHgsKFBBTp6863cn5xU5PpJyuf4824E8T4MDt3kfQ
	sfWJf97aaFuOZjMX3eb7/RxJRcD6pyK6zOuhd9xbCZs+hMroVNxiTSYa8I0fsjUKHnoQaeP9+7Z6S
	wLCuzZak76CViQK+cVyBzCwygjrkIWJmL+AkLJxm8tTTFWqHTy/gmWzEb8GEJbxZMGwFCSEAxUvyI
	YW7Z1v3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK63-00000002ypI-2z0W;
	Wed, 26 Aug 2026 20:19:43 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK60-00000002yoE-48zQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:19:42 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2248704a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 13:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775580; x=1788380380;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=;
        b=lGYl3htbgqSwzEz5bA4qoUTYs5uqNahvAMHw+m6daaZ2ZctK3aW6oPmpjHlSkWEkR7
         uCHTsgqBiccP5dtEs1nEXFhFjDMifhkdaHI0bojgWCKDQsTrwMpdXK9j2ZGZtZX+SzFD
         IwvHv9JewNQDG83w43xZMpT45tUa1xZDkG5qlQL7E5pkC7HkrN/x+gdAG5O6KraM2E7l
         8x3pJSrZ9iI0dqBTTX+gpNmyuZZ6TK08xnDNzd8OgnUcF1t0kIWqWAdPXzzBVWT9ecze
         4VPVmwuMr12a4/6wM/dCfZSd3cQpWRxkfTI1LfUUaK/SUupq7w7C95tAgE8FT5DSw82O
         B8vw==
X-Forwarded-Encrypted: i=1; AHgh+RoJobIVbHJGyY7DWPYP6AQkTaAnltz4dAGmMfgrZRWd2LMe1ZWAaDzHyG/cwPQrkunMhDi1f2iN34eoCeQi2GA/@lists.infradead.org
X-Gm-Message-State: AFuF++mS2g2siNZudJmq6QSsKK2/ARFaFCLdCP13tAs9gG1ZlhvNJBiC
	PkDlARrG+8F7mF3nlbjD5RxQCu+wamBHn78GlcCt6XOQ22Jf2Yp9gulveLlHzppP9hJoc6PrQy6
	Lw/1bnvWW8rCi+ODPQFbXhagoL+Pga+vTrivZkU2ovm6NPPW5mvahmLwMHXPiXXQT9ha9UCmNXp
	uxfjZ2bCC0aiwG3z8qF3SeEWbedDAEfRR8qeP6P5vpMFlg8NwOBcBnqbjDmixk4dXgvXR7IPlRL
	GTCZo0CLImIPRIUUws3UMmCZ/vqsAVcxmk=
X-Gm-Gg: AR+sD11cjirSTzVdNglEexdG0cct9uzrjzjnJwy0dFjI97XeTHB9AeX7UvXFChDj2/6
	1oRtLt8NiE0w0GflHYo/6NSMH5ACIU4duDkj+BT+2h/IGdHJhAiUGfzGBVuZG4bEUGqdRkEvz+o
	awdeb1iL4jvPHroaQP22ailylzhX99afD2uYocX5SeOUHLVVAwfQLu4/pqahqh+QdgLx0E0PgGF
	Rye7m7ICyXQoKorD5fFEzoLcP29nBcnGnea/GDi/bERw0A4g1AKnmC5IbHolBE+5Z1Q2hyF13UL
	SjhDqCSFB8MVIKVdXJsMk3+40S4uuf8RKAM8B/0AHcMfkW/abqKGjkDK4W6vTkrOCCo+YkKeKVV
	WGsxVJH+LZ4jjwWJhmKXvN8GNKx55c8F0tJ6rIo5xf0YUE3vsNYOKljThcn2BCuqHHa0+k9hhou
	nT2Ly3eVDp7xKlc26YRrgmrNIejPL/RUYKGFM9zBmxbWg=
X-Received: by 2002:a17:90b:390e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-3966d5f90b8mr16859291a91.11.1787775579816;
        Wed, 26 Aug 2026 13:19:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-396705fd170sm569342a91.0.2026.08.26.13.19.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:19:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso29991955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787775578; x=1788380378; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=;
        b=Bl9BDMn0PCgZCGmUsM2LVfe4jdE6X4aI7zkPZTWids+LQONnvp8mqD9H4p8BlTbU1L
         DAVLWozliwePQKbJCX1e1f6D92JHIgAXhQkclGWhmicsmLU9/LqHSaK3smbeG3teqhwN
         NfjeHG72fqxYMCdI5uJePV/h87BK2K+s1UkSI=
X-Forwarded-Encrypted: i=1; AHgh+RpzcPpIahXXgS5sQntl+wVZUyHy6c/YxZl3k2QhJcNaJCxiQHwM7alT6MyArb6kh2eUH9AA92aeGpFUdxdYnaN+@lists.infradead.org
X-Received: by 2002:a17:902:fc4c:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d707cbaba8mr182678815ad.11.1787775577890;
        Wed, 26 Aug 2026 13:19:37 -0700 (PDT)
X-Received: by 2002:a17:902:fc4c:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d707cbaba8mr182677995ad.11.1787775577440;
        Wed, 26 Aug 2026 13:19:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm16611574eec.5.2026.08.26.13.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:19:36 -0700 (PDT)
Message-ID: <e073e341-76c5-43c7-9e0d-e7b3f10007f2@broadcom.com>
Date: Wed, 26 Aug 2026 13:19:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
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
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_131941_033121_FA259FD3 
X-CRM114-Status: UNSURE (   8.31  )
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

On 8/25/26 13:56, Daniel Drake wrote:
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Only if you need to re-submit, would you mind listing Jim and myself as 
bindings maintainer for these two files?

Thanks!
-- 
Florian

