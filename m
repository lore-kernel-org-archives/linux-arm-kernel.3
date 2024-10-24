Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78508CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V3l0lFgEnc5YQOpEQFxwf9cTBu/0p6CVcMW3mJNHpY=; b=QU7CSVVBk5vlkhERaBESRx1voV
	dwQfLTL1J1uQj2N1oLs7wr+iYzZfLLaamhDgCxOwqUSQEOLLdvRTAUH5IT8COq6ZKawtNZzdyPjzY
	PEgpKi2oSOiwXxlFnR5qfnSnhk9NUnQY23VQUIzxGWcjC3SVwdfNDS/Adm8GKjfaeu/ZV2Sgd9zsw
	3rBJrCUgK8ZEih+CGDjEg4U6dOINC+/+y0EAMi0Qd5TIH+kDOaT+qIHIK/1LJE7nHlHT1nNT1HfKa
	17DqU1w1jOiRZcGVQwug8+TJ27J0oLvMHoiAUk7QKCNtJkaJT8hJaDKqaFRK30wDyS9BmAvsmq8Vw
	9wI5w+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41dW-00000001Hxp-2u0W;
	Thu, 24 Oct 2024 17:28:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41Mt-00000001EEq-29VG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CA7FA4387A;
	Thu, 24 Oct 2024 17:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE66C4CEC7;
	Thu, 24 Oct 2024 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729789886;
	bh=1WdqHo2HGJNMs69cX9FV+ZG0Dwq2tMCHFmlCiNatbhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owkHAY8BWsoaieEkorRl9l8idOW8A7qWWrzJrQYEaIWd3/AiHDETi/2T12XOXPCAG
	 2OrsyWVwm/2tNVdkY3IKD7AucgATNf06M2nRpRQnjhoi3CHhCBBNhJdsKPn8B39DMp
	 cVlbGvcZ0medVgSlP9EmuiAvsIjzUhqG8QsJbuP0WXri0Jk9QHv8WlneCPEDeWsUsv
	 /a1AmGH1nP6OtGRUfiLt3Stk68BZ4iLVUxDahrdIwh2eEB6eIKCcis23ejYTkkSWlz
	 7FCKNWdglX+tdJLNtUaHQMPLV6eGguo0DWAxwxDvI6TbeL6+0Glb3G3k/qaS9GTj3K
	 8B6uEiNuS2rYw==
Date: Thu, 24 Oct 2024 18:11:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: timer: fsl,imxgpt: Document
 fsl,imx35-gpt
Message-ID: <20241024-plaything-failing-8a91c9b051ce@spud>
References: <20241023185841.1183706-1-festevam@gmail.com>
 <20241023185841.1183706-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ht6i6mn5ygm0dad1"
Content-Disposition: inline
In-Reply-To: <20241023185841.1183706-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_101127_640520_F87C262F 
X-CRM114-Status: GOOD (  10.34  )
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


--Ht6i6mn5ygm0dad1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 03:58:41PM -0300, Fabio Estevam wrote:
> The i.MX35 General Purpose Timer is compatible with i.MX31.
>=20
> Document the fsl,imx35-gpt compatible.
>=20
> This fixes the following dt-schema warning:
>=20
> timer@53f90000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx35-gpt', 'fsl,imx31-gpt'] is too long
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx35-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,im=
x51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx35-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,=
imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> 	'fsl,imx35-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
> 	'fsl,imx6sx-gpt' was expected
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Ht6i6mn5ygm0dad1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp/ugAKCRB4tDGHoIJi
0jDVAQDnbXO317H8zdaeX6UW4R5EaUI7ZGJMBdt9kKnxIZqtWwD/XO4mTjtsDeiy
15VLLZlDLydimwb4mDZ+RxWfDQJOcQI=
=GZyF
-----END PGP SIGNATURE-----

--Ht6i6mn5ygm0dad1--

