Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7D9CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIMivEV3Nh2W0oxYrCsqbjYYz+Sf2wo8HQGyWhokcaU=; b=a2gFocGokMbn13xAAzEOxgLbwM
	mgFq8m5sQ/Ib2cvdYysx34VqhNL9qjBU4VABzhJXJGLMEKGWgvzuxFAQbTzbepCsX8ZG/uoWk99mb
	ZI/ymNpuY0nC2hmeVa/CEPonZZz+i+KL0kuDwSOl6r+Ffga/36DNhVBAkcmVXybM6V+ui8jEvBZAZ
	pPBCmY7iVBzuBWTyhnmRAiCEu8nXCrFIQharbIjwQy/npIf/htZocm+1IAbwRV69QdofZys3yeIg3
	ygPbEaIjgN7b2Xr4Hjtl9BoyCe0uPo0u+fHhQd5USujzNki/9V5Luz0/zs4/fA/HEfxXBxt8s8Ntw
	t6zBXSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRthj-00000002NJ1-1gjv;
	Tue, 26 May 2026 15:28:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRthh-00000002NIC-15M0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:28:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 770CC43A76;
	Tue, 26 May 2026 15:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C8D1F000E9;
	Tue, 26 May 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809304;
	bh=FIMivEV3Nh2W0oxYrCsqbjYYz+Sf2wo8HQGyWhokcaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JXyk0oSZqNpatobm0MR5n54JsEdstKnh9wO70R33+NJzlEo2MlVLc9VT9BH1qnjH2
	 5AeckJc2Hbj28J6Frq9aqiUmHtASf2aUeXGNac6xBMeI3fXNyN7BJFAxg81lI4fNVA
	 YgMzLqgjSfa8y088FwNcTw8uLDB628jN9xtJUunBX+eao2Z7IBnpjLkr1baXanhRzi
	 ejGcAZQ91yaQHvQcXBFRFFOwZpIs0+7P+nZc9a5HXajtfXm9cZ+Ye4X2MlbYa8Q3HW
	 NyybykrnAai9bV76BjXF//WBdmbn2UaGctr80bmQ6J6vETrn3XIUeDD5Lv4NVm/VdL
	 jnfVgSYBF/TAQ==
Date: Tue, 26 May 2026 16:28:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 05/18] arm64: fpsimd: Fold sve_init_regs() into
 do_sve_acc()
Message-ID: <82fb3210-b31f-434c-b356-5248336cec36@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-6-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JGsvmQUd9gsf9JMd"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-6-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_082825_322620_5F9ED6C8 
X-CRM114-Status: GOOD (  10.76  )
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


--JGsvmQUd9gsf9JMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:43PM +0100, Mark Rutland wrote:
> For historical reasons, do_sve_acc() is structurally different from
> do_sme_acc(), and the logic to convert the task from FPSIMD to SVE is
> out-of-line in sve_init_regs(). We only use sve_init_regs() within
> do_sme_acc(), so it's not necessary for this to be a separate function.

Reviewed-by: Mark Brown <broonie@kernel.org>

--JGsvmQUd9gsf9JMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVvBMACgkQJNaLcl1U
h9A5KQf7BZyrT+StkmsDpxntAFs4jlvLSYIE6E90OSbtpEsaDQtC1fBac43iZG7d
6xT1M/y7huO3SbduOP7Ww2nBZgNoEoRw6ezdI8wBwuMc34E0Ug6Xg8XnhaWxRtiR
6MCxLVZpvU3BR4Yuz4j85N+qVlTAkbuXWkm1B3/2C+FuK9ZPuUngIwR7688CjzPh
xFOnY1HEahmsssFXEtzgzEzjWY/P5pfsiVqzzDKJiw1Lo0zoD6Uk+hOq2uy3GWhM
DF4Jgnag4wCVZhGHMRggtFZTevGFAuvHqhdKR/TPVZC625ZbYeaac/g2/Ipvr+lI
s7JrjyHUIZZc8xeMP4UZUUDK7+12Dw==
=DpaJ
-----END PGP SIGNATURE-----

--JGsvmQUd9gsf9JMd--

