Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E00CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZiieBGzgeTWDXPUpLFCSn69qavVvYJKylSI1VGv3c8=; b=o6aDc0V7WtyDeQk8/THdjj6RPm
	ywJ87colclE9x9hpm4JUOrKQl3H5R9ONIn1qVSQxhERL9qC562O8DwZW1HATa5ae3Z6GrtbR0+hKZ
	MifHC/jogic6whW/Pmm3VCnVaFfPwzyCZnBQ0BLw+pY/KkS0/ITNQnGgQVk7jrYsP2jkKYgfV7e6g
	KCniAK3Z4FsBWM7vRB04EKVNBExDzY3Ko713Nd7iZVdGZ1aZsF10WWRrwWe2Z5XjWG40XKOoeSo0P
	+lpls8jtt556pT+/seXLYuNkVOcn6x2LZeKosm7izrrRC6mV8MKuBIvM7Qzv4Cp9i6Z5EHbWKHi1a
	oUdvnNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1t-0000000Fzsc-3BEu;
	Fri, 05 Sep 2025 02:18:21 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFQQ-0000000Dqy2-3Rag
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:15:16 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-b4717543ed9so837939a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 12:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013314; x=1757618114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZiieBGzgeTWDXPUpLFCSn69qavVvYJKylSI1VGv3c8=;
        b=ujEA2d/NeZZ9ZxFZE3aczlrQUoGdcfgMgIFvDqg67bnJN+bpzK6y2uB6eUl8Z06HEH
         nRxWGBdYkrY1zUz1Db9slz0M74LVSEUfels40qxHsQrIYTjka6qBI2Dxy8hNuLZc0Dc2
         8mvC73jr9+pZkOD+JCxPQLkptXfdUuJteOjMqIGdFFOwv464Uqxj9ChZttqt+VihQYgz
         QwRl61Dh45X4ym+/nqlh1/WbeU/WpvK7hAMpkR7i9CuQRBFsLnLFl6TzK6jy9DBKwgMM
         JbNnJWL/hdPW1lIhXsvRmJRlDxI0nuQkO3+kYKawmlZxFfjbEr3Bfc4bain8dwv6v5Cv
         y0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6MQQuSQLkfyd7TLTLTzOf1S2/LiFcphsoG5Rp/55GPl1YWA5JrSN/e3zIJXJj/JiopMAVBGMB4MlolRLJoQSt@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKSC7H6da3LCap+dvqJlCU2zv13urK2wMa6AuiIX4CjVXGGtZ
	dWDEDmOL6oI3oKIBA7JK+KFUxtzXc9Pdw9SS3WkgmMGVdXy+7zRHDhOzgA3q881ULEQbC9Bo23C
	FdZuwPa8qzOkx7y/kWHvZzCVI4z4zUWqygZKuGhruW/EmqeW9G4ZgdRyPDfINL7MDK6JJd/NzVM
	NbQo5sWfqqnmxSbsiqads3tumcvbG47IRF5n65hxAZkOm8NRIUsNyNOnie2vS33KRvgkstz7OPr
	rTT3l1yTO9TKSvnRZ3C8JcqiXuH5iOdnU0=
X-Gm-Gg: ASbGncsQCaHSHECjJ7do27POs0cssiMb23XvZ1GpzyBL+kZPihnga161YFAbHkCFg+E
	Hs5efrBUuCFmQ6SaJxgMHTXX3afIwc4hJNYXUmPI3SViXZihkgIpErBKOyFSKDvT4MINCj/ph9w
	vKQhXSyCE7ZcepGs70RyIjn6Xsx4iH2J+dNlbY2l/RAQWKrAprd9Eb/XqXpDfzQ1NklIW6Xf+rg
	+m/mnC2HY1GV5YX2NVUr/gBlaSw1Ne4xo7vVP+lDWw82h7aQgOcuqOTO6DIre61f4r8NJQBeQtL
	ZOXrgmGGLWKsYVTK4j/xgYmskpVDesnqzzHeg5DHqN2b+qd70HmdrmXKqU+9YzPDH+5ZR3yw57k
	dCNQ4tKbyDrL2BzTVFKCkw8pn3d1HEZrtenCZQRgXmc371KvnY50j1N9iW60fbDZm8NYBP6cF1K
	hVsRagkLg=
X-Google-Smtp-Source: AGHT+IFWtg8M22PqnDI/okO1DknLyrHagGzE5+RS5zJK5lxv71nC4MWaKyazKyXMqvTpc3lGlcqn5TjO9JKa
X-Received: by 2002:a17:902:d2c7:b0:249:d3f:d238 with SMTP id d9443c01a7336-24944a1b54fmr307688155ad.27.1757013313873;
        Thu, 04 Sep 2025 12:15:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-24c92eb083asm4509745ad.41.2025.09.04.12.15.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:15:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-80b27b09051so263116385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 12:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757013312; x=1757618112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eZiieBGzgeTWDXPUpLFCSn69qavVvYJKylSI1VGv3c8=;
        b=RR46VVkjR+Reok2PtASuqFMwFnzJoLUNrCMJRuYPvRdlyJgJth73nNHtQx8BgTMHm4
         vMUz8cXkBdBYN4qL/L6326krEuz5zLH6ISEl9+mRjGEVit+CT/ErKnH5hq5FN2Qsaut0
         RfKQFStDXOYg62FkM0i2tlf9FKxDIAZ62/zVg=
X-Forwarded-Encrypted: i=1; AJvYcCXfjGPJgAPDUmO9NVjFTIQp6P0QW4zNJYD/IPzy8DF2zHhbUPPYx0RRMjKvMXCitLKGugu7zhNoK1csIqvTdscO@lists.infradead.org
X-Received: by 2002:a05:620a:45a3:b0:7e9:e67e:d068 with SMTP id af79cd13be357-7ff27b1f7e5mr2273628085a.25.1757013312052;
        Thu, 04 Sep 2025 12:15:12 -0700 (PDT)
X-Received: by 2002:a05:620a:45a3:b0:7e9:e67e:d068 with SMTP id af79cd13be357-7ff27b1f7e5mr2273620085a.25.1757013311273;
        Thu, 04 Sep 2025 12:15:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80b105e1ce6sm307324985a.67.2025.09.04.12.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:15:10 -0700 (PDT)
Message-ID: <c973d935-579b-42cd-bf92-618d9f9d4eaf@broadcom.com>
Date: Thu, 4 Sep 2025 12:15:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Linus Walleij <linus.walleij@linaro.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wahrenst@gmx.net, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
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
In-Reply-To: <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_121514_900736_ECBB85E7 
X-CRM114-Status: GOOD (  12.12  )
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

On 9/4/25 12:06, Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>
>> This driver provide pin muxing and configuration functionality
>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>> instance of the one used in Broadcom STB  product line.
>>
>> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
>>
>> Cc: Jonathan Bell <jonathan@raspberrypi.com>
>> Cc: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
>> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Patch applied!
> 
>> +config PINCTRL_BRCMSTB
>> +        tristate "Broadcom STB product line pin controller driver"
>> +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> 
> I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> because Peter Robinson told me the Pi5 needs this driver too.
> See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.

Good call, thanks!
-- 
Florian

