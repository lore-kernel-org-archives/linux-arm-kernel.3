Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA7C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnDe1ius/7IPe1J9ZK5g3J+Pkg+kyn/jagloz871HJA=; b=P22jIOkULMGp6VXOzfsjrxqHjq
	+ylJvqkxVNY3x92QOhdyOb9uogY+a+Vc/gJ8PcxzUbLK6UE8NuhFWms2wSPIIpA8nVOnn7/oXJSi8
	cIQCY9qJ9fZjwtXZlmKf5taxzb9L7oQl8jR/2O2HyNwdf0/XD+TT3z2J1o9NDsQ/xBItJB9lPih9K
	O5+eSB6zp/7M/gXqax/xY6h+dhtt1Eu4hYe+Sa6issA0qQMpDbdv7yH7jkMrizUp53K72zi2GGqJi
	iowRQJX8sOj8HRG6oVs/FSZFfIvdJuP9X7M5jeiaBLKt4+rxMUvCsoU9+PIOVgltOfXpGC/VKa60S
	JgZCywHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLML-00000000uJx-2iil;
	Tue, 04 Feb 2025 16:01:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLHs-00000000taV-3iLX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15DFB5C57AD;
	Tue,  4 Feb 2025 15:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124F3C4CEDF;
	Tue,  4 Feb 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738684591;
	bh=TnDe1ius/7IPe1J9ZK5g3J+Pkg+kyn/jagloz871HJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zzu2lit14QmBxaLyTMzzLyIL8FRVYfLoxbaMrN02ksXKHRLq0yf6j/EQHLfs0AsDU
	 rHH4mHBEvtG3z7at5N95S+C7V/skI+JMzRuwlzR96+cHXD9wxMvKVf2YRlStmFyBEQ
	 2orLA9ZkU2+KR2UV3PKSi52QgZMFZaEI+ERwmM0JJXrpbekWRgfhf9/pNyuoaxoFrS
	 5dyPpTVRVGFoSVMxpxTIPXzWFbLQgU7nf7FU0rqfcU4neOeZf4sK8YWpxYWhlc3Jef
	 9f3MRYpQhb3JCOhSTlZLLUu8oVjhIE41UOtJxlWyl/jx6I5vwv4hsPW7yAIZCjXHev
	 xiWad2xOhsVzg==
Date: Tue, 4 Feb 2025 15:56:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 1/8] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
Message-ID: <2b95bb66-9e83-45f3-90b1-594819cba49a@sirena.org.uk>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y9e4ZABF7nk4Lxsq"
Content-Disposition: inline
In-Reply-To: <20250204152100.705610-2-mark.rutland@arm.com>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_075632_975902_9ECA959C 
X-CRM114-Status: GOOD (  12.16  )
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


--y9e4ZABF7nk4Lxsq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 03:20:53PM +0000, Mark Rutland wrote:
> There are several problems with the way hyp code lazily saves the host's
> FPSIMD/SVE state, including:

...

> Avoid these by eagerly saving and "flushing" the host's FPSIMD/SVE/SME
> state when loading a vCPU such that KVM does not need to save any of the
> host's FPSIMD/SVE/SME state. For clarity, fpsimd_kvm_prepare() is
> removed and the necessary call to fpsimd_save_and_flush_cpu_state() is
> placed in kvm_arch_vcpu_load_fp(). As 'fpsimd_state' and 'fpmr_ptr'
> should not be used, they are set to NULL; all uses of these will be
> removed in subsequent patches.

This avoid any confusion so

Reviewed-by: Mark Brown <broonie@kernel.org>

--y9e4ZABF7nk4Lxsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiOKkACgkQJNaLcl1U
h9DSjQf8DN+GgiJZ/+8XJADu2U9fXZLUryMH+euxShM9rgJsKSrcPVeocBf0ogFy
F/oHkwZ1KJDFIXLHUmtdCw9ktJKVX5IukeV9AEe81oLQ0c5UBAwzHb5JO9Gv3dVC
izGqKFyU+D+UIaZZahQZHCm/bwK8GkDhcjwNIyNDCYoUa1xl4+46bk07dJjKJR0P
NdQBrrzoSWB3GsQ59LCEVnrKV6SNhQ4SqwxI3bwqXOwnZs6+xo5lNzp3uMhFvc1l
0botQf1eemDpMwBSA/95tUtiyfapIV16TU98KknzZBydCGCr25ep2hFazzhcvD5W
U3ZofyAsVUI09uOVFwg2tRcOOK257g==
=R/pD
-----END PGP SIGNATURE-----

--y9e4ZABF7nk4Lxsq--

