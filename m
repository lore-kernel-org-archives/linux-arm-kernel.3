Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B66C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq0tD51R8RdS2G7MP8/tMVA0OGRzm/QTEon9er2CSPo=; b=KEmx6qE2VYSjufZ1iacgcE0QCE
	ZYc2vtJlkHK/3uThktZp0rWeF4WuetAofpXqe/dwtl2Vj4ZFLEjTjw+Ypi2Hn9OCh2JCFuwWnmNuI
	X9DVTV1L2ow5gjyCq83TJ8yy8ZLcagjuzizJkw6ZeULGItNBJhN9GYVsnyxJ90orrTv8IUFHd95hM
	NfMnA1KLfaVb7HmOVXnx3pe8zP1q0xj+TiN4POb+dkHjqO7UEfhm9d0myu/17VE96jMedF+jtq0vw
	txr2CB4QsO1BH8cRFPvwcr2hc8WkosS5GDCYVb7DrEYUkncIUI2evUOHQdFVsGbFe0hyJUUK5PwER
	9/PKsS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7KT-00000007Kc3-1F7z;
	Thu, 06 Feb 2025 19:14:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7J5-00000007KUA-2Y8e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDFEAA4459C;
	Thu,  6 Feb 2025 19:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B887BC4CEE0;
	Thu,  6 Feb 2025 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738869178;
	bh=g9/g/hpUUywCC6oyxEmQw01HogHxdD6MoRuJVjntsiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktnqYp0p/btUoBkPX5EIvvqEirIqBp/Wz0b38Bh1kBQj17p/6hDw3zy368JIKput7
	 89Rqp7LxNfhNiQ2FqZBfm17aCOSvfWTwa8GAK9Oe6awvMXk7GAXHGGknE8/lD+4/yQ
	 57ppLhBLeawa+kAWYPo9r7sYA+nK92S5X5dx1a4DKVJ+PAFxYXTs2CVRse1nsUK9xA
	 kjHe3vtUBbJsYB5Wp/mphJrtoaK6F/QnZrTvZuRKIOKVg6WD+Q6fd6S9dL+K3llZ9e
	 No5a9bdBpSLXQI4R4ggKoX3h/LxsPOlZ2vbl65D8oab9VklliW2EC2kj6ik+deSR/P
	 oLE9wNyVpUtjw==
Date: Thu, 6 Feb 2025 19:12:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, eric.auger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	pbonzini@redhat.com, stable@vger.kernel.org, tabba@google.com,
	wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH v2 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <9972d29a-1387-408c-9070-d53b025191f2@sirena.org.uk>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-9-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TAjyd6cungso5X+6"
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-9-mark.rutland@arm.com>
X-Cookie: With your bare hands?!?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_111259_711042_751DD26C 
X-CRM114-Status: GOOD (  16.57  )
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


--TAjyd6cungso5X+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 02:11:02PM +0000, Mark Rutland wrote:

> +static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
> +{
> +	u64 zcr_el1, zcr_el2;
> +
> +	if (!guest_owns_fp_regs())
> +		return;
> +
> +	if (vcpu_has_sve(vcpu)) {
> +		/* A guest hypervisor may restrict the effective max VL. */
> +		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
> +			zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
> +		else
> +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> +
> +		write_sysreg_el2(zcr_el2, SYS_ZCR);
> +
> +		zcr_el1 = __vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu));
> +		write_sysreg_el1(zcr_el1, SYS_ZCR);
> +	}
> +}

I don't think we should worry about it for this series but just for
future reference:

These new functions do unconditional writes for EL2, the old code made
use of sve_cond_update_zcr_vq() which suppresses the writes but didn't
have the selection of actual sysreg that write_sysreg_el2() has.  I
believe this was done due to a concern about potential overheads from
writes to the LEN value effective in the current EL.  OTOH that also
introduced an additional read to get the current value, and that was all
done without practical systems to benchmark any actual impacts from noop
writes so there's a reasonable chance it's just not a practical issue.
We should check this on hardware, but that can be done separately.

--TAjyd6cungso5X+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmelCbMACgkQJNaLcl1U
h9CrEgf/TGgo4RVmaJxXS634U8oUIbNEIuXqOQJAqsTazdIud+hAZMt+dIaXwL+7
fNdixA7N2DycoddigmHo+3CMMWlhdqjUx+6KKg/hA/RLflnT3LyT4h/lmRgxiz8d
6MaxnP3+7vRubFCHotGBIQayLt5VhIlOYpwDikHcXAU2xWd7i0tAYqkzUivQJD2z
mT1QjZOh7Dd/AKNOH9z2PeAfEn/EsMksgzWl3p/ElBEQ2Qbyq7GVadyGn6xhLooP
UyQLxrI+ReiZj2kXHa6kez9GYlhABFU9dlz0VDUtKLlgdR2m4mC7HJ4bTWm/xuaD
6pR0opLZp/dGO/Djx6pnmvuH+ri02A==
=FSAp
-----END PGP SIGNATURE-----

--TAjyd6cungso5X+6--

