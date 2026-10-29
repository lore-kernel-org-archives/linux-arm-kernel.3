Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F1606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5F+3nVsE;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P5iRlbIj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=; b=5F+3nVsE2upaxZ
	izUMmJKRev2ZZyoApoGZY1QNnZL4ognqT9qqbFWuuSj8KZe8CFEISsn7l9GE7rdwSShjTwvFDbB8F
	hG7t/4Fvhs4bvLaHjz8xJvw8oWdXUhjpLtVcdsBVDloo9Is1d/LjqapOZs7pZzBc7L2wUVX0e90im
	sDDN1jOq86c0xCNNclyYqy7EusxaXqNLu9gDjzAEZU+uYFCmVrOZ7SUvw1CNp1q12oL0SFTqGovJm
	PeXFtPnU571ABcs13EjIUNyke2oqvSAa6WrwyFg7m+xQJj6NIF3Ls50oqrLLClZM4YRWQITlstn59
	Kd4da/3ksXRsTlt0VLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYQ3-0000000AT31-3IbK;
	Thu, 29 Oct 2026 22:16:23 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYQ0-0000000AT25-0sJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:16:22 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so45358a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 15:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312179; x=1793916979;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
        b=nvyneGMS5faxjdKTtCmENH/lG1onM8++D70qSyE2cPHoLJjoduo+NYWzRFe/s9tRPE
         V8KyTOc/Ut+YJhlKkCTo3QfQS6K7zVVKi9+mxNSAqcillJguYCcZsM8JvupbeladTfET
         CGqMUfuI3E9MKpBCW5cECRH4vPS0YfAhOEgP1jRdWoIOpID7il6QmTPYeyWS0uNap26X
         nOWep5tSohyd4a4MjZeFFhS+sjGONJge7lddR2tSSlf+8Eq9Mm2+m0UpRcHIQReLj+eV
         7K3YoBuxAROHUY8cr7fdPqp+Tsm+gWizrrnULs9g8C5r4MdQ4SYeM0pHX+ddakgJllpG
         xlsw==
X-Forwarded-Encrypted: i=1; AKwUvByEbybaeRDBkCnU0AzL0DvUQEidJc0qhySqKLGWdK3GFnhJc8BsInv0inwR4h356xN9npIaq2aulUJ669SKOwLL@lists.infradead.org
X-Gm-Message-State: AFq9FYIFep6AX29su+gYPEXBURgHugnFF5pbaSS78GZL/hECfZgcGs4y
	FmuB/5Hdqh877tYXJYaznoXcqciAZvirXJ10cbbHUyuX5+IiJewWUQom1Q0d8YlUbjhNAmGse7b
	T1JCd6wdxynP+9///xXiKnlW0wsesarOTG/WRIQWi5G0Tj8fp0z7W+rJJuCtOdwBGkaOypP77T3
	Efd3cldthguGAzH7yr/6warkDPBBYGjRGxViloyIoU2n2m4EDifN7Nt7O4+LpUcLDdJhKn/rjIN
	IbQQ8D4CgTgJszm3MCmksNPv0EvYXhzafBRWA==
X-Gm-Gg: AYBFou14EvcD3bfHM5HWDjtEL5qOY6n8nyie15lEmNQ4SGnuV9mGGYQ8T7IlPu/UPi/
	Ve0RnPuNdqaJ1/aQ9Ww83IMdE4AUfhM632ckGToI490hnM+mew/eonxlcwTDfyp30A0SJe6DUTw
	noyS1Ke7tTEbCDU7FD6dad1oBS+QuDVoGx2l6vXExdDYBPnLvNK3pDoRoqX3wxRaSQ0m+1P4HYz
	rYRYGk9w6vZNIpmeyuxWziOvT5aM37HjOjUNBBLbXs4yMxI0MYym2XKBTc6ov4vd1WANMft7STa
	9R/B4cFTBwR1pjPekR6aD6gyNIekiKQyfaS8ydVidcu31sCXLIYLP0qkIBAkk7PaUTp7/ChgimJ
	SSiZUlN1sQuJkFnI7aBhT/fR2YmFoXx2Poiofl8mxI7n+JrxCPT30Z4kgK97iaVFh9eCSMYvHjf
	P6wo0snUXG7u6+0tlsnezASLFSHDwazyNXYkTrpCjN
