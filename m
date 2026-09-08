Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7E3C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mehW/CyDxkmIO3arqkZApC9ipZYWGbvNNWYPndTatYU=; b=oGKoVm+22i6mTJkrJTA71fHLZ7
	Lsj0cp1GFWzKrHENptLo0QwttE/30ZYFYmVosPBN4TQ/1aav1R1KICVcX9WDedU4xaKxSgWCKR9Wo
	xlbsMtPqKmxq9DdR37qwcWwSJwyKSpnS2x6b7rTCApgcJwE5y7wjOEDiQCRueWAn5JMu+QDGOeiaZ
	BaKP9T88E9nPW6ruI+WobWTG2e1CdCRJ3szjbRk57ugaKVQgcBdh844rg1OCauNaPpEo2iMmFTAdA
	TiNY/Bchdu42rVX/ZRu5R1cOnYcvmix8JVrXsZPyBfw23JEO3SRKoh6dleDlGwXnp6zKtDaJoy9GY
	ZeFMis8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40eH-00000009zIb-03Y9;
	Tue, 08 Sep 2026 18:34:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40eF-00000009zI9-0DCP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 18:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mehW/CyDxkmIO3arqkZApC9ipZYWGbvNNWYPndTatYU=; b=Hria6itNZqSLOttkBg7Ukrr27p
	1azD77TJZv+WqjNq2FaPQdpYsqJ4SGtTQIjvkTTyYIPaSYuwhkz+DX89uQcnzldYQhCWOWNxjYBky
	ZQOknvVktiaa/K01ceWx32j99R3yfUopOU+jAKDWeeGgMBpp32MZzs9Vf4VqhZ0zahkPX9b0y80gh
	mIUVX+0WgR5SvkuKGWKzHlikKggxEvLEchViI0Mui25nvr8c5YEVWTgVUwMGA7MPm23GmV6unHSQJ
	iOZ8bBTHWTiKESlMWPslkp5dbUkyIGq5xC9kxVH7x3A8PfU7Hxz03hBhOQg/n3WKRSTiRViDpE9ay
	1ZeZoHzQ==;
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x40eA-00000000Dpf-3olY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 18:34:22 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 462FA1300D1F;
	Tue,  8 Sep 2026 14:34:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 14:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788892448;
	 x=1788899648; bh=mehW/CyDxkmIO3arqkZApC9ipZYWGbvNNWYPndTatYU=; b=
	O8kDBEJFUQ4hnv1KhcAzt7/VLZmhjlvZ8edI/TbX9L6wqWImnH/qIuTP0F5KonfL
	fEm9ypqoiQpZNXZdyrT17Ac0Um/DowwvD7fx+ZJTFJwPSJyXfLL5l7gzF/Idymr4
	f1epRMggcMnlJq7KSiCZKpteSuyKeAFbhIb9T+x2Zr8GG976/DOjIr1cQEwabi6E
	mfQHPmaQlGCGffsknNmqUo48DrPjICNMv9IRhh72V5Vmg8/BPQxR+3XkzX+fAZzn
	MVATdcImD4H2uXRjhtOxv1MGK319Se0qL1lYqAusfl3VUcCkqOPoxtZjW/pcodwj
	x1+UoIkU5uRwM+pqUDy4RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788892448; x=
	1788899648; bh=mehW/CyDxkmIO3arqkZApC9ipZYWGbvNNWYPndTatYU=; b=n
	h51fYk2zApplolvODNqDSJGm4M066/laYwyyzuFNbYJHYmj33L68Xx7qAQFPWbG9
	OtoW56HY2PvXMTAxHGg1eZ08JwLYKkdBxzpHAKrjhsNEmt++3ZTWhz0QAT/fimgF
	/u+E9z4OyDlIVsYYr5PvIih43auCfg+qLieBiiHjToXcyIpdYR68vqzrBofQObR/
	o0zxM0tEvbHUcohNzFkNwfauajQdPwpIHVJgec69cvAdMZd4Kvv5YxVZUFkGotn/
	X+900FTmnBlSqkXdA1Iiik481dVrIeTVRqD2oht5FnSxVU1A06Xd0Kn+BkjuqpCf
	M+Ql3TBD1irt3E8kyvHPw==
