Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C345D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lZIhicnPF5MBd0IyD7v1HJ7vxFXx8XMZHv9zGSx26g=; b=e+YnT3zxB6wMQaCpiHjHLAsC+6
	zRzXtB3dohr47x8Ds2+oQXv0dIcQS2IlTrgctInDyzgx39uCZEfMaqppHWJj1XbgXVhsKr+q72jWN
	VnBDv1b7ug0gqLYrV0RUgpEz7Chc6tzrd1JMFztpbfYpMOgI/uB4Nb7Sl4zjgNuCssvbw3xlXNtQZ
	pavEWH/mpynA1bAxKJAId8jrsyrc4sZgbPDsiP1uGbFKIEbf8XhY/KL0ac8NTs2oBPjw0BfViOjzJ
	ls4c1aqusn60y7PVyuGGQO6hda7yh9hdZ8jnZzmDd6kSoTbRypgACU+TcmHuGI28XvOe6kOR+YjOR
	qXcdGhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJP5-000000093zn-1hOc;
	Thu, 18 Dec 2025 19:11:11 +0000
Received: from mail-qt1-x862.google.com ([2607:f8b0:4864:20::862])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJP2-000000093xb-1DYO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:11:10 +0000
Received: by mail-qt1-x862.google.com with SMTP id d75a77b69052e-4ed75832448so12294841cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085066; x=1766689866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lZIhicnPF5MBd0IyD7v1HJ7vxFXx8XMZHv9zGSx26g=;
        b=cAIjCqACQURAsNpZHjvgKTs+/JXswiQ4NbEQa2tCh2B2TsYLiDP6heqh4O/eMJUJee
         ZPE6B16WFckhGhn/QayvzkIHgQDLk1/XE4B3HwWiILR0QrLsQJ6rjaFoz5PJ/cTsWq5M
         YGAJCIEVpBcz+H9hz447zP9WOmpSWMKDR7f77M91H5iMg0deMmg5lGUfqr4abKZvgubn
         5Dk3fNRUKhI93dsM+TgtyxOOJPqJhuVUqCnkbir/UK2dU3I3vC4NBKs4zUvUHfygga+N
         Ub5kQPDkGCAEPwRJsaxqIzu7sMZybWairk4z2M5VMfyUewhh+elq0LrbhDXXMZKU29bI
         VMcw==
X-Forwarded-Encrypted: i=1; AJvYcCUXdaVytk1fOam2ZF6ggK+llJqW0myXdO4ziSuKJzvzcjCyxwl6RVY0FtCe4rfNzOIM0mdxolCPjrzVDbU77uwi@lists.infradead.org
X-Gm-Message-State: AOJu0YzFGE0SET10TvM8E13QniLVFUGzlQ91G8mVNtOf4ZOPonbOvoII
	dtaQU1GQ/D6IZrfdhnE9GPkEKv5gMmNd1DVEpFfXfD4P0vNsLxpH9wD48JJAs8QLAmVNG5k8ZBB
	HsYUGElvhv1uDDZ1ybgjIFKB/6Qod79zmgiqgGwtFI5qWpfAYvKU3YILTc2+1UqrYLFJ8b0P3od
	rZCsUfqikxZdGhaK9JR7S/IqxCEgkdwXPe22i9Gbs2PzVDRHkdbDvY+UyFbuOeZap9bRnuroJDk
	YMz7B718Wr+JIyBXP9levwxErezXStWE4I=
X-Gm-Gg: AY/fxX7ldDl2CEAuH3v9P+fRIpXj90dz9sbYRECmCJ2wC0kLP0FApbR9ledQaH6lxkf
	n0ViInCnXlaQN8w0PekR8sqGBvQ9xt1RwlgA311jc/s+8fBmNUAutXvFYoPBejMo36hbqvfq7bM
	awZsuXR9f9xV1vJ77+e6ZljCZVxABSnVVtwDJfLXedpx5uKuALTCzDnNSAVmRzt9Qau+V2Js3hs
	uiKetmZ89fQg6TKW8wDiGCz6yFnonkz5tAvggUvmEhHN6UGx/fI3iNncmT7CgThCgwInnxtGpuR
	KHinSIJD7HZzSIvPqyo7TpUxqeuckv1HCgKavY9nGwzIXhC3BOkSsJzWaEwOBcfOdotVXvyuaB9
	m1L+Fwl2QUYlGmKiVO5VCzzB8CUnFyFKkD02DLxzN/dPEOdFF8xiRPpUb3K2/DbzHsjm7ugCQ6V
	5VXPD+jErjrfy1Wrvo5f/DSFdSOrUEAjr8Z84TDzmI03YENT9Ung==
