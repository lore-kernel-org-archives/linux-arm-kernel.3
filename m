Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9401CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adf5EUaK9RkHLudOuAtQGVhDNlqQmKNn0miL7jFkuAA=; b=Ead9q3Fev8v6Ijlg5cTh+0vikV
	2yBIOqOvixtJlve0tIJC55IUBusnDlLx+qTZ1GlCU9PjaV9I9pVKPDCRiuRhvZnukayyomn3kqk8o
	92SmR4MWgrv4F7CDa0Xz2bTipw6P5GZmOXz7PiiZ2tzG5GDjkJe4H8Tx+aFh9keCXzFWuIQuZpBzI
	pd1DoMwHPpsgZHa4Y6Kztnhn6PjbsUvcNYfrtqgAaelRpRQR2A4HlBpJAJ1Ryy9B/PAcLu/HDuNqM
	OiWOKzTb8LqcYSOwC7rlDiFKbcGbtsbnH0IrLZyK2mS7f7i5i+VxPcBC2aLjLHq3zwRMkw6AP23pf
	FCRR7mIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2qX-00000001brX-3fQB;
	Tue, 25 Feb 2025 21:52:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2p1-00000001bbN-2GXF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFD985C5627;
	Tue, 25 Feb 2025 21:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6C0C4CEE2;
	Tue, 25 Feb 2025 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740520234;
	bh=W3VJeywcIcmgWE/Z+lGSHmVDoqC/JUGqpygA5wDbuHY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LoW+jbtLwRVL2Q1P7+fVLmM6GdfFUBJVEUnkKehTmUt1z2XdcuaSTjYdREvLmvmUJ
	 iGWbC9wx6gWWV0lyeRKhtILw7Lgax0ZIAUH4ddpbAU+BFmall0PlvOpyQi8MKITYHg
	 zeDEiGQoWY5RCi4slKzARoNTBoZfj2+m4NsNHgkHHlri+0eWOJzTmVlrTxAlKHSLtc
	 w3+Dhq8zyPINn1YI81k6cMBD7bm2f1mm/EoboXtKe/QkscNMYopqHx7XQbYoF0lIRS
	 DTMvnqe4bZbuolX2aFsFJWhkD+4h2vCVM5xLij6aVB21s9ZnaG0z0KQKSjRgK2BFuC
	 PE5Kynk/LGZGQ==
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7D29E1200043;
	Tue, 25 Feb 2025 16:50:32 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 16:50:32 -0500
X-ME-Sender: <xms:KDu-Zw2G3qhsSWBSVJ78uRbJOe-oJ1nosBRGCHdS7K7B_20SnIrtxg>
    <xme:KDu-Z7HdIPVg9uSiZpxdxNBwjkjFBRF2EmkdadCHbkQlGLOTTG_FoVOSQpz4FfNqL
    VnOUQCYP4vJ3esXaF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvg
    hlrdhorhhgqeenucggtffrrghtthgvrhhnpeejteeguefhffevgfehueetudevieeuueff
    hedvvefhjedthfdutdethefgfeekleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgu
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvke
    ejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvgdpnhgs
    pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsoh
    hgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhi
    nhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusg
    druggvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphht
    thhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpth
    htohepvggsihhgghgvrhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopehjrghmvghs
    rdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgtohhmpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghrkhhkohes
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KDu-Z47Ct7rvxX3LD-Mqpjs2oOQ8907yKjdXDV6Qjh2Vhydmn8IZLQ>
    <xmx:KDu-Z53W1Fw7f4_SgLpMtN621N_CzGDWXaLeowJEgQdY2qJ0qH1H1A>
    <xmx:KDu-ZzEzcPpKuwaQeLZixRWN1Pxa-jCDJz7d1tIzq9Q5H6SQg9mUnw>
    <xmx:KDu-Zy9u1p8MRwMsve2eD3s7aflTOjL2zv4FHqGv9vHU-exNryzX2A>
    <xmx:KDu-Z4m1PH1G87viG8Cyxm0r3f4uzOAddD0rWjYxNxWaPDQKx65kLy9t>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4CAF32220072; Tue, 25 Feb 2025 16:50:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 22:50:10 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>, "Will Deacon" <will@kernel.org>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
In-Reply-To: <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies more more
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_135035_701440_EC5746A4 
X-CRM114-Status: GOOD (  14.43  )
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

On Tue, Feb 25, 2025, at 22:40, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 22:33, Will Deacon wrote:
>> On Tue, Feb 25, 2025 at 05:42:07PM +0100, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>> 
>>> A recent change tries to fix Kconfig dependencies, but introduced
>>> two problems in the process:
>>> 
>>>  - only arm, powerpc and x86 are changed, while mips, arm64 and s390
>>>    are now broken
>>> 
>>>  - there are now configurations where the architecture enables its
>>>    own helper functions as loadable modules, but they remain silently
>>>    unused because CRYPTO_LIB_* falls back to the generic helpers
>>> 
>>> Address both by changing the logic again: the architecture functions
>>> select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA, which may be a loadable
>>> module or built-in, and this controls whether the library is
>>> also built-in.
>>> 
>>> Fixes: 04f9ccc955c7 ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
>>
>> Which tree contains this change? I can't seem to resolve the SHA locally.
>
> Sorry, that must have been an older commit ID. Today's linux-next
> contains 56b8e4bb7622 ("crypto: lib/Kconfig - Fix lib built-in failure
> when arch is modular")
>
> which is in
> git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git

After looking at the original 0day report, I think the fix for
that problem would have been

--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -94,6 +94,7 @@ config WIREGUARD
        select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
        select CRYPTO_POLY1305_MIPS if MIPS
        select CRYPTO_CHACHA_S390 if S390
+       select CRYPTO_CURVE25519_PPC64 if PPC64 && CPU_LITTLE_ENDIAN
        help
          WireGuard is a secure, fast, and easy to use replacement for IPSec
          that uses modern cryptography and clever networking tricks. It's

which makes powerpc behave the same way as the other architectures.
Ideally wireguard should not need to know about every architecture
specific algorithm that it might use though, and that requires
a different method of enabling those.

     Arnd

