Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46139D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYjd7tbJoh2y06N1DtuzIzlxdeNR0195+Wn0hvKR0ic=; b=gZo8riByMTEUHoJZjJueH2uft2
	PUHLKFrPyCoWldmxJgPgXQWhkt0H4NWkk4NLLMB+HrpVrSYYTN1xa6brNyH4seWvOX6tWSy13wBm7
	ISC58lGYqxiaxFCyR4vZyFbtFkpMGaOqK7fKsKySi4qx9qyRD5XGozydWz37fFdENC8aiqPi01wnF
	mu/JiONvYLgUn2yKMHoH8dq2u1fV4rE8Fj4ZyaPmK5w5R9deq24DdfELUvjml1jlKVhgELmi4eslx
	pfvIjAeJySON/dMlc+ItP7ZkyVQOqxrhMjxpTLkmn2gJMzHCxIIxDdX4plOtKkZzoCVLeJyMi3Eis
	dtoqXzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6jV-00000004GA1-0cKi;
	Mon, 01 Dec 2025 16:26:37 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6jS-00000004G8j-09ws
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:26:36 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560+5C/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1764606330; x=1765906330;
	bh=xYjd7tbJoh2y06N1DtuzIzlxdeNR0195+Wn0hvKR0ic=; h=From;
	b=Wh7fwvhJEouVlTgDON3WupDZPYB7g4nvZwcCpS58k42c0vTl077ww5vK8jNWPhvEZ
	 yZXxieNs7zDu7Gzwwfrq5qOcG5gse/vVohNJBOtHzbBNm6Kad04k/nsZdTtE7h7Ugg
	 8yUk59ho8+vq2HHB5E6Z5LG4ZOKu2R4py1wYupLEusmu/8DA4nTUfuBHYoEO9BGTXe
	 OKU0IeE3kFJw1EMdCiZF4YGtrztWrQkkIiXiQv11x42DZg9WTwi4RbT5Ju4KO6QLrc
	 P/BMYHBe4f3B/+XU2wJvwvH6ZDba+5wrrKnB2WHf7sGW/AvnqRKkG8LozFOlwA85WB
	 jF+cuEvPP8OEg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.18.1/8.18.1) with ESMTPS id 5B1GPSs0006348
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 1 Dec 2025 17:25:29 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 17:25:27 +0100
Message-Id: <DEN0QJT6O8BU.3INUCXH1I0P0F@matfyz.cz>
Cc: "Johannes Berg" <johannes@sipsolutions.net>,
        "Rob Herring"
 <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        =?utf-8?q?Duje_Mihanovi=C4=87?=
 <duje@dujemihanovic.xyz>,
        "Andrew Lunn" <andrew@lunn.ch>,
        "Gregory Clement"
 <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>,
        "Brian Norris"
 <briannorris@chromium.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>, "Frank
 Li" <Frank.Li@nxp.com>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mmc@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Jeff Chen" <jeff.chen_1@nxp.com>,
        "Peng Fan" <peng.fan@nxp.com>, <david@ixit.cz>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
To: "Francesco Dolcini" <francesco@dolcini.it>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
In-Reply-To: <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_082634_659683_49688994 
X-CRM114-Status: GOOD (  12.22  )
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

Hello, Francesco,

Francesco Dolcini, 2025-11-28T18:05:37+01:00:
> On Thu, Nov 27, 2025 at 04:29:12PM +0100, Karel Balej wrote:
>> To reiterate, the firmware is generally available but is not part of
>> linux-firmware and the entire process of upstreaming the chipset support=
 is
>> stuck on that.
>
> I'll try to see if any of my contact in NXP Wi-Fi group is able to help. =
Give
> me a few days.

that's great, thank you very much!

I have received a reply from Jeff in the meantime who has discussed the
matter with his managers and unfortunately, they are not interested in
supporting this chip as it's considered outdated and would pose
maintainance burden.

Jeff however thinks that you as their customer may perhaps have more
luck when talking to them.

I am also still trying to find out whether upstreaming the old firmware
version (available as part of the stock Android) would be an acceptable
compromise for them - I never really intended for this to be supported
officially and I wasn't too hopeful about getting an up to date version
of the firmware either (although it would be very useful as it would
likely solve the issue I'm hacking around in the third patch of this
series), I mainly just want to upstream the support for the chipset as
far as possible.

Please let me know when you have some news.

Thanks again and best regards,
K. B.

