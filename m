Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D64D64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcsUY1smIddJuukzgDWTdgQyF9eouZiuCT+y+xtjE+s=; b=NO5V1rJ0RY3nd/CO+/W7dtNfRk
	GvLVIBCXnsc2qG9BarFlTMaCw5f46P4sMyOuqV+hsEA8fFBbU0T9Hz+5gnl6ei8s2XDWWx/allDbd
	SHxy3jj2mx0/Fiz8F94uJEirQsoBs6yHqhCyKmSzs+yaK1GQtszXCEIb0+N3+YPFeXdwjLWlFQdkC
	+tRcaTp8jDYYgojz6KL3NUPlx3W7EmKd5IuMYPBtuqq2EDMOMzZA1Mggc+nyudYWAkH1J6R5C3XSU
	Q6r34SqH5ByesxDp5S4YGQ1wAmAzxjX3uP+lObe54o9leuzPrWSTs98XwIA35l7ghFQIsmnS+ovQL
	bcv6yo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtk-0000000BDG0-21qp;
	Fri, 08 Nov 2024 16:31:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qdc-0000000Ayxl-2Tbr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63EE85C5C3D;
	Fri,  8 Nov 2024 15:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F735C4CECD;
	Fri,  8 Nov 2024 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078663;
	bh=kRHyiXPlUV0rDJPiJ+QPZIN6o61K+Ssat5hWggNGNbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYyEOHZe5xcTPRc262BdXBn+HMK1sM8gSDJv5f5G5QRLHoT5E5mi6ne/5RzaBg1Vj
	 30dBuWT67zxVcCvzAJ7MBVIaMH3vjw/iqlTaMgi+3EVeQQQBzDCvWju9Uj6LSrf2SL
	 SaQJysakf1QU0P8EfyuX3hj29QoY/J5ZuHTIpxMXwVsbCL5EcUEbGtlwVuWIu5EySI
	 hZMg+S2u3+62HueJcrHycFnaQxwSEKRdovev0nU+iDU/wfcLJjSOEsINkBbpTK9TOE
	 gnpmi32Rdp3tee2QRl3OyWT6dsDsmLJoEHJQdmz6xI5GYG6c924wRZxidCFK2hxclT
	 7TPy1cQ/C+G+A==
Date: Fri, 8 Nov 2024 15:10:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Fix printf() warning in the arm64
 MTE prctl() test
Message-ID: <4bbc179b-73b6-46d7-b414-f3b14079b489@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-3-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pJb4DIpSwzrlDqsz"
Content-Disposition: inline
In-Reply-To: <20241108134920.1233992-3-catalin.marinas@arm.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_071104_692741_EEDE9719 
X-CRM114-Status: GOOD (  10.61  )
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


--pJb4DIpSwzrlDqsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 01:49:18PM +0000, Catalin Marinas wrote:
> While prctl() returns an 'int', the PR_MTE_TCF_MASK is defined as
> unsigned long which results in the larger type following a bitwise 'and'
> operation. Cast the printf() argument to 'int'.

>  	} else {
>  		ksft_print_msg("Got %x, expected %x\n",
> -			       (ret & PR_MTE_TCF_MASK), mask);
> +			       (int)(ret & PR_MTE_TCF_MASK), mask);

Shouldn't we just use a %lx here?  Casts tend to be suspicious...

--pJb4DIpSwzrlDqsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuKgIACgkQJNaLcl1U
h9BeCgf+LP7c17wm3e9XZFV8CJeh3pUUe86mTATYwELGkms9ZoIHXvUwrqhphujX
iRNj8QOet2g1IOFpITbCfKW0fuZy5gTqDkl4T+VPPZFTKGKgHS+whjTEm/lyWbdr
/34+n6666fezdZmGI8kdXJ5KOXV16T42uI2e6jtFLakuK+ks6eTJ1DW+91YuX/CA
jaXBJ/FW0kOG9EMijuWITzemyGf0Hkcq+zsMsT6ahiZA54PttKWx8T5BwpX9s9O+
t984Z7vC/RiwYp+b0LdVKXQjnt8rC9NvfgCdEIExA7+2y474VEKOwE4sZ1doPLk+
pG13Zhc3yNSWzvtPhZmv7LbM2PQUdg==
=OliD
-----END PGP SIGNATURE-----

--pJb4DIpSwzrlDqsz--

