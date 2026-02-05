Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ABDE91292
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah96poweooP39XHipocL11TDAyJJlEOaH2JSHKLFb3g=; b=rvdbZS6Q8QeV5G0V7NgeSLPJhX
	GPaLFKasTL/KWAjY7HZI2yUppVEmewHieMlVNwQe1xDHD2ErwKfK3NgdzAKMdOMSV6O7y9p2Z3PPF
	Kv0RVb3JiyWKWcCfYVJZXAvp2pth2usWeWt165rJZdOor7ecSGBSVwtlSz+m7qyz5l/FiKRgq61gJ
	VnMHkBbp5K79wj+j9lHAEKPmuBS6Rh4IgKsiBbcGh137kMpS14QK7mXMKZROtEyAousmRJrfN9liW
	JYHRAxvmHpYcWJeOka2d82we9GxnUFlCxi0oa0uSNaMht/YnJjYrhq+tYXOC7kWimwBJvRxgfHT2i
	6cN/Qk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv3V-00000009cxT-3EFk;
	Thu, 05 Feb 2026 08:49:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv3S-00000009cwy-1Lz2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 08:49:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B29F4C243A8;
	Thu,  5 Feb 2026 08:49:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9527606FD;
	Thu,  5 Feb 2026 08:49:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 263B5119A865B;
	Thu,  5 Feb 2026 09:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770281371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ah96poweooP39XHipocL11TDAyJJlEOaH2JSHKLFb3g=;
	b=e8SCd2iq+TafgZsnMRv1dDAFDbNxcYWS4reV/gXRxs5niK9nBASXfKtq8Aujo2KeEZ9hpK
	+2unjWnkgk1UfnRVlTWATb51Zo5XVaks6lbUeTKD9IonZKzjl1XSVHLeZDJoLQ3r4p8DRa
	v/VIA+WrV22IwVVJ8Kc6f09qdssqHDLOU8JsO+B7HV4ZJo5UXypXtusr98fqdS25y+cmNw
	rdE9RcfUAmD8wehhFWWWySg/m35LDPaKmH100LGu3v2AScV6p3I4CMaWMEJEkGFIevNuZp
	NL8xJyz/FylwEWyhpPttwMWMNNfYVfwckeCKrHrIJxdnNxIImcd34ejHdt1oSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: William Zhang <william.zhang@broadcom.com>,  Hauke Mehrtens
 <hauke@hauke-m.de>,  zajec5@gmail.com,
  bcm-kernel-feedback-list@broadcom.com,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller
 compatible
In-Reply-To: <8ee13309-537e-4a63-a402-289fd119118f@broadcom.com> (Florian
	Fainelli's message of "Wed, 4 Feb 2026 13:21:46 -0800")
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
	<CAHi4H7EVLsgVL5KCERTX5XBNTMvZDNxePzo48Zp5dsfDdoCV1Q@mail.gmail.com>
	<87ldh8fdqm.fsf@bootlin.com>
	<8ee13309-537e-4a63-a402-289fd119118f@broadcom.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 09:49:27 +0100
Message-ID: <87fr7ffuco.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_004938_792263_4E5EDA1B 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Florian,

On 04/02/2026 at 13:21:46 -08, Florian Fainelli <florian.fainelli@broadcom.=
com> wrote:

> On 2/4/26 12:36, Miquel Raynal wrote:
>> Hello William,
>>=20
>>>> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dt=
s/broadcom/bcm-ns.dtsi
>>>> index d0d5f7e52a91..46b650abdb90 100644
>>>> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>>>> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>>>> @@ -479,7 +479,7 @@ thermal: thermal@2c0 {
>>>>          };
>>>>
>>>>          nand_controller: nand-controller@18028000 {
>>>> -               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1"=
, "brcm,brcmnand";
>>>> +               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1";
>>>>                  reg =3D <0x18028000 0x600>, <0x1811a408 0x600>, <0x18=
028f00 0x20>;
>>>>                  reg-names =3D "nand", "iproc-idm", "iproc-ext";
>>>>                  interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>> Acked-by: William Zhang <william.zhang@broadcom.com>
>> Do you mind if I take it on top of the commit it fixes?
>
> I already applied this change to the Broadcom ARM SoC tree. I don't
> expect conflicts so if you prefer to take it, I can drop it.

It's okay, this will just generate a dtbs_check warning if it reaches
Linus' tree before my branch, but honestly I don't think it matters
much.

Please keep it.

Thanks!
Miqu=C3=A8l

