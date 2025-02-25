Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A481BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSHb3rOa9k5tsPmaPPeA5bikJl+Av+tcshX5VjzhvP4=; b=g+DL5+zKLYwWKbSBlHlRAcL+yQ
	mzDxgx/9omvf9s6lFOFJphLucwgf6Kd9UZcTVyvS5CrGNBpu8SHUEiQEmguPz2DLKrNpVGTzWUlMT
	dr8w43rbTG8r56svDXUtp+9H/qyOGCGVwX67yMO0nFGOjKbZ/EM8TpDX8kzTVxMJwOo3uiTI4T8GD
	fwZggcdmwfuCTdZZ4ncAWuEN2h9n21+U9WU6xSie7bXga1kW+RQnt90KMY787vLbvpsUGCbHrOPJ3
	w3U8cnShrRZHH72gtgfPMmrioJ2t0wPyn6A4D8LqxZfXPnxKNm57IUToRffeqbpfuC38OsjeX9ZRc
	3qW/QzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu3n-0000000HDFG-1X4z;
	Tue, 25 Feb 2025 12:29:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtUc-0000000H6Rp-1WV1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDA0961239;
	Tue, 25 Feb 2025 11:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803AEC4CEDD;
	Tue, 25 Feb 2025 11:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484373;
	bh=hSHb3rOa9k5tsPmaPPeA5bikJl+Av+tcshX5VjzhvP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axOr7SQBeGTA3q1VBqZiED6W6FPt3G7EHRdpdlPTJ0aengiP2RL4qJAdZWRpjahev
	 cDz78xYjfg9QCWpj4+1wn4OPbZxS/oPm5lQvVulupYW2VrnWu9g0+hl1zvPCcEKwPQ
	 GjQqtL0Wl1GPrV/BonDqWLaNdgTD+pl8eAhReFDmL5VD2aAJSHg4aKnwmao35N6n9h
	 srvpA/g6CXOqMvbFoVB4cuSwEPPw3JCFxB8A8W23s/NxTasqq/ZWVVGLJddeeDW0iH
	 2EMxexvwXOQr7cbFohPt+WksCavde2D181k0HtfIMi7HlNJY1s1ia5TziH+sey/x+B
	 DfF36Ne7eCc5Q==
Date: Tue, 25 Feb 2025 12:52:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Message-ID: <20250225-smart-industrious-groundhog-41deb2@krzk-bin>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
 <20250224204428.GA4050751-robh@kernel.org>
 <PA4PR04MB763009E88F6406CD84ACBD33C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PA4PR04MB763009E88F6406CD84ACBD33C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
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

On Tue, Feb 25, 2025 at 07:39:52AM +0000, Maud Spierings | GOcontroll wrote:
> From:=C2=A0Rob Herring <robh@kernel.org>
> Sent:=C2=A0Monday, February 24, 2025 9:44 PM
> =C2=A0
> >On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:
> >> The main point of the Moduline series of embedded controllers is its
> >> ecosystem of IO modules, these currently are operated through the spid=
ev
> >> interface. Ideally there will be a full dedicated driver in the future.
> >>
> >> Add the gocontroll moduline-module-slot device to enable the required
> >> spidev interface.
> >>
> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >> ---
> >>=C2=A0 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >>=C2=A0 1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/=
Documentation/devicetree/bindings/trivial-devices.yaml
> >> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c7=
fb46f771a300926f05 100644
> >> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> >> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> >> @@ -107,6 +107,8 @@ properties:
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - fs=
l,mpl3115
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # MPR121: Proximity Capacitive Touch Sensor Controller
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - fs=
l,mpr121
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
GOcontroll Moduline module slot for spi based IO modules
> >
> >I couldn't find anything about SPI for GOcontroll Moduline. Can you
> >point me to what this hardware looks like. Based on what I did find,
> >this seems incomplete and not likely a trivial device.
>=20
> I'll give some more details, if there is a v2 of this patch I will also
> add more information in the commit message.
>=20
> The module slots have a number of pins, a lot of them currently unused as
> they have not found a function yet, this is very much still a developing
> product. The currently used interfaces to the SoC are:
> 1. SPI bus as a spidev to ease developing new modules and quickly
> integrate them. This is the main communication interface for control and
> firmware updates.
> 2. A reset pin, this is/was driven with the gpio-led driver but I doubt
> that would get accepted upstream so I intend to switch to the much better
> suited libgpio.

reset-gpios is not in trivial devices, so that's already a hint you
cannot use this binding.

> 3. An interrupt pin, this is currently only used in the firmware update
> utility [2] to speed up the update process. Other communication is done at
> a regular interval.
>=20
> What is unused:
> 1. A potentially multi-master i2c bus between all the module slots and
> the SoC
> 2. An SMBus alert line is shared between the modules, but not the SoC.
> 3. A shared line designated as a clock line, intended to in the future
> aid with synchronizing modules to each other for time critical control.
>=20
> current software that is used to work with the modules can be found at
> [2] and [3], one of them is a Node-RED module the other is a blockset for
> Matlab/Simulink generated code.
>=20
> If you know a better way I could describe this in the devicetree then I

You need dedicated binding where you describe entire device, entire
hardware, not what your driver supports in current release.

Best regards,
Krzysztof


