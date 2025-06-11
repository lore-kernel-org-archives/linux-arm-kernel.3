Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657D8C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKHEZr32zYDl99R0N+Wj4UUft/P2f5v9PTCILH9uK90=; b=n7xeQlcDyQCBpCgtbit5EVSkt6
	PqBV5NCGUx5xnqUSaWiDOlp2FCEnfQcB9N8NSNRabsPtNNpwTcfFd0ESQ9RnCgssBj2cW09GbW4hf
	hZ3Bn+c2Z7ifnNvoDO/x7ua4AJLOG4LvI6i8gWVmFOwDCYFOGOM1b6u/xtoJECMAih4NLDo/0JIMi
	6DYazTygEY9eVIms2ZNiMLf8K+g20VFLO/JqOJkXGog9vxSk4x9OKMmIafHvhmjnDqsA1cquwkrOT
	Qr36YCIpY90lYmSnzQbfotyX30AguxiRf0mR/xWXkPkTyhHvzBwHqOgeaHNWieNX67o36YigMuuAn
	IeAG5zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXU-0000000B2lr-09qD;
	Wed, 11 Jun 2025 19:55:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNGM-0000000AN5c-3RmT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07BE0A518F4;
	Wed, 11 Jun 2025 15:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19287C4CEE3;
	Wed, 11 Jun 2025 15:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655273;
	bh=DKHEZr32zYDl99R0N+Wj4UUft/P2f5v9PTCILH9uK90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcDwzFZdWXwz9IooI7nmf21LRpBX/cPOAZNQVwMRD9Gxm1hp+C2IKKz4htVXQaFLe
	 5wpKAVVRazh2OLhNPg/DKTduO+4r7wFCD7UJaHG205159w6JHKx/uk+pc3N4ryRm1E
	 TiKBh64WADr2Zmu/X+IsHnLHp5nfhNBDrwfiaFJQEiPOkOqfN7eiKb1+BSDML306/P
	 E2eE6+0xgO3L502sRvF4DbbkYelb6sqifK2Po0r278zsjzkcZGb+6AM+CdxB2gxQ1Z
	 BXOGLGeWUxyspwwtp2JHex2TsZq9Kt/hFBbAgJZ9ZUDWz82ueTukJuoYMusgSuQrmt
	 FgJHTQw+tnKQw==
Date: Wed, 11 Jun 2025 16:21:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 6/9] kselftest/arm64/mte: add address tag related
 macro and function
Message-ID: <8e4aec59-88b1-4246-86e7-c438a141f215@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-7-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2N7Eqyu4U9441N1y"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-7-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_082114_921891_C71A8E84 
X-CRM114-Status: UNSURE (   8.32  )
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


--2N7Eqyu4U9441N1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 02:58:15PM +0100, Yeoreum Yun wrote:
> Add address tag related macro and function to test MTE_FAR feature.

Reviewed-by: Mark Brown <broonie@kernel.org>

--2N7Eqyu4U9441N1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJnuEACgkQJNaLcl1U
h9AJZwf+Jmz0qS5BNCoNsu5FojFhbVbD85Z9kyXCCOohJef2tuyya4XJgIe/VkUi
a78ffvoXTOa1enVTB8PIKDEgKH+5WgWMQaHmRUElXH5oWTf0WNxpixppEIVAVH0W
LZXRS3XA6rVKgIOiermPXoKA9db35TnbQUBvLgK1uyqig+ffKiYHj5GxCfoAPKyK
k/AS0TSBlawcDTolSWxGXf4FTJWd7M4S/Lgrq6NdRlIB+E825j7SL9pmYiOUTjCW
yqbXiUUGZfSdsOctX4hrkxapUi7TIMJ8PjjUOuVs2kbKUCCqKAde8BjYJ6N5VGVr
uCrIMTzbCvmLjvHVaEFRaDM+BeKCNA==
=DQq1
-----END PGP SIGNATURE-----

--2N7Eqyu4U9441N1y--

