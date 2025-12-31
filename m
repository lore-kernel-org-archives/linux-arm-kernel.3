Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2C6EE57C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtR7PK39BaSx2GpuhvAfss4ZTutnP9LImpMPJNr7WtI=; b=sUf4HGT8aGzsRC8JxT4lkQEekp
	xlqXPiHoWA0fIOXmzUMhjCW6W59qx1Tyalr3X3iryshGSUooI3Lpj94H7MPiGEN7TEeb74ViL5smY
	2OY3J5aVtwcCqaJSlxaljxJGZ4h45dRbjNtxlmhSEGJ9IUhaLTh7oX/Ynj7N9AeudmAocNF/OgPS1
	wG8GkZdlt+qUA6B4F1pU7iuhc4kp2/QIXJWwJli56TWhbJyavzp6nAaz8EMUlbcE6OzBMwx8S36z7
	KZEJ82bcMPKjuv8dY8E9gx3KaprLTnQwVYik+W3fwhqiI50I0gOnEdAwYK0+uSpaNUnWpC1iUgu8C
	sQUwUzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3Qq-00000006Kz8-29dA;
	Wed, 31 Dec 2025 21:08:36 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3Qm-00000006KyD-2eXs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:08:35 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-45090ef26c6so3046515b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 13:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767215311; x=1767820111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtR7PK39BaSx2GpuhvAfss4ZTutnP9LImpMPJNr7WtI=;
        b=DY9dY3++3sSfnWRhK7wZMT7b/ybURL64hCQyYlNLg0T65Zdo6khU1zg2GnOaa0CtAb
         P3gRZCr5H3gbnHc6sKeYmX3F8XPYZbQcY/wx5FABgGh0+CLV3x3xv0/j8rvh2qVwkRTN
         7IV9wQ55sQJe2tKxHG4YW2T+l6t8Z7aYlgMZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767215311; x=1767820111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtR7PK39BaSx2GpuhvAfss4ZTutnP9LImpMPJNr7WtI=;
        b=OcVnCtMY8jEcMwIUoCPaP29MS+jX00TKO51LBhR2jtjK4jNBJ5xe2mqtEawKX0tAZB
         /6+8WXdeVjGcY8O+HeaZMZ2KjWbBjWnn5SxO0DQ0o4OTu2/PVUK1svVs52WKoK7mvEit
         aPdEqxeTfWL6+8OCQZ5m54Imz7e7h4Wc0WUjzAn2XEqV9mZhrD7t2Epus/GVU+jUYUjr
         hL96MaZ2BDLgoi8Rxx+AYoyegyWxkE7m0zD1dDVd2+X1VzXygnP03gLQCPy2eGSpIXiC
         Rv2ihvVQ2oii+MYAHZhp9wwKi2T8UEpJi+iERp6YFrqt+1GKBww9rU+1uyBTVsd6YsD4
         YR/A==
X-Forwarded-Encrypted: i=1; AJvYcCU6dp57qWYwKhds08MAKU4MDXqLVQSvRNTq+hna3xpCpQ8mCf3/ndu/AKss7LIOG74EMI8vPOWdHbQ5qmV9Zhqj@lists.infradead.org
X-Gm-Message-State: AOJu0YxZcZavUz7fOpo4LMn/kq3oocc1XKOunZwEhrFRgI+zFLuk+TNT
	TUe0cCwsYpiui/mMA0NZQxmu+W8ko2kFB0ciqq2pN0cDI531PVOLabcZnqyIqfTJJeA=
X-Gm-Gg: AY/fxX60hfw+Gk3TdEaXkuDtwPbuLfTguljgyiY3Fdf7MeHIhk9tUpA6hkcSqVx6Gwc
	4VUwdUZl0UzGD2/NezTrw8d3S21STAvYtWs8t5nHlPxmvxrrJd6xDsa+OSSR6gsqXlVF/MedRGg
	InojyS3Nj5i5vvDchC3fYhn8NxBlCWtB97OjGIq6afUlI3KxMXTCEsARd+6hmVqKJV/xTJ5rT4D
	Nwcc7WoBefFcbqZzFeroYM5XNLK7P9DsCft4LeTiyi5QbT1h4uTak886lHPQD8lbkBHYE9hcuwO
	4n2ps5YidmVck6wG+gifKtYXqk9Q3JcDnzBTi7BGYoqRPpyLsf9SNkB6uIVkE2N+dHiHwcdj+0j
	Wf9f2yiBy8vNrZBQksns3uLprHkjSeVLJWInHRjueXugkAFXbGys+PlhIwlDNEIi1AAYhx/uQvz
	Rsh9LVVHbcU5Lpy/hxxSZg/iQ=
