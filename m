Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CC1CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbBVbZQpK7Lvxj1vVsDLr4pX2aQ5pdv85p+B8cI0h8g=; b=KrY8jcH9uCfbq29keo4Mfqy0mB
	Z5vlK00kbeki0qoWk0MzeKG6/4Rb3C5xZiO6F08RO3VKDZP/Ei4bGuEcWWD9WJkcjd/59QbuBsmnN
	c9D7aBYPZOU0BQn71VmuIai0WE2atRGqVXx34Ssm9A74ycG7goGytuWpt7pWrpqrodOEstU/xBYZo
	M695iWXMI/r6O2HX64C8Kve/JAt4L+goULZnUzfCW+lQzRc6BEGlUQy2OM3sTMdO5SV4EKqSgKo21
	1GFGhsxp9lAOmg7IF9njYYgeHwBbes9mSI5coLGkwfBSsFn1qAItTf1qx/HY8nFRL1sQfGszL62DC
	O+ixeYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJll-0000000H50Q-1uO5;
	Tue, 05 May 2026 17:41:17 +0000
Received: from mail-yw1-x1162.google.com ([2607:f8b0:4864:20::1162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJli-0000000H4zf-3uqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 17:41:16 +0000
Received: by mail-yw1-x1162.google.com with SMTP id 00721157ae682-7bdec52f48dso1971027b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002873; x=1778607673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbBVbZQpK7Lvxj1vVsDLr4pX2aQ5pdv85p+B8cI0h8g=;
        b=kYoPVhfwp/cgoAiSDOkE4V2Hky8P13J+6M4Bo32cPE/wgsr33kFuCQbX/ECjTF2iEM
         Ur1jqmYmRoMipZOLg8/8ZMWKADKsEypBpyST5wWdfio4Ak8QeDS9Jup28SgDOLkDu4kt
         zRv+1zAnfTm9fI6+FdRn9OL6fWqgnoRyQv1tGvK1pWefUlEgBx9a0EAUJyiT7H2Q7Lhe
         SfzTB9xkvq+VHVEjzz8QuHeeoXJxQi6sNL5twbMLotOd8dY8GR6183RIELGoaHR9K00a
         1FoncDHlQ1f+qKJiH86aM66TrrHdkr+ZB0xdQjHWnhw3SPP00XG2hnKwgEIp4sTyd3ZR
         pkrg==
X-Forwarded-Encrypted: i=1; AFNElJ+dRdGyp+zGAtTR5z64vlchcV6p5mmRhDbK6OPYJ+jqzKb/BMxSGJUAZjF8OUc3Ilr5kpwAQsTaexZ6znYzPOHl@lists.infradead.org
X-Gm-Message-State: AOJu0YwA8OHx+cD+6KjhJebaBAfF5bZ48F4JLnOxBWyeghTZlsLSHD6j
	Zu/GaH9VzMKT5pLs7Ensfvi4UG2TnMjzBHDyH2Ontn4AHrtSsJAjt2j2f9DNp4aHZQG+t2mP24Z
	tr9MvEwPSdD1gyA4znLLJJ12qWOZgocRZKf0g/uEd8B9Ftj84CRfiewmzTdxJOpacJ3Wa1VNOrH
	oQne1L5dqAcbH06e9dqtPpaPETI8UwYujNqa1G9tDS8pb2TFAy9lYZGwJAZSxYUngw2udPUJBAQ
	Gy0/PmftsLuuma6cgAieHn3wf+K1aWpU3g=
X-Gm-Gg: AeBDiesXJxapSaG9Kr9RZbFDOa6K1VnHt6x1KaPrwMvG6JDhfVtqRwRk0Tmubd/Sxcw
	LaNF3SX3ZcFiu6v1LWXHGH5Ee5nNG999o+Qt/nFpP8gOE3DlHIP6dyU6+RnohzvcWD9P6QFw3ih
	oBGoXjk3WT/Qj9+g7uvsvSzKrtMfHJp6fSBrBDEqf7/Aet5pVzyqI0bzIeIJII/YHlR/ndJkZ2E
	UOQUxq61RYFMMeO9RnCE3as8xVWSS82oGnSbUs/fPyZ9Ebt0W9kWFzpNrdcBq+W+8XL2lcEABtX
	jjntB+I79FfWRQ88A3yRHM92CCaXcG29MUdlDjoTMevzfjh8tv1Y06vs+kirIjmCFG2gnEBb5fI
	5g0dtLEvEF54zPsesNZ1lViCA2Y8PEVNcemE3a/XR4BHLEnmMVGKSQVlPaE6A2LzrJFExfWGneW
	j7Iu3UUPiWfraZ3OlNjynBrblqZ65e7KKnDQUU9fFWCjJ+AzqQy+TN6Se/8m47AZTAT6uBQ6v6
X-Received: by 2002:a05:690e:169e:b0:65c:6ffb:302f with SMTP id 956f58d0204a3-65c6ffb39bfmr2282485d50.46.1778002873124;
        Tue, 05 May 2026 10:41:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65c2df8a805sm1097776d50.12.2026.05.05.10.41.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 10:41:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-902de1c513bso46267285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778002872; x=1778607672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EbBVbZQpK7Lvxj1vVsDLr4pX2aQ5pdv85p+B8cI0h8g=;
        b=Ctsu1Fa+829B4ul/Oq3pTWZo9/N7IMkGo20W9cDh4e3mSoEuactvN+P4MwIwGCHe+Q
         97AoIOBhJ7kgw3pqlWL3rEW2mtDEvWsu3/eVILBBwj/bS1Ut83adeyDPy1uD3XS2XWkV
         OwIkI4RBhBWpfoNX/b0zpZO94XMw70p9RHNVo=
X-Forwarded-Encrypted: i=1; AFNElJ+sHdLw94dOJQ9cRPNDdUkaz5dXtqTdaTJRaOGRtQRklsV13IQhymlM8+f+P2RRMKFRaNY7unlfplRvykSmmYOK@lists.infradead.org
X-Received: by 2002:a05:620a:25c8:b0:8cd:8e8a:3584 with SMTP id af79cd13be357-902e299dd70mr664633485a.11.1778002871620;
        Tue, 05 May 2026 10:41:11 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:8cd:8e8a:3584 with SMTP id af79cd13be357-902e299dd70mr664627985a.11.1778002871100;
        Tue, 05 May 2026 10:41:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253259sm1372131985a.24.2026.05.05.10.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:41:10 -0700 (PDT)
Message-ID: <e095fec0-f0fa-4a6f-a758-9d45f804cb3e@broadcom.com>
Date: Tue, 5 May 2026 10:41:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the
 table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_104114_974127_8BECC6FE 
X-CRM114-Status: GOOD (  11.02  )
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

On 5/5/26 02:43, 'Krzysztof Kozlowski' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

late to the party:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

