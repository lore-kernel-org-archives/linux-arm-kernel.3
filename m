Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845C7D44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CjSe/U+nzv9GiQYKnA55TJmWIVaBLG17HklLuP9BQuo=; b=HyC4YlxbZtIjNWV4YRCGAUNqj7
	sk3keC37OO9qF5dCXajP3LUYz1s6V7cCUaaC9nW7Nh9DvE1PMExd//+HbpmaJQloNuPvmWV995jLJ
	NLdfoGxaLz6rVzmlHAPG1pJLE/BEu4gQaheVwi1AXM6xtOe3ySvpgcDIUVZod2w3M5MO1Gow/l2qk
	33rbDUpJhV2BPLBj7iCzQAXy+wkqJsTrCVzi8//SAzSGIn6Q4nJz4Q/1Z01ncKgD60GUrG4k5nloR
	bzONw2EUq5tTrLmEDP4PjRtd1NBRvCZG/zH8/8L5FDHBqkSUMOw6RjHCRUN0hgya5knW1IkOydy/B
	akM43jPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhQ0-0000000EyPy-0xnd;
	Wed, 20 Nov 2024 09:54:40 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhOA-0000000Ey4c-18mK;
	Wed, 20 Nov 2024 09:52:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCCB60005;
	Wed, 20 Nov 2024 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732096361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjSe/U+nzv9GiQYKnA55TJmWIVaBLG17HklLuP9BQuo=;
	b=UMsqcLqizhfjcdodWKdRRxIHV/G24AKIsGNrdAAq4ZT9e/a9MVuhkV/AOZQ0kRe+iAF131
	xWlc7VGm++AIHwxvSi1cFpq8y3AfypDdpXPHg+R8zytnvRnc/lXI4CndJZ+clFyZkMNUkB
	K4rSmJ+GW3cgI/j0F0Ziev7Q82q8O/t9yiUr50dDIellFUW7jQcHAjB3R7E1NepRa1KImD
	zdXTwbQ4eOAIk2e9JAty7V91bo9Bvg3JKqBs7gJs9pV6bIjkqcrbzasIiMFj3N6nPUXPjS
	hwLeJt9Ro2U3gRa7a/vAyOWgyPSCxvuhhqafKFS9d0uH3b3+344AeSnRRue/Ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
In-Reply-To: <IA0PR12MB76994483BBB757BD9F691513DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Tue, 19 Nov 2024 17:02:33 +0000")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
	<87frnoy8na.fsf@bootlin.com>
	<IA0PR12MB76994483BBB757BD9F691513DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 10:52:38 +0100
Message-ID: <87sermxme1.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_015246_738141_411C87EA 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>, "beanhuo@micron.com" <beanhuo@micron.com>, "git \(AMD-Xilinx\)" <git@amd.com>, "robh@kernel.org" <robh@kernel.org>, "richard@nod.at" <richard@nod.at>, "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>, "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>, "Simek, Michal" <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "michael@walle.cc" <michael@walle.cc>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "pratyush@kernel.org" <pratyush@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 19/11/2024 at 17:02:33 GMT, "Mahapatra, Amit Kumar" <amit.kumar-mahapatr=
a@amd.com> wrote:

> Hello Miquel,
>=20=20
>> > This approach was suggested by Rob [1] during a discussion on Miquel's
>> > initial approach [2] to extend the MTD-CONCAT driver to support
>> > stacked memories.
>> > Define each flash node separately with its respective partitions, and
>> > add a 'concat-parts' binding to link the partitions of the two flash
>> > nodes that need to be concatenated.
>> >
>> > flash@0 {
>> >         compatible =3D "jedec,spi-nor"
>> >         ...
>> >                 partitions {
>>=20
>> Wrong indentation here and below which makes the example hard to read.
>
> Sorry about that. I am redefining both the flash nodes here with proper=20
> indentation.
>
> flash@0 {
> 	compatible =3D "jedec,spi-nor"
> 	...
> 	partitions {
> 		compatible =3D "fixed-partitions";
> 		concat-partition =3D <&flash0_partition &flash1_partition>;
>=20=09=09
> 		flash0_partition: partition@0 {
> 			label =3D "part0_0";
> 			reg =3D <0x0 0x800000>;
> 		};
> 	};
> };
>
> flash@1 {
> 	compatible =3D "jedec,spi-nor"
> 	...
> 	partitions {
> 		compatible =3D "fixed-partitions";
> 		concat-partition =3D <&flash0_partition &flash1_partition>;
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> 		flash1_partition: partition@0 {
> 			label =3D "part0_1";
> 			reg =3D <0x0 0x800000>;
> 		};
> 	};
> };
>
>>=20
>> >                 compatible =3D "fixed-partitions";
>> >                         concat-partition =3D <&flash0_partition &flash=
1_partition>;
>> >                         flash0_partition: partition@0 {
>> >                                 label =3D "part0_0";
>> >                                 reg =3D <0x0 0x800000>;
>> >                         }
>> >                 }
>> > }
>> > flash@1 {
>> >         compatible =3D "jedec,spi-nor"
>> >         ...
>> >                 partitions {
>> >                 compatible =3D "fixed-partitions";
>> >                         concat-partition =3D <&flash0_partition &flash=
1_partition>;
>> >                         flash1_partition: partition@0 {
>> >                                 label =3D "part0_1";
>> >                                 reg =3D <0x0 0x800000>;
>> >                         }
>> >                 }
>> > }
>>=20
>> This approach has a limitation I didn't think about before: you cannot u=
se anything
>> else than fixed partitions as partition parser.
>
> Yes, that's correct=E2=80=94it won't function when partitions are defined=
 via the=20
> command line. In my opinion, we should start by adding support for fixed=
=20
> partitions, add comments in code stating the same. If needed, we can late=
r=20
> extend the support to dynamic partitions as well.

New thought. What if it was a pure fixed-partition capability? That's
actually what we want: defining fixed partitions through device
boundaries. It automatically removes the need for further dynamic
partition extensions.

Thanks,
Miqu=C3=A8l

