Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D907AFD377A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQKoXwA9RhHZUpi+4eo53Id8BXP1PRpZdb8KsvS3Tqk=; b=R5DQ+R261N70nm
	fJOWWU5HgXFdWIgMEqSAsWxLWYgCR0ClShr8Agv0kMObojRFh4eyvIwX547htFlBj5wZgwGptGxeK
	sz+ALIbqlepx4lP6TTP4DyNVo6qglGnzJbbOn43j67TfYwe/251KThon0J8iKqoXiKQLq5ZxzIi1s
	6Bvn+D6JgP4cIvgSwkAY9AvtoBNqALB/a3aKicozFHJBtjlFCmTO0AICBtB1e3eZK/uNLA1awTs2Y
	s5+4y6O7bL5Y7MVJDo04wR5RiCcEgMJA6KVw8r3t9MEPC6NwU9J4Q87B/BjVLNWSRI7RXCjBV76y0
	ErWCyeqi5UlJMRWYqlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIgE-00000004ejc-0GsG;
	Wed, 25 Feb 2026 17:28:10 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIgB-00000004eiw-3RM4;
	Wed, 25 Feb 2026 17:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=IQKoXwA9RhHZUpi+4eo53Id8BXP1PRpZdb8KsvS3Tqk=; b=t0tK90/l3fitjNJ1x0woq9Rvkj
	sX88TmvXF2JbnRyiV6YnZtl7rT3hMzeZFM0tntGuczAvgPBLS/qv3aYcgTGwygENuLG+i988zvCUm
	rdQg7vf8q7kThSuYPpzC/8QFFGnaZKxQqoRb9o3z7gRjci3by/nYaONjMsMYiqZ3heQo=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:51004 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvIfz-0005Dc-Rj; Wed, 25 Feb 2026 12:27:56 -0500
Date: Wed, 25 Feb 2026 12:27:55 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, robin@protonic.nl,
 andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hvilleneuve@dimonoff.com, mkorpershoek@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 lee@kernel.org, alexander.sverdlin@gmail.com, marek.vasut@gmail.com,
 akurz@blala.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <20260225122755.3b2043c7cdd42bbaa7671fe7@hugovil.com>
In-Reply-To: <aZ8sjwaKk5MCSDlg@google.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
	<20260225155409.612478-5-hugo@hugovil.com>
	<aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
	<20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
	<aZ8sjwaKk5MCSDlg@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_092807_976046_D9A2A759 
X-CRM114-Status: GOOD (  33.01  )
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

Hi Dmitry,

On Wed, 25 Feb 2026 09:12:57 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Hi Hugo,
> 
> On Wed, Feb 25, 2026 at 11:41:55AM -0500, Hugo Villeneuve wrote:
> > Hi Andy,
> > thank you for the review.
> > 
> > On Wed, 25 Feb 2026 18:12:13 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > 
> > > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> > > 
> > > > Add support for GPIO-based charlieplex keypad, allowing to control
> > > > N^2-N keys using N GPIO lines.
> > > > 
> > > > Reuse matrix keypad keymap to simplify, even if there is no concept
> > > > of rows and columns in this type of keyboard.
> > > 
> > > ...
> > > 
> > > > +/*
> > > > + *  GPIO driven charlieplex keypad driver
> > > > + *
> > > > + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > + *
> > > > + *  Based on matrix_keyboard.c
> > > 
> > > A single space after asterisk is enough.
> > 
> > Ok, leftover from copy/paste from matrix_keyboard.c :)
> > 
> > > 
> > > > + */
> > > 
> > > ...
> > > 
> > > + bitops.h
> > > 
> > > > +#include <linux/delay.h>
> > > 
> > > + dev_printk.h
> > > + device/devres.h
> > > + err.h
> > > 
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/input.h>
> > > > +#include <linux/input/matrix_keypad.h>
> > > 
> > > + math.h
> > 
> > Ok.
> > 
> > 
> > > 
> > > > +#include <linux/module.h>
> > > 
> > > > +#include <linux/of.h>
> > > 
> > > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> > 
> > I need only OF ID table, so will replace with mod_devicetable.h.
> > 
> > 
> > > 
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/types.h>
> > > 
> > > ...
> > > 
> > > > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> > > > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > > > +		int iline;
> > > 
> > > > +		int rc;
> > > 
> > > I think Dmitry prefers 'error' name for this kind of variables.
> > 
> > I hate using "error", can be so misleading :)
> > 
> > I would prefer to use "rc" everywhere, but if Dmitry chimes in and
> > specifies "error" or "err", then so it will be.
> 
> Yes, I prefer err or error for variables that carry error code or 0.
> This allows to write
> 
> 	error = action(...);
> 	if (error) {
> 		// handle it
> 	}
> 
> which is very clear IMO.

Ok, will fix it globally to "err" everywhere in V4.


> 
> 
> > > > +
> > > > +	err = input_register_device(keypad->input_dev);
> > > > +	if (err)
> > > > +		return err;
> > > 
> > > > +	platform_set_drvdata(pdev, keypad);
> > > 
> > > Is this needed?
> > 
> > No, will remove it, and replace last lines with:
> > 
> >    return input_register_device(keypad->input_dev);
> 
> Please use
> 
> 	err = input_register_device(...);
> 	if (err)
> 		return err;
> 
> 	return 0;
> 
> It clearly differentiates error an normal paths, shows that function
> returns 0 and not anything else on success, and allows to reorder
> or add additional actions easily.

Ok.

Thank you,
Hugo


