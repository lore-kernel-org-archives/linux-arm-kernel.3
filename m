Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E4C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8haZuXHqwNt+r6E2/YPONG0WE5U91vsPV7q00D+974=; b=KYcZ6uGnUS9DClOlsQxjwOOR4n
	5Z/8gm/8i+zpCdj/J1dPwYuxleIJkSfOzoTivo3bSjkolhudNWJbZY64MTI5W9kllN2L7UAeJ1/pH
	zOyY0jwOMDh0Ojy1Q91F8ee0zxtQ/KN0LEwoRiFFUR7iajd+CbDjVeCVbidyMdedOUyyjglkqki3F
	VZMcH1kethCiNMIHQPXNEeNQVUArNh1FQ2w/E2pp1kFbTLfO7GQFreIEvZY/fpU6VKtGO5BjNo26v
	A1p9iori0uTTBiwuIl6QcFd4XCOrzhnlQStpGB3XNHlAoLp8kVS2VC0EIC2Z/QskpXkwqH/OU0tee
	ZfQ9VkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWiEh-00000006f2E-2Acp;
	Tue, 01 Jul 2025 21:09:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWi99-00000006drY-04gJ;
	Tue, 01 Jul 2025 21:04:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4808182b3a.2;
        Tue, 01 Jul 2025 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751403846; x=1752008646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8haZuXHqwNt+r6E2/YPONG0WE5U91vsPV7q00D+974=;
        b=KhoqqEj0FiT6ZX9DxydX6xMagTXupG8fCY9VWUW14dcoRS48N0VEm6whRc+cg4Ji6/
         2GZrNjQ1RUY8peS6mdvJ/0XSACS30ZDQaeRz6n6vUZJoZ6rCI8DqEEbHhVNRKW/psjrp
         Jh4srAD7WL4yovdWj7ap/TZDDhckf1MPS6KrDro9z0MpZCN8GfeTInyeLS1Il7RuYCnG
         +6qbxJv830fH6fd5zdbreRLzd2MZmIjmfkqO3x9r1LkKC4YcrvcZQBYkZ6uMdDSJjFKU
         F/rvDF6CVgvLmHwQss9Hsol3HaJZg8znM4qHYmw0CVH+b2PM4RMNVfz0Jt3gMKbHPVzi
         XhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403846; x=1752008646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8haZuXHqwNt+r6E2/YPONG0WE5U91vsPV7q00D+974=;
        b=BuRtnwtVYPtZ35cpsBcssrI1/YlSuOAxmqow5RPquvVO43cmpqoNjaylC5V8kSfGs8
         tgz3ArI801CMA5kwhiC3EiHW4Li8RLVJtMBD2W/qyrza1/x9eXP2Hnw1Bfg51prjJqJx
         IwugfDI69CRlLtiij1Nkuv6KDlrgpENG0yWw5hdG9mQkKziSMGMuNYblcMmb0yrXnIDL
         nKgZ8Eg8fzcccZHj9Dee/y/BSR15UWJ3ImQ/ELgQ2C9jA5BsKp8Sf0fBtK5Q1hJXPEE/
         +ttxuKSA6qybGlkVhhgOD+vRQX6ylNmSQQ1vexWJ89j2FzKCwfVGm7Y8ft7WXo5kEOJ5
         QoSA==
X-Forwarded-Encrypted: i=1; AJvYcCUh4LYPQ/vl9k9RsUqL4oBtAHNTuPwYqAjqkbbyAdnQg6CUiUReHdrQczCYz/qVY4bxmVircdV7kOEZQySgEsI=@lists.infradead.org, AJvYcCXmfBnLhfm8GGiREGC6J7vZXeFQdR7973kx4TAv0yDZaiLN3p0WfFZ1LIxSkZEJMBolk472TL45TRoYzzv0l7FM@lists.infradead.org
X-Gm-Message-State: AOJu0YydPbUnwPHRaOkWsatQ8SZFcq+QcbsEMCxrj+VDbQtsvNOv2j/d
	PcvMxP1HPC8gfTHIsNIJOPjfXs12eJNRcb+zAXgUyTpWso3tJWtWvn8E
X-Gm-Gg: ASbGncsn4wgpQCHFZxMUDie4kpyghAQ+vjahOhIjw9rCGzpgJ4xysMs2P/e4oKir/N5
	R3Mpt6DbwEYHCyUXYCLiPAB6xaIVwtFl/h4oaUYCBvT4jYgNX1Ja6TJ6wm3XoDt/8bc9RPdEwCn
	H2SQ7cI5FfW1qAqEz28ZUVB+xVxEob05KPdJhWJa0iVW2YbmXwTUuUswZHHBwYi6OafaFxKgzD2
	xeAT5BhgadX4BSCuXvSGHzO/F/1mQN8iz60YX15iirU4Xkstl/UqzskX+ulyJvyYZ3XM0n74CbK
	3SbWFY3iJmQokZUhki4uEP5xK6k8jTJX4xZSWewSoZzUzTvknOdNQqZvDa8cewsHblzOQL751w=
	=
X-Google-Smtp-Source: AGHT+IFGG15vn4olJHlquF7uHoRYBkOkcoz/0VL4VevfvrjtjKRPxqONxSTucdBuX4zgx/REtRNYGw==
X-Received: by 2002:a05:6a00:2349:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74b5149d55dmr272257b3a.11.1751403845652;
        Tue, 01 Jul 2025 14:04:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5573e71sm13467887b3a.98.2025.07.01.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:04:05 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:04:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Fabien Parent <fparent@baylibre.com>, Reported-by: 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org;
Subject: Re: [PATCH] MFD: mt6397: do not use generic name for keypad
 sub-devices
Message-ID: <vhbngoyykm3n2rqcxoabkimt5mzamsqy4talluzy2gt3ddtbfg@4ouxfz57s5uz>
References: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
 <20250701105811.GI10134@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701105811.GI10134@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_140407_058315_E1AF752B 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, Jul 01, 2025 at 11:58:11AM +0100, Lee Jones wrote:
> On Mon, 30 Jun 2025, Dmitry Torokhov wrote:
> 
> > Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
> > make sure the keypad driver will only bind to the sub-device if it has
> > support for the variant/has matching compatible.
> > 
> > Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> > Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> > Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
> > Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys for MT6359")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> > This is not tested so if someone with hardware could try it out that
> > would be great. I *think* it should work...
> 
> My suspicion is that this will not work.  Providing compatible strings
> here is only for device to node matching.  I do not believe the drivers
> will probe using them.

Actually it should. If we check the drivers for "mt6323-rtc" you will
see that MFD core defines a sub-device with this name and similar
compatible, but the RTC platform driver only lists compatible:

dtor@dtor-ws:~/kernel/work $ git grep mt6323-rtc -- drivers/
drivers/mfd/mt6397-core.c:              .name = "mt6323-rtc",
drivers/mfd/mt6397-core.c:              .of_compatible = "mediatek,mt6323-rtc",
drivers/rtc/rtc-mt6397.c:       { .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },

Driver name that is defined in drivers/rtc/rtc-mt6397.c is "mt6397-rtc"
not "mt6323-rtc". 

And if we look into MFD core we can see how it works: mfd_add_device()
scans the main (parent) device tree node children, locates devices with
matching compatibles, and calls mfd_match_of_node_to_dev() for them. The
latter essentially copies/assigns device tree node to the platform
device that is being created, compatibles and all. From that point
normal binding rules will work and they take into account OF
compatibles; we no longer need to have matching platform driver name to
match.

Thanks.

-- 
Dmitry

