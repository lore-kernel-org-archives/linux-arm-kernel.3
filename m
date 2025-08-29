Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9658CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/vmnsvinNGnBMaxWp2kB3xWl/8iQun585LPSTVVO1E=; b=tXx6LsYWrxJVFc4aF43iCHW1gi
	cVflj2AMCaoEoL5vP4ZwFMmmCaVXi4fLZ9qcYXCwaQjP0R1mqk4mthO/mKMdvqCRyuGTrXum7X8Yw
	6vTnZV4g1LrDVTggoGmMoIKUjb6vxGwqu7JJhbQl4o+AQOVrYnJKMlg6SYcrKWWeYOs8pUG7vjYi6
	M/XQJqpcZ5tknO/a7Tsj0AzXN4P3W8thyQYoAmhr7HvZtXDR2OaqcyO1/+w3F9WTfrYe8zTAwB6m/
	CBTdMw13XPJs01HqJpRzlK/TxuAQWfjP7DlEybA1fPruueaiavnayoLR74Aro5Jb1jCrH3tUcXXao
	M2igDYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvjO-00000005CUT-048t;
	Fri, 29 Aug 2025 09:49:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruja-0000000510p-13sf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53AD360051;
	Fri, 29 Aug 2025 08:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649B9C4CEF0;
	Fri, 29 Aug 2025 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756457121;
	bh=HH043YS79MGHDZ5W2kvlINvKLjbpb9wn9S8CCzbMoLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq9wf3GBYyDDbp4G+llWX/LFoyG19QwYpcZVI5o46eOiRdKesbf1LqmlvWbmz3XzZ
	 JpoB2XnFGMGWiE8NIzLg1mu3WQu8qOrzGg5t+fn2IxTyaR9mLzJYUu8ubpfJflYnK3
	 RqstqD1iFonLpToQ+o/FQWiPk/9hovaWikSZ8u9Y8ksx8dv1c3CCrLam0UDv5J8nCS
	 9ZwcyOF5QciSZVyFHAWy/6v91vK15AwDTklHZzXX/bcN4PjV86Y1o65HoM5bJjgTG9
	 u0+9n0C9QDRPuO/m6anPyc7Lgy1+xYu3nAwx7QqOBcufWo4L2imppo/dARkozQRiQQ
	 7O0GsIHT54Yrw==
Date: Fri, 29 Aug 2025 10:45:17 +0200
From: Mark Brown <broonie@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Subject: Re: [PATCH v5 00/13] spi: airoha: driver fixes & improvements
Message-ID: <aLFondxgBAf5rc_P@finisterre.sirena.org.uk>
References: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
 <11fcd899-390c-40b6-b1a0-7286dc1e01e4@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O8bdw/cIFhQ6kFwD"
Content-Disposition: inline
In-Reply-To: <11fcd899-390c-40b6-b1a0-7286dc1e01e4@iopsys.eu>
X-Cookie: Filmed before a live audience.
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


--O8bdw/cIFhQ6kFwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 10:14:16AM +0300, Mikhail Kshevetskiy wrote:
> is there any news?
>=20
> Best regards,
> Mikhail Kshevetskiy
>=20
> On 23.08.2025 19:01, Mikhail Kshevetskiy wrote:

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--O8bdw/cIFhQ6kFwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmixaJwACgkQJNaLcl1U
h9C/Nwf/YbbOIT/qNeOsnG8zmCoF5GEeHaZpCAlu4I8oQoS+7W5yieNiMNcy9J71
vd7fi/TQMQxw1wJtSMzNOeb91S2aFHZmzYZKaAHViHABZKq1i36okc8JFzCtI0Nn
nkY3f0yIsvJ7KDtsHtD6QL5aS+HZK+LqIUhzC6rj79kn8W+III8sYvz31ER6BZP0
BagmFWAL4JBACZxmTWsNUWWHGpUX1tOCKAcwUgeulPn5Ue1VxB8aOtzCY80kL5E+
7GHijmERLCrIM6ZrQjxDG/fLNQLzvjCPf4Nn2oLIrKMEMZn7aGn5EyqG/oe5X0+a
CyXO5Akj+hlsWcMGwgdZMhsj+6uTSQ==
=yOBS
-----END PGP SIGNATURE-----

--O8bdw/cIFhQ6kFwD--

