Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A503C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpLhIi7Kz6CQZ4yMzp2mUBrSEQXZDgA4zptLKbGKRLc=; b=1uH5AV0wAGczVDTVHsMyne9Cza
	6kdYOEgQapixPvZj9rbsS2tN7ZEeHTHUk85FMGQOnIxE5Ambrzgxev4gzuPalS2YAgxftRhiF2hOQ
	W3bkxslUNqNsfb7iwdJGAVE5xZlo245lqtk5DrXwI+E7AOZOquAaGSeDs85AJCdgSjRYI/HmvEnH4
	lJmf1Rz7nFS2/o/T6AIB1Vq1VvS1JQrdihG6LKFXC8Ka1UUGi7113bxjaHabWjbvgE74fij5xXF5x
	vLq+GIpp5nMTv3N8k62F2xT98NmPPkuevEpvorOQ/qnsF5vSWNP3LfQdUGgw/37M3Fz5Upial3HuU
	HgnsIT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHJi-00000002cJr-1zyP;
	Fri, 09 May 2025 06:34:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHHf-00000002c2E-3aA9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:32:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uDHHR-00046g-Ca; Fri, 09 May 2025 08:32:21 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uDHHQ-001qPI-1J;
	Fri, 09 May 2025 08:32:20 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uDHHQ-00CHwN-0v;
	Fri, 09 May 2025 08:32:20 +0200
Date: Fri, 9 May 2025 08:32:20 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature
 sensors
Message-ID: <aB2hdA8mfKGlk8d8@pengutronix.de>
References: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
 <20250507120104.4mhuaabe5auukarn@banter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507120104.4mhuaabe5auukarn@banter>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_233235_893984_1429D7E7 
X-CRM114-Status: GOOD (  30.45  )
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

Hi Nishanth,

On Wed, May 07, 2025 at 07:01:04AM -0500, Nishanth Menon wrote:
> On 15:24-20250505, Sascha Hauer wrote:
> > The AM625-SK has six power sensors and two temperature sensors connected
> > to I2C. Add them to the device tree.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > The AM625-SK has six power sensors and two temperature sensors connected
> > to I2C. Add them to the device tree.
> 
> Sascha,
> 
> I suggest making this as overlay. The reason is as follows: AM625-SK
> among other TI evms do have automated power measurement capability from
> XDS110 (accessible via USB port for jtag - appears as a rudimentary
> menu option). The way this works is that it uses TM4C1294NCPDT to use
> I2C commands to control the INA226/231 depending on the evm.
> 
> This firmware should be flashed by default on production boards (if
> not, starting up CCS[1], autodetects older firmware and updates - at
> least to my understanding) - by the way, this firmware also does test
> automation, such as boot mode switch control, reset control etc.
> 
> This is the primary framework meant to be used by test automation and
> indeed it is the default inside TI.
> 
> Challenge here is this: if we make this default in Linux, the test
> automation system configures the INA226/231 in a different sampling
> mode depending on usecase etc Vs what Linux does (even though the
> shunt and the bus voltage for a given INA is the same). And just like
> Linux, the firmware power measurement logic has changed over the
> years.
> 
> Anyways, while I know that the SoC and TM4C can both handle
> multi-master, the challenge is the same INA controlled and
> mix-configured by two masters (and there is no synchronization between
> the two).
> 
> To avoid this entire conflict and headache, I suggest adding it as
> overlay that can be applied depending on the preference of measurement
> desired.

Thanks for this explanation. I'll go for the overlay then.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

