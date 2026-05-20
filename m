Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E898CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=of8goAcgo6BFYI2D0ojfLUYu7ENvlbSg6CCV/wxzOBw=; b=V+jbFjyHpqs4uzwxMe2Kbb8Qff
	ZbOx6XgTEH1QrpCBVREoj1hT4a/s5uTiG9dCtFfBfL1N8Dz0R/V2TM87zN4wcqVgKUch0Bu5FSgr3
	q7xsP6oExLy7XtL3qW04qAiUOUek2/Xtd8VLijXEH2SlPfoyDAs+hLoPs6oJfFwNlJCP4XYI0SPul
	gC3rqPUn5tFuTQDXCnhGfKaTsRv6Db/e/lOw+0ze59d3Lq6HkXL9cSTsQO2Ts92RP6+iMqmXMCQgP
	AibyHqQ+/OOmitg3EmjxsaNllelegErFjft/j6GubgBR6d9qbVS2OuuTnIRi1kiz4JVtGPWHcP9B2
	2h2079lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqIy-000000068qs-27lb;
	Wed, 20 May 2026 23:26:24 +0000
Received: from mail-ot1-x363.google.com ([2607:f8b0:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqIv-000000068qE-41uu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:26:23 +0000
Received: by mail-ot1-x363.google.com with SMTP id 46e09a7af769-7dbd801138eso3844550a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779319581; x=1779924381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=of8goAcgo6BFYI2D0ojfLUYu7ENvlbSg6CCV/wxzOBw=;
        b=GyfV3S+c+xAscOklhsw2ynkv4lXh8MIJ+RhW6iJh2KI4l9lRLJdAAXHJik7IKTVMce
         Gq5T4N1UUbqAQaKQyqhpdZARpAbRo5xacon6rTO+ErvC0LUupbvsSvCZSw3vMqCdzGzp
         zHIbrSgqYUnr6G252F9T3Yr4M8pcp31DT/7c+JiaI48jwAasO01IjbLgZehvqvojCsnv
         oporOoFjRy5BUcSMAGKBrmqAIkGkNpSb+d47/nnq4p5fDbAEfCanGlyO1dopKZv3Z1CQ
         PDihtQcCI/JHf82TdVGYC0U95/VVRuJ5ZQakLfN6VyT5mYNgSHhOCLiep8BF2YIimGEh
         vV2g==
X-Forwarded-Encrypted: i=1; AFNElJ/tKdZB0dETPNDBSK/iY22slG6w3YroRWM+OwfdAEFguvu2Hf+tWzfQ6zVM/Ha0sGuTMlkVJ5yt5pwcsPcj7wBq@lists.infradead.org
X-Gm-Message-State: AOJu0YyWfOPjnYgpM/EvAX6LpVl3T0hKxad/+PkvHyVIoUpOpCprwRYS
	6cKqnGKfuM2ZtAbH1l44rAKRTsIQeAiPId1kPnzwVNwvSwIc1m6KI+ZND6Bmnn7Lz8CVX5RvdKt
	KSl2vkb0LE9ODppW0r88Sm+buAbv6aHF2JMXp8AybIhkaCBly9AYtQS0hsjSjdAorBGQ59sSF7K
	94ExBqYdp8Fo9AECADsC4DCR/KQA8hWthtqvPp9iT5WfbzIq4tI2KcM7KuyVoKrwkTqlRqBpjjc
	7CJ5jzHJn+oLH1gW5r2QXalm4+fqgpVfEY=
X-Gm-Gg: Acq92OGlY5ZwL1Vo53nl0MpRh+LlZ0Rgf8zPJFoIA3a20KE9QqhCmomqw0wTtSwO1y1
	r2s6etsYqC3XBGQtIMKhkutguoI2lKugnXKqtPgvfRI1dvTebfgpfd5lokRIL2I6iqSMmPuVHGo
	7k3QHlvnK64qZW4ALV96iBJ4HxbFn0Ii2sgR8uZmxat8P6jOKpaOQzrSPtebHN3y8ZcWheLNyjA
	yeIrjXlg2pYnE0Dn1mBEvFRC9VrUUbwFaWkGYat7bYIr9tBC6tbGOOHhhdGHkFu8ZFRtJ9My+kt
	+zbxZDdGLXjwpisIsENYu0mrCdYqtgnv73kw7LBbsiPgWY4A57ik/wAZXvo1cLveQcxhb/KlYns
	Tel1mtgRPDBBA/cQAg77h5BDW32x38s+TczcKZBS4pCI7sC1jqdwxdO0+mtZ2bjzV9Fg6VR4cr5
	DzOd300kID4GlMbxaLCnx0/bMCsr96lpzEn+WTbtx6Gcmbk1H4dZnsAkbp7Og+GJ4Z
X-Received: by 2002:a05:6820:2905:b0:69b:4186:1a0 with SMTP id 006d021491bc7-69d6e7054b5mr221380eaf.14.1779319580757;
        Wed, 20 May 2026 16:26:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-69d048d1832sm968533eaf.29.2026.05.20.16.26.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 16:26:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso4331035c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779319578; x=1779924378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=of8goAcgo6BFYI2D0ojfLUYu7ENvlbSg6CCV/wxzOBw=;
        b=Cz8JmrbCl5JSW47JbQTObJV4FAHD5v/bvHrTpkktX3yeMBZXv4IBr9kihBqb3P8ZXe
         XPPPzJeX0A9JXUUn5I+UHidgZRWoj6J2px2X9E6V6cdVV+vJtoAdU80TIWMuuSXrXwcK
         yKl2SjVlkZvPT5GRGuplF6b3Nh7xBjI78k/t0=
X-Forwarded-Encrypted: i=1; AFNElJ8AcGChP5F0Mtf6N7vZfsSVuSwRVW4sKQnmy1TzTgS/DLCByNm8CnS3jAONi6WVNEdEsfcTlRWcLNLdAVIYkNhK@lists.infradead.org
X-Received: by 2002:a05:7022:699b:b0:135:e8f4:2926 with SMTP id a92af1059eb24-13634938515mr206333c88.3.1779319578328;
        Wed, 20 May 2026 16:26:18 -0700 (PDT)
X-Received: by 2002:a05:7022:699b:b0:135:e8f4:2926 with SMTP id a92af1059eb24-13634938515mr206311c88.3.1779319577703;
        Wed, 20 May 2026 16:26:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm28875493c88.7.2026.05.20.16.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 16:26:17 -0700 (PDT)
Message-ID: <0ae5c657-91a6-4ab0-ac53-c419427ff4dc@broadcom.com>
Date: Wed, 20 May 2026 16:26:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: R6300v2: fix USB3
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260406220453.101185-1-rosenp@gmail.com>
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
In-Reply-To: <20260406220453.101185-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_162622_032823_CFA179E3 
X-CRM114-Status: UNSURE (   8.29  )
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

On 4/6/26 15:04, Rosen Penev wrote:
> USB3 needs GPIO to be pulled HIGH in order to function. Add vcc-gpio to
> do so.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, thanks!
-- 
Florian

