Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A403C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo2vufChLx1e55QzOzBwTMNU9Z8LIJfaoAcIHFWzr7Q=; b=yMcFsyF3J9ZHzzFKZlJ2pP3aE+
	x0QBC8zTUd29RdLF7S7MbP7nRgqJVBYTobPCb8F5ySKT8SJlSOZ2CyFSDRK3JoILCt188k2FIzSFr
	rB6Ry//I6GozBGZlRJP3VTwY5yPVnaLG01sSGU9IwThXINdoOygshn/21beR9pTNGcES3ymwTYI2I
	YQpvT6EF/hfD5yYgQ2JDWSHZd5x6RXxKaDTSgtm0Ytw3CcuirEAZUeHfTZ3EzDeus6r9qKkrVcc6p
	S40Isc3o9X2qdb4g0YPoTqlXwCfS4+CkFHF2gadMmxpETnWiEcUPMgZ9LzEq8jeu1BTHuVveia9ei
	Sym2QRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCGJ-000000070UR-0T1T;
	Tue, 24 Jun 2025 22:37:07 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAvh-00000006qcb-0SuD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 21:11:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-747ef5996edso4173326b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750799504; x=1751404304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo2vufChLx1e55QzOzBwTMNU9Z8LIJfaoAcIHFWzr7Q=;
        b=SYrgxpusZRapF6lK0nKhAojbdgXYJg02+3CcwvVXOb7W8UCmrLwORsuLJjSeakgh2X
         4b+riRHQFpzY1aegk7p1KbbvDyAbyfUtB7AhR1k4gi+RH0t+YVasbxEKVUCyvfyhxnX1
         ecqEeCEaVruN07hIxoB1qauqvAYcAUGk9J8CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799504; x=1751404304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eo2vufChLx1e55QzOzBwTMNU9Z8LIJfaoAcIHFWzr7Q=;
        b=b4Zo2Ywg9jm8oHJs1jAT+q4imIafn6yDbbfAvGJa08VnMa9Gd4B9pbckB6lWca5wzo
         gulLVvSNpaEcVN4qUXCGdJPG/a3PYN+nUdKRDe/pIpGvcNu+ONalAD6bw1p278hW4gRk
         pxRFZ5xETKaozlo5E2JirI74d2WtXG1c0JHFVFWuGCZCwgpH37RYmnZY18hM9G/jmYcG
         QBPnM6rzDkyKEAxJg/8Y7NAt+pRdq9WkzivpFhlWJ5Z2OMT1y+rHG4JuZ/OgIdddi8GL
         QCNYdoYFfCpac4APJexyi+fKZvUgWcClcuDtwm2Rt+eE6P7HJpOFR+fAqSLkGNcQgLmE
         LhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkrlo01Shzu2i/oHfg4Ywm2sci3xaw95ipxH3d2Db/YOUPwRHq3gF73aGJolRIbmzIR/RpbgFF1M0m90lHwF2B@lists.infradead.org
X-Gm-Message-State: AOJu0YzA8tSKFr3bs5QzA7ovbIGr8nLgWaojd/V07HpTku2nf3cykfhE
	g1JyA0Z3kEiUOLmfJbFgq37KpdLF2VjCB9NfmCbqsRXjFTa5jLbtEqGdl1DajtDi5w==
X-Gm-Gg: ASbGncvTU8Vfqd9x9s6VTwvvzVHC71+F68DkFNrDNaTOPbrKIzwz6GdMfDRN3jcZTv4
	UgO9MkfakhZiys9GQK3mqVosxNQqySAT3XB2De7Q+PvP7Xu+gTZEwYBPjMnpfY9iq9k67YVGZ8b
	vFywGshl9xupgY0ackQHInlmBp0xhiE7UTZYbDXVNHzNqEktt8jvImZG9CSEWD+aRSPKwKabt5L
	l8PL74cSExfSCc0RiMxCtqmbs4BYFNlHQqClEuYCV1+vcJA5UyjR1sGqfbExuDrrquxb32OlI12
	3dwAYetPVS3XRfIJHmT0RrVpVupBQJgDB6JjwwzaBfwFLPsM/TPDn/dyaEIqBBiqAF899SbEXFr
	L8H88rU8TyJmJvH9ESOAaRUPhzA==
X-Google-Smtp-Source: AGHT+IFf3/YeR9gk7+WP5WcaJ4mRmmHJiKPywBy37oskEyKjfGaPDSuW17BELTvjbXXXqhnRst+TYA==
X-Received: by 2002:a05:6a21:8cc6:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-2207f19255cmr765020637.6.1750799503649;
        Tue, 24 Jun 2025 14:11:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258b55sm9471699a12.61.2025.06.24.14.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 14:11:42 -0700 (PDT)
Message-ID: <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
Date: Tue, 24 Jun 2025 14:11:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
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
In-Reply-To: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_141145_205074_B9B4D8EF 
X-CRM114-Status: GOOD (  13.33  )
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

On 6/24/25 08:36, Andrea della Porta wrote:
> The current implementation for the pin controller peripheral
> on the RP1 chipset supports gpio functionality and just the
> basic configuration of pin hw capabilities.
> 
> Add support for selecting the pin alternate function (pinmux)
> and full configuration of the pin (pinconf).
> 
> Related pins are also gathered into groups.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Linus, can I get an ack or reviewed by tag from you and take that in the 
next few days to go with the Broadcom ARM SoC pull requests? Thanks!
-- 
Florian

