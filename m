Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA6BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pF0zRMnxqpAZiQDV2tjp1OzcmcfhmgifjwYB3Den84=; b=XoYF+iS4PQkQaQU9bIp+29Ptzc
	c65WlLOsmgBCiBkhrp0WLuA/RtgM4kNNbG7butCpPtlDbXtI3otWsNz8rW2I4Eaw2JkojKYPUJBdV
	BskqymVsTi+dYOAWYSF0fv67NTsWJLO2BT2iQyYRC3y5cYEWq/3EGLc0WnMk+DBraEbSzoTNmcwaC
	JfbMHuSV3pk8PUOmH+Hu6QuhBXNl5rTLOsFXaQUpuaGRKV5h+aNrgJRAW6LYGxhB1AXDT4V0LqKny
	KNHSc4pZRiR2ec3tmUd6Up+qe/NQqL6i2hDyBs334znEmdQT8tAOknssHC2pBtsXEd4tHv2Utcwt9
	ZDWB6zfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU0c-0000000FpSd-3Air;
	Thu, 01 May 2025 13:31:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATxg-0000000Fp3i-3LWL;
	Thu, 01 May 2025 13:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5pF0zRMnxqpAZiQDV2tjp1OzcmcfhmgifjwYB3Den84=; b=RD6jBeYdyI6NdHc8c+BcRx6sC1
	wYRv+O8cKAFHt/LDHeN6Qf0L2jJiSGAtBvMTFUJaYubq+l2HSoQ5YZQ9weBPv8PGy0OyVrlqXAXUb
	DlQ10tPQVsfUPBnm8N2YjE/kN7gWGxY533Hv4snOu4o1pOWN8EP0eGwhOz2cw0IdbTc/F0xpOBXUq
	7EWoYgdB7XoQ5FofLvL9ESHj7ShhmDlZigg6QZ92lbq98encWmo9U9w4KhM168tkMpWnZk1XNEilB
	6ceAZewhyyJKZe6sZSgy1rIHlnScM+ig7Fnl9ldZIfVbB9jhuuYxr1BCIT5hN+rRJueA43s5Lhp/B
	N63Gh5+A==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATxY-0001u3-Vx; Thu, 01 May 2025 15:28:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/7] arm64: dts: rockchip: add core dtsi for RK3562 Soc
Date: Thu, 01 May 2025 15:28:16 +0200
Message-ID: <47204993.fMDQidcC6G@diego>
In-Reply-To: <20250415051855.59740-7-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
 <20250415051855.59740-7-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_062824_834635_DC5BC28F 
X-CRM114-Status: GOOD (  11.67  )
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

Hi Kever,

Am Dienstag, 15. April 2025, 07:18:54 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> RK3562 is a Soc from Rockchip, which embedded with quad
> ARM Cortex-A53.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>=20
> Changes in v4:
> - remove gmac and otp nodes
>=20
> Changes in v3:
> - remove i2c/serial/spi alias
> - add soc node
>=20
> Changes in v2:
> - remove grf in cru
> - Update some properties order
>=20

> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		scmi_shmem: scmi-shmem@10f000 {
> +			compatible =3D "arm,scmi-shmem";
> +			reg =3D <0x0 0x0010f000 0x0 0x100>;
> +		};

the scmi shmem is not a soc-device, but instead a piece of main memory.
We recently fixed that for example for the rk3588 [0], so please follow
along for this new soc.

Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D8ecd096d018be8a6bd3bd930f3a41a85db66a67d



