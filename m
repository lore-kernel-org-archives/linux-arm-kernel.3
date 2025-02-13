Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C689C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku4ZpP8E0qi67O0cpk28B8iLxY+880CliqOyg+p90OQ=; b=lO6nChdC1/f96JFuit4tt44LgE
	dyHq2exutzXrQ1G7PuxrFcjsdaUUfzG9DxJ7167lSQdU1yRPBtfj9h/SicjKRWK8s3/M4OIWO6gD7
	5Arg3Hs6XMNKiB2d2JrheA9FKRZhPS+Xp/biwkdzO0d+37Edvd1DXJFDQ3AzLD/xDCWvwJr8LG2XQ
	wSsvpYWkQfg6TDFXzfgw+BvpoiyfV0FYvq6Mzqs1ovmNX0KPJfruUSQXVpG5jfvWjszP23/uPT0/q
	5qyldAP2Mt9e+VBSRf8uarKf6Z8g3+91gHynWb3asMqrMnacHHHQh43o+UD5Pogdb6sZdqMSmguRu
	r2R49mTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifdi-0000000CW9Y-2138;
	Thu, 13 Feb 2025 20:16:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifcG-0000000CVs4-3gg2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:15:21 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7c501bbecso192860166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 12:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739477719; x=1740082519; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku4ZpP8E0qi67O0cpk28B8iLxY+880CliqOyg+p90OQ=;
        b=ZIUR6rXp4Lv8OKOTHaQ5dhfHlib0XgOOBijEbWY51BUY3+ECtxU8e0M69hvrKpTSQD
         XGjqxlh65B+DlXdts31S/t/VkFRfBy9CykwHzSjxKXd2fTaEnaw7DEDB+q2Zamaa2y48
         qe+2/Ib06nGi+jTkQgJYKbiy3cL9KkfNuBA9YIXPqgA8Qe6XOa3WDja6VNzy1c3x/3VJ
         ByMi3HBzxE3urf1Pv7x1BvsnXujOrjsoyO3cBtHrKDTQbV86N5T7UJaihD61sNKu07oL
         2MGUjwmdglirWXukyZ2wGNmzjk8CYcvrGPytylUMT607FE6VCzNR4CTc/yuRXQBX0BH/
         rLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739477719; x=1740082519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku4ZpP8E0qi67O0cpk28B8iLxY+880CliqOyg+p90OQ=;
        b=AsiUU3gGAy15zP0IcJrc5jGKFZrQZm12k1eai+LN+hZveCjfH+FWeE9tor6whTWWP+
         GjYONH9VC2HWliNrmSpeyxoYAyv0fsTG8zalK8C7l0Dk2cuyiZJeG/sBKmwYHx4Drzvg
         ymvYDAdokj3UC2468KuFRxp9tDeWl2jYLPJ3rNiegnjDiukS/wyJ0rkCckPHpGdFdxvB
         NRy5phkCpJRhFnTr6qYLFxM8lidpqmcQ1xY6W0SwMv5ANxezlfh/esHBCWBcU8tssyzT
         vm7r71wLdywaKPK1iqBy8ImmM/p6+FYZhrL+9dbykmhQX79Seb1cxnqOKwLwd1QrPuJS
         qrng==
X-Forwarded-Encrypted: i=1; AJvYcCXdmowuTS8/c6eM7wnv+LkKRUpVsT3QpwAyVUJVWUhdPsf0uxiZ5uF4r92nvuiFCiJpr2caJFgsK9AOQ8wbiQs3@lists.infradead.org
X-Gm-Message-State: AOJu0YxtsDqOOnTknVUnKjAjNsqt+mjIr9wKD8xczaYVKxkE7BxFkF6W
	5SjoNdGk3BKresDz629F0/b5NyBzj3ND9EySx4fitScBcHMLgcRbsLb1xW7VuqzbwNeT+M2ISH4
	FdnduYuDDTZDoG8Yj4XHi9/5r3luGNTDByr9Tuw==
X-Gm-Gg: ASbGncv6MxPZh62M5d0hnjgNkEZFUDJhfVYZeKg9y8tuowfoA+lBb5oHf4OeVynz5Tj
	Y/ze853p66rv08lxYo734M9PeNyF0lQdgCiUwVIqYoMxYkLPknM7SsaxA1TFSs9j3fyN9tVHe
