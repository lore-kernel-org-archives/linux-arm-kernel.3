Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FF9E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6tgjtGuZAZYpQX7UB8px4+rlQbXawD8OcbC4h3qdLQ=; b=P2U6BNBfA5YbqAMB57d8qlkHGy
	S9IiizBLgfhHkG03Dyr9YnawEFMiCnByKgwUCisgc0yGeowCZKStgUDQcww65IMzmyqp3+JHA8KSg
	2JZcpy/WdSzDfM7yDZU2rryUnxdx0yOIurufAjU7ZHYN4IqDKDzzTvr3ADQZeiuzo3rBUQayWmBHc
	LJb4NTCpus9SwYHNqxnYlmmZQoVc66bCFfEIbCix+ZKWwWY3/YNRway4Ad6T56od+kQXZGCBh7PU7
	5vtrLOTnoz+HWMJBT6Q0lctiSwCtmNNDIoqVys84KoPlzq0W6CyU4pIjefHNqfwwcCcq3acNwHn/q
	vfPaz2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2tM-00000000GVX-3hTH;
	Wed, 18 Dec 2024 22:51:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2rX-00000000GGW-2vrn;
	Wed, 18 Dec 2024 22:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l6tgjtGuZAZYpQX7UB8px4+rlQbXawD8OcbC4h3qdLQ=; b=UwdQuMcGp6v4V6yuMHPbP3RnCj
	ZO0VOo3UBHLv4IiuJ9gdLsSqt+cwpzBMtrYaQKGUCtwMGypHW0GezgxeCjKInu3agQpIbAAg0+2re
	YSaQdwooHedwxUGw981Dl3yxMaZQbz3gm2IZxhyYNp3Ur3hhCaDf7juqUse653WvVAOAhXIEs+jA4
	Br5kiCOuJ+8rTBzCrfY92sR7xUFv1R9Y+ZvOp42vq45YcNyVGFBkKurihef3wQj5fRCvdcaWJrS5U
	qDKaL/FpoaiWWD3lbgGBcfIqKIERSI9T5+OwWOphf8IHgWbUoiRgxbThlwPrfk8Hrz1F7ArUtVLXw
	JB8yfd4g==;
Received: from i53875bfb.versanet.de ([83.135.91.251] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tO2r2-0005qY-Jd; Wed, 18 Dec 2024 23:49:20 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: jikos@kernel.org, jic23@kernel.org, Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jdelvare@suse.com, linux@roeck-us.net, srinivas.pandruvada@linux.intel.com,
 bentiss@kernel.org, dmitry.torokhov@gmail.com, pavel@ucw.cz,
 ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH v9 0/9] Drivers to support the MCU on QNAP NAS devices
Date: Wed, 18 Dec 2024 23:49:19 +0100
Message-ID: <15355121.tv2OnDr8pf@diego>
In-Reply-To: <20241212171954.GI7139@google.com>
References: <20241107114712.538976-1-heiko@sntech.de>
 <173402387748.2234929.7484373598047473898.b4-ty@kernel.org>
 <20241212171954.GI7139@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_144951_782568_6DC67A16 
X-CRM114-Status: GOOD (  21.26  )
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

Am Donnerstag, 12. Dezember 2024, 18:19:54 CET schrieb Lee Jones:
> On Thu, 12 Dec 2024, Lee Jones wrote:
> 
> > On Thu, 07 Nov 2024 12:47:03 +0100, Heiko Stuebner wrote:
> > > This implements a set of drivers for the MCU used on QNAP NAS devices.
> > > 
> > > Of course no documentation for the serial protocol is available, so
> > > thankfully QNAP has a tool on their rescue-inird to talk to the MCU and
> > > I found interceptty [0] to listen to what goes over the serial connection.
> > > 
> > > In general it looks like there are two different generations in general,
> > > an "EC" device and now this "MCU" - referenced in the strings of the
> > > userspace handlers for those devices.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/9] HID: hid-sensor-hub: don't use stale platform-data on remove
> >       commit: e079a120f31e3f9c00180aa13c1df18cc138f7fe
> > [2/9] mfd: core: make platform_data pointer const in struct mfd_cell
> >       commit: 8f4009ad901c44f0428dbde654c4dd1fb29c863b
> > [3/9] dt-bindings: mfd: add binding for qnap,ts433-mcu devices
> >       commit: 8877bcff3e3b4f08a1fc0232dbfdaeda085cfdf3
> > [4/9] mfd: add base driver for qnap-mcu devices
> >       commit: 944ca826f69e4723853b3876875b03aeafe67b60
> > [5/9] leds: add driver for LEDs from qnap-mcu devices
> >       commit: fe6a21ee38f12e3e5f9adbd2f9a840be105b943f
> > [6/9] Input: add driver for the input part of qnap-mcu devices
> >       commit: 4b27e0da257371d3d141fae38fdbdc3c3a67bce6
> > [7/9] hwmon: add driver for the hwmon parts of qnap-mcu devices
> >       commit: 41755872a8a8ab8d1644459d9634c53b743fe2be
> 
> Once build testing is complete, I'll send out a PR.

thanks a lot for picking up the driver patches.

Heiko



