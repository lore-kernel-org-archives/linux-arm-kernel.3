Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6520FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKu/PnTsMfdfrNUgLITrJ3laiUxzpeE3q2csVANA9HI=; b=PADGzb4Gzy3IPT/VtfK+5aGbjl
	jlOMiLHTV8vr6yFu5wLnT6XuU5v55YL5msRii1zTKHJsk9gTa/Cp2kybMhL8OrjZEfPI7jPy+AJ9R
	UKz5V9EIT91rxj/WSbPUOHhge+U3gEGB98xTcjsuL4l+MSRYdxgyhZg5/R9UwW+anEox5V1ksF/Ri
	VrOmtfp+LWQAjl3Q4MqhTMT2gYOUscjAA4ohMLnNOKtcfxuQxBCudNd24nvYGRGKtENcoXrJjXS8X
	5AU/au2mdehRCsStq/URi0iDkzINUXdSja48ozfEhg2iaXrw2WdDH5NHuN852CFEyhQx3eLUrgTuA
	dDUgB91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzsn-00000003D3p-1TZe;
	Wed, 29 Apr 2026 08:02:57 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzsh-00000003D2U-1IwU;
	Wed, 29 Apr 2026 08:02:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E04E1481377;
	Wed, 29 Apr 2026 10:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1777449759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XKu/PnTsMfdfrNUgLITrJ3laiUxzpeE3q2csVANA9HI=;
	b=Vbt3RlPUil1i2DniqBNF9JZYLfvMI0P1STgz+E7KO4YjYVB7zNfNBBpKFj0u8Gq+3pHNFL
	JrV2zmqM9IMJhgnJirjegCYKIzRCT/Mab/SoLzSzpTIFGSM5k09U37Ea/u8+kAf3Rp+XAa
	CHlTWJYyo4Qn43DqzoIHilyFu+DnT1yE5X78+o4G5ntmKwcMVmQDsQUa2AN8Qy98twLu19
	IUmmYoqEdHo0mFN+2inqsLzhC1ANZ7N9oF3h+EWzCCSdubRQlD41C5BKNmQ0HwwwG4Q2dp
	vrx3n71UX2jC68O8frJWcrfG8f4GQUjYDgHk1mTUAtGOSGPSiLDtrx89hEbj2g==
Date: Wed, 29 Apr 2026 10:02:28 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
Message-ID: <20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
 <20260105-at91-probe-v3-3-594013ff2965@kernel.org>
 <20260423-stoke-ocean-139dbe306256@thorsis.com>
 <20260424-worried-renewal-924d34ed945c@thorsis.com>
 <87tsswfnmy.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tsswfnmy.fsf@bootlin.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_010251_969428_5D10FA56 
X-CRM114-Status: GOOD (  25.63  )
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

Hello Miquel,

thanks for your kind reply, I think with your help I have new
information now.

First of all: I could reproduce on an off-the-shelve sam9x60-curiosity
board, which has mainline dts, so others should be able to reproduce,
too.  Tested with v7.0 release and today's master
(v7.1-rc1-58-gdca922e019dd7).  See below for details:

Am Mon, Apr 27, 2026 at 05:07:01PM +0200 schrieb Miquel Raynal:
> Hi Alexander,
> 
> On 24/04/2026 at 12:56:27 +02, Alexander Dahl <ada@thorsis.com> wrote:
> 
> > Hei hei,
> >
> > after few hints in IRC yesterday, I tried to understand why neither
> > the ebi driver nor the nand driver are probed, but I failed.  See
> > below.
> 
> Just to be clear, I would not expect the NAND driver to probe "alone",
> it is described as a child node of the EBI controller which has its own
> compatible. As a result, only the of_platform_populate() at the end of
> the probe of the EBI can lead to the NAND controller to probe. The EBI
> node being a child node of a "simple-bus", this is the one we should
> focus on, because it should be probed.

Right, this is how I understood it, too.

> One reason (trying to be creative) could the that Rob's patch is
> dropping an explicit populate that maybe kind of bypasses checks that
> the "official" populate does. So maybe there is one resource that is
> missing and which is not ignored as it used to be by the core device
> driver (likely, dd.c).
> 
> Can you enable CONFIG_DEBUG_DRIVER and see in the logs if anything pops
> up? Maybe trying to trace (manually) in the core why we do not attempt
> to probe the EBI controller by looking for possible conditions to bail
> out early. Pinctrl is one of them, so maybe just removing all pinctrl
> references in the DT may help troubleshooting this (obviously probe will
> fail if pinctrl is incorrect, but if it is attempted we will have a
> culprit).

