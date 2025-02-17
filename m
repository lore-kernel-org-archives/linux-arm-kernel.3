Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B04C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJk8/SrPdoFLdWOcpo+5G6r5AMsEus7osPwto4bzZjk=; b=NvN4bFeH0yQlPoFe2FZ9+oRmV+
	4gixDc/B5WWaZ7yv0jYVGlWyWCLoGnR9fIJfOhYvGuCpPYj/cI+nnm5D1II28GNQ+vpOdbzguHtAG
	UmD/mHZWENWFureCYqFNOdF248vOIcM2BfI9q0l1esK8iVCgdVbXkB7IMKRssOMoNOjY7MknQN1pr
	tLmJLlW7p2nCV5NycP/dzY+hPkY0n9x+JaXHUtitxBZ+22IVVgswjC+P9bhnvVJNhyikaw8GCrlPl
	ds9k2t15hhmQFcDOVW+lrBWT/jFra6oB3ZoCJezC1+tmNNdlg5z+ke7jO7UMtlDZsbclqDOrVQ5K5
	pB0O4Kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4nD-00000005Qj7-3xYM;
	Mon, 17 Feb 2025 17:20:28 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3b8-00000005C3S-30I7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:03:56 +0000
Date: Mon, 17 Feb 2025 21:32:52 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739808230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LJk8/SrPdoFLdWOcpo+5G6r5AMsEus7osPwto4bzZjk=;
	b=UzVhoRfoddKHqqP66smA3oqpO0D17suASPDPjZxQBauD8Qq6oF7lpHmxlwEv8MeBP2rZOT
	COw9uGcvmvRNy3RHLH8S/oGEl6hQtiyGOvizQeYm8u/Q6JO9IneD9gGPtzeNxcvohRB7dY
	yIjn9XNSXQnagi0COlfR+ne4d8dnwSo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, francesco.dolcini@toradex.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin-dahlia: add Microphone
 Jack to sound card
Message-ID: <vax3z776aw6aujpyvwc6zkfqgxn34oawxgc3wn6bjkkj7kjhpz@svmc3nasmjei>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250217144643.178222-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3vpxn6jmqqd3gcsw"
Content-Disposition: inline
In-Reply-To: <20250217144643.178222-1-eichest@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_080354_968100_01560876 
X-CRM114-Status: GOOD (  17.35  )
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


--3vpxn6jmqqd3gcsw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin-dahlia: add Microphone
 Jack to sound card
MIME-Version: 1.0

Hi Stefan,

Thanks for the patch.

On Mon, Feb 17, 2025 at 03:46:04PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>=20
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
>=20
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
>=20
> Fixes: f5bf894c865b ("arm64: dts: ti: verdin-am62: dahlia: add sound card=
")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi b/arch/arm=
64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
> index 9202181fbd652..fcc4cb2e9389b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
> @@ -28,10 +28,10 @@ sound {
>  			"Headphone Jack", "HPOUTR",
>  			"IN2L", "Line In Jack",
>  			"IN2R", "Line In Jack",
> -			"Headphone Jack", "MICBIAS",
> -			"IN1L", "Headphone Jack";
> +			"Microphone Jack", "MICBIAS",
> +			"IN1L", "Microphone Jack";
>  		simple-audio-card,widgets =3D
> -			"Microphone", "Headphone Jack",
> +			"Microphone", "Microphone Jack",
>  			"Headphone", "Headphone Jack",
>  			"Line", "Line In Jack";
> =20
> --=20
> 2.45.2
>=20

--3vpxn6jmqqd3gcsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmezXasACgkQQ96R+SSa
cUWD5A//ajdJiy6GNGANtya5phW2W6ZCuzpPK+v9N7yhiy1N3Y/5lMhvjaBeP5S0
CbH41SIXF5HrvDdUwOFnjlUzdHaqTsTmgrEBUFVYduv3B0F7msWjVzA8kgmxFX9T
lofiKy/vJ6a2gaQZi5KzalmnCkrgP/qHSzPVm7homHtB5injypFSrBWBAMsHgVO7
F63TS7q7Ct6LugWqQMUMwTByRFNm7lfL41UWsMBVLOQPsaY/F2NMhPudZbvCGLev
Mn/29ChwcjCe475YfX/zZ+SQ8Lo5BdthIRGZYJerQ5XAhTnulnICJJtkNnRaEGZi
BuDV6gKvMR1Ia6g2KPGaL5Zg73TLCLVucIg3coBDocbhIWAKw3jIZhel7j+cM0nS
rZVbYy35HT4qcnW4cmNdNc/v2/jL6y5EtqIsQZ9gup+/banHPitnKYjg0bsD2Iq7
iy1VLOzgRT3AXAGH5YmfXqe5zfg7WTFBCvwh6slAZXabHgw6UPphR4e14teU2zxi
6qYoTHmE6F4djj/5IbqLgWraNXp829QM8n+rK6SBCr8yMtnnYfXJblUXrw1kbCXr
N2roMgEIvGvSTEVd8+W0BDOuS1ExmJJ/vYUhLrGCIZ6bl3Qi4dYIl42WdVefRDT4
qtzIf5QAiMcqVitGzYmlGf/m+24KaGgPqsTLoGdumkagEgMVKz4=
=Qg3k
-----END PGP SIGNATURE-----

--3vpxn6jmqqd3gcsw--

