Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E01F107BCF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKTUyUuZVRkJCCnNrG1xGrkpHWso/fTyDgKqeG3syHQ=; b=yzHXcjCIbMH2pEF3H1g590NVo0
	JRooolN92saidfXIOGZbIDQNoVqnksMMe3PEaC3ZxjH8kFrFT+uAYM81AMGb+6p7McwDt692iq6Ks
	2cNzv4gdAT9rmipMk26P1R4PEyTpeeIG4LTRQAWlVXpT4MOrM5GAK/iKEUPv32IuB/yUSthIzWjHz
	v1yT4pP3RR/Lfz+Sdg8pJnKn1Th/7dyFbtuL42M7SwmVqMLTGkaR3thrarLV9v0S3cVXHW9SotHW0
	Jy8Kh5/xfeHGnGl3wBVY+CwdpDACfrp5I7GTVvneV4aYlJpaGKAQ+TYIsPEwwl6776n3x8dO5ZRjg
	l7hOZCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oRI-00000008EQ7-3B0O;
	Wed, 18 Mar 2026 10:47:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oRG-00000008EPE-3BWm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:47:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w2oR8-0000uP-Um; Wed, 18 Mar 2026 11:47:38 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w2oR8-000tRu-0h;
	Wed, 18 Mar 2026 11:47:38 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D08255075A6;
	Wed, 18 Mar 2026 10:47:37 +0000 (UTC)
Date: Wed, 18 Mar 2026 11:47:37 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Andra-Teodora Ilie <andra.ilie@nxp.com>, 
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC
 support
Message-ID: <20260318-unyielding-piquant-buzzard-ec69fb-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260318092215.23505-1-ciprianmarian.costea@oss.nxp.com>
 <20260318092215.23505-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4r44oj5kuxqnonw"
Content-Disposition: inline
In-Reply-To: <20260318092215.23505-2-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_034746_802361_2C84D19B 
X-CRM114-Status: GOOD (  21.24  )
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


--c4r44oj5kuxqnonw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC
 support
MIME-Version: 1.0

On 18.03.2026 10:22:11, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add NXP S32N79 SoC compatible string and interrupt properties.
>
> On S32N79, FlexCAN IP is integrated with two interrupt lines:
> one for the mailbox interrupts (0-127) and one for signaling
> errors and bus state changes.

Comment from patch#2 applies here, too:

Usually it's "bus error" and "state changes", as the errors happen
visible for everyone on the bus, while the state change is local to the
controller (every controller has it's own state).

> Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../bindings/net/can/fsl,flexcan.yaml         | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml b=
/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> index f81d56f7c12a..131fae2739fa 100644
> --- a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> +++ b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> @@ -26,6 +26,7 @@ properties:
>            - fsl,ls1021ar2-flexcan
>            - fsl,lx2160ar1-flexcan
>            - nxp,s32g2-flexcan
> +          - nxp,s32n79-flexcan
>        - items:
>            - enum:
>                - fsl,imx53-flexcan
> @@ -173,11 +174,38 @@ allOf:
>              - const: mb-1
>        required:
>          - interrupt-names
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,s32n79-flexcan
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Message Buffer interrupt for mailboxes 0-127
> +            - description: Bus Error interrupt

It's a combined Device state change and Bus Error detection interrupt?

> +        interrupt-names:
> +          items:
> +            - const: mb-0
> +            - const: berr
> +      required:
> +        - interrupt-names
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - nxp,s32g2-flexcan
> +                - nxp,s32n79-flexcan

Is there else if or something like that in YAML?

> +    then:
>        properties:
>          interrupts:
>            maxItems: 1
>          interrupt-names: false
> +
>    - if:
>        required:
>          - xceiver-supply
> --
> 2.43.0
>
>
>

regards,
Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--c4r44oj5kuxqnonw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCabqCxwAKCRDMOmT6rpmt
0goDAQC4zBBJXrqWNZFGX0yN+fKMo0Uhw5gc0I3NPrvVsHmwhAD+NzhvCVUvwLGT
lzJd5GVgLN8P2YOc9feguf39D6UungM=
=ReYa
-----END PGP SIGNATURE-----

--c4r44oj5kuxqnonw--

