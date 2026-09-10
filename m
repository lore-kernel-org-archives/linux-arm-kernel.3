Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4115C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/hbBP8zfoX+TAOwTlTdxoBwUjk2GjRBIHrshh9UGEs=; b=tXFH/CbhCqG/eJ7UFi/LdLOJZS
	kY+7wqQ3pbKfWEfPhgwu7+PoZREihg7rZzCWsyFv4thlpRqHaXVpZ06qucC1K/KqvLPcIY2rOGkA2
	42LGSuMycen4Ur3EHLruSzDWlC+ckyZDpqhOHW2Ze8xRsifTUENY22AtIMGk/KlqVmBgZqkOBJiad
	DL/puswxC55JLSGDJrFufiyRdmucG1b7rbK8vJC8lZiFwhhio0c0Gdd8V8/bes9QJUXSY1J9CwXLu
	9Qx1oNHzFQTIExCnVE6QCI6hwyMJuVblRew+Jmg96y3tXQz+ZrXLqwmT2gUuTaZividMT5tsmMmcz
	Y9OzgFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hvJ-0000000EzQk-2wM0;
	Thu, 10 Sep 2026 16:46:53 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hvG-0000000EzPf-3lH2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:46:52 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2d7195706f1so58044995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058810; x=1789663610;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E/hbBP8zfoX+TAOwTlTdxoBwUjk2GjRBIHrshh9UGEs=;
        b=Il2ldKWA29/YAT6N6/mMm/kh8OHEem2omketUl1ljQVonIUL7WUw8CWUUHcKGRu8HB
         tKkvJkumjeh7p/ATD5Ad29u61G3nhlfdXZGMlTRcFUy75Tpth+QA929lc1cseDgp9L0t
         nfIW3z67bX2iGBUhegjTMmDC8k6m8yecddcMfEmN1d6uyomBz35uk5nMGe4042vXOUVN
         BvwJFictE6fbMnWNXoc8/WvEi/2jycP3f1XoofRiVxg+Ail73GibKjEABQ4w2QY0H2rc
         Lujn58j474ok4oHzrqudIPbYYNVlrXGqx7/rIzmJAndRrPObwqqJH4vpvDvPf6KQPpbr
         H5vg==
X-Forwarded-Encrypted: i=1; AKwUvByoVNkYWSzK62CJE4HuaY+0NQYJYTWM+WmHXePFbdKC+byNPsahstAHmFHbmw3Pg2zGNy0qFlQ300bYHVp+0hMh@lists.infradead.org
X-Gm-Message-State: AFuF++lyv8Im5U33hTYGMUzM+RnkWkoTofLH7Sxi0IDj1LLOcoL02VEj
	U9Swvwhyd3J3MjiHTGtINQlhiPCRCreA93urYjrWxIIqbFdwPqegY5qvHItH2f2BAXYtLPIXtl1
	0L/u5AiAII0+9GHLErcGKJ1tN9axXXUVT2ZVEUx/nD6x1GAyLFeJ4WON2HgaSIs2hqgm0bd4+PQ
	40l/63ESZpVWNjY9NlHwTKNq4iFrD9gRGPpCoNVV+Fkzdw4f2P/UMz3iPC6rleUQvbt3fXEYTnM
	K08+Odww28NyWQdQaKOzFZm7H2SPTm7wgI=
X-Gm-Gg: AYBFou2mbN7y+pe5vzzpsKaxVKN1ixKSbf4+MWZfjcWMpu59aupPe3Q3M54X7+Eaw1p
	ZvhAc3zFmezOY5OJsmcpTY7WIv8lYGnUBEY19Wg3iJ6l2NI2fryS6VD2unhp7z+Ul40TFDjfpJ/
	4CGJZnukFdHrhNahwEbQsEHFON9DOGR5htXSwHLKtnCViHyinDE6jWErWStSEKLT/JWyOINNBNW
	nmlt10FMDp65+fA9tGX3jOvrsyCwVK/lqqZI+SZ0otaRIfMG0JQ46bpCBVf6sl9SSFXgvsACHC7
	+yjp5bV78JGJZtv6XPJu928FFDK97QfZ6rSd+FLjCgfFcKq3Ih7nyuEUYk+TZ+VlFVUMDL7y41q
	gTKWxXUwxdEADtHr9i4JQrAM+hpb8ILUzQSZcKPWNlTEAMZ+GYktg3RftRRTyWy/aHdCfIrMNrf
	y1NOm3T1+j1us/FNx4f8pbpiDq39kZ4QziUkrZcrBtZE0=
X-Received: by 2002:a17:902:e881:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2dd2a35a58cmr5225815ad.17.1789058809857;
        Thu, 10 Sep 2026 09:46:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2db8b2edffcsm1362565ad.42.2026.09.10.09.46.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:46:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so144322455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789058808; x=1789663608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/hbBP8zfoX+TAOwTlTdxoBwUjk2GjRBIHrshh9UGEs=;
        b=Dry2keL71abkZZDDMvh1V9YieKeqo4wpow/scVoIYB+KLdwShHMvfYPU+WKHJ3UXmA
         kmU8J795w6fs3200/Z+7h9kUc2IKS3UK4NxVtU2zkheiy7rVEPmxNRUZjn6Jvi2u4edW
         rWpeBJ5AK++/BeVCl+mvnkwPOY0EOMH1q3sa8=
X-Forwarded-Encrypted: i=1; AKwUvBzHjGV6kGSu1UeGXtfVJCPo8t7sHhnZ3o/zxmv8Jcgn9JFA5hI4U9dUc5rEH9XcSw2qbVLgZS7qYvVZ3k9pObPU@lists.infradead.org
X-Received: by 2002:a17:902:d48b:b0:2db:3d9a:173b with SMTP id d9443c01a7336-2dd2a1fe2a1mr5950755ad.9.1789058808006;
        Thu, 10 Sep 2026 09:46:48 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2db:3d9a:173b with SMTP id d9443c01a7336-2dd2a1fe2a1mr5935245ad.9.1789058800733;
        Thu, 10 Sep 2026 09:46:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae36adsm90000605ad.76.2026.09.10.09.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:46:40 -0700 (PDT)
Message-ID: <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
Date: Thu, 10 Sep 2026 09:46:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260910001209.116465-1-rosenp@gmail.com>
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
In-Reply-To: <20260910001209.116465-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_094650_994881_ABD3535E 
X-CRM114-Status: GOOD (  15.02  )
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

On 9/9/26 17:12, Rosen Penev wrote:
> Add it and set for gmac0, which is the only GMAC used on this board.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v2: fix typo.
>   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> index c80ac16ad949..9ab618a097b1 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> @@ -25,6 +25,15 @@ memory@0 {
>   		      <0x88000000 0x08000000>;
>   	};
>   
> +	nvram@1c080000 {
> +		compatible = "brcm,nvram";
> +		reg = <0x1c080000 0x180000>;

Why is not the nvram node moved to bcm5301x.dtsi given it is common to 
all of the chips?
--
Florian

