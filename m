Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8274FFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMqhKORl3YQEQXWUYIIr0KBlxSy/mAbm6jt7rtGV0CA=; b=QzkeTyCWpHEhbPpqaoah7Gc+hj
	CR4bjWsYtp6oB2opSBmVIM8U4jJh9zVe3kpZwFraCZa2G/EuHCMtYp5QKOCTiroy9vldRi645Qw+8
	69pBcQEMg+aTE7xqPs/JMwnk2JsdZqhIdV8FO9aMgpA3FL1pok5zxbM0R1FFMxVoL1Oi7FaEPDqBo
	ydAZtAbnyxWBiU9K7650+uxdO02TtGl6jm2HFYJavjINkEg7IzwIboM6nl9acmjvwdhQ7WAA9M4bM
	XncqM5ERAQKnEuhSfJEZ/DtQjT5rr8THGHED8nsJGlHb810cSTz4PCrcpC35k5IkyZaeQDTFzHvTF
	vCT3VjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOd-00000001PfT-2Dmx;
	Tue, 28 Apr 2026 12:18:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOb-00000001Pek-02ru
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F5B440DFF;
	Tue, 28 Apr 2026 12:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EB6C2BCB3;
	Tue, 28 Apr 2026 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777378712;
	bh=GeqJqgST61g8OZ+fogX7D5CEU6hK/KqNPJ7A/LOYCoY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LYF9DMXyjPku5RHvarWGr/REtS4xBQNefGlQ/j1sTcQJwuMSU3HPFBPyK+DCZjyMR
	 xnW9XQIP2RAYOEZvWBHRdjS7xT/HPOjc+VKOqyLWSHCNgGSVjCQ6dV044/95qZQm6+
	 NKNzBSgusgdjSnPbaxKvQmKpbIppjUrNeQueHjdv9fpT456yaoQXmoMwHbWEAsmF8/
	 XUUZwnCK1ZkqrsWUKU1+h7nAztyLkuNXDGuPcI6rOqVpCiUmAnI5NA/35SZc71lV1Z
	 oEX21fwdECZ36l8eXUqjayZl9HCRfVFPnG0wtnrLLNbEe/pzvGf8c7F4LtqAslzlqY
	 I6WM/iJ7+U7lg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DEA55F4006B;
	Tue, 28 Apr 2026 08:18:30 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 28 Apr 2026 08:18:30 -0400
X-ME-Sender: <xms:lqXwaSbP0vC6GR3KCy2oubmXUGXw_ve2JCD_3OMHBbiIT9_4DSoqbQ>
    <xme:lqXwaQMrdbaxIYzyGSgibPPJjP3olDl0RrdxeMKLlVMG9eWULFAAF4S0XsvkmBDmM
    Tdpubvp9F6oSEnE5EVrK4XO0j-V-fLdWYwHf1EL6eILJcwPjjGI1BWy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudehgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:lqXwaSr54cDzuYtuwHKHuU-PebcJUz0HACAiQrqjh-mzFygSXUe9wA>
    <xmx:lqXwadBSq4VnzGGoCl_PJcOle4BXqKPdOytrAM6PNatO4qcbPgZHKg>
    <xmx:lqXwabqz1NAXxWa66z2EVrWErWOmh2QoKK35-Xa-nK51RVlGoLu36g>
    <xmx:lqXwaQC3toacqj6VJNpIIS-JXQTbGuxE7MNjVvpLHNesQXNPYSiiDg>
    <xmx:lqXwaeWK_OSeVfJtXxnMfpg3nobskTqaPV_5YGRzFO8v3pK44chGu7ES>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B060A700065; Tue, 28 Apr 2026 08:18:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 14:18:10 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Bill Cox" <waywardgeek@gmail.com>
Cc: "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Linus Walleij" <linusw@kernel.org>, stable@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <fdc71111-dc61-4393-9740-12b86c880f05@app.fastmail.com>
In-Reply-To: <25ntssyy6t5uwxlwfpmrpzpcq6xv62l643hflf26hxi6lv5wqu@6vub6ysczjvd>
References: <20260428101430.514838-3-thorsten.blum@linux.dev>
 <25ntssyy6t5uwxlwfpmrpzpcq6xv62l643hflf26hxi6lv5wqu@6vub6ysczjvd>
Subject: Re: [PATCH v2] crypto: atmel-sha204a - drop hwrng quality reduction for
 ATSHA204A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_051833_089700_44EB33FA 
X-CRM114-Status: GOOD (  22.77  )
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

Hi Marek,

On Tue, 28 Apr 2026, at 13:18, Marek Beh=C3=BAn wrote:
> Adding Bill Cox (waywardgeek) to the conversation.
>
> In the meantime Nack from me on this patch.
>
> From the original messages by Bill, it seems to me the part he was rev=
iewing
> was the ATSHA204A.
>

According to Landon Cox, the Atmel engineer, the hashlet has a ATSHA204 =
not
ATSHA204A ([2] in the original post)

> In subsequent reply [1] Bill states
>
>   While there is some evidence, there is still no convincing proof tha=
t there
>   is an entropy source in this device at all.  There is some evidence =
that
>   Atmel has inserted a back-door.  My advice is to avoid this line of =
parts
>   from Atmel for cryptographic use.
>
> In another message Peter Gutmann asks about ATECC108 [2] and Bill repl=
ies [3]
>
>   This part uses the same language to describe the random number gener=
ator.
>   It is "high quality".  I think that's pretty funny.
>   I would be interested in seeing if the new part can generate random =
numbers
>   continuously, or if it fails after it's EEPROM wears out like their =
other
>   parts.  The use of an EEPROM seed is for PWN-ing your RNG, not makin=
g it
>   more secure.
>
> IMO the comments from the actual reviewer are more relevant than those=
 of the
> engineer working for the company which was accused of creating low qua=
lity
> / backdoored TRNG, at least until the Atmel engineer provides some eva=
luation
> code for the device (which they suggested they might do [4], but never=
 did as
> far as I can find).
>
> Maybe we can instead change the ATECC quality to something like 32? Do=
es that
> even make sense?
>

So Bill recommends against using the ATSHA204 based on his hands-on expe=
rience,
and extrapolates this to ATSHA204A/ATECC/etc based on the fact that the =
wording
in the data sheet description looks similar.

OTOH, the Atmel engineer claiming to have been involved in constructing =
these
parts acknowledges the ATSHA204 issue, and claims that the other parts a=
re not
affected in the same way.

I don't think we should be using the quality field as a reflection of our
assessment whether this engineer is lying or speaking the truth, or the
likelihood that the RNG is backdoored. It is a quality metric not a trus=
t metric.

So if the RNG is flawed and does not produce perfect entropy, we should =
set
the quality value to reflect this. If the device is compromised, it shou=
ld
be avoided entirely, and what the driver does is irrelevant.

IOW, let the user decide - if they choose to use the device, don't cripp=
le
it based on our skepticism alone.





