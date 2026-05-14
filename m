Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F58CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a7Qj3TKhpaTSitWf0gyf7QPMGY45spUIgW9aO8pxqw=; b=anxpxQjuftgHGjShJv88GwRpfF
	MKxJc5rDzYwIbajkSrmiQEpnpoCGBigH7px7oiqgxVanVP4+euK1EA1B6Gg3hdFjb2Dg3y6S6cV5L
	OPGPR+yc13q/CRzlaahj/s4Xf/dhuMxO9L15dxtLQmv4EPMIWwUYBp1MQtzISoX2Tj1N6SOSaZMcU
	FqrB3ZP5zPQaZjh5ZQuP5qQCMcWq8SJslnr97JPKnXH69o+xGAoa/N7TWtpDlj0bXHo+NhMuqnu46
	/uE1AbMzo2s6Lj9t2+7PKojChNff0RTjKOSDlEATioF1JD6ezG2JDcOXz7/Udm8DCgtufYU+vFVfY
	o24IRvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKpm-00000004GPd-37bJ;
	Thu, 14 May 2026 01:25:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKpj-00000004GOv-3P5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 01:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD9DD43E89;
	Thu, 14 May 2026 01:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76109C19425;
	Thu, 14 May 2026 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721950;
	bh=AxoTvoWNfZ0N/+JEAYdEeXDvJlySu93nmK/tcGEpdCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohp60svguPn9VJ91KLcWrSF309vSbtyAuPSAL/QkJnoEjZsQVEyEMjMZoEvMvI3TL
	 giBT5kNy12kDo2kCnhG8yE8Sxxs6IR0gbe5Q/a7+zI4c7xEOJVCIszHw7JqPEQdSgE
	 Ce30DVL+fmagRlxvsjmqvbXA25aJfxU6DBNV60oNjHXah78uM9Ud6OUub/8adLTlh5
	 tpjHAByxUD4IRBBmcnmxbgaXFU6uZYnGyEZqRRQ+JZP3kRGfRIlM6LCFXZqtZlt04I
	 Y2VbaX/vQmU3ulRzk5eqFsZ4M3ELZttB7npVcd1LbBNUxSs6fGrjGkd8em84cxxsAM
	 xtbO+hdClC7JA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 31A781AC58CE; Thu, 14 May 2026 02:25:48 +0100 (BST)
Date: Thu, 14 May 2026 10:25:48 +0900
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Message-ID: <agUknFcDIfwrOCld@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNeucMHgTrsFwFqi"
Content-Disposition: inline
In-Reply-To: <20260513104329.81592-3-phucduc.bui@gmail.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_182551_870355_9BB31AB6 
X-CRM114-Status: GOOD (  15.09  )
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


--jNeucMHgTrsFwFqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 05:43:27PM +0700, phucduc.bui@gmail.com wrote:

> @@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_subst=
ream *substream, int cmd,
>  					   I2S_IER_OVRIE,
>  					   (unsigned int)~I2S_IER_OVRIE);
> =20
> -		spin_lock(&i2s->lock_fd);
> -		i2s->refcount--;
> -		if (i2s->refcount) {
> -			spin_unlock(&i2s->lock_fd);
> -			break;
> -		}
> +		scoped_guard(spinlock, &i2s->lock_fd) {
> +			i2s->refcount--;
> +			if (i2s->refcount)
> +				break;

How does scoped_guard interact with break statements - does this still
apply to the switch?  I've not looked at how they're implemented...

--jNeucMHgTrsFwFqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFJJsACgkQJNaLcl1U
h9A0LQgAgCudCBnqt8GRh9fItnTaswFb1n89iM98BFvGsp0OcKXQzs4y9LipC6PM
AYYBv9nS0EwFC/llo3irahgb3HBMCiNaWybxgB+ugoYvpRxyruZbvRrGv2GD+s+d
TWhA5K2IS4pa3QnN92xa6C8qizSVO0cQaiGN29KUnc76fe6xLAMJRmnBjeuzREIP
kWTBPp1TTcckQAMbsfYGNPXxk2E4na8lc4vCkqTeDyMFtou6rjBnDUVMYL7/Fgcj
4RtoQjoWnhpMDWwEAi1eTmfiIZu/8lEhC4BERarbLebL9OONQuU/ivc9JAJUclZH
211Q9ZSJGs83gx3iA3gE40STi52s/w==
=x6Dg
-----END PGP SIGNATURE-----

--jNeucMHgTrsFwFqi--