Was not aware of that option before, produces a lot of output, but I
think helpful output for this kind of problem, not quoting the whole
kernel log, but what I think is relevant here:

    [    0.177130] device: '10000000.ebi': device_add
    [    0.177222] bus: 'platform': add device 10000000.ebi
    [    0.177343] PM: Adding info for platform:10000000.ebi
    [    0.177531] platform 10000000.ebi: Not linking /ahb/apb/clock-controller@fffffc00 - might never become dev
    [    0.177584] /ahb/ebi@10000000 Dropping the fwnode link to /ahb/apb/clock-controller@fffffc00
    …
    [    0.217944] device: 'platform:fffffa00.gpio--platform:10000000.ebi': device_add
    [    0.218200] platform 10000000.ebi: Linked as a sync state only consumer to fffffa00.gpio
    …
    [    0.958298] bus: 'platform': add driver atmel-ebi
    [    0.958451] platform 10000000.ebi: bus: 'platform': __driver_probe_device: matched device with driver atmel-ebi
    [    0.958566] platform 10000000.ebi: error -EPROBE_DEFER: wait for supplier /ahb/apb/pinctrl@fffff400/ebi/ebi-data-lsb
    [    0.958649] platform 10000000.ebi: Added to deferred list
    [    0.959429] bus: 'platform': remove driver atmel-ebi
    [    0.959540] driver: 'atmel-ebi': driver_release
    …
    [    1.170809] pinctrl-at91 ahb:apb:pinctrl@fffff400: driver: 'pinctrl-at91': driver_bound: bound to device
    [    1.170871] /ahb/apb/adc@f804c000 Linked as a fwnode consumer to /ahb/apb/pinctrl@fffff400
    [    1.170947] /ahb/apb/adc@f804c000 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400/adc/adc-default
    [    1.171031] /ahb/apb/adc@f804c000 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400/adc/adtrg-default
    [    1.171122] /ahb/apb/can@f8004000 Linked as a fwnode consumer to /ahb/apb/pinctrl@fffff400
    [    1.171184] /ahb/apb/can@f8004000 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400/can1/can1-rx-tx
    [    1.171267] /ahb/apb/serial@fffff200 Linked as a fwnode consumer to /ahb/apb/pinctrl@fffff400
    [    1.171327] /ahb/apb/serial@fffff200 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400/dbgu/dbgu-0
    [    1.171409] /ahb/ebi@10000000 Linked as a fwnode consumer to /ahb/apb/pinctrl@fffff400
    [    1.171464] /ahb/ebi@10000000 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400/ebi/ebi-data-lsb
    [    1.171536] /ahb/ebi@10000000 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400/ebi/ebi-addr-nand
    …
    [    1.176057] platform 10000000.ebi: Linked as a sync state only consumer to ahb:apb:pinctrl@fffff400
    [    1.176127] device: 'platform:ahb:apb:pinctrl@fffff400--platform:f802c000.ethernet': device_add
    …
    [    1.178167] devices_kset: Moving 10000000.ebi to end of list
    [    1.178191] PM: Moving platform:10000000.ebi to end of list
    [    1.178222] platform 10000000.ebi: Linked as a consumer to ahb:apb:pinctrl@fffff400
    [    1.178248] /ahb/ebi@10000000 Dropping the fwnode link to /ahb/apb/pinctrl@fffff400
    …
    [    3.431138] devices_kset: Moving 10000000.ebi to end of list
    [    3.431206] PM: Moving platform:10000000.ebi to end of list
    [    3.431256] platform 10000000.ebi: Retrying from deferred list
	…
    [    3.437765] UBI error: cannot open mtd rootfs, error -2

So the ebi driver is probed but returns with -EPROBE_DEFER, to my
interpretation because the pinctrl driver is not ready?  Later the
pinctrl driver drops the relation?  On retry from the deferred list
the driver does not probe again?  This feels strange, because other
drivers probe as usual after that "Retrying from deferred list"
message.  But other deferred drivers do not have that "remove driver"
and "driver release" messages.

The pinctrl itself seems to work, gpiodetect and gpioinfo show
reasonable output, gpio connected LED works as expected.

No time to dig into this further right now,
but sharing what I have so far anyways.

Greets
Alex


