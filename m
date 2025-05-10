Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B018FC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2i541JactdL/Fn0WUUK9pFnqlbvY//X527+EunCRdg=; b=a7pooTlxlTRZc0tUl8OA/PDWSn
	N80qHCjVqiCvVhBfCbWsHd7cNbrkZlBLV4RA1xbl2IAa9J7C0UJ+s2i1hsUPnYDGmBz3qWCIRd2c6
	q0iPRVOedmdpQZwTskPMRpO/lttE67CGOFimE9eHHSxmdUzFwhxagmTaicgfo7ImP5bZWLURl+ta+
	82BTNa3Dc3jyaMBTF0SPFbHA9hrYs4zP4LmpBnTWEu84DKkTPCt+X4BzJ+JEu0tQQYZcYgDAGyzoV
	wqKp2bDBmMRBsQO4MvQB/+bwzOyBYxAWs2NEefokLSspNvVvNKjwcAD3tnAGp3OT+PgmBySdpjlt7
	4GOp77vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfCh-00000005c1i-0uwt;
	Sat, 10 May 2025 08:05:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDewg-00000005Zuq-3P5L;
	Sat, 10 May 2025 07:48:35 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso3930728b3a.2;
        Sat, 10 May 2025 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746863309; x=1747468109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2i541JactdL/Fn0WUUK9pFnqlbvY//X527+EunCRdg=;
        b=GRURnz0Q0RvtDPTEtSazUxjAfKKGsbu9Ydqb7mPOdHmSeZo4fopTeeEDavgLg9Nell
         5tE8B0IQfdqexnaF5DSnQjmPTB0kXM4Avpyu8uTosw98RyOcSfQE326QvU1bB2binZX7
         S5oZpcga9roTbSYgnKqr0BWD5r1vmdm3mayP9eMGBw2mubyUdSPjnusngn9HIbtCQ5GQ
         tSwicn+dLDWXcHa9tUGTbZ9nYBQixuDTrgrt9BqXJdYUYTRYJdx69LM0BaDAGWPaXlfp
         uoyb++T9vTFaYMkKzwISG4J+Z49rohyBLMrs38JpvkBOVw8ys3qzU7qcC7UsrDsoPlyG
         YE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746863309; x=1747468109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2i541JactdL/Fn0WUUK9pFnqlbvY//X527+EunCRdg=;
        b=Nqs/PcRdF13GKC22lomiSZR4omdhxxmnTLjJgWX9GsdsEYoqRIZAqPPm/EVthBgS98
         7hsXh7Hh2jT/nDg8bjrEWJKMqwOqA82h3y4qNQaVpZcxXl1wDaVPgsBPrhLcrDCV98Us
         8XNaBn7j1F2fIDTWH376b/u9Qx82FHm3s4CQNDtLUAB61jZ58liPCRwFPJlN5qCFtmmi
         oHmsvuF04qob0EBnlrZtqGzU7bgafxaCtpvXnBPZ8KxdlhH1SDPyJQgbSphkcLOWP1+4
         C1cQqrXaElDZFTly+SR5qGBRt3bBqDFKJodKYd3JHKEbt+UNl4SyoLEmh7mqhGLOdKH8
         8EzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEtO+6qselZWpqSBFrtVLINHwfVHt2MJ36ZZSGw/7hZLfZrwbyNpxgXnYOvCEIt57p1spjpCLeXQ4fFsn4QirE@lists.infradead.org, AJvYcCWAnn8DU0qrEGXV31z9jSBcuG8uV2FPebmhnhD6nQf5IJ3axj0mNLhOHT8CVF/fff3wnnRv5St++IZB1FU0kMrRTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwyCD8t0P7eiEuWBYaRxDzvR7r56wZWHtyBJpsSvRW6S4s3kzJ
	jkETfFlN95FJqCqEGLl6nMfpTQAnwK6eidotqICA7yJfxiJtRRm/
X-Gm-Gg: ASbGnct6mm+fg4tvG5+6lzicupU5Hz67vgC+rC7nU3z+tH36b11zuUcofKQM+sKgFui
	08bAl+Go5ennhTxQ1i1EpuJBs9777cMadtaNUY859qfzmKiEO0JhVxp5IiBDvb8Oxvf9aFAXkus
	vxr2InJ6v1VijF7Kbd5Vl3WvULlE723CylHDvtt54NK9e7N/n+XARKcMytx1bKoL/+ExhWyyn5M
	wcUOaD/Wa6k0Mb7k9mnzUMPF2TwEV11YOWfGdiZAvHQv+1vT7Hqj6pCOPonfbV2YKl5A0eXQx7V
	H/fjKSB0SVQELXwzMMANJKfMXDjrV3KrkRvz2ajq3ir1egEykX46wTiufdnWS2Xk/Q==
