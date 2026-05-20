Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86672CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvICw2ZiPKqUfY+3rSfqzqLBbnkDQZGCcIY6G6UcS6g=; b=yqicKU4VUaPin/x17UZkBSA7m5
	1Cc9ME5E8CZ0G8JqtSRspKUwvm/njzpgsdiL0awh7D8WbxQbsj+gXstOCw7/rJNvEh/XsoVE4kj8D
	am+TgzcH2K7WnMC58Iao22Gbi/AmQeBzCqe4SYHRtrwdE35b+zC6aHTPMnixnAIio6FJwgro+mpb0
	Js9bCll+pVmGJLsYjQ5jovfYB0ydOAr60ZNatvj0rO0wT2I/da9XxsZHhc2wzFZNO67QlK3WDLXI1
	AL/k7bP9FVq0oK441z/QM3lu/KxzUgmdtmzjcIiHEW6b9STEV11rGChxUjx9fKYTVTsYcT8S6zuMv
	Ux+HPOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqOF-000000069dt-46kH;
	Wed, 20 May 2026 23:31:51 +0000
Received: from mail-vk1-xa63.google.com ([2607:f8b0:4864:20::a63])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqOD-000000069d0-1JRA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:31:50 +0000
Received: by mail-vk1-xa63.google.com with SMTP id 71dfb90a1353d-575171b1ce7so1702387e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779319908; x=1779924708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvICw2ZiPKqUfY+3rSfqzqLBbnkDQZGCcIY6G6UcS6g=;
        b=gogtchGBrZoCiA+FTvxz5F8wqvKztQQjZevRolnfh8mVtca73D01rzqj+zOBXvHnBw
         9VAVR+wnbIMsiq2/LnkVV9p0tbysuPUgAaZYx2VzquTmrCSS9QbDGbJU9rlnkMo5LxBI
         UhWJbZ5kMkBnIUOvVCSZaMyEnCawiduHi/pL+Z4uCKsU1p8i2UsqUR4XFvD/OrI+5HW3
         JNVF1FLKLnFB2CWAdldSvqwgOQBHzmCSJ5pxL5lOgHO4mKUScAtU9jPDR20OwVjPQvFW
         9p2zwCIju+AFPJbIUz2AtQjzOYt/3dsgF0/Jz1pcr7l9ej3wBth+8y/kfTok/Fz9K9cO
         DLvg==
X-Forwarded-Encrypted: i=1; AFNElJ94NVKxE8ths155Hs1kWOb/ubmAKSeqg8xrD3+thl7acPyk/KV2djluwoWzaegr/BVWyvSx2uB4vbSJmAYgnyjo@lists.infradead.org
X-Gm-Message-State: AOJu0YyE0Ree3iyu3w4v7Pv0bXwbCZvtDtFpCbVKukefUYf1o51wpIgS
	qDlOUohIK8v/t5POVyK8bIQdrUZ65+yeqmmBpLMoF6yGqv5O0snuqRB5MrqlbxcV5r9z5JtzVZ8
	AGu81kmvyFQRfH+EwF1WR3UtQCKW+BpjThngcQS1QDLL5dMKbaqJHqfhm15LcPl8/tE1KO1MSY0
	7AffWVb3bCwvQmdywGEzBTYkuK6VvHnIf62wu5sXwHr7L449DNDDF1UGO09cbWVcN/BQ0Ktlv33
	94jIxqYpU+RrOHJHM9VjHYRFNxLsa3PC+k=
X-Gm-Gg: Acq92OHMVg/WVz3jz9IJlkCZkXkMoPsyiAt+GUDfNKp9wc1P63r9UWnkEOjUpoJlLhx
	4ATcrlVVUEGJlu22O6HzbAPr75ppDxUMtvsWhjJpOcEJp321OIanmSXY69jaYDTdXHeWCIpKFx2
	lN8sfqN6slJVeDB3QvAC8i4YTK+RvTauW2KdStQmZe0CBWPI+N0ZsVQ7CPq4IMabivxJj/z9Fps
	K5QXwEhWHhLecldlzB/Fba6s1oFDGOtu4FLdaUpGorZPfNCO3MrEE6LFNirEV/u5FnHjmRz1tSX
	klXhH36blQ4z0uHD66fMlAyO+4yK8U7r5anHq0YrXN82203uRH1BPPVPHf5XxWFTuCIyXUn66C3
	Pgpw9NwF4GRCmdOxeoDoruJJbrOxq2gSogamICyoc/F1gynHH09CnmkshKh57wjMsyn5BFdo76p
	ZpnHO9FqARdpFWE9pUu3AcxzcerrlRXrWm9hd+bgJadjCXlPCyXuwlm7ivgiJsMVcM
