Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F97C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2T/oegJiDpCtk+u192Wpv5GLasrylGVwYnEKe857cQ=; b=IBA3rnV8f9YPgdW+7j6ZP+Coap
	UuMMUzU28PsXV+PWM+8j564TUOjS6mCjLf4YvlBxoZQyvArGvDde/T0ROkEKrpxPIE3T5VLbMqAUQ
	jcFbfPZAsQKYwyi1f8FQAR6mzTo2rO1zR4BCQrTSn+Sp0PuWMqwRCMfzo0+JdWqwpk/HLbsHbZQpt
	RruHZIyFx8DsniraWFeFWZ6MkEO9yTJoGxXRphgcq5+ca0QmHGGibg0DhxI8lLw3729lD/tTq+m++
	8zddwHgZdbvhhr/QjOCNJ+dCuvB+WyylmUSYvq2vgPzb+QlRX2LwKtTaWx0cjHbq1XSRl1YZEWX9e
	iQ4yfqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhoB-00000005qhI-2fd0;
	Sat, 10 May 2025 10:51:55 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhRH-00000005oVF-209J;
	Sat, 10 May 2025 10:28:17 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 761F6114010F;
	Sat, 10 May 2025 06:28:13 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Sat, 10 May 2025 06:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746872893;
	 x=1746959293; bh=X2T/oegJiDpCtk+u192Wpv5GLasrylGVwYnEKe857cQ=; b=
	e5Dg9tslb70FSgFH7y58OQ4B4u9YYjxW8d+CW63SIcHaxlNPLUd3R3LcB5bfh3GM
	pL3JJ3th1U9iXp+fFum/4igCVLoDDd/RoVvpGiEgCeG1HUbe3JNxMFnjUK6lpikY
	hwnkWVSAtCpo9G1YBktSv6R7E3HppDX7MRKyeDutDRPqsXg+fVeoDsuxsrd/nvbP
	cocF/T+ibNPPCUthF+Gfl4//Ra79cjcIQMxge8FQlrl5JqP6w9gsN6iVLbskIoaU
	PTrLJdjBwKzYQk0P0cG5zZySCaWTyetGd9XpFMdKoXwUrJJDv7pFQeHYZVcxaAAK
	1VpXru0JBtlI4iadoMJXgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746872893; x=
	1746959293; bh=X2T/oegJiDpCtk+u192Wpv5GLasrylGVwYnEKe857cQ=; b=m
	ajWOhSCnTYOyf0j7pWaTcBcFZJGV0oQL4zcFVPGDybm6YQnbbUPCSSw5YJWBq4ac
	K0inKcGWx41MUXkdyPBTNST9O22kjz5XN2y+/+ag7p1bsTeeaByGtnmUpw8zJuHT
	FJGx1gtm7AXF+7EOt1ECvzgP1QCRPOkVOdOLmGEYB0oV8/brHO9DspGK9xpCgLY0
	i4XU51zabQGAIh9F2hZqVii6qgwSyfNLx3AZfA6xSLQGX/uQEIbH/5YnMm9+BOWm
	UiITCZme9F+WfEjBa1/22SEB4OSY2FPgcLeZdBk/DBtUR7MgnLYATXnLCyiZTXjH
	A7NIW6QKpuNLR+MfsmWYg==
X-ME-Sender: <xms:PCofaN1p5fLVuQcydEQBsrKko1uzy4Fu30szH70TMNhjRwVaPP_p8Q>
    <xme:PCofaEG9fA6Rt8XGjudjSKHk56NZHQv2qc36PjJN139DE9wkbH4rXqcXl41q6AxHn
    L_b0jUCzUmIQp9inK0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiihihigrohesughishhrohhoth
    drohhrghdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    ohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehhvghikhhosehsnhhtvggthhdruggv
X-ME-Proxy: <xmx:PCofaN5ScQrh0BVH8rBShpCvy78tDbcnjCl7_Sf4r7pJrBe8aOGCNA>
    <xmx:PCofaK0oP3BuKsEyg3ApgaZYF2fctU0gnX4HaSNnHtMhwaqEmo8tnQ>
    <xmx:PCofaAGEL0v5WIzhq5QuNysH3MTKQNN9HLG1eTwPTAb75ZbabcTmFA>
    <xmx:PCofaL-2psMyUrmyxpVhm6x8o9oknUd8TrN3D5brGw9uSmWvOGsnGw>
    <xmx:PSofaGBKzYe3jvv7FDQtrCKYrb1YcHP91RT0FnRfmVtn1uwKhb50Cfnq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 896B41C20067; Sat, 10 May 2025 06:28:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8d120477412db8f8
Date: Sat, 10 May 2025 12:27:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, arm <arm@kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, "Yao Zi" <ziyao@disroot.org>
Message-Id: <df6003e3-7fc3-4e50-a702-f0aa8d663dff@app.fastmail.com>
In-Reply-To: <2857184.BEx9A2HvPv@diego>
References: <2307187.iZASKD2KPV@diego>
 <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
 <2857184.BEx9A2HvPv@diego>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.16 #1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032816_314926_D1BAD567 
X-CRM114-Status: GOOD (  17.45  )
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

On Fri, May 9, 2025, at 23:37, Heiko St=C3=BCbner wrote:
> Am Freitag, 9. Mai 2025, 23:03:54 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
>>=20
>> but the corresponding nodes are left at disabled. I see
>> that the same mistake is present in the uart nodes.
>>=20
>> Please send a fixup to remove these from the .dtsi file
>> here and the similar chips, unless you are sure that every
>> board will have them enabled (like e.g. the gpio nodes).
>>=20
>> The aliases are not meant to refer to soc-internal names,
>> but the identifiers on board.
>
> For the uarts and i2c (and spi), all the identifiers are always numeri=
cal
> both in the SoC documentation as well as on the boards and board
> schematics.
>
> If you look in a random Rockchip schematic file, the lines for the i2c0
> controller will be called i2c0_scl_foo, i2c0_sda_foo, etc.
> Similar uart0_tx, uart0_rx, etc.
>
> So while I fully understand that mmc0 -> emmc, mmc1 -> sd-card are very
> much board specific, somehow repeating the very same i2c aliases for e=
very
> board feels strange. The 7th i2c controller on the soc, will never be
> called anything else than i2c7 afterall.

It's usually most important for the uart, since that tends to go
to an external connector on the board that may use a different
numbering, or may not even use the one you named serial0, so these are
renumbered most of the time.

For i2c, I can see a reason for keeping the numbering the same
as the on-chip pins, but only have an alias for those that are
actually enabled. We should probably have dtc check that there
are no aliases to disabled devices, but that requires cleaning
up a load of board files first.

> But ok, if you feel strongly about that, I'll move the i2c and uart al=
iases.

Yes, please do.

      Arnd

