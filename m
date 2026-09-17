Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D082EC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRPSaO5+XQixGFbnKMRKXwxYFIVhldNMoYMkzm/WB5M=; b=S7koE2QcpNZmHcgktqGvPucCAA
	4VTtugfiO4qkiEtaVFj/+ZH5KLHoNCO1Ozw7VjuOrR8koUwjFQG+oFsY4u8I+WLvh4aIfzfZ1ITZ5
	3ezgvqHRpWbb4MGSmBd0pZjjQW2K6oThe4wRckK5r5TEQJiTADIJXVaf5SE8qB5wVGFqovgKGXKQ4
	4UO0x8B8ZR/tuglGpd7GMbSeoXNQ8dIOmyFuU26xmZOCEeO9N7QIyJ51w1hVJC7+CJsojb8khINQS
	K9EZB0I+olg2VVfpV7rrvi1M2t5OjQc9+l4B41UrgDI+tpvlyupYSECIf45TbYBylzyDF7EVNbL+u
	8rgj7W1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZX-0000000AIZi-1h1m;
	Thu, 17 Sep 2026 00:01:51 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZV-0000000AIYd-0FnX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 00:01:50 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-39266382df6so74141a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603308; x=1790208108;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QRPSaO5+XQixGFbnKMRKXwxYFIVhldNMoYMkzm/WB5M=;
        b=dF5JDo/779pc7oKkkm6vYVPSbXCpV2IAjPHkIP0l5vK99iPVgfkK4uyAvN11u1nsjA
         LR+HWTIxefHibLHZ6QTp9/J6hYVsQZhtvXYBFhLpN1AYcTjho+1Jfl+YSY/+iO2hIX+q
         FpkamODvd6y2dPjqNHUUiZJEhfSr3K3GAukfYa2hGAqj8fMLABIxq9ocqK67vK2af36r
         eQYOxQY3A+QwKGskdo9jbCDuebgVQWMaxiGv2//Zs2tYUa+au5Pl7x8r/RdXXp7/70xR
         rkke6LoUa3Qy+GuIpmJhAbLrRJ6+ic2wp3edb1+n6YL36jtKELboa0sEhCTdD1GANbfk
         tiGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfvEIdwe4CTLqQBR2YT2O6gx6KMXDgcOnVDr7kc7WTe+rhl37/0PSM4DSC0RxISmxUSZRxxTa5aiG6/XtZ1pgX@lists.infradead.org
X-Gm-Message-State: AFuF++lAY53pmwrog6uzPur03/m9ecvdhoIfnrA6YXeUmfqFNt7tu61V
	mpmwNKW/xS5n0iRJ9F813jfYvsDuFEnAD21FHXffgdK6sDP6P7ESuJ4Ozd+sV8VUWJ3BR331Xj3
	Iy+ReGUc3P1tdojOspWO6DWMRYBMoa0cdGxnCda21bVFEuH/S5Z3cKL2enfNZgbQz+F+/MnmbM3
	+d6wvnGHqnpQbO0VDkn3BiG/ZSx5n3OyI0TDqQLgik5250FLMaXvdr9UiOMoDxWeW/o9lVNdpQ4
	LIS4GFc2scj/C+cm+7nNKtGX5F7vIDvMFc=
X-Gm-Gg: AYBFou2Bj+vskf/U6XyHpoKk79k7YYTaehP6F4C3TMz6B5o0D1QS0oCuahPvGNDQ6x4
	4BsWy1qIpaMGCfXXxV2eADJubjQ1NA0pwlLOyrLRZx+ayV35MyBhVtF6OS2p/MFkqMLrcBO+PyX
	W5jc0reHZ85rGtVOgQKQGJJvwvu8HhpcVImgdr94I/bShIBsj525zi2var0hwtQwTWt/uBrBvMd
	uRf9MF89qrRznxB6IlK9+ziaDGBs8FDnzMPwAHK7A+EdXBB+B4bu09aigVpQMYlldaDvDpBi+Ck
	/cV+8/j60MEw1urQn9WSMnFVU+ClRS/cqy1Zn9mcpOVwI9u4BXmX9Vru668eA3a274YPxvvaFf+
	1UdOqE+BD2uksGFqVEVKMxRZZpsedCqTHtJwdkMD9KxZlmtkeikNEdRae9Y0nhA9w+m3qXv8T8q
	PrjSrs/9TS9ERVQar1VEfFr2IVbprx/6hveU8ptr2ZSB4=
X-Received: by 2002:a17:90b:544e:b0:39e:35e4:d31b with SMTP id 98e67ed59e1d1-39e35e4d992mr5900333a91.5.1789603308009;
        Wed, 16 Sep 2026 17:01:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc51b89b525sm208081a12.0.2026.09.16.17.01.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c6e939ccdeso257739eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603306; x=1790208106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRPSaO5+XQixGFbnKMRKXwxYFIVhldNMoYMkzm/WB5M=;
        b=D8r++H5kUAGslsS8cOPw12vNfcQ3LAN3FXwB4/bK2JuLSNQX4UMRMA5vVf6c8OKxPj
         3gai1pfLzT+PxQJHdZ99cZey3Msso7S1sFJcal7G5y7ANgaJf8Vhe1TR2OgHx5sWUDk6
         T507FTQIgWYjS9wjQGGraa+0ZesjOEYcdyKHg=
X-Forwarded-Encrypted: i=1; AKwUvBwc5d839pQQQLYn9fE1ZEJt6hmdpGzkhJpT9kKJ9leclL/KAbEQi5/iqIiQQxkXV8rCKxjIIr3xkBWrIkG76kX8@lists.infradead.org
X-Received: by 2002:a05:6820:1c86:b0:6b3:b9d1:f629 with SMTP id 006d021491bc7-6c7d46e699amr6935905eaf.31.1789603306397;
        Wed, 16 Sep 2026 17:01:46 -0700 (PDT)
X-Received: by 2002:a05:6820:1c86:b0:6b3:b9d1:f629 with SMTP id 006d021491bc7-6c7d46e699amr6935845eaf.31.1789603305914;
        Wed, 16 Sep 2026 17:01:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm21269531eec.23.2026.09.16.17.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:45 -0700 (PDT)
Message-ID: <5c9e48d7-7f6e-44d3-bf0d-e23df1329621@broadcom.com>
Date: Wed, 16 Sep 2026 17:01:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] PCI: brcmstb: Declare and assign quirk
 OB_WIN_MAXSZ_128MB
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-6-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-6-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_170149_106069_E8060B97 
X-CRM114-Status: UNSURE (   6.68  )
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

On 9/11/26 16:35, Jim Quinlan wrote:
> Even though only BMIPs chips have this quirk, it is more uniform and
> readable to define this specific quirk where each outbound window is must
> be <= SZ_128M.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

