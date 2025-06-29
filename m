Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD7DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6Wlp3JgvEp0ycS0t6Z7WKduaZTKhf5gEm0eW6oKUXk=; b=ps1rHutR+K45+TdO4HIWiW2IjY
	voTDpW56OJN0s2NZNzRFrY3HVVHmcviTHjp0SHh4KPGaOPbWtPOp3ll1EpFKBTrikGmy0bAdMl0x2
	5qU6vu885FNsr5+hnt/P90YZlaF7lPSR31kjVxAkNgUTbk4GzfPB1Kg1f5qQDnjQpUWp0L7l8vEVq
	aMNmPKfOOq9QscK/xE1P4ogiVBMkTAJ7eFAgWTtsqti1WMkt3PDsSpLucziqgxoSksuxBI6KEEhQt
	kiQkQkgpnEG2Ch27Mb4pBOJ1gwo0C3G/TdhnXCrmEvID6Ovf6loo8jhrx1xBYB96JMYxJuPt63QVB
	ngh/D4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVp2a-000000007SN-4APP;
	Sun, 29 Jun 2025 10:13:40 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVozH-00000000758-3Z1l;
	Sun, 29 Jun 2025 10:10:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751191803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6Wlp3JgvEp0ycS0t6Z7WKduaZTKhf5gEm0eW6oKUXk=;
	b=jbLTkcMkzlOS4+CCECrHk6uIoEiUlZ8gi1AojI4kxi/eKj82hZVBUd0JkXPnB663LhL/Ek
	gVqtKR4nI0DDAfDOLpK/pQysjigMfgN3b1oiUOlRymhs+BHhUm9Z2CIhjA6/dxDofMziof
	bnZIC1eACNKyzLAaEjVmvFIWqNG5ubaMMU3Bswi2HkrK89/j4dBSJJ+/1Zwh7tZHRPMd7F
	h8lCIjiqZr5zNjUESE1775Fn9QF8oEovSIHTMpvWLnkHDCJkdQKwj0qhGDK74YgzHqetQ1
	lUR6lfFU1Fa45OZRahJUi6V6lS9ljIdgWs2JFN09YMxLkfMYs6Tf+IRgJb//Zg==
Content-Type: multipart/signed;
 boundary=43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 29 Jun 2025 12:09:49 +0200
Message-Id: <DAYXOI4WITJW.1G5DBWEQDDY1Z@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "kernel test robot" <lkp@intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Dragan Simic"
 <dsimic@manjaro.org>, "Quentin Schulz" <quentin.schulz@cherry.de>, "Johan
 Jonker" <jbx6244@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
References: <20250627152645.740981-3-didi.debian@cknow.org>
 <202506290852.bWro2lBe-lkp@intel.com>
In-Reply-To: <202506290852.bWro2lBe-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_031018_414858_3A930DF3 
X-CRM114-Status: GOOD (  15.03  )
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

--43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Jun 29, 2025 at 2:32 AM CEST, kernel test robot wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on next-20250627]
> [cannot apply to robh/for-next krzk/for-next krzk-dt/for-next linus/maste=
r v6.16-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Diederik-de-Haas/a=
rm64-dts-rockchip-Refactor-DSI-nodes-on-px30-boards/20250627-233300
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockc=
hip.git for-next
> patch link:    https://lore.kernel.org/r/20250627152645.740981-3-didi.deb=
ian%40cknow.org
> patch subject: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk=
3399 boards
> config: arm64-randconfig-002-20250629 (https://download.01.org/0day-ci/ar=
chive/20250629/202506290852.bWro2lBe-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250629/202506290852.bWro2lBe-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506290852.bWro2lBe-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso:75.1-6=
 syntax error
>    FATAL ERROR: Unable to parse input tree

The kernel test robot is right as the ``&mipi_out`` node is missing a
closing ``;``, so thanks for that :-)
The problem is also present in v2, so I'll send a v3 shortly.

Luckily I've now found why my build script didn't catch it.
```sh
export PATH=3D~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=3Daa=
rch64-linux-gnu- ARCH=3Darm64
make distclean
make debarm64_defconfig
make CHECK_DTBS=3Dy W=3D1 rockchip/px30-cobra-ltk050h3146w-a2.dtb
<quite-a-long-list-of-all-boards-at-least-I-thought-so>
```

(debarm64_defconfig is my own defconfig based on Debian's kernel config)

That long list didn't have ``rockchip/rk3399-rockpro64-screen.dtbo``.
Is there a better/simpler way to validate all rockchip boards without
having to explicitly list each and every one of them?

Cheers,
  Diederik

--43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGEQ8wAKCRDXblvOeH7b
bkmOAP9oM6RsgNp49/g+vN6x7caM8SHQCK0m03vWy5v9AUMPCAD9Gu0vIsw3p1fn
Jw3UxbRGaW+2LtlZ/raAKpP6oBKDRA4=
=vkok
-----END PGP SIGNATURE-----

--43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94--

