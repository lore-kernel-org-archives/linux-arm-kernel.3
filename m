Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9E2D59F44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIyVM6E2jjnCI4e64mE50nhFMC8YY4mZA0yBwdNNHOc=; b=H+tEN0dVLd88nvg2ybDos6bmzv
	NbxA08B1GjwhMeU836CBI0LFoaxKk4iJ3/sbfIb8JgTSzX0NWB3rH8fKEsADNaAl4dUWIFSOk1L5Q
	noz3i/yoke0wGbVVL/PwHJDaKBSwJyWYxK5wowGlu7pbJKYfRhniA2rgn7cO0cyKM9f2UJx3g4f/W
	M+Au2iD1xu2X9REJEAc562JmoKGNv7xzJnZXwpUfNPK7mDiZicApqVER8PFqOOsiYOk1DB9FwiXPB
	nM1wz/MQFBfr4YY5+CNXey+r6amDgqRhBZGRt3mWSu/VHc3+AENPUHE94MLAol6Z7GXOQGbcmVywS
	9Pfe4aiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBsg-00000001BXT-1mzo;
	Fri, 12 Dec 2025 22:44:58 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBsc-00000001BWr-28vY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:44:56 +0000
DKIM-Signature: a=rsa-sha256; bh=OIyVM6E2jjnCI4e64mE50nhFMC8YY4mZA0yBwdNNHOc=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1765579474; v=1; x=1766011474;
 b=WbJJCdHMhCtEBqknfMmY9TjyDu897IeEWZqEGa/stAH3HmI5/tfv0itmwSExzYNagE4GNg1U
 ZxUlNxN9Yii8R2LnBm0frkGyj/FOJNLlapSmBlLlvOuFJgq7U+iioQ+xYJIZ6hsm//6m2fJLI3T
 0Am7Kwixs/rDWXPgM6pOSqBBsGWcTqSv2f4AcYIwOztzuPJ/D6ccc0BCci05j2bHyWRshz1wGQY
 NaWUVl4mYnzjUmWzSF0eUgPXoHu6we5QxAcAO6B+TZcsFTnx+d+aLkp9DS3ntJEwntr3tGrxfMY
 mQ1l8nPzPkVlFs81ZzO7cizmtHGPueIKENEIJMi8929Rg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 8bfa23d1; Fri, 12 Dec 2025 23:44:34 +0100
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Brian Norris <briannorris@chromium.org>, Karel Balej <balejk@matfyz.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 4/4] arm64: dts: samsung,coreprimevelte: add
 wifi node
Date: Fri, 12 Dec 2025 23:44:33 +0100
Message-ID: <5962754.DvuYhMxLoT@radijator>
In-Reply-To: <DEWJTWZ6Q51B.13HQYMDJZRFWA@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <b92172f3-10f4-470f-b90a-121ff7fea988@dujemihanovic.xyz>
 <DEWJTWZ6Q51B.13HQYMDJZRFWA@matfyz.cz>
MIME-Version: 1.0
Autocrypt: addr=duje@dujemihanovic.xyz;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KUR
 1amUgTWloYW5vdmnEhyA8ZHVqZS5taWhhbm92aWNAc2tvbGUuaHI+iJkEMBYKAEEWIQRt/0HWDf
 MUtbdrpjCtMZNSRY+tAwUCaJ5XkSMdIEFkZHJlc3MgYm91bmNlcyBhcyBvZiB+MzEvMDgvMjAyN
 QAKCRCtMZNSRY+tA/N/AQDth3Xl3wNcETvWPqqfYfyw4BFqbOD05A/W0/G0ZIjFzgD+PZVts3sN
 p5WuEwIxUrWxwavWJQBJwhXeWdru5ol82gmImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60
 DBQJmiSH/AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw
 8A/i4lPOL7NaYoYePDql8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xq
 h2MRcNmJCHA1YhWAbQoRHVqZSBNaWhhbm92acSHIDxkdWplQGR1amVtaWhhbm92aWMueHl6PoiZ
 BBMWCgBBFiEEbf9B1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwMFCQlmAYAFCwkIBwICIgIGFQo
 JCAsCBBYCAwECHgcCF4AACgkQrTGTUkWPrQPUYAEAlVKitl0w6Wun+hC0JIf8bnc0TnrH8kcDxV
 f5lAF38fcA/j8RxR/p558NTFUyHZt2Sa5AqxVkaA4aJekySytWe1YGuDgEZokhzhIKKwYBBAGXV
 QEFAQEHQMRz0l4Dnk6Vl9YqC+ZGDDpr8SkFDyYOXqdBMGad3VccAwEIB4h+BBgWCgAmFiEEbf9B
 1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwwFCQlmAYAACgkQrTGTUkWPrQMbkwD+K6jiXYYMRnV
 l/5dpL//wXB1cM72ceR9tXYweMXg1lfABAOugzMF0xypW9zwYAEWVNOAaPsqtEPPYfBY3IXxl6m
 sB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_144455_289584_C0A368BC 
X-CRM114-Status: GOOD (  14.65  )
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

On Friday, 12 December 2025 22:17:12 Central European Standard Time Karel=20
Balej wrote:
> Duje Mihanovi=C4=87, 2025-12-12T15:55:48+01:00:
> > On 12/12/25 09:36, Karel Balej wrote:
> >> Not having any board schematics, I don't really know what exactly the
> >> regulator's purpose is. As I mentioned in the commit message, the
> >> communication with the chipset seems to work even if this is disabled
> >> (e. g. FW loads, networks can be scanned for,...) which doesn't seem
> >> like it should be the case if this was a main power supply for the bus,
> >> only actual connecting to networks doesn't work (gives
> >> CONNECT_ERR_ASSOC_ERR_TIMEOUT errors).
> >=20
> > To me, this strongly suggests that the regulator powers the WiFi
> > transmitter or at least a part of it (such as the RF amp).
>=20
> Something like this occurred to me too but would the chip even see the
> networks if this was the case? Although you are right that it could only
> power some specific part of the radio.

AFAIK you don't need the transmitter to capture and parse beacon frames. Of=
=20
course, connecting to networks is a completely different story.

Regards,
=2D-
Duje




