Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749F8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S57DKTWXLs/9f2IPDzxcNXYUu/FS7kJ5cAjwwKfx/Ds=; b=1j/vFi6Iv4Ki+1tyT6ZuBxSK5A
	bO7iN8CWNMoEGJ+5ZWI2e7UdeVE14l9ZEnLb83QCblYHD5xwJj6Vt0/QLvMj3ni3JfnkhniYORwFZ
	FIubxb10BVncyUH89hxK9EdkO/ryemvjGu6+BuzgJCmY7OeoRbKFOvmybOGg8S4utCsyW2cIvi4H3
	AAciFqiHfjiRHDmrhG8aXLyngbCn+aFx/7TIiMXodv8K1xTXJUTANGq0hvoUlor6AfAQ3ir6TgH3S
	vmAna3sb5+38QHt30/3ATJk8Ov++wGifE2MA01sVFhuFoHWoHrszINkWIY41Aw+6r9rinwSFS0Pz6
	0wTjIPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqayS-0000000EySZ-0Zd5;
	Fri, 07 Mar 2025 16:55:00 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqauF-0000000Exk0-3nXR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:50:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E33C3433C9;
	Fri,  7 Mar 2025 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741366237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S57DKTWXLs/9f2IPDzxcNXYUu/FS7kJ5cAjwwKfx/Ds=;
	b=KJev8qlqpoqNIqLvR5qWEghesnn+TdwjmMtw/IYaX3Vk1G9bDZIH3e5M3i4RL7AHdr57HI
	MsN/sqnsV6QEZJ1wpqnWVmcXuhkkiOqEk/TPVJfWwMDWh/zGMBbVs+o8miFzDeZA1W3AzC
	Lmi7n1K+uL0lit+uItX3LhqBnQ9drzZDEZm+6NisnCfrfsO9TvbtQtfAlhNWfPDhm2zZjL
	O5cplwqVUuR62syad3UxTxWDKaNU71vemFOy4zfIU+mysGNh26KfUl4ZRJfJbgMhxtDX0C
	XuEQ3mqQ6dngNXKbtWMR71TQrXfL4ZZkKMbh2Vfy+mv8sOdYqO5Hi5gAmoo8gw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: marvell: armada: Align GPIO hog name with
 bindings
In-Reply-To: <6bed3249-9905-4949-8031-52217f123f2e@lunn.ch>
References: <20250116085947.87241-1-krzysztof.kozlowski@linaro.org>
 <6bed3249-9905-4949-8031-52217f123f2e@lunn.ch>
Date: Fri, 07 Mar 2025 17:50:36 +0100
Message-ID: <87plis23ab.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemledtrggumedvvggutdemlegstgdtmeeivdgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemledtrggumedvvggutdemlegstgdtmeeivdgstddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshgvsggrshhti
 hgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085040_088491_8F631A58 
X-CRM114-Status: GOOD (  10.07  )
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

Andrew Lunn <andrew@lunn.ch> writes:

> On Thu, Jan 16, 2025 at 09:59:47AM +0100, Krzysztof Kozlowski wrote:
>> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
>> to fix dtbs_check warnings like:
>>=20
>>   armada-385-clearfog-gtr-s4.dtb: wifi-disable: $nodename:0: 'wifi-disab=
le' does not match '^.+-hog(-[0-9]+)?$'
>=20=20

Applied on mvebu/dt64

Thanks,

Gregory

> Hi Krzysztof
>
> I believe the mvebu pull request for the next merge window has already
> been sent to arm-soc. So please repost after -rc1.
>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