X-Google-Smtp-Source: AGHT+IHL8CM7ylsZCGYbhhurWPgsNzVEPTt0GbzqEVuFP8DGsWzaxgWDYP0kYEVOuE1FqVkeFZtnMkkFkhc6Mpf6ALQ=
X-Received: by 2002:a17:907:94c5:b0:aab:740f:e467 with SMTP id
 a640c23a62f3a-ab7f33459c8mr965659466b.8.1739477719051; Thu, 13 Feb 2025
 12:15:19 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
 <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch> <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
 <20250213195304.3a2df02c@bootlin.com>
In-Reply-To: <20250213195304.3a2df02c@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 20:15:06 +0000
X-Gm-Features: AWEUYZmyv_HkHTHpV0OY_0Sgq0DOC92t4GTNRz9-9baWq02Pyp8uQAKZdY6LeEY
Message-ID: <CAMEGJJ0kGCj=tjM6KswbG_+ZFkzMwPY+06BXCU0qSnbBKz0=ug@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_121520_910365_665BDBEE 
X-CRM114-Status: GOOD (  34.55  )
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

Once more, with plain text, which I'd hoped the Android GMail client
would work out for itself.

On Thu, 13 Feb 2025, 18:53 Herve Codina, <herve.codina@bootlin.com> wrote:
>
> Hi Phil,
>
> On Thu, 13 Feb 2025 17:57:37 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > > > fan are directly on this custom board? You then want a board DTS which
> > > > > includes all these pieces?
> > > >
> > > > That depends on whether you count the Raspberry Pi 5 as a custom board.
> > >
> > > So you mean the Pi 5 board would itself make use of the resources the
> > > RP1 device has? They are not simply connected to headers for plugin
> > > boards, but used by the main board? Hence you want to describe them in
> > > the board .DTS file.
> >
> > That's correct. But even for plug-in devices, those which are on
> > non-discoverable buses need overlays to declare them, which causes a
> > problem when the overlay application happens before the kernel is
> > started.
> >
>
> Hum, I see.
>
> We worked on overlay usage on non-discoverable buses wired to a connector
> and we did a talk about issues we are facing on at Plumber [0].
>
> You can also find our big picture in [1] and a last contribution introducing
> export-symbols feature in [2]. export-symbols is also under discussion on
> some other threads.
>
> Also, we proposed the i2c bus extensions feature [3] whose goal is to allow
> an addon board to add devices on an i2c bus provided by a base board and
> wired to an connector the addon board is connected to.
>
> Maybe in your case, you can decouple resources (gpio, pwm) provided by the
> addon board and used by the base board using also nexus node.
>
> We use a nexus node [4] (not presented at the Plumbers talk because the idea
> came during 'out of talk' discussions in Plumbers) in order to allow our
> addon board to use resources provided by the base board.
>
> In your case, if I understood, you are in the other direction but why not
> using also a nexus node to decouple and translate resources in this other
> direction ?
>
> Don't know if this idea can help but feel free to ask for some more
> information if needed.

Nexus nodes look interesting - I see them as adding a layer of
abstraction such that, for example, boards can declare which of their
specific resources performs a common function so that clients can
treat them all the same. We do the same thing in a limited way by
using common labels on nodes, but this goes much further.

In the case of Pi 5 and RP1, I imagine you are proposing that the Pi 5
dtb declares the connector node and the overlay fills in the content
with references to its GPIO controller, PWM controller etc. However, I
think the overlay would also have to be board specific because it's
not possible to patch part of a property from an overlay, so you'd end
up overwriting the GPIO number as well as the controller reference.

What is needed to make this work is the ability to cope with
unresolved references in the base dtb, to be resolved as each overlay
is applied, with runtime checking that each reference is resolved
before it is used, all of which sounds like a nightmare. Plus, we
really don't want to have to change the way all our camera and display
overlays work on all Raspberry Pis just to accommodate somebody's idea
of how RP1 should be handled.

Besides, Occam's razor surely applies.

Phil

