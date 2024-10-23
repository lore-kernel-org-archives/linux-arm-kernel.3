Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6549CFA454
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofJ96UZAAIntxC1YhWRS2QEXt54gNQotCCCiFxdd8KQ=; b=eEJe7/UKv/msQYAHiTTuvpknyw
	CnkwcHar7UsjtC8lA3CpSKuORdjk8M/8ISZ8tvetMYH8Fa0ng1RfjAeVlYgpMnvBoagp2fDtg9bUF
	QS5HNd4M0GILlCAOKkhyDC5RxKZNyTcwbqJp2g52+UFpsY47LKN+wdoI1GO6D9XU7Fyqc0TRrSTaq
	qhAG9+6CO4oaN+hJcxYH6D2QjkFMZntIEZT7i93qXJfFJbfkGvvY2thqG12aFF0EBoXrNq7RrDC24
	wrFwv/Bvycv5+wYbveMvPtpTa9utxz9O8/89P50ZrtZZDHR4QF+bvOL2YGBr9to2Nvk3gxTPIRv0k
	W1OcTGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ege-0000000FFWh-3bC9;
	Wed, 23 Oct 2024 16:58:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dxA-0000000F5gs-0ILb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12C87A416F8;
	Wed, 23 Oct 2024 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81C8C4CEC6;
	Wed, 23 Oct 2024 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729699878;
	bh=ofJ96UZAAIntxC1YhWRS2QEXt54gNQotCCCiFxdd8KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ynm67bTSjGgo4viJIYJcReIZm/PlEi7seZsZPmerhQRMpWnXUyfA1OHG5CQ2ex9O4
	 zzJD9j4dkHU8lLf+0KWbGRpEeUwr3oMsU4+xdPFH8HDGPPSyl5V5wp+EqGIosuBL2k
	 9tSQ6mvxiQHXvv2bMKHCsIO3rjvkQaZQHFAH0QAO5F/w1lps47Djel/iRIoZk9iY+p
	 pfciqBQ1Q2l8tYAIa1sUFApq5+N+jU4WVKr0OqHeWHuTUXbfGTdedz8eOHhBg8USf4
	 k+4eOJpc7UHm3DctOlpgVCVj0wRGO2lJnzifBG/OoJk5JdwOvNucvSWN0N8o8DwEr3
	 7NG28X7ShNcxQ==
Date: Wed, 23 Oct 2024 17:11:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v5 03/37] arm64: Add encoding for PIRE0_EL2
Message-ID: <d69ff36e-0767-47c9-a3f3-70105faef611@sirena.org.uk>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yiz9uhNUAoNsiMKh"
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-4-maz@kernel.org>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_091120_213959_78D42CF6 
X-CRM114-Status: GOOD (  10.37  )
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


--Yiz9uhNUAoNsiMKh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 03:53:11PM +0100, Marc Zyngier wrote:
> PIRE0_EL2 is the equivalent of PIRE0_EL1 for the EL2&0 translation
> regime, and it is sorely missing from the sysreg file.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Yiz9uhNUAoNsiMKh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcZICEACgkQJNaLcl1U
h9DvXAf/bw9sXwI8iYQc08VrIKiCzjsc/EOs/1zq2RYeCcHVkw5EeQyyHzEBPXhQ
PUteAGazVnZkZyA0O5eaWlKqHepxXFttNSQw+EWDX0qFuyFGgidhoWAUJ8vTCKEF
d91N2lZ9YVz5mufCkKrCQ/952AW8Mdr8w951kvGW3LzdCO52mfgVz0a7rHVmvsyA
C1BPkbMTzwdW06GCmIPOKiT9HEMXL63/XBUd9wBfCyk+MZmerY6ULVPyfY4fbKt9
KiPtdQIZbg+eofwEctUk9LhA/rtD7mIOo6HZSswKS3wUCfNd58Sdr+Wg3vjXadJE
GYb1J9ymylSlshUshmunGk7HlVDf6w==
=qW5L
-----END PGP SIGNATURE-----

--Yiz9uhNUAoNsiMKh--

