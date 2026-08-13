Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD4DC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 00:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wx5qD1bTE3okJgcwPgCBz83Zocyi88FPJfPF28sTzWk=; b=czsLnXs+PrIeN1iLMtAnkdrmC/
	ke5xkkmHKxePouLsgDWi25w3D4fvecZu0rna4Kq0NlZ57ewszKmbjtGNUi4b+aLDGU6pPJ4GmNWSU
	ZjQWxRswYt/UGcoE/cE826vO4GUriIeYkc/sJhOma2v7XJ8IAXJ48yE+zjjy8gnFhyhc1duAsGNB7
	DdALoq0K+yMH7FOW2DaKqNzIV4oddPaDZDvBArkW2skoJ261Jkt3egEbBk7JO6ZqC/JTYFxrJrZbA
	OVPVP+h4MKLLfldlFBpoDbaKnv8lqEY6qF0hGT44E5Z+DbaxqP0wB5wNKSdKyEPQ+ImqtB2eN9qAY
	gDvYNfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIxb-0000000HBbZ-2MXQ;
	Thu, 13 Aug 2026 00:06:15 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIxX-0000000HBaZ-42lk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 00:06:13 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1371416a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 17:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786579571; x=1787184371;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wx5qD1bTE3okJgcwPgCBz83Zocyi88FPJfPF28sTzWk=;
        b=J5bLE0ICW0/DmJTMnaTD7++gAoOYHcM9HWqQHGQOI2Fmi91NMoZl/QR9pkbxVL/H3S
         r8NNA9GNWdeCYDIYHvlDWBaKJTWL0D/2DT9ORbRIFRwuINOoJppuA8GqENPN7gSkq094
         OSW3yBSf45Icd9n27Bb0rMFljRdIXyWgXHFDgtfXOEDbLkDhYXB+RsbTxNsUTFsQhnxK
         SKpY1s3qSSh7qpPHkqZc4OuJqJLJledbk2xk+KXIy6FnNZF9qqE+22ZgIWqSJRaC5qkf
         4b1HXrbNL7UOeNd+Zbnk+pMvPHoWDzMAXINXqKLOgcdFTK3ICvCDNpJk9XNHgIW2VdKs
         fgCQ==
X-Gm-Message-State: AOJu0YwIIE7u6gqhbMwEj/V8vYZkHb6ZsdUVwSTcYcggUIHhO8YV2/z5
	HFEhjBYnYCPMXFbOh1Nl0Gs0mrxRZZRLbiwbm94mebwXMsGsHbMxJpzvPOqZv80FboXK6BydLWo
	uZw73mshiqBW4OzEF/PcqiuJYMbG2eUVTtnR7teRsOPHr59wlDmJQk6+gEQfulUpzCt3EjuLLcL
	EEHp/bdLecq2LXn295K9EzjobRY23KuTpOyqlhxTb3vyjMkv+S6aQKhP9zJOvLyFh7KRQ3Q8xNW
	fiVKKQRBwWu2KSh9SMk2c5k+HXhZdnUI3s=
X-Gm-Gg: AR+sD13bE7CxcK4E8RDyYKnctFiX0n8mD88zIEDCQWR31kyPxSfo2GiqBKJWmqFVmdF
	g1TWEfIs7nL14et5j8uXFO4KowVE0smxBswA4atJUlnQPb4WsU7MO8VqzSz8lMj10KsjuivFiqE
	luOiba7E2S3ietFOHslNt/uiE4v3JHYootNhE/+R1Qu3MrKJrfmilKNjUU2AlOZoVlhKLxMwt8z
	4GyFBO7+g07WpaHdEhyLNgwqrNXGEc7+D96G7nPRmYfGUHtf98NJR/1SRb6a9y34+gl7We6NARL
	uq3IWQ4UAEi0tGIM/3L7ScK0kUOqbixUDHSKGUZXgrj5Z4we0lUkVe09CaZ+vAW24qhqJEiMg30
	HcUIDcThqHGSLrj3PLs2Mq9tAAOBzQKzpFOf49Zg0B84cWxTh67PaZelDlh1XbFtAhT1mj37rOa
	JjfLYYO00lcnptYz/nzTUO8sXB7i1McdqyY2aSCA==
X-Received: by 2002:a05:6a21:a247:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3cc54bc9a71mr2927043637.0.1786579570522;
        Wed, 12 Aug 2026 17:06:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cbef6526517sm187374a12.4.2026.08.12.17.06.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2026 17:06:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so146606485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 17:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786579569; x=1787184369; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wx5qD1bTE3okJgcwPgCBz83Zocyi88FPJfPF28sTzWk=;
        b=brdy2kzzSgwHy+4XtD3hXmPV+bk1NuPzKHSKXI4btMc26DLa6Dima85siiGB8ztwC8
         hkDc/YILf2otE8tHFnTG5dC3oSYFD7Zq3ZzYuBueLiau1yY9LZFRN0kRcReQTBy0toKo
         9vwKGV4y+preR5kDzvsy6HOfUIxn61nmxS6yI=
X-Received: by 2002:a05:6214:53ca:b0:8f0:5b55:1f64 with SMTP id 6a1803df08f44-90a80b8a548mr18381376d6.20.1786579568996;
        Wed, 12 Aug 2026 17:06:08 -0700 (PDT)
X-Received: by 2002:a05:6214:53ca:b0:8f0:5b55:1f64 with SMTP id 6a1803df08f44-90a80b8a548mr18380416d6.20.1786579568260;
        Wed, 12 Aug 2026 17:06:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a817bbb3fsm2968896d6.15.2026.08.12.17.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 17:06:06 -0700 (PDT)
Message-ID: <e67a21d5-4841-469a-a75e-0987be9b915c@broadcom.com>
Date: Wed, 12 Aug 2026 17:06:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] perf: Add Raspberry Pi BCM2835 AXI PMU driver
To: Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
References: <20260812230145.2644281-1-irogers@google.com>
 <20260812230800.2646749-1-irogers@google.com>
 <20260812230800.2646749-2-irogers@google.com>
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
In-Reply-To: <20260812230800.2646749-2-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_170612_046563_F8C38455 
X-CRM114-Status: GOOD (  14.35  )
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

On 8/12/26 16:07, Ian Rogers wrote:
> This commit adds an uncore performance monitoring unit (PMU) driver
> for Broadcom BCM2835-BCM2711 AXI system monitors and VideoCore VPU firmware
> mailbox monitors found on Raspberry Pi 1 through 4.

Missing generative AI tags here?

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/perf/Kconfig       |   10 +
>   drivers/perf/Makefile      |    1 +
>   drivers/perf/rpi_axi_pmu.c | 1793 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 1804 insertions(+)
>   create mode 100644 drivers/perf/rpi_axi_pmu.c

This is more applicable to the second part of the patch, but the 
dependency on the Raspberry Pi firmware interface bothers me a bit. We 
have the AXI PMU blocks available on the 7712/77122 chips which are 
sister chips to the 2712, we don't run the Raspberry Pi firmware on 
those systems however.

Once your patches land, I will see if I can get generative AI to help me 
add support for the two AXI PMUs that exist on those chips.

Thanks for doing this!
-- 
Florian


