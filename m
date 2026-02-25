Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24195FD3773
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Xsu0Zgs56ZTjjF/y5JOVDhujspJDUCWfcwVY2hiQD8=; b=gnYWLeJKAnHOmN
	OszRPPBstqeWCYCtQezqtPxA7KR+Yd7kDbRZ58VInmCMJucNov5h4Oq8Vovd7mZ0yhvJR8We3roNu
	zXamOmK6jz/KxmR96Y7vFscFcKdDbwFwYyOe7DyuOi3t6xyopJ4oYsjhComlOFzYS7V2oqQLtvnpd
	wZXBzKyjVuWs+MsSQ2AKvFGf0/C4gf+JAG/YnPlXFi4RtJWDB7jyPt1Fcq6QGwDIE7DtdGYv+RL7u
	poddkGhvvsuvjmP3hBRVDaAix+5sgrcnwAVX1C2C5MfFqk/SqDGiF1pX3TuOoO2ep/TtzDp1Atowc
	lwDDnplgdg57g5Fc0mxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvICF-00000004aBh-0b2n;
	Wed, 25 Feb 2026 16:57:11 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvICC-00000004aBJ-2sSm;
	Wed, 25 Feb 2026 16:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=6Xsu0Zgs56ZTjjF/y5JOVDhujspJDUCWfcwVY2hiQD8=; b=nlq+pd4/mueP7MR8da4s9fG+Ti
	MljCQ+I9fT/muEHpM7HjYQ1Rm7WEu9flXyI/luE18WWn7ip6pe9Wlal1ky0J5d6mhymsbNol+LFFO
	3w7U6zl+tKxiynCVvsATte/zSLDIPdrZcl9hffvDqgh6f1HTrBmLZclre3BdaV3mZz3c=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:39918 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvIBw-0001Vc-St; Wed, 25 Feb 2026 11:56:54 -0500
Date: Wed, 25 Feb 2026 11:56:52 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, robin@protonic.nl,
 andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
 mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
In-Reply-To: <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
	<20260225155409.612478-5-hugo@hugovil.com>
	<aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
	<20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
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
X-CRM114-CacheID: sfid-20260225_085708_915709_A3658393 
X-CRM114-Status: GOOD (  38.21  )
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

On Wed, 25 Feb 2026 11:41:55 -0500
Hugo Villeneuve <hugo@hugovil.com> wrote:

> Hi Andy,
> thank you for the review.
> 
> On Wed, 25 Feb 2026 18:12:13 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> > 
> > > Add support for GPIO-based charlieplex keypad, allowing to control
> > > N^2-N keys using N GPIO lines.
> > > 
> > > Reuse matrix keypad keymap to simplify, even if there is no concept
> > > of rows and columns in this type of keyboard.
> > 
> > ...
> > 
> > > +/*
> > > + *  GPIO driven charlieplex keypad driver
> > > + *
> > > + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > + *
> > > + *  Based on matrix_keyboard.c
> > 
> > A single space after asterisk is enough.
> 
> Ok, leftover from copy/paste from matrix_keyboard.c :)
> 
> > 
> > > + */
> > 
> > ...
> > 
> > + bitops.h
> > 
> > > +#include <linux/delay.h>
> > 
> > + dev_printk.h
> > + device/devres.h
> > + err.h
> > 
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/input.h>
> > > +#include <linux/input/matrix_keypad.h>
> > 
> > + math.h
> 
> Ok.
> 
> 
> > 
> > > +#include <linux/module.h>
> > 
> > > +#include <linux/of.h>
> > 
> > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> 
> I need only OF ID table, so will replace with mod_devicetable.h.

Hi Andy,
finally I need <linux/of.h> for of_match_ptr()...

But I will keep <mod_devicetable.h> ...


