Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B72FF513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srEQihf2AwIrKjTWa4x/q2bFgNIgWcLV50aWleEKnus=; b=aIGJM2Ga46TT9LeezYzUZpru3W
	42B/pYXf/b/ZANmlTnUqeUV5wRu4vUgh2htMd5NtPvo2sOOVJAJgm5B4zKoQbiJbKws5V4BChQKq+
	Z3Wn2yM1G20z16oEvQYB2VyLOMroWfUkpbAJ22sDF+XMYq+BwoPScXwUaW5TqKuab7702UkGtLn9F
	kOJGXtmr8hkOFBtG07ococWIXI6VUPx6QOTdTI1IX+3DYTLhDLOw/OAxJmcc7+T/4uFLFuyRB4La+
	JiGsJwOW2m4zC8Gzdo12KLLNtzj9NHHWdNf5VtD6o5+fbGlMvkI8Z7Aw+H3XHslZrdiLgOueh0MW0
	5tBDRrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIia-00000002lZZ-39K9;
	Fri, 06 Mar 2026 00:07:00 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIiY-00000002lZE-1TaM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:06:59 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-7987531082aso86176637b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 16:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772755617; x=1773360417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=srEQihf2AwIrKjTWa4x/q2bFgNIgWcLV50aWleEKnus=;
        b=SqvGbo7D06vFJZLIDdq4+n2o53w/w1yY13KleqG96e5BCTN1cZInAVkiVWlqlnSM7w
         20wSBKsHUaRLyEbCWkyN+AebeYpzHPoD9WFGIP5b4HS/KmuksI7/hcWLiKUlq2TO4Uxi
         leTdhkuREHsx1d7DNnLSz4RkNY4JYA2EF6agzew57AWNrtgkQogGbZUYUuUkFxL5beuh
         K/E7lFrhZMLQSr9OpfQ32afRSZQwrimP3c9uztsUsLMmZIOQTVTw3DdWC6Qj4MBC5poM
         3pr1rz1J4Mzm/3Uyd8RGppFQOFFpOoyHmUWO1TzSekc+eouhTORIBU9GZPT6wfZUqR17
         WJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpiuiouLtB+TkuPuvrDJBESx3OHSe43EeteZW592BokdFGPFRbe9l3WPNYM6zX0ZgvBrt10GKH+q84IzWIAmgS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzoh8AJj6vWq8P/aHtSyai7O0jxNbVsJIci4UHzKFZGAD31jirr
	O2Xsly2Q2aHfHDMt10IeQCsJ7Ei6LIu+GT/VQm0XpFtVcCcLdX2pJVMVTtdev1Yfsgf+QXI9Z43
	9Cgm6Hxnf2xBHyN6RWOnnCY+EpSITYLw6lxq7ce8iMEKnehAPO27CcdXaVQJehi1wV93Tj5W3wb
	fenYxx2bEiJp3ZggtjlG/NXKtdIdGKn3nlk81vinoVnKXdLk69F4KSgqf/bIztvYwmPYxQ2rOJD
	nrYWJiNVnTKHSMxzA5v4+SgMtzXRS0oUPw=
X-Gm-Gg: ATEYQzyy6HfbwzD2qrFNXfG6gHOK3xfRCAoQqOdBKeKf9aHotpfcC5xEC7H27DMOXhr
	kaURxjzfTgTSsChdhMc+l0x274REEZYY2ENqV4xCMsgLziB53As2EA3hX/6RhHy02ZQqlsQgbkD
	p1GBi1HRpFE54Da6hn/ILiBH5a4tI8sfe5bMQ8ml2+PRP2/NuZHZ1J4HOxAWO9mhQ8r1p+ymrPk
	tw4lj7jTSCzhGT+Z8+6Sb9sqzwF09iuDtW330uVlX2OwthZey6DWM998yhx4eiTrWRAX7Rp9Doc
	d/sqyIhHHXEG/0z6wx/EhH5xo3dgefYsC9udNbRG0M31bvq4sxysMCs/pHJB8gW73dQC5i7aWg9
	U95r04HUoJZ6C9tgTscj6rtSUz1H0ywhdameiKVup4R+USr1rsAk5CKbV6FBQTJiy+KvWmykmLE
	hwHJideLwN0etc+wjUW+SKUwHNRN1CGUE40Cnb3JEcAB4qPp/rUXqQ7CxKIYXrnQ==
X-Received: by 2002:a05:690c:101:b0:798:7017:6d22 with SMTP id 00721157ae682-798dd7ab7d7mr1878067b3.61.1772755616903;
        Thu, 05 Mar 2026 16:06:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79876ab7b69sm30951327b3.1.2026.03.05.16.06.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 16:06:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso129697603c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772755616; x=1773360416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=srEQihf2AwIrKjTWa4x/q2bFgNIgWcLV50aWleEKnus=;
        b=bday+tGzJrdv3jlxMovQkzpF+EcNAbg+J0keSTg+3BXBolroKqqHCk/APWzFAd83mO
         jckKpeU/ceeQsbKmzXkLksOXguCQoTpzqLN91gIcB79YKHdLOywYbM1c3vCjEkYGwwxe
         WI9yarHDRPybCWeLr5gY4GhlWVeD9G/vH1Uas=
X-Forwarded-Encrypted: i=1; AJvYcCWBeRxvalLTdi2vpVM7vMFL7cvl4y+15OUcHk7rniag9Gdf+hJ2UTuEjDXpjsqe/QQSkjqFXDy78gf36pvCzD4I@lists.infradead.org
X-Received: by 2002:a05:7022:b8c:b0:123:3461:99be with SMTP id a92af1059eb24-128c2e7fc6cmr125910c88.21.1772755615647;
        Thu, 05 Mar 2026 16:06:55 -0800 (PST)
X-Received: by 2002:a05:7022:b8c:b0:123:3461:99be with SMTP id a92af1059eb24-128c2e7fc6cmr125902c88.21.1772755615073;
        Thu, 05 Mar 2026 16:06:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43a18sm28026987c88.13.2026.03.05.16.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 16:06:54 -0800 (PST)
Message-ID: <13fd194d-dbf7-46f5-907e-f1b64177ed14@broadcom.com>
Date: Thu, 5 Mar 2026 16:06:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: allow dma-coherent
 property
To: Lee Yongjun <jun85566@gmail.com>, ulf.hansson@linaro.org, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, rjui@broadcom.com,
 sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 nsaenz@kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305234703.38490-1-jun85566@gmail.com>
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
In-Reply-To: <20260305234703.38490-1-jun85566@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_160658_412236_6CAB9134 
X-CRM114-Status: UNSURE (   9.39  )
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

On 3/5/26 15:47, Lee Yongjun wrote:
> The Broadcom iProc SDHCI controller supports DMA, but its binding
> schema does not allow the 'dma-coherent' property.
> 
> As a result, dtbs_check reports the following validation errors
> on the Northstar2 SoC:
> 
>    mmc@66420000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
>    are not allowed ('dma-coherent' was unexpected)
>    mmc@66430000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
>    are not allowed ('dma-coherent' was unexpected)
> 
> Allow the 'dma-coherent' property in the schema to fix the validation
> errors and accurately reflect the hardware capability.
> 
> Signed-off-by: Lee Yongjun <jun85566@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


