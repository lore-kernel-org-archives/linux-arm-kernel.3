Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698FCC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw2vC5Q/OGeFngLQZkC3/XHGX6rR7B7IZZRUR38X1v4=; b=p7qeJNrwAalCsM3IQPDLyPxvAt
	OXgS41K6DoUs4jOdnHMsMAJ9AAtgbPSDMX094VtjbgVgOXHF2q7hpdIEKkVVZo4678GqV2WbqNWKz
	UIA+dN5ef2xNeg3ko5N34oNEo+IEWN4n6ChXW8g4qHSRMsm5uXA86IQ3+Tgr3CvEuGkgjuWKlIMoD
	Zs6AmlgvloEtPk9ANESdDQ3WPU7zBNeXAYdXHAo76lEP6rAbQqt+Zv26k8lRwmsc68DfM6x7Yjdls
	7Ep3lilpK1yH7S3Be84sNpMF39jzq/mg4WV0eW7pzdoxKDpjbjmxjH2D2e+SXQkhql+MkTV1Ln8tl
	nRToewgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Kb-0000000BrUf-1BW1;
	Thu, 20 Aug 2026 16:09:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5KZ-0000000BrUZ-26Ya
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:09:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04B2C436E2;
	Thu, 20 Aug 2026 16:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F3E1F000E9;
	Thu, 20 Aug 2026 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787242166;
	bh=zw2vC5Q/OGeFngLQZkC3/XHGX6rR7B7IZZRUR38X1v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QWEeK6OFYRoTZ5+N6bouaDAR+gAApbpTt0poSx0vQYHfnxa/kvBm7QvgL8FlogoG3
	 31Uke4I1VPxPqKxlifx3OkAuTLnmAhU5P7ONBtIoQbhhGgk6s3t/pbe2FklOnnZEVd
	 2h0tmsvisYeftZT3N85f+7Dq8eer8gEHmQ63ijCIIBLzbEta147DHPAJzFkKqirewh
	 3gS9W/gekBEEwJbul3+POd7l0O+ZDnMTdAj5NrxeSpDd8EDxkGl3EvgduIhcGaGHIA
	 +XezFr1GE5zQXLrNuf6OJ+fNFJYjFHchdgqrXfO0u097o1Wx8DEE4wLR/SJF4ZPK+z
	 n2bIDaWVwEDfg==
Date: Thu, 20 Aug 2026 17:09:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 2/4] selftest/arm64: Treat KSM merge_across_nodes as
 optional
Message-ID: <0ae60fab-49e3-4a8c-a007-a6439ae10991@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-3-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5YuwvEi+VPHeciq"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-3-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.
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


--p5YuwvEi+VPHeciq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 04:33:24PM +0100, Muhammad Usama Anjum wrote:
> The MTE KSM test unconditionally saves, enables and restores the
> merge_across_nodes sysfs attribute. The kernel only creates this
> attribute when CONFIG_NUMA=y. A non-NUMA kernel consequently prints the
> following message three times even though all KSM subtests pass:

>  static void mte_ksm_setup(void)
>  {
> -	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
> -	write_sysfs(PATH_KSM "merge_across_nodes", 1);
> +	has_merge_across_nodes = !access(PATH_KSM "merge_across_nodes", F_OK);

Don't we need the file to be readable and writable, not just extant?
Looking quickly at the test I'm actually not spotting where it checks
that it's running as root which I think it needs in general.

--p5YuwvEi+VPHeciq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHJrEACgkQJNaLcl1U
h9CRtAf/dyOLasDZacxDjlmySBh2HEYjNXwXJeIGcQ8gG9GMFwXWGrxOVczxxSAv
mqf+XwBC9/i0Xzz5JFO5siZtAAOCk6b738U8MIgtDrIRGsZWvyTus+8NSEfe/3VY
SC50yUo4Wrn+gukRlg+KXu02ICnaNE2I0pXuvz2lVVF7TUXPFPqi7xg8IAHQp55p
xAQV7Jm6TqNb5jxysQCAu0pQrOECafJ1eSwynrBmrVWL96SB+uNy/zrD5QaUj5MG
CwPFnP8j+yk3PicAyblJ7YZXKGVpED+CWFik7KVqqwDbZ6WcMvU0C2M7h3MkKtDL
DpA9SeO0GAKiQtggMv+VAKxrKER9yQ==
=ONOg
-----END PGP SIGNATURE-----

--p5YuwvEi+VPHeciq--

