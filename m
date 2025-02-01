Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62248C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PATAQ/9BwIrWJ3JG6zuTUGePxEvjmurrP+nZnbHjNSM=; b=IAxX+PvjKEucaD+LhJfozVsOnF
	OPIgGH0tXHLPtBMy7uouTlcl+IkuKMb/0qepLT9ccDP7jIMCfTydt6EOOdP86eyJGLtJzAN1HptIT
	Qa+SBgSxEu82zF9MX/fl1dTIFE13kacH6m1F01ksE86PNfhRDxxa/xRtRKihJRGGBXHbV8/oUOvyA
	MXLu8jZeeKgmAjo03yi3G5mzbIRMzDE1um/Z0LnaYwPyi1v3GlGTRHHkVKmhWu7Gnean13w1wwyfz
	Wg6409/4YiPGSXUFNJ53S3CZ6nMJtYBmFA1fTGOole4Z0x5z2sRxUO9aZFxP1ZQVCJBjsDOd9wSmv
	jvfsJKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teAtz-0000000CA64-1WPT;
	Sat, 01 Feb 2025 10:39:03 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teAse-0000000C9uy-1peM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 10:37:41 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738406243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PATAQ/9BwIrWJ3JG6zuTUGePxEvjmurrP+nZnbHjNSM=;
	b=pTBB+O0KTKCP9wTrBMgiLMyxMhEgbSIKEe7gFkbkqj+M9bU6lh7kxg5MEHk2wfS0+PVSRu
	hnf78jkW3RAFs6CGJAgLCkgHVwr440+Td5zj12/HeuPGp5EEkaGlTLFH2ghxaTuFXzsFiF
	+5VZjumqIIEwxgpbw9DzYrLP2o7CSAOMAAHbvSjn1aSApAINi8jFMyQt4VnHsTETrG9SPK
	KhbdR1yqNSfu9PPVEAisb3nuR14Ys06aNZZGV4d87nc8P0X8T1b7wv5jz/ydGSMzrBkENQ
	l8vl05ah/dbQuQeF4sRveDRHsPI6Hfjv/PImveicpK0OGSxFSA1tci0mvlkA1Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Feb 2025 10:36:37 +0000
Message-Id: <D7H1KE36MWE6.1G0PMUXEGX4XG@postmarketos.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Christian Hewitt" <christianshewitt@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-2-funderscore@postmarketos.org>
 <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
In-Reply-To: <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_023740_621788_293436A8 
X-CRM114-Status: GOOD (  16.29  )
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

On Sat Feb 1, 2025 at 5:45 AM UTC, Christian Hewitt wrote:
> > On 1 Feb 2025, at 12:03=E2=80=AFam, Ferass El Hafidi <funderscore@postm=
arketos.org> wrote:
> >=20
> > From: Ferass El Hafidi <funderscore@postmarketos.org>
> >=20
> > Add support for xiaomi-aquaman.
> >=20
> > Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> > ---
> > Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> > 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Docum=
entation/devicetree/bindings/arm/amlogic.yaml
> > index 0647851ae..0db7038b9 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -70,6 +70,7 @@ properties:
> >           - enum:
> >               - amlogic,p241
> >               - libretech,aml-s805x-ac
> > +              - xiaomi,aquaman
>
> If this is S805Y not S805X, you should add a new binding section for
> S805Y devices, and add the board there.

Will do.  Thanks.

>
> e.g. I did this for S905L (GXLX) devices:
> https://patchwork.kernel.org/project/linux-amlogic/patch/20240604084134.3=
315841-1-christianshewitt@gmail.com/
>
> Christian
>
> >           - const: amlogic,s805x
> >           - const: amlogic,meson-gxl
> >=20
> > --=20
> > 2.47.1
> >=20
> >=20
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic


