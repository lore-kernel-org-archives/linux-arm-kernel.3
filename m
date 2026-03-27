Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEB210F284A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNu4zPz2mZhXhyfe6svc9T00szp8jGCp3e2sMiV3zXI=; b=WZIHf9PTlf/wcbkrMbyF6Oyimp
	//L8zGxL1Kb9fR6pz6byb41n8dDg/QxLWKvSdM8rWsw5qfdoHskxANxH6z+7uNczSbnzGCaSR+U7l
	xlH5QAKcXDGbC8F3Uwt8BRkIJbe4Jqm67SYFlSg2kkowEiweS8nSqf+ACKRi71+vGRbnasF64mKAo
	Cdj2lajzCSux1ynzmXZVokcs31bOmqePuk4TleCvBN6i4iuZ/0LvRpCjRuAeRnyDR5D9XPHuqQmEz
	bWc6rkTRZqJVKoRwEiyVwe7EgGG5boJR9GcFszLJWxxPptDuHRvKJFuKpRPcp5qDaI5sNFhbzJNmA
	M5LrvbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6A1K-00000007m5I-0ZRS;
	Fri, 27 Mar 2026 16:26:50 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6A1G-00000007m4d-2523
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:26:48 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2b0c8362d93so11593665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628805; x=1775233605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNu4zPz2mZhXhyfe6svc9T00szp8jGCp3e2sMiV3zXI=;
        b=qKXGzwR9HmIiLs/yqzVYIRRtay1UKE/JVNTFyXVA7l19ze5ZqubCuIw8NvLz1Kj2hA
         e603aBUIhfViq8IM52yk9XumSWyb4Sic8m+LVtX/4j7Uv7u9YDa7+rwGh7l0UCPG0HwA
         ZHryowHZP5v/MY3rCIfEu7rG5pIrj5SINkdpiYfsRifPCZ/0SnRf03coE1OiJWwhIftk
         KfUhfgpJBHVaPs5akO7O4WkyELOiC/LnTprRMB2qrmosq1oZBGh3kLlpcXatpcUbzVu7
         6EWZSeFeu3EPXhVcpEFhjZs7IWTEXDewQFYBrOAtlbfBV09aoUUAmwv2/ahi8QpMetGB
         rtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoEQlfLSHsrUx9AE3fnenrqwmYmDYUYae9IDMXC1Ixwb7F9AR3sFgKvlxRqwDao+8xX2qLn0E+9gVjjMRpOma3@lists.infradead.org
X-Gm-Message-State: AOJu0YzQdoVlrWcZe5RB6sFGrrGhjhRtf3tWJm84JJDbtwpFiv2TmSOD
	+WatoisgcxPvGQkbfl4WTLGak7Mb9+kZH600MufWXUhEmEI9WRAqEoq5oatAYA39FnPrC2DiIde
	mt0hojFPnbfrzFo5s8cukVFbi548SQZMKSTfX0MnkUHXRUDKC/2scIbOgzPVxJazOzliUqzTx4N
	nc8bjB+x1UdWNvb/cZfQ68hoouSrfUzAOavwEq1iTbXWN18bzWTEZ4x4C5SEdGGcQW6uTOtDSS3
	qfXRV7Xk+H7A+pi3C29q1nGn9oz02a+Of0=
X-Gm-Gg: ATEYQzwKc4EIl9F3167opsDKVjTOjK/U+SwctfUCxej+eclYgqLSn7VM/s46GOphoOZ
	IQWKIC/WpvUEP1z0OoBl/lPTZBhLVqcCq1Ce5l0WBHDBQi9Bpn42xIirIz2DpZ1A2u+khbo/jfo
	x++3Z/4cW0ha3TX/1h1vg0s0iw9bXUI6k2CtpDhXfgkUH4t2nIELnjORALxS1qFZZpeWOOa2gHJ
	vJ/H4fobT7aT+yS8zVieqZKTbIaWa+Y+KVEjYvQ9FKDspRjUMADNlrcVI4tpfR6YsXOLvEgHqO+
	LejKWpQMV6sVr/StRgP/fI3DlaKyBvqCmOBcOhv2YwNLaonlpQdogCh9l//qUJ1gDvIAocHREjQ
	N6zF+fad4ltR42mw7NLzXSCpRh78fy2u4eKodH2B8+bF15G+TOjHMFky/lGMUlso5oXtVoo9DsC
	+FGD3vELSpy7BFzBK/ERHiLt0BlY3ZVzXoAqDJdgIMtiuZG1EtW9veWYAdnHcZ5w==
X-Received: by 2002:a17:902:ccce:b0:2ae:c7e6:a13b with SMTP id d9443c01a7336-2b0cdc02bb8mr29894655ad.4.1774628804719;
        Fri, 27 Mar 2026 09:26:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0bc79547fsm7614525ad.17.2026.03.27.09.26.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:26:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-486fcc05b20so16022245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774628802; x=1775233602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNu4zPz2mZhXhyfe6svc9T00szp8jGCp3e2sMiV3zXI=;
        b=MMWai3kxJgH0ZBfrIX7SPL9b6TOdgf71+ZUaAdPLQtPstXsBBofgJ3KSWUF1EZ4lTS
         q+ZrfSXEYSD4QSuEYvHMduzxhbIvR4vfO9HmFkRMTs97jJ6hvdzcTKOCqSYi8UXdasSb
         /8xdj0nr3f2xtB0XfIF1FTmK436awjDCY0qZ4=
X-Forwarded-Encrypted: i=1; AJvYcCUAOLf26XoKDO96Tf1pZp+He4PC0YLqMnQvyy3o050tA+9HxwTkL+4GR1HTEmdxBGlcmWUjIddGK3QeIsOq3j2L@lists.infradead.org
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr52192925e9.31.1774628802602;
        Fri, 27 Mar 2026 09:26:42 -0700 (PDT)
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr52192205e9.31.1774628802031;
        Fri, 27 Mar 2026 09:26:42 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm15953919f8f.23.2026.03.27.09.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:26:41 -0700 (PDT)
Message-ID: <e53ae287-6800-4048-9a9e-e5f125671c13@broadcom.com>
Date: Fri, 27 Mar 2026 09:26:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Rosen Penev <rosenp@gmail.com>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 William Zhang <william.zhang@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260327-lurking-amazing-pudu-114fe8@quoll>
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
In-Reply-To: <20260327-lurking-amazing-pudu-114fe8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_092646_586186_CD37CA73 
X-CRM114-Status: GOOD (  12.80  )
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

On 3/27/26 04:53, Krzysztof Kozlowski wrote:
> On Mon, Mar 23, 2026 at 12:02:38PM -0700, Florian Fainelli wrote:
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>    Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree
>>
>> for you to fetch changes up to 220bdfcb4b4788f57faa2c28454d8b2dd3bcab6c:
>>
>>    ARM: dts: BCM5301X: EA9200: specify partitions (2026-03-20 16:57:31 -0700)
> 
> Four days after:
> 
> Days in linux-next:
> ----------------------------------------
>   0 | ++++++++++++++++ (16)
> 
> ...
> 
> Commits with 0 days in linux-next (16 of 19: 84.2%)...
> 
> Are you sure your tree is included in the next?

The branch that is included in linux-next is my "next" branch which is a 
merge of all branches. In this particular case however it looks like the 
branch was not updated.
-- 
Florian

