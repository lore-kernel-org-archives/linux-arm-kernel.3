Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC9AF53D9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 21:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntGOuBcFhll8Sh31h3Z8af16/+BUIbfDCN+JQMkK2k0=; b=miB2JndyxW+fPXhBrBae3k0Gy3
	yDVfhDhnEyJhOf8nr4/3trg79MqBKHXraJU8eb4Yp+75vIDn95FzcxVJ8uszMLryKwfnkyOTb18/z
	uuC6+VnEwiPARGsAwcVznBv97zHIwOZZgJ5Nssk106jlnBLs5U6DWW36P8PaulrAtAOFumG00XOn6
	QF3G6Z31EA0VpFOKspUxvKPeTpmpxMtELnPj3U4XxvX9RPJvY5ojgqXc7nPH+OhmlwrsTrmtHXf3N
	/lpjwNBsIWcm+gJhs+qwYieOAWIeN3ge04SmQRRNSrgDbsGVm2BzF9jgKIHt504C7sBn6W00c4o0y
	w0/Vz3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FDV-00000004s4a-08rw;
	Mon, 16 Mar 2026 21:11:13 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FDS-00000004s4F-3dw2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 21:11:12 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-2ab46931cf1so1119205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 14:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695470; x=1774300270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ntGOuBcFhll8Sh31h3Z8af16/+BUIbfDCN+JQMkK2k0=;
        b=pSjm12Aqtv20PnHyb7M8/8UglsYU5rLyMN0cmowX7DrZ0LmKlxhatM5hlOkOHz8Phn
         oiqHnGul5Sl8q0H86Bjio9mlcjkMPu75V2Ctge7xMNGisrtEWcIXwqEWgauE6fY/zRnU
         JutRtim6cmK5mH5x6HkrUtJLuaveq3dRJG/PaVECrtmUrBzlSn+IUsuSt4qhSA50RLb0
         BPzTy8pax18Edb/XBY9ilt4IMIbOVKcE8y4zSiXpF+7G1ZgXERR3lGexnx56hKs1OZX5
         PK5XqpOJfkrVhSEYQVGDA2MdlR7faxpEHcQlrv5ZssZL3IhAlP1eyEG7IEFIq4I38Fjm
         VoWw==
X-Forwarded-Encrypted: i=1; AJvYcCXFLnxHzNsSnE0c7t0ihlcERY1iWzEQvu9N03vX9pPbhpKGkVx1gyh8SRZYW20mhWSGQM22dCMU/V6WAhCmafFL@lists.infradead.org
X-Gm-Message-State: AOJu0YwRJE4Yh0kUt1bxjqZlv+mlOyMi3oppEA0eKjRHG3C2JvV5Q+AT
	uGn1ujmiOty5+XsbR7AQnIOsTC72qEncvWxg6L8qy3ZS4G8B5J8xl4q9qY02XS9IvCEQP1UI3O7
	N0L6T5zVSBJv0IwozJDYyRvaQPhHVesH3nijG6r5rhEI+PT+I7CwtzUXAyw2ThZyWzrVXy1+xSj
	98nXsyb+EBR6VAX6KfnqKugSFLi6aIC++YeuMeTfxZIn0V6BEym6FrwwE19rAjGy8YYfEm0JST4
	WafIL5h64t6X2/u/p/zzQsGunJV3MV4ZJk=
X-Gm-Gg: ATEYQzyfm42b1EUdtljqdGN0be6imh6dU6K1XE6EuV/KIyFAodrzsapL0CdoUKwRg2y
	RzLf9SnJo6JHzbcDyfvHEj2vFGX+dTHoY2fKF+lIiPTcc8g/a0/mMuMl0e/Q6uoBZHvNcd8FIQD
	hh5humMQe0VvpVmaKxF1NQIC0SHXAGmGmYTP488pswFBh0imDX/l+uQMlQZG5eTbK2dfiAapK11
	bH92hsyQgL4UNgeD3fvF8ChASbQr3a9HRYBZzDNLZGcC3UY18/siPnIxjL5KrIhCB010oSRdQGO
	urqg0D+jg47VROeA40bjfG0j4ATRUZ/0Sa0rE5L1fp6sn6+BJIyROe028QCSilkF+/XVdKIHJ1z
	45QfNIVWa3lItfiX+QHEWQYd3hEGpOrJqWizUdgdDZww2S2p9juaDWYauZN2yjocrgPpbLU4JG/
	zevpkws2clgCD9iMVXwbTWqpZF3NZv2zebVAWffu2pp4BbUE1C/eDcNfyYpTAvo4Fa
X-Received: by 2002:a17:903:94b:b0:2ae:a7e2:e80b with SMTP id d9443c01a7336-2b06370c4c1mr8345995ad.19.1773695469795;
        Mon, 16 Mar 2026 14:11:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0575e687fsm5484885ad.47.2026.03.16.14.11.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 14:11:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso60838eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773695468; x=1774300268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ntGOuBcFhll8Sh31h3Z8af16/+BUIbfDCN+JQMkK2k0=;
        b=ExjSaDsCAkCN6qJvrawFh96YtftjGV8njB+0/6Ato7SKsL8PJ6ZjAqv/Vv35F6BjfN
         Sa4CtaOQYw67JQqX2jiZtK69SsqaECQj0uEDbskSKt4Xz0D5pHmhrZ1jD1QpAchOvlLs
         GarziL9AtP+ebDxmh8hjHegobCwmCO0snMl6E=
X-Forwarded-Encrypted: i=1; AJvYcCUWU2yBcJLP5YpCQNoZ+jnM3PC78lc12m1Bo1zU1kVQe1e/6DL5biKcpr1CDwznWJZAeLJQPKuqi52zOQPr0VBy@lists.infradead.org
X-Received: by 2002:a05:7022:e1b:b0:119:e569:f875 with SMTP id a92af1059eb24-12917268285mr548572c88.18.1773695468144;
        Mon, 16 Mar 2026 14:11:08 -0700 (PDT)
X-Received: by 2002:a05:7022:e1b:b0:119:e569:f875 with SMTP id a92af1059eb24-12917268285mr548557c88.18.1773695467537;
        Mon, 16 Mar 2026 14:11:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6384f6csm12657965c88.9.2026.03.16.14.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 14:11:07 -0700 (PDT)
Message-ID: <052e82fc-cb53-482f-ad6e-95a48b2c7029@broadcom.com>
Date: Mon, 16 Mar 2026 14:11:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
To: Rosen Penev <rosenp@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260225230827.21715-1-rosenp@gmail.com>
 <20260225230827.21715-5-rosenp@gmail.com>
 <20260316204422.2145317-1-florian.fainelli@broadcom.com>
 <CAKxU2N8bNdUC9eS_qgqsJ3o=scmGnYoWh32AMQCpL2DDmdt52w@mail.gmail.com>
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
In-Reply-To: <CAKxU2N8bNdUC9eS_qgqsJ3o=scmGnYoWh32AMQCpL2DDmdt52w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_141110_930986_034F9828 
X-CRM114-Status: UNSURE (   9.44  )
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

On 3/16/26 14:09, Rosen Penev wrote:
> On Mon, Mar 16, 2026 at 1:44 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> From: Florian Fainelli <f.fainelli@gmail.com>
>>
>> On Wed, 25 Feb 2026 15:08:27 -0800, Rosen Penev <rosenp@gmail.com> wrote:
>>> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
>>> userspace.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>
>> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
> There was a copy/paste error here. et0macaddr should be et1macaddr.
> Should I resend?

Fixed it in place for 
arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts only, right?
-- 
Florian

