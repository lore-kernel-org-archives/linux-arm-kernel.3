Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F369C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8F5ngdEDHcCWWcWsAIIbVDmiLa9rm9VXg/s743ljT4=; b=mz++cjhTNZg3Ib2FIUdNKBMs1Y
	tZdMNvEMSLyqTgRWVEDJAa64MbEt6TlPCoIviMeSoXrNadq7rhzNOUbBoWoUvm/v4L9brhw/O0D54
	rIsu/JGlonqgSI4h5WuNTfvoJ2GIiUUmEmA9UbS3PYn5m9KlReheCrVntpOAHiKtR1Oo59zAtJTvm
	jW5rE0MI/FWbSjmZaKZuB++nOVD53IWcNToMVqYzNiwe84H1Mdk+ELdc2zZodkvUpaBRgwelYlM9B
	nht2qOY43N8ga6FgMCeyH3loSPJoxHO2xIN+67PdYYBr7fwU8eAgMPcEK3ii4zHZgrdBkVG55FJ38
	6+tI/emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dl1-00000000XEe-1UiZ;
	Thu, 03 Sep 2026 20:09:59 +0000
Received: from mail-vk1-xa61.google.com ([2607:f8b0:4864:20::a61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dky-00000000XDn-2mxV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:09:58 +0000
Received: by mail-vk1-xa61.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso170134e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466195; x=1789070995;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H8F5ngdEDHcCWWcWsAIIbVDmiLa9rm9VXg/s743ljT4=;
        b=TcymDAbkGPhB0qXHOG/KAZ3wqaWlHKbn/yoYKp/PwHry7rsdFfXJhZcohYbC5ODDRJ
         WPvErC0NJVllPPGnKKceK7Sp1cqxfbrRW+JUTJIqx0tJldz5aXfvPfpRYQkvMRk9TpLz
         mQ4zW8HzrZ8Lti51GvY2yBVnLzedM79P7UmJYqIUXwX+yiFc3YB1T5Z8I0QTIEd6GYfb
         W5K9U65U9QBRgmqkI9Qy+3Um2TDSxscYRsySFdD6qvoPztbL9l9VlMtrdPtZCLvsc0EC
         AnKEgA2BAstF+gqwTz9rDxjDm4XuUKUDYWGz7ty5UvQ4El+OeM3y/GS0GJ+9PC0s3Kow
         jBzw==
X-Forwarded-Encrypted: i=1; AKwUvBxX5rwavJzVUpSpBnCuqR2zhu1AmJMj8mp3A0xEvoGzkgtIaVMcAAgKDTrkStjKwSS8Kkn2MIJEBxU7U4LrU6tC@lists.infradead.org
X-Gm-Message-State: AFuF++mDF5Zc1+0OeKztLGgii4KTzAosghndVk4F6Hv3svx4dyKT5QYN
	hviQejxLNyhE0tawR1F99xEkl2vdwl0loWOYGKIKoYNX8H8QpVPmWNF+2Dp1mEQJGOLV7ZgmsBe
	YL83PtxWIRrgZnu16EBaEQT7nuVHtFPpy58Gu1zh+0QTCFADydwpI7zFi9SfA1FiVdSKNTJlIgP
	sAeGqvp7vOo6dFJxf8qX9+EP+4jhwuKgQygy1Iszi58qSbojtwN9YBxtKb0dsDJ9Z+rdDZIdvKY
	KHPRSszxjLvAwmMzCdZbQ96zOKTuMOdOAQ=
X-Gm-Gg: AYBFou1zvdYDe6o054urEwFrCiqFsm9C9Q4LU+GvFa9060KDoMdtkmIvpW0TlJzJ50P
	Bil3OqD5ergC2EieFQ+9vv3TOWRES6oY2cc6RRbt2nknfnlFdiiS1ogngxB1vDdj1rzoAWeMR8m
	XIH4aKUGNETRRiJKNBPdJXrcjA4WHmqGhEaNU8DD7sZ3kkp4dRBdC3lcMMdeIiWKAEeafAlrPbW
	34lcA4eTfvUxqQZM5or1tin7T1dhCx62ZL6pJAYu8uVrLvS+ytr3aSmbvwY0QpoiFwaAu7CHTHK
	WX9o7sotEihU8Uc2Ru4bNQgVQLIfKVdp4CPBbanPm7gmcs2wLrcwmXUUMc98r6AXexuKrIjbZaL
	FS2/AGkrOPIk9Nw5yAreWgoYBo+eNLehvehzpXyPKWwOKT9A6bwKZJtuaAEiWppYPW7jseZdYe3
	M593cxsbjymvhJxV73KoUDaStGuPCZVvEhrXpAvUwD
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr455445e0c.3.1788466195061;
        Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ebf6adbdsm279069e0c.0.2026.09.03.13.09.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so406208a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466194; x=1789070994; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8F5ngdEDHcCWWcWsAIIbVDmiLa9rm9VXg/s743ljT4=;
        b=Jq09oSHmKjNiU2SGoxEpKgzcR6ftP6oSX5/1GayApDXcFpVpF4IsXpUiKUxtpPOXmu
         G2cfK4HSZusbHe+f5WRGyqCYsRdAD628oJLI5axc44RyMRqXHRXyTAwa3NvOInHsywOR
         6JB07Gs9PG/pc+k7seT1uPdC4kAW75ihlu7Rk=
X-Forwarded-Encrypted: i=1; AKwUvByDJf/+JRE8N1GNqRLh08+s4RrIagQpvwTI1MTzauaPV/FVkxwaHSPGNgvCOcg0VAsfd4tfOlJDx0xF14hdua0m@lists.infradead.org
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr1546090a91.6.1788466193823;
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr1546001a91.6.1788466193375;
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm1148434eec.13.2026.09.03.13.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:09:52 -0700 (PDT)
Message-ID: <e05a1271-9286-4d14-88db-966c3745ca2e@broadcom.com>
Date: Thu, 3 Sep 2026 13:09:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Some minor RPi5 bits
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
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
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_130956_748284_387C5889 
X-CRM114-Status: GOOD (  11.96  )
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

On 8/2/26 07:50, Peter Robinson wrote:
> These are taken from the downstream kernel device tree. They
> are small components that already have upstream support, from
> older generation RPis or existing arm IP with just minor
> changes for upstream, tested on rev C and D variants.
> 
> Peter Robinson (3):
>    arm64: dts: broadcom: bcm2712: add arm PMU
>    arm64: dts: broadcom: bcm2712: Add thermal monitor
>    arm64: dts: broadcom: bcm2712: Add USB OTG port
> 
>   .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 ++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 66 +++++++++++++++++++
>   2 files changed, 72 insertions(+)
> 

Applied all 3 to devicetree-arm64/next, thanks!
-- 
Florian

