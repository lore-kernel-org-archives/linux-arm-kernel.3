Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5C9CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 01:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83BoxqtEa9VPOLHGoNG7qoF5Uy8DWXOM1R/kh4ik3Hc=; b=vYE7mq7kHzht3SZzfiyFSTuKIM
	7p2BHFSqoEqz/ROhXgvf1DFBMfiMjkQy/KRph0WhiCdk0OAofMzNukrwySFB5OFGhMbfQ5kZ8Qwxz
	fWJwpzi1vWhzUwTW53COwkKMYf0g4gvhH9/KrIocX0nJw3jD/W0+2Eos9Cf+Iy+pSF2WA1sSq18cw
	Dty+l+lskDMR/ZRBC38xYnmkzZUV/4vcwV5c8dPxINuvKd+yJzlnsZl4P4Z07RthxqCTPY3nHsCel
	rMyfca2P2vrfUyBa4ZVVSMPBU8TMdWYbHnrfJlLtofEUEnhZsovk4KpjKcGE1WDXe9qImOjfTm+OV
	FXzuVP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPslt-00000002ktJ-0Iqj;
	Mon, 01 Dec 2025 01:32:09 +0000
Received: from mail-pf1-x463.google.com ([2607:f8b0:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPslr-00000002ksq-1FpK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 01:32:08 +0000
Received: by mail-pf1-x463.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso4225343b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 17:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764552725; x=1765157525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=83BoxqtEa9VPOLHGoNG7qoF5Uy8DWXOM1R/kh4ik3Hc=;
        b=o6Pu3HJaAn/ysNSAmMeBabpvAq5dTgfni+ssXOxzc93nZ3crFUSzuFjSFIZJmrQbcW
         uPs21HfC3V8GI7Mc5F/l8LO7qa6sxNLax5yd2xOIshyKeon+c/OpQmtLgJkG13uUKr32
         RR1UiXO9E/fsZa+N/a96pRmv9KJnZSre+Y/ZaLWXP7dvJe6PrOrpz2ElPxUFr5BeS6oy
         x1d8H17HrlmGTbhF7v8TmJ90sZV0fHmNx3BUwK1nk9qRAD8LL4oBfRw9/sEWM3gCD+1H
         71zAsH4PzWVM5GoOHU3bql7x5WqTC4L2VivIJuOvHEH9K2TCdQwWw6+Pa8XtTjg6Rv0E
         mKSA==
X-Forwarded-Encrypted: i=1; AJvYcCWenUBnZ8dInq/VuuEvkRbZf8GvTJblFu4bNXMYc15LmtLeORHu/46aFufp8+Bd7mtVTX3iKbKty0jjwuvv9zlA@lists.infradead.org
X-Gm-Message-State: AOJu0YzCGKPTQ6BF0AkuCvs/JD7yTQSpSevR18fxotT7rLWZ4jucWM+t
	KtouZuhvR7JnCV0TnYcNzmunkjNckYYvu8Qi/PnYyE5VJiuMU5xm7v8FiOmm/NV77BfhIDLXIKz
	/hLu7UuK7spKd5z1d5L7fjLeqsxNXY64KRqHuwICo+ulBf2BZm4brxeWHOq4h5HgybaoQBI9TXW
	srM3FSjyxV/sI//jnJ9BgSLto2CoV4dSn7f321tnxrB9CYvrlRo65jieBiAKi0FFGDYmYsTNQLf
	CftRgu7pzSTEpKHq9xp8uox79EJrUwSEGA=
X-Gm-Gg: ASbGncsMx+HDs6SVP3KvqryyKeqPUfvXKRCj+DN6XsgT1XijDqbn1GJ6plQzrvDh/0C
	MIi+HlA6UEj37/WltHtZMWDKc6U/KFTrreXq/M2Em1q2MqcHm+oe5ofH0icVGsCUsl7Ssewc+I4
	QHwauqNSZnu8bYb2mkqI+rDFcYT5A+PtJK489Avr21tHdCmpXionrGzlG61/e0dvAp5ju3QfqqS
	uYcHM14nt6LioqGcIbuQU9BE0mHF10TU+syEdk2zP5lcJX21jbpRJCgODedksxhIPkzZhkSpFrW
	A9UzlPVbWEzvg8RfV/uR7blKislYDL+UWx/8WCXEYaJ73fa/9lJpjqGLZaFBbVS3jHEpF+3DIgO
	/7fVfjscjlc3oUzSR0IbJS1x1Z5+N5e501LsmseWZcngGfoAHz0iXpcdTaOSDfTHpGsrxoaBABc
	2gV0iXSA0z0OYV7KDUxUvVj/rnXBnFnPJdnyANUGdrKjyb0LammSRm
X-Google-Smtp-Source: AGHT+IEcsNJtGRdDdk/lraUTaeTMzZTD9jax85RmbEm7On1eCMNW1XDgGI5PNlpa1DM0FpQw5TzPJiJwoZYx
X-Received: by 2002:a05:6a20:394a:b0:251:43f5:cad4 with SMTP id adf61e73a8af0-36150e2cc59mr41026261637.10.1764552725363;
        Sun, 30 Nov 2025 17:32:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-7d15eaba9fasm774309b3a.8.2025.11.30.17.32.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Nov 2025 17:32:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34740cc80d5so6234113a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 17:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1764552723; x=1765157523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=83BoxqtEa9VPOLHGoNG7qoF5Uy8DWXOM1R/kh4ik3Hc=;
        b=ETB+P2QCUNBDTUTO5I1TIGEP72QffkwOSM/xqeW/XFhS4EVjIkISt4hQGYgVLyda8e
         Upm+QO1oz6QzUfXkn2LvYE7M1abPKSUFvr9PLez9DCQZTEU4HSoFqEY+z8cmPyqBQnYQ
         xadC9xnqoVBIHRRbnZds2UyTvrL+J5YckCs3k=
X-Forwarded-Encrypted: i=1; AJvYcCVQD6XvkGkFmDPmUcE40WGHH895OV4hpq67oDZzlVsJzt+fJkmSAyqRhkIwfbvu42wwmsre3yQq/KHWmqq2CJJV@lists.infradead.org
X-Received: by 2002:a05:7022:2082:b0:119:e569:f27d with SMTP id a92af1059eb24-11c9d8659abmr17756537c88.38.1764552723534;
        Sun, 30 Nov 2025 17:32:03 -0800 (PST)
X-Received: by 2002:a05:7022:2082:b0:119:e569:f27d with SMTP id a92af1059eb24-11c9d8659abmr17756520c88.38.1764552722976;
        Sun, 30 Nov 2025 17:32:02 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb03c232sm52303449c88.6.2025.11.30.17.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 17:32:02 -0800 (PST)
Message-ID: <a6de72ce-3dc0-4259-b0d7-6cf385031fc9@broadcom.com>
Date: Sun, 30 Nov 2025 17:32:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/brcmstb_thermal: Use max to simplify
 brcmstb_get_temp
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251130225459.46241-1-thorsten.blum@linux.dev>
Content-Language: en-US
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
In-Reply-To: <20251130225459.46241-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_173207_350266_0D0C4703 
X-CRM114-Status: UNSURE (   7.24  )
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



On 11/30/2025 2:54 PM, Thorsten Blum wrote:
> Use max() to simplify brcmstb_get_temp() and improve its readability.
> Since avs_tmon_code_to_temp() returns an int, change the data type of
> the local variable 't' from long to int.  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
Florian


