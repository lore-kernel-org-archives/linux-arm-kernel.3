Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B9DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSXL9VavN96hCcGl7o2PD1XEiCklnDkRNAAJzvQiyrI=; b=WlQfYWCwFd/mS6aDxvf90nXMUk
	O5fvc3rIJThzY2s7DdD7yw1PMVWwzeV1nNmb03bf82sH8FxP6yfqtOPhpOqaJoQt/G/vKOeIrnzVb
	GaaIvwrxyLZTEudxUQGwEQUt7/+URQppjMkoZhK8fm3CfEuuQVFTUYd8/pJ+jSGbF7+pV7uYJdvvC
	ApqBDZ0n/iQ2P5YeQNcWSpH4PSQjXxdS2W01vT+7LRo/gr5eHjj8hyDQ93qCHpmaCWsDb02BZPC9O
	DGF1FBbgiCmtPVvu3k9i/O1eMkbZVpz0r4ctbgWVgCy85cVg8JBEyMRG5VpLx0WOM8bQLWVLnmonX
	z9nay+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirjF-0000000EGKp-0pTD;
	Fri, 14 Feb 2025 09:11:21 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirhA-0000000EFhb-1VfK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:09:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 621C54330A;
	Fri, 14 Feb 2025 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739524145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSXL9VavN96hCcGl7o2PD1XEiCklnDkRNAAJzvQiyrI=;
	b=lTG7WkdZpod3DrN3h495gm9vyE38azAW/vRQVzjl+Q92cWbImYHQY3tgqxcpJpej2hLqyo
	WRpIZzWPFqRW9bBHGn8d8IvEnTuoppZsBMwrOI/PIfcvorI3nF+FslZltEH2NAk300hYf5
	03g8j4swULodty03nQtJCZTuhK/LIgyuQWPK/Cmw6zmBBCbfApYTHU5lc11n3Q7i/BPbtr
	TQS98JIX6qY7hySr0cJNzgMEgJ5Gd2cKBVs6OiWb40yBYH7TGVlTNoeZzfHAVQ7weg17OS
	E/1/zHhF+8tY7Y5anLz0kuva054ygWSEF1CkrysOddwTxvuD2oKcRUffNYmR1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 10:09:01 +0100
Message-Id: <D7S1UERD0S47.12JDXAO96967F@bootlin.com>
Subject: Re: [PATCH v2 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
In-Reply-To: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegledvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdehtdetteehfefgjeelieelvdeiveeludffjeegueefudejueeffeejfeevgedunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_010912_536896_2ADDD334 
X-CRM114-Status: UNSURE (   5.77  )
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

Hi,

On Mon Jan 27, 2025 at 4:30 PM CET, Antonin Godard wrote:
> Add support for the i.MX6UL Variscite SoM (VAR-SOM-6UL) and the
> Variscite Concerto Carrier Board.

Have you got any updates for this series?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

