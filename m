Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B839FED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ox3ioSuPGrJX2hSBjwD64l3+CygUK07xSiSPiBuPG8=; b=f58VqUF4/Z/E8EFVVLMWiHAd+F
	dju1uLBP3yB+GpzBGLC28eyTIcwMabtZDFGtTLXpjV1RnwM4bmnfcxS0/hrFvIv7jEQ5NZiOpZV6i
	KIxgdf0FgaR8E+a2iTSbob9U5vI0979iBIqJ4WVSeFp00J5dmnLEXAJM2/6jA9UqRWvvfy4Z/2xjm
	7HrEoxgHb1TMHDE9zkoJ0NmyvafSOPrRm5cdbdSun5xYF8IHPxsYI9a8k+lNMaBjq20Hj2Uz71Uxf
	0VLWiYJ8Wj3NpG2hc+vRzfqCvu8WSzzwaoULXblFasvUn0j4Wgo6rpOk2WhV4Kmqam7Ew/YYVi34y
	nZAFd3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YpD-000000070oU-392s;
	Tue, 17 Mar 2026 18:07:27 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YpB-000000070o1-2EU8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:07:27 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2b061b6cf36so11777115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770845; x=1774375645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ox3ioSuPGrJX2hSBjwD64l3+CygUK07xSiSPiBuPG8=;
        b=E9IhfcuREjZdDVozjOF9u7d2xoPCmR+uwyJrFEWvS+9t+HHJE5Az81u5x7DdrdSGYE
         zQoDi2skekszlnlCGCHabvHI4piKyW6GkCSOfS70CFqXNp4TxB2SHuhGnrhwJowp7YZe
         Pxk6KkNthtWs6HU85wr66tl/i2lY5kkTmX+O+wZLXA+XYDCREvKg74M4WR7GDTdgath9
         14hymVeq25XViiougl+c13jEqKdXvXxlVZ2Yownp4GMNrlwd3gL/yrAxqBBMt5Moj6VL
         dq7sd6ARw3KlNgSdOVm8SYE8Z9gG65IYpD6UsORdLiFfEZQKSrS2vcEuMYzv9LSEcNfk
         rwRg==
X-Gm-Message-State: AOJu0Yz0pmU6WcokMfDSNXu+5eLaVaqEZhVIER/r5FbpNNA2v/mkG9MY
	xn+haHnq4UodeDIR6NjY0uw/6LKXQkuXH7M6cPbCpucWNSIoFdm9KOR5jd1z1jfRm2bxstF7w51
	xU9fBdhWY/w8X3vT7iAXKyrsgJp4s5ihxGx91KJHl2GWXXJL78bYsaYOtr9whLQ3XsQR3KNeI5z
	7VY3ROvJKLRClGP2NTXo3kZ1VzQ7xBcdiY34C8r9ugqAswH8HjaTR3+0Dbv1pJz0P/sdM1JmFT2
	exTNSIU1d2KNLxu8LWBncs1bv6iDa7mzgc=
X-Gm-Gg: ATEYQzz+1HcI8w2p1QYt2CR5pVwWntipvHSCL9N0e5uS1Cz07yQ08FwDd4F1wRkoYsu
	Lj2q2PQ3nmDUCpSDa/WyL8FJVSjqfXEuVT+e5ZiuWcXaJjTcquO8mDxig2PURdrk12G80x2V3T9
	0BbiLX/F5YjWoPzZ3YzmcGI9tXbfDS5f7jipdZ9ZJg3B4LHuwT+TQR4Fe30oC1IUl4TfUL5grhW
	56Ln2CPOQhM+HUVJWbv5ec2a7jrFbkuzFR7GczAnW/qQ4pZadg/LbcNwjOnS1dwDTbiYJxEX7ad
	rMiLj6aeTln5GUPo/ixui/2ENqV0r3rV9+/FRU9zKiLz4cgXVI34vbD37Yfm6VVWpGTr7W67xVH
	B7BtK31wA1roV1XoIfhuwvXNqAa9nXb8yqKDna6+cc5KJcbjbqfDlSyc7iIrxj6+HGVGXlCwc41
	tGNNbLEAN9n1zYhEC0MBtzQvonkg2sPtmU5RQTFeGNcMns0o6S1t4czbdbdPOdNfaA
X-Received: by 2002:a17:902:e94f:b0:2ae:b9cd:d30e with SMTP id d9443c01a7336-2b06e3edd95mr4640985ad.37.1773770844473;
        Tue, 17 Mar 2026 11:07:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b06e61cad8sm217025ad.51.2026.03.17.11.07.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2026 11:07:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b19111fso439120341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773770843; x=1774375643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ox3ioSuPGrJX2hSBjwD64l3+CygUK07xSiSPiBuPG8=;
        b=YNmUysvdebYPpiRKjqkITc5wEUvEZLf4xLQYKVA3UtO+YFAdXa+R6zH/MeUkQxNPoy
         Do8R+5TIzr4CreMfi16CV9d7wto/3bOlIEx/CZu6HoxPCebNDW+5OAlBB2D5pFdrgv8Z
         lviTkhiQmhuNJBl1LZ2V063ZcNrg2f1naHP50=
X-Received: by 2002:ac8:5a0d:0:b0:506:1edb:2cf8 with SMTP id d75a77b69052e-50b147461c6mr3474701cf.8.1773770842983;
        Tue, 17 Mar 2026 11:07:22 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:506:1edb:2cf8 with SMTP id d75a77b69052e-50b147461c6mr3474151cf.8.1773770842361;
        Tue, 17 Mar 2026 11:07:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b134ad438sm3969481cf.10.2026.03.17.11.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 11:07:21 -0700 (PDT)
Message-ID: <afc06275-d13b-4567-b6b2-c7edcc35107c@broadcom.com>
Date: Tue, 17 Mar 2026 11:07:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] ARM: dts: bcm63138: Add I2C block
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Linus Walleij <linusw@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Cc: linux-arm-kernel@lists.infradead.org
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
 <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
 <20260317174949.862517-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260317174949.862517-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110725_582028_D1657D62 
X-CRM114-Status: GOOD (  10.00  )
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

On 3/17/26 10:49, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Wed, 18 Feb 2026 10:30:53 +0100, Linus Walleij <linusw@kernel.org> wrote:
>> The BCM63138 has a brcmper I2C block.
>>
>> The interrupt is at INTERRUPT_ID_I2C whic is
>> (ISR_TABLE3_OFFSET + 19) = 96+115, convert back
>> to SPI interrupt 115-32 = 83.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!

Offset was adjusted by upon William's feedback, FWIW.
-- 
Florian


