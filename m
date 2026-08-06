Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A494C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgLf17wfYrVfnQERm/70teVLZ84QX0oUVoumyFV8ZRM=; b=MRoGK0xIL1nxMvBXar9j+vwJvd
	5csDb15ys/vplNBI04Ra2azIHiwrJxbiyRzcMG3QXqMAUg0b/99XOifPzetXJdo9DB8R5aJOlCj9C
	hQpF+sHM8GmmV2z0qDGikWXtJCitW1j9/XYxhPHT87+qIdUyIke6XWSJqFEBn2cFiylX5eqDDgCEM
	iOPwn1c8QUeieuIzrUhtMpNsIikZHFPqbX1GK7t1byY2XmB7ldl2wX5aDej0lx+Xom5gxz+sH8z4z
	tpHCgTzaGaoLPh/YdDL28v+BpiaBZL8LehZ2Nh8UPxQvW4wB53l5EtTAakXehDCLN2qqblsncnom2
	h8RlYKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx5S-00000005kql-1UAW;
	Thu, 06 Aug 2026 12:20:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx5Q-00000005kq3-20p8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:20:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4061641921;
	Thu,  6 Aug 2026 12:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307DE1F000E9;
	Thu,  6 Aug 2026 12:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786018836;
	bh=mgLf17wfYrVfnQERm/70teVLZ84QX0oUVoumyFV8ZRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j/8ODoQ/BObTPAuVgbRBkyY4VqKDu2JTVx6KDpzoENUSVZM4StTPPOBfVQrR0DLwx
	 BPbiSChUBNQTktBDw6n3QNFmJhtHRKJv+0eA7V1Bt8WUGXlM/z01fdW3NdIFfwLint
	 1nKdwN9GQtDBO3g0xJ6CMDO0lRX4RqpWMKwpwBsY7prLhwme4bDGoBV2uEwtCP+vKV
	 bYXGWzukAZHDzGeTfKJnryBuy6Ya6UaWD/Lx/bvH2uKixWsEnWJsRK1xgc2HIsABjP
	 CvTXOIRdxXWyncqIVf02p3LoX5Ketk7dgOMkZYSYfZYCmPJ/FaiMVaB787iPWDQiuf
	 KF1E0abJV3VNA==
Date: Thu, 6 Aug 2026 13:20:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Will Deacon <will@kernel.org>, He Kuang <hekuang@huawei.com>,
	Wang Nan <wangnan0@huawei.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: Ensure tools copy of linux/filter.h exports the
 UAPI
Message-ID: <c92e1b50-c217-45a9-b2ee-7c34c2c09bd5@sirena.org.uk>
References: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
 <anRpO_kxC9-uKnMh@willie-the-truck>
 <d57e11b0-c943-4441-b210-4b0549d03b54@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4VtcqluX5L3OEHF"
Content-Disposition: inline
In-Reply-To: <d57e11b0-c943-4441-b210-4b0549d03b54@huawei.com>
X-Cookie: Brain fried -- Core dumped
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


--T4VtcqluX5L3OEHF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 07:21:45PM +0800, Jinjie Ruan wrote:
> =E5=9C=A8 2026/8/6 19:00, Will Deacon =E5=86=99=E9=81=93:

> >> +#include <uapi/linux/filter.h>

> > Is this still needed if we take the test changes from Jinjie?

> > https://lore.kernel.org/r/20260806090935.39311-1-ruanjinjie@huawei.com

> I think both of these are needed for the fix.

> https://lore.kernel.org/all/20260806111546.42042-1-ruanjinjie@huawei.com/

Yes, we need both - with just the include change we still have the issue
that nothing in the test inclues the uapi header directly, nor would we
expect the test to have to do that.

--T4VtcqluX5L3OEHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0fA4ACgkQJNaLcl1U
h9BrZgf/b5IwpT9TYfwJeHi0BILUGcb+DuT+KKpxaa5j4zjN7F1HvV/KwJD65uyp
RNUf3ZZ9d9Mllpw7B1kLetLOIDfLoN0o8TpdOc5TQvHW2rPjjIlautSVuyVif3wn
P032z5Hifm6TpRgJxhIoIVDrmQTsJTM4utXfjyfa/xQ+oZdVgr7tHJ9E8gaOoomv
/KJxzDOVbFs4bZ0nqcrICnpnep+NVO7WPPCXhzQiC6CBivz6ngyz030i7fO7Tbzh
T5mOhjInozsOBRhI+1oLb5oQPvIMs7GznhwFSXAw9PR+W4UOLH9bCOxW2d1jExF0
oA9IW9eWHQrlNy3SUSpg0l15TR+KPg==
=aWyy
-----END PGP SIGNATURE-----

--T4VtcqluX5L3OEHF--

