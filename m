Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5FAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5njHyJvz30qiVz7OEO7ktfy/1HyqmXVebkk5L4HQaNE=; b=RINb0hFRyeIcnXKRSgEjksx+Kv
	29cUKlf1sR+2ZDWMsakERtGVxZoIa+UTS0xIvp3/et0lp57zrXVoSePu5P724kfj5qUC94783QjFS
	yhztIaUZCW0j8SfYTZfNGRzcuP7wp8G62GMxbJ78Q7tIQLYy3+DCjy2r9y5kf+wVTk0CPx7FdWCSq
	4o1Srk9Fjpi9zFY+aFrrSFlau2xZJY/SW/nF7H6F0ZphU9Q1qFot+7WMVYZelEDFjnv1DcShrlu/x
	l/Tt6lV+73PsVQjKmr0cXDXDmfAQONQrtTyDreUrPpA594IjUxVzsAfcXuU/W5kU6DFVpKkahC3cq
	9c6N5uuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HIx-0000000Gyrh-0Zsv;
	Fri, 25 Apr 2025 11:33:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fyg-0000000GfCn-08JB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:08:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22423adf751so22349665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745575693; x=1746180493; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5njHyJvz30qiVz7OEO7ktfy/1HyqmXVebkk5L4HQaNE=;
        b=AjH9R3RSSC8Bvtc9gFLnIwly1157qpi4f6dGqdZkTuBYho1uYhifdPxh19tXLyio7m
         6OS0U5QIvqwqhWqTZVEZwGeCodGhkGLSWMROv33HuBdIzCYymVW5xNboflnYshlEgiRl
         Z13Vm9MjEAhYxVdQGod4an0ijuUa/0x/3ztZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575693; x=1746180493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5njHyJvz30qiVz7OEO7ktfy/1HyqmXVebkk5L4HQaNE=;
        b=X2/aLI5VrCtnqL+C/zG0wvpr4A+zmuzmkIkUqDjK59egiNRILURpmn46SNjLULCLz0
         K26Ibvuhr0hXNvSwnYjhaSoO9SVWAN8VW/EBBTgf07hePh+5GZr3WbK15VpYjJVh1w20
         cc/3aJPMIdsbCN0VLrw+d8C6NiDXR1a2n6vqL0+ydddf6t+okrZKqmVxhZMZdKvf+SuM
         AkrD53nfvWpP7CU5yhIlQmQBpIPToodSDI2hNkJiAS9Qy/zgt5xmkSM7sxBz2d7Eirzx
         HuInO9bm8TZIz0zCDxfOQ/CG+PErLXxeAlhS+sOImt3lL8956KvYd6j4R1NW6Sl/TgRk
         twkA==
X-Forwarded-Encrypted: i=1; AJvYcCXJe6kvabZqcTZxUQAzVBmlHyW/sdw5uaIFcy9QKTHBKExPN1dwL1doU8mXr1D9b4LGRkVNzS6KVIqWz/g9pxIS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhd/VU1SPT7TmhCSMEZ7MT/B4cPsBjj9r5z3ykq+vij3wPqLi/
	vMM9S5Y/hG4JQyccOA7SlzvtdLLbgN4GitxbaGhXFX7CSDtvm3r6Ruo5dtHVPw==
X-Gm-Gg: ASbGncvVxSet3LdR7AM+fYJzUKf1xzGdbvoexTMLDsa4exkYZSMtFmOfOLeh/YQUx8G
	HDdKgC5VUvg4pn/KLtrz9PUpk0wWyj0ew0S23PCL0Lo6wdfQ+6RPNdgspEn8odXHZiaF2LccKHo
	4QLvOvyoQWw3SfPiOcZKwaBAuDTITspIGf4A8+d/6s1w3ol0TNipZEmL9Dj+SWAJFGuyN+kq9pv
	r6M097Ef2x0WkCs0tpM7eAk88B2IvuqJWBbjuhYPK2qZ8qK/VzafB/fztHgCqPVSYtY4kK++jbT
	D0hxdd1n51ilpDlUQFcFZ5yakzFC9itAdvUt7Ws21qKx73M6VzK7UPMM3ynFV6NxheXgZRKelP5
	g/0l8gImxZQg2xXnmm9Rm1+34gWnnKxGiBg==
X-Google-Smtp-Source: AGHT+IEiRvydw+zpgaMow96w2Xm30w4pgcn8Jd4sCNL+n0Zk30vooImhsYXcKB8Md13tN2KuPsGqvg==
X-Received: by 2002:a17:903:1947:b0:223:26da:4b8e with SMTP id d9443c01a7336-22dbf5d9eeemr28512845ad.4.1745575693162;
        Fri, 25 Apr 2025 03:08:13 -0700 (PDT)
Received: from [192.168.1.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faee2d59sm2546400a12.70.2025.04.25.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:08:12 -0700 (PDT)
Message-ID: <49011014-8ad7-4392-b2be-736ecd25cf22@broadcom.com>
Date: Fri, 25 Apr 2025 12:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 10/12] arm64: dts: broadcom: Add overlay for RP1
 device
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
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
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
In-Reply-To: <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_030814_075577_79AA3539 
X-CRM114-Status: UNSURE (   8.59  )
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



On 4/22/2025 8:53 PM, Andrea della Porta wrote:
> Define the RP1 node in an overlay. The inclusion tree is
> as follow (the arrow points to the includer):
> 
>                        rp1.dtso
>                            ^
>                            |
> rp1-common.dtsi ----> rp1-nexus.dtsi
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


