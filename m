Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590A4F94CDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYTMJxQl3ovyWiIe4aogjPScXJ9CMaQ7A49oHkWJKKw=; b=c0KR5bYWKkZq9wSuuIBxJEe0w7
	BGOVnJaGoEWhq9B93pVBExGKZf70rZ5hw2PChzxHqhqXaijyTU0bh38c1dw1YkeNX9UAMHGBgJ2fC
	XTTVFjOnP7Z7fXUVqpjFMZ+ROZbPFgBhf73kZsoKfWXfw6J+z+7LguwtG7YQiRB8INE0lBeaOIUdH
	PcKBe4q1X1ZgK+pJ96gmqHIQS3Xd0izPBIl8ZGr6X0KhGCv47PB4QA+Pq0WF99/IeTh/+6apejKG4
	s0ewWdFaQFSEh/OOBhYQZ/sw83mEtgOYC9+mos/6lrJI0lseoOPJ/c1tC6pqLNRA2yJ9U0TEfABu5
	fnZDJoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRiB-00000009hnD-0oIJ;
	Wed, 22 Apr 2026 07:09:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRiA-00000009hmx-0Bd5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:09:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE83160018;
	Wed, 22 Apr 2026 07:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7702C19425;
	Wed, 22 Apr 2026 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841764;
	bh=pt6vRwU9dnqGT2fXxn6LaZWHRKbzGK7R13ATw3Np780=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocR0RmEA2q20N3jyHu6qk8p4XBtc9iuezpQqUOMzKVTW77ueoyRUqObM+GjUJhp7e
	 KSzvIyaDQgM6+mJKf6RUybwYjPy85QbpFMlQOjs15xw4tCX2IgG6MoCfmRqsWBNDjB
	 3DP7cOA/nqsx8Ms3s63ksIi88I+s0DB89E7crl4TBk/mj49GoKrP77LWGWivqQ7h0C
	 OrXvZuQxnBggPK9TamyN1ESSBYMNY4hz7Ey1uTbWl/iyuiKvrIJaLAhUgxc5m739G/
	 uRLzG/7EeJutf6i01pvepoC209B+xQfSnPkKYh7MI2Hp5UbZC2Gpo+iFaH/7oSJx3C
	 p1+OH2TxXZ20w==
Date: Wed, 22 Apr 2026 09:09:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 3/8] ARM: dts: Add D-Link DWR-932M support
Message-ID: <20260422-white-dugong-of-temperance-09c610@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-3-ace038e63515@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-3-ace038e63515@gmail.com>
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

On Tue, Apr 21, 2026 at 11:23:11PM +0300, Stefan D=C3=B6singer wrote:
> This adds base DT definition for zx297520v3 and one board that consumes i=
t.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

subject - missing zte prefix.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patch=
es.html#i-for-patch-submitters


=2E..

> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a53";
> +			reg =3D <0>;
> +		};
> +	};
> +
> +	soc {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "simple-bus";
> +		interrupt-parent =3D <&gic>;
> +		ranges;
> +
> +		gic: interrupt-controller@f2000000 {
> +			compatible =3D "arm,gic-v3";
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0xf2000000 0x10000>,
> +			      <0xf2040000 0x20000>;
> +		};

This is pretty incomplete DTS. The first submission must have a working,
basic device support which requires at least one interface, e.g. serial.

Otherwise how is this usable?

Best regards,
Krzysztof


