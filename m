Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEFCCF34AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVPpoDXSl/R6wJPPfQ1UGdHlgzCpFnf0QmJ/U/aqYzY=; b=jqnNFW+6mciOcmia9PyNiNcv5h
	rsz2FJerKEaDr0syCVbEgDY8Fnl0dk1StZ8AFRt4dmBOAmNJamg1IOVrsli/l4J/+xu7cZg0jUd8+
	NVZps+ES81Y5OocTSekla8eUMzASzcuVLhEihIayFN0Nlk4qRXhjYQ1GXNLCrjT1zzt+lD0uawGfF
	7rO7hLkA/fQY1NUtRuAzhepuivd60NWa4JYo+xzAdDxRlCGSz0lE8BHjf/yL45WrSeXBKXEWDrB2B
	viSPSCXnCdKyDNDqnUSU7mN6wETZiUw4h04KZ1RwZndCfe/wO2pKvXtRydhj+xNJ+BAwYo7m7gCXD
	vCQb67EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLj7l-00000003Mzi-1BR2;
	Wed, 19 Nov 2025 14:25:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLj7i-00000003MzK-3ckA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 315EE42B25;
	Wed, 19 Nov 2025 14:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC34AC116C6;
	Wed, 19 Nov 2025 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562329;
	bh=IPpllDroeIVWpU7coZYoVoMYcpJP+CsG5RsTB2e1Rlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1vd4Dr0MtIh/wtzlg/lZ+jLOlAaSS2YeqVNZdtFyPL32YVGB4SeB3cf85TaCENtL
	 8TKL7AiVyq4xygYKou/UAr0qndmPedz3BOdTRSz70aHaUIrFVGYICc8XQXPcka04hP
	 L31FBN+qxccsZlsu9RHDctApiuctcfbth3gLPXgH4Nn9lKIwFI3MlIqLLWYE/5rrN4
	 HnuEjEi1ncs0d6HlRaVxwDQYtHeoIrX5qV7SW3oPC+Lln/t4fLFnZC0FEaqax2L7YI
	 l59T1byANzH3fbast2y8EGqixpflUygeizHlMRljJb3rc+m38aIPPRZp6pE8Vvj3vW
	 THA/Y6/QDnHCg==
Date: Wed, 19 Nov 2025 14:25:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of/irq: Handle explicit interrupt parent
Message-ID: <71a2ecf1-a6dc-450d-8d94-1d03294746b6@sirena.org.uk>
References: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXrumqPCuqa97emu"
Content-Disposition: inline
In-Reply-To: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
X-Cookie: Microbiology Lab:  Staph Only!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_062530_923494_85E8E2BF 
X-CRM114-Status: GOOD (  12.84  )
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


--dXrumqPCuqa97emu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 19, 2025 at 02:19:11PM +0100, Geert Uytterhoeven wrote:
> If an interrupt controller is used as a proxy, it may have an
> "interrupt-parent" property, but lack "interrupts" and
> "interrupts-extended" properties.  In that case, the "interrupt-parent"
> property in the interrupt controller node is ignored, causing the
> interrupt controller to fail to probe, and leading to system boot
> failures or crashes.

This fixes x15:

Tested-by: Mark Brown <broonie@kernel.org>

--dXrumqPCuqa97emu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkd01IACgkQJNaLcl1U
h9A0OAgAgiqzeJ+/k2KHArbkPFKyn1BIrHCdXiP8+H54gFZtaofhRAabFCiSb8Qa
4xqve8UPhr+OZxKaJpSN4xPl9Xsw2/XjS+F0FzHOKHe7Y4yPZoRwsc5aZgcnS0m2
PJUimumr9oJ9BBL5/fOCYLoZB7WhgKfk9OR+0wx4Pbvw3QjoUOYqsZeKpKhATilu
XB9pOYFp3YeeGMosjOKj8MmsgnlRaXuEdDcO1nkk+yhY3jdS4j9QpuCb3oi0Yc4e
E+RLyO6wVjP20Twwg+o2QJAmBizEOuHfM1b8Jz/yoNeXSfXYaDH/8GOTY3WXGHnM
kAqWpJ4TsX/w5gr9aOxx9V6isaJ3lA==
=Nam7
-----END PGP SIGNATURE-----

--dXrumqPCuqa97emu--

