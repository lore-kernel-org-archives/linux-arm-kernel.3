Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA64C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IZ5ILpGRBsDj5oJCPxqFJPFHhgGPlUJEftTjsM3xKc=; b=RnsvSEPkq2UOZsTc4rxLvTuKW0
	zkz9F5q+75D6sIddK9iaf7qFha6Gud1AOTlGuT+m+nfnFzVJc8O5/g23fKaIcBIcrEJ3mGCjJgD/h
	VWjE1urCBFOsLqrvQR0W7ONRqTXu7doNBOHJGAGQNu+9RoVSIuEchI9F1ruFsYzjuETVvdV1bJnq8
	NhOLdY+UOfAg1mUkwskZOy4Ddz31o8tMtNVR8qErSSBA4WjawDMtarOaa0ZATaBzSOso8SXcebidY
	WzrVmSQbuchNX0lrT8bTT4lLubziQxedLKErsBgoCCeE7RnroqlltWWU8Yq/azpCAM23jRsoFhUu6
	E3pBijVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMEI-000000011JJ-3mVk;
	Tue, 04 Feb 2025 16:56:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMCx-000000011DY-3XMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 16:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF681A42A10;
	Tue,  4 Feb 2025 16:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47928C4CEDF;
	Tue,  4 Feb 2025 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738688130;
	bh=+IZ5ILpGRBsDj5oJCPxqFJPFHhgGPlUJEftTjsM3xKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHCggAoatFK270bAwhFVX/cQQftzRRjZ9mCL4gZe5PJ9exnwBSrtYn3+e/2nDp51Q
	 uexv3UJZyRm5Coklgwlqe6+P1ekffCGjheIFblQ/c5mnje3sUEJi2jLq+gqnaIiqB7
	 3UUP7JRsoUEKwMKcTsQ8JYupsBo1ZYJHYEzoR4oFrvv6IVARPOhWbEjnLNyvwlQI5C
	 Nn77+jrRyw+ClW7uRLkIzWVnopuXZ6yjEwwz7CpiMIrhLIYVRLcS7/ilmSLCrk4vhc
	 oWTHriUaURWDkkB2CPGPnzHf+1H9uO3Ku0xD0YXaRDXMRTuip61uwHazBMmY8KcLCU
	 /wCJ+PxDP83jw==
Date: Tue, 4 Feb 2025 16:55:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 2/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <90bd1207-412d-4993-afdd-86825a403556@sirena.org.uk>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntDzS8pK/eHu8oGr"
Content-Disposition: inline
In-Reply-To: <20250204152100.705610-3-mark.rutland@arm.com>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085531_941942_B9A57344 
X-CRM114-Status: GOOD (  10.96  )
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


--ntDzS8pK/eHu8oGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 03:20:54PM +0000, Mark Rutland wrote:
> Now that the host eagerly saves its own FPSIMD/SVE/SME state,
> non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
> and the code to do this is never used. Protected KVM still needs to
> save/restore the host FPSIMD/SVE state to avoid leaking guest state to
> the host (and to avoid revealing to the host whether the guest used
> FPSIMD/SVE/SME), and that code needs to be retained.

Reviewed-by: Mark Brown <broonie@kernel.org>

--ntDzS8pK/eHu8oGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiRnwACgkQJNaLcl1U
h9C1dwf/ZRB7oQPMQLHdxH2d4u2U0lOBXESvm5fXMDMnVSQcpYNoKkXLacer8HYn
KjSvrHL9QuM9S8dJksmzgydPxgI2R2XGgLIxqm3QYMk1nOEzjerMYC0SLgoCcVta
4cRuj177Jrk4qo1jOP6yCpW583lEh080hH396BjkMev2UQ2QncRJFgwAdapGv3/o
vkVAEeP2eCglOq+600Yvjg5jbqwcZe0Mo1vxv0g+0NykYb8ZqLcSBaxUggXciLZ5
XCfa8P1IJgb0Xjh+fn5OPvRa6EH+RnGKocztPdMWZ9cag/el09pblbKyGoYeRxHp
YtZW7gosUcwfw8Nap9p8U0GO+YwW5w==
=E0UD
-----END PGP SIGNATURE-----

--ntDzS8pK/eHu8oGr--

