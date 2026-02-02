Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EB1E7DEFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFuW6+SYNh7gkCorL0UhMyQbcABqAcuxQVYw4LykYQU=; b=L9HMIS1Aq7AAbjT6thhE8jsS/5
	ORgmf/z4I5SemkF0BHSBXPXPzl+10OhRh6yRoU3SQWZrPgsY0v/6R0I2fqU9LNPNAEvorOzv/6puH
	5jI2xI7xskdFVuUSHnYuJh3S9V6js7pM0t5M4pHcVbCWsJigSiPITVo7F4z9rSbQeNumMd/537coy
	yCTKYIJyoSjbWODeAA/7o75YDOqyjPT9EviAgz1C5R8UuqRdq8clCEfsYMUr9ufZHTfm5Q9LcmGjm
	HUiR44pL/T4GHB19AXGB95Bj2fLJXecTv71jtwFTYGRVp9nWNalrpT8d5HpEfiOAOY4HjxoCXvKiV
	nhXb5oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwKv-00000005FRF-0JSu;
	Mon, 02 Feb 2026 15:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwKt-00000005FQ3-0g66;
	Mon, 02 Feb 2026 15:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CFuW6+SYNh7gkCorL0UhMyQbcABqAcuxQVYw4LykYQU=; b=MI45/1NJi5RFjkT562cU961Rdl
	4XFkoTk48KHt3plWSsvkgMz/7yMVLskBdb9AMv+QlFg5OHbXbX1ZWpJVIOQHV1JfqhfvVvGoCWLZO
	K0diZlxOgAVZrATfjVvJRUIWlqqiyIA4V0642g6jSgoyI4GHA+WTEiWBpU0+u5SaGwpUH7ySZh/h2
	eZriloiH9TSoLHIiRLB4Db64ZbNa74moX1LfaTVGIGMoGvj0Gl7pbz8EQwcv4mpOFdcLCxl1Jy/ca
	bgQMK0RJfDw74eChkqMJ0FtZCuQbL+VngDHwQtUo8BsWRHF6N1F/tGU1XS6s+It5BhwYkpHqcort/
	ZYzxA1gg==;
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwKo-0000000EmL2-3cSB;
	Mon, 02 Feb 2026 15:59:33 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7E5457A0068;
	Mon,  2 Feb 2026 10:59:27 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770047967;
	 x=1770134367; bh=CFuW6+SYNh7gkCorL0UhMyQbcABqAcuxQVYw4LykYQU=; b=
	orEsDRtU1gDGHSbdC5hdMI8RLoa1hDSnwJ594ntuXcpHjbfSFbvTWWiGYsP7SOW2
	1xJFklUbN9F1reQLTNpRX8WVvy5EOSIqatqlsZ0jbs6TDMB1P7gbwy3+GU7ZSgCH
	bwGcaCDcoChT8wVHuDBBF+RnqKFguVHScgKzuyEgsuAZ3jUfqeTAX366/q85JdoO
	od0CvrJBgLy1TRsBk2Ez2i7csMmBE6iVpiSjeNJvDh7jhleLSpLZxYNnGnfzqvnJ
	KsAdu3NdMoDCYbGaaR23nno1dxDEnaKzbclTuqO5bPKxh5bgtZOM36omeYQLAsfa
	A0cwDZaVYyZSVIWb4lMecg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770047967; x=
	1770134367; bh=CFuW6+SYNh7gkCorL0UhMyQbcABqAcuxQVYw4LykYQU=; b=U
	m6RrgXROEiISQIivZw8LODtYS7lSVOO4jz/w5k2cgunNYxvrORvxkfVX1/Pa9pwV
	DDGtEkDuiT6IY3BnprS0TZcSMHwYl1TCml59W1vwNc16zJxgx+yIjpElQ2qIBNhM
	tmrT3wnQ6Wi0ERg75mY8cWP7YxD4lNlcnDxMWfxk5B6Sp398xPpyqWkYWbBvqPuF
	eg4V8xm7iqhbtjuyD7XUNybNynv+hKXV60sff0Rgw2uVIjtUIMnOMvLT6+4Nw4QE
	zRFuxMgW5V0Czz7f7uER7YrXgWHoaNvxjNFNtOsrt3hKMM96YMFL6WL6ip855KZi
	6YtsjV94hz8TCjkrrzikw==
