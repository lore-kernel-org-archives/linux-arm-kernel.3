Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B86CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMVSTaPR9L/WFtxis++Ox75v2kZpFalNbRfgyF70oy4=; b=XTYdpxA5Kh9hfeIdEsYhWs0K0R
	hxVTyVKgJUi9CxTFzFGhJpHUhrEXkBM4CggN8Oayb8bhKtsAbKTLiRsnEVviXVCjMk64jECjPhQVQ
	pOXO1ffCpsYhSJeZXguTmKoh8wR5A0pVFgI2VpqivOrhMP2wbwgredGGvNTWBLTwfWcI4QRQd9eyi
	2k5n228ljiHjqDQHJjW+0jHb0NWlUVRn1brmpVBwb9oHrR5of0swhJ6VOqKpsyyFSfEwKxSSoostY
	auRG5RZo2nAG3CZWCvL6G91JS1TX6VwW78ix8UC4A7sCm99oFSnt7U5qjypO/s9NJn7JedMuUMrh8
	yBBOjttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43PH-0000000AJqf-3c5E;
	Tue, 08 Sep 2026 21:31:12 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43PD-0000000AJq1-2JJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 21:31:06 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 64AB41300D5B;
	Tue,  8 Sep 2026 17:30:57 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 17:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788903056;
	 x=1788910256; bh=pMVSTaPR9L/WFtxis++Ox75v2kZpFalNbRfgyF70oy4=; b=
	S7d4uN+znfHu6WTJ6HPX6e4nBmBcyYjv5uUK1npmjc3P6JeDoJGP8AXrMLdRp2U8
	pn1lQZz8uvTyolSH2e4N4gvmvX9esuqKDwkPRpBMr0y+zEr+/3kbSNXlBUyJFHWe
	bGaHWA81Hk6NymexHRjoiEqrCF1XOukct3KhLRxahmWAg9kJy/DjCAZgQYgMag7e
	Cu73m9DEkyPlBXD6p1BRiJ8C6OstTjytBRN+K8Cq4rBaVZZxU2sDBmCERKzFzgoD
	7Wb2oodIpYSeNQePLI8m2AGDAZYHGQfQDT9o8b/7I/+yQztplHdmoSxHa0pDkVo+
	Oqx61RET0YNB3UhaSlJmxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788903056; x=
	1788910256; bh=pMVSTaPR9L/WFtxis++Ox75v2kZpFalNbRfgyF70oy4=; b=I
	O8hwZL7tDuEGMrnFZIkGGO0vtVu6wdU0x8QAhuctjYgas9kDutFamb6irRcpTjc6
	KuyOhcpQkzoaPfGWgCiOhv/PlPIThFeT104ZlVtK2aV0prHzIyh35xu5QJAy8Ztm
	FmZcvlSLeXNDfn6lRm0TOPvWLMMHTuUBJpRE9DR9Zo3jlJeoUI1wDwj25Nrc5GlA
	JZZCe+YxNX+I13q12FvWlGb7uSa/+3fOwAL54T51nfL9ilb+tmw4EsmvbKOc7I80
	24ZRxnoKizNA+542ufQQPKvQej3tIeemsfA0mhD67D3Lnjzq4hw+tWiXGUoDjHXW
	wq3R+yfkacGu9/9SziSng==
X-ME-Sender: <xms:gX6gat-21Fq6SnPAmAe4HmOM5pz3nTturGx5V8pH6tN20OG11ldpIA>
    <xme:gX6gasgKAZz7ua4iY204lbRZFwp08a2OOdX02_B3-yIQB1fSlcWxX_aUBYZ7l2LM4
    aJOdIsk1r8TnfiHop4K_-QCXLG2e-djWGmceBrFAd_vIwbhHLGtTJU>
X-ME-Proxy-Cause: dmFkZTFb1JFJrJnD2uLKxZIyhU8m4ESpn2SxKKmvMpu8Uo4Z3dmO2lTyQu8o2TvVpNIc6S
    UmlE9ILRLjAHujRHYufhylJnXWMyYyNFhp1mlbzh3h52AT8Ri+kYBTl4BI0ym5TzhWZJMh
    mc7tmRQgKV73iqDpX+IGD7qspRpyhjHL8726DWe454TtTgJ/0dbV1CWuBEv8xQFhmGdjse
    77yZsJdWgUTc3NYUR2lyibJarVj3y3syDmP7UKGIhRx39ap4O4yWmh+lSc7ieG4tO5/gCE
    qy9hiAfm7I7cbcax+xjwIsLPhNCtFOjQEGP2SfXDPy6+qeW+XoCXL+CTVvfmUhi2rGe2k+
    So3TCZsRR8J+tE80pDuP8maN4NUN196hbJ84SBUR2Jjl24vRymAp7D0IgaIp+CiV/uT7UJ
    eGb5uWSyf12hPRK3j4dSAmm13/QFUT8ufJKN2KXcVWq3KYf8co0uAkWjNOOzcNPX1v3wqe
    jJy9KoVPMt4n3baJbFqEx/h82KAVG5ufQfw0VE5WN//dDEUBJ0sa7plGwg1YAaRiFAqxWN
    wJgNc4Xbq3B1pRchsLnQ8xK7A0vHcvbdrk7xLekCENiVZ45AaUzZXEoSYrICrQ3Kb7VLvj
    M/lbF31JAmj1YnWBp6Jsj7PPOUJKpJmWxXSoELcwbmSc1pyulxWwXIIcGwyQ
