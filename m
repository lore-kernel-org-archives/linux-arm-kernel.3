Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A12ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=; b=m4wlnY0j+SgzK9sCH8CI9W9LF7
	YRhg6g24BkFsx+6BRGOJwJ7OAKYlOnafDTeCy1yHQI3XyM0zJdJn5XiuhY2h3gZZGv3tLatk7ayXM
	oaKlwSEwrJ2/K77kw7t1uzzc3EVdFY3iz8Pc3KsoIoJYGtUXeqX+Qjfz2BoOfh/rgfW019AVArtwE
	x/rkSzLylbnPV8brX8MacZOd9pek8rU35UZMJb+HJyxbzs32Z6waijwlW/WPi0go4Ug7u63fkqVd5
	bB7NOsU0hVe9i618H6igiOmhO9TIlY5FRv6+Kj9HAAMfA7XBPvBVHZxlS3WtdcEXTfFdXEgsFPLkJ
	mJDX/T7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMMp-000000023Hx-0CvG;
	Tue, 19 May 2026 15:28:23 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMMm-000000023Gs-3Kt0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:28:22 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-2b941cd869cso22436375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204500; x=1779809300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=;
        b=tRCeGGeW4uJ92H72XfnaQqdWTGfuUYdrHinBogGlWrN9elOwjXK3L9WR1czRwgrSO+
         hIdZr/p6ob1ZHymLc7RmfPHjdbLNpOALvjSzBOQnrMlaShMLTqp7BnFe0NK1Bk6xJPu5
         4zSBFux0kV0ogHs1Tk3AL4tFBQW4wMcpJJShlVnDWKgZtR7FKSu7Xsr8MDOWexz3Sy8q
         gFMftaVv7tiE8ovjc96mjXEjBelZ9/C+RM1NRz/ihw3ZhVdjeMo6meJ3LQ+5McxiyV+i
         overKcpEkc3ncGlRffjDja8JzpfEW6u43a+HZSQYWSaO0kwFhs91O6Fe4U3dpgtdeNqM
         lGoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q+3VFyyW2RVLKu7FpI7J+crdQKmFlrGgtz0aZt4Qazl244v4G8oYmUTDfloiInLGHc8elTb62xifSrruUXT7H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2KMkRFUv/dhpWirUB+G3zw7+9r0jgRZ4ZnlhVENTcFf0zIyTQ
	b9GYhIiuFGHsRVOg0Y++QBdJhPLAU0kzDIBfKVFSWevxiideoy/J1GWbhVLDd0DqtZJwtCRdPCs
	i5EnUre2vNZj+UpNi95zEWGfIp9cG2oR+HQiji+JBMTcj/71Vs9vl96hMT/W4sqa4FyWBmME4ME
	Iq8i3aJ63zSGa9N25TNa3IUxCzeRejfEM81KnXb93kMd4e0TjYElfflUnIvWQoazDKH84Kh3PI+
	nsarsYGI8v9sI6hOVowyJDRy9t439kmoL8=
X-Gm-Gg: Acq92OENPc/qy0qw8JSNfEDJ8YjDGdUL8Nd99K50zXZJ2ALJC7NzcQ2QwpAbDcTqYAn
	ktJr2++8RGu+Fyo3EiBTLTSSQUZM3xO37s3b+KLVm4bOwfchwEM5DHOqU0CI03ZFzHhqR+ooaNI
	EXeB3hL2615XAjExvjI0dBLgizkknS76xfNE8pDSKxwReIM9YT2YeP6sw58d/h4IwcYypRlsoGV
	jE9cILbODZPDnuALbuJ6Q+zxMmfkjUTXhwInEQJbnsEk8zZcbsX5gdSsK+SS7XYwbVzzFuCmh7K
	voUWgAvyYxHiHd9KF0/0uwNfCFpbzpEuyxnKoUr8kbRRrWkwwP87/YR5TPH4ZMF4R+y2/ZMFuy0
	s/qXjrOCePhuhVMhfvAaHr4YeelVRGaByXYmt8caBDP4LbtkVoX90QQ7OUM0EuTOC2vN7pUvFqD
	3UrMp8In3O/d/AxPsqXD7GHEM8nU76TFdTjuWlelTNll8Sl0c8nkLpq/JtME14NA==
X-Received: by 2002:a17:902:ea03:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bd9c0a065cmr163578325ad.19.1779204499741;
        Tue, 19 May 2026 08:28:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2bd5ced2ca3sm13497565ad.29.2026.05.19.08.28.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2026 08:28:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so124851116d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779204498; x=1779809298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=;
        b=KnMOX449KxYvSwZWt9KXLx+Yb6iW33ORWN/kBW/TKeOeyhhhJvt/iURxL8UJ/1laCW
         U1m/SvWvmoPs54wfJBpTVOb1M8Y9J+G69NFmHMYA8/5RULemH7G/ARVYzF96UV+8IWoS
         TKQxLCQSLHy1c/O8fwsuK+tyXeoXvee2ZKp6k=
X-Forwarded-Encrypted: i=1; AFNElJ+Y0Lztm9rbA0D7/+Oz2fU5LxoChAZdUWXduBIEQUvKTgyqr3iJloriIC+Hr1dsDFwv5i5cnd65ltmIcymbPZIX@lists.infradead.org
X-Received: by 2002:a05:6214:484a:b0:8bd:1f2e:7063 with SMTP id 6a1803df08f44-8ca0f643076mr294961726d6.5.1779204498138;
        Tue, 19 May 2026 08:28:18 -0700 (PDT)
X-Received: by 2002:a05:6214:484a:b0:8bd:1f2e:7063 with SMTP id 6a1803df08f44-8ca0f643076mr294960916d6.5.1779204497466;
        Tue, 19 May 2026 08:28:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c29asm93644856d6.34.2026.05.19.08.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:28:16 -0700 (PDT)
Message-ID: <31af08eb-8299-4ba9-aaa7-3150ce31b523@broadcom.com>
Date: Tue, 19 May 2026 08:28:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
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
In-Reply-To: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082820_843389_C6532259 
X-CRM114-Status: GOOD (  12.66  )
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

On 5/17/26 01:04, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>    - in0_input (core)
>    - in1_input (sdram_c)
>    - in2_input (sdram_i)
>    - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

