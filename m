Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261BCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=; b=XpCoDnYCq9U6OrB+60Y8A0rnrg
	d5qMyCe8/I6OJcFUGjusIs6Hb2TZjJhZm5pVMB3fhnwY5+WYZcgD1lPS2YUxevGCJo/EWlcm/wAa8
	jLGdk+Nhq8ySg6DjQCNQFkjhwBe9tC34qDDPh2vlHf9Ju3PcOXew65yvrgruraWdtOITa0+7nxnWt
	ICdatGuXryFvUGxv966thGSHDKQH9hOSSOENYfAMcu1jdwDRRIuWfDe+yY72RYi5rrrDhFLzQqs8n
	lBHOJoJdsGE88mQo78UFC2OFuqN3kClb+DdqO8b3FZKpstCZBba0c6ixJ5t7yQRGhbIlsTah8kHNl
	s2NhTodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp85-00000005Lgl-0fs4;
	Wed, 30 Sep 2026 07:53:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp83-00000005LgW-2xSh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=; b=CnwrmCuzNVmcrnqZPZpvlh5xwI
	P0tRFzSCgh/VPStxMf1KAQcLRGHT0nebYGyDAIooJ6N+Bbfjj3ijFpknvYuxIJbuHbNbsgjSpytzD
	+6jUjDdE+YXHBtPrpOza6uoLz4yf8cc1U7oVI9UhCJoQCj/syqVnYL74yTycpNIUuPAXvc4Eohuu/
	YwM97W2hPD02Lu2jkTtr19QCsWs0IMEkqpWbFQ8DiRK9QEvoL08wd8LB4JaOMsAB5HwL8zFePpjra
	158yZ2yIX0Jy3zAwv8qSHKfBkY0t6Cw4ZskpQOI2L10/Vf5C7qIJNgV12tCRtp9Ot/G9BOOstCnhb
	GIuvO0tA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBp80-00000003Utt-3eXU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:53:26 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so27485345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754803; x=1791359603; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=;
        b=Kv4pFXUoIuz2Lc+q3KOpVw2uAu83d/mnh7j7PvLPIO/fX4qSqqtLUWnjk/2jEKPUOS
         ZQaWKFbDLLWa/W0GVdtC2B9r2RCfJ8a0qumGKObh2p0dLHXqIHIu91O7+0ifENKeOR/d
         yEncq9a57RvGwu/sYc+KZiiI4u1IpDW77I0JrCpKfrmkZ5fdd72nijeNG6TX1p/OazOP
         BZmzqsUNtbYG/FG1NakDD2wZbqXNj6P9Th1vQPCpw/0mwbITAEaYXvBpVyEJMyE45UqX
         2UWT5p+rY3q/YlXAo9i0QLmVTx/JHvhsMdmDOhxaUohZEfc3JWZzKTe4FLnkFLEl+r2d
         Tmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754803; x=1791359603;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=;
        b=RaG5msWzoT89feRA2F8BoFCUXdcyDiStRjUCQUg5R5nCdEBCQTBDG8OTn54lYpxYdB
         oJT89c7FOafrgsWiESdrRtenekSneF3XXahDIh1jJvHJlvFBvsPBBIOmBVF7IoDvWqsF
         JkdZdkx9lspSYyNodZSvoM9tfSLFot2Itp+BMTx3Ew4PzXqan5vpZMzkC6CCgOBDp947
         BAS/mWroppCnoA2KSAF1KSpPjynFW+Bzr/I8ma/8Th6Vpj9IsPhAH7/5IRiNVJAVkx2B
         gWH0d8KhWm7nIqaESFFIan2ruXWKUydLoQbSXbtoppHmd9UutUl9PujDaXrUyOGHOsV7
         2hAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYfo8Kk5XYpnlJGOeF69XL9+I9bLWHC2Vybhqoy3cdqeriluKFI1ETKcg8rY2vH+K8kkpQBUTAb/3BneZnIRwa@lists.infradead.org
X-Gm-Message-State: AFuF++mCkNOGrWOV59gi/INUzLO3Ozs2/a4BGuhecIF7IRILTh8q5z/a
	Vxga9plcsXG7t+skgygwsdIlbJ2RodI7N4Cd8uQeulC9k5HNmgN0ME5L
