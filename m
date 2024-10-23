Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7268ECFA450
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grwe4tEWoIuPxTpF4SvSfBtYTQZNuyJCa6BGBLW4rDk=; b=yJ0/OJl8o3B1/zb8Nt2bidmjmV
	DVL2+FSdZU0QooiLsv8MXsHQNG1CrTZNblIt2ME3r4jcS91WQv3W4OpG4zDhVEeSSKpCqTKacZcca
	xxkBLWcT2Cs9SfLR6/Cfz9VLPf/2haxUKUgFjIo0KgbmNfSkMpUmBm7L0SedOUCQHOw4z8z+PdGlt
	5Lt3Lkh6epbRzRmA1hS8siJtGLSKqnUM14WylFvT5x3dxXQczf9HxOuLQPDuoeC2teWYpPeiJwA3I
	SQJr+AcRXbkBsQMB4Z08DNE1+E5m/Ygtw4MEWXtpG5MPLYY9oNmEMfcsml7RS8fkO6Qk0nua1gXRA
	+w8UhWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egh-0000000FFYF-03nJ;
	Wed, 23 Oct 2024 16:58:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dze-0000000F681-1ejL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66A3EA41BE0;
	Wed, 23 Oct 2024 16:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA4AC4CEC6;
	Wed, 23 Oct 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700033;
	bh=UKrF+3JAsYvrc9zKdrxnsBzuHKK/Q/vC5JypSYYR3u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ptUI6ITJnyylzHi/pFVDz+ja6NQQaXmZSZFZ17HmRJCFw92MMGXGs92zmYaUhugE/
	 EwII5iyrqYHhqM76C5LKV2HtkQjBtEAlNigjswT97uOFj5JZO9oz8BVCm7YSH+pxNN
	 DIN0zGZfDvkL7m3WoQj0z/0r7M5+RFUM/A+lJofPdfgZ8DBJu8WFYU/CX2St3wukla
	 nH3u1FqrExbdgyNEahz9IALoxHr5z2QBUoiCUJT65+AEnwGib7m3wF8AJgDi61HXBg
	 bQCuznJdpb5tiLquWPje1sU37Hmg506srUtYW9cEAhgF53uy6MpfHFjDE0smybRLEv
	 eL31cK5dfx0mg==
Date: Wed, 23 Oct 2024 17:13:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v5 27/37] arm64: Add encoding for POR_EL2
Message-ID: <bef5f236-8bec-44af-bb44-a1c60184ad31@sirena.org.uk>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-28-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="81j28s7634StTB0z"
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-28-maz@kernel.org>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_091354_517396_9DA5EA5A 
X-CRM114-Status: GOOD (  11.61  )
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


--81j28s7634StTB0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 03:53:35PM +0100, Marc Zyngier wrote:
> POR_EL2 is the equivalent of POR_EL1 for the EL2&0 translation
> regime, and it is sorely missing from the sysreg file.

> +Sysreg	POR_EL2		3	4	10	2	4
> +Fields	PIRx_ELx
> +EndSysreg

We should probably rename the Fields here, though there'd be an awful
lot of xs in that name.  Still, not an issue for this patch:

Reviewed-by: Mark Brown <broonie@kernel.org>

--81j28s7634StTB0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcZILsACgkQJNaLcl1U
h9CLlwf+Og5cWMMbSKMvKfAYjr12+GMfwlv2bPVr/vo6SJd7qQVwjy7ZCotQUz/Y
EM46RUtI7zJZd0nbsG++3r0hbMpYCnL3z2261EMha4DyD1Apeq8Tw+ZqMH3Vvfi5
y7EYb2HV+5VAcBE8T8qctp6g4f1MT3uzKgrFpOTuh/KsWNUPlxuUpvL/KK9Qh7ou
jYuhb2BZEzECOCpfMz6IgBT6JARxIUg1BCp840Ao2Z9c9rYWWNYCh9dlNTwDQ3D0
h8xDx+jtPpcSx5HSLeGykJTmmwXSSVcL+Uzv/KJ20q4OUoNYnxbZkbYuAUio1r1O
Z1VXoZUt4mimVeSQJGtuXYI5+7nvcQ==
=CNyb
-----END PGP SIGNATURE-----

--81j28s7634StTB0z--

