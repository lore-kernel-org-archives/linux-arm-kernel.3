Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D7CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIqu46sTZZDr3PlUkpX+v4S97dLW4fcaXcFfYZakd50=; b=UzrYB1Pnfr3qqm9t1jWlD66XSp
	7rPH8NLm1PuXuGZb0wG4xfsPOYBokPXqz5QsmZa96uHm1M0xHEuy1WyHys6GgxiOhzEee2stLzWIk
	STLfap0oFMSk1tUsqr44l4jMgl2hV98XY/vvbcMJYA+Eshxa/robE75P+KgKnYY6MdqCRYgWR74lY
	bDFzk7c+WSdk/hyunpw6KmZD2hJZitwHtsYxCNA8PHmJSGaqRCel7IWSHeaRXEQvpQX8BPdgQti3A
	7SoHN45ckEB/W63Uhja4yuFkDwl/pJ4jBv+F5ZwClARJLkr2+PWMSk6Z3AhqRZs8RAc2YonxvHOfa
	jOWR+FoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJUI-0000000CTrR-3cBz;
	Tue, 02 Jun 2026 07:24:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJUG-0000000CTqs-0vB4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:24:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wUJTe-0001hd-Bf; Tue, 02 Jun 2026 09:23:54 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wUJTc-000i8j-2h;
	Tue, 02 Jun 2026 09:23:52 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wUJTc-0000000Futw-2umF;
	Tue, 02 Jun 2026 09:23:52 +0200
Date: Tue, 2 Jun 2026 09:23:52 +0200
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
Message-ID: <n6akxiayi3g6gxcqhreb4iaohmeokoalnqup6h5r2fwdt4zijt@u2wyps55ayqm>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org>
 <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
 <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
 <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
 <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
 <uyh5s6g7bvuufnhfjrmungp5dbyllxfrgfzaxno22knpxxojmj@qqvh75ezblpp>
 <20260601222941.GA101404-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601222941.GA101404-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_002432_282740_A0DB5F7C 
X-CRM114-Status: GOOD (  14.74  )
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

On 26-06-01, Rob Herring wrote:
> On Wed, May 13, 2026 at 12:26:40PM +0200, Marco Felsch wrote:

...

> > Please see the below full example, is this allowed?
> > 
> > system-controller@4ac10000 {
> > 	compatible = "fsl,imx93-media-blk-ctrl", "syscon";
> > 	reg = <0x4ac10000 0x10000>;
> > 	#address-cells = <1>;
> > 	#size-cells = <1>;
> > 
> > 	...
> > 
> > 	bridge@5c {
> > 		compatible = "fsl,imx8mp-ldb";
> > 		reg = <0x5c 0x4>, <0x128 0x4>;
> > 		reg-names = "ldb", "lvds";
> > 		clocks = <&clk IMX8MP_CLK_MEDIA_LDB_ROOT>;
> > 		clock-names = "ldb";
> > 		assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
> > 		assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > 		status = "disabled";
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				reg = <0>;
> > 
> > 				ldb_from_lcdif2: endpoint {
> > 					remote-endpoint = <&lcdif2_to_ldb>;
> > 				};
> > 			};
> > 
> > 			port@1 {
> > 				reg = <1>;
> > 
> > 				ldb_lvds_ch0: endpoint {
> > 				};
> > 			};
> > 
> > 			port@2 {
> > 				reg = <2>;
> > 
> > 				ldb_lvds_ch1: endpoint {
> > 				};
> > 			};
> > 		};
> > 	};
> > 
> > 	dpi-bridge {
> > 		compatible = "nxp,imx93-pdfc";
> > 		status = "disabled";
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				reg = <0>;
> > 
> > 				dpi_from_lcdif: endpoint {
> > 					remote-endpoint = <&lcdif_to_dpi>;
> > 				};
> > 			};
> > 
> > 			port@1 {
> > 				reg = <1>;
> > 
> > 				dpi_to_panel: endpoint {
> > 				};
> > 			};
> > 		};
> > 	};
> > };
> 
> Yes, this seems fine.

Thanks for the clarification!

Regards,
  Marco

> 
> Rob
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