X-Gm-Gg: AYBFou3DkTil/FpmCa4UK9mk4TCRuOw3Ah2xMcSrN/o6ikObUHdsX7vlA1ssy5E/uuc
	7ztEuZ2BL5UQLlVheysJ740S3f0VFQoPxNEoihYbada19aIwekTcxtyxtP2vqfXus/tZTqhwkig
	QdATaKj75r82qDcfGn115p2+jLpfC88PtDnrq4sKba+Fd5zqOh4K2fE7k9w9LkgSgYZ7XDhaKgn
	D+7vlWWfvFnd8ES52gCgoShFqNO3ruFCJWYdZLO6K2kDqRhA/+Wf5k1v++/hqaThQgRWfkHF0vA
	gev2xY6d+OKpxdzv0TBM0KN71JoKVCXxM2QUNj6mK2G09JSWhVaqJHcD3g+tct4H8p69TTXMHYT
	YB2XHpkk1kDQ/i77kwQtZUFY4fwv/J0hZbu3Mi7QCVIiARBTi9xDmk4RhN20Baoeh60/MIhrVIK
	Jxivh6PM8uay3BGbser582oJa96GNbx9Kpu8aZaD3tsrOp7Yn+I0M2S2o7UtEadEB539QPWhcJV
	xu9pD8/nDsBrCRBdt5SqszcUOmrNzQ1
X-Received: by 2002:a05:600c:6206:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01b01b8c0mr8229045e9.19.1790754802651;
        Wed, 30 Sep 2026 00:53:22 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0175208e0sm32306225e9.7.2026.09.30.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:53:22 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <2026093046-scheme-fastball-59c4@gregkh>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <2026093046-scheme-fastball-59c4@gregkh>
Date: Wed, 30 Sep 2026 10:52:24 +0300
Message-ID: <179075474429.2320278.397112083512309038@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_085325_041325_A5D005BD 
X-CRM114-Status: GOOD (  27.95  )
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

On Wed, Sep 30, 2026 at 09:14:34AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 30, 2026 at 10:00:06AM +0300, Fil Dunsky via B4 Relay wrote:
> > The ports are named ttyCS so that the driver can coexist with the 8250
> > driver in multiplatform kernels, and PORT_GENERIC is used rather than
> > allocating a new port type.
>
> But even if you build a multi-platform kernel, only one of the uarts is
> going to be on the system, so why have a new name for it?  Can't you
> just use the "default" name instead?  If you do that, what happens?

I tried it on the board: multi_v7_defconfig with the driver renamed to
ttyS. The 8250 driver registers its runtime ports (ttyS0..ttyS4) even
though there is no 8250 on this SoC, so the probe fails:

  sysfs: cannot create duplicate filename '/class/tty/ttyS0'
  ...
  cs75xx-uart f0070110.serial: Cannot register tty device on line 0
  Warning: unable to open an initial console.

That is why I went with a separate name, like ttyAMA or ttymxc. If
there is a better way to share ttyS with 8250 I am happy to change it.

> > +/*
> > + * UART driver for the Cortina Systems CS75xx (Goldengate G2) SoCs
> > + *
> > + * Based on the Cortina Systems vendor driver.
> > + */
>
> No copyright info?

The vendor file (serial_cortina.c) carries no copyright notice, only the
GPL-2.0 statement and MODULE_AUTHOR("Cortina-Systems"). I will add mine
and name the vendor file as the origin in v2.

> > +static void cs75xx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
> > +{
> > +}
>
> Why an empty function?  Can't you just leave it out?

The block has no modem control lines. serial_core calls ->set_mctrl()
without a NULL check (uart_update_mctrl() and others), so it has to
exist. I will add a comment saying so.

> > +static void cs75xx_uart_break_ctl(struct uart_port *port, int break_state)
> > +{
> > +}
>
> Same here.

That one is optional, I will drop it.

> > +static void cs75xx_uart_release_port(struct uart_port *port)
> > +{
> > +}
>
> This feels wrong.
>
> > +static int cs75xx_uart_request_port(struct uart_port *port)
> > +{
> > +     return 0;
> > +}
>
> As does this.

Both are optional and the resources are managed in probe, so I will
drop them in v2.

Thanks for the review,
Fil


