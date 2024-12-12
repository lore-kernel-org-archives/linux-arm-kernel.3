Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA96E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJ26I3d85mS7q9GOyii3IlleYdq4ow6UEXxq3EWm6kU=; b=itDm3tbLWCzwIV26k2jLGkaCJB
	RJYoxq1F9YVDp301p39aQIQb2XC4anuXSCC+p99NRJpO0o0wc7kuRGo1OJKcolwaURFTZ1DvWUfS3
	W+wjg5G5pXYbq5Hu7QcJ8MfoGzH4NAwLHqEJbPntBmHCaMmYp1wuEaMFGVKpachNQk+xp/MxuRtPQ
	DbAmcuHBDhxPH/giRiH/j3UswL0h3X2ILGgXA7jvbGip5N7SUU+Qsh3buah0LlSugiyZjy12uRv+B
	+ZzRt2YpMmkftTAmAJdQ0Q270aUl2Ljjnz5oO+TmNbfVPBH2MYAHMp70H+RL7sNZPLaylgFbmWjmP
	5fEwQmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnBG-00000001E7V-3wHq;
	Thu, 12 Dec 2024 17:40:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmr3-000000019hi-3Tok;
	Thu, 12 Dec 2024 17:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0D8D5C629D;
	Thu, 12 Dec 2024 17:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB52C4CED3;
	Thu, 12 Dec 2024 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734024001;
	bh=LA9bximptyWrxDDOhzWENsKcJdq+AL2ptZwBglUEvIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRdRO6rogumis9deCjy6y6ne1ICA01Nh28nZ0MFx+VpQWtctwbkrEQoULb7X2nZty
	 ib2ozEVzuuRswzktShb+9DTiYhG857AZfG6MV6HCngGUp6uB8wZQG7B6Sck/TO0bsl
	 GyKNbkmGweOgJkpqNJDZZ53agK6Fd1cMKQtu5pDVrijPxLL166lYt3c5cwE54JtnL6
	 o2MtW/WjDFjq//DW+MEBykBnNxiWdMRUXS5pipOvZJxfpj2nUobqZWQgyE+EYIW6RW
	 2oOFQd/rETDW5+xsMmQwyU0Y9bMLeYi8jSDf1hRCRx6K/eCgkc+BcrplodMYV6MtFE
	 gUHXkDWQvzwdQ==
Date: Thu, 12 Dec 2024 17:19:54 +0000
From: Lee Jones <lee@kernel.org>
To: jikos@kernel.org, jic23@kernel.org, Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, pavel@ucw.cz, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v9 0/9] Drivers to support the MCU on QNAP NAS devices
Message-ID: <20241212171954.GI7139@google.com>
References: <20241107114712.538976-1-heiko@sntech.de>
 <173402387748.2234929.7484373598047473898.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173402387748.2234929.7484373598047473898.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_092001_911385_0A762445 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, 12 Dec 2024, Lee Jones wrote:

> On Thu, 07 Nov 2024 12:47:03 +0100, Heiko Stuebner wrote:
> > This implements a set of drivers for the MCU used on QNAP NAS devices.
> > 
> > Of course no documentation for the serial protocol is available, so
> > thankfully QNAP has a tool on their rescue-inird to talk to the MCU and
> > I found interceptty [0] to listen to what goes over the serial connection.
> > 
> > In general it looks like there are two different generations in general,
> > an "EC" device and now this "MCU" - referenced in the strings of the
> > userspace handlers for those devices.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/9] HID: hid-sensor-hub: don't use stale platform-data on remove
>       commit: e079a120f31e3f9c00180aa13c1df18cc138f7fe
> [2/9] mfd: core: make platform_data pointer const in struct mfd_cell
>       commit: 8f4009ad901c44f0428dbde654c4dd1fb29c863b
> [3/9] dt-bindings: mfd: add binding for qnap,ts433-mcu devices
>       commit: 8877bcff3e3b4f08a1fc0232dbfdaeda085cfdf3
> [4/9] mfd: add base driver for qnap-mcu devices
>       commit: 944ca826f69e4723853b3876875b03aeafe67b60
> [5/9] leds: add driver for LEDs from qnap-mcu devices
>       commit: fe6a21ee38f12e3e5f9adbd2f9a840be105b943f
> [6/9] Input: add driver for the input part of qnap-mcu devices
>       commit: 4b27e0da257371d3d141fae38fdbdc3c3a67bce6
> [7/9] hwmon: add driver for the hwmon parts of qnap-mcu devices
>       commit: 41755872a8a8ab8d1644459d9634c53b743fe2be

Once build testing is complete, I'll send out a PR.

Note to self: ib-mfd-hid-hwmon-input-leds-6.14

-- 
Lee Jones [李琼斯]

