Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D89C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxfHukaWNxcBEp0pmc++HuJ+JqVKCOkG3+1+3ES2XS0=; b=tJH1GT/OCjdq95PD6Pzbv9zbmD
	LVoD5dLmG/MuGctms28zujxPKswPsmH5I1yLddeH5VYA4ASmGlxveKp+JqZrjnltBCZwsc7qtPipS
	i0mSKp+wvO9VdPK7dhKbrU82dlSuhZBOuUIlEybujqlODX6sDxibmX53+CY1qY+bP0BGySsRC7HeJ
	E03ajceg0lvY+zPPmUaYd09fHDfHE0KRC2SZgZhBXdyPgNqqpsoXZuwpZghKa0omnT5z3HEkpyvaX
	97SENgFEArCfhVdJ/kutUeJqveekWaP53FZGWs6UPsWStEKHcON7EFp4PZ6tlj6jbnQ+VFODKkjFv
	XNElyOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3z7D-00000009kFT-3Nwx;
	Tue, 08 Sep 2026 16:56:11 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3z7A-00000009kEt-0dmC;
	Tue, 08 Sep 2026 16:56:08 +0000
Message-ID: <3b9c6799-0b74-41d0-8421-acfb3487b910@infradead.org>
Date: Tue, 8 Sep 2026 09:56:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ARM: deprecated platform removal
From: Randy Dunlap <rdunlap@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
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
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
 <fd157e63-e581-44b6-9e4a-962002669438@infradead.org>
Content-Language: en-US
In-Reply-To: <fd157e63-e581-44b6-9e4a-962002669438@infradead.org>
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



On 9/8/26 9:53 AM, Randy Dunlap wrote:
> 
> 
> On 9/8/26 8:27 AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> In the 7.3 kernel, I marked a number of platforms and features as
>> deprecated, with the plan to keep these around for the LTS kernel, but
>> remove them in 7.4, see [1].
>>
>> Cleaning out the deprecated platform code has turned into a larger effort
>> than I expected, currently standing at 300 patches, with a lot of them
>> still in need of being split up into smaller ones, see [2] for a current
>> snapshot.
>>
>> The first series here removes just the bits in arch/arm/mach-*/, plus
>> the portions that directly depend on the removed Kconfig symbols where
>> these are trivial to remove.
>>
>> The parts that are not included are those that remove architectural
>> features and device drivers that become unused after this part. Some of
>> those may also make their way into 7.4, but at this point I would target
>> 7.5 for most of them, to keep the dependencies simple.
>>
>> This also gives everyone a chance to voice their objections in case
>> that some of the removed platform code does have active users after all,
>> before all the corresponding drivers are gone.
>>
>>      Arnd
>>
>> Links:
>> [1] https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3
>>
>> Arnd Bergmann (13):
>>   ARM: remove sa1100 platform
>>   ARM: remove footbridge
>>   ARM: remove riscpc
>>   ARM: remove legacy pxa board files
>>   ARM: orion/dove/mv78xx0: remove all board files
>>   ARM: omap2: remove omap24xx support
>>   ARM: imx: remove i.MX31 SoC support
>>   ARM: imx: remove nommu support
>>   ARM: lpc18xx: remove entire platform
>>   ARM: stm32: remove stm32f4/f7/h7 MCU support
>>   ARM: versatile: remove mps2 support
>>   ARM: at91: remove samv7 support
>>   ARM: axxia: remove entire platform
>>
>>  Documentation/arch/arm/index.rst              |    1 -
>>  Documentation/arch/arm/netwinder.rst          |   85 -
> 
> I don't see netwinder.rst in any of the single patches.
> Should it be in one of them?
> 
> 
> [snip]
> 
>>  arch/arm/configs/netwinder_defconfig          |   88 -
> 
> Same for netwinder_defconfig.
> 
> If netwinder is going away, can all of
> Documentation/arch/arm/nwfpe/ also go away?
> 
> Or do all of these come later (in phase 2 or 3)?

gag. I hadn't received patch 02/13 yet. Didn't realize that. :(

Only the nwfpe/ question remains.

-- 
~Randy


