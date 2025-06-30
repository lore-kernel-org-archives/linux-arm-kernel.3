Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB1FC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpapsnvN2qo9hhPhQHWIegeAB6bx1Q9QSQ1S7RYoiB8=; b=jK2u4nccI3KrphpbYGZjTgeeNH
	nOAZC7mQrG1meMDG5MeTUd8MD+zzVSTF2XfWs4dTZztCc1/VS3cSeZEnmCn8HImyiChSDMetFajt2
	WIwgShWAGztUcpg9YjIkO8yNYkP5usbVhFhQv3Bnn1F28hs3P16NUhI2VJHvDmiQ1Ele+heigt9DZ
	CqlCMu4zagegmm+39Jnu2k77ndA6oac2miGAzZBdUrAdwDbdt+fN5XL6rcAcX+XitzjviCMd3sUcI
	KDdajXSnglLwL9NLQvO3GsBrMs29EB1UzbCac/ASfBovmqEjpJsPjZAdb5ZjOJKnHKshvwRMCXd4I
	4VbLPCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWESG-00000002MFp-0vQb;
	Mon, 30 Jun 2025 13:21:52 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEJp-00000002Kh5-0HYh;
	Mon, 30 Jun 2025 13:13:11 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751289184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TpapsnvN2qo9hhPhQHWIegeAB6bx1Q9QSQ1S7RYoiB8=;
	b=Qt/xf8jvowFgC12MA52xjmF0ThLOYdQaLftpgkvXJadJkSgMfDayzMLNa8IjYygLdcFLhg
	z/WC7CnjE3bpRYZ4rwLuQI1pdSLIE7CU75h+QkuZ2Y09OPbcbCc5GtizQAnuqrkjZM2hEr
	9g+wkuXxX/kxtOJz+KRFIv+SAmTBAq9wmztrlyEapOsPglHrN1D9qrrrspbcDhnGk9nC1h
	cuMV2maGNu/Zfo+CcABkJBAczKh13xrTz88Jfk3CvOLAU81kP1lutYYfAXHTeCV33uvS54
	ezpbVrnGiUMKbvOfrw6k+E9+IW3i1ABrBldKqDlaXHZKXE3J7lOqibP/spxoTA==
Content-Type: multipart/signed;
 boundary=cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 30 Jun 2025 15:12:56 +0200
Message-Id: <DAZW78SRQQ0Y.2R1T9V72Q7AZH@cknow.org>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Dragan Simic"
 <dsimic@manjaro.org>, "Quentin Schulz" <quentin.schulz@cherry.de>, "Johan
 Jonker" <jbx6244@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "kernel test robot"
 <lkp@intel.com>, "Rob Herring" <robh@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250627152645.740981-3-didi.debian@cknow.org>
 <202506290852.bWro2lBe-lkp@intel.com>
 <DAYXOI4WITJW.1G5DBWEQDDY1Z@cknow.org>
 <9f1ac97a-6109-40d1-bf85-f2a8e25138f0@kernel.org>
In-Reply-To: <9f1ac97a-6109-40d1-bf85-f2a8e25138f0@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_061309_821583_EDEB0E91 
X-CRM114-Status: GOOD (  10.78  )
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

--cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 30, 2025 at 7:57 AM CEST, Krzysztof Kozlowski wrote:
> On 29/06/2025 12:09, Diederik de Haas wrote:
>>=20
>> Luckily I've now found why my build script didn't catch it.
>> ```sh
>> export PATH=3D~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=
=3Daarch64-linux-gnu- ARCH=3Darm64
>> make distclean
>> make debarm64_defconfig
>> make CHECK_DTBS=3Dy W=3D1 rockchip/px30-cobra-ltk050h3146w-a2.dtb
>> <quite-a-long-list-of-all-boards-at-least-I-thought-so>
>> ```
>>=20
>> (debarm64_defconfig is my own defconfig based on Debian's kernel config)
>>=20
>> That long list didn't have ``rockchip/rk3399-rockpro64-screen.dtbo``.
>> Is there a better/simpler way to validate all rockchip boards without
>> having to explicitly list each and every one of them?
> make defconfig && make
>
> or make dtbs

``make dtbs`` is faster then I recalled, but I do like the detail with
``make CHECK_DTBS=3Dy W=3D1 rockchip/<board1>.dtb rockchip/<board2>.dtb``.

If I don't specify a list of boards, then it will build them all
including freescale/qcom/renesas/etc, while I only want the rockchip
ones. And as my script takes 20-30 minutes, that will probably be
several hours. Per run. And I ran it after each patch.

Giving ``rockchip/*.dtb[o]`` as parameter is basically what I want, but
I'm not aware of that being possible.
OTOH it's (already) a script, so I will probably just do a ``find`` to
dynamically generate the board list.

Cheers,
  Diederik

--cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGKNWgAKCRDXblvOeH7b
brfvAQCxEpSIjkdmRZ7MkQ5i4THNqBXbUOtLpJCTsHAh8TEeqwD7Btya8sIXw2rg
yTjCXv4ijLgp0OdfAo5k5i8MXuWUyQI=
=isL+
-----END PGP SIGNATURE-----

--cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7--

