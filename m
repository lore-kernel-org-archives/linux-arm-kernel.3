Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED96DC36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 19:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqKXO0xOfzBcK4PCH5SiTTY81usoyU9YN/H92GQ4otw=; b=f1K6Ft5ucwHUjgwRBNnx1IQgc0
	Utf82FuYHIUqzq8CyTrAqvRXOy1sswuc5HVbtQr0COkaDL7iqouhSXUrtVTMo/Bmo4mUDdvo+0Tk1
	37nmumNWiqb6EBAvrk+tEda8DimMYhrnIuIv6HbyumUwTGjTx8dgapzGeZgeO3pg7pZc/+FN+umXh
	4bQaxBHCahz+2FbVyjaMYpnk/3WhVqEfpYvwGc1ZEv94A5qc8teh1Gtn6YRQwxCd2dQTw7CoaYjLg
	TklcXcLbVf/5TBqGI+3ccN8Kc71CD4Hz5AqmDHzw8lCVFd84dN5tojycUgf8MhMRfT3YJtyhJB1cR
	8rPo3MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKQ9-00000001B9N-27hF;
	Mon, 31 Mar 2025 19:03:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKOE-00000001AoS-43Hg;
	Mon, 31 Mar 2025 19:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB828A439A9;
	Mon, 31 Mar 2025 18:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FF7C4CEE3;
	Mon, 31 Mar 2025 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743447701;
	bh=y6YMr3baPj0fmKAXg+1TRjlsnvp6i7akFQbajbrsnAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNY/7mMcf4YEoeD5x5Yf4QpbX2DiZhW2OObckB8SEDRc+6hFMVjLaZOoZrOm4chvo
	 96E6l0Pkn8vkAox5o5KDSgw9h8QhGKjjktMr0KvtzBIi711FRf2JkwD/+qLhyFqAEM
	 POmf+wBYaiB4hw3XJofMxtCAHQhr2ZJLuEY2Nk0v042hePQ0lqYVIAN1x6957T+xSl
	 FqKzFLhwsCFVJ6JPZozDprMsGm47Hov5828L900sfFT2pV5sBXiIjs/YjGfdIB5Qbu
	 fsnwtrisvQvN+yfHl86XPkc+ka73NIdIACxfAieHA+bcHvs9nuxyFsoM+mOsFXIrPB
	 bXIt3v9Dna5qg==
Date: Mon, 31 Mar 2025 20:01:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Enable HDMI1 on rock-5b
Message-ID: <6d168284-01c7-4da4-8fc9-1b12e38b554f@sirena.org.uk>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <20241211-rk3588-hdmi1-v2-4-02cdca22ff68@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+3CwgnGsvSSr2pL1"
Content-Disposition: inline
In-Reply-To: <20241211-rk3588-hdmi1-v2-4-02cdca22ff68@collabora.com>
X-Cookie: You will have a long and boring life.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_120143_136629_9FFD8EDD 
X-CRM114-Status: GOOD (  14.83  )
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


--+3CwgnGsvSSr2pL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 01:06:17AM +0200, Cristian Ciocaltea wrote:
> Add the necessary DT changes to enable the second HDMI output port on
> Radxa ROCK 5B.
>=20
> While at it, switch the position of &vop_mmu and @vop to maintain the
> alphabetical order.

We're seeing failures in the Arm lab the IGT tests on this board in
Linus' tree which bisect to 77cea7ca1368 which is this patch.
core_getversion fails:

<14>[   21.933549] [IGT] core_getversion: executing
IGT-Version: 2.0-g8b20280 (aarch64) (Linux: 6.14.0 aarch64)
Using IGT_SRANDOM=3D1741272980 for randomisation
(core_getversion:284) CRITICAL: Test assertion failure function __igt_uniqu=
e____real_main84, file ../tests/core_getversion.c:91:
(core_getversion:284) CRITICAL: Failed assertion: fd >=3D 0
(core_getversion:284) CRITICAL: Last errno: 2, No such file or directory
(core_getversion:284) CRITICAL: file descriptor fd failed
Stack trace:
  #0 ../lib/igt_core.c:2055 __igt_fail_assert()
  #1 [<unknown>+0xe31a129c]
  #2 [<unknown>+0xe31a0dac]
  #3 [__libc_init_first+0x80]
  #4 [__libc_start_main+0x98]
  #5 [<unknown>+0xe31a0df0]
