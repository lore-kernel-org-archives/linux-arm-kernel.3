Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A917606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqU/NPl3;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Xu5t+edz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DFh6Lj85QvvS03e5lkAUZeehfvdaN+YlDcZdEO2rzoY=; b=hqU/NPl3wAknQc
	ZUMl87y8si8XVGnYFQ5Ld9RIDgfKuZatBNW1hZRJ5YAYOATQZ+O/QYD6gz64SRYaI+pn3MtNtTr2Z
	y03s7x8ulb1rWP0hRdwPqOH7B9Ftdywki+Q64yrfOpIwyDXYBApti1DGf/TWxL7Ak79p/VlQL1ceN
	Cgrq52DZG3uWo9pGMS5DBMiPclycWmFWLMQLsUg/lMAF1ygj6umIJVT/fw033eZm1kki+Dra/beXq
	Cxxg3v9OciwDUIkz5eZpMHqvrl4MZ/Xn3Wqu3BM2t9M+Bw0zYknJmNaSOKmYQLiCsLBzlOTA919xN
	IZ2a37HcOO2wLWd8ZeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5Lc-0000000Alh7-0KQX;
	Thu, 05 Nov 2026 21:50:16 +0000
Received: from mail-106120.protonmail.ch ([79.135.106.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5LX-0000000Alg6-0ZYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793915406; x=1794174606;
	bh=DFh6Lj85QvvS03e5lkAUZeehfvdaN+YlDcZdEO2rzoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Xu5t+edzpHH1ii6iY+YOkP3s12v9wYG+6RUUo4xUghG3HwMV1RVvVuaosx0ivZkxw
	 gsoeG/UX3mYspquSOZwvXmpuhLssM41TlkEvoTgxugsrkdpIYfndH3JJkHssGwqgL0
	 4T/Kp1YhKwgyahj0HLhyylZgjtYMBbj4iDvVnxwAaHIv0RxGO5RNeoP6gex+ZokGxO
	 f9Wpm0CNvOGPSxfQmHeq8LI6l8Hd4gc2umBGGNFKmdQCbZZNe/aAJT+Irh/1gTqvKa
	 /2JEARvnYyQwzXJ358HeriC353sjuNq7Mo2BjQWW/diFAXaMsKIXOR99j4Toy6ilvc
	 jWe1A0xH5ZaFw==
Date: Thu, 05 Nov 2026 21:50:00 +0000
To: Alexander Letuchiy <asalde.le1@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Message-ID: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
In-Reply-To: <20261105210622.523747-4-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com> <20261105210622.523747-4-asalde.le1@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: e26518f322eb5f6161fc7a72d02b2c560e8b1a2c
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_135011_345230_993B55D9 
X-CRM114-Status: GOOD (  11.61  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thursday, November 5th, 2026 at 11:07 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:

> Add a compatible string for the watchdog of the MediaTek MT6895
> (Dimensity 8100) SoC, which uses mediatek,mt6589-wdt as its fallback.
>=20
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Does mt6895 actually share the same reset layout as mt6589? Given the
generation leap between these, the former is very unlikely to use
the same resets.

Best regards,
Roman

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.=
yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index f9b725592c27..cac7d9ae98dd 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -38,6 +38,7 @@ properties:
>                - mediatek,mt6572-wdt
>                - mediatek,mt6582-wdt
>                - mediatek,mt6797-wdt
> +              - mediatek,mt6895-wdt
>                - mediatek,mt7622-wdt
>                - mediatek,mt7623-wdt
>                - mediatek,mt7629-wdt
> --
> 2.56.0
>=20
>=20
> 

