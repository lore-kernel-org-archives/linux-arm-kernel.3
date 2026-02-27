Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3CFFD530D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=TF79/4VZxe5r/0DCiojpWx3/SW
	1Cih3Rh99rdX/QOFus4dUwUVwwZtPiuit9TVpzKL3eaADwthfWXIUskJL8j3wCSomPitE8jKqtCJ/
	C5dL9gjTkvYKZ+jCfexhwco/hNpTuLnNm8voz4vrhhtrLxJyizGeJRH3X2b6JHJbTKZ342bEhiGS3
	7mTJWGzLthL84qXM83TGGz81esbY1nxL8KQglITHiKtnZuV/MQSvJ14Jwyryd1W2NDZm+fsRcTfWk
	SYNywsVGJe4+sPUZ62GP809s293i7DMv+aAXTT/8XA65X8lVCFWXkA7SDxDvGteL7NVseqrRq4OSj
	PmOjkWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtgc-000000082Zc-1DLz;
	Fri, 27 Feb 2026 08:59:02 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtgY-000000082Yo-3udm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:59:00 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AAFD61D00127;
	Fri, 27 Feb 2026 03:58:56 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182736;
	 x=1772269136; bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=
	B7eMZx4hKVMLP4/fUiBh5TwyL0/COXRDHA3c32Ydsu5eXpS7xYjIi80vE2HFdW3u
	dytOj2XUHXBdqdO7IwWHRAZmOzKKfdUqltsNHWshkKpVc5IhR0mXW7TXMuAz3CP3
	iz0rm/K+wZmyU3dNxo/SCg8l5pskcKRR2B58cinrX8AI6OE5KInXOancwZjGpjDW
	b5vxVDZs9Gv04y6d4/Dl7KYbPv1Q42h0OYKJqQxBlvc1syWIsd/fad3vyr2HNCob
	Sw63Ja2x4rfLahhkp8QVi7W6JaDgm2u8n2DJVn0zhjCOaiUjmD7PReXWSLUgS743
	Etjjz/VSUL8uTZ430bDGPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182736; x=
	1772269136; bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=W
	JzCKqPGj+ok5fdimIrdSvoG0b2rhDbFbxg+Z4oV6TBEWwTbmv7GJpVuaJ10WAqhb
	a3orhxuqeIogyQbj+bR/3KK1iPsv0AlMfWsuo54nZnM8fNcXNLFAwa4b969gaqU+
	EI7GCT6TXi3Frms37bg7jozgJCHJOkDaajfuoUbLMW9+qJSybjnv+qlYXW3dAbgs
	SBLBMj9/QVwsTv0Xws/GSeZi0XB50dN8V67LhpCQ5bgSE7GnVKCzgJ1K8UUxOH/J
	23SCTtoUuKenXzJOTIjZ4ZCYrEhH+SRCWXn3BEfNecm2SSvMH9D95xKdd7Dm0rx0
	Sja6fef77et3Z2hHGr42Q==
X-ME-Sender: <xms:0FyhaQrK2tHArSP0tjf6QtNa4PmQw11xpvTel2O84eAuXPW41C7Tgw>
    <xme:0FyhaRfWc7T5yfllWxtssXaS-uATvEDw1YPopV76YXZBxmpw_oh0Pjg5cgfMppFGR
    jr--RmHJ-gCaZ_64RHyEukfkNFYJvYI1kfdQ86lzN--SxpWxLIULTAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:0FyhaQr1uk4-oN-CjkdyXVpeCTOgFy2L34CbK9ea3nr5SOtFxcj3hA>
    <xmx:0FyhabhEShFKEkqU8z1w5P_Qk6OAfURF76oXBGYYX4nEu5yxa8I_YQ>
    <xmx:0FyhaSyjKFiFOn0MP6LM4SXCmeLmyfnKiew9Y5uoziXjb-xyU5UX8A>
    <xmx:0FyhaZ_RGa3TuNh5CDrfbBzUxxwVNHibdt9uXrhzeqhL9toSU289Pg>
    <xmx:0FyhaR098kJ6FLglrpM-x-UirrOo6DBbRUiUGfGAseQHx1zY4r1LSwgC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E039700065; Fri, 27 Feb 2026 03:58:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Fri, 27 Feb 2026 09:58:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
In-Reply-To: <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_005859_012293_93360D2C 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Feb 27, 2026, at 09:51, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
>> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
>> provide any 32-bit time related functionality. This is the intended
>> effect of the kconfig option and also the fallback system calls would
>> also not be implemented.
>>
>> Currently the kconfig option does not affect the gettimeofday() sysca=
ll,
>> so also keep that in the vDSO.
>>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Actually, I need to revise that. I think gettimeofday() should be
guarded by CONFIG_COMPAT_32BIT_TIME for both the syscall and the
vdso. Looking back at the history, I see that we added the #ifdef
for each syscall we modified to have both time32 and time64 version.

The thing about gettimeofday() and time() is that they don't have
a 64-bit version and libc implementations are expected to call
clock_gettime() instead. The result was that there was never a
patch to turn the off either.

     Arnd

