Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78605CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 06:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q39DiklZvSpNFdVrcrO1V6lBShlkhniXqdocnefU7Hw=; b=owqkuQ0OXa2eVOj1/tg+bZoapv
	0bd85aNKQZWGoXgAuxkrIXTVD9O1rGgVEl4eytlMa6zyEg0SILsOtTq8kJR4ZOfw95wJvN8qyN0oy
	IRh7x5RVUXoKzZDEOR2ADCqnYwwrUGHeIXpLtTBsd10/ciYa/MzZxU6pVwgGHMJrEGB0gGUu3roR6
	ZqGzH1VVKJN/DwXFDoNa6pZL+wLqlqPMz725zmCjLI6n8ZjSs/P1luJ7TIEB5UY6j2yNcIQcOfDyz
	C21y0f9CVzEhWeMkcluseROIkFY8s6FIJeSAWSF00DF8bGaVx6h+z68kEl/X/cizk5oXQYAczNafF
	CgMCocMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxE2-00000006s2E-2rtf;
	Thu, 21 May 2026 06:49:46 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxDv-00000006ryC-1T2N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 06:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=q39DiklZvSpNFdVrcrO1V6lBShlkhniXqdocnefU7Hw=; t=1779346179;
	x=1779950979; b=J+LmNXXI3be3Q36fIaq8vIyAuHRmiaXOkOJryEjqpGhN14jApWp8n7abQJUVQ
	vcCvR0S9uqeAItufPglXbdyJ7fweByD3cakkHOoVrDI2TgI78QgU4Lxtm5+l0E5KxIp3bnGJMWn3l
	2C4fMdEZEpL+7bzQaAhLvD1NiQZJzbPmVMw/Els+xf5fGgVxjkoEJepp1P3rv3rNIWL8ie/ebRSxO
	sJAVcPp8eW3okWCsgnqcNxFzhF8INaeHrHSgB1MmY/h8pv1RDgOegb67D7/cYMtANaO2hkt6tUx2m
	ViCWsQ5Gnv115vZyVGI0GoCRi3G9briyHkwk+RmuOY0/iHgXNA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wPxDK-00000002vgw-3F6M; Thu, 21 May 2026 08:49:02 +0200
Received: from p5b13a134.dip0.t-ipconnect.de ([91.19.161.52] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wPxDK-00000000p6R-1lXr; Thu, 21 May 2026 08:49:02 +0200
Message-ID: <8f918549adce2bbb68fdf3754793b3305f994c23.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 04/10] [v2] sh: select legacy gpiolib interface
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Christian
 Lamparter <chunkeey@googlemail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Aaro Koskinen	 <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman	 <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren	 <tony@atomide.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Dmitry Torokhov	
 <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek	
 <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski
 <jonas.gorski@gmail.com>, Andrew Lunn	 <andrew@lunn.ch>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller"	 <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, 	linux-wireless@vger.kernel.org,
 linux-omap@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, 	linux-sh@vger.kernel.org,
 linux-input@vger.kernel.org, 	linux-leds@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 21 May 2026 08:49:00 +0200
In-Reply-To: <20260520183815.2510387-5-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
	 <20260520183815.2510387-5-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.161.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_234939_669245_668B53E4 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Arnd,

On Wed, 2026-05-20 at 20:38 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Many board files on sh reference the legacy gpiolib interfaces that
> are becoming optional. To ensure the boards can keep building, select
> CONFIG_GPIOLIB_LEGACY on each of the boards that have one of the
> hardcoded calls.
>=20
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: no changes. Adrian said he'll pick it up for 7.2, but so
>     far the patch is not in linux-next yet, so I'm including it
>     for completeness here.

Sorry, I hadn't gotten around to pick the changes for v7.2 yet. I can
pick it up this weekend as I was planning to review and merge some
patches this weekend.

I have received quite a lot of patches for SH recently, so it will take
some time to dig myself through the queue.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

