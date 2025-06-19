Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19ACC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bboCj6byfFka+J1B532yhcdurVvKneEGh/Cbxe0HFo=; b=Jq+pvDt+Q6WOJNASj71QhmlqQL
	OpLvj1jsOG5LUQtdp6GWWhqg7JZn1nTyBxM3a2vZLe5cdxnOEomhTgLheYvEPEM1fvt/2BkgpfKaC
	Y/0UzAuVnd+8Db3xa2qng//+hCqmbcHK6GyRzvaRDkZAWMewz85BxmxOi+j2b9mDr8Jfm4PPgW+go
	v3HrYQjZY3hefo96u2C9R+8Rc0wojAtbhRR4sVNlppaoAJMp+vEspzwovYaULrtoR1zVPqnowc4Qi
	T81w27B+5ZWa4e9SKzjUqLAgCKhiu/7h7dmRGmkzdwBktOpYrbDfRmBggMGzRfLdI4yDkGIuypWZy
	GDMGdTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLHA-0000000E8dH-2OxH;
	Thu, 19 Jun 2025 19:50:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSI8A-0000000DcaM-27yf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 839964ADAE;
	Thu, 19 Jun 2025 16:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA411C4CEEF;
	Thu, 19 Jun 2025 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750350529;
	bh=+bboCj6byfFka+J1B532yhcdurVvKneEGh/Cbxe0HFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhZNHa0DyKOEFIbJ8Mnj1k68s7J3KPIkIpub7CkNO/bZViEA+o86VXBXpFkihnwmP
	 SdVEpQl8pKJRhYoqljV+DurVUeD/mW8l2n35mqZFRbgW8SBW/EXoO32eCTVa3Ugu4x
	 u38iSnEtrrsD3QC5gvvIcH+T/fANa7pC8laWcayHEyQXdQpDtjErkDE+8prmn8uJ/0
	 xTFiFHJ+8uLxi3T3QYiEDOzD+P8S0SWT7r9Ox0WeHadwniboNE6y6Wfzf4nB5/7y/Y
	 ZJqjofwj3iuM+SCZZXdCexPvioXB2NfkIGGjEmjRykSBhaFlA9breE2EhHeE/gOcr5
	 o6Qo/ueOupEIg==
Date: Thu, 19 Jun 2025 17:28:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	tabba@google.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()
Message-ID: <2e43f235-e77d-4d05-a10d-d2e108c28d06@sirena.org.uk>
References: <20250619134817.4075340-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U0gCi0rRf9BiJoIk"
Content-Disposition: inline
In-Reply-To: <20250619134817.4075340-1-mark.rutland@arm.com>
X-Cookie: Reapply as necessary.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_092850_564907_0D4B4097 
X-CRM114-Status: GOOD (  10.61  )
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


--U0gCi0rRf9BiJoIk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 02:48:17PM +0100, Mark Rutland wrote:
> Historically KVM hyp code saved the host's FPSIMD state into the hosts's
> fpsimd_state memory, and so it was necessary to map this into the hyp
> Stage-1 mappings before running a vCPU.
>=20
> This is no longer necessary as of commits:
>=20
> * fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/S=
ME state")
> * 8eca7f6d5100 ("KVM: arm64: Remove host FPSIMD saving for non-protected =
KVM")

Reviewed-by: Mark Brown <broonie@kernel.org>

--U0gCi0rRf9BiJoIk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhUOrwACgkQJNaLcl1U
h9BfXAf8CEVlQAbx2zRr6BRtddp2YrUbZsbCkQ+RlV52H3ERQHfezJ9TNRTOJmOj
0JTV9ggA4ey8zLuo02EBn5I+85WBPZGumueIDOFTGYxxqK0ccEJ3G1PGsovmR5KM
pk6do3W46nmYtQO1DWVwWg/DEND3Z2YZB7IWspbU4+PRwRJTyFcPr7q034KgxvQS
gpxQT9h2vHK7a6t2mJJOWuwgtS0DgL+UcMdYDw7W4DIMTPPvtGyIZ34VEfMs5cxN
zvzYL3NfyKa7ajoV5rJ0hUL1weC+CqGZ0QMlUGmcluwaTo3pIMBRWyGBfUItLoeK
1XZ2S4UBSLlTpG4GdbXhXxL0hZ1pgA==
=p2k5
-----END PGP SIGNATURE-----

--U0gCi0rRf9BiJoIk--

