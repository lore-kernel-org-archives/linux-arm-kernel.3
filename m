Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48213F34C78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqcqUmMytTlyST79HXSur+JVhERdyL6edRqn6BR2Hog=; b=c3JVRPlUoiLkzzwsycKVOo5FRS
	hQ/4zOgvdUffPETa7+T7QgZy+a8QhLzZEvhD65Vz65YV2BjgKMNZyHJUsI2BI4qDhng9pl+qu9pBq
	Uoq9aISPKxwOoAwHCDWxgtEwVPDxU/yBpw4OhXlQMtfAyIAIaIDwggWkx//kCA3DxXsdKNgfdrSwO
	H3iOFKLCbxjANAb97iz1tBgcycZFQMcFLxhf6veicP1OllHNt0AeRDsboz8HOLjv3twhdJ6n1fFc9
	crA8HNovU/sQaUQJHZBjWgmETuxiEs0CpODKd3n+H8/L2+nCSVqu3WyXmX9T2mtgvoN2oaBlgxz3r
	uHPlwQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLJj-0000000G91k-1dKU;
	Mon, 13 Apr 2026 17:43:23 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLJg-0000000G91N-2ICv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:43:21 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so701629a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102198; x=1776706998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uqcqUmMytTlyST79HXSur+JVhERdyL6edRqn6BR2Hog=;
        b=XspDx76E1Va0kddzz9TqzkwGVvhOrARVqnvnFR1AbEEJdV5xGdacaGqJr2Uz7cc2AX
         GFRVdtRvmzc+q3viofgMY8tzJ3Fu8KRlac29aN1YxbbWBFABg7E1ZNZy4sDtsYbasV47
         cfOvPPJQJ9MEKtNMUgRf+hq+kCegtGxqIaT2FW93egv6qmVOdHz8VlTJkYtOYyOpy40n
         3RlXmC8BMxGNldpJPRw4J/Vb6NBKEg1A4+hMqtws10eLCjDNdtqw3ZH7bX2f5T+m7GYg
         TKg505Z0o+ERkeG2kulrrnibvo1qHyIya1NnNUjPIiza4SJ46AbgwXLMkicFOk3TXN+k
         qbUA==
X-Forwarded-Encrypted: i=1; AFNElJ9G9YpdHiUrip4Cfn3rpEFnJO+u2G1nnz7Qw1j+C/Mgf/Zt/dO/pwX9UtFb4beWKfQu8SXMoyAnemMHem4UGOJg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm9v/9gUPnfOMqFkG9zb1/nEKrO1YgJYD7dJRnQk7C9HgxcUTL
	qqycj+DGZfGXAAezB7cUUL+sKj16qzbAFF2wXPxtSiQlH9fxstqdZzqIxRVA0n9zkObyjHJ2ug/
	SkFwHXppda03ZKAgynuIAb6y5MKzLgb7iQd2H59wFTUaZ0ua6JnBR/EQbFbWIDEPWcOLw0cyLsp
	8+BpnWEFnr5EI1zaKVJQMqfLu3stgjKXndUxp6aHcCYlXrxA1xUG1aXcKEQUOodWUMGgdgyXuP9
	bs0CzQ6hYjZoi4zC+dTjJg3rZRYNsA/0j4=
X-Gm-Gg: AeBDieuJIm8cBvEy5aR2UQqr2/zzrdAP+ry/TlzTY+Otc1Urova8BGaaCgu/JBFCKcJ
	bSZioNa8BSF9E3DDTMvDBO8RFUZ9WtHVUjr8y+WKDnut1epwoPmalj9nOTl+UrPg+cirUSJltfd
	XJlYYYMSTgFd0hBaKh9WsOqF7kfw9YE09Ykh70lBzY0iXzEvRUNGvqcKNUn11C36HOfNg1sbUuo
	AYReyrA0ahph2xC/0BOrhM07KztUK/HThucynbcxPoR3fzH+/klXBTWSpCSiv7oBZV2V8/plT6g
	+NAQmm1kz1dkrKlytRO80rhGPjWmdkhOFLHbPJn5ZunMqkCSkBc+dmRags8NITu+jdinAKXKYuz
	vlraHl42mGuGIQzg7Hf3EkfKtDhTfAk+ak/Yq3mTXA1onJGsPzvk/8GZ93RzbMMOIrIY9I5dYF2
	g9mUTsewT+vnm74C6CD69s9z04bBJLrPq+y1YWaz2oickjjabgM6ApH2+ExoMMfA==
