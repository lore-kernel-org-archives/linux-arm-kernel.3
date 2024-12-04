Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4662EE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qN2pcbKct0OFAiDG1HqVY+jak1ZOWpO63jeufzmzZw=; b=0uys8i7Fz0jrvjCa53MXV65R8s
	er685CoBqNdAthxVgBChFvZWporud63Zw1I8AxcF6Rvf8xk61oPO67XraQjgrfnoCyknVdj3NsAZB
	zHdRTNhVvuZaZY5nga/G4p7N1illzA1eDz21zjd+PYUd40Z9JHO6tRnUUMnEkkvMJW/a3Lm9TTVPf
	8hzPljvwJAl5+TU52NqyBa2d/WKe1f907LOEpEUwMpLKq44M5ROx90Er0Z//2NGNhumEZKBdHLyf3
	0S3hZdXS65CwguRKScXN0e5/H/R4O8hLOcX9U+WnY6U1hQPs+z3NcUx4mKW+dwakgDWfEmdQijmEm
	jtR04ifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImBK-0000000C8Kf-22IM;
	Wed, 04 Dec 2024 10:00:30 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImAI-0000000C87q-1nYW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:59:28 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A2421F901;
	Wed,  4 Dec 2024 10:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1733306360;
	bh=/qN2pcbKct0OFAiDG1HqVY+jak1ZOWpO63jeufzmzZw=;
	h=Received:From:To:Subject;
	b=qY+SjmGkuiku9yZHG1TAe5R6MaYjbtplKU78gR+iYaKOHtcO3XV46VV5ESV4QTyEI
	 TYJbrN3jEDkPznA/FcMVEZjdar1B4HBIPvr1h/n9gHNfh8Stq3CngcRtlgY5xcbpPk
	 7PtbcGfwpp/v2LTVd887AL1X8qWJwzRs6rfbIqjpT9pwsk+mg3hy8SAIGZW5fm2HU/
	 MlsuLOseuXZMnKAikwW+CUi6ehxr6jWcjRvI47o7nwdh+wFoSjQ7X6dxiAvkpV5oji
	 MKgUJkWWdLdw6zyhjYaYI0lHCuFxn0NUXKO0K/wZyv8cZJSXVBaes7ydENy7NMUHTQ
	 ukzQZy3PYTkfw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id A0BFF7F9A5; Wed,  4 Dec 2024 10:59:19 +0100 (CET)
Date: Wed, 4 Dec 2024 10:59:19 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, u-kumar1@ti.com,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com, richard.genoud@bootlin.com
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf
 compatible
Message-ID: <Z1An9_auC3dRyPln@gaggiata.pivistrello.it>
References: <20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com>
 <20241119190106.GA70080@francesco-nb>
 <6e47e420-84c4-4539-ba54-5e1e939a37a5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e47e420-84c4-4539-ba54-5e1e939a37a5@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_015927_356527_B81E9170 
X-CRM114-Status: GOOD (  22.85  )
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

Hello Thomas,
thanks for the update.

On Wed, Dec 04, 2024 at 10:08:43AM +0100, Thomas Richard wrote:
> On 11/19/24 20:01, Francesco Dolcini wrote:
> > Hello Thomas and TI folks,
> > 
> > On Wed, Nov 13, 2024 at 11:43:05AM +0100, Thomas Richard wrote:
> >> Like on j7200, pinctrl contexts shall be saved and restored during
> >> suspend-to-ram.
> >>
> >> So use ti,j7200-padconf compatible.
> >>
> >> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >> ---
> >> Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
> >> suspend-to-ram.
> >> ---
> >>  arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       |  6 +++---
> >>  arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi | 12 ++++++------
> > 
> > Do j784s4 supports any kind of low power mode and/or suspend to ram? My
> > understanding was that this was not supported, but maybe there is some
> > details that was lost when I was told this information.
> 
> We are working on suspend-to-ram support for j7200 and j784s4.
> During suspend-to-ram the SoC is fully powered-off (thanks to the PMIC
> which powers off all the power rails except the DDR which is in
> self-refresh), like on j7200.
> Please let me know if you want more details.

ok, that's quite different from the common suspend-to-ram we use to have
implemented on other SoC. You would have some boot firmware (likely U-Boot)
code executing during resume, taking some different code path, in a similar way
to what it is being done for the partial-io support on am62p. It's going to be
more similar to hibernation from some point of view.

Do you expect to have this feature nicely integrated within the standard
suspend/resume "framework" in Linux?

It would be interesting to understand how to handle all the peripherals outside
the SoC, if you have reset/regulator controlled by GPIO from the SoC stuff will
happen as soon as the SoC is powered off since no one will drive this pins any
longer. From my understanding the only solution would be to not have such
regulator/reset connect to the SoC.

Francesco


