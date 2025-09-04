Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC69ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqK97eCKaUkliEvZf9Ytd8do9pTcU9xExLvP6WCAzkE=; b=Yw9VF1Fk5kTMk3W94TNkAcKsKk
	aPAKdRecCM5+KAaaPILv9/wWybynTlNSWnr+/q7V/gMWuvHmlJNtzS79eAqD10U8M4bBLE51brbqq
	GqsF0j09TYedoTsJKSAH3povWgEicAbXEeq6mZ53hFAnvsPH+j0wbL0lK6vQ7H3flf6bAp9CvoCoe
	f+4/0KWd5u4cwSKIRQ13OIFjWldYJsaCUKNdLbCRYr78DH3plVasU7csrzubXseD/scfqQzPZhhUd
	bFJdM0LojBega+lGcKk3Rbg9Natxe+1/uQBfaIUybA7KI9UOX81XP2YEzwRQhOmddb7QtpDbN6ADs
	09wpPQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGsW-0000000ENEb-36ES;
	Thu, 04 Sep 2025 20:48:20 +0000
Received: from mail-oo1-xc62.google.com ([2607:f8b0:4864:20::c62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEhN-0000000DZ9K-0lwW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:28:42 +0000
Received: by mail-oo1-xc62.google.com with SMTP id 006d021491bc7-61e494a335fso598839eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 11:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010520; x=1757615320;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cqK97eCKaUkliEvZf9Ytd8do9pTcU9xExLvP6WCAzkE=;
        b=bDhkwGMsXa7h/Y6Qv2peyso3DnkTyf4ozEkW/BY+nYNsp2FCjSpkEbj0N//CJlf5eA
         ZwGUURMYEEDlwrou84Yx2J1WK6/HHIWf0elhBa59ng9jdfdSyEnRnNOBhF45iXrhGYBT
         U72eEdOGKVPVfzEVUvauG5z0tZ4fh06hEmxgu83eSJl/PP38+WHrEwQso1lcFu5+S2Oq
         qmYJ+G3QKVf4JQgrhIgnMqtpg9O3D/czmFWv44QZYryKt4otzEah1gklbhSjiNu2hR3Q
         qEuSSBheubKs2kv5IznGMmZICGh2fqI0cqdXHQ4K/BQtaHscz7iGGI5yPqI8uu+2jkCD
         4BaA==
X-Forwarded-Encrypted: i=1; AJvYcCV1pwAybJFGoIO8SBYrri3Z0yPXLUyoee9Wdpq/7xe/GwKXkgo8BWUWWVWGcwql1f9hwFWkDVkcVaaE5RDntWkq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ytiB2DpkxGjTwJCqVk72LbONg52CFOi3CfxCg2NE+TbkBRNi
	ZNhCPvcLBtvd/zcTzsUHxaaHLahGjnWIuFCTpM0gb4Kzq9wW5DQBNSY44tCTgkGAv7oA8JiH1p7
	1W5swkV8BwulXtWgKTU5VKEo2xTvqEH8chAEST42JudzgZYvPo+CplLcfhMVyaQkJL6ec+ZiQRX
	+iPVkDojMhj6dfAAY4UF5AHgxz/EqG2m/aydZ3bvvTb94OkVoarGxGA9La65JGxJXtQjVu+QO4w
	cSkBlArEtB+dCMSYwDKfAopE5sgcaVH5qE=
X-Gm-Gg: ASbGnct41QgnfktBFAdSc9tB7FC/XtvZ4M5d/vhywcKOFVRFi0VAup03d+gSwqJfjFq
	8Dp6uDXN15NQE6VAdZBomRAaA/4ZmJBvQGp2xg+fOMwyu1EnUaULjt4xwyY8V2K96Ba7ws/6sAU
	ar+mm0zbZk8bFNXBeRdKOznBCqUdXcqP3eThQ6x8Ubp/1bldukx5URh0uDCyDf7s0ER0uTCQM4g
	wyOhw4qIO1SjzJGyu5qyqHzMhJKHru53zkF0d5YdKupR4uZmrwp5OwspXYplAm/Sy/3U08Mc/Hp
	T2z9tSdk2+xq7Z75Ovj0LVxBMg652MN7kdesDwuvALYoE5TYaDBrrCOwa/xl5OS/0Ei7ss7XGDD
	c6yy4fWQKwQO/bQffCsOngU7wN+8iP5r8KfAzyYgnhiojZMEhrrfJ/bl6t9+ZFwMAwuvBWAUUUM
	ZayB7q
X-Google-Smtp-Source: AGHT+IGaRTwURnOmmQnlh+K4WA0HC/4taZlfr/GKINJUu647wrCbuBqiu3XactqH6rXVCI16jRAvg8KhKd63
X-Received: by 2002:a05:6808:6f8f:b0:437:d0d0:2791 with SMTP id 5614622812f47-437f7e0cd70mr9845163b6e.41.1757010520206;
        Thu, 04 Sep 2025 11:28:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-745f1befc4esm178057a34.7.2025.09.04.11.28.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e870623cdaso245744785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757010519; x=1757615319; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cqK97eCKaUkliEvZf9Ytd8do9pTcU9xExLvP6WCAzkE=;
        b=f+QW359du4hLVgWb2bZBMzx3wMFimuqXEA5l7PCcfYTmPRk42aKrq+a8e9XU4vZlaP
         s5ujqMrR5Vqcw14iusttw/qI2V6A8bUX4SWshuXMnKo+Znv3hk8N0/IPJRhRoY2+rpCa
         jc+dPmTUbxa4cFuTBkMuBDRCIiYRSRSSIlBoI=
X-Forwarded-Encrypted: i=1; AJvYcCUO8r+CEpUP7nFhUB/jlI7Ha6gEzX7KlaWsMptzA2QJQIL9stcJ8k9old2Oc1CuwZrH0Vz37MpfVWpAx+hRixls@lists.infradead.org
X-Received: by 2002:a05:620a:4145:b0:7fd:6709:f091 with SMTP id af79cd13be357-7ff27b20401mr2095667585a.20.1757010519060;
        Thu, 04 Sep 2025 11:28:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4145:b0:7fd:6709:f091 with SMTP id af79cd13be357-7ff27b20401mr2095663485a.20.1757010518465;
        Thu, 04 Sep 2025 11:28:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa62c789esm322292485a.11.2025.09.04.11.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:37 -0700 (PDT)
Message-ID: <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
Date: Thu, 4 Sep 2025 11:28:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
To: Artur Weber <aweber.kernel@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Elder <elder@riscstar.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_112841_252700_66DEC73C 
X-CRM114-Status: GOOD (  11.47  )
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

On 9/1/25 10:07, Artur Weber wrote:
> This patchset does the following:
> 
> - Introduce support for bus clocks. These are fairly similar to
>    peripheral clocks, but only implement policy, gate and hyst.
> 
> - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
>    and update device tree bindings to match.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Stephen, are you OK with taking all of those patches through the clock 
tree? Patches #8 and #9 have a dependency on patches #2 and #3.

Thanks!
-- 
Florian

