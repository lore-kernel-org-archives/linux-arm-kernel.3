Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1BDC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANCJ090YSljPVuosjhGz2DsCnXK8OPLoRjSiDiI3kN8=; b=WPA9v3jT8l3chsz4O5KyV2GtkM
	thq5eA8oRaFHq8KQeoVsEj/Q6Fy+wlJjWkGUr8zTFfi9X774cRN0IF1rNBpovTyBkWLkS3WesntWt
	ExMHSLFRX4++4MxCe9e76VRfZ3sEkiATu+793AJeNuk/Rh/RsFoSgNOh/wAijmwicQbrzWz7afr4X
	xYpEp8WGybi2D6Owo8b1H75ijWKrVNrcjkAGInEGGcS8ogahKxRCUb2QRdsD8VMKwkZvsUoqWZ2PZ
	U9IFyeoikp2GKvkjQt1EOE3HvHeI7W7bZPVMs8u8LM8aTSJQlB5ijwjittghTTAs5tIEZASQdQUzx
	RngTGdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwdl-00000000FpZ-3LIb;
	Mon, 03 Aug 2026 17:39:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwdk-00000000FpS-1NtM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:39:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F9DB41B50;
	Mon,  3 Aug 2026 17:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB10F1F000E9;
	Mon,  3 Aug 2026 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785778791;
	bh=ANCJ090YSljPVuosjhGz2DsCnXK8OPLoRjSiDiI3kN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=awVCjJ+KyUB+NFUezo/gqQocKqiE/KbengTUFkfH8zcpr33swm5ytGItr/0UnCjTS
	 934c0Ab5WRblr698r3bCSIJDTv0DreO4ZA6smBwLlnjIBNFAdotOUJmwhMkeUQZG0f
	 6abeSZARVg+54wLdhSE2wpahdcNEjeuA29KrW+m8c0QIOGwoDNTFWL5ZTMjmvunUwB
	 IZNYboc/RSCKOXO7lkKx+0D9Dq0G5c2odnA11Gl8QbL2WvmCVh1HugtPBNHilbzoQF
	 JdaamWHpTF46CVjFoLmag9ffmSsSY5GGBDJzgb3vyS/0bCJxC5SSR+Z3dRP+DK77CN
	 On37/0pgj+jwQ==
Date: Mon, 3 Aug 2026 18:39:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Block ID register changes after we rely
 on the values
Message-ID: <5d80e90f-179f-4b36-8a54-9e777f8b7aa8@sirena.org.uk>
References: <20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org>
 <20260731-kvm-arm64-idreg-final-v1-2-3de2a5616dc6@kernel.org>
 <CA+EHjTxoAwkUJ1Tyu5700hZBFtc1HpCt14-8Gh2O5qA_NpnaFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36SEx+wND90T2F85"
Content-Disposition: inline
In-Reply-To: <CA+EHjTxoAwkUJ1Tyu5700hZBFtc1HpCt14-8Gh2O5qA_NpnaFQ@mail.gmail.com>
X-Cookie: Prunes give you a run for your money.
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


--36SEx+wND90T2F85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 02, 2026 at 06:13:38PM +0100, Fuad Tabba wrote:
> On Fri, 31 Jul 2026 at 21:46, Mark Brown <broonie@kernel.org> wrote:

> The flag fixes this. One consistency point: set_id_reg() and
> set_imp_id_reg() now gate on the new flag, but
> kvm_vm_finalize_sys_regs() still returns early on
> kvm_vm_has_ran_once(), and so does the KVM_BUG_ON() in
> kvm_set_vm_id_reg(). Could both move to kvm_id_regs_final(), so one
> predicate expresses the invariant? If so I think they would need to
> move together, since on a retried first run kvm_vm_finalize_sys_regs()
> re-runs and re-writes the ID regs via kvm_set_vm_id_reg(), so
> switching only the BUG_ON would trip it.

Yeah, I think that's sensible.  I think I was thinking we might want to
add non-ID register stuff at some point, but we don't currently have any
of that and the ID register stuff that is there ought to be joined up.

> Separately, would a selftest for that failed-run path be worth adding,
> checking that KVM_SET_ONE_REG on an ID reg and KVM_CREATE_DEVICE both
> return -EBUSY?

It feels like there's a general gap here with ordering and interactions
during VM setup, both with the API calls and ideally also with
combinations of features.  Covering that is probably much more
beneficial than a focused test for the specific issue, that'd catch
recurrences of the specific mechanism but it'd be easy for it to miss
something else that causes the ID registers to change.

--36SEx+wND90T2F85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpw0mEACgkQJNaLcl1U
h9B7ZQf+M5zCfT7i75HdE3i14+l66LGOQqS+9Uv/BpcCJinHD+GCrG5npWWtMbAw
D+O5Xlqh4CvW5q+TglHUqpQPiL/aU8cnmcSsxVPxIXYLAqT4hNCfY4jtmC8malde
BwMBoMJPrs+UVqL6b16LDn94ug373LNeVYk3F4NfzA5Ehlkd2fjt8rk6Z8/45/6Y
x/tUrnZmER1BZxm8SUWIh5GiSYPnJaBVNaSo2wSNu1/2/NeaoyXHRQz/o0bCN4HL
+e2m90wwjetFwk9UFDo3OEaUDUTR+DEjvi7AyCkxtXXnebXwV7d5Klay1bcsFGzf
s2HFAyifLePXHTTrMHpZ/7pgABMB4g==
=iC0q
-----END PGP SIGNATURE-----

--36SEx+wND90T2F85--

