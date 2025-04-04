Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E2DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz4S9cPJeXfXronOkEaLKzMavHb0KSefU1ETSOthgOI=; b=MvvZeFsmEpKOevtAfpZhHw2mWJ
	oGVc7oGcCUGS7JauqbsIIHl1youKsHTHfbyYKPAPbbPqI1idd0oK9S71hxyAdhtq0WQUWg2gCRAMB
	MHU3LUgWxChdrjIZNH2gZ2+/1ZuMySeBqAX3w3e/HwUyAZWM10HEx5pZR3gV0sU2nU26rgqYmCRV+
	VY3F83zsA2RksEf5xKTBOzkFZW5EKr5VjTVscyXaJdwCgHlpKm/A7MnsQ13k06mVzUR8bVhjzKwDr
	PhzII1MHWqqPP0pWdutXAS2XxNmW/H8NC9Xh4Qsi0oCrGkbKROF8qn3Q5EkGgN8+pbZoTT6Qay1zU
	rDbvLQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mA8-0000000CYrr-3K7N;
	Fri, 04 Apr 2025 18:53:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0m8J-0000000CYmI-3IiU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF51E5C6474;
	Fri,  4 Apr 2025 18:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C100C4CEDD;
	Fri,  4 Apr 2025 18:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792674;
	bh=oz4S9cPJeXfXronOkEaLKzMavHb0KSefU1ETSOthgOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwfejEkPdhOwbbELuXI2H6yqhKJbthsTA3lHoy55Hv9prY56ksqItuR3/yxJ/7PzV
	 FWFo8WaMHMN9XyNLTvOH5M8eK2yDPUK90Avuv6gdBWmJBoH0zRnaPKLNxtgDTdP+FO
	 Oqf42sJkHvOmZtOYXKTaA+vwZD5GC8TIiDRxdkNznC6B/LuF3QxuUVJJEKXS9CITpp
	 BATLygXm77PxgqT4xV/wtskqD6aogFVKRme5bEejL8UTh75JNy8dbRGkCQlznzgzBm
	 dwrg1Uv31tIJLbNw288UVfFyD8y6qhFFJ4IdDMPVR8XyQNRvE/KGwsEd4gFHdNqjLf
	 TSX5GP/PlTYvA==
Date: Fri, 4 Apr 2025 19:51:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 14/14] arm64/fpsimd: signal: Simplify
 preserve_tpidr2_context()
Message-ID: <c2838b4c-38a6-48e1-9e05-3ef1bb564576@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-15-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3oYctM3jI3CEC036"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-15-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_115115_881728_0E796E88 
X-CRM114-Status: UNSURE (   8.99  )
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


--3oYctM3jI3CEC036
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:35PM +0100, Mark Rutland wrote:
> During a context-switch, tls_thread_switch() reads and writes a task's
> thread_struct::tpidr2_el0 field. Other code shouldn't access this field
> for an active task, as such accesses would form a data-race with a
> concurrent context-switch.

Reviewed-by: Mark Brown <broonie@kernel.org>

--3oYctM3jI3CEC036
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwKhwACgkQJNaLcl1U
h9DpIAf+OA8hF2gh287/+asHHVsJUtLNmfr1dNQEetUxX4Ey+MU3WC3EPo7upWFv
hsaFSE0133E1GJqiqNeFbP8tkfzzMB30J9jieppTKaciuUXnah5qMfi8UPgl70yc
EBQCnaKJbPmGDgINKcHOL6+2m6pR90/qmqisbRhn4PmRjPpJcR39ccVm3XnVpJCy
7no28JlEkIFakEAX44N3eE7gGR+ikxKXqRt4yw3KFZpDpTnRoCVivdAiGh+354+H
fQzI0KSCfE8+XVNGRpXkJKMAZs4SyXsLHUh0Kds5BwTbJs2LHlhmdhkNJXMt833O
MXb+qF+erqhRevNgTclSuR5gdFgqkA==
=to99
-----END PGP SIGNATURE-----

--3oYctM3jI3CEC036--

