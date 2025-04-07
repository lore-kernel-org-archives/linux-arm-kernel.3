Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C646C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 22:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7FcplgHxIuLSjEwG/KiiccQA2B0GdNqqLWUXmBtsU4=; b=LyBO8+H41+NThevHCLm2bLvKF4
	YQt5owxAmrWhrJ5sdJYaL/+PxyaAPTR2D2zRtEoWGwqxDdveKJOcZ8//gIgle/VVSL/gAr3q/ytXe
	99TZTR7Fbvoh9HGaLx/dxiRjByW5CzK0Nwrxgr2/OLdP3ZTyNFHvy8F0wjNnQu48DP73ppOFe8COa
	yw84LlFtbP9WO+uF40y50LB6PxJs8zDexEU/id6SQCOlz+GEurVoI8GbiiFc5UZY+0oNxE9VPV2gn
	jpLGsClLiHdT0Jq/OF3PJsgnoyNEA3K8od3TViLzjA6pM0l6QuDC42bpT7m1MQSnBs5FoNG11SSt7
	4PofROOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vPS-00000002EWp-19Xt;
	Mon, 07 Apr 2025 22:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rtX-00000001lXq-0VgS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 19:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w7FcplgHxIuLSjEwG/KiiccQA2B0GdNqqLWUXmBtsU4=; b=gUOtI0LooX9VjFGOH821Va9055
	bTl1R3k0Np4IxVT2gNCdQb+pmY9SqX4fyEAk7pzG0gQegTqF+vOUxbX+5CCWBZZ8SSr7lNaEASsgf
	MUeBj4aJ9e8lw/cjng5VkpacBG78+Q9kK9IKFMbTo/Ltyf8zcEN2W2eHSV5XbkpTlLu+I5fn31Asi
	2mZLhEjVrgnTHGagHHFDklZHPcIteHTjKpJHjYKRx4DvHRhbjrXXocEt7RCaC+O8G3Q9VheL2HcEh
	fn2YBoz/lo+4ppgiBHOfnZZi7Xx0FUkg4XqBED1oI5G2/eMzs2iK/34BOZOHbQnp05R6UdjgzoUEa
	e1OMlgwQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rtU-000000087Yx-1QE7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 449B5A4851E;
	Mon,  7 Apr 2025 19:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58152C4CEDD;
	Mon,  7 Apr 2025 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744053146;
	bh=JUNku2JI1O+qn7gawAIg0xR0y4w3pkkH/EAzNiVpu8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSc1W+sclAWGoKgVIF02NlHcS2fp0DGgCJ3olJkb1M2SJXSRaiik9fvXylxvKVyYJ
	 +cvcIfAsisO0viF3/VCcHPjjvWgIhUolEYGKOhO8NXb9XSefc2vzBgy6U+5bcGD/Nt
	 A2AuHlXfsO4mz51zZNtdNBvjW0hVyIt9X45QUK92NvuIx9w0FBRtwuWBo4es5mA5sJ
	 TZ3rElkA5e30ubbrp0lyKbBBaTBm03FYBBdU44Hca2540H8ojgB6DshkivsDjmnYhQ
	 XBmEHq/Un1eKYCVOOLZ0uYzNYGUsAF2Js2+VWcJORK59K+quw0nKEFU4KEg8xt/xxa
	 oFmEA1yy38+DQ==
Date: Mon, 7 Apr 2025 20:12:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 13/14] arm64/fpsimd: signal: Always save+flush state early
Message-ID: <be8b9eda-ccee-4d3e-bfd8-96798f87a399@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-14-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D1/zv/d9GCKha7ej"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-14-mark.rutland@arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_201228_567831_7E202DA7 
X-CRM114-Status: GOOD (  12.25  )
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


--D1/zv/d9GCKha7ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:34PM +0100, Mark Rutland wrote:
> There are several issues with the way the native signal handling code
> manipulates FPSIMD/SVE/SME state, described in detail below. These
> issues largely result from races with preemption and inconsistent
> handling of live state vs saved state.

> ---
>  arch/arm64/include/asm/fpsimd.h |  1 -
>  arch/arm64/kernel/fpsimd.c      | 28 --------------
>  arch/arm64/kernel/signal.c      | 66 ++++++---------------------------
>  3 files changed, 12 insertions(+), 83 deletions(-)

The diffstat involves a lot of no longer needed comments but it's a good
sign of the improvements we're seeing here:

Reviewed-by: Mark Brown <broonie@kernel.org>

--D1/zv/d9GCKha7ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0I5UACgkQJNaLcl1U
h9A4iwf/TxQm0YkKCV7vSdtl/45q/HJEGUDfIXxiNiW8/b9FHfTNfMIrYn9Kfl+c
ypMCwI97Ez6kM+Pa1aQx7nL22z6wPaK8rVud58WnXiXYwhDhmkAN07Lsbtcf7MuF
PT4CuSXp+766uhmVbP9Bhoq6WJcAbUIGri2LdwhHCdruCSavhZaUz2GmrU3VOsO6
6SylcKoTnz2MY4PNVDfOv6zm8rD28974CKcdS0oWWWM1qGDcKb4lI7i7xqHBLSOH
p3nCcRqtsB8DsbEQ74Fn/mwwxmrRWdKGW2z+UymPrR2jRaeqqifZSlYqq9LGZfAB
Ie5nHIT7mcQQ01SJ/Qbg6oiLpfqDtw==
=Sdnl
-----END PGP SIGNATURE-----

--D1/zv/d9GCKha7ej--

