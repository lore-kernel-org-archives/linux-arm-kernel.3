Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A63C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1ZumDxuGmpXUjlvvZI3hOnnT1685l9jUF3247k5dyA=; b=Ef0LoytVMJ270fL0dBjPU8Iudk
	ta/peyN3TUDKQiT8KWJ5FDI4SjCqTzja2iS8ytsAG6Vu9aSEQMN6cb/jpOZ9bnd5aljp2lHS4vs/N
	Xoqglx9m+JenAxWLUpVjiG2Y7Ndy6U3YBbwye6LXse9RVRhEzGxbup7r2SkUuemVx537hJlR+sm8I
	gSr9OjbHaWV1PVRgHv8JphFvGaBMa4eKMu/dOwKBCJFt/idQDGhplFB16IZTwV+pLDvkoilFfafGU
	AWDqBMflK5c9NKc50S7warNNOqsZYXON6FYI++SMiNUScHqY5pjH7fY/mBqwWCW4lNgmqbH+C3Qm5
	2yoDI2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUy8-00000004vIs-36XJ;
	Fri, 09 May 2025 21:09:20 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUtF-00000004uDt-3GUb;
	Fri, 09 May 2025 21:04:18 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE44B11400A9;
	Fri,  9 May 2025 17:04:16 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 17:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746824656;
	 x=1746911056; bh=A1ZumDxuGmpXUjlvvZI3hOnnT1685l9jUF3247k5dyA=; b=
	sWha1hs6PFJJi6uC/F6rQ/iAJeevO8Y4siw7Z7Lt0B9SDv9KlH4AbfQ1cMBX/g+m
	eyqkxkmGzStRub4lIdqfJUfoAI5AlfkGugr1avdqdtdwVAnoY5y7KNCMPKJ+G2Xi
	xjLUBqXCNpMtIlLZZbCmpzc6+7c2KN7l9wX3PYk36sTcXsw1anhoVYCTmQfBKBUb
	QK9Sc7VfbZMeR30PwdgptUqI0l9DfYizdUmaGm9ob2gIArWeQNl/sDrQZfIy0Wn8
	QiQaqqViRu67pbcM7YgYE5RJ5LdrDbSbJD/UlqpccocyCRODe3pv2qOkY+ndQY/8
	aDYg97/RxnOjFQIed9wEKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746824656; x=
	1746911056; bh=A1ZumDxuGmpXUjlvvZI3hOnnT1685l9jUF3247k5dyA=; b=q
	0c9tA685PpwzRYFdGuv3DSQ8cH1X5KpXAntPbnFItACP+T31hmnG3r/3hdjQohx6
	590uPW8hKirfHT262feIB2y5IBWtru1gj+b7XxVkOoUP79XOtRG/n5siovL7DQUj
	3AksghhXakhDgoWkQ6cODu1EL5ejXFql3XikwVTlYX6tEpxXn2xtm3dOxMYU3m7a
	mWUfUjKangduSJ2VJOruFsVH57PahCJjRbofWYYQfEQrkasW+S2953E45sd8PFNX
	7PS9q/2e3VM3VFrXGVOsixOj70arprWzI0/XRYcjNXYrq7yyvjHLXLSwTdHt9130
	9y5y+E3eWAudo3YSCpMwQ==
X-ME-Sender: <xms:0G0eaFAIEC69H_JVLhTXpNtNmmtFvJsdce2Dd8iTSo64ngbIFv9-Mg>
    <xme:0G0eaDiGAVadl-YyJr-MDND9SP3ByBCIJza8tN9LVdH3OXht-NpMsgfekZ-8ccC21
    2UnfZW4MIEHj89j8ms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiihihigrohesughishhrohhoth
    drohhrghdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    ohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehhvghikhhosehsnhhtvggthhdruggv
X-ME-Proxy: <xmx:0G0eaAnOPEDxNA0b1DUJk0rVAe_pkDNfMBL7-PtvqA4PexsC3MkM4g>
    <xmx:0G0eaPw7L_75BzAVUbqaWuGH8LvmeTDPT0hnonqyG8AEhv36TkBryg>
    <xmx:0G0eaKS2lLr5pnIMlkySGxa9CHdeZR2magNJs4xzEO9p2J4hRvo91A>
    <xmx:0G0eaCa4fyWDPWQGX0TPEYvi7nQq1Ns6zCJyfwTukHKOIbRH430gBA>
    <xmx:0G0eaOfgl2h4WI-uDqQLd4VFjdyAe9yjuHfKgWMRya_xSRCuc5MCz81R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 275BE1C20068; Fri,  9 May 2025 17:04:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8d120477412db8f8
Date: Fri, 09 May 2025 23:03:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, arm <arm@kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, "Yao Zi" <ziyao@disroot.org>
Message-Id: <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
In-Reply-To: <2307187.iZASKD2KPV@diego>
References: <2307187.iZASKD2KPV@diego>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.16 #1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_140417_893605_90BFE2A3 
X-CRM114-Status: GOOD (  10.43  )
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

On Thu, May 8, 2025, at 00:04, Heiko Stuebner wrote:
> Hi soc maintainers,
>
> please find below and in a subsequent pull-requests
> Rockchip changes for for 6.16 .
>
> Even some arm32 boards got some love (in the next PR)

One small issue stuck out here:


> Yao Zi (2):
>       arm64: dts: rockchip: Add I2C controllers for RK3528

This creates a lot of new aliases in the dtsi file:

index 826f9be0be19..2c9780069af9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -24,6 +24,14 @@ aliases {
                gpio2 = &gpio2;
                gpio3 = &gpio3;
                gpio4 = &gpio4;
+               i2c0 = &i2c0;
+               i2c1 = &i2c1;
+               i2c2 = &i2c2;
+               i2c3 = &i2c3;
+               i2c4 = &i2c4;
+               i2c5 = &i2c5;
+               i2c6 = &i2c6;
+               i2c7 = &i2c7;
                serial0 = &uart0;
                serial1 = &uart1;

but the corresponding nodes are left at disabled. I see
that the same mistake is present in the uart nodes.

Please send a fixup to remove these from the .dtsi file
here and the similar chips, unless you are sure that every
board will have them enabled (like e.g. the gpio nodes).

The aliases are not meant to refer to soc-internal names,
but the identifiers on board.

      Arnd

