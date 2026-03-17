Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8B7FED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq5/+drIMzPY49yK2H5pTHptVEIxKFUJhHw+Yhx7O7s=; b=NvkXrET7tyvuSN0t4V2jjzHOEi
	Yj8/KplkCRIWBdO3CuXRbEUVqSKk2ax/zn8X9HB/92WcAdEdoHpS/C9DvfK234cvKrV1N+0b5P5vm
	HEHV2BRNfp0Z3WLpNf2vYG2mw8he5G6rcvH1F3vQeiJpXDVC+ccQTBDPXJyVJ+yBhtk+ATtuAUq4A
	ed6cChuUo6nWVjgTy3V00ir/s8OtPSYpvTU7nmBoOTA/ppH4VtANzpuAEuGshUHFd9LiapfIt7uS1
	NDDFincFlMsVeHg4hKq0Jps3+7YAr1opukzV6blZ7+dlgzNfBKaFZAvqOEYkMqpSrOsS5AEu8f8vg
	w7yBSNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yp3-000000070mP-1tTK;
	Tue, 17 Mar 2026 18:07:17 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yoz-000000070ly-3sAQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:07:15 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-89a0ece9f14so73743786d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770832; x=1774375632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cq5/+drIMzPY49yK2H5pTHptVEIxKFUJhHw+Yhx7O7s=;
        b=V5c1EodvF16qI4fBmUXDSe9lsktfQmzLt5KRLnlwtf5FDhWS4+uoBrzpV3WrpF10vj
         0cymivYq9uOBjt+LWL1Elc2TsxaCPvacBHxkkNmtzYJUtW7dJ+dPUaJTlg0zcrjBPaDs
         f3nV6EmSz/TvH4pnTT3nQPaIcQkwHO1K24L5Ds+trfCgd7ktdWdTxJfzaqqclEwuFHLl
         SA2Gqyi0Dng1nTDa1i9Qj4vwlNwbND+rCFtmpr2r6RyQb/jQgboteC1hk9AWK1MK2IQy
         h+PnUtA5+yxuz65SbEWkzBwVVC3xo8W5QmxxoO8A46ilPKIO2mavOWHCowZEFD0n6Va2
         QFfA==
X-Gm-Message-State: AOJu0Yyyay11wJ5hp9aVFPEHfOy4zKf2zW0KFdv7LVd2FELJpY3MTlSH
	0k97/1MAvZCRF5z8nzQz04RqF0V77L9qWtoemSq4Gc552zYedotTT7MgdbP7UiYHF3/ipMRsVt8
	xb5dlnPWnkJrcMX5pr29Tq6WtUY4JEFsnIxzdx9x7qE4pGH/CRxxLjT5geQZY5CBwOnFT/LmB27
	o+B6oHjC/GIe3hNxaGSQ3KWbGdJ9NfDNTHninpov9SuNWaYxIf/pakqQhjGzkTMEqe+jeBWxd5p
	gEZYn9VSGlyjUbXto+HxZ7jG5kgxPRKjJI=
X-Gm-Gg: ATEYQzx+i8NHhUgzzD8SU9xkoC1M4vDMr0MI4Ten94pcs7Zs2liELoJGp8gZpCAOq5L
	Jo5VPUyQMhoVY4CzSAgCESn4hR3Y7SoVAYJehaSDV0yKprOCGWg6xIl494K91b/n95qQBYi5gZx
	jDgHp+MKvNZR4EcBc2JeIqSefEdgD5UYOlzKv2UcJsP797KqRkiAk+2u3ROvEQzQjayL0ps7WLU
	XTbtxekEpeXLVvoGt/5rIkRYNcBsAJ/0IkMkf02wXLV4R2xMSgweo146sV2DqVme1INI5smDLZm
	GUGiWQj0TSShKkEXoA6fdYBXBrcl4GExLc3cNvjGb0nDwmYPPwP+uDLCTBIgmUM176An6gU3qZn
	aX/7DiE/R0IfiDhOpygm+XiBZewJ6L+KLbU8qZmgjHGdtaJvOZxwNfvzHIZNcBpTa3aQWN1SQZA
	8xB2a2sYtbGtKIczrNmRsMtPmhDRgVc37iLDy6JF9nZIAJLexa2+mXE+U4x+QQPQ==
X-Received: by 2002:ad4:5aeb:0:b0:899:f0b1:7332 with SMTP id 6a1803df08f44-89c6b558603mr8087866d6.32.1773770832044;
        Tue, 17 Mar 2026 11:07:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89c6b9979eesm232236d6.17.2026.03.17.11.07.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2026 11:07:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c56300e64so86222376d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773770831; x=1774375631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq5/+drIMzPY49yK2H5pTHptVEIxKFUJhHw+Yhx7O7s=;
        b=MLD/eloL946hfkaa+rwJ8pS9dp95wrEnL9ZxU3pFU+b7EZo+XkxyxkKDmg37MExQ3c
         bI05kH/I+3IMVVLylVgJVLeoTIjYhEU+i2MtDInz7bl6YzhVctFos7QFOKWUN1SW29VF
         Fs0ter6sZKdldSEd8wmYem5kQhKZuVAAuhVnM=
X-Received: by 2002:a05:6214:5f84:b0:899:fc7b:3884 with SMTP id 6a1803df08f44-89c6b5bd121mr6831506d6.57.1773770830859;
        Tue, 17 Mar 2026 11:07:10 -0700 (PDT)
X-Received: by 2002:a05:6214:5f84:b0:899:fc7b:3884 with SMTP id 6a1803df08f44-89c6b5bd121mr6830886d6.57.1773770830256;
        Tue, 17 Mar 2026 11:07:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b9cea7bsm2302266d6.27.2026.03.17.11.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 11:07:09 -0700 (PDT)
Message-ID: <d0575794-9733-47c1-a311-efb9329f6fa2@broadcom.com>
Date: Tue, 17 Mar 2026 11:07:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] ARM: dts: bcm63148: Add I2C block
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Linus Walleij <linusw@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Cc: linux-arm-kernel@lists.infradead.org
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
 <20260218-bcmbca-i2c-dts-v2-7-5373ef82c50c@kernel.org>
 <20260317175001.862603-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260317175001.862603-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110714_064696_161180BF 
X-CRM114-Status: GOOD (  10.54  )
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

On 3/17/26 10:50, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Wed, 18 Feb 2026 10:30:54 +0100, Linus Walleij <linusw@kernel.org> wrote:
>> The BCM63148 has a brcmper I2C block.
>>
>> The peripheral range needs to be extended to accommodate
>> it. The Boot LUT is at offset + 0x10000 so extend it to
>> cover at least that too, 128 KB.
>>
>> INTERRUPT_ID_I2C is at (ISR_TABLE3_OFFSET + 19) = 96+19 = 115,
>> convert back to SPI IRQ 115-32 = 83.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!

Offset was adjusted by upon William's feedback, FWIW.
-- 
Florian


