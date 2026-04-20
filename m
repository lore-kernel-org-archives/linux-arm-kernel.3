Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0ACF588E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lArVrBn/x5rTmypa5CmSx1ZlITyRRcDc30mnIjp2KpQ=; b=QU0fyL2trCrOo26pP+5Kl1fze9
	R3QLx39wwgCVi4bh8/H9zQYbgqbiG3XlfzsKrz66hu/gvWUL3Erfe7HBF2cvLBUH53cvMzV32cWGB
	9ki5FXkGb2lv63Wxuvt3zKf5pGqei0ng/8xtzWOJAwq1k0D5Q6IusP8SB9KpFNjzJ1KLumuE7ZBs0
	FnjhPGWO9oakZmQ3fb6e3U6rt13ZwFtgQfzsz+E3EC+FyHKLza2Vm/QnmT/5+wg+UprTdPPZhvxCg
	4CXe5iOxf3fridxoGZB7JAOIcER8uOhLX1qN/kUYmVQ4yDsqkACE0D5Mh6LiDTkYqvhUKIiitVb7C
	apMwX4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEq8a-00000007DJ3-35S5;
	Mon, 20 Apr 2026 15:02:12 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEq8Y-00000007DIf-3E0f;
	Mon, 20 Apr 2026 15:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=lArVrBn/x5rTmypa5CmSx1ZlITyRRcDc30mnIjp2KpQ=; b=fX1lO7lXlbcZkWbqF5Vl8AKrFY
	PL6aJ/ecp6cwzbZVPLyqPNq9GGGgnYWrU0J+UARb0+2IlW4qDB5K9N6PCSf9hGi4DaHghmF1aG4XE
	gbheHtXZQRlp3RFYMaGjm98ttXUK7EfpxgVcnzmwIxUqPPuWCaj0C1GqvfEE2ybScMf4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wEq8N-000000006HH-36N1;
	Mon, 20 Apr 2026 11:02:00 -0400
Date: Mon, 20 Apr 2026 11:01:59 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-Id: <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
In-Reply-To: <aeWtDA7snjJmiF9K@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
	<20260312180304.3865850-5-hugo@hugovil.com>
	<aeWtDA7snjJmiF9K@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_080210_975718_9DB2EF2D 
X-CRM114-Status: GOOD (  30.76  )
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

On Sun, 19 Apr 2026 21:47:40 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Hi Hugo,
> 
> On Thu, Mar 12, 2026 at 02:00:58PM -0400, Hugo Villeneuve wrote:
> > +
> > +static void charlieplex_keypad_report_key(struct input_dev *input)
> > +{
> > +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> > +	const unsigned short *keycodes = input->keycode;
> > +
> > +	if (keypad->current_code > 0) {
> > +		input_event(input, EV_MSC, MSC_SCAN, keypad->current_code);
> > +		input_report_key(input, keycodes[keypad->current_code], 0);
> 
> This needs input_sync() as otherwise userspace is free to only recognize
> the last MSC_SCAN event.

Ok, now I get it, my code would have been be working only if it was an
if/else.

> 
> > +	}
> > +
> > +	if (keypad->debounce_code) {
> > +		input_event(input, EV_MSC, MSC_SCAN, keypad->debounce_code);
> > +		input_report_key(input, keycodes[keypad->debounce_code], 1);
> > +	}
> > +
> > +	input_sync(input);
> > +	keypad->current_code = keypad->debounce_code;
> > +}
> > +
> > +static void charlieplex_keypad_check_switch_change(struct input_dev *input,
> > +						   int code)
> > +{
> > +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> > +
> > +	if (code != keypad->debounce_code) {
> > +		keypad->debounce_count = 0;
> > +		keypad->debounce_code = code;
> > +	} else if (keypad->debounce_count < keypad->debounce_threshold) {
> 
> This does not work if debouncing is disabled (debounce threshold is 0).

Yes.


> 
> > +		keypad->debounce_count++;
> > +
> > +		if (keypad->debounce_count >= keypad->debounce_threshold &&
> > +		    keypad->debounce_code != keypad->current_code)
> > +			charlieplex_keypad_report_key(input);
> > +	}
> > +}
> > +
> > +static void charlieplex_keypad_poll(struct input_dev *input)
> > +{
> > +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> > +	int code;
> > +
> > +	code = 0;
> > +	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > +		int err;
> > +
> > +		/* Activate only one line as output at a time. */
> > +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> > +
> > +		if (keypad->settling_time_us)
> > +			fsleep(keypad->settling_time_us);
> > +
> > +		/* Read input on all other lines. */
> > +		err = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> > +						     keypad->line_gpios->desc,
> > +						     keypad->line_gpios->info, values);
> > +		if (err)
> > +			return;
> 
> We need to deactivate the line on error too.