X-Received: by 2002:a05:6122:218e:b0:57d:8059:e0e9 with SMTP id 71dfb90a1353d-58424154e3bmr237664e0c.2.1779319907806;
        Wed, 20 May 2026 16:31:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5760f7b1612sm1492704e0c.4.2026.05.20.16.31.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 16:31:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so958247eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779319906; x=1779924706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nvICw2ZiPKqUfY+3rSfqzqLBbnkDQZGCcIY6G6UcS6g=;
        b=RInr65cN4aagGJUIJDbzWprjkP2dfJvJ0IsTCX+cyhOkfWRiZljpavrrquGDA+TVQp
         QjyWj/EXHHuvOY4vb7OVTVoZ+2c0XgCUc3czO8eUpMrDa5buaV/KULJNMpwdXVVhLHlD
         a+xrLLJ5EP91px1PaP9ZGCFPZ9JBusi/brzhc=
X-Forwarded-Encrypted: i=1; AFNElJ/CydimZRnbVl2VSSk+qPJgzI212KWus+rrwoNfxb8luIo0Op8Xualht/nQG3L1C9ONEHnFWb5MK/PJIJcjkGCT@lists.infradead.org
X-Received: by 2002:a05:7300:ef89:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3042f439717mr408625eec.3.1779319905726;
        Wed, 20 May 2026 16:31:45 -0700 (PDT)
X-Received: by 2002:a05:7300:ef89:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3042f439717mr408577eec.3.1779319904722;
        Wed, 20 May 2026 16:31:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea6dsm20241408eec.4.2026.05.20.16.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 16:31:44 -0700 (PDT)
Message-ID: <394b5e02-1aa6-4efe-a5f7-4468d1f82172@broadcom.com>
Date: Wed, 20 May 2026 16:31:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1776932336.git.andrea.porta@suse.com>
 <af2bsEdAhYY9c4rb@apocalypse>
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
In-Reply-To: <af2bsEdAhYY9c4rb@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_163149_366764_F6F1D00F 
X-CRM114-Status: GOOD (  25.76  )
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

On 5/8/26 01:15, Andrea della Porta wrote:
> Hi Uwe,
> 
> On 10:30 Thu 23 Apr     , Andrea della Porta wrote:
>> This patchset adds support for the PWM controller found on the
>> Raspberry Pi RP1 southbridge. This is necessary to operate the
>> cooling fan connected to one of the PWM channels.
>>
>> The tachometer pin for the fan speed is managed by the firmware
>> running on the RP1's M-core. It uses the PHASE2 register
>> to report the RPM, which is then exported by this driver via
>> syscon registers. A subsequent patch will add a new device
>> and driver to read the RPM and export this value via hwmon.
>>   
>> Subsequent patches will also add the CPU thermal zone, which
>> acts as a consumer of the PWM device.
>>
>> Best regards,
>> Andrea
>>
>> CHANGES in V3:
>>
>> - Refactored all the register macros. They now have RP1_PWM_ prefix
>>    and follow the register name.
>> - Dropped the tab alignment in front of struct declarations (use a space
>>    instead).
>> - Added a check in tohw() to test (and bail out quickly) in case that
>>    period_length_ns is zero.
>> - Probing now returns an error if clk_rate > 1 GHz.
>> - Added a check on minimum period ticks. Return 1 to signal round-up.
>> - Fixed inverted polarity detection on edge cases.
>> - Fixed rounding errors (in both tohwi() and fromhw()) in inverted
>>    polarity calculations.
>> - Dropped a redundant check on period >= duty.
>> - Replaced memset by inline struct init.
>> - Disabling a channel now is faster, skipping the duty/period/polarity
>>    setup.
>> - Fixed an error string (s/Fail/Failed)
>> - Used %pe to signal error string instead of an integer.
>> - Added several new sections to the Limitations paragraph to better
>>    explain what will happen on edge cases.
>> - Maximum period is now U32_MAX-1 to allow 100% duty cycle on all
>>    selectable periods.
>> - The hw period register now takes into account for the extra tick at
>>    the end of the period (subtracted one to wfhw->period_ticks in tohw
>>    and added 1 in fromhw).
>> - Added .remove() callback to free resources even if the driver is
>>    not unbindable/unloadable, to avoid accumulating tech debt.
>>
>>
>> Naushir Patuck (2):
>>    dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>>    pwm: rp1: Add RP1 PWM controller driver
>>
>> Stanimir Varbanov (1):
>>    arm64: dts: broadcom: rpi-5: Add RP1 PWM node
>>
>>   .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
>>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
>>   arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
>>   drivers/pwm/Kconfig                           |   9 +
>>   drivers/pwm/Makefile                          |   1 +
>>   drivers/pwm/pwm-rp1.c                         | 414 ++++++++++++++++++
>>   6 files changed, 500 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
>>   create mode 100644 drivers/pwm/pwm-rp1.c
>>
>> -- 
>> 2.35.3
>>
> 
> A gentle reminder about this patchset :)

Hi Uwe,

I would prefer to take the DTS changes through the Broadcom ARM SoC tree 
to minimize conflicts on my end, are you going to take the PWM patches 
for 7.2? Thanks!
-- 
Florian

