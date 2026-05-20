Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACADCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0t78VNT3MDuLej6QDJZbgndGGVnTNJPx4/DHHRVrdJ4=; b=aUuPK9z+cU/BB9EuXRuT7Tvfqi
	ENuPwdIxnKGAsXUqRT7V8zMZSlls2ahE8e92iosZ0KwWS0Xk8Gk2KHukYIUQA8VPImP337FcuktZK
	Vm2j0GAjsGwcEwSEbaTyuc8ORxBr8jL9wMfgsoCa/ypeyadQ4kVWDucRflDGU2hrkR1QKau2P87r8
	7M9UK0Vy69VbS5jOc/euP7zLY7x8kNu9IHpQgtssTWC4chgu1YEqWmxuK4Vc13R7KtimrTHGI/t7P
	Ncbju5gSREu+MsxQFQv1KYCkvL6ScGj6vaSDerwrG/q9/p3i1KAECMX11veett0RYsUKhBe34ySej
	xsv9ZWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoe8-00000005rkx-0eVc;
	Wed, 20 May 2026 21:40:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoe6-00000005rjW-00fP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=0t78VNT3MDuLej6QDJZbgndGGVnTNJPx4/DHHRVrdJ4=;
	t=1779313205; x=1780522805; b=BNiFiRUCk7/0K1fyMVqxcSNul9/ugSxxAoViSdDY4vVqoV4
	R0MXYLAdfr8RsU1adbw+pADHpzYFxm1tGNkQ8JiyRpOnm4w9BhL6QxzhpcYZHa3nucpN4SteAF+fd
	5GZIO5zo7VhQUbiq/RgMvW3Tc1qNQELp/Kvfer75p6mU54KL/z8JRij0cHu1zUAa0fW0T0h0WKfzv
	luPsNGk2F8jhwFXLcNDVDPeKxihiXCr37T6CeFUpoI7Epus+WuqO21F7I2S5EO+4YXi/K7mmcIAYy
	ZJ0pJ8wWS/8LbGVKNT7Z0LWijllck6k0/JxbYAw+PxgT5yNiR1G0RKNKt87srXfg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wPode-0000000AvjQ-04At;
	Wed, 20 May 2026 23:39:38 +0200
Message-ID: <01692b53456bfaa98778f3f1ab2a906bc25bad04.camel@sipsolutions.net>
Subject: Re: [PATCH 09/10] [v6 omap] ARM: dts: omap2: add stlc4560
 spi-wireless node
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Christian
 Lamparter <chunkeey@googlemail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade	 <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros	 <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Thomas Bogendoerfer	 <tsbogend@alpha.franken.de>, John
 Paul Adrian Glaubitz	 <glaubitz@physik.fu-berlin.de>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar	 <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen	 <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,  Linus Walleij <linusw@kernel.org>,
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
 netdev@vger.kernel.org, Krzysztof Kozlowski	 <krzk@kernel.org>
Date: Wed, 20 May 2026 23:39:36 +0200
In-Reply-To: <20260520183815.2510387-10-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
	 <20260520183815.2510387-10-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_144006_071707_A50E82AB 
X-CRM114-Status: UNSURE (   8.76  )
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

On Wed, 2026-05-20 at 20:38 +0200, Arnd Bergmann wrote:
>=20
> v1 through v5: adaptations that correspond to the binding updates

FWIW, I had just applied v5 of these three patches today, but didn't
send out a pull request yet. I'll do that tomorrow morning.

johannes

