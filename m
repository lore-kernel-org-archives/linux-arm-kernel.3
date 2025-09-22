Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A573CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVFvzxJkP96iFvu7wwSOEa2UpqZ2nRMGo1W4USuDy1c=; b=m4pNAbIytNBtvvL9OVY0/F/haD
	xqxhJkd1QNmQhhkAdQESsnVDW8gGv6uIsjNKw59nYYLBlV9irmvr6SkvXeVA0Nl8kwKolKFN0zcY/
	mNy7mEzy39WIMiivy7UAFZRc0XrBPE8iLBt88wy5+DrcujNMQWnRRJsQeEFpjvCvKUez/HQAS51nR
	9mXptgeHL+a28tTJnAAxWtkWyMIHN7yzqYbILOpdO7TKDpYlrO9+S3e2QZLGOABghfXEgpGQUGlAa
	AXYXBOUSksjyCTn01Prsuj6CEgnadGztkkNhE0yDtRNDO3LXLEZRo5PTaS3U9krgiayev0BbUaR7R
	CEoZgMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dkC-0000000A2Uu-172B;
	Mon, 22 Sep 2025 10:26:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dk9-0000000A2UR-1f41
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66C99404FF;
	Mon, 22 Sep 2025 10:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E373C4CEF0;
	Mon, 22 Sep 2025 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758536760;
	bh=GesIXJsUp9vEt4svwmGtroGLhz9wKpDtpAOC8MZ2otE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUgHYicVwA8wzrlrilP666bQK9TOFp6Cm3A4SUB3VlWWgSTRCN7s1Eg1jpyOtTHgE
	 vLdgP+onAW9+nTtLV4VLyxRNvF0K/LkeI1GvFQLk2jFRe9DvaNSnND4kKfRUASqSbv
	 2/5U+WvyTtY5hDzWDo+68oJu9Ep/N7yV1YhqcvtiXzkFYCwtFvqxjJhwDCU7bvuyqT
	 BzZTH440JIfDxMmJUEJKQMMeLHsnYEyMj3HsArcGPd3bBzN+AdryeDWLEf7bATPeMR
	 Zn/fXYL9DVv/R6FbZMLElXsnMEKhaHQi1aj2So4GjZ4XKxsMmKvm8NaTyAQX3VFLGZ
	 UJ3RhedKuTF/Q==
Date: Mon, 22 Sep 2025 12:25:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/5] KVM: arm64: expose FEAT_LSUI to guest
Message-ID: <aNEkNF8rvb_e9DKd@finisterre.sirena.org.uk>
References: <20250922102244.2068414-1-yeoreum.yun@arm.com>
 <20250922102244.2068414-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTjpzkUzOZtHHjFI"
Content-Disposition: inline
In-Reply-To: <20250922102244.2068414-3-yeoreum.yun@arm.com>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_032601_453999_C90C0B07 
X-CRM114-Status: GOOD (  10.38  )
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


--TTjpzkUzOZtHHjFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 22, 2025 at 11:22:41AM +0100, Yeoreum Yun wrote:

>  	case SYS_ID_AA64ISAR3_EL1:
> -		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
> +		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX |
> +		       ID_AA64ISAR3_EL1_LSUI;

This should be added to set_id_regs, but ID_AA64ISAR3_EL1 isn't covered
by that yet.  I posted a series for that the other day:

   https://lore.kernel.org/r/20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org

--TTjpzkUzOZtHHjFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRJDAACgkQJNaLcl1U
h9AOOQf/Qx0DwRkeQoNtyU5B2csGJYPd+4eySttDGWCSla061GCxxbnF7+gRkeEd
ZcAzhyQFxW+GLW+xTNOZIwvaK2YIcezXYvrg/xz4WOTUR16XDDxV6GkhXpxFERdg
6O1AtuqKcu9EBSyjjKO4hYFe351fn1Lgg00BhpTgjsF/Xi7s1tk8X5yj+Q9scr0E
KaPB4mOu9mYan1kzD03fXi7cgo4dH9ltT8JhIwoO55DNs+Dxje6+aPE7WjR+Bg/R
dOStoYITnI75ZCf66uFMHo1rCejbxVNoUSDqL5uES5h/Hkkc4aCqOyQf6T6v+E8X
El/9xHABcfTiGt6D/VpzZ/REB7+P7g==
=TrBA
-----END PGP SIGNATURE-----

--TTjpzkUzOZtHHjFI--

