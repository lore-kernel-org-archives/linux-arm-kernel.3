Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFEBF3D339
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YKLoA2IsMyTZEip4KGxzGcQ7ltn5puWK4jv6MRs+MY=; b=hF8+hoE5hWl465qInrSkdPLwxE
	nI5UweyQfzSEE9yFrhHbbf2UdMUJiUAAha2NHdl6QIJ1Vbu8SfTzb5UDP64lkJExBqCcr13OY+2/o
	65SxIX4o+f7nLURmtS9KWLW0q5rQAFqzxkCrWlBmii8HgdzrZD8ryFdkvMp8OvVoDvEL6EFNAa9MX
	dQzihVQizuLweWhLDvZW4zZBqyIYb8GV7it9aDm+ME0aT/zV1am06gpAwWR9Zk6GombNaKUH7eAZ2
	dCrvHGFtJ6g7c1Enst4hFwDPvWmC0c7b4mnEw4cNvEAQOL6pUqtWtUN+ULDCpxOzBGdEsvkq+xEOG
	E7Mhlyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCDa-00000002GEZ-0zCX;
	Thu, 05 Mar 2026 17:10:40 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCDW-00000002GDx-1TlJ;
	Thu, 05 Mar 2026 17:10:32 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 630911400206;
	Thu,  5 Mar 2026 12:10:28 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 05 Mar 2026 12:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772730628;
	 x=1772817028; bh=2YKLoA2IsMyTZEip4KGxzGcQ7ltn5puWK4jv6MRs+MY=; b=
	P8WGtwp7/r9ecL8ojq0bCFXSAb2bhnspxmBcRm5Lc6wWdrOiGSpET36q4taVtN6e
	szAQqifYwuybpDdqTagrlAusetiB8SzWuckaIxuh7M/CEw6al2vwwQpB648np4xf
	wAf/TTl0pfqq7QbFrxsX/VM7YY7iuvjiZ9YrXZcga2nzVbWCzSKkiCRrQYqo9GbU
	A08fys5olDwWaIQxZiJoVOKktDPTsj1dHQ3YdwaBzMdiznyQ4YouWR7DPnziijWw
	H3QJldkZsWDI0TS8jgt/rUgAg5s10pvMbm8l2nc2/y7o5OauQBmrnyNHgaLuwUJe
	CXtVoumyPmSs2RFKqmpV+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772730628; x=
	1772817028; bh=2YKLoA2IsMyTZEip4KGxzGcQ7ltn5puWK4jv6MRs+MY=; b=X
	4Rcymrp9oHYxlfcXIC7+z/4IIn9T6NUKsS5CxxlKyN9L8omcwKRuF6y0E0g0rNav
	0lxN/SLlffca2W0F99Djyz6Bdx2vWevbKOIDrubzZ75tDuUXMlNTQRFgm66YuO8O
	WYyeps1v+5umVNyUIbNgo/N655+kJO83BkmtlY60HcrK1kacWamKGp1IU+4cO5Os
	dziOnMYaIsajTJPg0oJjTXHYsrLDUwAlzpRmI9dvQGCLpVfKbAZspvnVcsoNwMyl
	95jJ+VNFrpA0ksgNMEBouLFiMcNcP8G4oJ2ng83EMgGvuiZRugONBupl8kPKWrkG
	Wyv3VA4dN10GIx6pvhpTg==
X-ME-Sender: <xms:A7mpaYN9pitvwkGxHyqmSyxgRER8PgRRC3rI47vIgx2K6tFj9Db73g>
    <xme:A7mpaZz2-VQApGDRdpT-u83lBiPb0o0pf4aU0H-T0M1bZX_odwHNSiyve67OBxQ3p
    tsKDN7jB2rgva5Msgr02BTzM1-R27QMNCPjPq3XvDmZAE_H1-AWwII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeileegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepheelteetueehudelgeejhefgieeigfetvefgudduledthfegjeekleeuheefteeu
    necuffhomhgrihhnpehlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghr
    tghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghtlhgvvh
    drtggrshgrnhhovhgrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhhitgho
    lhgrshdrughufhhrvghsnhgvsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnh
    hitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphht
    thhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmoh
    hrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohephhhvvghrkhhuihhlodgtihhstghosehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgv
    hhgrsgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:A7mpaZw2A0swRreIUfNUbkJ-KM0TyDHXf5aF9ETg-pzrZVQVs-ge3w>
    <xmx:A7mpaSAEZxCAXlZMphEwNfHJ7Ld-ylDRCFhl5Edpsjfmdqy__vo3Kw>
    <xmx:A7mpaSChsGG1x8lH_xhwF7G2c1V2RWemoPGaPsqLiIIDR1kTrmCwgQ>
    <xmx:A7mpad7xkfTA3dpIDyfi5NRqeUtR1Q1My_ZvpEti-YKAR3VcYo4skg>
    <xmx:BLmpaU2-yg903Rc8Bnm0rbyb3LtfMggq61VMKVlCGmH54KUoOdEqYWl1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0DBA700065; Thu,  5 Mar 2026 12:10:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AlPWkszDc-o7
Date: Thu, 05 Mar 2026 18:10:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Kees Cook" <kees@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <e907e900-073f-4aa6-b4fe-36b87e312f62@app.fastmail.com>
In-Reply-To: <1621b56864cb186f1e5433b73b56afc00aa83452.camel@collabora.com>
References: <20260305152644.791897-1-arnd@kernel.org>
 <1621b56864cb186f1e5433b73b56afc00aa83452.camel@collabora.com>
Subject: Re: [PATCH 1/2] [RESEND] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091031_332140_C306FEC3 
X-CRM114-Status: GOOD (  13.51  )
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

On Thu, Mar 5, 2026, at 17:37, Nicolas Dufresne wrote:
>
> Le jeudi 05 mars 2026 =C3=A0 16:26 +0100, Arnd Bergmann a =C3=A9crit=C2=
=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The rkvdec_pps had a large set of bitfields, all of which
>> as misaligned. This causes clang-21 and likely other versions to
>> produce absolutely awful object code and a warning about very
>> large stack usage, on targets without unaligned access:
>
> I'm a bit surprised you felt the need for resend. Perhaps you can help=
 us
> understand what made you think your patch wasn't being processed ?

I updated the second patch today after I found a corner case that
wasn't addressed by the first version. As I had sent both as a series
a month ago, and neither was in linux-next yet, it seemed more helpful
to send an updated series rather than replace only one of the two.

> My PR:
> https://patchwork.linuxtv.org/project/linux-media/patch/2074ba5a5d05e2=
39f432d176eb051105f7e692f9.camel@collabora.com/
>
> And Hans/Mauro did logistic on the #linux-maint IRC channel this morni=
ng. I
> believe I've marked all the relevant patches on patchwork our of "New"=
 state and
> you have my Rb. What else would help you ?

That's fine then, I did not mean to seem impatient. I assume
the original patches will be in linux-next then, and [v2 2/2]
will conflict. I'll let you review that one first, but can
send a rebased version if you think we should merge it on top.

      Arnd

