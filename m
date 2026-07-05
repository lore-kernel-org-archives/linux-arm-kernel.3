Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rCe3IJiq/w2EFrF4fGo1iuA4FaOPAQK1+phS8J4PGA=; b=3SrCRQcXpXoJL12sUPOpHzfTSO
	+HG9chL1TACCEwyYF59cx5H4VWtBYYkneEpqv9AzGuCdGkfYwguYYL2yu/hRkfBC1R6uMGoaPTXzq
	i4RVZ84hbvJCI+zyEkbK9Qe+/EWZ2AuQct9FDSoqjMVxG0gV7N5A63OzRO3HYkox6AgxA+srxS9xV
	C9o5eawnXn983HnHUVq4fiDYTZxw9PCdpDwLygQzqBS7ahd4s0Rla/Kc44cGX9b5W+RWsZBH6AX72
	1NeyGZGtIeU8hDuZ0cC2Wtn9myMuX6tU0xF9qNQRE2bx2QEnqbjjLmR28OMn//fmAKGIS9hmEItAR
	stNlcpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNyv-00000009Ohh-3e6i;
	Sun, 05 Jul 2026 14:38:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNyu-00000009OhS-4C30;
	Sun, 05 Jul 2026 14:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2402561383;
	Sun,  5 Jul 2026 14:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4DE1F000E9;
	Sun,  5 Jul 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262283;
	bh=4rCe3IJiq/w2EFrF4fGo1iuA4FaOPAQK1+phS8J4PGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l+U4h6weTEU/7rdUooiwRpJMdOB2D2eY55FdKkJ9Tcheom6mzuYDVErgBnNyQ9nuW
	 juZBRd/80Ct/xwLq6mX2vgB1wVPYSMsaiMDRy/zTmpkL0sbf3L+pXe6MtUKI6q+8S5
	 HJ7u7913fhzU6L6CXVSW77cqcJSIdipmrvRONPa/5qDUN9IAc+QLsrjeOtk/52ewuk
	 taVeV/zSpc1WAwap3uhM2z8rqv+WWyT0rA2YO/ikn/E/c8uS5/u70RVo3fxA43O52C
	 nmdOiEXqQFRffzFB4uwKJCC7S4Ghg2H+IMJIr2+ilYWPscguvK05AMP4Jh+VQ7B0P9
	 xikfCn9hG9crw==
Date: Sun, 5 Jul 2026 15:38:00 +0100
From: Conor Dooley <conor@kernel.org>
To: LemonFan-maker <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <20260705-matriarch-epic-37add5cb97b8@spud>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
 <20260705-palatable-hardening-48f73a84244c@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AiyjtgLGtmtocOb6"
Content-Disposition: inline
In-Reply-To: <20260705-palatable-hardening-48f73a84244c@spud>
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

--AiyjtgLGtmtocOb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 03:37:00PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Actually no, I just noticed you're not using your real name/a known
identity. un-acked until you sort that out.



--AiyjtgLGtmtocOb6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpsRwAKCRB4tDGHoIJi
0iv7AQDlI/S8W/uC7NLohqtnaUzRyTEyxMjx5+TZHoEo+08voAD9EAEe7olwNwvE
kZGcfmUBU9zm6Zt4/tB/cqelxRH4iAs=
=h9QI
-----END PGP SIGNATURE-----

--AiyjtgLGtmtocOb6--

