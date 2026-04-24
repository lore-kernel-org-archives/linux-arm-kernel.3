Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3C8FE51EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDlP8y8oJfAzwiriWyNXaxF8PNjiFivBJXX2WXCxPWQ=; b=gwqzIYAJ2WsVv1UUDKQuFehdYk
	WPpzf9PJNBJMBYibfJR9/tJm4J5W3PF7d0rqg0wWL2mrXDluBpFc9aIx8uvcwlirqx+fG10zBGWxb
	N65zGP8ZkkXpCewdML8xEd2tQoUC/vspuJeRfYu2Q+XsRtgxbaAhRYj7ZTKHpIYDSzVX3wLIewX5t
	p5HlPVBHp0PTxMcCpryEhhUjaLIUktpCBKVymURlgY1ngHZDinOgDRWo+R108iBJPaJR4zHrx2UIB
	wJto7asnacJREhGdnJS61EBoaDb8OpyDBUt2HUaUYfozO9tlLGjYcrOR4IekIJ/fxVmFd5yiL7cjv
	9xeE7T1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCJN-0000000CtxE-1qma;
	Fri, 24 Apr 2026 08:54:57 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCJK-0000000CtwF-1VD2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:54:55 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 66AC47A0129;
	Fri, 24 Apr 2026 04:54:52 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 24 Apr 2026 04:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777020892;
	 x=1777107292; bh=hDlP8y8oJfAzwiriWyNXaxF8PNjiFivBJXX2WXCxPWQ=; b=
	Vxhoj+jDQThNaBN3A0wYJrBZQVfAvaeIBhrBatMkWC2/kkNDZ7eVboZribHL84Gk
	Z2II62yW3Z154p5LcRS/EBPk6XYqESbvuxjTAE/JRGg2chHaWsou4YXt5gwd9akH
	rg6g3+TE2uTRoKAbK7nP6YUj/Vb1B5Zru0tD7AWsrYcYN9jxjun7aui9T0pM9oO+
	m4+67c4kKp8WAwmxoBJFJGvdhX+OF2tWKLeUfnXydOvJRvzbUPXJoXwLnUawtUrL
	1ioe+Qq4H0cj8el4wvuck7AVBVIEWzDfJaTYgtFyxZ2Q/TiGpdMHjscJH+GBjI8L
	GYkZftPgpcDVtrXn/A5W/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777020892; x=
	1777107292; bh=hDlP8y8oJfAzwiriWyNXaxF8PNjiFivBJXX2WXCxPWQ=; b=u
	cGkRF3dtcivkq7R/h1UtsQ3V0Rd3zT5GxWqVEt5taeGENmTcXVAnDIo56Ss/A1Mt
	svvOzZ8pPoMS4G00FDbRtXQEGvN5PNG9R+2DF/WIkCmORfsCxKtiG5AXDzeytdIS
	i9qTgkHBFSRsaH1A+xB9lfEgVCufshADpXNnYE1vcAoxpZG0UpGntE1dRmKfWiMx
	fpgTYFp9uUhepRfScqD6TqS2KBL96oRLiylytKMSXj/aADu6vROTAT/trTZqlEhS
	/KV6uenyD5sWM8Qm9ObV/Fmqj2KsfoniWs8QOj6GksYlOI737av/jjuu/269x7i8
	L/hlKKwdmYFUVoFJWSXrQ==
X-ME-Sender: <xms:2y_raRexXU55OfgzDqZmFJV1vD2xyDg3RucKZLkm9J_JWf3CZD7rzA>
    <xme:2y_raaDkwZkbg-xZglrjzJ-G4gY5RkomaWh6CQXornCtGwrJtoJDLnvalOZ6uguxH
    tvO3BfeKxXQN4SfBH1R5vSBNJPmv2p-wFwccHMCmvKUQo15SIxmwZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeileeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghp
    thhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhushhtihhn
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2y_raTg-oLq7z23uFnT5LQ8pf2PQAxekJTje9QHXbtbBzrhHWGQ5fA>
    <xmx:2y_raea3M60xVRBvsZG6KSm_KKZBupGnMZ8oOrGOYwaRinxEos785g>
    <xmx:2y_rafGpsa3rbSAeUpGn0L6bd-FS74ff7OLTFz9cgYW-pTQ87ANG8g>
    <xmx:2y_raTZ42_tE0JvdJpKYMgNPgJGxqfnwKLSVzb3ORsbfXhpGx8LCfw>
    <xmx:3C_raXpkK6XsJJv4ahSNjJaaJcp19Z3-bcksbi1eu__DcapeCDOv1EOd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5F1AA700069; Fri, 24 Apr 2026 04:54:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Agn-P3jpxnXN
Date: Fri, 24 Apr 2026 10:54:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Russell King" <linux@armlinux.org.uk>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Message-Id: <30b96e0d-f296-4c31-8701-a15c568ebffc@app.fastmail.com>
In-Reply-To: <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-8-ace038e63515@gmail.com>
 <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] ARM: defconfig: Add a zx29 defconfig file
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_015454_744273_8A5B7BD0 
X-CRM114-Status: GOOD (  21.36  )
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

On Fri, Apr 24, 2026, at 09:13, Linus Walleij wrote:
> On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
> <stefandoesinger@gmail.com> wrote:
>
>> This enables existing drivers that already are (UART) or will be (USB,
>> GPIO) necessary to operate this board even if they aren't declared in
>> the DTS yet.
>>
>> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>
> *I* personally (as SoC maintainer) think that having a few more defcon=
figs
> is fine, even helpful.
>
> But I would defer this to the more senior SoC maintainers because I th=
ink
> their stance is something like:
>
> - We have multi_v7_defconfig for compile testing
>
> - We know that binary gets way to big for your system: it's for build
>   testing and perhaps booting in QEMU or systems with many MB of
>   RAM, not for actually running it on products.
>
> - You are encouraged to keep your own defconfig out-of-tree.

Right, we clearly need to do something better than what we are with
the general defconfigs, as I'm sure many of the existing ones are
never actually used for booting a machine, and are horribly out of
date with the Kconfig options.

I wouldn't object to adding another defconfig for a new (or revived)
soc family, but I don't want to have more per-board ones.
Overall, we have about 70 defconfigs and 55 soc families that have their
own mach-* directory (plus a few without code), and the number of
defconfigs alone makes it hard to keep them up to date.=20

> However I even challenged this myself by adding a defconfig for memory
> constrained Broadcoms a while back (NACKed/ignored ;) so if it was all
> up to me I would merge this.

I don't even remember that discussion ;-)

One idea might be to have a tiny base defconfig, plus platform
specific fragments that add drivers. The problem is agreeing
what bits are essential enough to still get enabled in the
tiny config.

       Arnd

