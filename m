Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3C3F8FA94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqpQikDlnXI/o4z2qAGnMALiu2A30Tb7AXrEH7i7OW8=; b=lpldwmZa+Qip64/dN1vW1nTx+8
	QRFgdY9l4IpvZ9Bw2kfy9a0BIJwQWqsrGXClO+sCF5SkzeJBrl4yyGu+g84pQiXRKzHc/UwWm9SPD
	hkZTcGB16UpPRrqaYrqMeG7YtYETe7kU75HF9cnjdFK6aNaOSnCRHcftlrCn5md9Q6apq9zrdAlga
	iXX0xeBfDivHiLXvtObakRXeJ4qXg5bo0ZMtjX2ntFSvA0Kbo6SNCHos0zuxePYAz0B1CCGbdF5A5
	j5ACobjqzWVU5ioKi36VqPXnI6L4YwF6gkMzC8VnPSEOy9yT0qcMt3EzAyUp+6cTrIDWemUM6wIqk
	pXWo1fVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDiJ-00000008tfP-1c7J;
	Tue, 21 Apr 2026 16:12:39 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDiH-00000008teu-124x;
	Tue, 21 Apr 2026 16:12:38 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wFDi2-000000003X7-2yFJ;
	Tue, 21 Apr 2026 16:12:22 +0000
Date: Tue, 21 Apr 2026 17:12:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE
 and BE DAIs
Message-ID: <aeeh4TW0IHLU5zB6@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <59f911bb1a855a00c0d9dd4760f10ff0030fedb6.1776646435.git.daniel@makrotopia.org>
 <95e1067c-3c8e-4dd4-997d-f3be9d2cba29@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pghGe5VQSM39F6vG"
Content-Disposition: inline
In-Reply-To: <95e1067c-3c8e-4dd4-997d-f3be9d2cba29@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_091237_283380_DED98C58 
X-CRM114-Status: GOOD (  16.61  )
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


--pghGe5VQSM39F6vG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 07:08:01PM +0100, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 02:13:34AM +0100, Daniel Golle wrote:
>=20
> > +static int mt2701_afe_hdmi_trigger(struct snd_pcm_substream *substream=
, int cmd,
> > +				   struct snd_soc_dai *dai)
> > +{
> > +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> > +
> > +	switch (cmd) {
> > +	case SNDRV_PCM_TRIGGER_START:
> > +	case SNDRV_PCM_TRIGGER_RESUME:
> > +		/* Ungate HDMI and SPDIF power islands. */
> > +		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
> > +				   AUDIO_TOP_CON0_PDN_HDMI_CK |
> > +				   AUDIO_TOP_CON0_PDN_SPDIF_CK, 0);
>=20
> It looks like we have clock API clocks for HDMI and S/PDIF on this SoC
> (see clk-mt2701-aud.c) - are there going to be problem with peering
> directly at the register?  We do manage some clocks via the clock API
> but not those ones.

Yeah, you are right. That came from a super-old vendor driver and I
didn't realise the exact same gate bits are alrady driven by the
clock driver. I'll drop that and prepare v3...

--pghGe5VQSM39F6vG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABEIAB0WIQQ8WXOkSQLJP/KOu5qX7zeyq+FyywUCaeeh3gAKCRCX7zeyq+Fy
y111AP0QTyLAlHpoP5/XuWLbe7t/+Ru+GlYU61Ygpcl8Nz3O7AD/UuXFl5391unL
s39J8r1DHhIewBnqoLCXVLsvqeLMKUw=
=j9TW
-----END PGP SIGNATURE-----

--pghGe5VQSM39F6vG--

