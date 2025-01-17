Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC9C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbR8kLFTS4yK7aY/EmxJd5Q7gBcao7ndUZr1nGBUT5c=; b=cUaz/KIfEkS0lcKNv+YP4qYNeb
	W+sPBmF0ypVg7x9MBN/9GZ5hQcpTWXoqb1ejV4N2rW0iMA9YWFAohOVqkv/Zmu673EVMrKy41em1h
	B0Fnx/6E7SOxeW+pF20pmpzKwvoyYiuOBxCiJstm+foDZaxo4CWSDr5+42hzvcZwxnVcT919D0Fc0
	dNivtijc2NtewK/slDi/yKvIkBF8vcANrdpu8qnw3HrudeqcqrEe+pE/Vlw/8uqGR0pbZSfPEvFw4
	1chhpXWqbtUwRwvyy5D4beBp6Sdbh0xpbyLj5hcRjuDDivhW8hraWuaEPpmuqbn51R/k2G+Vb8ffq
	Lc466B3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpg2-00000000sYq-1cnn;
	Fri, 17 Jan 2025 16:58:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpXk-00000000qhT-3MW5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:50:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21a7ed0155cso38131295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737132600; x=1737737400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CbR8kLFTS4yK7aY/EmxJd5Q7gBcao7ndUZr1nGBUT5c=;
        b=Ji5IKitWD9GNamEj3irXh0uxVewRCooQQZiTEEC8ReAY3a0DQwiYWXaN5nmxAar60m
         I7LEa5JyG1AFrkYwjBvny9pIYlwFYHBdspuDRsubmHH6w/jWD3hHicGMKLu97toPdAXc
         Aw6tcbQVYMhv/g8rzesTG/s6NSKpzxQEREPL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132600; x=1737737400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbR8kLFTS4yK7aY/EmxJd5Q7gBcao7ndUZr1nGBUT5c=;
        b=B/thFndZU9nAUX6oD34ZhljaxCYSpbVVeuKmrwR4ltEdXNoeKiu1AjAIVSxQO+3rL0
         CAcDXqX+kdzSTMJDD54t4sqOWRuz0ITMI3ZfWGPTLXxkQzoJAzRjv0XFVs9ET743LX4H
         vn6uvKGepAyBTe5a0E48wWzSUazsqEPSjTBcRprY7gqI8BSv8d6piE+Yr1LwbIK+xt2Z
         fzNfk3JdPq/RB+rBJtQvzrdqpZuXaaOHIteZvmK30QvAJFCRDnrtDDWr7y1J3p97d8Qy
         UbI9v4rsF/GTkfEeB23a2E3vHeikKWbTIHm6NMMwzsLN+wSP2I0WciJgKoXxJjr7Jqk1
         xbFA==
X-Forwarded-Encrypted: i=1; AJvYcCVI7arPKt7R04XpTyGpqM8QWwh8X5/qFhTlOL6iJlSPsR3HasZmJskDZM3DjeS65mad7olTx+R26wFSQpSkU588@lists.infradead.org
X-Gm-Message-State: AOJu0YyJPLkyUfhOtWA0qArf9KMZ4erlRpTcVUuJXIsGRE8D0RkfYNOQ
	G18bCpv3LGzDicvLtl3tf4vE2K9fwZa9sYMO9iyNVefcvj6wf6r+e5gwHL/dwg==
X-Gm-Gg: ASbGnctlGZbe2Xh/XV6NRoWCLDIYDkx7QyKpPpI+6r+XQMiLIUZtnkhnee2XL041Pzk
	WJcl2RkQfifYcWRN/AbZRaYqmWAJb1MdO0YoEHTg3GFD6GTxk4shJiW2KqDW9G6SAdmhY93XTWj
	bJ3enYJQs65kt5xAeG1tE2nc0iJ0tsBkOM0N3gFtfB2YI5uA7OAmoigRr+rtWXzEk0DTc3MlS1G
	AJDsjHF7wNfz9tzG4kKwBKW8DwVKHl8o6oGlzxInbkfnYE8fdVczMX9Oiep1YGE6dHG9ziSYuXM
	D0Tv133fFjnmJOePVvmpxjoZ1IfzQHs=
X-Google-Smtp-Source: AGHT+IFaKYsJ5THFTqoF+Nj6i6KUhfHBV6KaSHY9X55z10j/BSWwcRP/2s3vh+3Yy/A7L88yCp2qCg==
X-Received: by 2002:a17:902:d48a:b0:212:67a5:ab2d with SMTP id d9443c01a7336-21c35604a08mr63652045ad.44.1737132599690;
        Fri, 17 Jan 2025 08:49:59 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3aca04sm18337615ad.135.2025.01.17.08.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:49:58 -0800 (PST)
Message-ID: <a70e8c45-97a8-4fb6-9b27-4f9ed020211c@broadcom.com>
Date: Fri, 17 Jan 2025 08:49:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] dt-bindings: clock: Add RaspberryPi RP1 clock
 bindings
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <ae94e78443099cb6c48528ac8b18daaaae41419a.1736776658.git.andrea.porta@suse.com>
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
In-Reply-To: <ae94e78443099cb6c48528ac8b18daaaae41419a.1736776658.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085000_846861_7C27F535 
X-CRM114-Status: GOOD (  14.99  )
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



On 1/13/2025 6:58 AM, Andrea della Porta wrote:
> Add device tree bindings for the clock generator found in RP1 multi
> function device, and relative entries in MAINTAINERS file.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
>   MAINTAINERS                                   |  6 ++
>   .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
>   3 files changed, 125 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
>   create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> new file mode 100644
> index 000000000000..b2670cf7403a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi RP1 clock generator
> +
> +maintainers:
> +  - Andrea della Porta <andrea.porta@suse.com>
> +
> +description: |
> +  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
> +  VIDEO), and each PLL output can be programmed though dividers to generate
> +  the clocks to drive the sub-peripherals embedded inside the chipset.

typo: though -> through

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


