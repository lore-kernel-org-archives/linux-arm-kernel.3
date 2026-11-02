Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B93606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UG0mpt9v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Qu8rS3/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; b=UG0mpt9vwiQrKLv81qAZ2cMCeh
	pJvQKn52fdwE+PwID7gskLrMwKNmU3KQl0Gs17rkrazzKAk0CoQ64S7YVI5eZvEyUalsG9SZKx8fO
	jukQf19Zpjx+qEHhy6lLgAo7M2goyeGLDsxnuKrYjodkK/LJ3uYSCsg3de/3yMemBj4B3/TFPzIkb
	oCFfEI5xB4cFixcIVfaF1SlrcqT8f2uye1180FuoZhpDlF7eN+I4teh8zXd+2x6OvsAKGTtgUBxJv
	pp1DYDriH+Kd1h3/qKzo2ehi+PBHSkzYLNAUVYy91MLYHUQ4Ijc5sIthhC/lXAf4SWqVak5YrHlSA
	ABDeFlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs21-0000000GbBe-1Pe9;
	Mon, 02 Nov 2026 13:25:01 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs1y-0000000GbAD-1ETb;
	Mon, 02 Nov 2026 13:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793625848; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f7Xj01KuAiYLRFZ+56umfnvwPieOTuuNKubnySrPhZLWp8JqNxCguowM6NtZlNunGTvzyEub80/7UsQoB3UHHdRgGE4E8B8YU6yGOhy7e0fYJKJmxzTxfX7w5f59SA6NfeWVybPz1QPSC5fvh4iRXGusJSAUJ3aF/XjI1oExzj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793625848; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; 
	b=jps1Uiapc+8FaK5ZxCW3Dc/dkjMP6bgPcwqaiDmdrJgffG/h6FXxNV/lJg/Gnq/mbop4tVkR0C43BTQWMNHTw9vvaLBPvIs+jTSHIQPC+uMc3m5RqyUNaHzaJsXpogybICGB6eo970cBy5VE/y0S5KEYA+zdZJXuSiDPIIwiTfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Qu8rS3/GfL5UlN+4BnbLjwL8zeIrFA6ZMfNA75YGjePSitq7ifCFZq3OxDx3w3zx+AUV4NRctYOeOqe5lJywNMaJGZ47MOco7+J60iLR8JYvU2UrwFvGx4+4GMhHQQ5H2MGJFeHjjLgyrpwdxLwNFnt9/peSWo0dOV/ThUSx1fcddVf2WiPabuAEX3y/TZsD0J7YFy8+araqMgJnFi4dT5Q5ildpQYBzXMxYrCRKwEwAabcp2jBOPx7XeVUXCtvXqVRCxx28ZD2PZM2Dgdsu7IdOEFwxRAnR+jcxFTYmQ81driIwfvwc76pWHgHzTtw6Q0ieNl3VaTQHI0yQKEjnHw==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793625845538857.5780358922513;
	Mon, 2 Nov 2026 05:24:05 -0800 (PST)
Message-ID: <df946ddae7f00aa3fcc2b2ad953392f33a94ad37.camel@icenowy.me>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?=	
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-riscv@lists.infradead.org, Han
 Gao <gaohan@iscas.ac.cn>
Date: Mon, 02 Nov 2026 21:23:56 +0800
In-Reply-To: <20261102-spry-snobbish-hound-384cae@quoll>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
	 <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
	 <20261102-spry-snobbish-hound-384cae@quoll>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_052458_400261_406D6959 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

=E5=9C=A8 2026-11-02=E4=B8=80=E7=9A=84 12:28 +0100=EF=BC=8CKrzysztof Kozlow=
ski=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Oct 30, 2026 at 03:47:49PM +0800, Icenowy Zheng wrote:
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DSI controller APB clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: PHY configuration clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: PHY reference clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DSI controller input pix=
el clock gate
> > +
> > +=C2=A0 clock-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pclk
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: phy_cfg
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ref
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pixel
> > +
> > +=C2=A0 syscon:
>=20
> Such property names are not allowed. Missing vendor prefix, missing
> descriptive name.

Sorry because I thought `syscon` is a generic name -- it's available as
a compatible string (although with SoC-specific fallbacks) in
mfd/syscon.yaml . I'm okay to name this property `thead,syscon` or
`thead,vosys-syscon` .

>=20
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to the VO subsystem system cont=
roller.
>=20
> For what purpose? How does this device use VO? What is VO subsystem
> system?

VO is short for "Video Output", the name for one of the "subsystems" on
TH1520, and this abbreviation is used in the user manual in strings as
"VO_SUBSYS". A certain register is wired to D-PHY sideband signals and
thus bound to the DSI controller.

Should I add the information in the last sentence to the binding?

Thanks,
Icenowy

>=20
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +=C2=A0 - clocks
> > +=C2=A0 - clock-names
> > +=C2=A0 - resets
> > +=C2=A0 - reset-names
> > +=C2=A0 - interrupts
> > +=C2=A0 - syscon
> > +=C2=A0 - ports
>=20
> Best regards,
> Krzysztof