X-Received: by 2002:a17:90b:5830:b0:3a8:7242:e8d3 with SMTP id 98e67ed59e1d1-3ae8957c50emr288345a91.7.1793312178527;
        Thu, 29 Oct 2026 15:16:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85cc3344sm217703a91.0.2026.10.29.15.16.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:16:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9197553d398so2760166d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793312177; x=1793916977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
        b=P5iRlbIjXKcBZnb6bNuscF/T4id1Ghf7PVLCykcX6TSSdf8loPxZDHfWEI1HANd/cK
         fxsTbVfVnhy2wF3CH0Y8twlZmMRKHp6DNsbThau/HB6U1u3DW2fFr7jlh10buxl5N3hW
         eoIngJzPGS4VqrC6yQVU10HN1dD2dM/ZuLdxo=
X-Forwarded-Encrypted: i=1; AKwUvBwp3I6rBEx+zOOX2lATjuTVVX/yg4xSL+tc1O35fO8vbNMM8XXYrHLP7hcCPovf4yyKVmQWHYqJf7k5AoBojhT6@lists.infradead.org
X-Received: by 2002:a05:6214:320f:b0:91b:80ac:66ea with SMTP id 6a1803df08f44-91ca4b09275mr5811956d6.24.1793312177161;
        Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
X-Received: by 2002:a05:6214:320f:b0:91b:80ac:66ea with SMTP id 6a1803df08f44-91ca4b09275mr5811296d6.24.1793312176571;
        Thu, 29 Oct 2026 15:16:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca689d34csm198336d6.32.2026.10.29.15.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:16:15 -0700 (PDT)
Message-ID: <04b60565-5aa3-4859-abc2-0291203371d7@broadcom.com>
Date: Thu, 29 Oct 2026 15:16:13 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] BCMBCA PMB reset controller
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
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
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_151620_485260_10E58F79 
X-CRM114-Status: GOOD (  20.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/14/26 02:48, Linus Walleij wrote:
> This is another of these big upfront design binding and driver
> hoards that is the consequence of adding new SoC support. My stake
> is to be able to boot and test a full featured Cortex-A5 system and
> the BCM6846 XG6846B is one such system on my desk.
> 
> It's been cooking for a while in various prototype forms.
> 
> IMPLEMENTATION:
> 
> Add a shared Processor Monitor Bus (PMB) driver and a child reset
> provider for Broadcom BCMBCA blocks. Support BCM6846 XRDP and its Runner
> cores, PCIe0/1 and PVTMON. The PMB bus driver uses the third generation
> Platform Management Controller (PMC3) keyhole interface. It owns the
> register bank and serializes complete sequences for child services.
> 
> The fixed SoC transport is built-in and has no sysfs bind/unbind
> controls, allowing delayed recovery to retain hardware ownership
> until a busy transaction completes. The reset child can be modular.
> 
> The series contains three bindings, the PMB bus driver, and the PMB reset
> driver. Describe PMC 3.1 as a simple-mfd with two system-controller
> children and a bus child, each owning its register window.
> 
> The bus child exposes the PMB transport and contains the reset provider.
> The parent uses Broadcom's "brcm,bca-pmc-3-1" compatible. The PMB and
> reset drivers support only the BCM6846-specific compatibles for now.
> Other BCMBCA SoCs have different reset groups or PMB interfaces.
> 
> Use one reset specifier cell and define BCM6846_RESET_XRDP as ID 0 for
> XRDP and its three Runner cores. The vendor sources describe individual
> PMB device addresses and reset masks, but no ID for this combined group.
> SoC tables map IDs to blocks, register values, timing and sequence
> callbacks. PCIe pulses preserve lane-selection straps. PVTMON uses its
> analog-acquisition reset. Consumers must quiesce every affected user;
> these resets do not replace clock, power-domain, PHY or UBUS setup.
> Power-cycle operations for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL are
> left to power-domain and platform power-management support.
> 
> This series is based on v7.3-rc1 and is a prerequisite for the
> forthcoming Genexis XG6846B Ethernet support series, which works.

Excellent, looking forward to seeing that!

> 
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series.

Very nice!

> 
> MISSING:
> 
> I did not add MAINTAINERS entries because I don't know how the Broadcom
> maintainers feel about it. Tell me.

I have no objection with being listed, I am more familiar with the PMC 
present on the 63138/63148 than this one but having access to 
documentation and people helps.
-- 
Florian

