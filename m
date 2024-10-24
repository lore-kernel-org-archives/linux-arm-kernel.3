Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B8CE8E7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klCzLI1Jv7dNAj0tikPJt7sDFVqShxr+T7TfoODWh2I=; b=qgooGjAMUji3zcXmit2be0u4bW
	XIQeKGKGNRRM0sB+nM/LaJ/wMFSPoCpc1q+3LEkNYEq9zjNGmHPqwioCxaCUxucbe7SnOH8UrkaOw
	9bt919EM18zrqajUEYRSMHKap4ydAuFdA60SP0uACG7dzxUu0owQpJKrKAqPeaeZM4Eww0t7fL7kq
	efqjqCp2BX4D3kafWuwCWVIFeEVnJcdgkk12xtEqV7tw/CXbTN1IoQrsS+WkUos8n3ONrLBz1FbQj
	/aaWeX7JuhKv0Ahbxlkd8iNoiEcfzvONdLOe4rl4C26hrUm7MHxTuem7YZSCu8EmM3qkVlJosVDvW
	Z69GnqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yOf-00000000bOh-3gvu;
	Thu, 24 Oct 2024 14:01:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xNf-00000000PYq-1P3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AA30A453E8;
	Thu, 24 Oct 2024 12:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F060C4CEE3;
	Thu, 24 Oct 2024 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729774558;
	bh=klCzLI1Jv7dNAj0tikPJt7sDFVqShxr+T7TfoODWh2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMntBTRgMrvJQIzj03H9cRXN7FbzlM44NGal0mcHABZmr33TMMgdTlcBhXnILLFzz
	 0CQTohxakmLWqWpBddFR8va80U4Nkw5/RG97hWknY9XonTik8fDC2GtP1Rs3pJAx4P
	 1r50Ei4Z/dslcCWqmhy3Y7UywvWTaDLSRJkYftfRDkwKmF72sT9fBSjYmQtA3xMdwz
	 w5xKjIxHmC9vEJH9AOKGFBLT194KmzS4H7LPYRBWp/VKz1/sPkNrfBg7mQ6OQQTcW+
	 s5JchFKTbExCkG9nKHHEAU1bbmmekHbuI/g1Q6WO0fT9imYZMq4XtRm75r+rUCBRk/
	 ZVyh1apF0SVhw==
Date: Thu, 24 Oct 2024 13:55:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v5 17/37] KVM: arm64: Sanitise ID_AA64MMFR3_EL1
Message-ID: <8fcd3716-901d-4fd0-8786-7bf612066f61@sirena.org.uk>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-18-maz@kernel.org>
 <33681a4d-2ea4-416e-9e2c-81a89a78c4ed@sirena.org.uk>
 <20241024124528.GA1403933@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tYWgyLjV7ZKA67pB"
Content-Disposition: inline
In-Reply-To: <20241024124528.GA1403933@e124191.cambridge.arm.com>
X-Cookie: Real programs don't eat cache.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_055559_458260_93AC27F3 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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


--tYWgyLjV7ZKA67pB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 01:45:28PM +0100, Joey Gouly wrote:
> On Thu, Oct 24, 2024 at 01:32:09PM +0100, Mark Brown wrote:

> > The changelog is now out of date, POE has been added.

> This will disappear with a rebase won't it? Since you made the same chang=
e in=20
> d4a89e5aee23 ("KVM: arm64: Expose S1PIE to guests"), in Linus' tree.

Yeah, it should go away if the code is rebased.

--tYWgyLjV7ZKA67pB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaQ9gACgkQJNaLcl1U
h9Akzwf7Bi8xmtq6ivZTHX80fZiWWoXCIXR0kvqvB6/i/hyQEo8tdAJnNswLOzvQ
38tAqpibOfQ4Qo1ite5uWxbTQWCIWT3d1pF0jzBldQ0tAGxT+4Y7zrkS9rTWFqqD
GzLBljMIeFWvNgaNpbpZp0DFuQWNh6i3ewHBtpctBSadul7ZJm6RjTlK7ujwe8BD
y6jB2i6Q8WCwUp7bO7O+43OWFYF71fMpH8JvNXwEp0pKEBH/66kTEKFpRPoYOrkV
VOax2p83LFwuP8xCMIQbhDxFyuSL2lKncWveYXNHDAmoEfpFWfzk+wPLWtC2srPy
XLZZi7LrDgwtCzcgHv+J6E8XV/psuw==
=3TrK
-----END PGP SIGNATURE-----

--tYWgyLjV7ZKA67pB--

