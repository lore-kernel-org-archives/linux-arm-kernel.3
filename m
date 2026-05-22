Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44942CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5cjv15MjjTF6ypOnMSrJMsfRdW4W+PPYBrqMoqvt/A=; b=gpugc0gR7+b+FXT/LatXq4Y3+r
	Ej2MFDp98ksVtsqNqcfZ/TU/uwBGa3Yw5P5hufAvJGo0nv5bigf6L3cs/SKIKJMMhFk8qqhdONqwA
	2Xa8G69h1kSWz+u9tuixfP47j2AbhwYMyEsfI5//ObXeeJxKlocrfFvQw9x9Sr6mgOsjMntNkHpID
	wxGFzpq6d6iqfJyvMP0lX3m/ATYTB1cWuQpJeGYxaAyg/Vh5I62aqmXZiHBQ9OtP9Ws9LYexurgxT
	AA/FLbZkJsw1wZ277AEoFf3cXaudUomTQLFstR1JxBOy/Ny+j+9Tt9P6AlDTH07Tkt4cbyHhQHDTW
	ahRdrnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLG4-0000000ACQ1-32eP;
	Fri, 22 May 2026 08:29:28 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLG1-0000000ACPQ-2a4T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 08:29:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id A289D1300C0A;
	Fri, 22 May 2026 04:29:21 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 22 May 2026 04:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779438561;
	 x=1779445761; bh=K5cjv15MjjTF6ypOnMSrJMsfRdW4W+PPYBrqMoqvt/A=; b=
	mVwc49J1HBgWVrb4a/RQur0w8olfdgWprB68y5AQaHQKBXoXAw3WMCwEvlADbMZa
	woiU2CWyZVzvL2un+K4ZfXUVGVBgKvyaQ0waPfX2dovAGmipmnmch7wjsSyi/ggj
	ohAEcrvXX5Z0ybA87lR6nVxg8FUHxwcTSyOhBGWli/U5ZI3FFQHzJPoeA18Pj7tw
	WAaIfYhDuniH4wQYakbqBIqXipGGe7Q6iA/y8AH/jRUUp9jaJyz83OGlqauvsNRl
	rpMGWRSLrUqU7/F+jxwMoRP5CzwzEnViHkJJseLL5Q1bw4WbZj2UZdUWAHb3lRyb
	eisQnAsYJ9pqbcu6duBM7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779438561; x=
	1779445761; bh=K5cjv15MjjTF6ypOnMSrJMsfRdW4W+PPYBrqMoqvt/A=; b=E
	UpK2Ma9OrlBOcJrfk89xSalmv14z71Y742I7yR9JDliM14zAQQ2D0cod6aACcGDv
	or6qSJ5INamWzeACSQjuA5hI6ZLYdQEYo8D90K9A9ckq1h7ucOe4khbynAMoJmoU
	2jZlm1NbFEdfiEHDaHOQ9dyPCyfontUTL2xT5bKY2J3W3JULBFjZyHFEzd8Ffd/x
	r2c+GRqVhLktgnWrOX0BdRygD96QKeVSyX+h3cT02YUnqR8yUGFgvP2rhzjiicPB
	iFTzxEAz1miglA2jKtOukdD4J0Ev0bzzJWVVWN0LXq2Bzp53I6Bdp/yeUz4MI2RH
	/uj8Y5FZdiY/g20nRwOZA==
X-ME-Sender: <xms:3xMQahOCKCWvL9cv3XYQbv-EJY-5JR2Ia3Z8PelDswJneSd0az0qXQ>
    <xme:3xMQauxHL3Ysx8fPaX7uC9mP24hgJ3O2F6ot0-P89fFwGJCA-Pi66GK3iqAML5BWX
    DXESTg8zojzG3LmMWF90NYfAhSsRpPntHRCHDoS9Nqa7p6e3dONFos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepthhonhihsegrthho
    mhhiuggvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtoh
    hmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdr
    tghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpth
    htohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthho
    pehjohhnrghsrdhgohhrshhkihesghhmrghilhdrtghomhdprhgtphhtthhopehmrgiiii
    hivghsrggttghouhhnthesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:3xMQajUbzWzIk3zJRKelcJqH9lLTGk9j2eynxhQmHiq1OWCr-y2h7Q>
    <xmx:3xMQagPV0Bm4Ic_tW8YWwZ4nVopqiUkfLtl5ahxzvvDHs8X1byqK1A>
    <xmx:3xMQanj7n1H0NO7fxP9CXn6-QWSG6sJlhU37QwHWB4VHx5UbVNaABA>
    <xmx:3xMQaofwiLNKXI5cNztemqeU__Yl9-r92W2KmBm3ZqqMImvXPQDa6A>
    <xmx:4RMQahUK73IMw50Jbey2YC6mFhyLbz4f8YjWlvxlDLB-FK75_RuEeQg8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 708B7182007A; Fri, 22 May 2026 04:29:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArrYli9DFPON
Date: Fri, 22 May 2026 10:28:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matti Vaittinen" <mazziesaccount@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org,
 "Christian Lamparter" <chunkeey@googlemail.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Roger Quadros" <rogerq@kernel.org>, "Tony Lindgren" <tony@atomide.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Jonas Gorski" <jonas.gorski@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Vladimir Oltean" <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, linux-wireless@vger.kernel.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, Netdev <netdev@vger.kernel.org>
Message-Id: <681f328c-bc8a-4410-b876-f8c5f116325d@app.fastmail.com>
In-Reply-To: <b79d8ad9-f36e-4769-9dc2-58baefe23000@gmail.com>
References: <20260520183815.2510387-1-arnd@kernel.org>
 <20260520183815.2510387-3-arnd@kernel.org>
 <b79d8ad9-f36e-4769-9dc2-58baefe23000@gmail.com>
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_012926_361664_CAA3703D 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, May 22, 2026, at 06:55, Matti Vaittinen wrote:
> On 20/05/2026 21:38, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
>> passing an IRQ number instead. In order to keep this working both with
>> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
>> the gpio number if an IRQ is passed.
>> 
>
> I am (still) all fine with this, even though I like Dmitry's set. I 
> suppose you already have a plan for merging this, but I still have to 
> ask - why the MFD changes aren't in own patch? I feel it would have 
> simplified merging, backporting, reviewing and reverting if needed.

Splitting it out would break bisection: The gpio-leds change without
the mfd change causes a build failure when assigning the .gpio
field, and the reverse causes a runtime failure when .gpio=0 is
a valid line.

It would be possible to only do the gpio-led driver patch without
the header file change first. This would let us apply the last
patch in the series without regression, but it would risk having
not catching other drivers that incorrectly set the .gpio field
while CONFIG_GPIOLIB_LEGACY is disabled.

      Arnd

