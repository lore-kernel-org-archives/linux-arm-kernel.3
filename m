Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E43BCE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9A/K6dKrZp8FkgbUJFa3jX79Fg/hAsn2lwnVXty5Ho=; b=AH46Beh89VirwXdvH3HJqvRWVj
	XvT2SyGQj/6ttNi6dgVciS8A+HsacvL+4cnlJGOxvlhKvjded1mRMjsy+aOoCmFch0rYu0WzaLwOv
	/dZT8KhMBiAXil2iN8v5abwv2MIeuCzv+U3Tk27byea0CHw1VYluywmsYf1OT4lBuwBqaM+bdXEYu
	00pPxtci5qP17y2piNKgQACCzxk8ifJxx651K1a63POuWDWltgAOjZTt0siPR7aUwktiUD5ItvlLj
	52/FFG0Kybh5AWIK6HguPc/0o0p7mWBySPapr+1r8/E3gMyDgh7mzPXzia54SQV3HSN2ufPCr3vTA
	FVrF8ZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvLU-0000000CQaW-1Uhp;
	Fri, 14 Nov 2025 15:04:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvLS-0000000CQXr-1a3y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F89842D86;
	Fri, 14 Nov 2025 15:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF98C4CEF5;
	Fri, 14 Nov 2025 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763132652;
	bh=X9A/K6dKrZp8FkgbUJFa3jX79Fg/hAsn2lwnVXty5Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKcMGlNC5EasQqA2aQ06uHY04EwwrJUfNbGLfMuvlqRNghpeGKPzYhtwWmHjM3SYG
	 Rf4F0jl9VRffgS+KoHA6rkMObv07QUUiehz0Gr1/sTUO1uyrUd2OVKuk/Ll/cqg1eG
	 O1sHK6g5FNLB9HfqUqWyPD0fWF8i7bwkiTAiIO1jAUXGbeQfeR3i5PCyYx36PXaStQ
	 fHxBuLgqtN7QIgCH2bmGg84C/qbCgoDxJtIPhF7w2/9pPUoF3lAyHHjEEaxyhLTBAs
	 zXg1CQXXkHkMNio8CKVBNVptNT4L9OfNW+zrdhR6RLQMRNojWPtZv9qQw0iY6JHNoG
	 OMPL5X7kjSRRg==
Date: Fri, 14 Nov 2025 15:04:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: GICv3: Don't advertise ICH_HCR_EL2.En==1
 when no vgic is configured
Message-ID: <75b712d8-030a-4057-a5d6-2073c8e7e578@sirena.org.uk>
References: <20251114093541.3216162-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="48cgQx1hYaY+83gr"
Content-Disposition: inline
In-Reply-To: <20251114093541.3216162-1-maz@kernel.org>
X-Cookie: Causes moderate eye irritation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_070414_434252_D6D11C0B 
X-CRM114-Status: GOOD (  10.77  )
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


--48cgQx1hYaY+83gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 09:35:41AM +0000, Marc Zyngier wrote:
> Configuring GICv3 to deal with the lack of GIC in the guest relies
> on not setting ICH_HCR_EL2.En in the shadow register, as this is
> an indication of the fact that we want to trap all system registers
> to report an UNDEF in the guest.
>=20
> Make sure we leave vgic_hcr untouched in this case.

This resolves the issues I was seeing with no-vgic-v3:

Tested-by: Mark Brown <broonie@kernel.org>

--48cgQx1hYaY+83gr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkXROYACgkQJNaLcl1U
h9DT7gf/W7DZ3+p8X2O9PnECN0VPqSjHD71nxD3K3NF/ptDa9PK+/yoAmvrBlkqf
d4fHDxMDlThAP25QE3xeBTgwjwCYnYZyzNLIyZLiJ9aD9e1mvAYUehM90q3UuyBe
DjXe6ZB2HPmbF0utvjx6Jtctg1yo2lMC/Qll+KjoV+l5GVN/GnbFSSOjVmeiPmKJ
yXHsiK6KgvNj/4Lei9Cv4oIemkbevie2YUazVw3zrfRrWuoNNr+s6Ov4uBsllGcZ
SSDnOzaDD2WNT31yj565NWFW7RF4B3Rw3mtOlBEnTthQIeTZxUQd6lwee9PGrYH5
wLKfIQFTQLso1vTPQz6EgSVbRmJCjA==
=R8ng
-----END PGP SIGNATURE-----

--48cgQx1hYaY+83gr--

