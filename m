Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1511C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jiUrJWIjrS/zl54Lua+tp5RGUjRBoaPMIxbNmfvQnk=; b=AtOiSLqajlCSKB+hi+iKeWnwz5
	bSjPQmW/AAcsNSkUXPlzKaBlMGU1ElE0+aEdO7hwDjn7ELpTy0A9Qv9ZuMehzn7gTbX82lVVJu+56
	Bi0kukuCfiK/VALBMwZW7vI8Irk7YW3G7336IIKwYvUp0e8jgATqwjOdZ657EHfoiqIDpgIWXNOE1
	HqmQwfCAAwmDSPaZsrYrz5S92JUNrSecsMkOc4Qn+CnFc8qyXq5fIjsPQaUWrqas7eFr3nFlqne8X
	1Vjyb6PXCwoziuFuA3OVOOC2YncdwpG09kCUkCfhbz+TWhr427WhVWOSROdxNneYD7vkBPRQQEZtO
	3XckPL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVWD-00000008vI9-1n6j;
	Wed, 09 Jul 2025 14:11:29 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSo4-00000008TO9-3DT0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:17:45 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752059852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2jiUrJWIjrS/zl54Lua+tp5RGUjRBoaPMIxbNmfvQnk=;
	b=EZug0f5S+/AFz3Oz/SwVdCwV/oLCi9n3Ho1yrquCajDl1sjiNb71yHqETQh7MqlOSf2uoz
	psA3PKH5qYO+j+uDUSm0vloPFdNuC00n9oAK0Mf69vh9B9sD9XC9w21QHNRnGjRuDXqADX
	XZH7dniVfMA7lFA5MMj+d90SH8UWusVxqKBQSOBxyxq7txnToUjO9mINyjmOiZHISkHr2u
	LTDneFcGyq/7sBEViNnZsSPCsIMXNTRSAvwUsvGliPdu3kHee81sCLMbUJHN3df98ak4Uf
	KTL+Yiyt0S0wB2819QUPuNkL1Mtj3mg45N4jemDAPidBTxICYrtikgmOrm8npQ==
Content-Type: multipart/signed;
 boundary=a15b73511b44a3a7249de8bd0c977f6d60b982377015c90af4dbb343db1a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 09 Jul 2025 13:17:23 +0200
Message-Id: <DB7HDOPFOQAE.3NG4SP67ES80J@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add reset button to NanoPi R5S
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250709105715.119771-1-didi.debian@cknow.org>
 <649824ea-a420-437e-ace1-2f079235c604@kernel.org>
In-Reply-To: <649824ea-a420-437e-ace1-2f079235c604@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041744_941357_E5DCFC15 
X-CRM114-Status: GOOD (  11.75  )
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

--a15b73511b44a3a7249de8bd0c977f6d60b982377015c90af4dbb343db1a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 9, 2025 at 1:05 PM CEST, Krzysztof Kozlowski wrote:
> On 09/07/2025 12:57, Diederik de Haas wrote:
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		pinctrl-0 =3D <&gpio4_a0_k1>;
>> +		pinctrl-names =3D "default";
>> +
>> +		button-reset {
>> +			debounce-interval =3D <50>;
>> +			gpios =3D <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
>> +			label =3D "RESET";
>> +			linux,code =3D <KEY_RESTART>;
>> +		};
>> +	};
>> +
>>  	gpio-leds {
>>  		compatible =3D "gpio-leds";
>>  		pinctrl-names =3D "default";
>> @@ -127,6 +140,12 @@ eth_phy0_reset_pin: eth-phy0-reset-pin {
>>  		};
>>  	};
>> =20
>> +	gpio-keys {
>> +		gpio4_a0_k1: gpio4-a0-k1 {
>
> Are you sure that this passes checks?

I did the following:

```sh
export PATH=3D~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=3Daa=
rch64-linux-gnu- ARCH=3Darm64
make distclean
make debarm64_defconfig
make CHECK_DTBS=3Dy W=3D1 rockchip/rk3568-nanopi-r5s.dtb
```

And it did not report any issues.
Then booted up my NanoPi R5S and verified that with the updated dtb the
reset button worked.

If it's about the 'weird' name/label, it is what is used in the
schematic document I have and I asked Heiko (on IRC) if using
``reset_button_pin: gpio4-a0-k1`` would not be better. That would make
it more descriptive while also having the schematic traceability in it.
The answer was no, use the form I used in this patch.

Am I missing checks I should've done as well?

Cheers,
  Diederik

--a15b73511b44a3a7249de8bd0c977f6d60b982377015c90af4dbb343db1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaG5PxgAKCRDXblvOeH7b
bi3IAP0QZ6nrHeJEorK5zsrkL55Nlul5jDIYPBwehpDyDLT8BgD+JuPieM/qOX2V
t77WC+GEezyPZaeos/wdCAlTkGS+OA8=
=okS4
-----END PGP SIGNATURE-----

--a15b73511b44a3a7249de8bd0c977f6d60b982377015c90af4dbb343db1a--

