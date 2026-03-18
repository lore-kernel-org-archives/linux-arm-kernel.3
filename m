Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADABC10775FC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LijZ7L6fB2rSMNpU2gTYKZIPfC5k3qwsDo0+aOYEh8I=; b=o+ZfJXCTHwnAjyd6XlWv7y1Sun
	wZcQz9tp4ho77VbkZP9gfdV4+M5myvOn+j1YYah1r8/5HRYkAl+t49pLWtp5V6BMuAp2uEhe7bpmS
	VyheXnpwG3DkdOP56se/zyo0srPCCaQrnFlv6HCxev8a0ovuWlux8z/AOZBshxOZMhuFuz1qOTNVe
	nVYp/RFewXMHJzgA182cmLzDDAyqG0Ahl9bsRXu4OvxtfURlMArGxrZ3HEJBQeAC4SwREU/7GiHi1
	WTBKG9Myx3L/b0y5OSKUfp/5kLvLcBL7mgJsEl3NjOXyoCTLPWumpTKpj1S1l1ar9OMF1HzVXlbMy
	nkCr6Tvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v2Z-000000097Uq-24hz;
	Wed, 18 Mar 2026 17:50:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v2X-000000097Ug-4AHU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 17:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LijZ7L6fB2rSMNpU2gTYKZIPfC5k3qwsDo0+aOYEh8I=; b=WypdKfs5mgPm6ijYJSf3I+Qa/D
	P/6GKOpqxoXY/sK1Ymg7+xy/NAisWKZ0iEX64yRKnt9/Glje47Pvj7O9eZN1oEu59JqpEvOavNqnu
	XRvWoGT3TkA+PyhYlasNJ2xqew2Lyus9HhXwF0JLEBzGKIOYZgaYhdp0vIOSoJ1YKZ5qRv+w3GE5j
	O6utYCNZtfpLoKjon4QLk+iDH4AfdUJBbnZHA/0GhImLXyNqz5Awr0EtOnT1bq/Kuq5tdJh+RZtMT
	o3AbOnp+P2iraa747Vhku1BDGEbDg0GLr8tGNpXGoJfNWUmmq5i3CKI3Ws4F3wcouQhdOqXtDp2nC
	q3NhakaQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v2U-0000000BwOm-3M8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C322418D1;
	Wed, 18 Mar 2026 17:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF59C19421;
	Wed, 18 Mar 2026 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856235;
	bh=yY5/7b9upughYC3SjZivmgk/LeNfjtglZwOe0Pmiuss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFzHOehqxPUBE7i33A7/NP22cW2clKfq9HsIUn7W7o4UHr7O9Lz9Wmkw/PPf2wkHI
	 ctC2BWjwX8axh8JicFZcyV9D2zPPPewV92QGVgApK71nEBzHnSzVhqy5SyaEanAh/O
	 bJULBoZWTqa8HIoOjsslsg4nFfniEa4ws77JYIoBhQvx2lVojRQOCfL5bDv9mQFzqq
	 6qv/h0sSEjO0+6M9lbDW3+Jocwxh4Ql5eBhtCdOtvdVaWuHUOMoiUOaTkVPHFsYE2w
	 XZjZisZ+6yJKDaDv9yzd0hbYe/9omcj4qQBJmjYPH7uBxxJvrrI8U0JZ8QjkU5JvNB
	 SeJTkOn/TCowQ==
Date: Wed, 18 Mar 2026 17:50:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Jean-Philippe Brucker <jpb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 09/30] KVM: arm64: Define internal features for SME
Message-ID: <4403381b-c4a0-43d4-8b24-b0d0c1e75d24@sirena.org.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-9-43f7683a0fb7@kernel.org>
 <20260318174410.GG2390801@myrica>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VvvcpSFxAc69oYKR"
Content-Disposition: inline
In-Reply-To: <20260318174410.GG2390801@myrica>
X-Cookie: The coast was clear.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_175039_099072_57F3920D 
X-CRM114-Status: GOOD (  14.65  )
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


--VvvcpSFxAc69oYKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 05:44:10PM +0000, Jean-Philippe Brucker wrote:
> On Fri, Mar 06, 2026 at 05:01:01PM +0000, Mark Brown wrote:

> > +#define kvm_has_sme(kvm)	(system_supports_sme() &&		\
> > +				 test_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &(kvm)->arch.flags))

> Can the GUEST_HAS_SME flag ever be set if !system_supports_sme()?  Seems
> like it depends on KVM_ARM_VCPU_SME feature which can't be set if the
> system doesn't support it, so the system_supports_sme() check is redundant

It can't be, the reason for the system_supports_sme() check is that SME
is a build time option as well as a runtime one.  If the kernel is built
without SME support then the compiler can remove the code at build time,
the existing code does the same thing for at least SVE.

--VvvcpSFxAc69oYKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm65eIACgkQJNaLcl1U
h9C7Xgf/buA9UbqSWGotQIhCCZi2M8eucZopqvd2y+Yz8RG3CGGJcgD210T2RV24
2IbAutf88VUJrFR05vpgpG9gonNcjRjEvn2/eV3H8+WdYm4Ux9/TZJqkwuJaS0Jf
39osJNAabwFqCXDqefCQim9F3CLM2T3uw9wqnJfUtYtQw8GHF6s1W1H8aQDwTtkv
kjWYT4mxAx42Ta5pmQdK1oIm01baX1EdxIoN1IGi9wDGb+snfdVos4ncMJzpeX7R
S8lhOFeaJBjRWmF8MP9AGE42bI39DrkJmWx5PySdEQaOZn4NHuwezaggAA+hiI35
x6P1xYKFo3bdSU5DNoh79SXWEfgziw==
=4AVX
-----END PGP SIGNATURE-----

--VvvcpSFxAc69oYKR--

