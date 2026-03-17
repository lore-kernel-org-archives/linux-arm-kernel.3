Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649C7F33831
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOhE3MyoOIAA0bgcSSk1uYsIQSRxBFkKa/QEeH/yO6Y=; b=T+Ldq1lNQYyun/rgJmYtfFlE27
	P/riaB/RF0MKzAQ8RJCV3ftbChrVviZXZ0YQKegi1htPNGWuNqVzo67PRmm5Q0ZchRI7RE9Q9YeMO
	12LmWUeSLg068L78+sewPXkiEI0T+YD9A/xokLxI6yqg6Bf+Xr/2HENNQpfoxe6U7EwDD7Tcxb7Dr
	fm/l6C3aysWIhZxypsbUmXabOP54TIoJ7t+aIkDorIKVrMNGI/1sOGnYAAAtfPvzpuecNknsKcRfo
	3dUNzaWOZNQxrlwFJbp+bv40iz3TUukYKOLnHMDDGzGheOioZ+glyUsxGQuuKwYdSpJ2D2hCyMRek
	ey5dOVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RGc-00000005wlG-1pxp;
	Tue, 17 Mar 2026 10:03:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RGb-00000005wkr-13bp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:03:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E9A060103;
	Tue, 17 Mar 2026 10:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0BCC4CEF7;
	Tue, 17 Mar 2026 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773741761;
	bh=zOhE3MyoOIAA0bgcSSk1uYsIQSRxBFkKa/QEeH/yO6Y=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=iLK1kV0bEUnBKSlVECk17rCfbiRFOK8e9m2VQ9Eam8FJnejzsncMSvQLAFJIvb1Pr
	 Vrqp1T/Wu3PeHwdqqCKwH5HHxvI/GlAmEOIi3tfcPHkHrB8vT93is7PF8gwaUAqxb5
	 JzSXmNuoes9ApijJJRYovbhvzhwBUi9fykKAQygrEKxHzTjISn8Gl4qVh9MTfnmzrh
	 TNuhmnwPHHmX99KzVtklCPpGYF2T12iw9QXIf1B/lIEfIYXfpjXuCSQXEHjD38avMb
	 Glyz74CIMcdU9eEVsElTX638WBp72ugjDLW4ZSO4Lo+vmLbkcaTgsemgoqv6sedF7Q
	 8HzUvbG0bQqeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 11:02:34 +0100
Message-Id: <DH4YZ4XEWDVH.25QOLQ4QJ4PXD@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Douglas
 Anderson" <dianders@chromium.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 <stable@vger.kernel.org>, "Andrew Lunn" <andrew@lunn.ch>, "Daniel Scally"
 <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Jakub Kicinski" <kuba@kernel.org>, "Len Brown"
 <lenb@kernel.org>, "Mark Brown" <broonie@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Saravana Kannan"
 <saravanak@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <imx@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <netdev@vger.kernel.org>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid> <abkCPU3rxHI49N4_@shikoro> <abkD-VLprcbbEbB1@ashevche-desk.local> <abkF0GO01sMcOhvb@shikoro> <abkLEgrZbdb03VWg@ashevche-desk.local> <abkLY4AAQuFlTRC7@ashevche-desk.local> <abkT_jpjIki6pvX1@shikoro>
In-Reply-To: <abkT_jpjIki6pvX1@shikoro>
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

On Tue Mar 17, 2026 at 9:42 AM CET, Wolfram Sang wrote:
>
>> > What's the alignment for the u8 member in your SoC? 4 bytes or 8 bytes=
?
>> > (I assume it's 64-bit SoC.)
>>=20
>> FWIW, with the given change it will be still inside 64-byte data structu=
re
>> which most likely occupies a single cache line (before this patch and af=
ter
>> as well).
>
> I consider this directon of the discussion irrelevant. If the number is
> (maybe? That's to be discussed!) needlessly bigger than 0, then it
> doesn't matter how big the number is.
>
> Why don't you like the idea of taking the lock?

Which lock are we talking about, the device lock? If so, please not use it =
to
protect arbitrary other structures.

