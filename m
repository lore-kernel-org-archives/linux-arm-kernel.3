Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB747C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/mjUrCDUh8TvGQ0TNP99UWlQJSkPZIBxxqCtz4GkI0=; b=GlJ3bokXQrb0+q
	NQoE7uI3lN8pZ/n8JBHP+nEhjOWbZLBmXXceE0U+TAfZ9XN6DHJVo7fXi2b9TbPrro/B/9g9YyKLd
	U4jLxH44uuCyQ7XHWt6xitHC3fAy0PtvDSe+GRJQ+Na3uKeoWuYyJ3E+FxFfUcyTs/7JtgYsd9/OI
	RWl0f0rtMQ2bRL/df4oZ1/2y6N+7nD/zaC6sy8Ba0uXj7FpXVQLApBGzmZWLM3x5kWYwLOACoj/RP
	Px3qFfhn6N686wCNN4L1sBmhYtwWBmRig+ENuR7nUWcHHcfaIx/o2lnuQ8qwzIequNTXko8JjkzDb
	ceM0ybJUSvUpxk3NMvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GM-00000001C1T-2huf;
	Mon, 03 Mar 2025 14:59:22 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Em-00000001Bne-15vU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=C/mjUrCDUh8TvGQ0TNP99UWlQJSkPZIBxxqCtz4GkI0=; b=cFgkZnKIv0/ZHT36d/Zwl7IRW1
	fW9cvHeQLM8AeK7zGY/zPOWZy9w7wMXgJkCSy5z05SlMk8da27MCzCKt29/I0lhlBw2CscACezTh4
	2mG4q/f/ES1WSSFlTCdeu0TFqSsnFwe8mN+Gu37FBSbil4W7sh78YpEv424PPHAysC1w=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:56514 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1tp7EM-0000V2-1t; Mon, 03 Mar 2025 09:57:18 -0500
Date: Mon, 3 Mar 2025 09:57:17 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Dumitru Ceclan
 <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, Matteo
 Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman
 <alisadariana@gmail.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Message-Id: <20250303095717.56ef5ac016b99911fc34e198@hugovil.com>
In-Reply-To: <7c79ce3a-0dc4-4aa4-941a-e05be9a34fb8@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
	<20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
	<f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
	<d391b012-0a8e-40ca-af56-ca73b3fd853b@gmail.com>
	<20250302032713.1c834448@jic23-huawei>
	<7c79ce3a-0dc4-4aa4-941a-e05be9a34fb8@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree
 config
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_065744_375341_2E3D4B46 
X-CRM114-Status: GOOD (  33.08  )
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

On Sun, 2 Mar 2025 15:10:12 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 02/03/2025 05:27, Jonathan Cameron wrote:
> > On Wed, 26 Feb 2025 08:39:11 +0200
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> > 
> >> On 26/02/2025 02:09, David Lechner wrote:
> >>> On 2/24/25 12:34 PM, Matti Vaittinen wrote:
> >>>> The ti-ads7924 driver ignores the device-tree ADC channel specification
> >>>> and always exposes all 4 channels to users whether they are present in
> >>>> the device-tree or not. Additionally, the "reg" values in the channel
> >>>> nodes are ignored, although an error is printed if they are out of range.
> >>>>
> >>>> Register only the channels described in the device-tree, and use the reg
> >>>> property as a channel ID.
> >>>>
> >>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >>>>
> >>>> ---
> >>>> Revision history:
> >>>> v3 => v4:
> >>>>    - Adapt to 'drop diff-channel support' changes to ADC-helpers
> >>>>    - select ADC helpers in the Kconfig
> >>>> v2 => v3: New patch
> >>>>
> >>>> Please note that this is potentially breaking existing users if they
> >>>> have wrong values in the device-tree. I believe the device-tree should
> >>>> ideally be respected, and if it says device X has only one channel, then
> >>>> we should believe it and not register 4. Well, we don't live in the
> >>>> ideal world, so even though I believe this is TheRightThingToDo - it may
> >>>> cause havoc because correct device-tree has not been required from the
> >>>> day 1. So, please review and test and apply at your own risk :)
> >>>
> >>> The DT bindings on this one are a little weird. Usually, if we don't
> >>> use any extra properties from adc.yaml, we leave out the channels. In
> >>> this case it does seem kind of like the original intention was to work
> >>> like you are suggesting, but hard to say since the driver wasn't actually
> >>> implemented that way. I would be more inclined to actually not make the
> >>> breaking change here and instead relax the bindings to make channel nodes
> >>> optional and just have the driver ignore the channel nodes by dropping
> >>> the ads7924_get_channels_config() function completely. This would make
> >>> the driver simpler instead of more complex like this patch does.
> >>
> >> I have no strong opinion on this. I see this driver says 'Supported' in
> >> MAINTAINERS. Maybe Hugo is able to provide some insight?
> >>
> > This seems to be ABI breakage.  Never something we can take if there is
> > a significant chance of anyone noticing.  Here it looks like risk
> > is too high.
> 
> Ok. I'll just drop this patch then. Thanks David & Jonathan :)

Hi Matti,
I haven't really been able to follow all discussions, but as an
historic note I developped this driver for a prototype that never
materialized. So any changes would not have an impact, as far as I am
concerned.

Hugo.

