Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179B4E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsx/C/z6cBL786ltmFv1u8SmaC8UkSjwOZGPBi68EIc=; b=sSKP2gpRWzz/Vv5bhr/FxxKdZd
	wi3PlbvTrkt31INP0jNZCjg32ZIeDIY+/DSuM/wGhM26o3zsjmXLGPEm+1uzQOFKYut6uQQ8b0ArQ
	CNJ7XH0YAzESg+uwnhejGJtHGd1YYA6p/x34lCa4vXgHT/m0nt3Pvs/0Q3YAGguRE6OJRW9b1Obu5
	JEsFOPBfzwcVNOavAPHh22FNB+dQKOtdO2xy0nCV6JHnQvOPkAMFkN0EhKL/XoZEqjal3wVUVZNHE
	lT75HhMSsYLMS+efQ4SJJwEy4wQSzDBZj0uzQXcXYXfNM5aVoqcMS6l+OM+k5hL4Tu4t6FuMP+LgD
	cyITfQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ6g-00000008lOA-1AgB;
	Tue, 17 Feb 2026 18:47:34 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ6c-00000008lNU-0DTQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:47:31 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-c61342a69b9so1800028a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354048; x=1771958848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsx/C/z6cBL786ltmFv1u8SmaC8UkSjwOZGPBi68EIc=;
        b=jgEaB7DuXkWd8TBzgOe1xwD/c7CU8SB0TX6PTVdDR7NOpGqQQkRlDQDQTeLHr0OiSL
         EFbrjJnGuuTgSqWxBilvxQi6IQp4Maj6v2+hlVNTjrzKuEP8eEBFvrendBStryq7qXhF
         iJUHzgJZSEoi4DrrUjyXIPQ671AcRCSQ5GMi+d1wQhhCVqtRtgZoel5cRVCAE9vct7Rc
         h3307q1gM7kuH/qvWM3ucJMk5Play+6aqcHK2EcIyvyYEItJbsLeUHtPdooks8etLKcN
         UafH77acXH+tcNsmQ+q/d12hSdx9vYudTtAwHIt8LjDPU11CMsVqKWHid9ptbFC29ZYe
         hM+w==
X-Forwarded-Encrypted: i=1; AJvYcCXI4hCk1Z3tzn39uj1nTi6zy7l3TUs3HvjguSPW+cdteU5iFGbBVoK9cWrE40GjdGfzJNlxIBErhWKRW5u6qPkX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Sxfil72DBcS5oZqGsGePeBPU63KoFEJF48sU0o6iIPy8rDKM
	ixwjlvIq9P4qk+45Ag/dq4MDnxlH07FRNwwR+O2FkRjoQtAK2At2BJ32YTKFyLRxzk60bzn309D
	X6mKrITDBaLEaLRLIhhgJLLUQeCLcASihcx5oUjMBYy8ya9JytuZhLrlL8WEwCUTjzbKKizvwcy
	mMz/sc8M471/bDocDmV2Q5cebXqoEEWJpn+QEsxm6PP9teagCrhfNkIETMZPQU3HBuS7M1Deyfx
	8K8wy16C5zHh1rtZFBFHOsaqeeK9UwkkKQ=
X-Gm-Gg: AZuq6aLvGjf+gen2TAFzZIku+X5pxVud8Jz4ibvIjD5BgD2veKVtRsq2M9CwAG+QTA0
	B7k310DZNPRY+/coNjSGRGJDcpmTliWjQXYBcb1riM2ZNGEu5AOtXLYV3FxhnhM1B34mRy9ekWE
	mzAphr57SbbArWCEYseVHTHVNpWGTtXt9ZqXn0TSZt409US137lwDbMYRloDDzUsCUS5SbrOWNe
	XsdxOnirQjqeiS1+JimqwyhWFMI4LHcD0z0a0i4Zm+i/QI+hSQuVixEWvFZEmOx90Am127XOdh7
	Cq7esJlzEHfE8cO8B0LKjs4DHD3qlqqkdxu4cjTP05K3mWRwd7RW9Yh3STXVt3SXXkGycHc1Kz1
	eDtKcwqf7MXm8v+RS61/EWxsijVFrMnskNCM0XNtlITeYJ/ipKWtLLrRJ8OzlMcVQlrg2Y4NMFG
	mG4yTh/gJa1n+cvhy7ClognEaUE2L7aHv26EoNKCZIMLzycsXz6LUT9PEg1tJi28Hw
X-Received: by 2002:a17:90b:4b83:b0:356:8719:f5b8 with SMTP id 98e67ed59e1d1-35844fc0929mr11036421a91.29.1771354048383;
        Tue, 17 Feb 2026 10:47:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35662f4d736sm3241044a91.5.2026.02.17.10.47.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Feb 2026 10:47:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so2560601285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771354046; x=1771958846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bsx/C/z6cBL786ltmFv1u8SmaC8UkSjwOZGPBi68EIc=;
        b=BqXA0Clq5r+eTR2N478tP0NgXhoQ8MnyqlKiMl0Lo+lO33pZEFgDV6lnTaeOW+4O/a
         OGVBM27ehLOrq5renBMIKvcy2BV1tDNfw71pujSMbDgdu68fotZqlGdnnJg9d72r9yQn
         bKWCwiP3LMlxkUsxKzPgxiYrpt5sC1ZyLTxaM=
X-Forwarded-Encrypted: i=1; AJvYcCWYzZ6kyBf9APM7r1klZqvb6GRe86oyCahp5zamm7KNjbD/Ze6CIt3azux3K3LStnbnZBKiLuQGDaB62OtdocKk@lists.infradead.org
X-Received: by 2002:a05:620a:1711:b0:8ca:457f:a1f with SMTP id af79cd13be357-8cb4c03c2acmr1626746685a.90.1771354045946;
        Tue, 17 Feb 2026 10:47:25 -0800 (PST)
X-Received: by 2002:a05:620a:1711:b0:8ca:457f:a1f with SMTP id af79cd13be357-8cb4c03c2acmr1626743185a.90.1771354045401;
        Tue, 17 Feb 2026 10:47:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm1714775685a.11.2026.02.17.10.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 10:47:24 -0800 (PST)
Message-ID: <dd8c6277-9ca0-4d9f-88bb-362c5b96843b@broadcom.com>
Date: Tue, 17 Feb 2026 10:47:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-brcmstb: use correct register offset for V1
 pin_sel restore
To: Kamal Dasu <kamal.dasu@broadcom.com>, adrian.hunter@intel.com,
 ulf.hansson@linaro.org, florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260216191543.2514647-1-kamal.dasu@broadcom.com>
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
In-Reply-To: <20260216191543.2514647-1-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104730_231244_D7BE0DB8 
X-CRM114-Status: UNSURE (   8.96  )
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

On 2/16/26 11:15, Kamal Dasu wrote:
> The restore path for SDIO_CFG_CORE_V1 was incorrectly using
> SDIO_CFG_SD_PIN_SEL (offset 0x44) instead of SDIO_CFG_V1_SD_PIN_SEL
> (offset 0x54), causing the wrong register to be written on resume.
> The save path already uses the correct V1-specific offset. This
> affects BCM7445 and BCM72116 platforms which use the V1 config core.
> 
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Late to the party but:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


