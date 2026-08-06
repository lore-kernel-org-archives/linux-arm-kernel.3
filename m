Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B9BC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSoRB7HXSQj9Dcfr77YxuiYyeeQgzefdmljyvXGxT9A=; b=lMJV7LM+haSgklQLL5FTLPpw4p
	TzItJDJUzpUc9JNGx6BbmWNGOEAFIWqEwE8QY7iB9xYj1t8dTbuk8HPvN37VxIijm+R0wXuxcJZy2
	18NB/vCHht2J7kvfOTnOOjl4i2sFNQd9Has3ZoRiHbKJbK3HGMuGKgA6Oag32RCBtShD5m7hiLYFT
	zgGczsa1F3os1WdC5xpsPiXrLTrGcF3As6HIPCHVeI0HLpnhfJH9ClhMnA0eFJyykZX6NP+/RuXjs
	ZUlnRWuSwtEDVx4JcopOQBTNKjmCj+DduyOwdi8YRAU2p3eTbe6RUABRDbmugr2q+apgldJRaR/nJ
	J+fEUTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryw1-00000005yKk-09hs;
	Thu, 06 Aug 2026 14:19:01 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryvy-00000005yKI-0ddc;
	Thu, 06 Aug 2026 14:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1786025934; bh=b6tGJgjbWseM7FlphtaARLIwHe4KRXa10wZMxOFBvWo=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=hfvsUE2U2fnm8isZGBZhasv9Exh8AzA5/wdep+DCpOAZUfJlytb89pnFX+BEV5dHo
	 hsJUXMCTeaXxQw0KmF8+jgzbdq9VbYQRYiUgvkEzgLQMx2F+V582cYawsbpKGPXCpj
	 zXYXArluPudj1uElf1TWmKIWdeMegs/rvjZQfplU=
Date: Thu, 6 Aug 2026 16:18:53 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: David Heidelberg <david@ixit.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
	Manuel Traut <manut@mecka.net>, Alexander Warnecke <awarnecke002@hotmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, phone-devel@vger.kernel.org, 
	imx@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: rk3399-pinephone-pro: DW9714
 coil requires higher voltage
Message-ID: <cluhol4kfk4mi3ybxfo52hyuepxuwfgrgv54vsvn3e7x43d3la@xfcodg4jlosv>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	David Heidelberg <david@ixit.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
	Manuel Traut <manut@mecka.net>, Alexander Warnecke <awarnecke002@hotmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, phone-devel@vger.kernel.org, 
	imx@lists.linux.dev, stable@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
 <20260801-pp-pro-camera-v1-2-7b4d90788f9f@ixit.cz>
 <2j7ogeqj565sftp5wzqvtzi2id76fof623bifbmyu6ckhf6vm6@ya7h4tp5i4qf>
 <7d55eaba-967c-4de6-8021-6b2d17670b1f@ixit.cz>
 <galrq4ug3hhny2ivpylqwuztwv7vnqvm6sdhlu6pucxk6qy2mz@zxw4ckkxj2sh>
 <dd2f19ac-a65e-4e53-aa2f-6f76c949366e@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd2f19ac-a65e-4e53-aa2f-6f76c949366e@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_071858_812175_E4E84B3D 
X-CRM114-Status: GOOD (  34.45  )
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

On Thu, Aug 06, 2026 at 01:49:07PM +0200, David Heidelberg wrote:
> On 06/08/2026 13:19, Ondřej Jirman wrote:
> > Hi,
> > 
> > On Tue, Aug 04, 2026 at 11:12:21AM +0200, David Heidelberg wrote:
> > > On 04/08/2026 09:39, Ondřej Jirman wrote:
> > > > Hi,
> > > > 
> > > > On Sat, Aug 01, 2026 at 02:35:21AM +0200, David Heidelberg via B4 Relay wrote:
> > > > > From: David Heidelberg <david@ixit.cz>
> > > > > 
> > > > > By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
> > > > > Usually it's around 2.8 V. Here it matches the avdd2v8_dvp.
> > > > > 
> > > > > Fixes: 9336eb829a18 ("arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > ---
> > > > >    arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> > > > > index d46cdfe3f7849..bde35d9b2263e 100644
> > > > > --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> > > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> > > > > @@ -473,17 +473,17 @@ wcam_out: endpoint {
> > > > >    			};
> > > > >    		};
> > > > >    	};
> > > > >    	wcam_lens: camera-lens@c {
> > > > >    		compatible = "dongwoon,dw9714";
> > > > >    		reg = <0x0c>;
> > > > >    		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
> > > > > -		vcc-supply = <&vcc1v8_dvp>;
> > > > > +		vcc-supply = <&avdd2v8_dvp>;
> > > > 
> > > > This does not match reality, schematic says it's VCC2V8_DVP:
> > > > 
> > > > 	https://xff.cz/dl/tmp/6253a0465329df41.png
> > > 
> > > Ahoj,
> > > 
> > > thanks for spotting this, since I know you have the device, would be too
> > > much to ask you to send standalone fix for PP Pro?
> > > 
> > > I would drop the change from the series.
> > 
> > Ok. Just for the reference, vcc1v8_dvp here feeds an enable pin for VCC2V8_DVP
> > LDO regulator (which is supplied from VCC3V3_SYS and not described in DT, yet).
> > So in practice enabling vcc1v8_dvp enables both VCC2V8_DVP and AVDD2V8_DVP and
> > while DT does not describe the HW in detail, it describes the only regulator
> > that is actually controllable and enables all needed power rails for the camera
> > modules all by itself in proper order/timing.
> > 
> > Not sure what's the DT maintainers idea here about whether DT has to describe
> > every detail of power rails routing, or just what's pragmatic.
> 
> My perception is that DT syntax should describe everything, except passive
> components.
> 
> No additional GPIO is needed to enable VCC and AVDD?

Yes, it's completely transparent. vcc1v8_dvp indirectly powers up all other
camera sensor regulators.

Regards,
	o.j.

> Here, it seems to me that explanation like this in DT could cover it. But
> I'm no authority here :)
> 
> David
> 
> > 
> > Best regards,
> > 	o.j.
> > 
> > > David
> > > 
> > > P.S. I noticed I didn't mark this series RFC. Too late.
> > > 
> > > > 
> > > > regards,
> > > > 	o.
> > > > 
> > > > >    	};
> > > > >    	ucam: camera@36 {
> > > > >    		compatible = "ovti,ov8858";
> > > > >    		reg = <0x36>;
> > > > >    		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
> > > > >    		clock-names = "xvclk";
> > > > >    		dovdd-supply = <&vcc1v8_dvp>;
> > > > > 
> > > > > -- 
> > > > > 2.53.0
> > > > > 
> > > > > 
> > > 
> > > -- 
> > > David Heidelberg
> > > 
> 
> -- 
> David Heidelberg
> 