X-ME-Proxy: <xmx:h36gapzWvFXLmxtxFJucUNmu9cLGfklhb1f77AE8Kk15oQY9SWCLkA>
    <xmx:h36gam4TvWbz2VBzVzcGKqJw-g1LzHNec1aou5xxH_-68dxmNM2LWw>
    <xmx:h36gao7f1ELMyOpSFMq5B8cMyml_r_jqtWppZU0y1GgadSztwa0T9w>
    <xmx:h36gavLWQaeQ2DeaTUci_gGKx5VWlcREC6-gBJ9GyLEOMm1ixsrP4A>
    <xmx:kH6gajjihI0SooZtexQcDlvgEnLJ0Y-SJR5iTzej9oDSDQA_nwjtia-y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2816F32A0078; Tue,  8 Sep 2026 17:30:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ab0V4S-ixU_F
Date: Tue, 08 Sep 2026 23:30:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Drew Fustini" <fustini@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Stefan Agner" <stefan@agner.ch>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Roger Quadros" <rogerq@kernel.org>, "Tony Lindgren" <tony@atomide.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Karl Mehltretter" <kmehltretter@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Nicolas Pitre" <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-OMAP <linux-omap@vger.kernel.org>
Message-Id: <7608c487-390e-4526-a2ac-11f073c902c2@app.fastmail.com>
In-Reply-To: <20260908210947.GA519272-robh@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
 <20260908210947.GA519272-robh@kernel.org>
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_143104_423433_AE242E04 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, Sep 8, 2026, at 23:09, Rob Herring wrote:
>
> Do you want to drop all the samv7 platform compatibles from at91.yaml? 
> Are there non-Linux users using DT?

I see that zephyr uses DT here, but it uses an incompatible
set of bindings, see
https://github.com/zephyrproject-rtos/zephyr/tree/main/dts/arm/atmel

I'm dropping the references from the binding now, and also from
Documentation/arch/arm/microchip.rst, which I had missed earlier.

      Arnd

diff --git a/Documentation/arch/arm/microchip.rst b/Documentation/arch/arm/microchip.rst
index e721d855f2c9..b776a6656717 100644
--- a/Documentation/arch/arm/microchip.rst
+++ b/Documentation/arch/arm/microchip.rst
@@ -157,45 +157,6 @@ the Microchip website: http://www.microchip.com.
 
           Coming soon
 
-    * ARM Cortex-M7 MCUs
-      - sams70 family
-
-        - sams70j19
-        - sams70j20
-        - sams70j21
-        - sams70n19
-        - sams70n20
-        - sams70n21
-        - sams70q19
-        - sams70q20
-        - sams70q21
-
-      - samv70 family
-
-        - samv70j19
-        - samv70j20
-        - samv70n19
-        - samv70n20
-        - samv70q19
-        - samv70q20
-
-      - samv71 family
-
-        - samv71j19
-        - samv71j20
-        - samv71j21
-        - samv71n19
-        - samv71n20
-        - samv71n21
-        - samv71q19
-        - samv71q20
-        - samv71q21
-
-          * Datasheet
-
-          http://ww1.microchip.com/downloads/en/DeviceDoc/SAM-E70-S70-V70-V71-Family-Data-Sheet-DS60001527D.pdf
-
-
 Linux kernel information
 ------------------------
 Linux kernel mach directory: arch/arm/mach-at91
diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index bf161e0950ea..d9b32a95b136 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -258,45 +258,6 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
-      - items:
-          - enum:
-              - atmel,sams70j19
-              - atmel,sams70j20
-              - atmel,sams70j21
-              - atmel,sams70n19
-              - atmel,sams70n20
-              - atmel,sams70n21
-              - atmel,sams70q19
-              - atmel,sams70q20
-              - atmel,sams70q21
-          - const: atmel,sams70
-          - const: atmel,samv7
-
-      - items:
-          - enum:
-              - atmel,samv70j19
-              - atmel,samv70j20
-              - atmel,samv70n19
-              - atmel,samv70n20
-              - atmel,samv70q19
-              - atmel,samv70q20
-          - const: atmel,samv70
-          - const: atmel,samv7
-
-      - items:
-          - enum:
-              - atmel,samv71j19
-              - atmel,samv71j20
-              - atmel,samv71j21
-              - atmel,samv71n19
-              - atmel,samv71n20
-              - atmel,samv71n21
-              - atmel,samv71q19
-              - atmel,samv71q20
-              - atmel,samv71q21
-          - const: atmel,samv71
-          - const: atmel,samv7
-
 additionalProperties: true
 
 ...

