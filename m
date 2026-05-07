Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A35CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBJBGDdFV8HnzlBqnOqn6MtwgNThUv5tvXY2shNhwrI=; b=2gWlD+UgZtKrdxtGUYuhT7W7P7
	enp4tzN9MbNXSgPLls4qzqEhFXpAtDyM424YRuhPa4Kv8elzUJsWgGVfZBl0YwnpcS/RxuHjnK91e
	2ApWP7PfSw45IWZqFdt3muRbHVeK7v8xSiqxFkwXtRIuKNmvHmjEW8xeCcDw6+RkoAPfe9ndW3cFA
	40DKD+HXDM1Lwcqckn2ht7qOcg7cDAspqJXmzO/rWxnnqmx8CjTamg+KNOqEKADs4A0Bli3liuXMg
	HCTzNzLeaJfs1xoAbx5NUAdGs6Z7f0imaumpOTFYYvFG/69fgBNZKCJI3WJpJE7EsJWGw8U9IJdJz
	a3gxMrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxKw-00000003iea-1dtT;
	Thu, 07 May 2026 11:56:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxKt-00000003ids-2AKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 11:56:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wKxKI-00047R-LW; Thu, 07 May 2026 13:55:34 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wKxKG-000unS-0Q;
	Thu, 07 May 2026 13:55:32 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wKxKG-00000005rBe-1kih;
	Thu, 07 May 2026 13:55:32 +0200
Date: Thu, 7 May 2026 13:55:32 +0200
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
Message-ID: <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org>
 <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
 <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_045611_713094_EC1F7DBE 
X-CRM114-Status: GOOD (  46.41  )
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

On 26-05-06, Rob Herring wrote:
> On Tue, May 5, 2026 at 10:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 26-05-05, Rob Herring wrote:
> > > On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> > > > This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> > > >
> > > > Remove the 'reg' and 'reg-names' property from the LDB.
> > > >
> > > > The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> > > > (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> > > > register ranges with loose register definitions. E.g.
> > > >
> > > >   - On the i.MX8MP there is one register which controls the AXI
> > > >     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP2).
> > > >   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, PXP
> > > >     handshake, ...
> > > >
> > > > In conclusion: it can't be ensured that one register belongs to one
> > > > dedicated IP and the LDB is rather an exception than the rule.
> > >
> > > It is fine if there's a child node for LDB if the LDB registers are
> > > consistent, but the other misc things are represented by the parent
> > > node. It is certainly not a requirement that either everything be in
> > > child nodes or nothing be in child nodes.
> > >
> > > What I don't see in this series is what problem does this fix? If you
> > > are going to break compatibility, then there had better be a good
> > > reason.
> >
> > Hi Rob,
> >
> > with the upcoming i.MX9x SoCs the parent syscon (BLKCTRL) controlls
> > multiple other IPs, e.g. a DPI mux added by commit 3feaa4342637
> > ("dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
> > example").
> >
> > During the discussion of the above commit we agreed that the sub-devices
> > of the syscon shall not use the reg property due to the fact that one
> > register serves multiple purposes. In the above case the same register
> > controlling the dpi-mux also controlls MIPI-DSI bits. The MIPI-DSI bits
> > can be abstracted as drm-bridge as well. Two sub-devs using the same
> > 'reg' property below the same parent seems odd and I don't know if this
> > allowed either.
> 
> It's not generally. There are some exceptions to define things at the
> bit-offset level rather than byte level.

Thanks for the clarification.

> > Now the LDB is also part of this BLKCTRL syscon device but requires the
> > reg property. TBH, I don't know why the reg property was added in the
> > first place, due to the above fact (multiple sub-devs - same register).
> 
> Probably because we asked for it, but we don't always get a complete
> picture of all the h/w functions (though we ask for that too).

I get your point completely and I don't blame anyone.

> But nowhere have you said the LDB registers are mixed with other
> functions. If they aren't, then there is absolutely nothing to change
> in the binding. If they are, then yes, we shouldn't have 'reg'.

No they aren't mixed with other functions (for now). Can you please
confirm that mixing 'reg' based sub-device nodes with non 'reg' based
sub-device nodes  is allowed? E.g. if the below example is allowed?

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

			...
		};

		dpi-bridge {
			compatible = "nxp,imx93-pdfc";

			...
		};
	};

Furthermore I thought that for the MMIO bridge@5c device, the 'reg'
porperty would either require the full register address, e.g. 0x4ac1005c
or there needs to be a ranges property.

> > Of course, we could limit the breakage to i.MX9* SoCs only which is done
> > by:
> >  - https://lore.kernel.org/all/20260329-fsl_ldb_schema_fix-v1-1-351372754bc0@nxp.com/
> 
> The rational for that doesn't answer my question either.
> 
> >
> > but I don't think that this would be nice from user and from maintainer
> > perspective, because:
> >  1) The same LDB "IP" would have a different dt-binding
> >     (user perspective)
> 
> It's not the same if the register layout is different. The point of
> having sub nodes is because the sub-block is reused. If that's not the
> case, then there shouldn't be a sub node in the first place.

You're absolutely right, different register layot == not the same IP.

TBH I didn't payed to much attention to the LDB/LVDS bridge. I've now
checked the i.MX8MP and i.MX93 reference manual and saw that the they
are slightly different. The i.MX93 uses registers which are marked as
"Reserved" on the i.MX8MP to control an asnyc FIFO. So the LDB on the
i.MX93 could be a slightly improved version of the i.MX8MP.

Also one bit was redefined between the i.MX8MP and the i.MX93 LVDS_CTRL.

We do require the sub-node to wire up the of-graph for the display
pipeline.

> >  2) It introduces another dimension drivers need to care about
> >     (maintainer perspective)
> 
> I thought Linux didn't even look at 'reg' here.

There are patches which aren't merged yet: 
https://lore.kernel.org/all/20260104213712.128982-1-marek.vasut@mailbox.org/

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

