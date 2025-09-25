Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E2ACAC5BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULdj9AHVTVpUuL+Js997kCg/tbr9m/L8H0ggaLUQtLQ=; b=1zdsOJ7jk0F73Cgr20gMRBTlE0
	T+R9Qny+DWs4PyTDEJEsAVwBKEEPAj2gcfUjX27BK2N3fsRew3XFZwFy8qA8HqY47pyqkdsUwdTlW
	/1fEpm1C65Cn+0KUK+GNzLPJ5Lu/ooHsSiPq96zDoOZiZv8hsk80q8HNiDfLkW6adPKEYN6fbP8Th
	EwVAIRHd7ajkZ2ZDgzu3ms5FNEhp/it6HRffNwLTKYrwNv2A3gIjB/h+MEogCBuBuitcPVDugC+MU
	kwSv0Prwr7L1aJSwNb0sm9LHRlM+3QaGeGbcClPyNNxkwgamgtXP8LcYYOCk0lJQP/5Dhu+m/uRjH
	azCAhbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ria-0000000CLkI-32uw;
	Thu, 25 Sep 2025 19:33:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1riY-0000000CLin-3tgY;
	Thu, 25 Sep 2025 19:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 238D943AAA;
	Thu, 25 Sep 2025 19:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098BBC4CEF0;
	Thu, 25 Sep 2025 19:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758828806;
	bh=ULdj9AHVTVpUuL+Js997kCg/tbr9m/L8H0ggaLUQtLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHmrWuBbJHzQ74ps0zJVLFpRkbvqo8HdBGh/idwWHcj9fRBvwI3JCWIP87+BoXow0
	 SATGMaec8x/Eo63KNklGFgMVwZzQaZ/RHVXOVFhLtJoTItz0UNjk1A/CO59IwdKLWz
	 6w5DwoJdmjgpG1aN2jgdLsc8YPhpGYLI4adK/nG8X8dbyBmLCEy0D3DrVZtYOHU9uW
	 8x5lxfYIktDfBqytkYAlk0zSrrPdZCXdKIzO4/H71v6CwWqZNTa7jRfnMjSZF+3q3M
	 4dKnXTIMgqswyeX1BPSyZUyKTxqeGmU+1NO2QZi3plmv0N8cduVySWCrptD/1FJU9K
	 n+ZCFOl2Hrceg==
Date: Thu, 25 Sep 2025 20:33:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Liangbin Lian <jjm2473@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Message-ID: <20250925-print-defog-992c12970b37@spud>
References: <20250925055906.83375-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cd5RNYca77adNE/E"
Content-Disposition: inline
In-Reply-To: <20250925055906.83375-1-jjm2473@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_123326_979909_349F33E3 
X-CRM114-Status: UNSURE (   6.93  )
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


--Cd5RNYca77adNE/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Cd5RNYca77adNE/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWY/wAKCRB4tDGHoIJi
0oTqAQCMVKxXz3Gt+ub4awEIlatM+y/2A5HvdEHQ4K5VQOfQygEApi9RY5SD4YUH
o/Sh1CDbdRCzbzfnSsibcBzFSC75/wU=
=kd+z
-----END PGP SIGNATURE-----

--Cd5RNYca77adNE/E--

