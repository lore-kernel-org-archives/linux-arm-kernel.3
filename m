Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31AC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r4vdkbDofK8rt9bMGcF41mARvsonWC380bc7dX3e90=; b=HFMkMiFlksX2sz4SUozW5gFIAA
	dAkGr6M09pv3LLyDGsI8H/EbH9XSLZJEl78q/Bduho3xn+LRBuBl5A3caCUHZhzITAeXxSk9Qyr1h
	zy4fTdyB5mZZb0DdOqLKMOZ1Yn7lX8M5AQdMSxFJZy02UbFA3CzPeVd+br+AanY49+g8nWY1jgl4i
	oGTNLNl0k7eSTcHnO/t8JFV94Ixxyc4axA/m0Mq6UIPVFJ2PtAnZncL3y0QEmLZPC4wCyQ0wdvbch
	tXwsQo813CZVirkmpDc6GYiok18gYQ4gwOY95YpLxeBtxKMBQCVgnSvsSsD6WrzEAF6c7FaxCNcCE
	IpILYBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40jh-00000009zZq-2yiq;
	Tue, 08 Sep 2026 18:40:01 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40jc-00000009zZM-22bT;
	Tue, 08 Sep 2026 18:39:56 +0000
Message-ID: <0fdd2490-b076-4722-85e0-55c25fc21a6d@infradead.org>
Date: Tue, 8 Sep 2026 11:39:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ARM: deprecated platform removal
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-OMAP <linux-omap@vger.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <fd157e63-e581-44b6-9e4a-962002669438@infradead.org>
 <173bb63a-59de-4961-a841-4a2fd0c2bcac@app.fastmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <173bb63a-59de-4961-a841-4a2fd0c2bcac@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/8/26 11:33 AM, Arnd Bergmann wrote:
> On Tue, Sep 8, 2026, at 18:53, Randy Dunlap wrote:
>>
>> If netwinder is going away, can all of
>> Documentation/arch/arm/nwfpe/ also go away?
>>
>> Or do all of these come later (in phase 2 or 3)?
> 
> nwfpe is used on all OABI platforms, not just netwinder, so
> the patch to remove that comes in the next series after removing
> OABI. See
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=ff375183fe225b79de700f004181405ff6a739cc
> 
> for the draft patch.

Got it. Thanks.

-- 
~Randy


