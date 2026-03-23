Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBA1F46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd31+OEbj8IWc9lLNUfT8YQfxX8C/1PiH6pBa2cJ/+s=; b=N/t+Nh2eZVKRTwnAFRHqFvZMJF
	zG0uGIoU5y8TH8nHgsKVSmkSs6QkTTmcxhG8Qjv2NqDl4KuMADCcdQ1L0gNF4QdnVZ0SulaO9KhdL
	dxdUnElHu2BSSPPOufbIAIRLsgEdPZS/n57q3IWb9pqUfuH73v7ubAC7LTUYwLyLI14rzusBoGVQd
	4lbxvkxgwcgPCScSxBoz01FY1JFJ97H2OFQT7hv41e44zURyqR2PL6mfh8hVrSeOTRpvhLAVm1iXH
	DkaMyC9lz0Puo8yeSJeFQA2pIwK5vE+lNeer1Ggd5s9CPhXbhuyCaXA9FaPLS46/trsEtf3uqWWPN
	7qbkwnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hIQ-0000000H2gw-1UcW;
	Mon, 23 Mar 2026 15:34:26 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hIN-0000000H2gY-1hiH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:34:24 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CADB0140025E;
	Mon, 23 Mar 2026 11:34:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 23 Mar 2026 11:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774280059;
	 x=1774366459; bh=Yd31+OEbj8IWc9lLNUfT8YQfxX8C/1PiH6pBa2cJ/+s=; b=
	e3pFQDidRQpkhhk57zNsymTD5WIb7TazkQjZDMrK16h362jUTdKWBkjE+ZIxfJVo
	OeCveeeW6HGHc9hH3SJuHSvYskIff9OxMTEaSwnk1hpYeOrTxpllHrjGXB16F3e3
	DNkEoe9+qMFrVC7q2X+zD+JLTToS3bq1gJqQI5RsPHhmyVXUlAxqUyPZDryGwmFL
	mlc/n7/uCFzmqKcuQA+K8+WzUG5HMPlOvbfO6Fp0mmuwGRMr/QcCYuTbeXvaKpxZ
	88wKItGKYn0/TqDt+LeSoNEHjX0uw+p95+0mDd4Q51ijhk+pWw8FM7f4XTBTrels
	+NOFb19wb6A7Z0VzSXYzkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774280059; x=
	1774366459; bh=Yd31+OEbj8IWc9lLNUfT8YQfxX8C/1PiH6pBa2cJ/+s=; b=w
	CMzNLjekVns0KiVOHTlcTrNErcBr2io9NhWr1bMfZBaHYVPkQUsB8Ns3uYUdntB8
	MXFAXId+IddgU5oIWbx93zxABaP5uj+VtRqRdQXDvei2ITtnUJXR/sXRxblOHccy
	GCXgEGAX8UsaedKZ70g/pQRO9RLH8kC6NuK/eAAqTPekl4W1emzBpbFM7K26PIUw
	2wVsN0COnBHWhOEG7v8csRyal1LbH0LoMDdHT0eWvNJVgq5YU11d1vwqhbQwWTtP
	2ihGbhJ6iAv4enJAYlfVEsG9xc921a3wAR2KbDHm68tixvFmpOc4P0IZ4n68cEGt
	FepBUj1emd+Iac3vUGCpw==
X-ME-Sender: <xms:e13BaTKiIOOoM2H0G8PP645YRQEKcrs8JgXwEn_XBoNiMyGjYxlaxg>
    <xme:e13BaR_PRMQrw7n90RiTMVmZUM_QgGJ2wvfmj6q34qCGv91y19mYiCposmuP0NU6r
    VxIhJqgN6NZtxWabViZXXFZYLNvVt8MM1pTncfonvVYYTpzgg4xYYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudeltdekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:e13BacUyGZEoEB2pIZFJsMFJlcTEaFSkev9fRRQZIdQun_Bf_toSaQ>
    <xmx:e13BaeFLwz4khEZGQU2sgAGfNEF1wDm71JIFuMfRsZPP5vssac7RnA>
    <xmx:e13BaceKNEs8Zwk9K_inXZyhXHdd0zhD9N0TLLYobejE4H76VUj2vw>
    <xmx:e13BaYnI8lmMdp-yUHN_v9Ya9YU4BJY7vMniLrjaLqBnY9LbFy3KsA>
    <xmx:e13BaeqEQaMgU3Z6y39ekZSeoWNJj4z96VuM0vjwR5dqjGfKX9pAmg5d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 06384700065; Mon, 23 Mar 2026 11:34:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ABMmOHXEXk43
Date: Mon, 23 Mar 2026 16:33:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>
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
Message-Id: <bd3df7c9-af55-4454-b120-a008b6362972@app.fastmail.com>
In-Reply-To: <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
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
 <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
 <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_083423_768672_D0B48F7F 
X-CRM114-Status: GOOD (  22.43  )
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

On Mon, Mar 23, 2026, at 08:57, Khristine Andreea Barbulescu wrote:
> On 3/14/2026 9:31 AM, Arnd Bergmann wrote:
>> On Fri, Mar 13, 2026, at 18:10, Krzysztof Kozlowski wrote:
>>=20
>> That said, there is probably room for improvement, since some of
>> the register contents are read-only and could just be accessed
>> by the boot firmware in order to move the information into more
>> regular DT properties instead of defining bindings for drivers
>> to access the information in raw form.
>
> Assuming we drop the syscon approach entirely, for the SerDes
> presence information we could follow Arnd=E2=80=99s suggestion and have
> it provided by the boot firmware instead of exposing it through SIUL2.

I didn't say you would necessarily drop the syscon interface
entirely, but for each user of it, you can see if the data
in it is static at runtime, and if so, you turn it into
devicetree properties.

> However, SerDes presence is not the only information involved.
> As mentioned in the earlier replies, we also have the PCIe device ID,
> which will be needed once PCIe endpoint support is added.
>
> Would it be acceptable to describe this information in DT, as in
> other existing approaches [1], [2], [3], by adding a device-id
> property to the PCIe node?

I don't know how endpoint devices normally get the vendor/device
ID pair, but as far as I can tell, these are not normally assigned
by the boot firmware but are picked by whatever function driver is
running on the endpoint device: the idea for the device ID is
to identify the protocol that a driver on the host side needs to
use, rather than identify what hardware it is running on.

In that case, neither DT nor syscon are an appropriate way to
pass the PCI device ID.

From looking at the links you provided, all of those appear
to refer to host mode vendor/device ID pairs that get written
into the device at probe time, either because the boot firmware
fails to initialize the devices properly, or because the ID data
is not persistent across a device reset. In endpoint mode,
this would not apply.

      Arnd

