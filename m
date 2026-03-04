Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B260EDEC01
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96lQsWqDKySGJZInYDPP1iz7MJpHJVtnNEeUPS7642k=; b=zKf988i3JHRKP6P3GgE6Q14Xa/
	K0qdXqC4+KYaK1+72jnha5hQMMvNakHUie+GgZVEeR/IB7ujVOKSuFua8B7hwyjI1Bpw1tm3VEaA1
	CWw6XcXZ5l0D2XG5yPE5ICMKtv76DqKEnwHicfFWM6B16M9NBARsPa6Poxf65+Fe2pYo4b1oamFBx
	OIcRCDyg9zLWqIfOn2KlQCLdIq9znfLddkXQE0sa9PGOEjsO2DnQ+ZOXj+QssvfCfpoPRojxgewvY
	lRgF53fMTiacgk02NFhuAb39YUNzxjsFehgSWxhledfPvCCEX3JCSq7j6hwqyZLpf7/MnlQE5Wm+w
	PDCWqJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcAr-0000000GJab-12Wy;
	Wed, 04 Mar 2026 02:41:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcAo-0000000GJZV-3c4A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 02:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772592076;
	bh=96lQsWqDKySGJZInYDPP1iz7MJpHJVtnNEeUPS7642k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lHZfQy0/G6rk0rkPwPdvfIMI8Mh7+Ivf/8PBeFOKXWFLcoeCs1/pU62LFbkvL86T4
	 Kgpczg1MfdW81pTAR7H7ttfWH/VN6iYywfBC7RZebRac3dmR+RP3LlCiA41OvaunC+
	 iiSL8gjFT9D3OdB1lddQtX2+RsKE6/jshGjIngquVcWENpoOvOQjcF8reYuxAEFeiQ
	 t65g1VTuB1sRNVCsKumnK8LktMFxnYtPbMdJV/CMD45q+LwkUdUDN+TiHn5CxRsKF+
	 u9n5xXefWzjABKeMO+fN1xFgUO4esLN/h4PtY99OUkcZpaLAKaVtmRyOV52uZvA57L
	 ++s8Xtj003JuQ==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DBB16000D;
	Wed,  4 Mar 2026 10:41:16 +0800 (AWST)
Message-ID: <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/8] ARM: dts: aspeed: yosemite5: Remove ambiguous
 power monitor DTS nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>, Daniel Hsu <Daniel-Hsu@quantatw.com>
Date: Wed, 04 Mar 2026 13:11:16 +1030
In-Reply-To: <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
	 <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_184119_097114_F8ABBDE0 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Kevin,

Sorry for the patchy replies so far, but this series bothers me and
other priorities keep bumping it down the list.

On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> Two different power monitor devices, using different drivers, reuse
> I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board variants.
> Defining these devices statically in the DTS can lead to incorrect
> driver binding on newer boards when the wrong device is instantiated.

There are effective methods of maintaining devicetrees for variants.
Why are we choosing to remove information about the platform rather
than use existing techniques to properly describe them?

>=20
> Therefore, remove 10-0040 and 10-0045 device nodes, and let the driver
> selection is instead handled in user space by the OpenBMC Entity
> Manager based on the actual board configuration.

As a separate problem to the one above, while you may run OpenBMC on
this platform, I'd rather keep the description abstract. We can finish
the sentence at "... is instead handled in user space" and remove the
rest.

Andrew

