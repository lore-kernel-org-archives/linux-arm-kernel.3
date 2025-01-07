Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F286E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyQVEVdNnxEf2xrqV+Xxk2a0ZYGO6sHSl+FeQ26ove4=; b=f0BSEoylCzW6f7s8YBGS+cx7H8
	4vDvPglKdwcTWmwlMsidXgSyK2zgkBEuJzV0Uyd9gNOKR9yLAvlk+968E2/aAINdGH1dHlLRkfDlG
	/dvgkLgRzHy7zh4krV/S59LVyOfFmLxXz3Yhjy5anc7msRo10+3c2dvfm9rFmbDHyZxZh7YvA54bI
	aNadajpro90DFHfad3gIXZ+JtLOk5vK/tLep+ibba2SHRhRB9GD3RG8E7ksO3eT51uJS796i5ildy
	lffcy9vW6CjgRXjkCbhahkOEpRka7pT6w5OPdrlw32I/KRHxqXrtkISX8uVtyZXs6lK+aSOI6+kaX
	Rpz8yIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBtq-00000005WGS-1nBc;
	Tue, 07 Jan 2025 15:53:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBsd-00000005Vxh-2yAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E643A418A9;
	Tue,  7 Jan 2025 15:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF24C4CED6;
	Tue,  7 Jan 2025 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736265149;
	bh=Q7QnbL6bI1ZqkhdszxN9JIdQgeAvDUdc9ZXusfOULEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psnZ0Fcx1yS/A0wNUWIgnOiXW75qdUSv/an4by6qE954b3QnhiMrspRJiNPidpL9O
	 FpTN+Y6y9zlLzzYVJ4gqaMARzDxll5zE9At4PlZlM6Tvdit8QrTqEt81mHQU7OGOHL
	 gfK5IsaeBJIc8+SfzR+J6zYaBXLsv7ksiA2bQHL3Jf09fd1Ehf6MpDz5TZY1w13UbK
	 QoZ4+HCUAyQ2k7D1KMEUac10BpPNmPTWinA84xFMgNJdP8DihEUEC8tmDqyjuyeJBT
	 QXb+x4fjXGUlnVGafD334WdvxYxPNwxYk3GYe0okX9OieJsLfOSINDPXdx7Kzd6kud
	 /guT7BFRR3P2g==
Date: Tue, 7 Jan 2025 16:52:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pwm: Correct indentation and style in DTS
 example
Message-ID: <sc5bau2ynnba5fuzbe423vl6on4kxttb7lyem7yrjzwszzo2gq@e4fhvoxjgdfr>
References: <20250107125831.225068-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2guj3orivcw775p"
Content-Disposition: inline
In-Reply-To: <20250107125831.225068-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_075231_810707_A563578A 
X-CRM114-Status: GOOD (  14.72  )
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


--f2guj3orivcw775p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: pwm: Correct indentation and style in DTS
 example
MIME-Version: 1.0

Hello,

On Tue, Jan 07, 2025 at 01:58:30PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 8 ++++----
>  .../devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml         | 8 ++++----
>  Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml  | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--f2guj3orivcw775p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmd9TbgACgkQj4D7WH0S
/k6GiAgAlE1jYz2DlRyJVPcl9nmKyK6RVrxqthTnHQH0jiPrmfTH2AYVa5l1xQSA
c+hMlpk9VUlMDxBuAxU4Bue6ZOV8+umPBED3BvO8ZBsY1OeMMPLgkha4aO2bgSyP
ncbo3Gdt6J3OM1Lgu6i5kL0eBz1SpPo1D/+hkVb1hIvyGVBAPR72wGwgI3d7A86v
CbpqkpD7wfAbX3f0Aq5X/Cj8O6QCSB5K8APyUeg2FU/Ydd7ww1rU1abQZwtRlRTg
Jr3rn8QsZpiWyqMZWYiP8kjnGS91EO7FL6YQjuMz8vg2MUdxxWP5hR/+HR/6Rq+o
sPL6XXtr/CAdCoed8Ng6Hsr/CKpRcw==
=Ui0j
-----END PGP SIGNATURE-----

--f2guj3orivcw775p--