X-ME-Sender: <xms:EFWgauu7GtyXgWQHujeZXC7kxuUAC_fi4FQ66bW0xH0tqluuSR9odg>
    <xme:EFWgauT4aZ6C2Yp_TEnfEXr4R2JO16aYIdaS6AKCTfr93DQiqwAyR0Kp5YNjM4nrX
    d2_w13l5PCarWY-aO1VEQHJJmhtdIGli7HZbyK9sLGynnVgu5tol-Q>
X-ME-Proxy-Cause: dmFkZTFPhVyeTYuwUsqrCzczPQ7NQS9SIU5BZcx5bS0XoavZIvkpWuRfxUE+TdQzqIZ8W3
    KgRh5EaF0ATxLS3kYVyZadsjYR3587lVpn4U6wibqTG+Z+vEyX1K6BTf23Wl2vKcZvzswW
    u896gNmqAsTDmDcBXdf+mKoJ6wtOOjaW4gf3mfRO76i5F5Fuzz0E7rvkdFBTjhtevaZfOV
    2h85LBbFVxyH/oOrwBnvcPFLPz6Ba+tOAtLnWJWDeqSBK89IvitzmWMb/bG1kty+HzE4j8
    t520Am6gozzkkQw5hKQLB5hk0heSKiwJnCqMl0Wt5slkx2lDfY55HPemu+FXy+aRnHd3c8
    EgdCB1Eo7AlOganWzCXK9NPTeR9XP2OOrta8BRxSYYW3WSbQk/LE+6tZH5AfjA5ISpc+nF
    ZBoS1kg5/CNGMB82EvzJlOWmxvZsrb+44jACuhaya3QA1nYa59bH5ivm4eam1s+O6yXT+D
    Es5aM9afF/dIB6q1FUUobemW/JB0hmtjVDggfdDSy7y8WXdqdrKiwFIaSjFeLYFXGoNsQN
    QHTddWgdmwDwzI3kyaQTZN/Ldx7dDZifv9UA8D0nNEso15LHPNQevm0ZpUqjkP6TdZ6cUE
    6WVwBkQiqWw9SVWbppCzMBNqkmqsXmGSEjFiFR4FLFX17cwUPJ6ewti7U/xA
X-ME-Proxy: <xmx:F1WgamlKMkU1kjxuFOg-_KGizDUsqst_ABIUsKjsRch3bpJytV-1Yg>
    <xmx:F1WgajiTKAGQs6gDLhlMV1v79AmLVF51M_rhNVUV5O72N6_z3z_l1A>
    <xmx:F1Wgal0RhH_jqzPU5xa8YOZ5ILjUWM9g7vCAzV0SXzjNf_OASrAq2g>
    <xmx:F1WgaoYsEeJuD_jtW46ShO3uMCgKV-lDDTZIDnboqPyRElWa9RyzVg>
    <xmx:IFWgarC94hF2G-29Xy07G5l6HzSUV8ei4nAmOV2N7J7lYRKVm4gcoHbV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D0F9232A007B; Tue,  8 Sep 2026 14:33:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArxhsfFjo9nk
Date: Tue, 08 Sep 2026 20:33:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Arnd Bergmann" <arnd@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Russell King" <linux@armlinux.org.uk>
Cc: "Drew Fustini" <fustini@kernel.org>, "Rob Herring" <robh@kernel.org>,
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
Message-Id: <173bb63a-59de-4961-a841-4a2fd0c2bcac@app.fastmail.com>
In-Reply-To: <fd157e63-e581-44b6-9e4a-962002669438@infradead.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <fd157e63-e581-44b6-9e4a-962002669438@infradead.org>
Subject: Re: [PATCH 00/13] ARM: deprecated platform removal
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_193420_007421_888A4086 
X-CRM114-Status: UNSURE (   9.29  )
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

On Tue, Sep 8, 2026, at 18:53, Randy Dunlap wrote:
>
> If netwinder is going away, can all of
> Documentation/arch/arm/nwfpe/ also go away?
>
> Or do all of these come later (in phase 2 or 3)?

nwfpe is used on all OABI platforms, not just netwinder, so
the patch to remove that comes in the next series after removing
OABI. See

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=ff375183fe225b79de700f004181405ff6a739cc

for the draft patch.

      Arnd

