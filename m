Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A65F33A70
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwFZtwwUHU51thyn9ZTePSP0KyHtnuAeJ2If0LKZXIs=; b=r/Sj9wzUguEZQqTXc9ghc70Aot
	HMyMCuJN7KfgRmOZEc18P/3ms9amBWHXdPwEmZagzARjfa4xjLGYWxkH74gg2cackjOZkR7yF5A9l
	B5cWawGHsTyE3CIB5yd2mUx3poniHZh3ULV6Y7S934PxDEwSHLjMx/CUAQEARAY//eba++wb7bNgW
	k+8dX4l7hxJl/IwKUy/uxk+8k/Ht4qdqaLOVONtPoQ5+5lXvjh+AeZadI0V7pS7z/7JkB1A3+NJ8f
	yPG52b5orwgZ5DImpnRrdtr4Clfct1bxD4Jf28lAS2Bgpnd9DQEvF98eTWf+B7VgOr+o3i+alafIP
	yPTFYftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9UM-00000001vf5-2l4p;
	Thu, 05 Mar 2026 14:15:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9UJ-00000001veW-3xxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58F7741745;
	Thu,  5 Mar 2026 14:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41342C116C6;
	Thu,  5 Mar 2026 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772720138;
	bh=lwFZtwwUHU51thyn9ZTePSP0KyHtnuAeJ2If0LKZXIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoIS2LOr7V02/EFRBwqdAJUmleXkuyNvIkmxwsOIMzyI+Mmpls4CGh/d4sSH3AnCS
	 Zh7Bi33nhwMP/U1ZTX2QkDZ7hZ2DuIZSOG5LplAdv3qMK3ZEnV5yTHdBdjlvwFW+V9
	 65PY8RuH6S6PB5VElq9uygBWL0KeWmISQyowprMtjgea9uYhBc57B9a7us87DRORGm
	 nwbr6Cfx57JAI5jch6bkqY9LQ40+rIzA/tjAaG4pg5uCf4z3RcVZzUxkdI2mDJZxad
	 ycAzU+ORpteFvhPrNJ+C439GiZHLIqxEjyZRWacIRdN4cHktaIFZj/P232PSg/79R7
	 XWirhF0CxDrLg==
Date: Thu, 5 Mar 2026 14:15:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Yifan Wu <wuyifan50@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	xiaqinxin@huawei.com, prime.zeng@hisilicon.com,
	wangyushan12@huawei.com, xuwei5@huawei.com, fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 2/2] selftests/arm64: Implement cmpbr_sigill() to
 hwcap test
Message-ID: <9e4e0af5-992a-46d5-9e5c-21ef747498f9@sirena.org.uk>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
 <20260305013638.992301-3-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F1N8Q+cYn7f9aq1L"
Content-Disposition: inline
In-Reply-To: <20260305013638.992301-3-wuyifan50@huawei.com>
X-Cookie: Onward through the fog.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_061540_007938_0CF6FBE5 
X-CRM114-Status: GOOD (  10.51  )
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


--F1N8Q+cYn7f9aq1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2026 at 09:36:38AM +0800, Yifan Wu wrote:

> The function executes a CBEQ instruction which is valid if the CPU
> supports the CMPBR extension. The CBEQ branches to skip the following
> UDF instruction, and no SIGILL is generated. Otherwise, it will
> generate a SIGILL.

Reviewed-by: Mark Brown <broonie@kernel.org>

--F1N8Q+cYn7f9aq1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpkAMACgkQJNaLcl1U
h9CNbgf+M2ibIDYwmqQ3xHMNxWIfRowucYliLdhtvGU8lCixXS3u9NLLggngaIv6
l62DHNfWJResPAz+9ENbXcUNDancgqZzYOkF20jCKUhQAq6LgPcSuAeZCjrpoq7g
F07cbectKD5R+t6hlSsQFv5hfp2ltC/TpWovGbSrPIVP8WWe7TexR7jbdx+itdvO
HuHwsiFPeZPRL4Ru6DXGnJvVO2zcjYUOH+aIP4VoXoNszt0zhH3DZWnwA17V7OW+
PkQm/rqcV29zYL00C0gAHZ++O8tmdm42AYihqaqLDV8tlwlrC+oSlMuXolFxOQW7
lj8zDJ0cCQjNYv7THHdt3JHBXqQ/Dw==
=ClP2
-----END PGP SIGNATURE-----

--F1N8Q+cYn7f9aq1L--

