Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C80C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENi8hJBzRE8JvriWtXhPZ9ZVhtE90LD36e7AByEnCf4=; b=3nFvwOtg/zxui658gvfIRFSUgX
	sFZ+GPODdKqJzDadNBRoJeYRlUuWE7weGKjnrZmyM1eiLUCfNeVwxEnciOgSv+l2Qurqx6PcvnqMH
	usugf/FSe9QIsHqymkmtRIN3/cE3f4MTakU2RxP4eA1U3Z9hGJ6n1Dbl34zdjpa3sTEUtkQK5ubxg
	PpLTP0TwXCZKbZ7K4cgTX0OEUOcBYofGHI9/xdcvZ13C3UrK1g7SD5QETAMc6fTpkIYv7JT1DZoHX
	ILB1bSV0rSVkAXp5CB+0BOQZnLTpqBRe43T9LGE3qxYpvsOiANH08cKlqtoGOuts9t5T5tNuS+2F/
	8Jw+6hBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5MH-0000000FnFy-1O1q;
	Wed, 15 Jul 2026 19:33:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5ME-0000000FnEX-0bMk;
	Wed, 15 Jul 2026 19:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ENi8hJBzRE8JvriWtXhPZ9ZVhtE90LD36e7AByEnCf4=; b=a+ZV63U8WuOqoQ3yu+1/ONPnRh
	Di8rhROtW1YUP2SLJdPOCAUnMPVeznK3zanPyIualIBpdxK7c0rKBwXy2+iCGcIzOqkGA3FRcAEYV
	/zshvt3M8G1U7uwCxbOqf7g7eowWf7sstsiGB+BTbwQQuUJBNtk8g8pX+ElDNCVogWRwZo+t41GQ4
	aR3OI//ADBpYYIDMNB1NmG/QnMLWqzvxC8KN8hdGAG+4dpfY/1E5UKc5liNE+EsjJ/8bOTed8yDup
	6tFQ00SLDDB5ramSD3LixhZiOfOAUxRrHDkzsFpd2/szCG6dIA2mWVbvvTUTIeUk7xEN+W86Og+WA
	yGsLS3ow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Simon Glass <sjg@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Simon Glass <sjg@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: snps,dw-wdt: Add RV1106 compatible
Date: Wed, 15 Jul 2026 21:33:16 +0200
Message-ID: <2785624.BddDVKsqQX@phil>
In-Reply-To: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>
References: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_123326_184065_A9031AEE 
X-CRM114-Status: GOOD (  12.42  )
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

Am Dienstag, 14. Juli 2026, 21:18:57 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add the compatible for the watchdog of the Rockchip RV1106, which is
> compatible with the Synopsys DesignWare watchdog.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>=20
> (no changes since v1)
>=20
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 9d25f5e497e2..2b16b7c2787b 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -35,6 +35,7 @@ properties:
>                - rockchip,rk3576-wdt
>                - rockchip,rk3588-wdt
>                - rockchip,rv1103b-wdt
> +              - rockchip,rv1106-wdt
>                - rockchip,rv1108-wdt
>                - rockchip,rv1126-wdt
>            - const: snps,dw-wdt
> ---
> base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
> branch: rv1106d2
>=20
>=20





