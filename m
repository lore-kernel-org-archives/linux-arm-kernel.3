Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB22C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHQQ72WR0uJaCYKSMFe0s4zfbhTKw+KEo8c67zUoozQ=; b=XR3I7jQQLXiaJT7bw3GikUyKz5
	yum/e8ZYTSReh31SEdDcprOpsitWh9lVPJhzu8uczucC6NkDenUHhDm+PLd+9Ys3Dgy1OT+4c0J4p
	jzRocWrrd8QYMG+Ba694BX870Ur7oaA6Cu1oWtVV3lbazoCzhvneobkcPD39u8Xna56i7gbOAfuVj
	QILQhIOQfssJ8sESdWFHBqcypTFicBtwTgBoZkNnklWd+vnmf8VihRGFfR6WdCo7UaTB2pxA8sl/n
	LyJrKXlwn5hQjtlumGACA4L8++rjxFuYS6rsMX8Rx/sepL7OOn54JVLNItaM+vW9PnaykUpfit+QN
	G+yQ9Tjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLM4-0000000CgiM-46is;
	Tue, 20 May 2025 11:41:56 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLJv-0000000CgIX-3TYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 11:39:45 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747741170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IHQQ72WR0uJaCYKSMFe0s4zfbhTKw+KEo8c67zUoozQ=;
	b=AoqykRfGY0eNCQZe3pCtucLUbH68xSCZYcf3tGww1k2ClaBe+2D684FSiAgrlzUvmz3tgV
	Uw+YIrjBvbQwnjaJEd8lo43Jajl75GPwqBu3ud+WKe0VdbC8GWvKOgTypBKOvJ0Tzjg36f
	/dJ9+8ZMtGBXieBs3wpobQ7kyz23IaCZzhpnOlCDfrTdsbR3Lxilt/Kwqmed94GObnEn14
	8TSDFjBuH3AnyoM4AdRbQeFZNMB7RbklFaE1CycjsIBnDSe1b4HpZ1Y5igJT2tDSk1FJ92
	iOuwkmr2RjIvNhGoARaTAc8k4IYIv1q9dUcWrKkCMd/41P11jN2BmOqi1KndUQ==
Content-Type: multipart/signed;
 boundary=d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 20 May 2025 13:39:18 +0200
Message-Id: <DA0YJ89890ND.3NKPS3RWC012P@cknow.org>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to
 register definitions
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Yao Zi" <ziyao@disroot.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Frank Wang"
 <frank.wang@rock-chips.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Shresth Prasad"
 <shresthprasad7@gmail.com>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Jonas
 Karlman" <jonas@kwiboo.se>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-4-ziyao@disroot.org>
 <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org> <aCv8vRu8gjrvK8wr@pie.lan>
 <DA0UO4TYFWAU.DOE3O1UBNN6U@cknow.org> <aCxjqDr3VivDCrBx@pie.lan>
In-Reply-To: <aCxjqDr3VivDCrBx@pie.lan>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_043944_016054_2C9E9CE0 
X-CRM114-Status: UNSURE (   7.43  )
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

--d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 20, 2025 at 1:12 PM CEST, Yao Zi wrote:
> If putting RK3528 at first really confuses you, I'd like to add some
> extra comments to explicitly split these two kinds of register layouts
> apart and claim they aren't compatible. Although to me it's somehow
> obvious, as most definitions are prefixed with either RK3528 or RK3568.

No need. This is just another PEBKAC issue.

Cheers,
  Diederik

--d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCxp6wAKCRDXblvOeH7b
boWnAQC5MIhxImiAlK1tUu+xrN+HsDpoKbj77BWe5c4WxhafxwD/Ulo4r6l68aWF
xF7+bQnpCwX2RacAOaELrsdy8/Z02Qo=
=ZrQ3
-----END PGP SIGNATURE-----

--d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd--

