Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A5BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEvxlqsyTmNECKRwe/uPR8xoMybyjnrRSPs3JRmvUAI=; b=0s4QoYmD49gZayVKzNoQq8aEfD
	H9LMdVrvggxrQKt+V7IYeoYuIIHff0D6iKHB0jdJTgLJTzUuSqfynFWWwKF4l6e9vbNaqqvCNGwfg
	TskXk2nyvsGUIGbcLanm3RHisnPcbzO+QyP0d9U3IWv1jinwoACkMevwQbANa9CHFYjXv81AVM2LI
	sMLfUl6rCxqfWHR2VUG4H5CVVGKjPsY+/cYxiXeH35jeAR95Rfo0r6GayLrKOKJzSUZRPaE3byL7S
	hSLxM77YRTQtliha/SEGQTrR/fHPQMk5RES+4Z2l/aUlxW7LBN3+lHjm38gqBV/u1gIq/zpqF1ANO
	0JvwYP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrS1-0000000203a-3N6V;
	Tue, 26 May 2026 13:04:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrS0-0000000203N-0JQZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E19E60220;
	Tue, 26 May 2026 13:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7D81F00A3A;
	Tue, 26 May 2026 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779800642;
	bh=HEvxlqsyTmNECKRwe/uPR8xoMybyjnrRSPs3JRmvUAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nPF55JO6w5h5C/TaRDm2keGPMbJvxrLdMeKQPE93PvJYutBDzg48JgTG3CZs99G1e
	 +onWqeo0r8VxwJHwWEuu+VGE5r9bs2XbIr5i84So1UMiQarW+H3fPeuHmmuu3mTDDv
	 h1WvzZi/PP+uGaHi4nAf9ce/EFYzUVzi1GehqQZRI0ut0SxamFXW5Ez3tZ5gseOtKs
	 2WVuGFTBkPtIKNKbkFIDoBSkkJm8NIyEX+/e1/o2ftGfjVyosHtYRJ2sWCYVtvfSqq
	 dBfKHyaFyj7DJVYNttgx3He7RhlHE1Ojr2ez3KVOy8vZtcO9ZQ/GA6J1oaoctvHe2T
	 K1cTQW9UjI+HQ==
Date: Tue, 26 May 2026 14:03:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Preserve all guest ZCR_EL2.LEN values
Message-ID: <f19c8c47-049c-411a-8857-23f9d4b9644f@sirena.org.uk>
References: <20260522-kvm-arm64-fix-zcr-len-nv-v1-1-ec254e9078cf@kernel.org>
 <ahSWwl-uCv4ZW-nE@J2N7QTR9R3>
 <b4fdceb6-5fa7-4829-a60e-6f80f47f032a@sirena.org.uk>
 <ahWMByoIme6_oECX@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UWNnr8DIiQaPll64"
Content-Disposition: inline
In-Reply-To: <ahWMByoIme6_oECX@J2N7QTR9R3>
X-Cookie: You are fairminded, just and loving.
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


--UWNnr8DIiQaPll64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 01:03:19PM +0100, Mark Rutland wrote:
> On Tue, May 26, 2026 at 11:19:38AM +0100, Mark Brown wrote:

> The part I asked for clarification on was:

>   AFAICT, none of the values for the SMCR_ELx.LEN and ZCR_ELx.LEN fields
>   are reserved or unallocated. Thus all the bits of those fields should
>   be stateful, and a read should observe the last value written,
>   regardless of the effective value of the field.

>   [...]

>   Either what we're doing is wrong, or the architcture requires a
>   clarification to say that values corresponding to unimplmented vector
>   lengths are reserved.

...

> While one simple reading is that all values must be preserved exactly, I
> don't think this watertight, and I think while some people will take
> reading (a), others will take (b) or (c). I should have spelled that out
> more clearly in my initial mail, sorry.

I see.  Given the general tendency to brevity it didn't occur to me that
options b or c might be a thing.

FWIW the restriction to powers of 2 was a revision in the architecture,
originally all values were allowed, though it's there now so the history
doesn't make a huge difference.

--UWNnr8DIiQaPll64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVmj0ACgkQJNaLcl1U
h9DbOAf/Z34B15RCo4mOt5gqqkgQ1qJbo9UyQ1alSgvytcUDqofmlWtrLBnMpVQB
+mZim/avIladmn5lMvay6phlVVvae4D/urnilCXE2UqXGpxoLsv/Q9FGsnroSSP4
C66VxFfO7fmHovLvznxiUoxmQAYl+AHI07GP1n597Na4px3PBMZDdcwL/c/W2akV
MUnTdL3Zf/wrInO0SUe7LuOsM1JPDV2rFZ8kfiFm6d4Kyi52BxgofELk5yltbli4
MFby8fngVmIRQJj9ByRrQI4Ma9SKohLYmpbv5Joxv/3ppCfRKHXrYlY9B2Wfp/+2
VvhK1oomwNO6jgCvzodrsiCHMIkZtQ==
=eYvr
-----END PGP SIGNATURE-----

--UWNnr8DIiQaPll64--

