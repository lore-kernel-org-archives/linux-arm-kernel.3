Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02DFCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J93QDWWtLOTX1wvAB+lhHDAb2H6FMZC29/IawhQbAQA=; b=cXzn8FklAmK8+F6J9WaANDQob5
	NbvwIyDbOo45ETq0UsT2WJY1o6UpYn+/54rev+rFvpuB4NuWQOjcRtIKnNm/jwk5iZzLFZ6QViN4r
	3McFcCbfE5dRjpseWGlX/Vy5l+eMmtOs8oS9jY4oAIz+V93W2cglx67A3x/uIfIFRq1TXkMX4U1+a
	KQzLBy8AxHwyqjyzzR7yPmJWIC9BJZX2W9UTHJ++K9JWhFkv/+wc1u+X+Uu09tNViYYHvNuELC5rY
	dC1X4YSj+cDwiCQNoVQtoLSU/jdO5le/ykSFGpEymFcABWR3iuSl2loDv/2vEuqYIFGYDc1/mtxbv
	Ow/Ln47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMLV-00000008Ali-0Mrv;
	Wed, 10 Jun 2026 17:04:05 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMLS-00000008AlL-2mUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:04:03 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-304cf518c9dso8740762eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781111041; x=1781715841; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J93QDWWtLOTX1wvAB+lhHDAb2H6FMZC29/IawhQbAQA=;
        b=Y9DSfu8HTZ4kGwk7/GUc/Scsu8R9eYUplBRG4s+NSuZeN5iFneL0QPlmgeze0N3xHt
         uNZmolJalJOZa3qLSvSOq/N95gwm46ghyhNlZXUA38arJltCt4DDmDSrFPzHhecy0mUJ
         7vb22tu3BzU6h+pfwu35FJ0iBoSFvZE9vk+KYvJzyvZJIpParE4uakTf4P8tTgVH2ojf
         BGj6TJK5Xuzz9GcyarvpSqNh+/BlWHLImzUywHGjnZhMvnUh/U45LOjE114XIre2ZLF8
         a/dzf670Cxy+5UtLCuTsJ438KnsEK4JrKpFkhP/TqQYUzVfAiNrE5ZvAW/K3MeDVkeoD
         mA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111041; x=1781715841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J93QDWWtLOTX1wvAB+lhHDAb2H6FMZC29/IawhQbAQA=;
        b=LgnnLYfbOFoGB+70huagQmM46P7kSKyW/L0FtgI/NVe/qOTkOaXxwL+NvSGW1jjWoG
         RQbYDWcGLe2c32B+IBO8gY40cFBcM3AomMXRT4hGyRIsf6q0Tjry8l2f6mzsbaDn7jgm
         5Jhghwh3+pTmMh61OxGWEFsIJVwcFebFwgpy2gV4e+/laNZCHRNe0ySU5J1frGJh3cff
         PPS3YxnxIbZDqq7izEhyi4lq8bsjOyLlkJaSpuAIT9l+0P/t1y+t/PpwUz23bT1h5uHT
         dEr/VOo/Oyy5Ji4Yj4IGi/F7GNqwgLl/DNqRsjTBgtiQjDiuvpSGX5QzbMBwTzPixPw6
         WpkA==
X-Forwarded-Encrypted: i=1; AFNElJ/0JUETifuodBhSrV83ZdVEpTlOhDF7Y+5muGGgwBL4WnLhYDBzQ25rrO79puA1LCTV7iRwE/s8TqlP8UmpwOr+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6kKjpTYH+xkYtTXTCnW6A6oQlo+8E1cC47neqhAZiithx6e5G
	TP9DUtoy0KZ9tz5b43oAwLIDTZ3YdG1N2L/R/6vJqHsq7GgxVEfBojlp
X-Gm-Gg: Acq92OHYo2t5DEeU71Bxcb+U9K+LlDuxo6ENrSizniJkGItd1d+e6FYZpW1WPSnIqQM
	4QqV61VA18L5MVp8ryL8rYYyW/phSvoQAd5sza3Zr3z9diuNdQ3af34xvrU4a7Z4yybpZ2ErOP6
	vAximkTYhSUXWkAh41k/NXJppb1NgURq9rPKwAEIJRVvYqfd9zLcDMMaohCcc9K+YfS6wP95Sy0
	ZN3aJkJvkv5lzfNdjNQCWAK/8R21MLhC3A+q9Dcc/Wh/HGdD/UFMPCjgGAtE2fZ0g3b1U9D9uUM
	Ls85VwOy//p/4/fgFdHORAocRZr+uB6ai01rlNN5jHiC1onxGR05VpHz+UvbZ2G1UVvafUvwEl+
	x3j/SlD1NomdK9UPOWLUPkLqb5Y20imUnr2Fz2/Vom2MVJzJz6gX8SOT4fXddPIp5LYsC+Pxzml
	R0jhqNwfcp2N7K0jHbDtnnFHEirvyCoG7x07r+qqjrmRtbzQDDIq4Uj7+6XbIllnjREhsxInH32
	wo=
X-Received: by 2002:a05:7300:7313:b0:2be:7fc2:fc38 with SMTP id 5a478bee46e88-3077ae89f68mr16554448eec.5.1781111040802;
        Wed, 10 Jun 2026 10:04:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ae0e:e075:91c8:6570])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f9da69sm18610159eec.31.2026.06.10.10.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:04:00 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:03:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-serial@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] ARM: footbridge: convert to sparse IRQs
Message-ID: <aimYkTdIAoye5sEG@google.com>
References: <20260510052107.555825-1-enelsonmoore@gmail.com>
 <aibz3auoiq4CFa9l@google.com>
 <86765df4-0d2d-435e-85d8-b9bd4f3ea85d@app.fastmail.com>
 <CADkSEUhh1NdOMTHVsErhqzyCpDGFA-FkNFaWp94e9LnB3njxqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUhh1NdOMTHVsErhqzyCpDGFA-FkNFaWp94e9LnB3njxqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_100402_725424_24260ADD 
X-CRM114-Status: GOOD (  14.31  )
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

On Mon, Jun 08, 2026 at 10:13:50AM -0700, Ethan Nelson-Moore wrote:
> Hi, Arnd,
> 
> On Mon, Jun 8, 2026 at 10:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > I think this is correct, as footbridge is the only one that selects
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO and defines I8042_KBD_IRQ on arm.
> 
> I came to the same conclusion.

I see. In this case:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry

