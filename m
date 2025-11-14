Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAF1CDE003
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBEe7m4ruu9JlDhXEHQH8OB4d4RdZCG95qxZSNdiuTY=; b=l3Ova5bwEm58/8h4KUwUG2jne4
	6/Uy8XRpx4GeeIMME2iEBhdWDN2bjwTTFngcW23fBHSXPr1Vfu7h11E6FAaDHw+Q7bJh+3KCbSKbp
	3hwfVsw5YL3+kOOpNsJugDMr8ZetBJDDicHdZSZC8JV50qYIte8nvnKLGBZ/VsirJtvsaktUTnd8l
	wMuI7n7wPGJ38sz5Ol5VoqY2CL9us8uYIULzD8DWbZHUlEYO3iiTCfpdLw2NLIkyrrNMcn73lgzFI
	XCesn0mxRofCF3Dt0CkVDhnTOoW8s1UmC5x1aupygMGYUzQkpkYs5oQLzgkWpnZbI+IF8QmoS+hCQ
	QxDukk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkw5-0000000BW3T-3qwr;
	Fri, 14 Nov 2025 03:57:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkw3-0000000BW31-0jFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763092637;
	bh=PBEe7m4ruu9JlDhXEHQH8OB4d4RdZCG95qxZSNdiuTY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aLxhxlYHg2hEiiWKzEYXsroGVyP6tEsllRg0s94dGktPw0RofSA9ijkHG8FF/F8Dt
	 dI7hgQVrAO/cPcx5AhN6WWJwHb4wdOynv4GwtrHCxfqDMi5Fs1fRKcKBDARkSJzroS
	 FaBRKGR7hQj2aNoXKlb4bot3zw4eHiRt2ugKzPAtjxcMVeVkPdeiZqxr17xPrSmyV1
	 vvbzLcyMXTPOKtbNmUyuCqjqR1mHVkNT+Kby05srb5zpEItW2ExrTFr63MRB8nb5YS
	 NbxgVsIXvxMj3jFNrCNzd4sF/sWpsarQjuFo9kBRD+3mZJY1MLPgWzIwNWEg2Ey8Ec
	 uK19jp5cSwzUw==
Received: from [192.168.68.115] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 752DD783DF;
	Fri, 14 Nov 2025 11:57:16 +0800 (AWST)
Message-ID: <0118d17eb884ee664a035d44ddbbec56a418e353.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt: aspeed: clemente: move hdd_led to its own gpio-leds
 group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: alex.ts.wang@fii-foxconn.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Date: Fri, 14 Nov 2025 14:27:16 +1030
In-Reply-To: <20251023-leo-dts-add-shunt-resistor-v1-1-5d9980aba308@fii-foxconn.com>
References: <20251023-leo-dts-add-shunt-resistor-v1-1-5d9980aba308@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_195719_399830_2658A22C 
X-CRM114-Status: GOOD (  10.25  )
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

On Thu, 2025-10-23 at 18:26 +0800, Alex Wang via B4 Relay wrote:
> From: Alex Wang <alex.ts.wang@fii-foxconn.com>
>=20
> The gpio-leds driver requires all GPIOs in a group to be available;
> if any GPIO in the group is missing the whole group will not be
> created.
>=20

To me its behaviour appears inconsistent. Contrast:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/leds/leds-gpio.c?h=3Dv6.18-rc1#n176

with

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/leds/leds-gpio.c?h=3Dv6.18-rc1#n281

The driver should probably pick one policy or the other?

>  The hdd_led GPIO is only present after standby power is
> enabled, which can prevent other LEDs in the same group from being
> created and blocks properly setting 'bmc_ready_noled'.
>=20
> Move the 'hdd_led' node into a separate gpio-leds group so that other
> LEDs are not blocked and the 'bmc_ready_noled' flag can be set
> correctly.

How is standby power applied? What are you doing to enable the use of
hdd-leds once that occurs?

Andrew

