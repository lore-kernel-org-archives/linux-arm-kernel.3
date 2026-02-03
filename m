Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EC4E87853
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxRZj0AY9TOHzJQ25E1bMJSXXVvEqu1lebr8DpX0JGM=; b=B4YiouN/KFqJmWQjIL/jSAHkL4
	eE2R8qBjOlkyMEp0UKzGRPz1dbK4pdB4T8BU30vN54ZuQreg4eotkTPB7gWcpN5c+FCEcc4Q32n7f
	+9udIba1EMd5h0WMByMv0lAxFWVFCoVTwsCuZz6hL3/9rn4lSQNDT5bmwVky5Z1av6xG+WpzUtYg2
	t+EjlRaOSLJqB9HbixYUvhGQQk3+JhqRpTeOCFgczG/IqdtJBD12rw54LztBeh4AxgtXO9BTI5QNq
	mquOsrlNEgrEseLqGGDnMsE+bTKLie3a3KRBhscXnu9DvJeB0P8yE4f3J7n6HmaXsIuszg1RX0kD6
	ATJO8eLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKpJ-000000076UM-4BOQ;
	Tue, 03 Feb 2026 18:08:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKpH-000000076Tw-2qsn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E70CB407F3;
	Tue,  3 Feb 2026 18:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18DDC116D0;
	Tue,  3 Feb 2026 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770142113;
	bh=0LJ3ad+aUYP4TBmiQsQWSAjbrdSr9GVEvOVf9dah7X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U77tsGEo6UdMz0EMWdCnPFmrW5af75bt1JRDMYp/NVztkU1/XVmwaJ7KylnzZwc7D
	 GZhgqRiztsmLhMH5sG0kgZ0CoRnoCCKEvpmlPSMY8N7ZasyWL5eh7pi2wMRmLLSmmP
	 SWSa5jkjcp/zKrIiHzUkiaXEHHMh90bYlZ5n6GZHE9xKRG1+TJ1qi7WKku0CoYl+yC
	 HljPPPt0Q3fxrSCjUnhy/MSJ4Urrs5pd9u6U98fp3aEZU36bTEWrqd9PFTo78Vcdwj
	 oHZr1m3U0qP1XqnYK1IL5wN+VX5FUFjCrIUURLOhkusnqD4mYZY+rVsdFd3s/9GoCq
	 9f8b8o9Hi1sOw==
Date: Tue, 3 Feb 2026 12:08:32 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	Herve Codina <herve.codina@bootlin.com>, linux-usb@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
Message-ID: <20260203180832.GA3217395-robh@kernel.org>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
 <176994942956.410099.10343293169382130437.robh@kernel.org>
 <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_100835_841468_9DC144ED 
X-CRM114-Status: GOOD (  25.91  )
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

On Mon, Feb 02, 2026 at 04:32:54PM +0530, Charan Pedumuru wrote:
> 
> 
> On 01-02-2026 18:07, Rob Herring (Arm) wrote:
> > 
> > On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
> >> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
> >> binding to DT schema.
> >> Changes during conversion:
> >> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
> >>   driver matching.
> >>
> >> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> >> ---
> >>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
> >>  1 file changed, 71 insertions(+)
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
> > 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> > 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> > Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
> > 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> > 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
> > 	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
> 
> Hi Rob,
> Isn't it pointing to the other schema ID which was not defined by me? 

You can't have the same compatible defined in 2 places.

> Can I have your suggestion on changing the compatible name to other 
> name to resolve this error? 

Why are you converting this? It's already covered by generic-ehci.yaml. 
Though I seem to recall there were some warnings for Atmel.

> I ran dt_check in my machine on the 
> latest version and I don't see any error there.

Please read the last paragraph below for why.

> 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.

^^^^^^^

Rob