X-ME-Sender: <xms:3smAaVsA-DXhM0iN7KEj0HUttcdIp49754Nlk3PB_jXz83lQ6uCXnQ>
    <xme:3smAaZS8XOQmdYSdzrV7ZvToN3NJfONYprIUhw_P4aMKOlu2JS3YADOO-k3hyE594
    bvdcVtQpsStjb4R2bu1VQ-o8slAtHRkGLteyJ1xWpHrVLBxqIEbmsid>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeguvghtlhgvvhdrtggrshgrnhhovhgrsegtohhllhgrsghorhgrrd
    gtohhmpdhrtghpthhtohepnhhitgholhgrshdrughufhhrvghsnhgvsegtohhllhgrsgho
    rhgrrdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlh
    esghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtth
    hopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlodgt
    ihhstghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:38mAadPIQbkXVjhXUP6FVvG4qEX1nPzoObNfxbzLSyO6ZtoP8qn6hQ>
    <xmx:38mAacTddcWAcNjiYKqE7C8scRY_xtifCm_6kW6212CPazmRqIFmtA>
    <xmx:38mAad4mExsk0iZ-3UNId6lpI-EVjYRdfv0Uyu8ViW3b2XNE0I7qng>
    <xmx:38mAaW2__12zEA63PN0Lk2eLwD0b3oEdC95Tm2xhB1dXNEHSbwJ-tA>
    <xmx:38mAaV4weXH7dTtfTqrQZdBXEgbLv2B6P6WsCwSk36Z0IwmLu_jeYjcJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DE73E700065; Mon,  2 Feb 2026 10:59:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ad03WE3-YZeR
Date: Mon, 02 Feb 2026 16:59:05 +0100
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
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
In-Reply-To: <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
 <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
 <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
 <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_155931_670064_7A23405D 
X-CRM114-Status: GOOD (  24.83  )
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

On Mon, Feb 2, 2026, at 16:12, Nicolas Dufresne wrote:
> Le lundi 02 f=C3=A9vrier 2026 =C3=A0 15:09 +0100, Arnd Bergmann a =C3=A9=
crit=C2=A0:
>> On Mon, Feb 2, 2026, at 14:42, Nicolas Dufresne wrote:

>> Right, this randconfig build likely got closer to the warning
>> limit because of the inherent overhead in KASAN, but the problem
>> with the unaligned bitfields was something that I could later
>> reproduce without KASAN, on ARMv5 and MIPS32r2.
>>=20
>> This is something we should fix in clang.
>
> All fair comments. I plan to take this into fixes (no changes needed),=
 hopefully
> for rc-2.
>
> Performance wise, this code is to replace read/mask/write into hardware
> registers which was significantly slower for this amount of registers =
(~200
> 32bit integers) and this type of IP (its not sram). This is run once p=
er frame.
> In practice, if we hand code the read/mask/write, the performance shou=
ld
> eventually converge to using bitfield and letting the compiler do this=
 masking,
> I was being optimistic on how the compiler would behave. If performanc=
e of that
> is truly a problem, we can always just prepare the ram register ahead =
of the
> operation queue (instead of doing it in the executor).

I think there are multiple things going on here, some of which are
more relevant than others:

 - The problem I'm addressing with my patch is purely a clang issue
   for CPU architectures with high register pressure when assembling
   the structure in memory. As a first-order approximation, you can
   see the lines in the output being 12.000 with clang, but only
   600 with gcc in the godbolt.org output. The gcc version isn't that
   great either, but it is orders of magnitude fewer instructions.

-  MMIO reads are clearly a performance killer, so assembling the
   structure in memory and using memcpy_toio() to access the
   registers as you appear to  be doing is the right idea.

 - using bitfields for hardware structures is non-portable. In
   particular, the order of the fields within a word depends on
   byteorder (CONFIG_CPU_BIG_ENDIAN), and the alignment depends
   on the architecture, e.g. 'struct { u32 a:16: u32 b: 32; u32 c:16};
   has the second member cross a u32 boundary, which leads to
   padding between a and b, as well as after c on some architectures
   but not others. I would always recommend splitting up bitfields
   on word boundaries and adding explicit padding where necessary.

 - Since most of the fields are exactly 6 bits offset from a word
   boundary, you can try assembling all the  *_field_order_cnt*
   fields in an array first that has all the bits in the correct
   order, but then shift the entire array six bits.

      Arnd

