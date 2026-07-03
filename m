Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44769C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OreQQ0XdKsQWlU/ho4QuvNgm2eEyh+R1RO2QdadtGn8=; b=z4syyVNwYOy0Mn8ybfIfQvBNk4
	W6javL24m9+KcNzqhcj0kvyK35s8QkdOVjeL5SAaFKvWFD0Hle7IJBtrX9eXXBkWJopee/Xq+7DdW
	Cyr3UidwGGKmR9LpPEZVViDJJ2ofFDfg3mzaTb28zCrEXeNB1XfhX74X6i7z9qb/L9T49LrKlHT5D
	jj76LyzWrnehsJIiraJHwC+2RpHHeFqoodkwfJqJtlJu5GhAdrjwuKF/M20IhvWBgHSqsceTCvwJc
	5olT1GlsMVDB/+71fboLIZeoXORSabmpiqjcIH1RjbSbtk26SRq04cqamGamuPq71RPQp3qH/F9gi
	//Q+gsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdaJ-000000072gD-0j5k;
	Fri, 03 Jul 2026 13:05:35 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdaF-000000072e2-3rZJ;
	Fri, 03 Jul 2026 13:05:33 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 08A4D4E2;
	Fri,  3 Jul 2026 15:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1783083920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OreQQ0XdKsQWlU/ho4QuvNgm2eEyh+R1RO2QdadtGn8=;
	b=nbrNh1zRQhB03C1yi+przXweH4RnERZffAT3vCSDaaxFgOrgAE3JWwxbVruloGmMtqMku6
	T0AD0QKO85hwr06F2IJL9gKTBfGEYHPc9gCGM9BAbBkT9GLr6KFcq80FuRVMVlFY84ZJ01
	/ZT59/9gw0hoskPrAhdBxSIlLd857e/7CKd0ZAYJ9GBaqAgTDBOp1pWkJR3y0eyVwj2C21
	Wl+VrFYl3v7WRGDz8sjsns9LPSiqfPnjo2mf1c8lqxtacN2yZRDbCgvSHOFh1CVV6IH5ga
	XVRmYNWdAmYfOXvdAT8gY979h7ypsdOF0e3iWSproq2mdHOZqf/rcwxsygAS6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 15:05:19 +0200
Message-Id: <DJOYHWDYJUT1.2PIRY8CG488AY@walle.cc>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Cc: <Manikandan.M@microchip.com>, <krzk@kernel.org>, <pratyush@kernel.org>,
 <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Rob Herring"
 <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com>
 <20260702-utopian-termite-of-perfection-f1f3ec@quoll>
 <860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
 <20260702163723.GA227454-robh@kernel.org> <8733y0penb.fsf@bootlin.com>
In-Reply-To: <8733y0penb.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_060532_126656_08083FDD 
X-CRM114-Status: GOOD (  20.14  )
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

On Fri Jul 3, 2026 at 12:10 PM CEST, Miquel Raynal wrote:
> On 02/07/2026 at 11:37:23 -05, Rob Herring <robh@kernel.org> wrote:
>
>> On Thu, Jul 02, 2026 at 06:55:15AM +0000, Manikandan.M@microchip.com wro=
te:
>>> Hi Krzysztof,
>>>=20
>>> On 7/2/26 11:46 AM, Krzysztof Kozlowski wrote:
>>> > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
>>> >=20
>>> > On Tue, Jun 30, 2026 at 02:54:00PM +0530, Manikandan Muralidharan wro=
te:
>>> >> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
>>> >> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so =
its
>>> >=20
>>> > What is SFDP?
>>> >=20
>>> SFDP is the Serial Flash Discoverable Parameters -- a JEDEC-standardise=
d
>>> (JESD216) read-only parameter table present in most SPI NOR flashes, th=
e=20
>>> table contents provide basic information about the flash. There are=20
>>> standard tables which are specified by the JEDEC standard and there are=
=20
>>> vendor tables.
>>
>> Is SFDP present or not discoverable? Or we have a table of discoverable=
=20
>> parameters that itself is not discoverable.
>
> SFDP is almost always there. I don't think there are any non SFDP chips
> manufactured today (?).

Oh i bet there are, and IIRC there were some additions lately. Not
sure if the chip was new though.

> The thing is, even if we don't need to define it
> in DT, we might need to point to it in order to extract eg. a unique ID
> or a MAC address through the NVMEM interface.

Exactly. We can detect whether is a SFDP table or not, by trying to
read its signature using the RDSFDP opcode. But as Miquel pointed
out, that's not what this is about. For the nvmem part being useful,
we have to have some node to point to. At the moment, there are
three different kind of NVMEM devices an spi nor flash can create:
 - partitions
 - factory OTP (i.e. OTP by the flash manufacturer)
 - user OTP (i.e. what an OEM could write to)

Now there's a fourth one: SFDP. It can contain vendor specific
tables, which in the mchp case is used to store a mac address,
which is then used for a NIC.

So we somehow has to organize all of them, thus the sfdp node. A
more complete example would be:

flash@0 {
	compatible =3D "jedec,spi-nor";

	partitions {
		compatible =3D "fixed-partitions";

		partition@0 {
			compatible =3D "nvmem-cells";
		};
	};

	otp-1 {
		compatible =3D "factory-otp";
	};

	otp-2 {
		compatible =3D "user-otp";
	};

	sfdp {
		compatile =3D "jedec,sfdp";
	};
};

All being NVMEM devices and expose some kind of data used for
drivers.

HTH
-michael

> SFDP is split into several sub-tables, the first one is mandatory, but
> then there are optional tables which can be discovered dynamically.
>
> Thanks,
> Miqu=C3=A8l


