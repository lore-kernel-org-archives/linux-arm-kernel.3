Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8822CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vev3uWK3nb5vm7RDNrdb/+RhFlWVQB2NrTqyd6V5BOk=; b=rzeSynOdpW93p/V+kAwhbTVVUs
	8yKvNJV4e/0Eq7jabf20PnYtIxFe6W2ml7slURnxypX8NLwXHYhQsRpx5I/6RfQsNzki1eO1hUbwn
	/4tySlKnDAXnbZdGJL3YCuLxxggvf07+8mfj89xHQ2A6Pu84vzaEJ64v9GPZo6XFc8uog01R/stdZ
	Gz6VzhgYIvnJa5lZy8UzAWJbfcvg3s3kvAAPxGFL2EQ8pO8q/ba+gR2t3dhazakdHPsKUFY4Prkrf
	DVtGoyNcnHHWQPOmrQNuBBrV3Zw4Yi4KOHgYs9HasHdHSGf06+vrZlt7JID/QLuhYlTsxgnyszhx0
	vQWhP4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzfZ-00000007pAJ-1jPx;
	Fri, 29 May 2026 16:02:45 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzfT-00000007p62-3v88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:02:44 +0000
Received: from francesco-nb (93-33-39-96.ip42.fastwebnet.it [93.33.39.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 0DE4A1FCFB;
	Fri, 29 May 2026 18:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780070555;
	bh=vev3uWK3nb5vm7RDNrdb/+RhFlWVQB2NrTqyd6V5BOk=; h=From:To:Subject;
	b=MfjVvoT2mqcofwmK1RIh/yf5VUeSVxZwEqfG6FEDSpVQEJH6XUcjw5qWnnCsVyNgi
	 FApejYKeYSsZe0yRZwh5++hxKGfYEWj5yqhLDsU0GvGV1BrZzT+MPq+enviTJ3V2i6
	 VIM5Ds3YDLzDvDcpvXO2GSjQSxji8T+ELdX+sZqJ6CXYESDrz+i0vLt7ZdRDWR5GuF
	 uYfuzatGvRxQ3+qnmG+Snx2sxlu0OI7BLXxUC/HTs+NYqQ2d68u6hAsVh6f6wPPSYh
	 pHoslPekcopkkYkbyljmX05CADm/jC7ET/RCVgPi1QatzDc9b8uXG2RV5elXUyTVSp
	 8dl1h14bStsIw==
Date: Fri, 29 May 2026 18:02:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>
Cc: Vitor Soares <ivitro@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 06/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
Message-ID: <20260529160227.GA6917@francesco-nb>
References: <20260522161105.277519-13-ivitro@gmail.com>
 <20260522161105.277519-19-ivitro@gmail.com>
 <20260529155345.z6ht5adzhwafdvx5@voting>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529155345.z6ht5adzhwafdvx5@voting>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090242_755846_A2094145 
X-CRM114-Status: GOOD (  11.64  )
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

On Fri, May 29, 2026 at 10:53:45AM -0500, Nishanth Menon wrote:
> On 17:11-20260522, Vitor Soares wrote:
> > +	touchscreen@41 {
> > +		compatible = "ilitek,ili2132";
> > +		reg = <0x41>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> > +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> > +		interrupt-parent = <&main_gpio1>;
> > +		interrupts = <49 IRQ_TYPE_EDGE_RISING>;
> 
> https://lore.kernel.org/r/20260521152550.A928B1F000E9@smtp.kernel.org
> https://lore.kernel.org/r/20260522140245.472651F000E9@smtp.kernel.org
> Sashiko comment would probably be good to explain - I see the same in
> v3.

The interrupt pin of the ilitek,ili2132 touch controller is a very short
pulse, the net name TOUCH_INT# is on the board side and it is generic,
not specific on the touch controller used.

Both falling and edge would work fine.

The reason for using rising is that for the way the HW is designed the
interrupt signal is not that "clean", and triggering on the falling edge
produce some spurious interrupt. Those spurious interrupts are handled
nicely by the driver, but they pollute the kernel logs for no reason.


Nishanth: in general do you want an explicit answer to every comment made my
sashiko?

Francesco


