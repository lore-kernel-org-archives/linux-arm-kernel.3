Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2C5C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8zgaF3nulMiQiwbL4R1lWJxh4xru2nZDCsB/h+5Z9k=; b=wFqyGeiPWu/28fMVjqFxcBuGQh
	EI3dB1nTGJqOhPMrwMqhV78h2E0KqIL8SzBvYmlEdGZ/A+WzZYB048Gz8qfAeNA7xGGp+zEZL7yUN
	l7whOg9x4Ym0RIkR7aOJXuByy8dHMM5pk6EMZtZrxEbaKoLPgGah61jw/WcHMl9k796uQksga7Zrr
	OSgzO3rivTHllMtm9T9h45uOn6WG9vnJh3gJhFV8N9T7gXiEVHcJR6HRNrlce6eJQkmdgLrk8xgsD
	g5oEOZpb0mnb7+9f/2ZmTmd4/1vMUJonT9Aluf+IVvkaMkm5EKs5u0um3pmG4tEqydklFaL1k1IIW
	Ok6l4pLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29V-00000009Xbt-2VMw;
	Mon, 19 May 2025 15:11:41 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1QA-00000009RGw-1UHm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:24:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BAC243B1E;
	Mon, 19 May 2025 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747664686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8zgaF3nulMiQiwbL4R1lWJxh4xru2nZDCsB/h+5Z9k=;
	b=cX20EnD8RXp6UsCYebQkq4d6GN5gAVUPkROwO2M9xsaoIFMPiZrGzjcMGG4YTOF5ZypiKz
	bNzqWh8AkHA8XYDSAQ+3a+nDeOH7p34OQpSx1w2sckJXKNw/MmTrQnlFjpeTjxePK9qOXy
	LjGKyGaLiyvKnZmv5MeTXtWmMiRy+lpWT8GlGUW5eFPT4GQzv1CZE80uaoTmYNYgbWWWvF
	GyDT7nN62WBBIL5eZamr3cahrUEnZkbj6zWX2gjxxdVdaohcrdr/MlAe+6v8/5f5ZN2U7b
	/n9OKyZSluLwCkHI5eDaTgSmsroyx0m1a0ohba3j+bpVa5SO8dvefi5a7LthKA==
Date: Mon, 19 May 2025 16:24:43 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250519162443.20396e73@bootlin.com>
In-Reply-To: <aCseyW1iZgZNZNqd@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-6-herve.codina@bootlin.com>
	<aBy_aBkC7NpicXho@smile.fi.intel.com>
	<20250519135818.01db3341@bootlin.com>
	<aCseyW1iZgZNZNqd@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_072450_701861_A64247B2 
X-CRM114-Status: GOOD (  25.67  )
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

Hi Andy,

On Mon, 19 May 2025 15:06:33 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, May 19, 2025 at 01:58:18PM +0200, Herve Codina wrote:
> > On Thu, 8 May 2025 17:27:52 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:  
> 
> ...
> 
> > > >  		if (of_property_match_string(np, "compatible", match->compatible) == 0)    
> > > 
> > > Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
> > > there is also OF variant of it.  
> > 
> > fwnode_device_is_compatible() checked for all compatible string. I mean, if
> > we have compatible = "foo,custom-bus", "simple-bus";
> > fwnode_device_is_compatible() checking against "simple-bus" returns true.
> > 
> > Here, we want "simple-bus" as the first position in the compatible string.
> > In other word, we want to match the more specific compatible string as
> > mentioned in the comment.  
> 
> I admit I'm not an expert in DT, but why is the compatibility position
> dependent?
> 
> ...
> 
> > > > +	if (pdev->dev.of_node)    
> > > 
> > > Why do you need this check? AFAICS it dups the one the call has already in it.  
> > 
> > of_platform_populate() was called only if an OF node is present.
> > I want to call of_platform_depopulate() on removal also only if an OF node
> > is present.
> > 
> > I don't see the other call that duplicated this check.
> > 
> > Can you clarify?  
> 
> The of_...() is already NULL-aware (AFAICS), why do you need the duplicated
> check?

Oh, I see. I was focused on previous of_device_get_match_data() call.
My bad.

Indeed, you're right, I can call directly of_platform_depopulate() without
checking pdev->dev.of_node before the call. The check is already present
in of_platform_depopulate() itself.

I will do that in the next iteration.

Thanks for pointing out.

Best regards,
Hervé

