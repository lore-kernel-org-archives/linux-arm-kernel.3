Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B64D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCDFH45FE/Pmdeh4FAR+fgYgIop/MjWWDmYn7oHYObk=; b=QmkJq6rnv+Optq7W2FonfNe9rv
	ERvyyaaMMOpBWYTp0o5pzSe2QvQ02FrZbq9MX82M9GZFhcCiVoFt4soEH6A11Na/yfLEmtMwtWTqH
	SgKu3hdLU3IbpHM9iV9Sjlgb9ulMOO+URvNFDoE7SCETjxP9sYkDT8Z5nqwlrjsrmrCZpqHjLHTak
	eeP0dEt53MvUse5unYzG1zXNB0DHfzHaYa2OgvUTmc5zE2OtgKRCSWJHJbXY5fN2rhkUg/bJfIt7a
	8mOvu/Wdy7Z6m/xNUaXgYahxRP2WIjPEqOkIhogC8mss8vjuft8cKwV1QKbpVLR7/3C4dnujAuHhs
	wBMBIm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVoL-00000000Qvx-3bob;
	Thu, 29 Jan 2026 17:28:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVoK-00000000Qv1-03V5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52F1743914;
	Thu, 29 Jan 2026 17:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622C0C2BC86;
	Thu, 29 Jan 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769707683;
	bh=oWa0Fvq3q+D3Yoo3dUfogBnn7h3DGJAXHWy9PefNDko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0mY8bcqHCzCMhVJDrwmeWjUmf+i4NTCM6rnsNCCZWK4w64UiSpx/S9IXJ51ve+6g
	 viqzj8zpgL58amsin0jJwQdsV5cfcN7vGYBWjUC6Lwf1BaoUfefdjFJPkL69p4lq36
	 XiQt6BvDOQvYybv6qGfJZYvOC76SbRtaGkfd0od7IfMBgd2qeGA/wKIxt4yoIrue10
	 gtEX5cELkmxqrz3M+23R98YCYxyweAAZIzwNbCcwIjZKk0C6heSkOaSRVlZgDbxOhv
	 a/t5aMci4Bs4x0weGKgHwYcFxAgty2zTxbB8wb8nLuR6WpYah7h92VTc2Lma0ClWrQ
	 R0X8fECCmXemQ==
Date: Thu, 29 Jan 2026 17:27:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alEpQpaCvCSpPLWS"
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-3-sean.anderson@linux.dev>
X-Cookie: You have taken yourself too seriously.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_092804_066830_6DAE4286 
X-CRM114-Status: UNSURE (   9.86  )
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


--alEpQpaCvCSpPLWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:

> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);

> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);

Given that the properties already exist it seems wise to continue to
parse them if available and prefer them over what we read from the
hardware, it would not shock me to discover that hardware exists where
the registers are inaccurate or need overriding due to bugs.

--alEpQpaCvCSpPLWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7mJ0ACgkQJNaLcl1U
h9A4rAf/bySY89fyno0iSVbW8kKmXh9XYhW/GP0nf6ewJsn3xuVUI83ySMRTud7S
rfaLLqcFZ6OnMeZBMpeISiGGmAneV6y4JaKSlw6c06BGYxLP63PzDozrTghgk+9f
jtkj9YDXTMvpmsh9SrbUl+a7m6HTg+40CaJxWwjc+aAXfideUtmXwe0sAgD2lNOk
/zofPqNRL7V2aLrus1x8erixbALMaBuh73kL1CkxAS7n/6i4VcVVyclJhl/Z7Mh7
fDbQ7qwUo7eerudfwTaHKWUlWGV1f0/7hCsr12O5QVS0XrtR/b+t/en+qMeUYpdh
+sESZVbFPRGhE0U9HhrOPks5hOpiYQ==
=l6Qh
-----END PGP SIGNATURE-----

--alEpQpaCvCSpPLWS--

