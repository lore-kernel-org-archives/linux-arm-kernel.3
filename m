Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32B4FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfgcXIInCPQxg83Ely+lCYsyKSEsGZlard+xYL4BOww=; b=LZJg+dD/nVakLiSv0P++bQC/4c
	d1DxxMosMC/xmoaSG7kZC5IDsSlwFbBZ0H7K2D8Clb7Amzpaez2pZFtP8nztTa3/xvjd2IZuzt4Dt
	3lfsi+FvO7x92xUUH1Kjym4XZ/CtJElbaJR4yfxqbhekJpN1zEDP7O60TGQhNPHH4+Yy7gwLNPaEN
	vDa947F8HSTXh7BwvL7PyxtB1uF8qPAb70wk0gdmmrQINmqcVrwhy5AJP7jmfFSvQN5Nswl9g+UJI
	8uOmVY6bxYLRnf9B5wovwda3Vpcj7E87PKlR3KrFo0u7DSA6MP9TDlUy+XentTtJL/PvVz2pQojAN
	TG4obVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlKQ-00000001wiF-1Q7B;
	Tue, 28 Apr 2026 16:30:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlKO-00000001whL-0UiN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8012043F5B;
	Tue, 28 Apr 2026 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56B1C4AF09;
	Tue, 28 Apr 2026 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777393827;
	bh=cT6jmt4+OY628kY0x9v/6nF8hRaDQ4Au465ssIAxw3M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=F3y9O+aEV2liAUh8duVwf15f7eF2F7pQp7XgzYRYG96dv2YDyXrG1XjtmGJT8NxKj
	 ljx/29VNG6peiMYMKakDMz56w06QEZx3SSD6eR9/solDSIE88YU1nTAvu6QCK/JOeu
	 6G0pGEi+dj9KwqClqwldkEPa5sXfeEMqeRAenqw6s2HXZGV81kyBnuIR+myppq1ygA
	 8Xhv4zYF61zqC1rUiwriPLlwVNBz6aGT4hHW16pxiqzX3M5Hb6BDewTOC31xp9rp8V
	 WX/hsyovH//iLhPL0puhEK0cYKCRy60F70fL1Q6ZOi8tCzE3KUyTA99PQpusOIsHzt
	 F9toxrhrm+LfQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id F2CB6F4007A;
	Tue, 28 Apr 2026 12:30:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 28 Apr 2026 12:30:26 -0400
X-ME-Sender: <xms:oeDwaZ_SIJWZCzMsXdEmnR6abvrpCGjZom6lLJmF3sDs5t33kzZC7w>
    <xme:oeDwaYhbV-QQbXUq9fxYdbDt5PO8bPgkARgkG4d_cai1QoysW-Lbl5DqnFOoqMiTF
    4AE3F5nxHxQS6OHyEBhcWIkASLfpnls7n6SGRWypjo3ErgRYHzSM0qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepueetieduieegkeejvdehudeiheettefgtdeugffhjefghfeftdelhedvheff
    hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtg
    hpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopeifrgih
    figrrhgughgvvghksehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvrhgsvghrthesgh
    honhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehkrggsvghlsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgt
    ohhm
X-ME-Proxy: <xmx:oeDwaZPggO74vB7wrQLF7speBYdfnd01gSe0p9olcABtb2uEr4k_lg>
    <xmx:oeDwaYUwCBmRcyWxV06AW7L3pdaiAHk9hyDqPrYUrET4Ays-lW8Qng>
    <xmx:oeDwacu3a1eHN6kzIEqhZTlEyREx2gFMMKD8GANLaBETYjhfi-r-2w>
    <xmx:oeDwaT24VgAv82RcB8cX59TaC7YV83tddMfnlXMuGkno2m7_PmX1lg>
    <xmx:oeDwad7fdXlfgR-kjIXQ9T6ds72LMlqq0snGUjuV0caTSefqdkAvQAcq>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D56D4700065; Tue, 28 Apr 2026 12:30:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 18:30:05 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Thorsten Blum" <thorsten.blum@linux.dev>
Cc: "Bill Cox" <waywardgeek@gmail.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Linus Walleij" <linusw@kernel.org>, stable@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <e4091e56-0230-48fb-bd31-e617c32b6348@app.fastmail.com>
In-Reply-To: <cbk4ho3bpprjxvcywv4sudbmb2fhfsgaguoywv5mhtoql4vhd6@f7oisxcrvii4>
References: <20260428101430.514838-3-thorsten.blum@linux.dev>
 <25ntssyy6t5uwxlwfpmrpzpcq6xv62l643hflf26hxi6lv5wqu@6vub6ysczjvd>
 <afCo9PbDpTYeqGd4@linux.dev>
 <cbk4ho3bpprjxvcywv4sudbmb2fhfsgaguoywv5mhtoql4vhd6@f7oisxcrvii4>
Subject: Re: [PATCH v2] crypto: atmel-sha204a - drop hwrng quality reduction for
 ATSHA204A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_093028_209103_3D4A9C83 
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


On Tue, 28 Apr 2026, at 15:24, Marek Beh=C3=BAn wrote:
> Hi Thorsten,
>
> Bill also wrote about ATSHA204A [1]
>
>   My best guess as to what's going on here is that the device has a
>   ring-oscillator based entropy source, but that it generates only a f=
ew bits
>   of entropy for each use.  It seems to be called before generating ea=
ch
>   32-byte "random" value, which is why the second set of 32-bit values=
 have
>   more possible values, and the 3rd has even more.  However, the numbe=
r of
>   unique values in the final column of 32*N byte values is always equa=
l to
>   the number of unique values of the entire string of bytes.
>
> If this is true that the device generates <256 true random bits and th=
en
> mixes in non-volatile pseudorandom number generator to produce 256 bit=
s,
> then the quality should not be set to full 1024.
>

This post is about the Hashlet, which has a ATSHA204 not ATSHA204A.



