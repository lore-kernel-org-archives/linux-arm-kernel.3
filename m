Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE48CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5uiey4471seattefoOzNwyH5jPWbq+Ym1dnz+bTheg=; b=IhsJXzTmG/Q2Ame3qj3XdSOvOf
	10JEAop9jeX727Cfn3ckVpeMFRKFohwOkvE39zMa2JYadZERk+uQ2bawnxABlOGOqaHZbSofh1R8e
	S6YN+cN0QKHgdx6L+6iKPAkJffaRqNtXkjVrn7udkrLAVstNqwM2MsJQTu+HTb/vRO9ghDIVXIEqH
	jVfrtpEMox9c8inrZdbLTqAvptSFa+EUJRYjqq3/fa/Rdby1tv1iib8Y0wMVtXJOt/s329/aQ7ryZ
	4iXYTm3C9SLM82xEi4vslj5LvpHjFCA5sxwdEQhuOL8VPQPrLkiJfUGGExEjlrfPRJ7oBeWWLc4GO
	sSp2ASlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xzc-0000000Cku6-19ay;
	Tue, 23 Sep 2025 08:03:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xza-0000000Ckt8-22gH;
	Tue, 23 Sep 2025 08:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E97DB44318;
	Tue, 23 Sep 2025 08:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B300C4CEF5;
	Tue, 23 Sep 2025 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758614597;
	bh=D5uiey4471seattefoOzNwyH5jPWbq+Ym1dnz+bTheg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txYkf+EBHpb+z/Ek9O1ldAU2o3rcJZel9hPFPiLbL7qMZF0GRoTvytX6clvt233YM
	 z4IovMoaWdeW2Ks+XDeOeLtlDTdyYzw7HDHb4ugBs2UMYMI0Jk7/koyMgaTkwmLsLk
	 ydnrl9Ye0dxfXNwC6QDzQLr1gStHZ2zjQuXI0A2kJpoS4SGlO1rNrSijKYABOu3+9C
	 unBg9wKsIyLgfSV0lO3qqGAr08wBVdEOwNuWFhflXdd6ay0GvAxjm74Qcb7JuF4HR1
	 rvLx4/duwX07qI5GKHXeuupRRTW09noeH71t/ce0R8EfOSo6bJ+NkuYpYcy/HfEMiD
	 5Hvt1xuVC+0BQ==
Date: Tue, 23 Sep 2025 10:03:12 +0200
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v?] ASoC: mediatek: mt8365: Add check for devm_kcalloc()
 in mt8365_afe_suspend()
Message-ID: <aNJUQE6VncYiRx_w@finisterre.sirena.org.uk>
References: <20250922140555.1776903-1-lgs201920130244@gmail.com>
 <638119fb-4587-48a4-9534-2f19a194ca4e@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+UPYTcPP9yAXiY1I"
Content-Disposition: inline
In-Reply-To: <638119fb-4587-48a4-9534-2f19a194ca4e@web.de>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_010318_542512_76239351 
X-CRM114-Status: GOOD (  12.68  )
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


--+UPYTcPP9yAXiY1I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 05:35:35PM +0200, Markus Elfring wrote:
> =E2=80=A6
> > Add a NULL check and bail out with -ENOMEM, making sure to disable the
> > main clock via the existing error path to keep clock state balanced.
>=20
> How do you think about to increase the application of scope-based resourc=
e management?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--+UPYTcPP9yAXiY1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSVDsACgkQJNaLcl1U
h9CCEAf/QCnhzFI+vp9Z49NAqudJk3wDfrBz+Hv5nquQzGzv/kb6Yc1Fi72Cl+Iq
xEDVMpmBO5q1RUEK6oaDMPsrf9bHQ3pPPXEnUl4hbmeL+KNaUaYZEIio2c8bGBvd
lLdOZKp0KSN0yxXku0zJV5tjg6UnkGbaOldwJxFhACgUhxEbpnSsE+dNsvtGuYik
oCJtKZhTqE3aOz3lqXNYy6eVi/K0THqsqaBVwmkdwrexlxn02VZXnp9CpVl4CLqB
p9iK+FwyxIZ5UvH/kihITAP3klv9+SRjCiCxJNbaDdvV1YVZ+BP/yUUbbiiq62B8
hr36WqAph+oDt0grDiMkmKeHD5Dy5w==
=Pl39
-----END PGP SIGNATURE-----

--+UPYTcPP9yAXiY1I--

