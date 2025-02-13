Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B63C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TVSfnhO/D9vf7kVKocZCtgHhLvkRIYScp2kiZ0Rn5s=; b=O8sCqFkWs/1kUhCXORyV3lUkde
	cUBj8a/NpmEzwFP0Te3bOHZNGck5tZ/PNA9pbPJnrIcAYxjKztuchJnyU6t2ZWjryVZKBdSjPTa4E
	c9uEruBNYPzEh/6hRfNNeDVuM0cv44tm3fWr5o5pw5zNgoGXoFIPHDCjcoMhRtP/5Pr5NesWb61xX
	Xe6XDIPWyCRZtfrg0GrPCkGV9aNxEtDq3O8EIyw2Zc14crKhkGcaxIviYX7jb15jcCiSqFWyACBI4
	h4ZakK2RQWmDy8a3ppONP8FH812V0GK5nhRC2LfDsWRIdLK8E+7teNVOeeTeQfIxnvWWPEYkvfnNe
	PxnDBfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticH3-0000000Bogl-1Iki;
	Thu, 13 Feb 2025 16:41:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibrO-0000000BiJv-42MM;
	Thu, 13 Feb 2025 16:14:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25360441D0;
	Thu, 13 Feb 2025 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739463278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TVSfnhO/D9vf7kVKocZCtgHhLvkRIYScp2kiZ0Rn5s=;
	b=o/ragaeqE14+pkiUyeerhxStHnHzUEuBaR1MDzBW+7wdy/u3tp+KketwFkv6a1sl29X91R
	bazTwFPopWFSaJGSUnKpDZQLBGOmVuo2ndmrlnYUDCz/CfzWgQ3cFrXnEsLh/o5rj6Vzn4
	VVkvrSy7CFWtMgXit8j7dBcts6buJjY42hvgI8s8rJOqOX6cPCwaWN1Rs4f9k222J2ouyg
	g8hqm/3JkLHGpxJAL0LWtcSlVMlhaRHgSzcKAdhZtP9y9aopwC7UfNpKr9ixsbQlI3cumA
	81i+wvtWy8TucWElCaV+3PwElF+2fBxbpdNArU7gYJqnCwdZinWA3a/2fuPrjw==
Date: Thu, 13 Feb 2025 17:14:35 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, andrew@lunn.ch, Arnd
 Bergmann <arnd@arndb.de>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
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
Message-ID: <20250213171435.1c2ce376@bootlin.com>
In-Reply-To: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeehpdhrtghpthhtohepphhhihhlsehrrghsphgsvghrrhihphhirdgtohhmpdhrtghpthhtoheprghnughrvggrrdhpohhrthgrsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheps
 ggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_081443_580794_B364D1C8 
X-CRM114-Status: GOOD (  17.82  )
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

On Thu, 13 Feb 2025 15:18:45 +0000
Phil Elwell <phil@raspberrypi.com> wrote:

> Hi Andrea,
> 
> The problem with this approach (loading an overlay from the RP1 PCIe
> driver), and it's one that I have raised with you offline, is that
> (unless anyone can prove otherwise) it becomes impossible to create a
> Pi 5 DTS file which makes use of the RP1's resources. How do you
> declare something as simple as a button wired to an RP1 GPIO, or fan
> connected to a PWM output?

The driver could be improved in a second step.
For instance, it could load the dtbo from user-space using request_firmare()
instead of loading the embedded dtbo.

> 
> If this is the preferred route to upstream adoption, I would prefer it
> if rp1.dtso could be split in two - an rp1.dtsi similar to what we
> have downstream, and an rp1.dtso that #includes it. In this way we can
> keep the patching and duplication to a minimum.

Indeed, having a rp1.dtsi avoid duplication but how the rp1.dtso in
the the kernel sources could include user customization (button, fan, ...)
without being modified ?
At least we have to '#include <my_rp1_customizations.dtsi>'.

Requesting the dtbo from user-space allows to let the user to create
its own dtso without the need to modify the one in kernel sources.

Does it make sense ?

Best regards,
Hervé

