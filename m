Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B93C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=; b=aEJ08fe+yzO0lUmFgr1TCjOz2r
	3g1Hm4hLwDj73TYhzL9uvC0QZ83kqvDsEXSlKQD/jgeMsL5fpkXzyEWxiDa2uV/4m2CQhkq+UDYyV
	5z7T8g9kvyW0Wpf7gJWDK+WA4llqNoCCTrONRzn/zufQitO3a29L7FfFvn9on62zANZdlPTd1+U/J
	5K04KvHsn2f6rhIJ/e2lvV3pczQ8fGoittiWVQyAvn+P/TUpmM7KMO3hZcw4UkctY+bIpbjJHYSRD
	rix07kLVqLpRGGfAumNj7ZeTETXTdWXJsN5NBPLcNDk/AY1utFPESMuy/tVWMmFo7VUib4wnZ5VSv
	9i4ychPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dmq-00000000XXX-04sS;
	Thu, 03 Sep 2026 20:11:52 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dmn-00000000XWt-1FY3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:11:50 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8487214ad2bso354282b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466308; x=1789071108;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=;
        b=Hr6AeV1tsPZvijuKhetDcYuN/f/wUwiW2SxGw7EnyIe1SCwWr06RVDYOTxCtPHy7SZ
         qBvXeq+k9Bq8wmRsiF5Q04LPuAcTow9UksFuCzRmrIGc5wRXMYJmt7uoL+zMn65t1KCN
         wsv9sDI7EYB3vtZE32h+qf2HVmzNFiBjYCjuO3weyLk3Y3Q6927CmBWDwqTr/HWT7oPm
         0tJYWzozN6sYuvTZ2vJ78WDBIvLmJ2I1+uYSFeddery1I2qO6p1mh6/0wFhgzTqNTR+B
         JsQ9j53t+kOT0YrRYGle9zshqUvSuc/8r0umx/SBmnjzYT892gd5bA5PmU473M3MaTV8
         MEIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaOPGt0YRxB2qhz9Yx8QAhAI9iE7nrfgTwyzOrWWxMD94wYpDrTSziZkgRc1A09qg0HeV/uWsXXkL8n/BUIXmp@lists.infradead.org
X-Gm-Message-State: AFuF++mQhiu2DX4qp1AT6Ds8OArZY5gRToe3Ac0m+DnwfzD2dO/ELZ38
	A/XSu8mKFo4Zr73TMrHaHAzYNmbtPquVhp6Y+Gsp296NlP+o5HB1CHu/RJgymaGluA3FVxvo5Y3
	RSWQgslVYJK0r54bQb0hUGCdOGg4w8OqiEL6KNJ3d2Ctky56nE6KMFs5ttHIbmxIDbsfxChTDFj
	n77+NFJwrSUNLoxhIgyhsKgOjF+aH/SRbpQYceCq3r7eddO6VDU4NlG4BC/bK59M4QUu4KhG/Dl
	W1iKU+82gD6AS5R9eUUW1Has2KCKcEQy7I=
X-Gm-Gg: AYBFou0FI/IkIpybuGzp3/GveKOd4ed8CDxneDa9ttWufqEuhpZvrPF8cvP+fKEaKi7
	lg0dfLvmMBrx1gao9Qle8QLF8onvzlC/g3xvawlj62VuvENhCrtFYDT7P3w6rzoRoEF6Wn0/pbs
	WIGMYB/1Y+NDE4yY+1tEZVKp8GJrX8OKnD1cpFEGbBu//mAFX4kWh4276WH6zUo/2Ap4I2JF8R2
	T0ejovnh/sxWEwPCWjrDyskUFtUvqh/TO0VWdUfIwaxupREOihcnDhXS78s7J0xxDiUGRGZiSod
	fJ9ogjFLEt8FU3MJbulF/aG9cUuxHXAWUbr/hx3JZ3z7QNfk/najmns8md+CotZwmI4BRYxTQ0H
	Ky+o27HcpojkuR5R/LOiglG7bqom6qWZf+0MMusgLC7ssGwPZhaBpdizxIH8eFnN8yjtmdIbuAa
	EbDBNQyfrryjLAzHuvLbbo/5VN3L3I5Uf4UwEBdpcf
X-Received: by 2002:a05:6a00:4408:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-8616ba62d7dmr2251258b3a.15.1788466307955;
        Thu, 03 Sep 2026 13:11:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86150e4133asm230381b3a.5.2026.09.03.13.11.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:11:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so26036285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466306; x=1789071106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=;
        b=ULeMnwWrrHb4Pzu4erNFisbIaartHfsfGkfPUXpbp+g9F0BdhU/8EMJurbTbfhvEPy
         YmtPnyGmdyAdttwHUW8mMLoCMWczh8oZtG+RnIJ3nshkRy1hrvJiKCRnypOlc2LD77kf
         TLXUPxFR0kTMj/kBAAoOLuP+UwPabvIUcPnLE=
X-Forwarded-Encrypted: i=1; AKwUvBziLt7pViYW1ID+rWy9PklDgnkeCU0JKEyMCbCMZx0uvPTzbGVygn1VZI9mx0Tlicsfkp8+m7+gn7E+YcDiIchq@lists.infradead.org
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr97447285a.49.1788466306378;
        Thu, 03 Sep 2026 13:11:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr97442185a.49.1788466305792;
        Thu, 03 Sep 2026 13:11:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee9fbsm51700885a.1.2026.09.03.13.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:11:45 -0700 (PDT)
Message-ID: <be3aac0c-3475-4f48-aaef-765aadcc6b75@broadcom.com>
Date: Thu, 3 Sep 2026 13:11:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Add RP1 PWM controller support
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
 Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
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
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_131149_335967_A38E0798 
X-CRM114-Status: GOOD (  17.76  )
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

On 7/20/26 02:44, Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which is then exported by this driver via
> syscon registers. A subsequent patch will add a new device
> and driver to read the RPM and export this value via hwmon.
>   
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea

Uwe, how do we go about applying these patches? Do you want to take 
patch #2 and I take patches #1 and #3 through the Broadcom ARM SoC tree(s)?
-- 
Florian

