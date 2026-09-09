Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B448CC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwk+UvMmOOejItPrHExIYRYfS6weoy0GKqdtweJZ4dQ=; b=m/m62ZQvOZ2MaAJg1Js7INDh4e
	YoCMtxcleErh7Bfe7sW9Tr/DIuubOgv7VRCY0o3axzh+vSOdZ/+l0Yg8UUEFkFvjM4BqNAk0LqqNe
	Z7oR/gabn6PKgySYkSTAA1kQZ7UWJtU7R9/AdTmC9rueLY83/UXgQnVGn6tZCtn19mMgTLMuj4yp6
	yoIfdRYb5h5nqlvvgxDCPR1yyS+lxOgon84B1Ha0XNJ8RAf+66aDsG2UYWKDmOManhHoqOTzygznc
	cztHzwcvZDk7T8uBisEygVAH4ptOz16sb3GybAiGeFSLhjCoWph6ToVAerDQNi55+h3UJRZWFeUTa
	qPqB8rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dfj-0000000B60C-2z6d;
	Wed, 09 Sep 2026 08:28:47 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dfg-0000000B5za-04wV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1788942522; bh=vfmBXnNeJ1NpJUYwZFwgJkc9eQg51DMt/p2K4/oDTL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qqEpXggU4ubFz3BdyK7idq/XNCa9aAcHQqo7lhT76xOJNC7ccNJhvHdErYC6cfABu
	 Jdb1nrLOCxV3O4Cz1gxNl7W1wzgGhZksuon3cL2G0AhvEKS+OIB1HQFKW/XZSDs5Lh
	 hHq+bQ2PC7Bm2dhOcnzz2PpL8W9VCnQKBioGu+dVhXmDC9AddP8NhmyLrmwjXldIQp
	 GH6i2ZzRIonII5i5Bmc/xNm9XGVIoeqgHT5iDc1QaklfxXtQVv0kkzLrvU7YTQvnSQ
	 +zArK/yKsOUzbQNUl/oudEqwUl9lvsL5NhDs7DtF+TH0tCa3gU0qYKbxv6aClPKfzw
	 OzKhYbo0+5vMA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id ED4BF8702D;
	Wed,  9 Sep 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1788942521; bh=vfmBXnNeJ1NpJUYwZFwgJkc9eQg51DMt/p2K4/oDTL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQbPuJHCUF/s9EUzhJLEsR+4+s06seWE3oYsgcMgjs7C7Cg4K89e/aTL512M8/9JL
	 Ld2oHt8S6ReEbbZdT9EVFhCrYvZloID0MBZWZZMAp5JCKuF2X2YkJIrzYb5B3GYJyg
	 cjm0WpR+pOaRQtL6arz9uUdgVnRNlxdp1lM2L/233opCRL4UxR2lA/HJfAnGGQ4ytv
	 uQjfhU57uJyGaNcKikBKBtP0+I3/4antgAEVE1rRSB9s2PWYMAagDPnit2c7H0Cm/e
	 KgVxSAum7CmJwrBQ8JU8KM05k/gnNxZNUyvTWXrS6l2EGD+UD8Iy+v61GRa0/ReVaV
	 HkNxXw1xvOxeg==
Message-ID: <96ef0d36-51b2-4efe-9f6f-5e4ce6d6046d@mleia.com>
Date: Wed, 9 Sep 2026 11:28:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] ARM: lpc18xx: remove entire platform
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-10-arnd@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260908152808.3928630-10-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260909_082842_007818_F2240E9C 
X-CRM114-Status: GOOD (  15.50  )
ln: failed to access 'reaver_cache/texts/20260909_082842_007818_F2240E9C': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082842_007818_F2240E9C 
X-CRM114-Status: GOOD (  13.66  )
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

On 9/8/26 18:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The NXP LPC18xx and LPC43xx microcontrollers are the more modern
> version of the classic LPC32xx line, but they lack memory management
> units.
> 
> These microcontrollers all remain in production as of 2026, but
> there are no known users running Linux on them.
> 
> The platform was marked deprecated in the 7.3-LTS release, which
> will remain supported for a few more years.
> 
> Remove support for both LPC18xx and LPC43xx.
> 
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: imx@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Since there is no known users of these pretty old NOMMU platforms in
the Linux kernel, it should be safe to drop them from maintenance.

-- 
Best wishes,
Vladimir

