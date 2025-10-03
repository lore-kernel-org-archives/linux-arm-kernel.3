Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83F5CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+rEM9+wzhaFVPN9JNs7nDiRdjo8ZbQobpK1PNdub44=; b=sEf7XC1drJT0Xxodq33kyes48T
	U4D0GjCWIVsLwbyy84JMVYHsPMqiEZdU8OMFOShUDKxx/F0uLa4VR6khDEMtymU4SlXuZNzf3AWNN
	gcSQqDgj9R2+fXxKaJke8WHzV3V6zjSnbvzGVOqfd/2rvYP654QreYex2MCqqXzxhX4BZFzmGAZfW
	Qp6vsm7y+yEMItLCF7jvA9Zq4VrnRQY/QOl30U9UZvuRSdm+qeTTbOJNmKVH98wyQJnuZNQIaRk2n
	rChfFAl/mL+TcWq8EsOExwpd13Y9M3wloSGApnRkogB8agcjZuo5+jYzbL2ExRVcdX/lkEGh91TzK
	276Fdo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jKL-0000000Co1s-3CLc;
	Fri, 03 Oct 2025 17:12:17 +0000
Received: from mail-io1-xd62.google.com ([2607:f8b0:4864:20::d62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jKJ-0000000Co1Y-3IF2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:12:17 +0000
Received: by mail-io1-xd62.google.com with SMTP id ca18e2360f4ac-911520e43edso103389839f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511535; x=1760116335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+rEM9+wzhaFVPN9JNs7nDiRdjo8ZbQobpK1PNdub44=;
        b=QkguRQIMlci8UELOjRy9N87Ntu/VP0Lh1WCBo4HZ/ALf0Q5kQXgeDTqh3DFcA5sZuM
         BBlpbDCNQraWDYnOxjHMzwqsI54mgxvZoew3jGJuE8QEdoVaEZnQlj2VUHYV1uJLKuEX
         9KO4w084x7YXqtsbkg6ugDWy4i17jkFsfJ8cgNtnPjL+tiUrKUXLS0N5PSQEYpf11ZvK
         +6Kft+GpSaZQkgZuIsmM+tlC3Z7XW5LwgKFpNbbAIlkCH0W/YIwsT7Y22o6tbdyTIbFc
         mFyHP8J59m8TIhIe9s2rMq7g8lX26AIC2w4fEb1IoX/Lx5PIdxLX54J9yxDhzFNQ7hCR
         B86g==
X-Forwarded-Encrypted: i=1; AJvYcCU0iW+c9vym/ArnfAQVYiTUz1H0VsKiBJJwUAbbf84vXWeKU6VW/6zsLh8/UFBMVm/ziXZN5NtZS0qjwV+7s0fI@lists.infradead.org
X-Gm-Message-State: AOJu0YyhhB3upZ8TFk5sVCrFsLbq8kW/2Mq3vi0hKOymJYBLJPlMJPFs
	jOPvoC+VBu1OiGO/EqrJWW6WkQUU1Ujs/meA3qb8Evy1iyXm8rfJWXVSAJGU957O+QMs3s/aGuS
	gnneEcmp4raxJBy98Lwh8oG90GWgOjOFSKNM3QJjXoFPJKFpqBJCbBdlEUzc02CEtViGWLnol6R
	yuSd2nMvk+hXqYwtBPiG4OL+AfgoyhRZcu8xfbLrNukTspL809h/z1CV0q5LjumlC/MMvkASMS4
	32T2ziki9FYFuq6OjlT1mq9Nv6EJWWlcgE=
X-Gm-Gg: ASbGncvoIh95dvZjyTgCX4B3E+ydd4n38SVjSu3w9l5w04gefyDTi3PN9dTxju/TWnL
	x72tz/P6DtPraoRpyGdvqlIjVw+4JxD43fHjj4ozlrV7oZN5/UKe1E0lM+FMgNKV0wjKB3g6G80
	g+IWO78H+Ak0ZbmZb5e6tM7HGXd6anpgHlqQF2ua+rFwkOXOF3gBdca+eP6W1pUaf/ym+yFAf4y
	sX/5LbFblcsCvSnXzh5jOlLufMaYB3kM7dDZxI8t3wrekACEJ+t3TrFlb7l6dkXwJ/6WNI+dQ/O
	CxuqhLC0t9aperyvbh2nHJeSlJlCjqa9Y2ysJyG5Dubng34cXKhBFct9Wd9rJ6jpjLb2PJ91J88
	gGJye1KdtR6QktI9yaUjyvcyezZd3gEoubqBZ4wtw9THSLiGrLd/DvApF7RoDNcJPLjRvfB6NRJ
	dv38zvKUvvGg==
X-Google-Smtp-Source: AGHT+IFc6Gk6t6C+IQ5s519kQkbIAQTY4IhdwZ3QVMoffXjPX0iZ6IPpPCEDbswDhfP0YN8PQttUNbCv2HBG
X-Received: by 2002:a05:6e02:1809:b0:42d:8525:ac81 with SMTP id e9e14a558f8ab-42e7ad866d9mr44134455ab.17.1759511534355;
        Fri, 03 Oct 2025 10:12:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5ed26ad8sm407208173.30.2025.10.03.10.12.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:12:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28a5b8b12bbso50456915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759511533; x=1760116333; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+rEM9+wzhaFVPN9JNs7nDiRdjo8ZbQobpK1PNdub44=;
        b=U5gGRb8rX0Bar8UqYxCBQWtqGcEWdzfBNPXexLZ2iBGtPjwSPOBKImRvVxQVK7F5hI
         IYBoxwj2T5ToEYnIxBdfJol6DN5aXWRoGiSF3ZnwdlBF0PfpX7hRxoqKoyu3jzPf57fa
         7YzHUNB75EVYUw3fvPEwxl/z+870kGl4w2va8=
X-Forwarded-Encrypted: i=1; AJvYcCUa1j3EVz7ERZ6E98tepefBftE62SadlY1cjhKuAVnjdioFdk1eN6zY5znAPKbDa/VqYhGzmB2bFLomg/gwNbTZ@lists.infradead.org
X-Received: by 2002:a17:903:2f04:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-28e9a67faadmr48169875ad.47.1759511532906;
        Fri, 03 Oct 2025 10:12:12 -0700 (PDT)
X-Received: by 2002:a17:903:2f04:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-28e9a67faadmr48169525ad.47.1759511532505;
        Fri, 03 Oct 2025 10:12:12 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ba1e3sm55227475ad.75.2025.10.03.10.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:12:11 -0700 (PDT)
Message-ID: <196ccd66-18fc-4e0b-9672-7adaec550449@broadcom.com>
Date: Fri, 3 Oct 2025 10:12:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mmc: brcmstb: save and restore registers during PM
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
 <20251002210426.2490368-4-kamal.dasu@broadcom.com>
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
In-Reply-To: <20251002210426.2490368-4-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_101215_835140_797E3837 
X-CRM114-Status: UNSURE (   7.75  )
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
> Added support to save and restore registers that are critical
> during PM.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


