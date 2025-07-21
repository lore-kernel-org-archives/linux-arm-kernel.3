Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5B2C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaRzPQ9lieFHHIwLmqX8kR4F+qmEQbM085Lcp8h5IR4=; b=JqlChRNKlpsXbEIjAyUFeiWksk
	GUUIGUQ73QOrzowbtGMrhIx5vjQhUk+ycBBqxJzqP0ScopPRZC/3bTXadh8lfOQyM5XLyJ5kaRe0t
	VEvIBOdayOKLMfUnOyv6emOUiV5EoolMiUiotoYIMTYewpEVSz9DgBvQoPqURzETiOAat+D1Y1z5J
	vS97aIwN9wA02ZcndX5y8bHdlTOj/Uye8hQkEE+7kv/HWXEX3q/keZL6qVUp4gU3hfm0D7WpXpKAw
	2jD41TscOymUb+fiYv50ZCSBpMhNpFH1XcR8/EAZ4fhbplYhTcfiQT9LTDMg2oPmTk3nIissns1Dy
	y0oVHraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxaR-00000000gMa-1ldV;
	Mon, 21 Jul 2025 20:58:15 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxXN-00000000g62-45cy;
	Mon, 21 Jul 2025 20:55:07 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2AD397A00E7;
	Mon, 21 Jul 2025 16:55:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 16:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753131304;
	 x=1753217704; bh=kaRzPQ9lieFHHIwLmqX8kR4F+qmEQbM085Lcp8h5IR4=; b=
	izbECgjGjOYONT+DfawXELRem5RC+p3g4m+yzxdMx7JF9hXiB84/nI4OhvDSZdtO
	K67SCetqIwc+CxI5tqEJJ/QAul1/NEEs528IHHlR9Am4KpHqD+vpV2ROhMJ1HYUs
	7Fb24cQPTKgXM6uBWOJ7cGrGLOAYjWiKZjJb8TBJeNGdkRTB7s3xL2WrstkyxEkP
	tbPyBFfRnmEDsv6N6/Gt5C6l3QSVxzTVLLhylCo8uoFIB/3I1Cy4KdDvOYoXDgO7
	IZtX4pZm4Ly+TB5vWjpilVsIpheYBYV1K23SHBKahc7/vxvOq8Uv9zLK514rKrCL
	/Oj5UmHHY4f565mRrCaGYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753131304; x=
	1753217704; bh=kaRzPQ9lieFHHIwLmqX8kR4F+qmEQbM085Lcp8h5IR4=; b=A
	T1QkYdF9LiaqvJ7LUIOCxS9W7GEZPohbXx5M/fW4jhr5ix8fgMOkvzDIetJZtUtF
	LNcBI08Q76u8MFjOmWAo4xxqNjlPsaHox+jXcPfPSH7hrBBGtcNlymLwTswlNmyi
	pviJ3n3wLmdZVFCBXOhzW4uF0Fq1i2Md1+GXEe0RLdIsRbhh7Ag30CKumjYGPsB1
	w7aZkJe1LraPfD/ORDWShXRqhcdYGFQGGoIRnYdzzlT3gOGDiimRiDWCFvV4DYZ+
	c2x45eZz10CYQVHe982mdsCYNG95v/6RqatRxLFyRh/0SByOI2+LwvGIO+HzoF9G
	6n2gU6BqVK8CI/o0ffL0Q==
X-ME-Sender: <xms:Jql-aHKIyCfYIeW_M0SLqZiHsNRmNHKBTmY-xKM0_t5aubMKMojcUg>
    <xme:Jql-aLKgBggWEAo4mo2J7mdipGiuxgRlqWiMir_hyfYUpwwPZtwF5aP_RZ9wpOac3
    6zmC1e4BV4aMFCoy4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejfedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehhshhh
    rghhsegrgihirgguohdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpd
    hrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtgho
    mhdprhgtphhtthhopehjrghnkhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehpgh
    grjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopegssghrvgiiihhllhhonheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Jql-aBwrL-0xdaQrQZL0o8Nc0gKjsBhI6oTcjY0nqIkfe_N_rFWf8w>
    <xmx:Jql-aNUzn2DsRN_ZlTBxhGA23zxpzi0cZpDqKbAyyTJ4ngxO7yDhMA>
    <xmx:Jql-aGplJQRgvoCqx6iRXYicup451d8DFiIRFe5eOcMrv0rhvdW7Bw>
    <xmx:Jql-aCfHLct0SZGIj7Z2ssqzGVDeGh8eWwmRUUodRAbNXsjiKFFL0A>
    <xmx:KKl-aObLttYHXdq2zf0U_OcYRqZ3LuK3U9MK8z0RCYqteycLTz1CoJg_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7A042700065; Mon, 21 Jul 2025 16:55:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T10195641ff6473d7
Date: Mon, 21 Jul 2025 22:54:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Harshit Shah" <hshah@axiado.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Jan Kotas" <jank@cadence.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Message-Id: <8783e997-8dd3-4321-8f7a-f160b0f8ad17@app.fastmail.com>
In-Reply-To: <912dd9f9-34d9-4631-82d3-02eed03a52c9@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
 <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
 <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
 <912dd9f9-34d9-4631-82d3-02eed03a52c9@axiado.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_135506_396575_9A1CD1C4 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 21, 2025, at 22:43, Harshit Shah wrote:
> On 7/21/2025 7:31 AM, Arnd Bergmann wrote:
>>> Separate patches (1) tend to work better for the first contribution
>>> from a new maintainer, since there is less to know in advance.
>>>
> Thank you very much Krzysztof and Arnd.
>
> I will submit the patches to soc@kernel.org.

Please use soc@lists.linux.dev, we are trying to phase
out the old alias (both work the same right now).

    Arnd

