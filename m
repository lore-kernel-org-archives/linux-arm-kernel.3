Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45F6D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRqI2kajG3MpFHcedh0f/LFtV6jlxn9lFMGnLAS5L/g=; b=ilShh4UAS+QlJcnYwHv9eXpNni
	m3MY4iXTeJb6EUclFOkpyrmQHD1tndNJz8cwGqnyUalSbwfAj85oHAodIrGLNv+CboYnTdJh3et8Z
	k1Pyk4KJ9iVQDRxzMvPURx3/vWZ40yDyFUGp0RfXFWcRiV1mibyGcHfG6201SFlfV+XmHgy1DMR+n
	5P0cPsjQ7E0OkJok3b3sTlPzOoOEyhjeL+2tOouu56/uFhm6bXx+/ink6ivu8wXzMMEK5BabCoaIy
	0nCJOOBObKTck1cBXB4+P3dBTjwFNugwQraX0KyYibXLhs+LR0KwFMV8VD71nLozsWPd3ZhbMOTTB
	yVWDQ1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfp4-0000000H0p3-3DTQ;
	Thu, 27 Nov 2025 17:30:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfp2-0000000H0oN-386T;
	Thu, 27 Nov 2025 17:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25A1441949;
	Thu, 27 Nov 2025 17:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E2C4CEF8;
	Thu, 27 Nov 2025 17:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764264624;
	bh=TRqI2kajG3MpFHcedh0f/LFtV6jlxn9lFMGnLAS5L/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVoISbcjJC2JQyqpT0XlEeM4acwQB3Nr5+V3HDRO2F0WhG8kMHkH1STZIhelG5Pg3
	 0DsFJJt43r9BagkRTku3D447zCEW+BTd/UMYQeY20Y8DJDuyuuhUzpvwyGaDvGZCme
	 Jq0addUt9zQU1mLLVVdDUXZi8b2zl3Hwnp104MrqCb15WBvomN1zJFkqbvAg/4ZITp
	 JFrSOGSuBXiwOAyUcBAnyIQSSpzYyoxtnorJoOC7UgRqtI8bVXGLSShXlcQcrz+ia7
	 9pp2Um4+ekdDDZW93YeJMxTGurfslvuxmc+RF05eHxhHhN8k0JYnjDX47cTcvQ+d1a
	 vuOs6XbNNNCWg==
Date: Thu, 27 Nov 2025 17:30:19 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add compatible for Amlogic
 S6/S7/S7D
Message-ID: <20251127-panda-detest-8a5454dac059@spud>
References: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
 <20251127-reset-s6-s7-s7d-v1-1-879099ad90d3@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PyJOIfZRJSpZTrvf"
Content-Disposition: inline
In-Reply-To: <20251127-reset-s6-s7-s7d-v1-1-879099ad90d3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_093024_809485_D0EDB304 
X-CRM114-Status: UNSURE (   7.84  )
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


--PyJOIfZRJSpZTrvf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 03:30:31PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add compatibles for Amlogic S6/S7/S7D reset controllers,
> which fall back to 'amlogic,meson-s4-reset'.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PyJOIfZRJSpZTrvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSiKqwAKCRB4tDGHoIJi
0tH2AP43SN9VXKPMwWnwJ6H72N4NrnVMOYGLiaodZKgEkMpXywD+Pj5xkLfnb9xK
o9CPw6OaekkvC5EFHti+AbOc3tXIewo=
=3ECP
-----END PGP SIGNATURE-----

--PyJOIfZRJSpZTrvf--

