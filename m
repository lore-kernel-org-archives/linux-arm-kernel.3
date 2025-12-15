Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54236D5B871
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyRcpH/2tl4cd7cvu3CnMf+/x/OF7RCGrUbAhUcQeOQ=; b=ef8YHuTGt+AEVnQpddI16mCsGB
	JaSUnHc6/gz4Atkreepz8hvcYBAQjjqv4LctIv+mBCxJhtgPrW0ujDvrqyp4MA+wpsdBcTjG3kTca
	5g1cAS7eqQljEPCVRO3aD7sKw8TZaIVJD50yQKFfaHbpfOLrbVQLEJeMtLr/EWYM3u4VHeNo5J8dd
	tgkHQFZs9O05/PVc646A79Wu6SoktbBt4ehrmp38FHwqAJ9On3iY66ryIdXZ8Nw9Pc7IgbdxQoZiy
	Q+Nrd5OErq9r2BeRWsH9Dm3RxE35s0AZvbRTZAsNLZSfdaYB8a6zKBPZ3pcXZeFIc9YTEcdMHI31u
	5SJGK98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGGM-00000004J2k-2XRT;
	Mon, 15 Dec 2025 21:37:50 +0000
Received: from mail-yx1-xb163.google.com ([2607:f8b0:4864:20::b163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGGJ-00000004J1a-27eu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:37:48 +0000
Received: by mail-yx1-xb163.google.com with SMTP id 956f58d0204a3-644795bf5feso3597337d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765834665; x=1766439465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pyRcpH/2tl4cd7cvu3CnMf+/x/OF7RCGrUbAhUcQeOQ=;
        b=Vkhc+c6clA/3R4qXOuMrv6HmL9is2J5kuOHNKb1bdz5c/CUntyRQApQkuK3CwN8hJ5
         p4Gq3WYL5NOCEo93+Xk8TJEULM2b2Iu4Sj1eBbD9n5y1xiNwMC2JMWyB3MAOVsde/ud+
         on4rMy5EUbYXnf4KKuxy+gc/axhv64mCbRwI1J4b9lyA12MHS5f2ugi/8NZTyOPGLt07
         40+5tlosUajfeNO3HFPdfRAajd5tnTXGvtqiaoaqkwTpxEHtOQ//gxqzOOFp1dXYnInj
         9toaGEExLdlSAATpWVMimmu7fZzNXo/ZfXMNXv745GjfAz/06vjC7slJo3ZEsesbedI6
         P4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbqW2aVhpH2uD54aun9EtxuIzkJev8i0sFHwMwPfF289GGEHgN/C+LBmPf1Y1KWDO2mTLXkK2/SwoGZ8Nb9A/@lists.infradead.org
X-Gm-Message-State: AOJu0YxoPBLkpBFuBIIrTflgkGhxFDR70MxwG7udHGr23uxuC1WKb0jk
	DgkjSgisrH7h2/wYG29Q9Tpq4L7CznHzIkva4+TDScqQd7s++/DVmTawF7w/XQ9T39Zv0In/GGY
	qYITfEOClLm1BI6q7RRHnkigj95xANI9Bdsv4T8F+Owp2ukUKQCrmS0JgQrIco9fCIW+ufg8ELX
	UAO5ssQK7fo6Ygkx8RwkNpJex01vQvU3BaOfkfpDcJ8WmY2aPm9WntOJpZe5afeWbD047YhtL2g
	kKlxxLiu9J2ifcPRpjul03MjsaAFGpuu04=
X-Gm-Gg: AY/fxX6ZXgHXyTVyav5yK8l9t0jIyHEeA6Uof7cv0rIrszOeymQHVFZHi4A3ASYISl5
	WfXhE2+WLxQ/RwIbFZGxKHuS0Bi6eaqVoqeKmUC7LhAjCPX+WzQq9ItRESZ1FFxAPBlmoHePCgj
	GtX2lPQ1eDpz09rlx9YpkgyRqXw875e455QDJC8ylVXmTONB1IDiigL9+rRcfagCoBFOsfXCjLN
	YjpVoRTCqTLDtl4WGXqhr9VWXaspyxvYI9tk9maWFJGgP44iBYBlSD9ooiugLm7b2AP2y5ub6Jt
	hoXnNu8B1xYM5GJ8h6jGtjf3aijo8RYm4GrtJI5X620RYqEa/WYjw+bu/szfhI0j7NmecKTrM/M
	DExpLZYxZEpadlSZXvazdXI4gpDcwCItuopQP+xtbWStrp0wqn7YrS/vQfZQQwvPqzRtkmfJev9
	rFbzJmE9rTis9dp7I12tHy2EUhzdfYcozjvrKV0Q5p381wfpGLBg==
X-Google-Smtp-Source: AGHT+IFY0hmeCtaeWNjTmb89wg4oOswYS27PW3BnqSe1NRE+8EHkt3ULVGSGt4lzpeV5csrKDmwqcZFCxID1
X-Received: by 2002:a05:690e:13c4:b0:644:60d9:866e with SMTP id 956f58d0204a3-6455567be0dmr9496547d50.95.1765834665197;
        Mon, 15 Dec 2025 13:37:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-64477d34ad9sm1632655d50.3.2025.12.15.13.37.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:37:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e41884a0so1069786885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765834664; x=1766439464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pyRcpH/2tl4cd7cvu3CnMf+/x/OF7RCGrUbAhUcQeOQ=;
        b=QtIksrQ340Pm9qHNVQq0QdO6qDQQTTFqcl52DjrKpiOE9XfHH3wf+MZ1R4ToV6qkfQ
         1qZLytmNtlUXg5T5XmGq5URWlawuFUIaNTKn30+808NZLyxAayRCvHWcqcTXb0xoj33j
         IcH01xnNjPQsTztp7hoBWGrPKqvBS6PzQK4RI=
X-Forwarded-Encrypted: i=1; AJvYcCUWs2BZaDSfJ61MeALTUEtGG+vn6hxwsZXyLg+giTGJqa3aNllOzrx4LRk1a1pJ0YKozLlWTw9zciuklQxpKXtD@lists.infradead.org
X-Received: by 2002:a05:620a:710a:b0:89f:7109:185f with SMTP id af79cd13be357-8bb39dc3e95mr1812351485a.31.1765834664542;
        Mon, 15 Dec 2025 13:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:710a:b0:89f:7109:185f with SMTP id af79cd13be357-8bb39dc3e95mr1812348685a.31.1765834664146;
        Mon, 15 Dec 2025 13:37:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be304dea8esm40611385a.8.2025.12.15.13.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 13:37:43 -0800 (PST)
Message-ID: <30d6512d-9705-414f-b2ee-3e9283968348@broadcom.com>
Date: Mon, 15 Dec 2025 13:37:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: Allow "dma-coherent"
 and "iommus" properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>
Cc: Ray Jui <ray.jui@broadcom.com>, Scott Branden
 <scott.branden@broadcom.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251215212736.3321550-1-robh@kernel.org>
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
In-Reply-To: <20251215212736.3321550-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_133747_596794_2B22FFA8 
X-CRM114-Status: UNSURE (   7.51  )
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

On 12/15/25 13:27, 'Rob Herring (Arm)' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> The Broadcom iProc SDHCI controller is DMA coherent and/or behind an IOMMU
> on some Broadcom SoCs, so allow the dma-coherent and iommus properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