Test core_getversion failed.
**** DEBUG ****
(core_getversion:284) igt_core-INFO: IGT-Version: 2.0-g8b20280 (aarch64) (L=
inux: 6.14.0 aarch64)
(core_getversion:284) igt_core-INFO: Using IGT_SRANDOM=3D1741272980 for ran=
domisation
(core_getversion:284) drmtest-DEBUG: Force option used: Using driver rockch=
ip
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407

(core_getversion:284) drmtest-DEBUG: Condition stat(path, &new) !=3D 0 occu=
rred in function _is_already_opened, file ../lib/drmtest.c:407
(core_getversion:284) CRITICAL: Test assertion failure function __igt_uniqu=
e____real_main84, file ../tests/core_getversion.c:91:
(core_getversion:284) CRITICAL: Failed assertion: fd >=3D 0

(core_getversion:284) CRITICAL: Last errno: 2, No such file or directory
(core_getversion:284) CRITICAL: file descriptor fd failed
(core_getversion:284) igt_core-INFO: Stack trace:
(core_getversion:284) igt_core-INFO:   #0 ../lib/igt_core.c:2055 __igt_fail=
_assert()
(core_getversion:284) igt_core-INFO:   #1 [<unknown>+0xe31a129c]
(core_getversion:284) igt_core-INFO:   #2 [<unknown>+0xe31a0dac]
(core_getversion:284) igt_core-INFO:   #3 [__libc_init_first+0x80]
(core_getversion:284) igt_core-INFO:   #4 [__libc_start_main+0x98]
(core_getversion:284) igt_core-INFO:   #5 [<unknown>+0xe31a0df0]
****  END  ****
[1mSubtest basic: FAIL (0.000s)[0m

and all the other tests refuse to run.  Previously the test passed:

<14>[   22.491231] [IGT] core_getversion: executing
IGT-Version: 2.0-g8b20280 (aarch64) (Linux: 6.14.0 aarch64)
<14>[   22.492030] [IGT] core_getversion: starting subtest basic
Using IGT_SRANDOM=3D1741272980 for randomisation
Opened device: /<14>[   22.492835] [IGT] core_getversion: finished subtest =
basic, SUCCESS
dev/dri/card0
Starting subtest: basic
0: rockchip v1.0 0 RockC<14>[   22.494233] [IGT] core_getversion: exiting, =
ret=3D0
hip Soc DRM
[1mSubtest basic: SUCCESS (0.000s)[0m

The board is running fine in -next so hopefully there's a fix already
there which will make it's way to Linus' tree during the merge window.
We're also seeing something broken with the HDMI audio devices, but I
didn't look into that.

Bisection log:

git bisect start
# status: waiting for both good and bad commits
# good: [1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95] Merge tag 'net-next-6.15=
' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect good 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
# status: waiting for bad commit, 1 good commit known
# bad: [01d5b167dc230cf3b6eb9dd7205f6a705026d1ce] Merge tag 'modules-6.15-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux
git bisect bad 01d5b167dc230cf3b6eb9dd7205f6a705026d1ce
# good: [cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c] Merge tag 'drm-intel-gt-=
next-2025-03-12' of https://gitlab.freedesktop.org/drm/i915/kernel into drm=
-next
git bisect good cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
# bad: [72885116069abdd05c245707c3989fc605632970] Merge tag 'landlock-6.15-=
rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux
git bisect bad 72885116069abdd05c245707c3989fc605632970
# bad: [b2e7b0ffa56185d04871c6fe317b36d30ce2861d] Merge tag 'erofs-for-6.15=
-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
git bisect bad b2e7b0ffa56185d04871c6fe317b36d30ce2861d
# bad: [c9869f9073bacfa9b6030fd7670f737793277a85] Merge tag 'imx-dt64-6.15'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc=
/dt
git bisect bad c9869f9073bacfa9b6030fd7670f737793277a85
# bad: [d1221aeb5a44f1bbfe16a6efd8bc8b0bc3f565a6] Merge tag 'v6.15-rockchip=
-dts64-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-ro=
ckchip into soc/dt
git bisect bad d1221aeb5a44f1bbfe16a6efd8bc8b0bc3f565a6
# good: [c4991aabc1f90359970c17db38342adf2678a181] Merge tag 'mtk-dts64-for=
-v6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux i=
nto soc/dt
git bisect good c4991aabc1f90359970c17db38342adf2678a181
# bad: [b2e668a60ed866ba960acb5310d1fb6bf81d154f] arm64: dts: rockchip: Add=
 HDMI1 PHY PLL clock source to VOP2 on RK3588
git bisect bad b2e668a60ed866ba960acb5310d1fb6bf81d154f
# bad: [91abdc6b36e12a2c3a477bde90e9f1dd8c2413bf] arm64: dts: rockchip: add=
 overlay test for Edgeble NCM6A/NCM6B
git bisect bad 91abdc6b36e12a2c3a477bde90e9f1dd8c2413bf
# good: [f62f325a586682b7fff643c9fd8edc348bff6abc] dt-bindings: vendor-pref=
ixes: Add prefix for Ariaboard
git bisect good f62f325a586682b7fff643c9fd8edc348bff6abc
# good: [bed6964e779b5853de042da14320edf9f79506fe] arm64: dts: rockchip: Ad=
d HDMI1 node on RK3588
git bisect good bed6964e779b5853de042da14320edf9f79506fe
# bad: [b3dc2a9315c4046b330a784c0527c671fd236414] arm64: dts: rockchip: rem=
ove rk3588 optee node
git bisect bad b3dc2a9315c4046b330a784c0527c671fd236414
# bad: [4a2fdf91e1239d9659d0317f3e8e37681ac555a4] arm64: dts: rockchip: Ena=
ble HDMI1 out for Edgeble-6TOPS Modules
git bisect bad 4a2fdf91e1239d9659d0317f3e8e37681ac555a4
# bad: [77cea7ca13680e14119a3b9635c7ef16cd7ee44e] arm64: dts: rockchip: Ena=
ble HDMI1 on rock-5b
git bisect bad 77cea7ca13680e14119a3b9635c7ef16cd7ee44e
# first bad commit: [77cea7ca13680e14119a3b9635c7ef16cd7ee44e] arm64: dts: =
rockchip: Enable HDMI1 on rock-5b

--+3CwgnGsvSSr2pL1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfq5o4ACgkQJNaLcl1U
h9DZsAf+ODL7cizdRuXEfFw2qwrf5hrYVGHEHbKxng/eNUh4pn9+XNX+5i0H+teX
ydwp0gUmxzuiklLEplQ8FLLVb/jPpR4tr9vzM+6tcioezoLo9RhqiUJu/on03i2Q
tzr2RR46BPej44hNho5kJBY4pwmD8D6KS/WuTlKnaDxl/J2dLHDyWzxI2BN0+5Mo
br7T0PvDuSCAyYxuDeXfIs4dETkIeB1qdnzZHPBTf4rXKJPZ+RSEju/ucPdizBoq
yhOkj3pLgvtW92ZnUz0Vyk4J5GFEFtk0yq0Wt/n/L5ga6hzRTaIYlGBC0yHYUUC9
uW1p7ztFpuxYll+Olgv8PSnKNRktJA==
=ry+H
-----END PGP SIGNATURE-----

--+3CwgnGsvSSr2pL1--

