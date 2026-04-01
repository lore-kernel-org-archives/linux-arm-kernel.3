Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE1D2ED08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2gA5z/ZbfkLAE1DgTTuoq+UeEly+WXscysmUm3Qsq4=; b=IbhEVLPALuRQM+Wdxb+4DInveJ
	mxoBsp/6GTcLTGxpbHG6IzOvSkp8vuGb5huFaT9J0ZeGE/vt9V/3XSk1hq7z3rQyZprqRN6LO/Ul9
	9NzTq7uvvfRpNMU1+RBxHJBAqNCFuBIjiIvMt+tj1uRyewPWIAKkxjpKSPGyua1Pvxxb+maLI6iL1
	hPxAiYfbP+Kq3R7zs+ik6X1zS9GgJaK0A5EbZBpfVvmrC25p7bgEw4K9H9/c1QwFPD9nLBCgQpWUA
	KfIJZY5TfPPPo6PutFHJuyCTgRKgKxG1j8fpV8fp881MAzGRnD0Pvao3K9kJq9TDReDvzexkb8YQh
	J/Z9OYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vhW-0000000FJsm-0IuP;
	Wed, 01 Apr 2026 13:33:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vhU-0000000FJsS-0rBJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D8C940876;
	Wed,  1 Apr 2026 13:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B6FC4CEF7;
	Wed,  1 Apr 2026 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775050419;
	bh=u2gA5z/ZbfkLAE1DgTTuoq+UeEly+WXscysmUm3Qsq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrjOLnO3Ng86Zf3a7hqAtZQ38GjlF3Sqjp0X7l8Z0E7s2q5xleRk0UqrElA3+Yu2b
	 XgTOJY6NkNd3xLnOJrYdVz/IXGsps3BcK5CYPGtt7BGnXZA7PZ1zv9ck6R3H/D71KO
	 DGU7KA3lD6tc3wKOVJ0oHyVnui/qZqTBZlBoI+iyG7WpUI+ERM+UaiCO+bjhT1bZev
	 uAs03WJbSnCuAiGQqOre3t2g3aXilLCs2HLdvxmV/lCQXIHsjek51AbZaHEviEZK1i
	 CJvvNXA8mTb1QO00KWzQLf4xpZ41nO/Px51g2AIADI/uyGi575/zntZAvSV/1lG+KA
	 ofceWRRlmbsfQ==
Date: Wed, 1 Apr 2026 14:33:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Fix teardown of non-protected VMs with
 pKVM
Message-ID: <b7c54873-b53e-4737-a2f1-29e6b0f2f674@sirena.org.uk>
References: <20260331155056.28220-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VKjDXFZzISaRr2EE"
Content-Disposition: inline
In-Reply-To: <20260331155056.28220-1-will@kernel.org>
X-Cookie: Sentient plasmoids are a gas.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_063340_272335_99E69DA4 
X-CRM114-Status: GOOD (  15.80  )
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


--VKjDXFZzISaRr2EE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 04:50:52PM +0100, Will Deacon wrote:

> This time, it spotted that my fix (introduced in v5 [1] of the pKVM
> series) to prevent taking a reference on a VM in the 'is_dying' state
> also prevents unsharing of pages shared with a non-protected VM if that
> VM is torn down by its VM fd being destroyed, rather than the usual path
> via the MMU notifiers.

> Rather than send a v6 of the whole series, here are three patches that
> apply on top of v5 and fix the issue by (a) preventing teardown of a
> referenced VM and (b) allowing some references to be taken on a dying
> VM. As an added bonus, this simplifies the locking on the reclaim path
> because now a VM reference is enough to stop the page-tables from going
> away.

This series fixes the warnings I reported with pKVM on N1DSP yesterday:

Tested-by: Mark Brown <broonie@kernel.org>

--VKjDXFZzISaRr2EE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNHqwACgkQJNaLcl1U
h9CwMgf/fs8y9kNrlWFlAgNkzhfQnswRnqeKgN/WBQoa+ICQlo10qCf/fIXAIYuj
eiEfPzbOlhE8b1jpwyGPMaeNT0R3VME5RqHjTH0iMxkZNMcchbsV075VfPjeFIhS
Mha9t6CdJ2wfydRzUAjuHHGDsCSrMBDVs07sTpJw8CIz6znZFX/YfbxKs0meuRGj
F/RLlgyTtz4IdnIwk82pCiYz/uQm+boFHvkKe+/koKsewy6gTs+/sV2ik9tNGVlP
WTDpGktEbaIu7mchxtkv+rylgszxwR6piyba9qWE8SfppLvaspKXOb5RUDH/cq//
QFKMBIqswWyAZoTTfJ1neby0ZPm5Rg==
=/3Az
-----END PGP SIGNATURE-----

--VKjDXFZzISaRr2EE--

