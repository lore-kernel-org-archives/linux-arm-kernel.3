Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4998CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTJr6d1q3t0JU9ii6+kGK0Jmb6tPoM1IcWaXxDJZ9dU=; b=acMKeo3PyMlIdaOoZFOUUYpTnX
	68cjCuIXQ/CHbvdhPNxLKBz3LVcByQoJYg2LL+5FCiSZAE3ZYYDgRmx1s+B4kt06OxkezjFbK2vHi
	EIZnX0yPhi8tmqXZXd6IgZbmF3OJhr4wof+RiSGG25jTiAA+gZE+s12Pv1N4yyeRD3q7ldk38cjsq
	IgOnAyiiumvFwTRBIEZ79LgtQzqlA7ZD985exts8xM4S9F3tBgMYqtCmRnDGWa3lmO4eFwIKUXedM
	8rFL7sk2ldf2lGCzDzdEz9Y3H3/ragTb4qs/ZBfQ1QgRzTwBdcR7vQFwmpnvOBTSxYY4UCd/p9gjC
	TpzCGzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6o7-00000002BQy-30gE;
	Wed, 13 May 2026 10:27:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6o4-00000002BPl-2Z6i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:27:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6na-0002e8-Ls; Wed, 13 May 2026 12:26:42 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6nY-000aCU-35;
	Wed, 13 May 2026 12:26:40 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6nY-00000002o8f-3PSk;
	Wed, 13 May 2026 12:26:40 +0200
Date: Wed, 13 May 2026 12:26:40 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
Message-ID: <uyh5s6g7bvuufnhfjrmungp5dbyllxfrgfzaxno22knpxxojmj@qqvh75ezblpp>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org>
 <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
 <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
 <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
 <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032712_649129_B5A67EEE 
X-CRM114-Status: GOOD (  22.26  )
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

On 26-05-07, Rob Herring wrote:
> On Thu, May 7, 2026 at 6:55 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

...

> > > But nowhere have you said the LDB registers are mixed with other
> > > functions. If they aren't, then there is absolutely nothing to change
> > > in the binding. If they are, then yes, we shouldn't have 'reg'.
> >
> > No they aren't mixed with other functions (for now).
> 
> For now? Is the h/w going to change or is the binding *still* incomplete.

Sorry for the confusion. By for now I mean that NXP tend to reuse IPs
but with minor changes. So no, the binding is not incomplete with our
current HW knowledge.

> > Can you please
> > confirm that mixing 'reg' based sub-device nodes with non 'reg' based
> > sub-device nodes  is allowed? E.g. if the below example is allowed?
> >
> >         system-controller@4ac10000 {
> >                 compatible = "fsl,imx93-media-blk-ctrl", "syscon";
> >                 reg = <0x4ac10000 0x10000>;
> >                 #address-cells = <1>;
> >                 #size-cells = <1>;
> >
> >                 ...
> >
> >                 bridge@5c {
> >                         compatible = "fsl,imx8mp-ldb";
> >                         reg = <0x5c 0x4>, <0x128 0x4>;
> >                         reg-names = "ldb", "lvds";
> >
> >                         ...
> >                 };
> >
> >                 dpi-bridge {
> >                         compatible = "nxp,imx93-pdfc";
> >
> >                         ...
> 
> Depends what is in "...". If only a compatible, then no. If there are
> actual resources defined, then yes.

Please see the below full example, is this allowed?

system-controller@4ac10000 {
	compatible = "fsl,imx93-media-blk-ctrl", "syscon";
	reg = <0x4ac10000 0x10000>;
	#address-cells = <1>;
	#size-cells = <1>;

	...

	bridge@5c {
		compatible = "fsl,imx8mp-ldb";
		reg = <0x5c 0x4>, <0x128 0x4>;
		reg-names = "ldb", "lvds";
		clocks = <&clk IMX8MP_CLK_MEDIA_LDB_ROOT>;
		clock-names = "ldb";
		assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
		assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
		status = "disabled";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				ldb_from_lcdif2: endpoint {
					remote-endpoint = <&lcdif2_to_ldb>;
				};
			};

			port@1 {
				reg = <1>;

				ldb_lvds_ch0: endpoint {
				};
			};

			port@2 {
				reg = <2>;

				ldb_lvds_ch1: endpoint {
				};
			};
		};
	};

	dpi-bridge {
		compatible = "nxp,imx93-pdfc";
		status = "disabled";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				dpi_from_lcdif: endpoint {
					remote-endpoint = <&lcdif_to_dpi>;
				};
			};

			port@1 {
				reg = <1>;

				dpi_to_panel: endpoint {
				};
			};
		};
	};
};

> > Furthermore I thought that for the MMIO bridge@5c device, the 'reg'
> > porperty would either require the full register address, e.g. 0x4ac1005c
> > or there needs to be a ranges property.
> 
> There should be a ranges property no matter what.

Good point, something to fix too :/

Regards,
  Marco

