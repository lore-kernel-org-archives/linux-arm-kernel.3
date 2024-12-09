Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF48E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk2ii8RYr1XXVNys27bsSr8dA87e/0mQrw7DBTk62cs=; b=J4dMq6OiP7hKmrd3RJCaUtQj85
	7G++KrMbDoqk/wGa3UNyBTbHGuCI83lLrzWijgOO8wor5KBnct7YgiADsiQkv7OwberPyty48nOHK
	bLiPxJmzn9YjqYiXvukylgx2P/AQzYTQSPB42YDSyQJ4MbqWeYiHGWGcKAe5Vp9fnlAcIQrz7evQQ
	cSaUMAaSRy06JFnVwfDav1lqfRb+6P1sbg90u9bj/LUk1rPHBqZM8vPMOjjzXfOIMmm7FfrmvE8Te
	ENP18eC8Tc+EuYxs5Sq0zQvjkDB+Vc1cOH+Ph/dGQj967mO86l5/HYd2/RVUMD1B7qW7Ujins/oeW
	YSq5Tj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeff-00000008Bk9-174Q;
	Mon, 09 Dec 2024 14:23:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeec-00000008BZ2-1Kdi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 981E4A416D8;
	Mon,  9 Dec 2024 14:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5283AC4CEDE;
	Mon,  9 Dec 2024 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733754148;
	bh=Hk2ii8RYr1XXVNys27bsSr8dA87e/0mQrw7DBTk62cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXeX3jTuvqP3UVfF8VrIE1fenbqYGh+4vZIaQfTXVAaF2DS4+GTfxT/MjpgvRFy1T
	 31HsBqWW4MQCaEWIqspfc3/mwafSogObGqis17G3wpa5B+K+hSDU5C+RwuQsIBe1ID
	 p8EnfcqMFt29bODXBllIfHVhDz/ogMRtd/aWatY9VAgQUMcrWdaLIqTk0ajSQyndBS
	 ccttENwb5qyWy7GBNVA/LJ1BrC6yE3zmY0JYisKYme27Us/7fFr0AopW2qaNjU6bCX
	 MSm3MDZp3By+xouIeS2DMuhvnp0t3SdjsRZ6dTMz6Bgr4bglgTpZ5YaZ/qV8zVYbSs
	 z73EJ7KuNJ13A==
Date: Mon, 9 Dec 2024 14:22:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH 3/4] arm64/sysreg: Convert *_EL12 accessors to Mapping
Message-ID: <49a35d0c-7ed6-4b87-bbc2-02a35b5a9604@sirena.org.uk>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B9oMMmb8MLjHL9v5"
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-4-maz@kernel.org>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_062230_422120_F799338F 
X-CRM114-Status: UNSURE (   9.39  )
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


--B9oMMmb8MLjHL9v5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 07, 2024 at 07:07:39PM +0000, Marc Zyngier wrote:
> Perform a bulk convert of the remaining EL12 accessors to use the
> Mapping qualifier, which meakes things a bit clearer.

Reviewed-by: Mark Brown <broonie@kernel.org>

--B9oMMmb8MLjHL9v5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW/R8ACgkQJNaLcl1U
h9BvnQf8CDc+zo4lXTgr4kzGL3vkHBle8d0SVe3490in9rDummjt8l3/8zpiP4cI
jlfq0PIGYLLy906pSFRHsJyvT7mKVLwlNZb/Bz3y2uX0YD0V99LSVTzoemNLBIjq
rij5KXLlaOs90RmEIW6fTb5Of+ibaH+9k1L+npmblxSoCTlUV9vtST+VSZD2jCjq
hOHIRkBTiJatGpRkaLJY1z4tKNC4yHSmonItysGh8YCdiqHsM5uYQT0eBRuIcM6p
MZsEDC2ng9gr17YLqkgDD+iGO1v+6RcEGkvLezZmFPJXfre0JcT2s1I8ERc1oA6F
z5yKM/IGxCLpenbZSwljSmapKNSYhA==
=3jqe
-----END PGP SIGNATURE-----

--B9oMMmb8MLjHL9v5--

