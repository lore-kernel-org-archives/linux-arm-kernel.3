Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31375C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSvaPFIWafQkZqGzC/qdKkRz2rUhWQRnX74Hy9M6UqA=; b=4YvyrYho4/9VH0J+28PhJJ2Ai9
	RrKKXWXu9HBZtA1P7BX+yZqM53hL58RfKqFZAqfivQ7I7ocmnlO6GOqOxGI+ele34LXQ/wBH/tSqu
	eom8tE50WIJ8wSIoaOr6pJnKRFQ1DV6cks8THLhPb0qi2gznwLVhhDqFB4oCtK1aXbPxTgaxKjfUL
	oby+c+1goJuS8edSUsE2N43q/C+DH2Lg4NlKlLsc0z4HBB4PpvN+wCxu8oIyslUYVYv2NrDkfBIUR
	cEBM7b0oy5uBtTAS62kfWyMyPCBuG3yNs605gM/M+NEmEbJy9kWcXjbhJX/DbE9VCfyNHWXSvgKet
	Zg5cB+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMKa-00000008TYU-3jB8;
	Mon, 12 May 2025 06:08:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMIS-00000008TFc-3ePw;
	Mon, 12 May 2025 06:05:54 +0000
X-CSE-ConnectionGUID: wlizszXLQg6Y4nnvpFGh+g==
X-CSE-MsgGUID: FjB5gzcYRReNPUYXbjc9PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48963049"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48963049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:05:51 -0700
X-CSE-ConnectionGUID: bxRpOiD7R1uKTkZlZBLPoQ==
X-CSE-MsgGUID: l0s9Hr4aRCGnANvYeI0kaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137202143"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:05:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uEMIK-00000000pFH-2LBW;
	Mon, 12 May 2025 09:05:44 +0300
Date: Mon, 12 May 2025 09:05:44 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aCGPuKtfprIvwADa@smile.fi.intel.com>
References: <20250508150140.GS3865826@google.com>
 <20250510074802.8400-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250510074802.8400-1-trannamatk@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_230553_131306_0C779BE0 
X-CRM114-Status: GOOD (  32.79  )
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

On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> On Thu, 8 May 2025 Lee Jones wrote:
> > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:

...

> > > > > > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> > > > >
> > > > > This is fine.
> > > > >
> > > > > Just be aware, before you submit to LEDs again, that you need to use
> > > > > what is available in the LEDs subsystem to it's fullest, before
> > > > > hand-rolling all of your own APIs.  The first submission didn't use a
> > > > > single LED API.  This, as before, would be a big NACK also.
> > > >
> > > > Thanks for the clarification.
> > > >
> > > > Just to confirm — the current version of the driver is customized to allow
> > > > user space to directly manipulate LP5812 registers and to support the
> > > > device’s full feature set. Because of this, it doesn’t follow the standard
> > > > LED interfaces.
> > > 
> > > But why? What's wrong with the LED ABI? (see also below question
> > > before answering to this one)
> > > 
> > > > Given that, would it be acceptable to submit this driver under the misc subsystem instead?
> > > 
> > > But these are LEDs in the hardware and you can access them as 4
> > > individual LEDs, right?
> > 
> > Right.  Please work with the API you are offered in the first instance.
> > My first assumption is always that this driver isn't as special as you
> > think it might be.
> 
> In direct mode, we can access them as individual LEDS. User doesn't need
> to select LEDs. In this mode, it is a simple LED driver.
> 
> However, user must select LEDs in scan mode. The hardware uses 4 pin to
> display 12 LEDs (or 4 RGB LEDs). Ordering of LED selection also impact
> to display capacibility. That why, I need to support another interface
> for user to controll hardware's registers.
> 
> In mix mode, we can control an individual LED and up to 6 scan LEDs.
> However, user must select the order of single LED and which LEDs will be
> use for scan function.
> 
> The main point is user must have capacibility in write information to
> hardware's registers to select LEDs in scan mode and mix mode.
>  
> Besides system modes (direct mode, scan mode, mix mode), each LED has
> manual mode and autonomous mode.
>  
> A example steps to display a LED in manual mode
> # Set drive mode is Scan mode with 4 scan. Scan order 0 is out_0,
> # Scan order 1 is out_1, Scan order 2 is out_2, and Scan order 3 is out_3
> echo tcmscan:4:0:1:2:3 > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/dev_config
> # Enable led_A0
> echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/activate
> # Enable manual mode
> echo manual > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
> # Set Dot Current
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/manual_dc
> # Set Manual PWM
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/manual_pwm
>  
> However in autonomous mode, the steps are complicated
> # Set drive mode is Scan mode with 4 scan. Scan order 0 is out_0,
> # Scan order 1 is out_1, Scan order 2 is out_2, and Scan order 3 is out_3
> echo tcmscan:4:0:1:2:3 > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/dev_config
> # Enable led_A0
> echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/activate
> # Enable autonomous mode
> echo autonomous > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
> # Config autonomous animation mode: (only use AEU1, start pause time: 3.04s,
> # stop pause time: 3.04s, playback time: infinite time)
> echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
> # Config AEU1 playback times
> echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/playback_time
> # Config PWM
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm1
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm2
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm3
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm4
> echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm5
> # Config slope time
> echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t1
> echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t2
> echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t3
> echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t4
> # Start autonomous
> echo start > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/device_command
>  
> I think setting PWM also same as brightness_set API. However, there are
> many PWM config for a LED and it is one of other config to make autonomous mode work.
> Therefore, standard led API can use in some use cases only.
> 
> Please see the link below for a better visualization of how to configure the LP5812.
> https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/

To me it sounds like you should start from the small steps, i.e. do not
implement everything at once. And starting point of the 4 RGB LEDs sounds
the best approach to me. Then, if needed, you can always move on with
fancy features of this hardware on top of the existing code.

-- 
With Best Regards,
Andy Shevchenko



