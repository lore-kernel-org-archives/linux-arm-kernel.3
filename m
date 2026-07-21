Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD32C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py+kVer8y1a6uREwhTLMnOPCYBBt4/ypQx/1Dyh8NlE=; b=L3BxJte9FkRDA6fbgtF0hxHYhn
	lYGeOlWVg6dfBjb/NRPgbL8ucYkZJt8qkOCqRTdYG1QbuBJy2A+J8vv5ceReIv9oIZYd2v4rXBwzD
	cNvVK1xyRrSV4Ray88awoDSVJcHIbQTCu23WXjYumy0zGgjp9zwC8Nod1UobvlBnC2mvtpn0TskTo
	ZVSY9VfmMKb9QTa8gEhEPSWZyGyr9XN9OhK7CO2fYL6KQY1GLAT5WgMAwdo9Chi/Azqd8iQtlcls1
	ST8W2HMTub321InqBND6pTYpCreekMemCO/V/bhMZzps3H3LDWQr8z8z43B/1o5IT89tfnfW1dqfC
	dt3/tZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9qb-00000009S4G-297w;
	Tue, 21 Jul 2026 12:45:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9qZ-00000009S3i-0w6w;
	Tue, 21 Jul 2026 12:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=py+kVer8y1a6uREwhTLMnOPCYBBt4/ypQx/1Dyh8NlE=; b=UfyeBY73vzy27dJizTWAlgzPRe
	H76y57MW8rPT1PXVIHVsVh2LiNjbOSl4Tnh+TOkxX0IJvCFkmfuWhzNQ4oBRWVYLKGwRDi73fLIwk
	hNOm10pnsbKCwhYYw8kSjJg/4vjzgBRRfimQUp+RHZTaBI/5DjBce9eK4DN+XwUvNd3oF71UBYBO3
	a/b1USPQb7VUe6UKvx7db/8IvQhZwvqietnBfjgnOV7Eq8hZxZUdM58dvPTXptQr/G0FakLIc9KBe
	KZh+7IRIof2CmikmMqdt/1h3C+8/A6tmEIbtyV382lMlJvlb2pKu/l8q0GeoRwYFoYtp8FpCABulP
	3QBMho9w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf
 property
Date: Tue, 21 Jul 2026 14:45:16 +0200
Message-ID: <3352010.NnENhoQgcM@diego>
In-Reply-To: <20260721-ambrosial-raccoon-of-glee-6219dd@quoll>
References: <20260714192535.2082729-1-sjg@chromium.org>
 <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
 <20260721-ambrosial-raccoon-of-glee-6219dd@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_054519_263958_D6067EF4 
X-CRM114-Status: GOOD (  22.58  )
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

Am Dienstag, 21. Juli 2026, 10:13:38 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Krzysztof Kozlowski:
> On Tue, Jul 14, 2026 at 01:25:29PM -0600, Simon Glass wrote:
> > Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> > IO control (IOC) register block rather than grouping the registers of
> > all banks into a shared GRF region. Add an optional rockchip,grf
> > property to the gpio-bank binding so that each bank node can reference
> > the syscon for its own IOC block.
> >=20
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v2:
> > - Add new patch for the per-bank IOC reference
> >=20
> >  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.=
yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > index bdd83f42615c..774e9c7de606 100644
> > --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > @@ -44,6 +44,13 @@ properties:
> >    power-domains:
> >      maxItems: 1
> > =20
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle of the syscon node managing the IO control registers
> > +      of this bank, on SoCs such as the RV1106 where each GPIO bank has
> > +      its own IOC block.
>=20
> I do not see usage of it in patchset linked in cover letter with DTS.
>=20
> I have doubts that whil having one GRF region you have GPIO banks
> pointing to different GRF regions.
>=20
> It's possible if you would have multiple GRFs, but you do not. You have
> one GRF, right?

per my reply to the grf binding patch, Rockchip invented yet another way
to describe their pin-config - in completely separate blocks strewn accross
the whole io-space this time.

So describing the associated pinconfig grf per bank, does sound pretty
nice for that problem.

In the early beginning Rockchip had one really big GRF for all of those
settings bits - which included the iomux settings.
Later on they moved _parts_ of that to another big GRF that still wasn't
dedicated to pin-config.
Recently pin-config got its own GRF - for all pins
And now it seems we're at one GRF per pinbank ;-) .

When I asked some years ago - when there even was usbphy control in here
(and those regs+bits also moved all the time), the _paraphrased_ answer
was "because hardware-designers find it nicer" ;-) .


Heiko