Yer, good catch.

> 
> > +
> > +		for (unsigned int iline = 0; iline < keypad->nlines; iline++) {
> > +			if (iline == oline)
> > +				continue; /* Do not read active output line. */
> > +
> > +			/* Check if GPIO is asserted. */
> > +			if (test_bit(iline, values)) {
> > +				code = MATRIX_SCAN_CODE(oline, iline,
> > +							get_count_order(keypad->nlines));
> > +				/*
> > +				 * Exit loop immediately since we cannot detect
> > +				 * more than one key press at a time.
> > +				 */
> > +				break;
> > +			}
> > +		}
> > +
> > +		gpiod_direction_input(keypad->line_gpios->desc[oline]);
> > +
> > +		if (code)
> > +			break;
> > +	}
> > +
> > +	charlieplex_keypad_check_switch_change(input, code);
> > +}
> > +
> > +static int charlieplex_keypad_init_gpio(struct platform_device *pdev,
> > +					struct charlieplex_keypad *keypad)
> > +{
> > +	char **pin_names;
> > +	char label[32];
> > +
> > +	snprintf(label, sizeof(label), "%s-pin", pdev->name);
> > +
> > +	keypad->line_gpios = devm_gpiod_get_array(&pdev->dev, "line", GPIOD_IN);
> > +	if (IS_ERR(keypad->line_gpios))
> > +		return PTR_ERR(keypad->line_gpios);
> > +
> > +	keypad->nlines = keypad->line_gpios->ndescs;
> > +
> > +	if (keypad->nlines > MATRIX_MAX_ROWS)
> > +		return -EINVAL;
> > +
> > +	pin_names = devm_kasprintf_strarray(&pdev->dev, label, keypad->nlines);
> > +	if (IS_ERR(pin_names))
> > +		return PTR_ERR(pin_names);
> > +
> > +	for (unsigned int i = 0; i < keypad->line_gpios->ndescs; i++)
> > +		gpiod_set_consumer_name(keypad->line_gpios->desc[i], pin_names[i]);
> > +
> > +	return 0;
> > +}
> > +
> > +static int charlieplex_keypad_probe(struct platform_device *pdev)
> > +{
> > +	struct charlieplex_keypad *keypad;
> > +	unsigned int debounce_interval_ms;
> > +	unsigned int poll_interval_ms;
> > +	struct input_dev *input_dev;
> > +	int err;
> > +
> > +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> > +	if (!keypad)
> > +		return -ENOMEM;
> > +
> > +	input_dev = devm_input_allocate_device(&pdev->dev);
> > +	if (!input_dev)
> > +		return -ENOMEM;
> > +
> > +	keypad->input_dev = input_dev;
> > +
> > +	device_property_read_u32(&pdev->dev, "poll-interval", &poll_interval_ms);
> > +	device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce_interval_ms);
> > +	device_property_read_u32(&pdev->dev, "settling-time-us", &keypad->settling_time_us);
> 
> Not all of these are required properties. If they are missing the driver
> will operate on garbage values.

Yes.


> 
> > +
> > +	keypad->current_code = -1;
> > +	keypad->debounce_code = -1;
> > +	keypad->debounce_threshold = DIV_ROUND_UP(debounce_interval_ms, poll_interval_ms);
> 
> This will bomb if poll interval is 0.

Yes.

> 
> > +
> > +	err = charlieplex_keypad_init_gpio(pdev, keypad);
> > +	if (err)
> > +		return err;
> > +
> > +	input_dev->name		= pdev->name;
> > +	input_dev->id.bustype	= BUS_HOST;
> > +
> > +	err = matrix_keypad_build_keymap(NULL, NULL, keypad->nlines,
> > +					 keypad->nlines, NULL, input_dev);
> > +	if (err)
> > +		dev_err_probe(&pdev->dev, -ENOMEM, "failed to build keymap\n");
> 
> Missing "return".
> 
> > +
> > +	if (device_property_read_bool(&pdev->dev, "autorepeat"))
> > +		__set_bit(EV_REP, input_dev->evbit);
> > +
> > +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> > +
> > +	err = input_setup_polling(input_dev, charlieplex_keypad_poll);
> > +	if (err)
> > +		dev_err_probe(&pdev->dev, err, "unable to set up polling\n");
> 
> Missing "return".

Ok for both.

> I fixed it up and applied, please take a look in my 'next' branch and
> tell me if I messed up.

Thank you for the review and the fixes.

I tested it on the real hardware and all is good.

So I imagine that it can still go into 7.1 since it is a new driver
and not a modification of an existing one?


-- 
Hugo Villeneuve

