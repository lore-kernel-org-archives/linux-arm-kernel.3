Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63045C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtPJKNaE4WcuVc5YwBiELvb87xQFlonOqEb7ycejGWs=; b=f3h9ZiaGDYwH7eu4bLz8fbUy17
	MqM4XEPZcNfUKvhytiUWRz8VkUaZi6vm9cFC+kkCJTbHzMR7TMb47smWsoPYZnHlIpdWK7duE5sqf
	ez8+Bvtb5FJJ/numnc4oIPpvk4cN33wbLq0i1GivEzaM8nuVq4gEo6CmB15cU5uRJ004GpNKdZuOC
	dFEVXHu6Uh7C6G0rd0xR1K/FY4WHsKVc5Ck/4uaLP6/6i3+maC7zPHFNTjuGFMSUFwNlscYz2yiqo
	4En82Mn+gNe8t5EGpPAWfiA7yE0W9NhTHgSJErru9lC950xLnZcGaGkFnEvgG7qFK452jPWo0qiNn
	Ymz2I/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCBx-00000003lzi-1wV5;
	Thu, 02 Jul 2026 07:50:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCBu-00000003lyz-44pP;
	Thu, 02 Jul 2026 07:50:36 +0000
Date: Thu, 2 Jul 2026 09:50:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782978630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtPJKNaE4WcuVc5YwBiELvb87xQFlonOqEb7ycejGWs=;
	b=ktA+1FG0uc0MpcfFBfjgObbpj1U2vTHJD+a8QZ9NUQoPTaxMTsh6sWdhKJ1TxSojJVe/5y
	uCfgbvkxVCTLnNEwTHeIPd6GHouW/Vy6SLs+1thyxBndtqLpDau++4TxB3zCHqHYFJzPvL
	q/RtS1gpvU2+ZnzrXhGSc0CDWHpdZ2jbOXXV1GHNM2kKUUTfTYNKrIBYX0uy6yNgSYdwu5
	f71uxFyIAfcDu1dMpFVDA+ZVqtdLEswhlN3iI/WNQahncfppXIE8ps4ki5Jz4CEZMmJvW8
	kPiKHzDzD9EMLcj3AJQiHSOUZIPj6hTBVSr2hGdKm7EojswHOH0BVzdTNZ0lJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782978630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtPJKNaE4WcuVc5YwBiELvb87xQFlonOqEb7ycejGWs=;
	b=ASRxoRgbtWDj0QrDDU+aNK1aGddpBaqkCR+2bZ0jnK/9Tyl8Y+7xlRiZaRO6E+2t+KItnf
	zmcuHR36FwVj+ODg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] firmware: raspberrypi: Add reboot mode support
Message-ID: <6x2espobfxvtxoszno3fehzixc67e2cihjdsah3ge3qbrgjoeg@3ss4vdo2hz77>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
 <20260630-rpi-tryboot-v2-3-f68d2dc6aa27@linutronix.de>
 <628b2768-80e6-4a7b-846f-d1124059f899@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <628b2768-80e6-4a7b-846f-d1124059f899@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_005035_174680_1A0954DB 
X-CRM114-Status: GOOD (  17.69  )
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

Hi Stefan,

On Tue, Jun 30, 2026 at 11:57:49PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> Am 30.06.26 um 22:59 schrieb Gregor Herburger:
> > +static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *reboot,
> > +					  unsigned int magic)
> > +{
> > +	struct rpi_firmware *fw = container_of(reboot, struct rpi_firmware,
> > +					       reboot_mode);
> > +	int ret = 0;
> > +
> > +	if (magic)
> > +		ret = rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
> > +					    &magic, sizeof(magic));
> I think it's more elegant to check for !magic and return 0 directly. So we
> can drop "ret".
> > +
> > +	return ret;
> > +}
> > +
> >   static int rpi_firmware_probe(struct platform_device *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> >   	struct rpi_firmware *fw;
> > +	int ret;
> >   	/*
> >   	 * Memory will be freed by rpi_firmware_delete() once all users have
> > @@ -306,6 +323,12 @@ static int rpi_firmware_probe(struct platform_device *pdev)
> >   	rpi_register_hwmon_driver(dev, fw);
> >   	rpi_register_clk_driver(dev);
> > +	fw->reboot_mode.dev = dev;
> > +	fw->reboot_mode.write = rpi_firmware_reboot_mode_write;
> > +	ret = devm_reboot_mode_register(dev, &fw->reboot_mode);
> > +	if (ret)
> > +		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
> I suggest to move all of this code into a function called
> rpi_register_reboot_mode() ?
> 

Ok, will do. Will wait a bit for more feedback and add this to the next version.

-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer

