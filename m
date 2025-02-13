Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B34C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=; b=bZpl18SKertJIWZsu1jUW436ut
	A225Ekpa6BWAgXYJBvvUDw043REiG2YB+w8fA5exoyIeWut8tnIocVICrm8qMGumTbBqrxJTx4F42
	KdxNQygnPq0sp/0Nnac2X39tiNhYICkd+/8Vbd3Bei6oH5ZOahv0HbtMQE8oIXBBs2UJxJ85xP+hH
	JFue7f0+ajQVpjhdbev3SYkinPLLsu5mrLjzP+gB5Wx/91S5XOlXBjT6tMaUJAQ0dInDDXXBZTzpR
	k4dDNUFiIqQeM6UECcDJ+XlZ/S5HjEK28WOeFmR+ZXj3WNtRxBAI8TauddLTsCZXzuS4WDKBb5ikm
	VqchMWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tie4X-0000000CGQJ-05Yj;
	Thu, 13 Feb 2025 18:36:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidTC-0000000C6bM-22nz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:57:51 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaecf50578eso249045966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739469469; x=1740074269; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
        b=ICj8ccuW8Yr5sKAMbnPC99bo7xXrI8qhvf23MZRDVnehF/O32obbTGb90xQF4aOjr0
         nzh9n6eL+lMP7PnRHWnznbZiDGQmiuWLJzVKTCtuVYn3Y/FE87ootvxcAKfvtChHBKz4
         XHqjJf0xfzaeg0R4sAlhFfuyAamSddUa12BLxftZ6EjZV0e3z6DsRWnQ6pwVe83kamXz
         GAQdtuq4ceh1ITHCD7pJq16qmw7u5hqghmSUKJuEjDxDGPby3cyPlYYo6ijlnDz5DxDm
         SF0z0uYNv+B5c4RiSErT26E0k9/imqoX/9Jjuxh294IipvMMVGc2G0SgmXWKJ9hYBdWH
         G8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469469; x=1740074269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
        b=fFzOt41od9CCKlDsNsvlLfd1rM7sAJ5hSL0EKDMLtKpVqc4nPhugcYZiVAPDcUzO/a
         2dwuMmEnIvGdF3JeeKjnJAZ05FglnodUZcrT3/rlHkfD2d2PTxnqajTEIBfDGIAcrkeU
         vUso25oIHKfBCAiDyuwZShAwNiEVfiMMhk9tFC1jGLGtBa02TnKvenYuwz1XkvdeYKgV
         kz3KlQ+b+uGJ9elndKQ/ghdpdhsw2vW+sLO09eD53SNbpk24J8ZGLxveq/cBqyXOkzNc
         WXNm9SAPeWEe563RE3V4Zg22z05UGH+eT8QbfJmjFv/F2etIu5kAUX0P1p+FeIkq+BC8
         wNtA==
X-Forwarded-Encrypted: i=1; AJvYcCWH2CaBYUJKUWhT8cxnIGSMh2NOtk59VK3eIOHgLSAmTwb1lVjBr5Ax/VR9db6s8coXYPlZLVt5FHsZmrX2kmZ9@lists.infradead.org
X-Gm-Message-State: AOJu0YyDaxyf8Xbw9zxFbJjUIEY+djd3evkDrlJw380arTiR4/gKQE/W
	EU3bov6z9AbDj5NZvVYd04L7co+Nt2WnclhtOcP6IPpQzuAhOYqWmclC3iSEmq6ylnYxqCCQjKD
	nAbBVEY0keTgxQNUoR1AgrE4sNsI7x71c/rnesQ==
X-Gm-Gg: ASbGnctHwsOZIaBZyWBrKTH902/w40FTZ6SgJtu4MXYYCACCpZGpfi2fuQcatbi5Gsb
	dcAdpCeCv5OlBdZrBetpQfTTvsvVPNFMBhaCyhb2+KUxroOqsC02akLCoXypSGdT6kZ3zlhfwxA
	ueKoeFBcIjOoU05vjB90yVekIMwzA8
X-Google-Smtp-Source: AGHT+IEK78m51sGJDd3X7obouAmtice1DYZhDC7vdVZTdA3vPC4baSC0McAYMZqXZ2JdRz2CuZ0fh5G5y4aENoDxPdM=
X-Received: by 2002:a17:907:971a:b0:ab9:63bf:8105 with SMTP id
 a640c23a62f3a-ab963bf8270mr490444566b.1.1739469468776; Thu, 13 Feb 2025
 09:57:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com> <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
In-Reply-To: <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 17:57:37 +0000
X-Gm-Features: AWEUYZnQGb_LTFgRMGvR2NkevZWJdZdjShSWV1aYMFwhkUzlH95FjIU8_Kkz2O0
Message-ID: <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
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
X-CRM114-CacheID: sfid-20250213_095750_566800_D75E1839 
X-CRM114-Status: GOOD (  15.84  )
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

On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > fan are directly on this custom board? You then want a board DTS which
> > > includes all these pieces?
> >
> > That depends on whether you count the Raspberry Pi 5 as a custom board.
>
> So you mean the Pi 5 board would itself make use of the resources the
> RP1 device has? They are not simply connected to headers for plugin
> boards, but used by the main board? Hence you want to describe them in
> the board .DTS file.

That's correct. But even for plug-in devices, those which are on
non-discoverable buses need overlays to declare them, which causes a
problem when the overlay application happens before the kernel is
started.

Phil

