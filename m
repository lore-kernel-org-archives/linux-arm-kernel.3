Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A21DC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arYgjoTvtYvhRB29W6paCuPe7hqmom9kFaLIHBHqv2A=; b=4wGKUO+fOtVyMYQ8HfcAqH/myH
	Iq72wHjogdTsdhYnopazli5PtY1FA/VrQfLf3pu2TvK8Jt3LuEj2v9mLYudNvzB87cbXHbcPTker3
	I3mX1Sl66DdiUqvDaXDIBIpI00tRPpnxi9Zu4I11OzxRFwuN6ZvLkRfLUR8U6klrDI6hMzt8S/U/P
	Ywf06CJ697Ls5vDhs7oPPDQjYpDWxtPkejzZbRXIpo0Kbo1vUZB8Z8f53yluIW5LIF8SYg8Jl+cVq
	WP8mAooUYAZP6T1nnKoWZ04FPQuxUc6SJMkMrtInv0mYyTv48HSZOlc38A73TupQTqv23YKlGYIfD
	pe7NUIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x83Sw-0000000GenG-2I1Q;
	Sat, 19 Sep 2026 22:23:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x83Su-0000000Gemj-1hWR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 22:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=arYgjoTvtYvhRB29W6paCuPe7hqmom9kFaLIHBHqv2A=; b=JO7uCzMxsydPkVLkbgcnKZFjMj
	XAJHq1dQXW2QiII1JYziYfM5VVRJ3GEkKavpHODazyctZrruCe47AeCAOSRkwArylp+dQIZYtN0nb
	lNLJKIDwSkUg4ysOjyV+IWhPJVBYosObU9eu7rwgiFQS4Avla6qugnhavyXloTI1WwJw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x83Sg-0064Ku-7H; Sun, 20 Sep 2026 00:23:10 +0200
Date: Sun, 20 Sep 2026 00:23:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Message-ID: <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_152324_447168_AB352B16 
X-CRM114-Status: GOOD (  14.24  )
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

> The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
> to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> seconds after a reset before it can be used, much longer than the driver
> waits, so the probe would time out.

The obvious question is, why is your 88E6193X special?

I've seen issues when there is an EEPROM attached and it has a lot of
content to setup the switch. But that goes against using DSA, where
you want Linux to control the switch, not a fixed configuration.

> +&cp0_i2c0 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	/* Drives the port speed LEDs, which are not described yet */
> +	gpio@20 {

Which port?

> +&cp0_i2c1 {
> +	/* SFP EEPROM (0x50/0x51) */

The addresses are not that simple. When a copper module is inserted,
other addresses are used. The SFP driver assumes it has access to all
addresses on the bus.


  Andrew

