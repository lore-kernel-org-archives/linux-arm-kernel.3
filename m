Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0239C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkZM0DTdnAiuvM8+UD5o6XjxAdhuknzBZ7aUuv5ED0s=; b=y2a1fdt/ESFKJ9yTueUUJ9GMcw
	OjeygPHBkpsG82pbXa5/lCMCFVOhDcWm7b1M0IjHLLL+RZxDGOp401RWKO2wwS5IwQGRQIobDu4lI
	sRKvubkwZoo7rx8/kep6l47Y6pj6J9hL17Ko6l2jc4q4geHl3tiUYcUjKnsQ3eqxwZOCk1FXMJ1ym
	5J48UkF1cO1b97pwf/RcyjOokq/Lnt1ADx0swPE9mW4NkDiaNjBuRbvvBm2F3Tmjb41ISJ6PenlA2
	K7I/PpPUe1/yezoA3FeGJXaZ65h6ECeDD4+z7Z7FlP6Lbl5ypih+hwYamG6jPO+ikqyjZA+9p5n1Z
	mjY4WSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SXM-0000000785w-317B;
	Mon, 28 Apr 2025 17:45:00 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SSW-000000077Pi-36hI;
	Mon, 28 Apr 2025 17:40:01 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-aee773df955so5205399a12.1;
        Mon, 28 Apr 2025 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745862000; x=1746466800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkZM0DTdnAiuvM8+UD5o6XjxAdhuknzBZ7aUuv5ED0s=;
        b=lr+UHRp4WRozV1Y8H2k8T/hmRIlzo2/2rYN/tjWupzUjezOMQpU2nb0p5i60odNLW7
         dvAIppCCEiJX6MnaQYOsvjnhbnUm77EREKggjNlcdJTX6bmMTcSVnEPZslRxrCSNw/+k
         6psm/NorThL9E4hARGYShOJftH5BUY95zNl5wXlNBXxS57EwNBCt8AYs7PsVtWGyKNfq
         I+QFzhkrFpEch7k2AFIhg3UB4iV58wKwT1dt47pfse1clLA+7YLW/ASw+Hk8OjDtrFea
         rD+RntgjjwW60nR8Cy+6NJK5Mi3Uuw0QKGTwW3wYaJ0dkl4ab5HZ/7pJtfwFlnXu0JR+
         Rgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862000; x=1746466800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkZM0DTdnAiuvM8+UD5o6XjxAdhuknzBZ7aUuv5ED0s=;
        b=tU9BihFALDVkCLVVKmLsf7fdfcJY8SCVPFgOmCckvnGPx5qAg1sZLY71Y5p6Xy2fY8
         FxAHkBWcOoHxKXkYdxqM1jzlTBfgiST5bBthdVu82o42vH/YIFB/v53Jg4G6vzO5LKrc
         mYrQcpq+hNAs5ofBYcB4j48qAkdfMMfaqggZJ3VB3yoeI1wmlxXaL5vLi9LeGmKp87uu
         rhG6KiIj/IUxA9JPr6FhivQMrOCtN2kKv20pb4NoRRjCEsF0HONy1qFQ9B0V5fn8r5EE
         t9axeHfciv8bpa19236yL6VdgKE+pVxbFWgnrRu0nu85XihT5ECEgIUwyv0acni3J1QG
         Pqnw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ufuCzZUX9MqzMF/e233dOnRWsh6cItC8yGLhz4u6W1ng/WQJjJVqckpd0uw9h4gX4IrR9oj5EEjGOQ34sVLdIg==@lists.infradead.org, AJvYcCV97PZtDyclvNJlHJi6aV/guQ2utVrIe6Qm5yvsKlG3YUxh0ms4V8FjOIM7x3uEuCTPtPdIgLE/0uGIlWsxbyU9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/YeedzZtrxLVAuBmgbxJ1ifEwuLcGsrN6KtPwADrR2B3ShZg9
	iEKTz+BTk2IIdHrUDLRj1kHy/QlJdCQn/I219BeOMPDF+RW3yJOb
X-Gm-Gg: ASbGnct3kZrT7nL/ATyIb4b/ru/c10HQKdneRgl2FtMAJWqk6Kfr+tCY6H5p3USHWyL
	hdMUs96MCBi8rAUkL9GE+6KGKyCw0x0HxdWfnd1SXFczGZpaC4B28mCGTDfZJljdTBZmB0hDCjs
	huYLulC9KyDtBKLZuKUZ1uwWsqy5/Zw5eH4lHn6zefddZVpdycmDeIRkyEi9kuwUmNODAPT2ZZr
	J90vdw7DVND8Wk6B6JiwuWsUkOyK1lRDj8sXVhrJ9hqK2EKN4EPgluhhgUZ8X8M7u3N8VBNTl1l
	I7cnBXPmzZEYK4e1uEz8935EdoJSybjsszHeWR8tKuiZjKgcN2LwAA==
X-Google-Smtp-Source: AGHT+IGAnl22XWZ3hE6CVJurtKTWJl4h3CjdFp9y6JsvA3H9KfOapXTXAl5+O93sKWKawvjCUksDgw==
X-Received: by 2002:a17:90b:380f:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-30a2245d8d6mr110710a91.6.1745861999664;
        Mon, 28 Apr 2025 10:39:59 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77652ebsm7519746a91.27.2025.04.28.10.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:39:59 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: rdunlap@infradead.org
Cc: andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=20v8=202/5=5D=20auxdisplay=3A=20add=20TI=20LP5812=204=C3=973=20Matrix=20RGB=20LED=20Driver?=
Date: Tue, 29 Apr 2025 00:39:33 +0700
Message-Id: <20250428173933.27454-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4c17ae51-475e-4bd2-8bbf-c5e3233ef319@infradead.org>
References: <4c17ae51-475e-4bd2-8bbf-c5e3233ef319@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_104000_784294_94682BF9 
X-CRM114-Status: GOOD (  15.53  )
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

On Sun, 27 Apr 2025 Randy Dunlap wrote:

> Hi--
> 
> On 4/27/25 1:24 AM, Nam Tran wrote:
> > diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> > index bedc6133f970..896f02b9a06b 100644
> > --- a/drivers/auxdisplay/Kconfig
> > +++ b/drivers/auxdisplay/Kconfig
> > @@ -539,6 +539,23 @@ config ARM_CHARLCD
> >  	  line and the Linux version on the second line, but that's
> >  	  still useful.
> >  
> > +#
> > +# TI LP5812 matrix RGB LED driver section
> > +#
> > +config LP5812
> 
> Missing one tab of indentation on all lines below here:
> 
> > +tristate "Enable LP5812 support LED matrix 4x3"
> > +depends on I2C
> > +help
> > +  If you say Y here you get support for TI LP5812 LED driver.
> > +
> > +  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous
> > +  animation engine control.
> > +
> > +  To compile this driver as a module, choose M here: the
> > +  module will be called lp5812.
> > +
> > +  If unsure, say N.
> > +
> >  endif # AUXDISPLAY

Thank you for pointing that out.
It was my mistake, and I’ll correct it.

Best regards,
Nam Tran

