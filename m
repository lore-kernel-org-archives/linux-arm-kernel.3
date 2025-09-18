Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbHRt1g80Tq6KxsCivdMgQCmoalxk31z9fbyCiLlgTM=; b=xIiIe0g1PqipFg0yAmE+y127XL
	vXcASad+cTr6D8v/be5DWWyxd62NefihM0BK/73DScv8KvZ3Cc2PmkNr9EgfjozcacbIQ6+LuMZmn
	IdxzgAxidO/XQCG5W8sU/AFf5DxgOPVUX+FQYURGF/jBUl+WT/CxnVtgTDnxDSEEPwxE+mJhxl7kY
	Aa5dXUeBZn+T2a3Gf2Hxrp18k23XVBfq2jrOMM2kZq2sFCp0wlt01J9C2rCI5mZLZaUXTxTMf6Qh+
	nuC6sZAhCAtuLZ9ApJkNpbX9zKbpxn3fl9KcwN01DZY26VsNxSvuk5f5PHsB4r1HW+FTQi2QLh+fe
	Z/P8jfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEPD-0000000HUyl-0CQh;
	Thu, 18 Sep 2025 13:10:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEPA-0000000HUy8-3vfo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 519E5401EE;
	Thu, 18 Sep 2025 13:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A43FC4CEFA;
	Thu, 18 Sep 2025 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758201032;
	bh=nbHRt1g80Tq6KxsCivdMgQCmoalxk31z9fbyCiLlgTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X00LWdf8Vmbatq5ziWSDyuMeuA5uxvSt/PlYi+Y50NGUn8HoFAUTK2RATLGMCE41F
	 su6J1rOyif6a6yifBnjgYrH44s0WOFkytv9JRh4Dvw/QgNVM52E9amG8PZrbyzIHb/
	 fCucCCwgHyAoSME2x91uCwbAwwXpN/+zhWNhW+B3vzSje3mhimULse2E+3vNBdruR6
	 AqVevakly8Es6a90E9YBhUxPnJddUZMoZ++STGFo4TM74QZxfuLvekGQf993vQRZTu
	 PahVawQJfirvvmyQxk6qeaSHhVs25dwe7yLqjMYEPqiSSY8pHrsIgl3SVj90sTprf1
	 1TwPTpo9gMVFg==
Date: Thu, 18 Sep 2025 14:10:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 5/8] arm64/fpsimd: Drop special handling for EFI
 runtime services
Message-ID: <19b370e4-d6a8-4a60-bc14-4adb55616040@sirena.org.uk>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-15-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n4RFNxpRHdoVFDfF"
Content-Disposition: inline
In-Reply-To: <20250918103010.2973462-15-ardb+git@google.com>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_061032_998467_3ECA284B 
X-CRM114-Status: GOOD (  15.36  )
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


--n4RFNxpRHdoVFDfF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 12:30:16PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>

> Now that the use of kernel mode FP/SIMD is generally permitted when IRQs
> are disabled, the only purpose served by the EFI-specific fallback code
> in fpsimd.c is the case where an EFI call occurs from hardirq or NMI
> context. No such cases are known to occur in practice, and it is
> doubtful whether calling into the EFI firmware for any reason under such
> conditions would be a good idea to begin with.
>=20
> So disallow EFI runtime services in such cases. This means all the
> fallback code can be dropped.

This is a really nice simplification, with the fixup rolled in:

Reviewed-by: Mark Brown <broonie@kernel.org>

--n4RFNxpRHdoVFDfF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMBMIACgkQJNaLcl1U
h9CwNgf/S4B1uo0oH1Q6yqQdYUKVpBpZ3XI7rNN3zbj+UNnKfjH6Npmjv2dKzYLT
CnFUIUbnHCo4/5jyDAI/6bcGWebEjTM8CpN5j1voWCe0aA8kaHWrqAvyrahXo2fC
BROXTJofeNL/8zOFXNtoo6ziKHWlZofFjTzQftZYwWBUQGeUA7JWGVBqs8zUhzuc
W9AjAWujXp5krX0fOut0NliQFk9sqRzGhaI2+zonHk+7MLZQAUc0Te4P94AmbXrf
T3eHYO0/jfDRGHlmUuNGkRKbUac0IZiiDZPk2i9oUNFRcjDkLByTBnTiBa9i0pae
Q6y6UxvCIZazRucK4+bMDjUbNtXC2A==
=YIPb
-----END PGP SIGNATURE-----

--n4RFNxpRHdoVFDfF--

