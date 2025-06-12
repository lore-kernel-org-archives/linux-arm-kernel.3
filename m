Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1976FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6nmeiDBbSv6hLGTHeA+98clwxPNiLe7VKe+Gy5mksc=; b=rGsp91k5llipao7S8swK4x/usC
	g8DZktopQefH3iqmqpM8XopiyBNHyjWje6HS251+gvXxnE8XJbHx2KU9ZHtIQOuVEOTj8k5k3NQVD
	bSXxbpyU+Cy6pAyszVZQRA7yJkoa+ktVZ/bRN+Pt7hQRkQC3OgpLLWo/Gv5FRtbCBa1bpt1Oa6mwe
	Kf5A2H6+1yB3vwm7/ISaLZB0GyV1NBAYPqS+u6t/Wg+Tp3Bk9Kip5KYpa9/60j7yQm4lYOVPjkKW5
	l2tzrkqaSoJHWER8ETpULk50c+LX57j+bFg8tZJf0JdcU8+JUKgNyfa8qCojB+q4V15ySleHSztus
	+6d93dcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsu-0000000EN1N-3wws;
	Thu, 12 Jun 2025 19:46:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPl2M-0000000Dywe-488c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 164C3A51ED0;
	Thu, 12 Jun 2025 16:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AD2C4CEEA;
	Thu, 12 Jun 2025 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749746661;
	bh=f6nmeiDBbSv6hLGTHeA+98clwxPNiLe7VKe+Gy5mksc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Em3I8Zna+1C3CD8q08/uSigRLg8MyInTdQluiuvCHBfs14yu/3dzII2rWyqzgiy+X
	 SZ5P7TskeJO3Wv/WpXlghNf0vmu8T9cgKnN6HpC18QjLkB5Mf1g3d+f2xu0XOLJYhp
	 OCrd6vxq/gp66mWtmkCHko+FInDcMNUQgVHOkruCJfZeW/GPLCMRezsc4eoB6zHcAd
	 GDSSCI8nZlC//+8QtsRYbYc11kcjacnBNyA3fjHavJf2DRiRWpBRlwlo+blcgSM+jH
	 SjuDuOt4UDEEuYEMLgwfTV3+xNZiDemsU9FDOy/orC/7CRaP/EqUxUWIeqR38NcaJC
	 5EugFEF5yzfqg==
Date: Thu, 12 Jun 2025 17:44:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <6901c30b-0b31-4c9c-9943-e5205485691e@sirena.org.uk>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
 <aErokN0vKT3urlmA@arm.com>
 <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
 <20250612162027.GA13202@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g9doPJH8Qa6O3G2u"
Content-Disposition: inline
In-Reply-To: <20250612162027.GA13202@willie-the-truck>
X-Cookie: Biz is better.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_094423_095121_8354FB44 
X-CRM114-Status: GOOD (  12.74  )
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


--g9doPJH8Qa6O3G2u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 05:20:28PM +0100, Will Deacon wrote:

> Having looking a little at the code, I think that
> arch_release_task_struct() might be better than deactivate_mm(). The
> latter takes an 'mm' parameter which we ignore but I think happens to
> be 'current->mm'and so things work. Given that, and that we don't do any
> GCS management on the activate_mm() path, freeing the GCS in the
> task-centric functions makes more sense to me.

The issue with that is that we only call arch_release_task_struct()
quite late, after the mm has been disassociated from the task.
do_exit() cleans up the mm with exit_mm() relatively early on, and
free_task() which is what calls arch_release_task_struct() is one of the
last things we do as we clean up.

--g9doPJH8Qa6O3G2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhLA+EACgkQJNaLcl1U
h9CcEQf+OppxOZFdiQ6126vFkOw2K2aoXa4etd6ht4IXrEO5qIWP9bzeSq8cxS8w
CoIGCLsTcS6Ms5vREcV2pS4N0TffQ9wlvUgmaYq+DcxMFXP/OqbmXmxRGSX83ZHu
OtiRyuTJE89OoTVBmY1rfIgGbS5vlubhjw8kimI7FsVo3wvi6uaRbUnXcVgN9CTH
OKtSl5fARe/5y3MH8KIX8gI0uwdm+gPbQitGq6vy94o+WK64KDtvBPRC9jklfMst
+oPJMRALzedUkqD/LDpwFyd8AosaC6K6cTx0ZmWxHyHMa9+q5YNzcx4/5/7BVSiY
fW23Fjd1dbwiVBNRTf5FQvRNgXm06A==
=m3z+
-----END PGP SIGNATURE-----

--g9doPJH8Qa6O3G2u--

