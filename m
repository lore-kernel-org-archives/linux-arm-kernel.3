Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CyErUkd6;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SyJmyiem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=; b=CyErUkd6cBrdysTOCGZtSjFz5f
	Q53BL02J+fuKbyj9FYxxFh/Il7M/3W2mK8H4c4GI102o4tFUB6cl9aGebvVan2GFYWKVIyAlqv9aA
	FuCknKz7W+YBh+kj2xrPNwmkqWlWFbHlfVyQmZM34Pvdff8huwpDqDToTTOqpOQV9SU2hqP368Nwy
	FoLF3kO51MoEKv2UC0hOsUwiCgz+hGpCQGcY3bF1Bhb1e/zP8elD9UydoFDrpNZhbRvcmM9HSocID
	UIthcujo/cjDH9nzWviN98gTnW/i0C836BAc5vBH7eRA3VY4VbTG2K+KHtIXQyjmK3HORUZOPMos7
	ZzzHBTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOykO-00000009KJ4-2fP4;
	Thu, 05 Nov 2026 14:47:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOykL-00000009KHp-25cM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:47:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a208d93758so22658415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793890039; x=1794494839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=SyJmyiemqqMZzPmX7y8ZMnTGhHtCHP1Cp6LkRxSHgLa/59CqmONeEuDczT8fIZVz6K
         LCfuPjszGgk6XeNFq+GZrk94KNC4ayyjMob0X1hXOrIKBJfHlfiqGxdpAr575zx5u5Lk
         bm2frMm9fnXt7m+/sS5A4btuoLTC354fSx+iH2bCjbd3aVm66dZVwDPx1atMRDTpkgwq
         ILneeTTUxlxmINAJy05agnZxYEl8lOkHlHDnG4EzsgolE7Om2T1759hz++0fypmMqRlm
         css+j7mcOr+eio1t23RJCcJWkTAa1QXOc7DpEMVkUkrO2Cke079rxYWWD9WzIWziuac9
         TF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890039; x=1794494839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=GgPSFqiWHqqNpco6UwyqxOsHuE4AQxYoDYqSLZ+vsxdWpLelXp63Yyspy+0YHI69E0
         ULOrnS65NUf39SSW2yEq6itm3i7DRrfPv6B2Qp+rsqct/kyk7z5odWkHKnYM0EJugwki
         Su9/SYAq15yW6q1N+IsShq2/n7JX4uhrDb86G2JZSwQqMZJ1uCSSa5nhW9q660NB627d
         kpe6O0MXd3///ROxHs3zza0KPxKrClUV7/NgB/jtoxzgHIhgKhbDife86fGW8rfZA23a
         Od5uA4H79o6xXBf97iDQsg/ZyS8zomV9qo1zCIressnLbBpXT8ifEI/Fo2aMj2FaXynr
         tZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBxl+d0Ub9F0Tx8vVN+/83Gyqb3yZz76TKEvpQtNpw8iQhTrVAInCEf3gJgAUG2OxMz6N8yI6OuQw2UjJSkdmPWg@lists.infradead.org
X-Gm-Message-State: APuU4Z8X0KYBJ8npfWz20wVtLkMzySYfvCLLk+KFDDl5aDRag/8pwDBN
	lRpkmIsvjstcH1LAHUhilmjjumAqlnV7G29DAmSPumBK9S494Z48faPW6lCHNR+4Jns=
X-Gm-Gg: AYBFou3ew+gcffFVQKQcryaYjBXVYQ91RBvMLgOtfzRFoOpmiOZUgyS8/FFUuX1jtFZ
	6veKilNI/mmLAxJ1mA6Zq3xxDRf3TGPGDuBWcS+QAtOVvLtutHHgTrrJx51FkKZMl1FEl0Im6aT
	WEPJYuzAv5830QaOkShFVY1Nzy27E7T+iHI24PZuqMGSc852gD6YQG6kJsyizLIksmDodOEs10X
	Ltag2GfYQo8nryGCVgKkjhdhkOdri6ZamLIXqGDLTMAVYhdCZ+Z/QqMEVwHV2YkuAx/WiDYcVGI
	ZmkJJ7mVcDa9WecYj0YPzICFXFvg9TIKqo0I4QIIJRohuIIjlUTfd9wDHW1sK3nKbYOyvxEvKwV
	FOZhMEpcBW4io/+0PZZD7VP6JenxPWm03wLxN+wU6z1X9EndFolb1VM4/Ju0TolrHQFPhliQCo9
	UBS7nJ4rV6eO2VOVB3AQqSlscxLtI0GaOO+YgTYKc5QT6UuVM9EpBCTb+DX6zyUPFlH2KNOrjQQ
	3ojVi0H0mxJX0UioyPATouyWSOwDSvQRASSlsZbO4lAwP7OoZDL5DpB7kKt/JZRGPp7t2I/mGHL
	NRDB/EUpScEpA6WyJvZpDuZoFjZJutYK/JsqSzilqc6cGdd/s0HnybE=
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr460893955e9.19.1793890039475;
        Thu, 05 Nov 2026 06:47:19 -0800 (PST)
Received: from localhost (p50915710.dip0.t-ipconnect.de. [80.145.87.16])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56eb4da1esm115774655e9.6.2026.11.05.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:47:18 -0800 (PST)
Date: Thu, 5 Nov 2026 15:42:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
Message-ID: <auyL6UF8WWwXsXrS@monoceros>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mag5oduzqhp4hkyd"
Content-Disposition: inline
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_064721_559162_0807C76F 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--mag5oduzqhp4hkyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
MIME-Version: 1.0

Hello Linus,

On Sun, Nov 01, 2026 at 11:14:36PM +0100, Linus Walleij wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides of_device_id. Alternatively
if you insist on full iwyu, include <linux/device-id/of.h> instead.

<linux/mod_devicetable.h> pulls in many definitions that are unused in
this driver and thus introduces unneeded build dependencies.

The same applies to several other patches in this series.

Best regards
Uwe

--mag5oduzqhp4hkyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsle0ACgkQj4D7WH0S
/k4ILwgAu4/aIJ4jmqqXgp8ctE1FUWAaormLaedGkha0tPWWUWZFCWXzzflrAPQp
x3SQdXc7pbe9QPylO/FE1FtFum1V1mELFB8lRrsWaexQxDdOJtfgg9sa2EtNyzON
d0vLNNlqRg+eDysFNiyOOcwYa8AN9IWbE+14HBuzIKAdtfixCwirKoJ07ZKtQEsb
FghiifffoIz93iEIJWklhWkMmMWHCyo7KwUjlW+YCncCdVnLfqR8fbdBo+58IcXx
2dgAHS38lq0GpaZqg7vx8x/QrRgOxOqj6KgK724ffND0DJzxlFGTTLCkDD4AgELB
fCGGyZ3gyhvkLj7YEXBO+Gb9upim6w==
=fVHs
-----END PGP SIGNATURE-----

--mag5oduzqhp4hkyd--

