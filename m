Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A676CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfsxJ44J91j2emyBCQAKF4tdn9hHzn0C18LtsrXKcnA=; b=IEhLwPyLXBo4s5Wda0EMWmSPtE
	2jCs0LzRB8fY3RFNWQfCPslx62f5gIr864DFpA+jwMmLcMX9JaVfJAz/gr1LLXpucNcVhAaTzBFAd
	sPHZj/lZgGHbmSUq5pAoMNj6Lk0u8JZ+9QzTMHDm+MwqxiOcm7zAOg8IU/FQIEsITAaeJVKOB9m7G
	hp481xUsVSXYcIZIiMYtZ9+ursa1Ggp3lHBQpue/aqPLPM9xctgLAibsrtHO3X2/vFSdl7dTnRItq
	3yxBlBBecdcv+nto18++57o5KH4AtNs6vBwtETwcknwRpPKdp9+JBk+k7AvHMWCkr8iE2vUSU3vxj
	QqI2RznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByM0-00000006tv5-2Mbh;
	Wed, 30 Sep 2026 17:44:28 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByLx-00000006ttf-3kq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:44:27 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 09C511FC00;
	Wed, 30 Sep 2026 19:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790790257;
	bh=qfsxJ44J91j2emyBCQAKF4tdn9hHzn0C18LtsrXKcnA=; h=From:To:Subject;
	b=veOft339+be/R8+BPCsciswCSo6rkAYQ3nN0LW3Cs9JFkEs571BIjraUhyd27WeXF
	 ZycFfsQcSronG7eSNBBmQE0rRLAvLGMBMJqxf54bxn5y8JW5A3FSzppAaiv7LwTODG
	 xc2/UonI0PXBTShNRVjagAjc24GEuep0fhhDFKx7w6U7uRMXB9SqvtXE/fM4h98G++
	 H+iJ0zI+onkDMKiiTH4qpSppSp5ULmEhZrO4B2DehzOw3sGjHLyR5ZefFCIrscuHzi
	 NTykvpHeNtiDzZ+6H1GbMY0tWnbMmjvbr2zC1DDJHOUYRKgUkbiBD0m3kf73iagsta
	 LC3pU0NtSx7nw==
Date: Wed, 30 Sep 2026 19:44:13 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-arm-kernel@lists.infradead.org,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
Message-ID: <20260930174413.GA2463938@francesco-nb>
References: <20260928204741.175754-1-marex@nabladev.com>
 <20260928204741.175754-3-marex@nabladev.com>
 <arvPDq8sjjv7na01@SMW015318>
 <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_104426_542042_5F4B7BA3 
X-CRM114-Status: GOOD (  14.14  )
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

On Tue, Sep 29, 2026 at 05:20:27PM +0200, Marek Vasut wrote:
> On 9/29/26 4:45 PM, Frank Li wrote:
> 
> Hello Frank,
> 
> > > +	backlight_lvds: backlight-lvds {
> > > +		compatible = "pwm-backlight";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_panel_backlight_lvds>;
> > > +		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
> > > +		default-brightness-level = <7>;
> > > +		enable-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
> > > +		pwms = <&tpm3 3 5000000 0>;
> > > +		/* Disabled by default, unless display board plugged in. */
> > > +		status = "disabled";
> > > +	};
> > 
> > The both backlight is not used in this dts, can you remove it and
> > add these when it real use.
> It's the same thing we do on the other boards, so I would prefer to keep
> this consistent:

I agree with Marek, and I would not use the criteria about being used or
not.

Francesco


