Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BFFCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF2VkmBRsOzuoyFTDhFxGgzmei/0DrD0kJUmCM8GHXo=; b=mIQ/wG+zeDYeCMQd/ppBIllaZZ
	Qk5ubuR61nLkWFYx0L/RmnlVQFpNXoLUUjegKHqNhb1DAmYCDSwyqzh9oLyFfN/5mJ71C7ikItBEg
	L2NbMqs1+u1B67AOEFUCDUB5G8Nak/MinRhelydvFvA9PHQyWvmxbU0GTWsV+uAeUfuWUFr9jjvgi
	TNxrNrmeaSBXDfvLglSdX7xmy3w1esg9k5dY2TPOZLhyplJs9/RT6ZPZ1vNz0qJWv0zGJlJ8ou14X
	IPUGWuMtVXClK3x7ORCtd2UsQ5tLqWPsGiSZrAja+3/izhmxokGC6Va2llO7PFkX1HH8SiRfxFVE7
	w9UseaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdvN-0000000DBjq-1cR6;
	Tue, 13 Oct 2026 14:56:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdvL-0000000DBjZ-44zP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:56:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26EEA602C3;
	Tue, 13 Oct 2026 14:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014B71F000FF;
	Tue, 13 Oct 2026 14:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903374;
	bh=YF2VkmBRsOzuoyFTDhFxGgzmei/0DrD0kJUmCM8GHXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2cAR/jgaFvnqz/+ml4gBaPFTnsa5gwroTiOohvWU86l/GfUyk6Z6537Lqoy5lZz4
	 uALtttTrmkEn1wiXh2Hyq6rRithWs2EXI9NxdtPammlZW/rv6JIUMMDbD5vPpcbB9b
	 dHHf60eNDwATIIjbht6BbUQzJbWt9PhSq50EzSpK4Ftafq3nyMhyKH1IUXPNr+I4dX
	 /xSG/Ak9PzF3BKhbIFKZoPW5CTZY6jSjeDz2fc1Ze3aoPG6Q8YNxnp+NaZeBCWOcNO
	 Po4nr0oXW1DGpxdJDn0yB/exYR6eY2O4Rsj2/MQmw4w0z0JQWrtoauJA9OfX6Abi8t
	 5ve6Av9oCu/AA==
Date: Tue, 13 Oct 2026 15:56:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: sysreg: Fix the names of two misspelt fields
Message-ID: <a2e3bd65-f374-4d37-af0f-893308d06892@sirena.org.uk>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
 <20261013130247.4135515-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sv3KlJBOQ6zDEouw"
Content-Disposition: inline
In-Reply-To: <20261013130247.4135515-3-fuad.tabba@linux.dev>
X-Cookie: Some equipment shown is optional.
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


--Sv3KlJBOQ6zDEouw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 02:02:45PM +0100, Fuad Tabba wrote:
> Two fields in the sysreg file have the wrong name. In DDI0601 2026-09,
> bit 10 of HFGRTR2_EL2 and HFGWTR2_EL2, which traps SCTLR2ALIAS_EL1, is
> nSCTLR2ALIAS_EL1, not nSCTLRALIAS2_EL1, and bits [39:36] of SMPRIMAP_EL2
> are P9, between P8 and P10, not F9.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Sv3KlJBOQ6zDEouw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrORogACgkQJNaLcl1U
h9BU1wf7BE2VjyOr8aFe2QuONbWs8JFIHDIapTog3Nkys38qJkUOPcdiY8BGlq1J
7ygK94Z+FHYVx6oOoQQNcPASntkrde2wYxRzHOqPD/IfpljcPO1JfaLLH04N+F83
9BYsZbxdnZLNBCzks2jSAPSKN4e3GLu7YpehOrwnlx80hm7gLQ8fwp/T1l39zwx0
vIoqMM96mB03rMTmQTbmqTK7XCpyWn1iMcaXG9YPywDLZHgzqG/893p2zvsGvXEP
esx7M5MVnVWLqySDkd503wNp6lfT7WOhtDFmjRRBuG0N3HkJUuMzUU0T6acRPj89
gWqE0kIZQbs3r8/iiSS/F1bo1W98Zg==
=P7Fn
-----END PGP SIGNATURE-----

--Sv3KlJBOQ6zDEouw--

