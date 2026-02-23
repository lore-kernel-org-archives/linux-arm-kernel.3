Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB2EEC1101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cz4V3GYnFg9kjNh6Mhtu02n5Lp5hMNpLxubRiEQMAA=; b=eiOj1cEMgNiiWfiucJJrMcaEEB
	qle3B/ghl9TVVigaxeTexlCxePU26POzBruwQYEmHtnlpPZ4FyNvCcNPglEpA6SzHVCnZdS28vxWW
	DFI2JTssJPb7PRTJjF9s/Nn+EK3rxY7i13yBlyLPjPNYjcHa6oNDQql3uwT2TO32qRl0mw4ipHSP+
	RN7F7/xFFBf2wlnJe6lNn8apJwN4Rx40oha8UnQHo3YiPhtR5tueP35qnio6SLxVuR95Hdq8gSXRv
	oKAeR5D4M/M+UyEmfWkDBr0Hs6KMAsSTrYgNv5s0UGcWQ0Ib7WYDOC7MektfKBuIvOxRZI4oPEZ+I
	Ql/2t8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYcD-00000000eRd-2Yuc;
	Mon, 23 Feb 2026 16:16:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYcB-00000000eQn-18ou
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD27841E58;
	Mon, 23 Feb 2026 16:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84929C116C6;
	Mon, 23 Feb 2026 16:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771863413;
	bh=7l8IDFSCWyfS//I/EqVL2cM0GU8dXHWPbZ/2dcCjoWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjLz40p8Gf962Rh2LhaPyP5AmV7b0qGzlHRFEZp5mW/aWkZAGR8lfkRAN8MkWoRUC
	 p8YCvEPP9QJF/e6tlkeavKmhvRf3vgpzRuXd7uyw0fVq/+/47Cl82+AVm4ym/FE7WS
	 c/Rchqsm8dLiWhSb9TS7uWxyZsIkaGjIqtSG9clmrMxDC6ys7B1CJEimQXVEF+dQ87
	 pVtVKzV9GGQLLSTb2C7VD+o02HzMGinY9ZZNUhb5jrJqIwDhXUmZE1k18X+BpSHeqv
	 gA5X5FaIuliAxXEmvR+PPdPZYfrfqLxGrACugMFjo0j7bpaVclRzQwfbi20XzE4sLL
	 tLZFhforBEvlA==
Date: Mon, 23 Feb 2026 16:16:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com
Subject: Re: [PATCH v1] KVM: arm64: Revert accidental drop of
 kvm_uninit_stage2_mmu() for non-NV VMs
Message-ID: <42d7a570-2ea7-4b5e-a046-83e001cc8e29@sirena.org.uk>
References: <20260222083352.89503-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jW848/BYAAPN1MDS"
Content-Disposition: inline
In-Reply-To: <20260222083352.89503-1-tabba@google.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_081655_404104_CB70AC1E 
X-CRM114-Status: GOOD (  10.95  )
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


--jW848/BYAAPN1MDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 22, 2026 at 08:33:52AM +0000, Fuad Tabba wrote:
> Commit 0c4762e26879 ("KVM: arm64: nv: Avoid NV stage-2 code when NV is
> not supported") added an early return to several functions in
> arch/arm64/kvm/nested.c to prevent a UBSAN shift-out-of-bounds error
> when accessing the pgt union for non-nested VMs.

Thanks Fuad, that seems to have been it:

Tested-by: Mark Brown <broonie@kernel.org>

The patch also seems to address some spurious OOMs that I was able to
reproduce with qemu when running the kselftests on pKVM:

   https://lava.sirena.org.uk/scheduler/job/2482739#L2375

--jW848/BYAAPN1MDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcfXAACgkQJNaLcl1U
h9CQ3ggAhwgQEGozf8ZBcAMfdUnYfnOQ6XoGZ88XarxGHlxNW5LCrR1KGbrNs076
d19LrTrdzEVIgNfWYl23L0m2N4FBeQ9HUqtLKA4bVOi/FAAhnSDefv4iucQKs3Mi
AUDkf8exbWpM9jNHk9y3VL9MrQ+MR0oExnmT+XkNsMkj0K9YIcfZAvuPuKU80Lpm
0lh0Vcm0wyufkv+nt/aycxfBNicfgU8e4YfF1WObAkW6bAg1zxIW9GHbFz4CRpdF
cde015TcnoYCDcWJq0IRBt6emF8qmZPaJo/sTkuAeJRMcgeCit8oB7WYEGvAjjWE
wdViggdtflRbRJKJmdxfwCDREzyFrw==
=Kua5
-----END PGP SIGNATURE-----

--jW848/BYAAPN1MDS--

