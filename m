Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7A2CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn9h+uYyMtI8fMuF4gXBNvIMGUHt678xV80dOfCy1z8=; b=Y+xdJZy8G3/wEotimW6R4aXyFM
	jM+TZ6ZLQPrCFqePfQl8mECiQlQ//6UG/a+LvqAkTUMB9HSYADewZTtVPhl8qpTdysTuSWaXIiH+P
	d7Xv6nFzrrRkCtAOM3XSzxtPmKMXLt/NatvyJhvJU6VJ2tWpC9GI3yk7HKDZu3OPMCU3ULNT+Rt++
	GziO1sYIafPopPhZ88Pd4v1G8+/OGzOZHUGNZ6O0ziwobtBZuyM8iDJIDM1q1x+Zy5HKAveO6jt8+
	0eGoUGP6zv3UTzmhbvDeU3pUJG1cgQis+3BbgYp/MH/OscIUztvXBmK8yf9HoY8qqAdaf7Y+eh+SD
	8YshTlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXzm-0000000H35U-40Qs;
	Thu, 14 Aug 2025 13:27:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWoO-0000000Gp31-1V2J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 12:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AADE5A56D0D;
	Thu, 14 Aug 2025 12:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E177FC4CEED;
	Thu, 14 Aug 2025 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755173523;
	bh=oKG/z4imADYHqqynLKtUtN4Oij6zZpz6vZ6gDYrFCfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRWP95gWPi8uGdMOal1tWKaqi6Fih6c4F2ouyp3iwFFTnq65bqB9nXZ80bQBqhVVL
	 3sOuySCHWSFjSkzaWpMelGWspQGcAErxFbcDac9LoJoHq0Hj1Br3rW+qzz6rv1XJOL
	 uu3nI3imdj/MZhWIU0n8vL/UmXveS7jTq07JAfVc+tEBq+oftsBIJE6yyaFanq3Iwp
	 EmagD21d8bZYFrRgegdFvx3VBpzPT2K0Mi/ZT2cP4oU7/3mpf9Ndu+INHKInvSMgJP
	 +gFmlHP1QAur5Wbl7fX5bCyHPt4J0Op/n50t5Z6xrP2AV1+TKvtrh0MkI98Max3l37
	 sMQaowSLuBbCQ==
Date: Thu, 14 Aug 2025 13:11:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH 1/2] ASoC: es8323: enable right-hand DAC-mixer connection
 on ES8323
Message-ID: <b5a64166-c55f-4ca4-af92-52c954847af6@sirena.org.uk>
References: <20250814012652.81424-1-shimrrashai@gmail.com>
 <20250814014731.86651-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLXYa5/zsu/y4xid"
Content-Disposition: inline
In-Reply-To: <20250814014731.86651-1-shimrrashai@gmail.com>
X-Cookie: This sentence no verb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_051204_458655_5C64DA98 
X-CRM114-Status: GOOD (  11.45  )
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


--PLXYa5/zsu/y4xid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 13, 2025 at 08:47:31PM -0500, Shimrra Shai wrote:
> Enable the right-hand DAC mixer connection in the same manner as the
> left-hand one.

> @@ -633,6 +633,7 @@ static int es8323_probe(struct snd_soc_component *component)
>  	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
>  	snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
>  	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);
> +	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xB8);

Neither of these should be unconditional writes, these should be user
visible controls.  We don't encode specific system's use cases into the
driver.

--PLXYa5/zsu/y4xid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmid0o4ACgkQJNaLcl1U
h9Cw0Qf/fVy2aA2vdtzxxkMt3NZISirhPQt7ljKImdZ23mMinHypli76WIRu4Vom
EZ67Rf8PhDIh47o4kt1PXRoqs+RY0+kVMV/EXl62aRHEWzZA5Nnu9NAoeallApT9
B/Zee+ERSeLSfiG5VnMgOXyIoxXj8ef3qjT+YnmosASsC8mO6KratoqMTJgv1vA0
MYDl2eKwzYZc2E4ejPJOQj1LY+mWLaZVLAxzYL2SJYafv6IucpT40wuL7d+GfrDO
oOnm2yFtY88AxYlocm4j1SOet5v6acFHJT+eZfSWDNBr2vRn96q/zqK58nIIkVMU
LINhnJwnXBOQqaEvviOTsFg+cCG2DA==
=Cp97
-----END PGP SIGNATURE-----

--PLXYa5/zsu/y4xid--