X-Google-Smtp-Source: AGHT+IHOCscGK02dOXzRYzUCSUJvi5l1sjLc6ga6wG+tCNEBgbAeQwGQUYDJ1A83djXR3JRTck6CDc6jvIvK
X-Received: by 2002:a05:622a:1483:b0:4ee:56c0:712f with SMTP id d75a77b69052e-4f4abdc6508mr4314441cf.76.1766085065839;
        Thu, 18 Dec 2025 11:11:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-88d97a82ab2sm271736d6.19.2025.12.18.11.11.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Dec 2025 11:11:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so24393381cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1766085065; x=1766689865; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2lZIhicnPF5MBd0IyD7v1HJ7vxFXx8XMZHv9zGSx26g=;
        b=CFqwHxR+ysbRucVEhT7FMLn2oDW6N0Z4wh3xHsgO7F90O836wr/n3Z3YsfYe1lT+TK
         8xRNGRhk0P/2Dhl7nbGKHllxbW/VNohx2qCbs09iitY7/HlxOaAO5b1oiKjtbax7E02O
         UneHfncdNUQnHgZ3s9sivyC4yffpxnARFMbiE=
X-Forwarded-Encrypted: i=1; AJvYcCVWe5w6LmOyJTWVJc27qaeUXavRpZMfAAODCDED2uqqzGzonJVUt9kIGjMmbW8+/TGY2RKWR89gwi1zIKWtuUZK@lists.infradead.org
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr4668181cf.19.1766085065174;
        Thu, 18 Dec 2025 11:11:05 -0800 (PST)
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr4667571cf.19.1766085064645;
        Thu, 18 Dec 2025 11:11:04 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09678393bsm10407785a.6.2025.12.18.11.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 11:11:04 -0800 (PST)
Message-ID: <8cbf63d2-1510-4d58-b2ca-0fd23a476539@broadcom.com>
Date: Thu, 18 Dec 2025 11:11:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix RP1 DeviceTree hierarchy and drop overlay support
To: Andrea della Porta <andrea.porta@suse.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Phil Elwell <phil@raspberrypi.com>
References: <cover.1766077285.git.andrea.porta@suse.com>
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
In-Reply-To: <cover.1766077285.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_111108_338675_BE07D062 
X-CRM114-Status: GOOD (  18.94  )
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

On 12/18/25 11:09, Andrea della Porta wrote:
> The current RP1 implementation is plagued by several issues, as follows:
> 
> - the node name for RP1 is too specific and should be generic instead
>    (see [1]).
> 
> - the fully defined DTS has its PCI hierarchy wrongly described. There
>    should be a PCI root port between the root complex and the endpoint
>    (see [1]).
> 
> - since CONFIG_PCI_DYNAMIC_OF_NODES can be dropped in the future
>    becoming an automatically enabled feature, it would be wise to not
>    depend on it (see [2]).
> 
> - overlay support has led to a lot of confusion. It's not really usable
>    right now and users are not even used to it (see [3]).
> 
> This patch aims at solving the aforementioned problems by amending the
> PCI topology as follows:
> 
>    ...
>    pcie@1000120000 {
>      ...
> 
>      pci@0,0 {
>        device_type = "pci";
>        reg = <0x00 0x00 0x00 0x00 0x00>;
>        ...
> 
>        dev@0,0 {
>          compatible = "pci1de4,1";
>          reg = <0x10000 0x00 0x00 0x00 0x00>;
>          ...
> 
>          pci-ep-bus@1 {
>            compatible = "simple-bus";
>            ...
> 
>            /* peripherals child nodes */
>          };
>        };
>      };
>    };
> 
> The reg property is important since it permits the binding the OF
> device_node structure to the pci_dev, encoding the BDF in the upper
> portion of the address.
> 
> This patch also drops the overlay support in favor of the fully
> described DT while streamlining it as a result.

Timing could not have been better as I was just going to apply Rob's patch:

https://lore.kernel.org/all/20251211193854.1778221-1-robh@kernel.org

Yours is definitively more complete. Rob, Krzysztof, can you review this 
series and I will fast track it today.

Thanks!
-- 
Florian

