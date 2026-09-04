Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2469BC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+ezEGSoxt4OIMmPGd47wsxyvlI7VYsc+xC/7giRRKU=; b=BVCc6elOKnG5eKhonZevSl/edn
	6s42a3r53dPJHTsz/bOmAti9DQt3JmD65cAanPGsYgi2AaV6IEx5L/uLnFL4DRjYwwMLg5vZtKtUB
	ZWpxsQEU59azwCcCdAokII/srm0HFmX1X62p8QXpnI3670LYhODAk3ClV82nCcx9A5RyGMNxpUWRc
	eqZIwmIBL+i6Qcnt7ZaalcvQ+4lRY1PhuygSwIs8EtgFqnLCWEXC0zeowPmV+o7klz5Ssma2IYFxy
	eo12UmbnhnD8uIXij4papQQMD/715EDKuY4Nc5oEW1ZuRu++oLWHWNsmZMIdEaKgqcC3Oq7fVtC11
	p+VfrLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cRX-00000003Ozu-1WXW;
	Fri, 04 Sep 2026 22:31:31 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cRV-00000003OzL-2W8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:31:30 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1634232a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788561089; x=1789165889;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X+ezEGSoxt4OIMmPGd47wsxyvlI7VYsc+xC/7giRRKU=;
        b=NynDF06ixrlkwzS8aVh7w7ku9WPhNakLob/t9/IkId3oQQNoKxcUFEPV1hO8qlqIxB
         dBOiQy1vxmN4Cl97q0MbvoOwYA07FS4LYdgK6xJBz8kgVGPGIQXYO6wjMA4u/Z+/xfXR
         aNitJPyqi8E06cYnaJCn9LTaAZ9mj/brY3u462tfg+pmpxr3PkFQcgi/HqMuoHpxcnS1
         gjuIgHJdu/JFb6ywUkEK3yR92lkT9nC6SODH+tLw1pH3n0bmo2VaVSD2iXnY1XWT8q3J
         6UNedMi9VtbFLK9hbKSqM2c6XXxurSeRA2T5tCcN7mOxRbB/H+vVD9snm1UrZk2vmQNY
         +UIw==
X-Forwarded-Encrypted: i=1; AKwUvBy35urjh//naNc7r1/pqYctG7Nrt58FsnNhV58vtUFsh6mb/cFc9IPcvS5CKz44LAk1+ahhC58AMLKdrXssTArv@lists.infradead.org
X-Gm-Message-State: AFuF++lVo/VwpLq/d9NSXKpH8+W/uowhJebdnwNa8qRaTP65vixfI6iv
	OrE1RxShXSrd9eX+ZhJQXdeP76fwubiQ8eHSWEzJMXxdMM1uaSBVY+XU8HE4RmuOBax+PfmXhGl
	mEsWxKlaeLHX2Qibgbvz3wEiEySryjTEPJIc0G575QOPyLMwtBpDFD2TW428c35iUuMM5KZzmT9
	NB/t0L5StfZhU899w7NeahyTW8SMbrv2SsE4yUgSjfyNZuNZU5ME59VRpfl4EBmfXpndpWELZCl
	9fBGNXuo526coULO1dURg7BTUsyjQLmjtI=
X-Gm-Gg: AYBFou3hBFj4oErnZgHXwyxsIsyoCtsq2x0FfMisXYqcIhRVzc53trniilIE7slq1He
	/rgsV+HbKqFLfIaSA7vja9TDfBtkhSBJvjR99CozkPTPlNjMPaGKK0nNWaMUmygrYxuHbYVpxsi
	Np/5gCBvh74Ua+e7HxIHDQGe9EaqNhyoHaDVZil1VYvOc/yf2oE1OZSgnQ9ZiflDlaNJVat22ZT
	FncgQJkjk/63XG8uL50q4ZOJHjn2H6qE+ZsnDNsn7s51uT8oHJCQ5khFQDHf8UUpd4srzkzgWci
	mnhibFt+gTyWcKQy6xglbvo2wlzhp9d7p8/U0dB6jk+b3lWI9Jv0xd6TvMB/inPjJfPeqKfEzMM
	NkxzizIoew2TsTFoZPEA452v63QVEDhK6l+SmHhcjcAT63xD7wMaecbmGq84YXvVVeMmWW0HBsC
	RlMZ48d4s8qMxaPBrRMcjfqjGb9WK8eh1E8HLGZQpP
X-Received: by 2002:a17:90b:224c:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-39b2624cf31mr11903605a91.22.1788561088444;
        Fri, 04 Sep 2026 15:31:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b28c68f8csm1833377a91.5.2026.09.04.15.31.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:31:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso246558585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788561086; x=1789165886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+ezEGSoxt4OIMmPGd47wsxyvlI7VYsc+xC/7giRRKU=;
        b=Eoiv8D53Y5eJU8kayTDD5JodzCM6qQrfpVmDzbJmlQYdLOM4qo+Ad6ru/s39SjAdd2
         XLboZ1rZHoci6IhSmVOldFhF4pyfhTdWWSgW+Z2lk+Q/OVCmFrnVNI3xYrBenq3BreEm
         m7TmsnwvyglbARupG/iSyPxUcz7z1dL8QqrTE=
X-Forwarded-Encrypted: i=1; AKwUvBy7MN9MwVs8MfI+unqWh8yTS/ibDnH/kdZPhDyKnB/ySgwFzaZ5MfcZyaOXprjDh59OSB3v4ryhSv2exmifojNR@lists.infradead.org
X-Received: by 2002:a05:620a:aa1b:b0:939:6dfa:48fd with SMTP id af79cd13be357-939804fa8d8mr821064785a.51.1788561086055;
        Fri, 04 Sep 2026 15:31:26 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:939:6dfa:48fd with SMTP id af79cd13be357-939804fa8d8mr821058085a.51.1788561085504;
        Fri, 04 Sep 2026 15:31:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee8a4sm320403985a.3.2026.09.04.15.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:31:24 -0700 (PDT)
Message-ID: <ba415e15-8cc4-4fbf-a624-e1776a23392f@broadcom.com>
Date: Fri, 4 Sep 2026 15:31:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
 <apqej5QyjOHu702A@apocalypse>
 <i6fbcajsiol77m6x3dbcay6bgpxwhy5axayb2633yklxl6rswl@luknor3eryoo>
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
In-Reply-To: <i6fbcajsiol77m6x3dbcay6bgpxwhy5axayb2633yklxl6rswl@luknor3eryoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_153129_669046_D396C337 
X-CRM114-Status: GOOD (  16.87  )
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

On 9/4/26 03:54, Gregor Herburger wrote:
> Hi Andrea,
> 
> On Fri, Sep 04, 2026 at 12:33:51PM +0200, Andrea della Porta wrote:
>> Hi Gregor,
>>
>> On 11:24 Fri 04 Sep     , Gregor Herburger wrote:
>>> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
>>> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
>>> the spi interface.
>>
>> Just a nit-pick: in the comment it's stated that the spi interface is enabled,
>> which is not true since rp1_usb inherit status="disabled" from its node
>> definition. This is fine because the user would probably want to enable the
>> spi interface through some overlay, so no need to resend the patch (at least
>> for me), so:
> Indeed. It could be rephrased to:
> 
> 	Add the rp1_spi0 node and its pinctrl nodes to the devicetree to make
> 	the spi interface available.
> 
> @Florian: Should I send another version or do you want to change it yourself?

I used that as the new version of your second paragraph, please let me 
know if I should be making further adjustments.

Thanks!
-- 
Florian

