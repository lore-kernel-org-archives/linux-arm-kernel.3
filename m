Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3A5CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXfMXr3ofUOe3VvzGuzi9UAal6HoM1qfiOVecqu93hE=; b=Wp96mQCKHDe8soLGjEqrFKn7hr
	UrilhCuHxGyTv8Vp5rJetMIVJ0TI8qr1SaKtIZZ+7rS4KCaFa7PtFn/beidWAF5lWsSCoxfmGQWlX
	jbCRx1uonnAXJ77I6Kl0l5E1w84rRKXQ90ATJkxZgmbMcJ/nL4dsUTJE+SjcnzpUcRKx+BPRec+r1
	ln2Ya9RL5seQOyq53JifHJA6RJfyfoOgSh4xyzOIiAg19yIupvSVnE7xyCzXc1Db3uCMvwAIAobPD
	wl0GifXk0TUk1cVx3DtTarjvkx+qp29X8ofcGyDt/8xxBo4zv75drC4u+3K87r5LBaqNnp4iBRg64
	ehfo3zMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGctJ-0000000D0Z5-1R3Q;
	Tue, 13 Oct 2026 13:50:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGctI-0000000D0Ys-2hCt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:50:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FBD940F8B;
	Tue, 13 Oct 2026 13:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224811F00893;
	Tue, 13 Oct 2026 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791899404;
	bh=TXfMXr3ofUOe3VvzGuzi9UAal6HoM1qfiOVecqu93hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXdrPtbTeruVvXdwz1f7Ja2lJmGRQUiieTfUMe7Azf/gdRWuFqjDqSv6uxfZ0K9pz
	 1FnoqtugJTqdyCtB9LMtNPBjJMFhmbYg6jrYT0biaip/jCV98PT6iMlYx3INF7KW19
	 kh2RojDpTusZitvbuDYwQOXEgh02sjBcdPmOlqnlfn0r9A4+F14R1dG0JBGPNHaS+V
	 yxcF6yg6g33y/iW5b8JtO58L2xgX83jgB2z6Kpxtjh6+rFCjzUgOv1CNuoh+WzIT4j
	 37fl4KgCRkNpfcg70U5FngeOPXPM8bN/TgSKXJbxU5Hfg32+yvTiXrUuNfGzyCK/0q
	 YMrG9aks7K7MQ==
Date: Tue, 13 Oct 2026 14:49:58 +0100
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
Subject: Re: [PATCH 1/4] arm64: sysreg: Fix three incorrect enum values
Message-ID: <92e5b67e-f6cc-4b33-90e3-cf884ec22452@sirena.org.uk>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
 <20261013130247.4135515-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rq/wb53K3Hf7A56N"
Content-Disposition: inline
In-Reply-To: <20261013130247.4135515-2-fuad.tabba@linux.dev>
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


--Rq/wb53K3Hf7A56N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 02:02:44PM +0100, Fuad Tabba wrote:
> Three enum values in the sysreg file don't match DDI0601 2026-09.
> Outer Shareable in VTCR_EL2.SH0 is 0b10, not 0b01, as TCR_EL1.SH0 in
> the same file already has it. Thumb-2 in ID_PFR0_EL1.State1 is 0b0011,
> not 0b0010, and the M-profile model in ID_PFR1_EL1.MProgMod is 0b0010,
> not 0b0001. The spec lists all three old values as reserved.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Rq/wb53K3Hf7A56N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrONwUACgkQJNaLcl1U
h9BuKwgAgS56Wi0nmWiVjRhDGQik+UBXmwru+1ZVErRWBA9lQxoSI4vVjJJs1JeT
dCPPFb+FaOgp61UZnGzrhcKdSThI8CarEFoDCFyN4kGrD885duYRfClVEyQvQsCc
qccF1GGfUb/TFH4N53KsTKfP0IPt1YfhCrDMH9AzC9g5wsLXIUT792aTohpj+Drp
gP6gHbFgrxTpJl2VMsJuPxmfaeBCfe3vuHTykr4osWoMLNvGMmznXgTSHQMCKkd0
+nhFO1tBKzuJzR69gJGSHuhFwnOvMS2nGT3gj5CV22avixVSQeHQiIe4hUzLzdnH
eVXFOXiatDUXebtvulL35tcX9yX5zA==
=9+f6
-----END PGP SIGNATURE-----

--Rq/wb53K3Hf7A56N--