> > 
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/types.h>
> > 
> > ...
> > 
> > > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> > > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > > +		int iline;
> > 
> > > +		int rc;
> > 
> > I think Dmitry prefers 'error' name for this kind of variables.
> 
> I hate using "error", can be so misleading :)
> 
> I would prefer to use "rc" everywhere, but if Dmitry chimes in and
> specifies "error" or "err", then so it will be.
> 
> 
> > 
> > > +		/* Activate only one line as output at a time. */
> > > +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> > > +
> > > +		if (keypad->settling_time_us)
> > > +			fsleep(keypad->settling_time_us);
> > > +
> > > +		/* Read input on all other lines. */
> > > +		rc = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> > > +						    keypad->line_gpios->desc,
> > > +						    keypad->line_gpios->info, values);
> > > +		if (rc)
> > > +			return;
> > > +
> > > +		for (iline = 0; iline < keypad->nlines; iline++) {
> > > +			if (iline == oline)
> > > +				continue; /* Do not read active output line. */
> > > +
> > > +			/* Check if GPIO is asserted. */
> > > +			if (test_bit(iline, values)) {
> > > +				code = MATRIX_SCAN_CODE(oline, iline,
> > > +							get_count_order(keypad->nlines));
> > > +				/*
> > > +				 * Exit loop immediately since we cannot detect
> > > +				 * more than one key press at a time.
> > > +				 */
> > > +				break;
> > > +			}
> > > +		}
> > > +
> > > +		gpiod_direction_input(keypad->line_gpios->desc[oline]);
> > > +
> > > +		if (code)
> > > +			break;
> > > +	}
> > 
> > ...
> > 
> > > +static int charlieplex_keypad_init_gpio(struct platform_device *pdev,
> > > +					struct charlieplex_keypad *keypad)
> > > +{
> > > +	int i;
> > 
> > Why signed? But see below as well.
> 
> Will switch to unsigned.
> 
> 
> > 
> > > +	keypad->line_gpios = devm_gpiod_get_array(&pdev->dev, "line", GPIOD_IN);
> > > +	if (IS_ERR(keypad->line_gpios))
> > > +		return PTR_ERR(keypad->line_gpios);
> > > +
> > > +	keypad->nlines = keypad->line_gpios->ndescs;
> > > +
> > > +	if (keypad->nlines > MATRIX_MAX_ROWS)
> > > +		return -EINVAL;
> > 
> > > +	for (i = 0; i < keypad->nlines; i++)
> > 
> > iterator is local to the loop, hence
> > 
> > 	for (unsigned int i = 0; i < keypad->nlines; i++)
> 
> Ok
> 
> 
> > 
> > > +		gpiod_set_consumer_name(keypad->line_gpios->desc[i], "charlieplex_kbd_line");
> > > +
> > > +	return 0;
> > > +}
> > 
> > ...
> > 
> > > +static int charlieplex_keypad_probe(struct platform_device *pdev)
> > > +{
> > > +	struct charlieplex_keypad *keypad;
> > > +	unsigned int debounce_interval_ms;
> > > +	unsigned int poll_interval_ms;
> > > +	struct input_dev *input_dev;
> > 
> > > +	int err;
> > 
> > The naming is even inconsistent between the functions...
> 
> Agreed, will fix as stated above.
> 
> 
> > 
> > > +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> > > +	if (!keypad)
> > > +		return -ENOMEM;
> > > +
> > > +	input_dev = devm_input_allocate_device(&pdev->dev);
> > > +	if (!input_dev)
> > > +		return -ENOMEM;
> > > +
> > > +	keypad->input_dev = input_dev;
> > > +
> > > +	device_property_read_u32(&pdev->dev, "poll-interval", &poll_interval_ms);
> > > +	device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce_interval_ms);
> > > +	device_property_read_u32(&pdev->dev, "settling-time-us", &keypad->settling_time_us);
> > > +
> > > +	keypad->current_code = -1;
> > > +	keypad->debounce_code = -1;
> > > +	keypad->debounce_threshold = DIV_ROUND_UP(debounce_interval_ms, poll_interval_ms);
> > > +
> > > +	err = charlieplex_keypad_init_gpio(pdev, keypad);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	input_dev->name		= pdev->name;
> > > +	input_dev->id.bustype	= BUS_HOST;
> > > +
> > > +	err = matrix_keypad_build_keymap(NULL, NULL, keypad->nlines,
> > > +					 keypad->nlines, NULL, input_dev);
> > > +	if (err)
> > > +		dev_err_probe(&pdev->dev, -ENOMEM, "failed to build keymap\n");
> > > +
> > > +	if (device_property_read_bool(&pdev->dev, "autorepeat"))
> > > +		__set_bit(EV_REP, input_dev->evbit);
> > > +
> > > +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> > > +
> > > +	err = input_setup_polling(input_dev, charlieplex_keypad_poll);
> > > +	if (err)
> > > +		dev_err_probe(&pdev->dev, err, "unable to set up polling\n");
> > > +
> > > +	input_set_poll_interval(input_dev, poll_interval_ms);
> > > +
> > > +	input_set_drvdata(input_dev, keypad);
> > > +
> > > +	err = input_register_device(keypad->input_dev);
> > > +	if (err)
> > > +		return err;
> > 
> > > +	platform_set_drvdata(pdev, keypad);
> > 
> > Is this needed?
> 
> No, will remove it, and replace last lines with:
> 
>    return input_register_device(keypad->input_dev);
> 
> 
> > 
> > > +	return 0;
> > > +}
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
> > 
> 
> Hugo Villeneuve


-- 
Hugo Villeneuve

