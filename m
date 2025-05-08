Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ABCC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E0bLKxYdXkuHD/SA6I+BOMqRSJqpxgHBU3+0lj1mCs=; b=k7jLl+JuNAkG7ZHVBscWJk1LDw
	fywm3Vxo971rm7woz3GgyVgTdvGdDGpfetn3atgIHEQs5DZO7qVkptgXTJONF/8N8Ofl6/XExAH5P
	oCHuVxEM/oJVMXFaJZYfzyOxGqQiYuVmNb+K2Hk2zoi4C0vEKM/AIozkrXi3pHLY1zi2J7fUgLD2/
	9P1CrxnNwfVrO7kvgH0xmmlYk7biSoat5IshkHQ8z1k9tHvap0INfFAf7JJwAJ4Rr9e/DCfUscAML
	tw0ybdTYe00d68bBmyaQi9zRzHWXhWzj54GZGxUzeVhd4E+JPP1buH0VdMsGsXsSgaChzkTKqFXYa
	NPu9evjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Q7-00000001Alu-2YuD;
	Thu, 08 May 2025 15:44:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2kt-000000011vx-2xdO;
	Thu, 08 May 2025 15:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0D69A4DE43;
	Thu,  8 May 2025 15:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEE2C4CEE7;
	Thu,  8 May 2025 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716506;
	bh=UCL8T8OKT2PHy7pDRaffVOpXZolm4PC/BuT7xeYhR0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdyC1MXOScXQQbTzI2b26rBkqoWxPE9uMO5DoT0rIVU220CuEWMgYwd7uRUnHNEkK
	 A9CmAMN6aItLxDbL3vvAqpyQ/mZAFPQ/+TZdPqBnKdpxSqSPl3DevAL6cxaDETyswn
	 2kqzwwaxpT+O7IZzg4HkTBSEMCODvn9kDYz1TcYUkguw17csLhR5xRtV5q8uFUl8JL
	 vhnieXUkQmVEXiA/TC8yWo8YE6E+cguuhXQsiDhFOzlsxaUF3DY/U7JlnqCaWw2rTC
	 FwIh6P9hRa+V6Lgp5j+KFqF/hyEFW/vhJgb2hbEEto+UcE820vy9wPYVOe4j0PKhzo
	 AMPwuVwacdy1Q==
Date: Thu, 8 May 2025 16:01:40 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250508150140.GS3865826@google.com>
References: <20250508132659.GL3865826@google.com>
 <20250508142648.7978-1-trannamatk@gmail.com>
 <CAHp75VcquXy11+mXW8eKgE0ndg3k0y6i=yKQ9_3N2Uh0viZKQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcquXy11+mXW8eKgE0ndg3k0y6i=yKQ9_3N2Uh0viZKQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_080147_810845_A0074427 
X-CRM114-Status: GOOD (  21.12  )
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

On Thu, 08 May 2025, Andy Shevchenko wrote:

> On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Thu, 8 May 2025 Lee Jones wrote:
> > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> 
> ...
> 
> > > > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> > >
> > > This is fine.
> > >
> > > Just be aware, before you submit to LEDs again, that you need to use
> > > what is available in the LEDs subsystem to it's fullest, before
> > > hand-rolling all of your own APIs.  The first submission didn't use a
> > > single LED API.  This, as before, would be a big NACK also.
> >
> > Thanks for the clarification.
> >
> > Just to confirm — the current version of the driver is customized to allow
> > user space to directly manipulate LP5812 registers and to support the
> > device’s full feature set. Because of this, it doesn’t follow the standard
> > LED interfaces.
> 
> But why? What's wrong with the LED ABI? (see also below question
> before answering to this one)
> 
> > Given that, would it be acceptable to submit this driver under the misc subsystem instead?
> 
> But these are LEDs in the hardware and you can access them as 4
> individual LEDs, right?

Right.  Please work with the API you are offered in the first instance.
My first assumption is always that this driver isn't as special as you
think it might be.

-- 
Lee Jones [李琼斯]

