Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A468107BCFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr3JbOnsJoUpDM+B2gJBFvxjmzg4yKH8O1IiAlVJkN8=; b=jjdMtrYdt8RMNoAj++kEPJsgdI
	V3ghdZR9Rrdfn/7aJJ+8M41l7wQOmOWnYUiPdjSg0mZU/kp77vdTGqFftreKCqMk7VlotACXcg0Rj
	Kat/HPqd4lnJyyMdHo9BKZ7dJJDxzY1xWS0S7H+ZNOXM7vU59V7ZMRtfbQMo6FbfRHFt0kLOBh35d
	GNh3Hu23SIWZVUhYj9D5pABWmYJOgWqnuCaqEeG4ee+Z8hKyRUY7sbnSch6TTN0/LyNtRLcwQ0wBk
	a4jY5PjtuQvLyZ6qh1+6MZaL46GcfGijHLkKjtwT7SU8Md9PVivUmacg4Gq6NfVZaVvioAdDbNaEF
	1DG8xV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JTP-00000001aY5-0Uln;
	Sat, 14 Mar 2026 07:31:47 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JTL-00000001aXc-322R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 07:31:46 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3129E14001B4;
	Sat, 14 Mar 2026 03:31:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 03:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773473502;
	 x=1773559902; bh=tr3JbOnsJoUpDM+B2gJBFvxjmzg4yKH8O1IiAlVJkN8=; b=
	vIUGI6PUtGuLD9MmA7He5MaSxNXymLe5VmuYEFztVyE2ey+TWlMs9wpbxm5m0SHW
	/2MY8ZrghTSl0nxKsljeSTgPW+7p2aNF0g4qV2yoO6XpYUj/LVu30Hj8CfWufek0
	A1ntnxABTtEhR3xW+MmMkQfJsoh3KUtT1ghtLu1M5QbHvVh+GWUUHo8TgXT+f/X/
	Kj4DEr+3ffZQQJXQpu8gspe5isusRZ6zNkuOU8WlCbigR6WWowRvClVOVkMGZTaL
	PByD+pWip5jGOEaxIWOemgmWOR5EG5wYkProLjqgXoc3Y/ePf3F06VU/rN8mVjdo
	+i9Y4A8uLsATQ5NmWUtUMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773473502; x=
	1773559902; bh=tr3JbOnsJoUpDM+B2gJBFvxjmzg4yKH8O1IiAlVJkN8=; b=5
	th2kdid27NE2Q6Zf9HnTICg3grZm+GQN8HsdEBThJAfyx7j20KSsUU1MYkh+L3Cd
	CqJltfa1L4xTSkgSbx+l0/ZTbNDjjMKLeEncvOBuhU2TYlOZzzd6D5Imus9dxltE
	VqVX19DARJc5XHPxZVXM48Z+c4E2pBoYtf/iFLuaJPcd4IHeey22JaIbC0x6xGIb
	ikkVsNzGteydWH2PtuZ0C/YslE7OPGkPhMQADG5wSXECX8PYBUu4BALVhFkKfKzE
	QiWe3OcNb0B2Nj/iJB2T32XvubR3VQHwUA8jrRGMImZN2CJiDMjNSdBB4h/LgUtI
	DEOymQpmWEWhgkE3k4cqg==
X-ME-Sender: <xms:3Q61ae0qyzq46sW3iFr4nwLH-QablCM5EpxY18ktNc9I9ruTP7yZEg>
    <xme:3Q61ab4IHYWF-tJxe2XeLHOdgsjAAth3Fk_lV_Qk70vSY_Fap-Uc2C7cQE3cdkeVZ
    nKgVbw8tMpu_zRj8GS5FqDhxc4RXmd6wEi5fmdqsJM6wvSpxK3_9PU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleduleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheptghhvghsth
    gvrheivdehudehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3Q61aUC5SLAg6F46AVIdW-J6XHLcwTogwGCVkA98DKm3dcj7q-gmNg>
    <xmx:3Q61aUAQNtztZSaLvN0Ifx0l1VuiwS33s2iYj60XNAqazeuEZ51_1g>
    <xmx:3Q61aTqBE9u_uyIR9Q5J02qjuzP-epogqXeYePga7yjWs8xHlmbrOw>
    <xmx:3Q61aYAJUdlRMadUyUsf5YTcfIgInbuyUbMq4qleODkVz2y49zLAPA>
    <xmx:3g61aW2PxF8orihiR3Uh8UCLvDymWO1grtBE7zb-D4zegmREAp-v4m3k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44D63700065; Sat, 14 Mar 2026 03:31:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ABMmOHXEXk43
Date: Sat, 14 Mar 2026 08:31:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@nxp.com>,
 "Larisa Grigore" <larisa.grigore@nxp.com>, "Lee Jones" <lee@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Aisheng Dong" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Alberto Ruiz" <aruizrui@redhat.com>,
 "Christophe Lizzi" <clizzi@redhat.com>, devicetree@vger.kernel.org,
 "Enric Balletbo" <eballetb@redhat.com>,
 "Eric Chanudet" <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "NXP S32 Linux Team" <s32@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Rob Herring" <robh@kernel.org>
Message-Id: <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
In-Reply-To: <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
 <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_003145_081082_833D9100 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, Mar 13, 2026, at 18:10, Krzysztof Kozlowski wrote:
> On 25/02/2026 10:40, Ghennadi Procopciuc wrote:
>> On 2/23/2026 3:14 PM, Krzysztof Kozlowski wrote:
>>>> there are no resources allocated specifically for nodes like
>>>> "nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
>>>> driver and other drivers that read SoC=E2=80=91specific information=
 from
>>>> those shared registers.
>>>> =20
>>>> My alternative is to keep two separate syscon providers for the
>>>
>>> You got review already.
>>>
>> I still believe that nvmem is a suitable and accurate mechanism for
>> describing SoC=E2=80=91specific identification information, as origin=
ally
>> proposed in [0], assuming the necessary adjustments are made.
>>=20
>> More specifically, instead of modeling software-defined cells, the nv=
mem
>> layout would describe the actual hardware registers backing this
>> information. One advantage of this approach is that consumer nodes (f=
or
>> example PCIe, Ethernet, or other IPs that need SoC identification dat=
a)
>> can reference these registers using the standard nvmem-cells /
>> nvmem-cell-names mechanism, without introducing custom, per-subsystem
>> bindings.
>
> nvmem is applicable only if this is NVMEM. Information about the soc is
> not NVMEM, unless this are blow out fuses / efuse. Does not look like,
> because SoC information is set probably during design phase, not board
> assembly.

Agreed, nvmem clearly makes no sense here, the patch description
appears to accurately describe the MMIO area as hardware registers
with a fixed meaning rather than a convention for how the
memory is being used.

That said, there is probably room for improvement, since some of
the register contents are read-only and could just be accessed
by the boot firmware in order to move the information into more
regular DT properties instead of defining bindings for drivers
to access the information in raw form.

    Arnd