X-Google-Smtp-Source: AGHT+IHTwHn1nXDjbjmhskjWx+MgiaHwYI6WYS1jGtnZhB7g8+LiP9lF5g92eNpfucMrdW9R4flOrA==
X-Received: by 2002:a05:6808:1526:b0:450:3ff9:f4dd with SMTP id 5614622812f47-457b20b7730mr18285141b6e.24.1767215311322;
        Wed, 31 Dec 2025 13:08:31 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4598c356623sm12481094b6e.2.2025.12.31.13.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 13:08:30 -0800 (PST)
Message-ID: <8b3d207c-76a2-4312-a149-724e55fbd0cb@linuxfoundation.org>
Date: Wed, 31 Dec 2025 14:08:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Eric Biggers <ebiggers@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com,
 Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
 <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
 <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
 <20251231015712.GA2299@sol>
 <fdebed60-264d-4f05-9423-618bc3ec6d6d@linuxfoundation.org>
 <30d14c51-3325-49be-9510-43f4661ff6c4@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <30d14c51-3325-49be-9510-43f4661ff6c4@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_130833_069375_D0B9B208 
X-CRM114-Status: GOOD (  20.13  )
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

On 12/30/25 21:07, Shuah Khan wrote:
> On 12/30/25 21:00, Shuah Khan wrote:
>> On 12/30/25 18:57, Eric Biggers wrote:
>>> On Tue, Dec 30, 2025 at 05:27:13PM -0800, Linus Torvalds wrote:
>>>> On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>>
>>>>> I would recommend reverting f804a5895eba instead of trying
>>>>> fix it. Then find a better way to eliminate extra newline that
>>>>> shows up in dmesg when firmware build date happens to have
>>>>> a newline.
>>>>
>>>> Yeah. Let's revert it.
>>>>
>>>> And the way to fix the extra newline is trivial: just remove it from
>>>> the "dev_info()" format string.
>>>>
>>>> Our kernel printing logic will add a newline for the next line anyway
>>>> if it is missing (unless somebody explicitly uses PR_CONT).
>>>>
>>>> Can whoever saw the problem confirm that just a revert and a "remove
>>>> \n from that dev_info()" fixes the output for them?
>>>
>>> That works for me.  The revert by itself makes the FORTIFY_SOURCE crash
>>> go away and reintroduces a blank line in the log.  Removing the \n from
>>> the string passed to dev_info as well makes the blank line go away.
>>>
>>
>> I just sent the revert. I will try removing \n from dev_info()
>> later on tomorrow.
>>
>> My quick trial still showed extra line which didn't make sense
>> to me. More trials have to wait for tomorrow.
>>
> 
> Hmm - there are 3 places that print build_date in  mt76_connac2_load_ram()
> 
> 3022         dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n     ",
> 3023                  hdr->fw_ver, hdr->build_date);
> 
> 
> 3051         dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n     ",
> 3052                  hdr->fw_ver, hdr->build_date);
> 
> 3127         dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
> 3128                  be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
> 
> The last one prints %.16s and other two do %.15s - is the fix simply
> changing last one on line 3127 to print %.15s - this avoids printing
> the extra \n?
> 

The following change fixed the blank line problem on my system.

Mario, if you want to send this patch after testing on your system,
let me know. Otherwise I will send it.

==============================================

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fba7025ffd3f..0457712286d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3019,7 +3019,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
         }
  
         hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-       dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n",
+       dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s",
                  hdr->fw_ver, hdr->build_date);
  
         ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, false);
@@ -3048,7 +3048,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
         }
  
         hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-       dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n",
+       dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s",
                  hdr->fw_ver, hdr->build_date);
  
         ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, true);
@@ -3124,7 +3124,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
         }
  
         hdr = (const void *)fw->data;
-       dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
+       dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s",
                  be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
  
         for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {

========================================

thanks,
-- Shuah


