Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4653FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhiHL8lJqMLwH/tA/yyEZXng5kcabiZPDcP4lU8JGSY=; b=0wlUg78jUfp4ljWBXsY0fACo28
	nL9vD7MEuh6x2JRehYeCBbHVMFDPvpv/mBNmfxjoWlD6stzin1gNbCq4NsS/DLsT95mnszWje+ycV
	3GXfgKg2MSCUFFyk7+vnFFDsdFFk1NibuFV7FavJCAeBRaLoW1p9zCA1LWZm8U4z8KwdDDwUczvGt
	2t2n4byobcP/fCLHcpx9pe8dF4rwBEGQaVMV0J/QpT9SOYTg6Fc/2kQaxOJBiYirSmBDXMKu7D5io
	p2SX4lLehMzZwDqL9+UCoK1EgizwrfwnTB6kPUv7XD+oVmgpHIc4G8a2Y4mheuTKJI0FMElP27mDD
	+q3kiZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMNd-000000023XB-1Awb;
	Tue, 19 May 2026 15:29:13 +0000
Received: from mail-yx1-xb161.google.com ([2607:f8b0:4864:20::b161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMNa-000000023WF-44Np
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:29:12 +0000
Received: by mail-yx1-xb161.google.com with SMTP id 956f58d0204a3-65c21049dafso3263213d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204550; x=1779809350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhiHL8lJqMLwH/tA/yyEZXng5kcabiZPDcP4lU8JGSY=;
        b=n0zLkBBvD1TYEbUJm4hcIQJ6bttSIRAq7jH+9DGOXfcd79jhHRtRX2cgFcBaLDl8ju
         v/yVKjLIrqaPWCSMWJcKPVSUTAJynPunckIYrN89S7itfC41m6pTJt3nXFta5hUV40FW
         sbTmgPWN32JI771Xhj7LCDMyZ3yF99bniblOhT0e5F8joIrLqibH4NXb0695KWN0aHVL
         Qa98D93ujX251W/fQW8bb7nyf0pWAl7E2ABMgdmoNVcqHBgGSYNQkocpHfcrA4XtzGWe
         z3UeEAilED3bU/p8UYxB9Zt9wZzGF4P06zLQA9qffFc+rtMjAv96D3yWfY0gQna94/GZ
         YHTg==
X-Forwarded-Encrypted: i=1; AFNElJ/x9ZpS6W0CSLdtTNEAFBBPBPqQvkr3r3qJ6TYfRElA0wNwpK9TaTNjLKmt3cJRQsdI1gemWx59XbQPUae8NcJe@lists.infradead.org
X-Gm-Message-State: AOJu0YwtfCm+Ll2U1VYGUqRl1yZxDifjLi1l/L1q7xrxme5/dqpt+Q5z
	c3MrOn3gnqy3lXFQgPeu5tyvXaSshmXX4In8kdhhkKhPXYOOOVedd4irCiqDZMlaEIQ3C2biAfN
	PeEWmH//7daKQg6demw+JXMX+L4nau+jKGpZP4Ol8Me2vAB/h58ThPs3sdhrt7OLNy+TrtNBCra
	sZbghNzBq32TrlP/EYHqEyB419menoVybmsdr53U+RNlOdYzEsORVte0Qvvn0eM9ODKO0U+fpAN
	dxY3mnywHApa4oT+YpjfbiVz++eYy067DA=
X-Gm-Gg: Acq92OGhkvFdK/hQ6q3/Ab0E515WMbgtNPnuQB4HAo5AHAA+Di7BLN8wWCqB3MRGiu9
	Mn94y3Ss5JAb7ahXHVm4UfPuJGii6xcfsTNtb2ixBNcZtgKfGn5e5Pv/PGqsnuynfHbcJpuSdIS
	rBIfNmaPTVkiXL5zl5+OvJ4wPVDKi6AWS2CMdrnyaQzXmyDLLe+M2V8hDjWqtCbBwVLdvs0XPhq
	gVTe566JqPMhxSDxjSAQY9CEW7CiGlDiWOXbq1kniORGQkNYz6icvUKZZ3w9bEzMmWlNmIeM61I
	jU8efImZeQ9eUmQ6LKPw4o3wWdDp/QuKBVuaJ8fwT9QQx0FCKxzmCBNCK13wFbJhap1nSHHakzR
	DSbBHSjMUSQ0rW4KvjFkhMM5QJ9l0yQOxvIFEpz64QkcepvWwmBSvopSf72iElKb8/krdq2mUyd
	+4nxOC0PezBqFWj4/Xdj2dmnbdJdo3aScC59lPDZEW/2VDHQixIvBuE2/1m0cRaA==
X-Received: by 2002:a05:690e:418a:b0:654:54f2:9e50 with SMTP id 956f58d0204a3-65e226f5db4mr16967723d50.25.1779204549681;
        Tue, 19 May 2026 08:29:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-21.dlp.protect.broadcom.com. [144.49.247.21])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65e0daeede5sm1308713d50.23.2026.05.19.08.29.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2026 08:29:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f4bdebe77so753926585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779204549; x=1779809349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FhiHL8lJqMLwH/tA/yyEZXng5kcabiZPDcP4lU8JGSY=;
        b=Wxw6dBoCJ6Mz1tmRa2pLGtpMaOXAqWhauQ7Zg3PaIY+3JwpRFhLKYt6yqLxGoeMKBu
         2azUlvgogj4L0uDofrS+1RITD/N1liMHqJLUOT7YIrlqylbTEY9WX+deMc/ayTuG4jOa
         IF+Yb+oPaWXCZyy+Vc/1CzXUVyThFKx3I9JLU=
X-Forwarded-Encrypted: i=1; AFNElJ+gH9S9Z/0p6F5V/XNnXoK1gWkVV1YQ+uakp7FnXs5cEPgJhBO3MFxkYUNH41JDmY9IMQhY4PkGqhCfYdbX9OVm@lists.infradead.org
X-Received: by 2002:a05:620a:4492:b0:8ef:3953:7ab with SMTP id af79cd13be357-911cea09723mr2975878785a.40.1779204548838;
        Tue, 19 May 2026 08:29:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:8ef:3953:7ab with SMTP id af79cd13be357-911cea09723mr2975869385a.40.1779204548070;
        Tue, 19 May 2026 08:29:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83b85asm1860419685a.25.2026.05.19.08.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:29:07 -0700 (PDT)
Message-ID: <edff09ba-f21e-4009-9b9f-4e7a9f630618@broadcom.com>
Date: Tue, 19 May 2026 08:29:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
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
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
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
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082911_024295_0281C58D 
X-CRM114-Status: UNSURE (   9.61  )
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

On 5/17/26 01:04, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

