Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD9C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCKyTsliPA/oLttgzpk+xJQh+HCPRKP94PZT/T9gDjo=; b=UiHWAckbXp9RBWq+sLjVv+7+Cm
	Y0aZRHUkWPQuITnJIzsmtvf+T1DIj0aFIPiTJwcLd+m7XyBiiGUrdErQInSmZxB9kbTCj1bXcCIxX
	tE+ZWVY3zITEIj/XJA+uxK9qqzMnYfgWuOEDfLePZpqW8Q2KNrxRq0XktHlx+05KtSmcBW6dROVqZ
	kPW0pgo4wqHTjzrf2GSkt20XlBZWcl2z/Zb6e4VkdV+Jz5NP/rqvRnhh9iij3BvePVNFtrL01i6KN
	jot9mKkP13NgwEtjiHwmaI1MIcZS3+hlUuGhoj2naPeV/FUjqET7KuV8h9eYnZrxaxInudBEurM/n
	dFZGBE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrw8F-00000005d4G-2gAl;
	Thu, 06 Aug 2026 11:19:27 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrw8C-00000005d3i-1lDR;
	Thu, 06 Aug 2026 11:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1786015158; bh=VZJLBZnRyPxnCLoEjoQyTL2E3KhxDtuYstjmKXmloU4=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=t+gQlB1V0eTdunNlGu7Efvhp5s23euUhKrq6r0mCrUKAP+ZyJPCZcjD5rWEJV0a8G
	 +do9zHUtckn+wcm2J/HtiEghohNvu6748gAEhWdbxh6GdmWctUq/1GcJqgWQeAKKSH
	 Xk/5pR+QEFiuQthNPkjj66Ko3Zv2jBQJIpVixhp0=
Date: Thu, 6 Aug 2026 13:19:18 +0200
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
Message-ID: <galrq4ug3hhny2ivpylqwuztwv7vnqvm6sdhlu6pucxk6qy2mz@zxw4ckkxj2sh>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d55eaba-967c-4de6-8021-6b2d17670b1f@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_041925_056659_4BF9BA6C 
X-CRM114-Status: GOOD (  27.18  )
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

Hi,

On Tue, Aug 04, 2026 at 11:12:21AM +0200, David Heidelberg wrote:
> On 04/08/2026 09:39, Ondřej Jirman wrote:
> > Hi,
> > 
> > On Sat, Aug 01, 2026 at 02:35:21AM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
> > > Usually it's around 2.8 V. Here it matches the avdd2v8_dvp.
> > > 
> > > Fixes: 9336eb829a18 ("arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> > > index d46cdfe3f7849..bde35d9b2263e 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> > > @@ -473,17 +473,17 @@ wcam_out: endpoint {
> > >   			};
> > >   		};
> > >   	};
> > >   	wcam_lens: camera-lens@c {
> > >   		compatible = "dongwoon,dw9714";
> > >   		reg = <0x0c>;
> > >   		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
> > > -		vcc-supply = <&vcc1v8_dvp>;
> > > +		vcc-supply = <&avdd2v8_dvp>;
> > 
> > This does not match reality, schematic says it's VCC2V8_DVP:
> > 
> > 	https://xff.cz/dl/tmp/6253a0465329df41.png
> 
> Ahoj,
> 
> thanks for spotting this, since I know you have the device, would be too
> much to ask you to send standalone fix for PP Pro?
> 
> I would drop the change from the series.

Ok. Just for the reference, vcc1v8_dvp here feeds an enable pin for VCC2V8_DVP
LDO regulator (which is supplied from VCC3V3_SYS and not described in DT, yet).
So in practice enabling vcc1v8_dvp enables both VCC2V8_DVP and AVDD2V8_DVP and
while DT does not describe the HW in detail, it describes the only regulator
that is actually controllable and enables all needed power rails for the camera
modules all by itself in proper order/timing.

Not sure what's the DT maintainers idea here about whether DT has to describe
every detail of power rails routing, or just what's pragmatic.

Best regards,
	o.j.

> David
> 
> P.S. I noticed I didn't mark this series RFC. Too late.
> 
> > 
> > regards,
> > 	o.
> > 
> > >   	};
> > >   	ucam: camera@36 {
> > >   		compatible = "ovti,ov8858";
> > >   		reg = <0x36>;
> > >   		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
> > >   		clock-names = "xvclk";
> > >   		dovdd-supply = <&vcc1v8_dvp>;
> > > 
> > > -- 
> > > 2.53.0
> > > 
> > > 
> 
> -- 
> David Heidelberg
> 

