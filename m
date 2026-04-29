Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEDAFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmly2pB3Jdw6CU7aua3Gt1Tb8FZySUz2f9Q9kbm89gQ=; b=Ux5EzPsUQywKxfq5GTOEfhz8Rc
	vTD31/GzRNs/qWZd8JSarCnCruufvrh99ppC/xMk/0TSAi1bxqzakeE2PUELW75GWewBwxrZGoJ+H
	4JAoamMH4OWmVH50MwiBOnYibJVTsnO0loQ/8e/5HSiHockVj/QleMT0IY0UAoqFkfYpTBVuWh4rK
	ljvem9O3d/eab5yy8umcOG4EosxJv/4Eotbv9wJoYceSuqJCOGtyt3wJSiEZLWCyg+xf5Z8Xi3Vbu
	g0KNT8rj6rtKEKqxPaVZlrCkebOuCiWysU2q1byBkDiTBwQND28NfNwieiQCw2YusJVzGojIO0/xy
	16EMUIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2aB-00000003UUa-3RQh;
	Wed, 29 Apr 2026 10:55:55 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2a8-00000003UTN-0mpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 10:55:54 +0000
DKIM-Signature: a=rsa-sha256; bh=Fmly2pB3Jdw6CU7aua3Gt1Tb8FZySUz2f9Q9kbm89gQ=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1777460123; v=1; x=1777892123;
 b=IE9hT5cjZEmIwG9IIdx+fcVqsAG5vT54+uzxwHiRxM0qxsFe8xvtdB5JsLOmQepxxwoCxtyb
 TM2YyAJJZ5UbMb5FtR5kcijOJLoblavspW1N+ZG7G3wkE5/DFWnrVyZmY0EoM2BBwceSKRh4Z4p
 vIzF+E6YexybCwcyabYmLNTEok0LHtxFh2l8fepePWj0RpUmB+J6ChmiJy5/EqCOhfhw6xb1qN3
 lP0CZiGLNO7QX/PTkLwUk9NVmRsPAgFAg5zHLuPRuOBi4mdC55z9zzj2ca/aoZvXzF6L1q0uuvF
 GxJEdCqfwVXGEGS7eiMO2CPd07ZakUhWpFIOe9f/L6ySA==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 740817af; Wed, 29 Apr 2026 12:55:23 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 12:55:23 +0200
Message-Id: <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
Cc: "Johannes Berg" <johannes@sipsolutions.net>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Duje_Mihanovi=C4=87?=
 <duje@dujemihanovic.xyz>, "Andrew Lunn" <andrew@lunn.ch>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>, "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Frank Li" <Frank.Li@nxp.com>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Jeff Chen" <jeff.chen_1@nxp.com>, "Peng Fan" <peng.fan@nxp.com>,
 <david@ixit.cz>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
To: "Brian Norris" <briannorris@chromium.org>, "Francesco Dolcini"
 <francesco@dolcini.it>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
In-Reply-To: <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_035552_680003_35023B07 
X-CRM114-Status: GOOD (  13.59  )
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

Hello,

Francesco Dolcini, 2025-11-28T18:05:37+01:00:
> Hello Karel,
>
> On Thu, Nov 27, 2025 at 04:29:12PM +0100, Karel Balej wrote:
>> To reiterate, the firmware is generally available but is not part of
>> linux-firmware and the entire process of upstreaming the chipset support=
 is
>> stuck on that.
>
> I'll try to see if any of my contact in NXP Wi-Fi group is able to help. =
Give
> me a few days.

so I was in a long conversation over the past months with Jeff from NXP
who was very helpful and tried to arrange for the upstreaming of the
firmware. Unfortunately however, his efforts were ultimately rejected by
the internal management.

We were directed to try to reach out to NXP via the customer support
page which yielded nothing. The current situation is thus the same as a
few months ago, summarized in my quote above.

Brian, what are the options here now? Would it be possible to make an
exception and accept the patches without the firmware being in
linux-firmware? This is an old device with no mainstream audience so I
expect everyone who will want to use it will be able to supply the
firmware themselves and it would be great to not have to keep the
patches in a fork, especially when trying to build on top of them
further (such as to fix the driver-firmware incompatibilities discussed
in one of the patches of this series).

Francesco, would you perhaps still be able to help in any way?

Thank you, kind regards,
K. B.

