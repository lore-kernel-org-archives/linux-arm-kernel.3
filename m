Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A373C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teJf0/XACgISKIz8PSaK7HxonkgpEyyYx2fgIQwMoFM=; b=IU2ZOZ9R/rX8Qe5x4+vzGFYIv1
	IPiugXcFjNZg+4rlggs8JGX/ESX9bj6Td4lH1TCbefdsdGsPSXN3a+aQrEX3pwy++s8Kt+rBbjO7Q
	c9ftLIfvfjw/FX25cAYcZ0rIhwuWdwK0tgOzqg13vbQO1TZfxxZrU8BnpJFVyg6KvOY1/qCw8Q35L
	hIbCgQ/WofE+7w+fWi0qB9i+EyVDuiRQSs6pnQjLStxPrX38RlydEt8tRRH3X+MUUQMnb2hbGcRJZ
	/v/voK72yZvuRA+WrFh/UsVse6Pp40BksA4TDNA7zK1DNFvXK0L4I3su+tdpDOgQTPig+F8tthHfR
	goqPu0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoek-00000002WsC-38iu;
	Thu, 09 Jul 2026 13:19:10 +0000
Received: from mail-vk1-xa62.google.com ([2607:f8b0:4864:20::a62])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoef-00000002Wqh-3PIW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:19:08 +0000
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-59d07df448bso1518495e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603144; x=1784207944;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=teJf0/XACgISKIz8PSaK7HxonkgpEyyYx2fgIQwMoFM=;
        b=S2Sv6JOP2JZJwIByt+gaSZrT6SEYiPzUxWVD2L2woa69nu1Lt/MPzjVDYV39RQfiUv
         zaPRUFBMUvUGn4wx/gqbu1Ktbxl9Z+KaH7kTsMKg6AMD+sN+gmZHQSp6FfsFLi4OTQjo
         h/XPPkWLd3oUKcpjaxdaqRJXBcOWDpV3hZUdeIQXDRZAjAA514ywQyeqeqdakIOgjJVw
         YQ30+rU/Bm8JJvKYh0bB7gBG74YA/bI0S7SPTm/sXGPLSqPfMwfrMuFxoYD+NRzZ0jRY
         qJLFR7wjnpy+SgXhJYGoIMiixZ852fkql/almVPY+7uK9XdgjxKJgda4FM2BHEqNW5Gc
         LNxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3ik0npSZD0aFOO1sW3CBeNZSaZvTSMCiknjwwdVnX9x/Q0izMLfwJ/3DxGAkU+1vQNuHnT0szENhhGguQ5wts@lists.infradead.org
X-Gm-Message-State: AOJu0YzZx73mDpHel6xQxg81H2AKj0MqNjfQnwLMHINFQgoLcNpZ9cm8
	ekkPsGKuR/9p0FVQcPhqO827Dy0eZRe7ZKNxko/8Hd5xdgFmopyPwc6KsaABb910y32rODyjtn5
	p6dILuEEJp1fpIKlLFkLaZ84GGafYSiw1hSrDCvJAUC2F/CfK2oH7nrhMKdVh9ixMpvjalpL5ik
	boAFs/ogX2XJoQkMvDF9Fw6vzGOwIINaNvK/S7r1kZoVUdvAauJETVUw19okuP5RVJ+AIWNDOPK
	N8iJ7G28U6lPIhnA/XZnT8p8ct6Cj+GAsHMhw==
X-Gm-Gg: AfdE7ck1J7p2ZfE9qmttlHmMUCSbLjidWJXZ0ayH5+k+NKTNp/Qfp09Qh84sS2Qj34M
	PeIG9FzIbsuoPdWHs0bQlbzLVRM1HOaRgfTt+us+73wsB3rOZ/hSm803Sa0er5Q4Wk3xnRj0b0i
	qh5TjRBxLot5jkuZ1ljnrLH1pI8l/EgkvQnjqWqdtDOERpwrTLgIOCFh79k7plfySFp6VPbc0HD
	0AoJ33m1q9QqYJ+tLIO/Jyys5hks/pCI1JtpKq++JnOrt9mRhUHGjeQLEuc5RpXsvOL0ZLfW5gY
	3lGkXrizpSr4QoVlspzVzVnYXz8gIe1mDqxuew+d0hyq46Xd3Hj1KYtDGJBsFGTUiBuHtR8vCA/
	PMZPDsCd7Wkg69Usgf23mqMzr7V8Kom57xurF/a+wZlZEy53Lsqq55hLwByKmaGws5l+PrqQzGB
	NvJMWTxiFcu9bYxLCz9lvHz4LLFAWWG3Er1UivqCw8NpGI1FQlkVQ=
X-Received: by 2002:a05:6122:4897:b0:5bb:baba:61d6 with SMTP id 71dfb90a1353d-5bf75d7a858mr5060292e0c.6.1783603143627;
        Thu, 09 Jul 2026 06:19:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5bf6f7cc3a8sm581323e0c.5.2026.07.09.06.19.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:19:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4744b72f90bso583693f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783603142; x=1784207942; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teJf0/XACgISKIz8PSaK7HxonkgpEyyYx2fgIQwMoFM=;
        b=c+AkkVvCRpUi1zz3R86EIyo2bRqRKx8ACSLQrBCxdiG50/0rtXI2v015DVvdCE90Fl
         2rL5CNFGWIqRFYl5xE2ATH1NBPKp1R7ty/Mo2xyXjYnxYuVLl5d3zlXO0C2FqsIawHd2
         COck0N9Xkhi+2aEF4eO0b7lAf75hXrMmwV1v0=
X-Forwarded-Encrypted: i=1; AHgh+RrdXoXgh8t0YhK4YUZRWO7/vk2zN6G7XvP3kYa5rehcLmz8tz1SqQNYUSLBIeuAXoW+XCnOIBfxF19o48pHTSyW@lists.infradead.org
X-Received: by 2002:a05:6000:2907:b0:475:f0c2:5b07 with SMTP id ffacd0b85a97d-47df07a47c4mr8080475f8f.61.1783603141882;
        Thu, 09 Jul 2026 06:19:01 -0700 (PDT)
X-Received: by 2002:a05:6000:2907:b0:475:f0c2:5b07 with SMTP id ffacd0b85a97d-47df07a47c4mr8080420f8f.61.1783603141327;
        Thu, 09 Jul 2026 06:19:01 -0700 (PDT)
Received: from [192.168.0.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm52289408f8f.32.2026.07.09.06.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:19:00 -0700 (PDT)
Message-ID: <f25e0d6e-941e-416f-8c80-2c48e1b90498@broadcom.com>
Date: Thu, 9 Jul 2026 15:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Daniel Drake <dan@reactivated.net>, Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
 <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
 <fc88dfa5-30e2-4e94-907c-58de0cd8447d@reactivated.net>
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
In-Reply-To: <fc88dfa5-30e2-4e94-907c-58de0cd8447d@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_061905_857184_AF4282F1 
X-CRM114-Status: UNSURE (   9.17  )
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



On 7/6/2026 11:49 PM, Daniel Drake wrote:
> Hi Florian,
> 
> On 21/06/2026 21:03, Florian Fainelli wrote:
>> We have an internal bug tracker item pertaining exactly to the virtual 
>> timer interrupt connection however it affected a sister chip (77122) 
>> and not 2712 AFAICT, now checking with the design team whether the 
>> same happened on 2712.
> Did you receive any update on this for 2712?

Not yet, no.
-- 
Florian


