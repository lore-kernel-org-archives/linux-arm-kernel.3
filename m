Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE96CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HeJhykeaboror19DirkCIOC1KIj82iSEPO/tVXnN4M=; b=WgPPiePgPXaRRu9DGpNqMxyxvY
	/eqiHBjmtchHdN6lzkqVACvcld4NWchFJiH1zYtqn6OyxybO/B83e8DAz46hEaakN4inX1qxZtbOZ
	qwkXb4pgFFxqHK9jMbRKr6nayLKZn8SDnjRftrKt2aELzwHWUrRWbpWeGEABla4FcDNB8hnF7hmAn
	RbwRwLJvIp7LrJwM5u/3wciKqoNM3817nvr/+6LvZwfGbUm9hX4fU7fYsKInr+8PeaPy8CzRkhdTQ
	JsP6YZrl9i9cJAXq7ubwOvNF5LCeqFzVnOdWEdhmhgluDIkykHVNYuwsIKnNNuFweVgc4NP6cZHVs
	gNRM5Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0GM-000000067lm-0Xz2;
	Tue, 09 Jun 2026 17:29:18 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0GJ-000000067l9-1Ryo;
	Tue, 09 Jun 2026 17:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781026149; x=1781285349;
	bh=6HeJhykeaboror19DirkCIOC1KIj82iSEPO/tVXnN4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vsp6POkAFvnGYUs9mPK7J8IN2X1dGZ+TiJ6toaYcPzikihEyLRjYZRB2npVe5jrNb
	 x7JMSdNeU1ihpcVlbsjhShf8yUqpSk0XDM0Em675OHKDQRuLud+A2RrdebiUOU3oDR
	 2YJcogfXv/RYl+PF21VFUuxsvePjE75qdJP45p4eTWiOMDPrX+Az+hSk0Tw5wmBpUT
	 rCzYfqi8KNTJ3yc8H9+/0DESKgQ0OiRcKhqutnccPubRwQHtXf0fxi5mtuB9+vfx7B
	 4j8VI32/gu2zIt91spG231hw2l00MwN0JNbADUJonjj6l0D3fVOiZ8FhaHzKLPxpTN
	 YRt0QOimZbN8w==
Date: Tue, 09 Jun 2026 17:29:04 +0000
To: Conor Dooley <conor@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6323 PMIC AUXADC
Message-ID: <8EwSIpbwPPOLZFrXcuriM4NGFc2O1ozFGphpfStH2hTxkSR1EWLBTNIefDK997sRukvAp2bUSkuyVYiG-N9MXIGxtokvPYWwOjtuQXLdmMQ=@protonmail.com>
In-Reply-To: <20260609-gangway-frayed-366f6d3cc867@spud>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com> <20260609-mt6323-adc-v2-1-aa93a22309f9@protonmail.com> <20260609-gangway-frayed-366f6d3cc867@spud>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 5aa3f45d931aba5644ec07b8e6c4ba287df96531
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_102915_564363_485DC752 
X-CRM114-Status: GOOD (  10.76  )
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

Hi Conor,

On Tuesday, June 9th, 2026 at 7:01 PM, Conor Dooley <conor@kernel.org> wrot=
e:
> On Tue, Jun 09, 2026 at 04:31:58PM +0300, Roman Vivchar via B4 Relay wrot=
e:
> >  properties:
> >    compatible:
> >      enum:
> > +      - mediatek,mt6323-auxadc
>=20
> Commit message needs to explain why a fallback is not suitable.
> pw-bot: changes-requested

Ack.

>=20
> >        - mediatek,mt6357-auxadc
> >        - mediatek,mt6358-auxadc
> >        - mediatek,mt6359-auxadc
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d1cc0e12fe1f..2551c8cd9e9d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16256,6 +16256,12 @@ S:=09Maintained
> >  F:=09Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >  F:=09drivers/mmc/host/mtk-sd.c
> > =20
> > +MEDIATEK MT6323 PMIC AUXADC DRIVER
> > +M:=09Roman Vivchar <rva333@protonmail.com>
> > +L:=09linux-iio@vger.kernel.org
> > +S:=09Maintained
> > +F:=09include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
>=20
> Why is the binding not being included here?
>=20

The binding is shared across multiple PMIC ADCs and maintained by
Angelo. Since I'm only familiar with mt6323 and not others like mt6358,
I decided to not include it in the mt6323 entry.

Best regards,
Roman