X-Received: by 2002:a17:90b:5548:b0:35f:c156:a82e with SMTP id 98e67ed59e1d1-35fc156ab7amr1304203a91.9.1776102198447;
        Mon, 13 Apr 2026 10:43:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35fbd0abae9sm263502a91.3.2026.04.13.10.43.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2026 10:43:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1273dfdaf5dso4507093c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776102197; x=1776706997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uqcqUmMytTlyST79HXSur+JVhERdyL6edRqn6BR2Hog=;
        b=MevKyvEy+F71CWaZDkHmW8hLU9xFG5D+jRClkkrV/VwE0L40AD7Sun0C1h0uFqN0zg
         5sJicf9YzinUndyuq85sqr9pToOgWabBiHjXiVHorRK4hl/E1HlMIsGhq4+RvZbAxaP6
         h6qQzpGKBK5gBehlVHnDnMYA5BqaWgFnN7E18=
X-Forwarded-Encrypted: i=1; AFNElJ/iqjd1d34rtFftMboCoTCk8lynyBGKPMdvXmTHsdD0KmmlB6uXq/oZPKJ8cKVZeQD1cSWjZtYWWaHzP3ANS17/@lists.infradead.org
X-Received: by 2002:a05:7022:ec2:b0:12c:1288:ce63 with SMTP id a92af1059eb24-12c28c2953fmr7790103c88.13.1776102196573;
        Mon, 13 Apr 2026 10:43:16 -0700 (PDT)
X-Received: by 2002:a05:7022:ec2:b0:12c:1288:ce63 with SMTP id a92af1059eb24-12c28c2953fmr7790070c88.13.1776102195919;
        Mon, 13 Apr 2026 10:43:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa586bsm20432752eec.11.2026.04.13.10.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 10:43:14 -0700 (PDT)
Message-ID: <702c52e4-b0b3-4e1e-a40d-29e136e46d7d@broadcom.com>
Date: Mon, 13 Apr 2026 10:43:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mmc: host: sdhci-iproc: implement the .hw_reset
 callback
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>, rjui@broadcom.com
Cc: sbranden@broadcom.com, linux-arm-kernel@lists.infradead.org,
 tgopinath@linux.microsoft.com, adrian.hunter@intel.com,
 linux-mmc@vger.kernel.org
References: <20260327222150.2108111-1-meaganlloyd@linux.microsoft.com>
 <3305684d-8517-47dd-8852-2e34d40fc712@linux.microsoft.com>
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
In-Reply-To: <3305684d-8517-47dd-8852-2e34d40fc712@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_104320_617319_04D8D439 
X-CRM114-Status: GOOD (  13.98  )
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

On 4/13/26 10:38, Meagan Lloyd wrote:
> 
> On 3/27/2026 3:21 PM, Meagan Lloyd wrote:
>> Implement the .hw_reset callback so that the eMMC can be reset as needed
>> given cap-mmc-hw-reset is set in the devicetree and the functionality is
>> enabled on the eMMC.
>>
>> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>> ---
>>
>> SDHCI_POWER_CONTROL[4] (SD Host Controller Standard) has been repurposed
>> on my Broadcomm processor to be eMMC hardware reset
>> (SDIO*_eMMCSDXC_CTRL[12], HRESET).
>>
>> Can you confirm this repurposed bit is consistent across the Broadcomm
>> iProc processors and thus the .hw_reset callback can be uniformly
>> applied in this driver?
> 
> Hi Ray & Scott,
> 
> I hope you're doing well. This bit looks to have been repurposed from
> the SD Host Controller Standard's VDD2 Power Control to being used for
> toggling the hardware reset signal to eMMCs. Can you verify that it
> applies across the iProc processors so that I may finalize this patch?

Which iProc process are you using? If you are not sure this applies 
broadly, can you at least make it specific to the SoC you are using?
-- 
Florian


