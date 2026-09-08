Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93462C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9S4ei21MKUHBJjiz+ftl+IF+EunK9f6ULHxYAUuV7M=; b=chuA2vFK+RhywnatNbyuXM1Ob1
	IkukoVUzp/hEa026AQDJkuWiErjSQ8csnjC1RL0Xx/5KuRm8thMCnkTpL3Xu0JiKB7+ELNovJ6QZE
	V4TOSlVZ0/G0cHg32ASMqniFS3Le7hklN6U4CicEzZ6ShvuEtIN7lns6wUgFY26XmI9y5Ph2MtCr/
	hKxCokJzMWqWV1WppvSvYjQds0AT19IL4WqnBl8fPK5cbOyBDOGt/JxCz5q48snhj2uUu4/z/RUzB
	TU6WjNTmZqi4NMlN4zta0iXGVGPmEe2LprnkP7SyWDWuZbH8jQfwqoeiDQjj5d7bgg+W+p1ITpCDE
	IMmsf9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s6y-00000008Z9W-06rd;
	Tue, 08 Sep 2026 09:27:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s6w-00000008Z9A-3i0h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:27:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F734601DB;
	Tue,  8 Sep 2026 09:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6661A1F00A3A;
	Tue,  8 Sep 2026 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859646;
	bh=e9S4ei21MKUHBJjiz+ftl+IF+EunK9f6ULHxYAUuV7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PaF/fX3J0DRupK9yZ8ExzCVv71/WO0ICJ28j+TyvKhtF/hisGFrPp6LKseCIVXv/Q
	 Xv4AshCcIwMNuKbb8+dxto3+mGjz5rMUQq/QJ2IgqPw+dooCVV2iDULjBmGXzLbgLD
	 rOSVB53nuuWeM8HFhRcmKqJ/CyAipkyYFgAjsw9QpuZe6RgVyP8fpuVv9HwLu6uVex
	 jfAohxfE8UZsnlwsbHyRf8t1dccvI1hCQ0fCo8vMvs6meWiOVcd2Pq0AedZDxTHTkm
	 5hC6JTFuW4s0Eu1Yb+f0+8bQC6rJCaK0bT+r6tHPo6xivVUvui4MB6MkT/727ZDg1r
	 unFw927J5uwSA==
Date: Tue, 8 Sep 2026 11:27:23 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org, 
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 07/10] arm64: Implement __set_direct_map*()
Message-ID: <ap_UYjvpf1sXBXE-@orome>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-8-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43scnsiptq6igc3p"
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-8-vdonnefort@google.com>
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


--43scnsiptq6igc3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 07/10] arm64: Implement __set_direct_map*()
MIME-Version: 1.0

On Wed, Sep 02, 2026 at 11:47:09AM +0100, Vincent Donnefort wrote:
> Add implementation for the unsafe functions __set_direct_map*(). They do
> not verify for can_set_direct_map() and expect the caller to do so
> beforehand.
>=20
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>=20
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm=
/set_memory.h
> index 1a37f4ef130b..080a40846bbe 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -16,6 +16,10 @@ int set_memory_valid(unsigned long addr, int numpages,=
 int enable);
> =20
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int __set_direct_map_invalid_noflush(struct page *page);
> +#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
> +int __set_direct_map_default_noflush(struct page *page);
> +#define __set_direct_map_default_noflush __set_direct_map_default_noflush
>  int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
> =20
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index c59ef17eb0d0..28adab0edace 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -294,28 +294,38 @@ int set_memory_valid(unsigned long addr, int numpag=
es, int enable)
>  					__pgprot(PTE_PRESENT_VALID_KERNEL));
>  }
> =20
> -int set_direct_map_invalid_noflush(struct page *page)
> +int __set_direct_map_invalid_noflush(struct page *page)
>  {
>  	pgprot_t clear_mask =3D __pgprot(PTE_PRESENT_VALID_KERNEL);
>  	pgprot_t set_mask =3D __pgprot(PTE_PRESENT_INVALID);
> =20
> +	return update_range_prot((unsigned long)page_address(page),
> +				 PAGE_SIZE, set_mask, clear_mask);
> +}

I think these would work quite nicely if you rebase the series onto
linux-next, which contains the patches that add the number of pages to
these functions.

You can then keep can_set_direct_map_range() from the previous patch and
call that from the set_direct_map_*_noflush() functions instead of the
simple can_set_direct_map() (which is a shortcut path in the _range
check anyway.

I've used that locally in my tree and it seems to be working just fine.

Thierry

--43scnsiptq6igc3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqf1PsACgkQ3SOs138+
s6FbJhAAq7rdW+WQpw2aS+4U2xEYrsJtjGRTj94QjexotpKa2p3eyw0SLesuF9zU
+2u/FbYsoxer4kU3QDhJC96FhLS9GwWuldwvOy3tXj+Jgim+5vBbEqynCr0nEGqg
nQCYWjZXMgSab6kJdxEjcywIXZ/noCDsK2bqF5PN1dz/4lhTVuDGHaxmbf3yV/oR
TebCIeTN5gSrIxZLAC9yWHu+1QVl4v5+06tJOJdtuIIiS+V/AKr9MFHxKRw5O4st
ElIm7uM6goaowuUnByavL3kZ1Vm56bc8k2rDqQ/7gcqoJfqUfqH0jPxAzpLsscQO
vXxM6OoEqPLB0bFou1KWnLPvxjQIAtjWjous+w7QTthjSgnwkbsW5UcrOZWw9o1Q
VPc3KGvB/1djAVyBUmV4I00sfrvwqqS4wMAcXkffhZo9likAZCQJG3dNp/su464N
X9aN99o2iMMqCnOzSedwMh9t7i422FTUpUMl4m+hCnqIHqVG7VUVI32s2nx1S5n2
5RBZckCoNgL2LgG1tgsnTpl3My/l+AhW3OwRTqdXIA/b8h6+/DonZVNIoeAcAEeu
0IYdOPIOnagFiYOCWzkMNEl6ce/Vd2AOl6JQ3ZEaIdS2FUMumXbdnbtLftgj9RtP
BB16Tsr/sbJb+A3+9MeoYl9ASll6PDapN/3qICYTCK0NkSRK+S0=
=54Zj
-----END PGP SIGNATURE-----

--43scnsiptq6igc3p--

