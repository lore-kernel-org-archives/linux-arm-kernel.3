Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E74CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BRqPBk1106V9u0XllX+MkRivNo9y7LXj3s6j5aNCv8=; b=UnrVE7N1VjbFSMOicfE70nzbSQ
	1GJuhGtd87lyffLLdcbcIsJ4ebrrKkykTsH/iIL5HQsE4BbEwUWg51lZDEGozZmP/5DA3UaYYYEOf
	tJV6VTRw1ukZhe4T+8/QKjwyUuY7AqFEY/r/nLt+HFT7UNoNwclbScLeYCnLRDOhk3+6/3mRH1Bbm
	oM6XZ8GNr8g9OkBJXf6lODxnnr7ZHvjPNExNmd+dnaT34cuNj45dzSYoY27IJ4OIlGfNOpExt7wes
	5iBZR2IEr68WfvIvVnOJ98gOMw+/iKiDBkfiVYvFdd/ZLwS2anqCBFgsdMZc39NEcxcR0BHJO8uyB
	hzJIBE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jJ4-0000000CnlE-1ZRx;
	Fri, 03 Oct 2025 17:10:58 +0000
Received: from mail-ot1-x363.google.com ([2607:f8b0:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jJ2-0000000Cnkr-0cAc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:10:57 +0000
Received: by mail-ot1-x363.google.com with SMTP id 46e09a7af769-7b00927607eso1669350a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511455; x=1760116255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BRqPBk1106V9u0XllX+MkRivNo9y7LXj3s6j5aNCv8=;
        b=Iop32a895f1vPM7T7CZtz7QSyhDFTBycvPPrXExF7QT7GCYva58ucoIYX50EB2NzZP
         nyTKF2CBPOkPpO4KUPTyMDKyMYL0gKctRLJwGqoozMoZpTjeCkyoBTFiTnMc/vwitRpY
         Olv6PQ2LKm6RS/ZbvVybJ3Q4+7dfqi+2dk2s12adQBea1cu20hj2KZCwjd2xZo+I/Nvr
         iIM7dLEfLfMw5qaXIv4UiZwk72UCk0f7LJxrutCvhLygC1PuDBz4KT8OBKbC+WACFEM/
         8HrIEhLkaq/Kpzs4+AOik4ZGpLny12zGunDxTAKxcLmDvutS87Yuc71fN0AoX2MQ94Ik
         aw1g==
X-Forwarded-Encrypted: i=1; AJvYcCWOTdhBiyxUC9tevGvmyLICww1uVXYNfUL0C8pbEN6vFT2J3J2ko0lOjpdK7oXp0Df/ZMr8LAXyhtgHFSPMey+d@lists.infradead.org
X-Gm-Message-State: AOJu0YzJbR+c9cHrrJjOBgLY23u1TxIpW+jnEwXjbaVnGuVN9dM0jFKx
	OfjY2wdcLkCNKyAQeORHh+fvFoIqGuL95CHLmzZPu/ItCwRfZILR+AFtxa2yk1yXLDFNRYAu9Je
	QuhrlvpRvFlXmkk9V0IXtF08ZVLHZUOmzIpsq61g4a/qtVABeXsuUhC6GZpktU/3xI8/5iVgmU5
	Mo04yA1Rj2gSTGFUjcgY9Ic8IYe599U9oFeuKzXotTyz7CPZnGJkqCTi89/rHTXluqQVS1OsB8u
	x1O5/fii6KoJnEjiExBdzj/cx37o5cDRvw=
X-Gm-Gg: ASbGncvV1eyMjSHo3xkBf3hzdks+VYL+HU6Z/87UjZ8o3whuZTfSGXDBeJjRpKHKRsD
	g1heQPhu3lTYf6Pe0fLrWX6l85FsQ/Lw77okFpCVcGX5cQ01hUWKdGbL+5EjtKVPl+sZXkC9Wn5
	/lr79dlAGYVjiRpTxvZ/Bqn5vpUhd7piSp25AY8+rMMUnl9QmhEuoDScF6vE8j11gHHcjgxXy2g
	/zPFEyBg3QbazjOkhlMozY7nNfxoRU41oBWaNOtBw3u0ufI/G9Jg3wxsP2wyZEpO7dEicWHeGDF
	g5oFDQUxkmUUh/GA5D4nr1ktWWPTjxjvLgvPl/GqzDxm/5msNvoQqIs8I2wKO4LJvncfhivTV+R
	7NwGBiENY3FBYDcNvYxAi7WgVPjdEVzhc6WbnFX9tyJTQWG0q4kMVFIBB+IrKNSuw0fgEx/TB+9
	ZXuMKnG0+dSA==
X-Google-Smtp-Source: AGHT+IEvZk4w6onKG/FqPvQXki4+sd8YhcS8jtCIMAvNiGoA/0RPFRSfmZTr6biO1NGbNCNr41Y7AOBFxg+v
X-Received: by 2002:a05:6830:374c:b0:7bb:79ad:6604 with SMTP id 46e09a7af769-7bf77538cccmr2399098a34.22.1759511454993;
        Fri, 03 Oct 2025 10:10:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-64e1b1d4f4asm225616eaf.12.2025.10.03.10.10.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:10:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26985173d8eso38609115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759511453; x=1760116253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2BRqPBk1106V9u0XllX+MkRivNo9y7LXj3s6j5aNCv8=;
        b=PN+kryWaPPm1Tjio+eRaiGVJ3J599XSPwSR+72lPyjV9qZPoJ4+VjV0voqbu//4Uzk
         tXCTJ1uMQCgWJdhyi71ayx0MfswSncXHHwB7Xxnlb1CVJFXkfDBMfgKBiyqthmTcpw1q
         0GAqseguZK2FlOcDvUvPxpyXsm9ZuvYb7NI2Y=
X-Forwarded-Encrypted: i=1; AJvYcCUI6uq31V3/m5wC+v92pIpkxfvkxDJgxnRd0ApCBf12FnjUkqkVhKStAACi89PeUjbvzwU4tfgSmijZ+9yJrMeG@lists.infradead.org
X-Received: by 2002:a17:903:1b24:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-28e9a58b709mr42967665ad.18.1759511453106;
        Fri, 03 Oct 2025 10:10:53 -0700 (PDT)
X-Received: by 2002:a17:903:1b24:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-28e9a58b709mr42967435ad.18.1759511452713;
        Fri, 03 Oct 2025 10:10:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b87dcsm55356295ad.90.2025.10.03.10.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:10:51 -0700 (PDT)
Message-ID: <a0c3a056-0d5d-4201-ac97-4becc5c61d47@broadcom.com>
Date: Fri, 3 Oct 2025 10:10:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
 <20251002210426.2490368-3-kamal.dasu@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <20251002210426.2490368-3-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_101056_199654_A9F14B96 
X-CRM114-Status: UNSURE (   7.54  )
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



On 10/2/2025 2:04 PM, Kamal Dasu wrote:
> Clear SDIO_1_CFG_OP_DLY register when using HS200 mode to be
> compliant with timing spec.  We only need this for on BCM72116
> SoCs.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


