Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5691061B1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7bh5ixiifKbiWJ6yXLI+KwYDZ4p+qUAcuT1NVFVQLQ=; b=CmRvmIo84YTnHolznSpS2oP/QE
	azK3w/hpXBEVCckgby/cqhHBZwjZmnUqlAiLAxLhxBXX9O05PAFU04weapneDvdrNqjKeTUBvBK2l
	7dyQrha334y8uO+bQtqUApQ2HtNmK00YufrsT+vB/VwpZ+/aob6Qib3EGKfGzMFxiyYdFNEn+wpCx
	NHE4tr98R9I1x89D1YAj8CE+hcnZbw+JAmriqbhv1MNx848Ctd7UAg70vRTcgD6XWEvcIdLJ3ZnNV
	LB5T8EEGuesvX5D1AUL/z7loqRl0e/90QvoLiauFroGqSSPhmIPkdHeZ8f1dBE7sQYVTOfjWcRIAx
	+Y/eI1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7HbS-0000000Bjy5-2qkU;
	Mon, 30 Mar 2026 18:44:46 +0000
Received: from mail-yx1-xb164.google.com ([2607:f8b0:4864:20::b164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7HbQ-0000000BjxC-0m9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 18:44:46 +0000
Received: by mail-yx1-xb164.google.com with SMTP id 956f58d0204a3-6500040f128so4844694d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896283; x=1775501083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a7bh5ixiifKbiWJ6yXLI+KwYDZ4p+qUAcuT1NVFVQLQ=;
        b=VJCx+osFDRUqvAdG9mzhgDgKvAgME/SfjCzHB96rxEs8xkxClDsBC4fP4ddSzWo0EW
         evb4dcWiXaiLITPxWIZi/pIMkhbDi5EA/VyuTOTtNKvDIyHqppd3tQnyWeSVtGnSlSGV
         cFyLjHPsCtYhXo+F3Ltv2AFlOuvVR0eOTDt94vMWywzfs+v3AhHzvZQh5+Csqr+ftGvn
         jJr5VZK4+dA/qADGOLbD1dL4DG0famvEuGyzF14PjGRlST9zSxASd0KUGoauOwrb3FKp
         fDnPJghBhtUqL2p9HJimPVZTb/eiuTd5aaOSyTZhfXNLqbrssSbEFigKmFIUaAZo76un
         TOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfJAVn+HISIU8qt7//C2v7oeS5VcAj6KEfeiOa+n2dedteSttrF/JnrEMBKvmV2FW1F/Hj2UBZf9ZV83rG+j+p@lists.infradead.org
X-Gm-Message-State: AOJu0YzegpY+uQM9vZbhGur8k1ttVJ4WoZY4WpZXuVhVfM2v7Kg/0Oho
	/CJgpJsZIB3DB+cUFN+E/zInaOJQlhQam24VmFpDskwF1ufumf/xm/HJAc50WBfFznv31pK32oN
	WSjwpqedy0sbz/stdvKraChexrs79FHWX+GU+f0qbTbcDH5lvOi+BjXbxxK0yE1GGwUC4cTxk1W
	aQrFcXMyU52/P1Y3G1CLKKIS9VTolsdiC7nm3oh52pV9B8XcwqZDtOwGa5tVAYKrXJewrcgg16O
	YqDfwqUbf2v1RIt6oILP0gvX9pL7Pa5bK4=
X-Gm-Gg: ATEYQzyQbwBWTTroDCnE2H7p+I0SMkYBZC5ph9jInFzGeJBUJ43ZOI+3R5OSHlDSBsq
	1/hS28N67OJE0wCAKtP5DVUwK3iiffqf/pnPjO3UbRz21hIwvfXHFBUGdoUQf5oRVmKufT/5qZp
	w/qnL6gPBOF0xFg1/TNBFUV0qjVynMtAMYoKmcxLihjIvjYvxX1+zgNY60RVXna+xwski5O09xu
	DWjR8YwJER4noSIHOSdP2UZKaAti1wJY5yseOBDI5wlC0zMP9EBsdSVLxxp6L+4snp1/HPnTwtL
	aemgnxYDulA9kol/PKpcuI2kjqJxrZqlNJMKRHBtGAntcvkf7U/sw5sXTXn+Kt/ZDHVVdfTiY0q
	ULcEwQcLVaRdDwH7MPuXDoJ4GzNaUJG9uU/QNvXwLfDakCtFrKnhbMkZXXQ3xOmui7ka1FLFy+b
	STsFta59b9aw==
X-Received: by 2002:a05:690c:d81:b0:79a:b75e:1509 with SMTP id 00721157ae682-79bde0ea7aamr138058457b3.43.1774896282870;
        Mon, 30 Mar 2026 11:44:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79cba07355csm6407887b3.17.2026.03.30.11.44.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:44:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so157427441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774896282; x=1775501082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a7bh5ixiifKbiWJ6yXLI+KwYDZ4p+qUAcuT1NVFVQLQ=;
        b=CR8WAdJa0g256oiGXPwe0beQebDuQXxpf0wLAPAX1qAxhJGEoHeCm+KvC5ikGsaQxS
         N/KBG2yh2sJb77RpVQQGsazqtffHNvNnze4YWKH8yO/gtHJ8bbdJgDt5hXMk2pVLiYZs
         OfCiSWHazRbBtYBIel86WdKabx7A5Y03NHKos=
X-Forwarded-Encrypted: i=1; AJvYcCVird4qUtpThVJ2InqfJFn2LUxIJpDIuWaJNA1XSM7cqrZSWIdvtJp7OCM7pPlXnmBq0VThmEyg0xtg2m2zzZXu@lists.infradead.org
X-Received: by 2002:a05:622a:510:b0:50b:3a6d:db5d with SMTP id d75a77b69052e-50ba39ad465mr187299541cf.65.1774896281966;
        Mon, 30 Mar 2026 11:44:41 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:50b:3a6d:db5d with SMTP id d75a77b69052e-50ba39ad465mr187298991cf.65.1774896281285;
        Mon, 30 Mar 2026 11:44:41 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c96a5asm68164441cf.10.2026.03.30.11.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:44:39 -0700 (PDT)
Message-ID: <f39c38bd-edde-46f2-9b2f-2dbf22e80487@broadcom.com>
Date: Mon, 30 Mar 2026 11:44:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/v3d: Allocate all resources before enabling
 the clock
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260328-v3d-power-management-v8-0-94336830df5f@igalia.com>
 <20260328-v3d-power-management-v8-2-94336830df5f@igalia.com>
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
In-Reply-To: <20260328-v3d-power-management-v8-2-94336830df5f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_114444_236296_7E0B8989 
X-CRM114-Status: UNSURE (   8.91  )
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

On 3/28/26 11:52, Maíra Canal wrote:
> Move all resource allocation operations before actually enabling the
> clock, as those operations don't require the GPU to be powered on.
> 
> This is a preparation for runtime PM support. The next commit will
> move all code related to powering on and initiating the GPU into the
> runtime PM resume callback and all resource allocation will happen
> before resume().
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

