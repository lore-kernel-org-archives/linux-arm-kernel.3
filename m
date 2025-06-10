Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8474C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=; b=rB9Ua1IxgqwWQguTapPOR3+NZM
	0ncPKyIaw5uOqN2DJ6iCVA8c5ssnf2HD3MhEuUl62i67jqNARdDQxaYrcVmKNLTPs/duz8rGZLR1w
	0hWpUhmolMHfBkaDg54PxZZ7HVrPnPIIdtvGBZqkyg+GspoJXbcvsvfwW3hJt1OhDf6POFrfEKLOL
	6ODF0VrWzqz9QLYVixTTITWDXo+17+WWRTOF+DE2RsP/eF5tLQOYNNs5iZ9iQe2SX6rad7kUgIvlh
	0PtudbqnBHHUTh8tlLJ9NUxqad28bdRWABBaAg1JgRWUPbbVYHbSC9mD9zwWOwSrXAecej1Xe9SJn
	MVIP4oQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxmp-00000006ivf-0zRL;
	Tue, 10 Jun 2025 12:09:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwRt-00000006WEn-1BXX;
	Tue, 10 Jun 2025 10:43:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-451d54214adso43315265e9.3;
        Tue, 10 Jun 2025 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552200; x=1750157000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=;
        b=GMSuH235ya7lYh1/3nG8wvU6HK2nlXaleMwX9KP3SBvMnr5f40wcWMWAfZltLl0ZH9
         qKovBczjHBvzm3v41AHjWycxEfgdAXTxCBIhqwGMMxiNq+vmyxxi/OeY6xZuNJGAlNWe
         3aSSqMchvjdj6nopCZNMz1+QYtgWW17qh3/z6945ep0iCnXFvHlquIxpP3TdmEyu+c9p
         avr5IqaeZ26jFWy9v8s3zfYXSU3elfeRaPMkCqbUJArAfeBSD4qmfWNMLArwmMkJLM29
         dfRG+Jrer5uTMz+px39pbnSAcGG8G+uh/ye54EsU5PXenGUstn85mnyZrzFiJgq7xh2P
         ziyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552200; x=1750157000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=;
        b=Z9Ftx3pvEpEV+lgzu7tlzUw30EivQlBLvJwxymC/3KflsFbdRrswtMo1cD9i0PDxEW
         sDyDRiq529ASXyOlXCE8jFG/YF6lkKGLf51EoSr7dMm/Tf9hqskIz22WwmMrAI8mFFVO
         Mksk3QA4DAVOv5n6jyVS7a/LkdA2HKXgunLpya1C/D3eosryNMlVf8/3Ar5Q/++nIuiy
         zz0HUgpnifZ9l4UULZA2955muotAYU4T9jpLSGwBzwNwZts+rBc5a1Kb/4PxY9zHOuzi
         c9z3ofiKr5muXStkxU2oS+cxF+gOmQnGA8LV6+JIr7JqfOj2c0rcv7mqoTKAniit1cQ9
         tf7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/dcIE9/4gQYGYAlfUdX6E1gBnazcAcWdZ8/8AHmFiavK/dvH/SctiF++kx3JeIqrUl4rVkfXiPzvt4nPSAmkLKA==@lists.infradead.org, AJvYcCXoJMSO8o89TePQzwcMgOUfLSMNNMWkc7rdEW/26SxbwHBhi/+S0+26gcUnMhUkfPvK6iOo2c7VLnjfF2GC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+TeYVxbeM0b2GZ16BLDIfjsh0YXPRbk7SXtBtZUlq7H8ZXFri
	YuFHtDXrfE9119VPpz23ijrwrUsVoKsahx10UqH9tNkL/g2hMSPnb6jf
X-Gm-Gg: ASbGncuTseK3lMLwc+T05CY+m3vzRw9AtZe2snTUt47xDuE2Hz/EqY1+DA6xNbB/eNb
	HpIjV9q6pm/Tgyl7msFqAKRYNuDPmVF976lECsoV7jTsow93WDujLTlkNEaYQ+qdoo4M226Efdg
	XKSi62DqzzyyQ37cAcwEwsTRsI+kthfwRHyKIZcws70M9KixGZUyjhj//tQ7GYoDYwQbazEb6LB
	y75pp1q4m3rcAsIq19oYIMWJA8af5FmFsq02gkPWbujW1PmaZarYlZHzoxE0jOU9QdnbhnklGKa
	UzZxhoF3ov/JOsu5G/2Kca2atluUm+y87ZlmuvPiZMtc5e9wNol5roz3sf4YF07rHBENjgOMuCG
	FV8FmSPMdHsHZtkC36EJSrL0NbhAHfGUFUTynykolwoXPIKNTJ3oTIKpczhk=
X-Google-Smtp-Source: AGHT+IHQ/+H0xmT4/n8SzqPJO5wYfpUJEhNk4WbIofE8jpTP1D8Vxb32j//I2sl0mRwL2FnnAavasQ==
X-Received: by 2002:a05:600c:8218:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-4531de00602mr28517275e9.10.1749552199291;
        Tue, 10 Jun 2025 03:43:19 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm137172115e9.22.2025.06.10.03.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:43:17 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:43:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
Message-ID: <hcw6q4iwiout2htnq7wdd3bijozjoqbfdk3tdt42ynr4cx53uy@rxd4io4oua3a>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abxrtw4wmi4tc3x3"
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_034321_322226_B3EF4A19 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Nishanth Menon <nm@ti.com>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--abxrtw4wmi4tc3x3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 01:57:11PM +0200, Krzysztof Kozlowski wrote:
> According to Devicetree specifications, device node names should be
> generic, thus Mailbox provider should be called "mailbox", not "hsp".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +=
----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--abxrtw4wmi4tc3x3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIDEAACgkQ3SOs138+
s6FLeA/8C28wIE1XdUrfWbZVBn7aovpLS99DRcLoPyMvhw8fjByqxokguQTPyVMb
uUYMChlSTxFTyYulzP+K2kv12E04Yeu6n4nhk6gOx90ItrPuiqCqPsBrp8WU6Ktu
/Xr/DpwTy6DdlN+Xb5RZ6FtcncU0CMdf7bpB0ZxYIciQfRnimdpG6e8JTxE5ShIa
uLTNQjPYdtJb7RSE4jaQ3KZFLP5tUsb43sh/Yr+8356lE0ehI+L994IO+H8J5OKn
0A8ZKhCRzXwMdMb3N9bYfP0BpMRlgnk5BhGMEu5BTGVt1QjNTlSSstt3kaees5pd
3D+2vN4NLXtkSoSUjyxIwUK+nJhZudE7DjySBZpIf1TiJ3Js64i6wMwWEqs4v+0/
7jPjZp9JXKzFvBoBUtmEpGt3YM9B4kALq9gqooFzH8IkowTK6FUlamTqSlBytDrd
0ZjwrGllN7fYZZaxZ4L/5CIeLyo/XLG/AgVm45QeuGIpT3uBRVdox3X1oPgHKz57
dCnGomNKN7WyMEqXCE2TSJQkIh3qdhtpHg0p/Wf3gvKg+ak8kJYE099TTtOYS6VN
DyHrxbecTi/ktRX9d7TmReGlCkFwrmLrl5FECpWWUEO0ZnrFXuQj5cNues8Y5wSQ
V3Ey7khUayaf0c9EiafF4zDHDgx4YBeHw7Rn3bRM6PzdboL3EcQ=
=rTWv
-----END PGP SIGNATURE-----

--abxrtw4wmi4tc3x3--

