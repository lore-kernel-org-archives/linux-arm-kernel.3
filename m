Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25B4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6qH4iFmq2eCsp4gR0alhKpvz8JxjM4NdzNRGitctoQ=; b=XN06M3DqZvG5+kjGJIJwoTe0SV
	ujB2DjMIp/kFuHIe00C04/xSdqXXkYYxPvdMk8vIqZLEMDDGYT74BdR19GyhCcpOeoAOCfHiNiAiM
	eee9pb3sYP4LIc99CWUfNHhVlb8DSUUQX+7eLWV/6qe7F/PSnBe/IOC3VgKIg8QSaeQOlZV2DdHUM
	6L4cuyQXTPrfOeYnutGsr4JxfQrr81wQOCTHiX3wSwUcHMfv2QDogkph9FNl6cz/8UvV8F5Gbl4Oz
	Qt4peuNS+68SZic9ZyQjG84A2JQybRSt+XXn8dQCWo3qUVrqTLNP4CCrOq4OnFDRVFSIEHQ5q7d8T
	bX6OGgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1T-0000000CZUh-2f6i;
	Thu, 13 Feb 2025 20:41:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tieKn-0000000CJOA-0Qr7;
	Thu, 13 Feb 2025 18:53:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44E1E4442E;
	Thu, 13 Feb 2025 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739472790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6qH4iFmq2eCsp4gR0alhKpvz8JxjM4NdzNRGitctoQ=;
	b=QQFIS6Yl0SPVIujgU2GPm4v6MzAaeFar1z+P8jxljvArnhEuso+Y/P/qcxiEHDYPns9Oe2
	je9+Kk9CWdf/ZsYEv5gcGV6gh9WpYb42YK62QI6bB0wAUu3we0b6aprTdQJADCNWcrSAwx
	9ycbaUf61H5QU/WHv8hmtogOn+6BAi7kQmiMc7MydcuHs8hj5eRXpVwGOvirzmuVhTb/Xp
	kqAxyCa/lZbEnmksJuVGjvMa1RbnPT5GuzchNsyUEemWs5dhkGjLVNdJ4susBSgI35TH1b
	M6SnAW8+yTKzKsCCoVguJ7nfcytgbsCz4gHn8GfhtBHVrRRIAJoC44hKvft1aw==
Date: Thu, 13 Feb 2025 19:53:04 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta
 <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com,
 brgl@bgdev.pl, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, derek.kiernan@amd.com, devicetree@vger.kernel.org,
 dragan.cvetic@amd.com, Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org,
 kw@linux.com, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open
 list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, "moderated list:BROADCOM BCM2711/BCM2835 ARM
 ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 lpieralisi@kernel.org, luca.ceresoli@bootlin.com,
 manivannan.sadhasivam@linaro.org, masahiroy@kernel.org, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 saravanak@google.com, Stephen Boyd <sboyd@kernel.org>,
 thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, Will Deacon
 <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <20250213195304.3a2df02c@bootlin.com>
In-Reply-To: <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
	<20250213171435.1c2ce376@bootlin.com>
	<a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
	<CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
	<821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
	<CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffleegleetgedtuddugfffkefhgeeuheeugffhhfetgffhfeehkeejgeelfeetfeenucffohhmrghinheplhhptgdrvghvvghnthhspdhkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefhedprhgtphhtthhopehphhhilhesrhgrshhpsggvrhhrhihpihdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrnhgurhgvrgdrphhor
 hhtrgesshhushgvrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_105314_579847_2EFFD12F 
X-CRM114-Status: GOOD (  20.77  )
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

Hi Phil,

On Thu, 13 Feb 2025 17:57:37 +0000
Phil Elwell <phil@raspberrypi.com> wrote:

> On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:
> >  
> > > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > > fan are directly on this custom board? You then want a board DTS which
> > > > includes all these pieces?  
> > >
> > > That depends on whether you count the Raspberry Pi 5 as a custom board.  
> >
> > So you mean the Pi 5 board would itself make use of the resources the
> > RP1 device has? They are not simply connected to headers for plugin
> > boards, but used by the main board? Hence you want to describe them in
> > the board .DTS file.  
> 
> That's correct. But even for plug-in devices, those which are on
> non-discoverable buses need overlays to declare them, which causes a
> problem when the overlay application happens before the kernel is
> started.
> 

Hum, I see.

We worked on overlay usage on non-discoverable buses wired to a connector
and we did a talk about issues we are facing on at Plumber [0].

You can also find our big picture in [1] and a last contribution introducing
export-symbols feature in [2]. export-symbols is also under discussion on
some other threads.

Also, we proposed the i2c bus extensions feature [3] whose goal is to allow
an addon board to add devices on an i2c bus provided by a base board and
wired to an connector the addon board is connected to.

Maybe in your case, you can decouple resources (gpio, pwm) provided by the
addon board and used by the base board using also nexus node.

We use a nexus node [4] (not presented at the Plumbers talk because the idea
came during 'out of talk' discussions in Plumbers) in order to allow our
addon board to use resources provided by the base board.

In your case, if I understood, you are in the other direction but why not
using also a nexus node to decouple and translate resources in this other
direction ?

Don't know if this idea can help but feel free to ask for some more
information if needed.

[0] https://lpc.events/event/18/contributions/1696/
[1] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
[2] https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
[3] https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/
[4] https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping

Best regards,
Hervé