X-Google-Smtp-Source: AGHT+IECkuXLke0wLP6OjjKu1jeRoUh4dn5bHDx4utT68jzSDAJKgBulXvY4StbjFDz8y/Tlrjm0sw==
X-Received: by 2002:a05:6a00:2d08:b0:740:67ce:1d8b with SMTP id d2e1a72fcca58-7423bbf68e9mr9400091b3a.7.1746863309456;
        Sat, 10 May 2025 00:48:29 -0700 (PDT)
Received: from localhost.localdomain ([14.181.130.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a1088csm2752610b3a.113.2025.05.10.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 00:48:28 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: andy@kernel.org,
	geert@linux-m68k.org,
	pavel@ucw.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Sat, 10 May 2025 14:48:02 +0700
Message-Id: <20250510074802.8400-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250508150140.GS3865826@google.com>
References: <20250508150140.GS3865826@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_004830_849138_D3A866A6 
X-CRM114-Status: GOOD (  28.24  )
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

On Thu, 8 May 2025 Lee Jones wrote:

> On Thu, 08 May 2025, Andy Shevchenko wrote:
> > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> > 
> > ...
> > 
> > > > > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> > > >
> > > > This is fine.
> > > >
> > > > Just be aware, before you submit to LEDs again, that you need to use
> > > > what is available in the LEDs subsystem to it's fullest, before
> > > > hand-rolling all of your own APIs.  The first submission didn't use a
> > > > single LED API.  This, as before, would be a big NACK also.
> > >
> > > Thanks for the clarification.
> > >
> > > Just to confirm — the current version of the driver is customized to allow
> > > user space to directly manipulate LP5812 registers and to support the
> > > device’s full feature set. Because of this, it doesn’t follow the standard
> > > LED interfaces.
> > 
> > But why? What's wrong with the LED ABI? (see also below question
> > before answering to this one)
> > 
> > > Given that, would it be acceptable to submit this driver under the misc subsystem instead?
> > 
> > But these are LEDs in the hardware and you can access them as 4
> > individual LEDs, right?
> 
> Right.  Please work with the API you are offered in the first instance.
> My first assumption is always that this driver isn't as special as you
> think it might be.

In direct mode, we can access them as individual LEDS. User doesn't need
to select LEDs. In this mode, it is a simple LED driver.

However, user must select LEDs in scan mode. The hardware uses 4 pin to
display 12 LEDs (or 4 RGB LEDs). Ordering of LED selection also impact
to display capacibility. That why, I need to support another interface
for user to controll hardware's registers.

In mix mode, we can control an individual LED and up to 6 scan LEDs.
However, user must select the order of single LED and which LEDs will be
use for scan function.

The main point is user must have capacibility in write information to
hardware's registers to select LEDs in scan mode and mix mode.
 
Besides system modes (direct mode, scan mode, mix mode), each LED has
manual mode and autonomous mode.
 
A example steps to display a LED in manual mode
# Set drive mode is Scan mode with 4 scan. Scan order 0 is out_0,
# Scan order 1 is out_1, Scan order 2 is out_2, and Scan order 3 is out_3
echo tcmscan:4:0:1:2:3 > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/dev_config
# Enable led_A0
echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/activate
# Enable manual mode
echo manual > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
# Set Dot Current
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/manual_dc
# Set Manual PWM
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/manual_pwm
 
However in autonomous mode, the steps are complicated
# Set drive mode is Scan mode with 4 scan. Scan order 0 is out_0,
# Scan order 1 is out_1, Scan order 2 is out_2, and Scan order 3 is out_3
echo tcmscan:4:0:1:2:3 > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/dev_config
# Enable led_A0
echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/activate
# Enable autonomous mode
echo autonomous > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
# Config autonomous animation mode: (only use AEU1, start pause time: 3.04s,
# stop pause time: 3.04s, playback time: infinite time)
echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
# Config AEU1 playback times
echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/playback_time
# Config PWM
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm1
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm2
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm3
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm4
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm5
# Config slope time
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t1
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t2
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t3
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t4
# Start autonomous
echo start > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/device_command
 
I think setting PWM also same as brightness_set API. However, there are
many PWM config for a LED and it is one of other config to make autonomous mode work.
Therefore, standard led API can use in some use cases only.

Please see the link below for a better visualization of how to configure the LP5812.
https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/

Best regards,
Nam Tran

