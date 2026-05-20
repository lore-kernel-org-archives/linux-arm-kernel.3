Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2338CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5qGBegF2d0rfNnCblIf7e5GAakt66rinBSN7lJP+sA=; b=KhF7rag3r4FD0OwCPkXIIaGShi
	nW+eDyYb213clbAUcHqdKfjkghf4E3bYOCpQKFDm9o4OJPDKd0J9QUs4OXDcKRdApFZDXrLVLXYSJ
	fJJ+cjbKmj/3QpKKRWLOs6CSnw0/UmSF3nrs4u1vSc5dlx3P4Cd0+Gaz/fZqmXGF0l7JJ4/28UVL/
	OQmhVrCxVOHJBBcquv4u4z++k95xvUPEz4dohyO8Xx0hB9WEXrcmJ4S8aySxH4H97qTDzbBRGqaov
	smw0T+9Al6ZBdnDkeUF2G3W078YEgcJXdoz91X4d7/NkfvquNTFwSiZdJVOc6bm8fA+kJJ1DFyyIM
	Zc+QUHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhCM-00000004iPT-3EWP;
	Wed, 20 May 2026 13:42:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhCL-00000004iOR-1JsI;
	Wed, 20 May 2026 13:42:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55B4060120;
	Wed, 20 May 2026 13:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9466A1F000E9;
	Wed, 20 May 2026 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284576;
	bh=u5qGBegF2d0rfNnCblIf7e5GAakt66rinBSN7lJP+sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l4hK+Kr7ChSq6w3hiH+CTTU36JGDkfcLEx/ZrdW6ZcLoPPRqfLijP0mWoHJz+uU0t
	 8FgJQEhH+89+v/bCec+WFTb+xjrWouY5DxWy+gCHeNek1kZaH2V7KStsyTVrVW09hh
	 MWhtd1pBI4UcruR5S0dYS+u/7zA1s6W2q7r68xJoks9XkRfHACSg4F6gBaFARkAR1Z
	 Ji6ehkxsSfGR8G6+/wlAVZzuGAAhnUZ/NibeKBaAroR49379cO6qlkIeEC9T5KXCzx
	 G25OGpWq9YfxFAJbdMl+N912ULQy0ToxtxP7wfOnWarc+mRlteKCBa1BwUGe+wByhk
	 1xVOSzWARgs5Q==
Date: Wed, 20 May 2026 14:42:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7i2xBcyZcHONdB8E"
Content-Disposition: inline
In-Reply-To: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Natural laws have no pity.
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


--7i2xBcyZcHONdB8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
> use snd_soc_component_set_jack() instead of custom callback to
> max98090 codec.

This needs to be squashed into the first commit, otherwise the first
commit will cause a build break.

--7i2xBcyZcHONdB8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNuloACgkQJNaLcl1U
h9B4Twf+JV6WN5hwidB7pRGuzELS5rSCHOwICTi0LQSUzc/WMRJr+Y8kiC3yRvN7
amSj3E7W75Isd+JbMKquETUaR+JjBdE31iS5f6gVBQVqHkTt77bxZzxSALZL+AAc
GlYYlopGaMw0VIhK6dD0NgdzCYUzB6YxFrAqh01DpGx05ekJhu9dE/iieDn69QJr
vxHwxHpUY5eQ1KpggAQcKGhRSr7fuyr4KSyQPkFdH9UuDIQQLVOvvzQvgW6+FFt3
zTY/mYxojOUUImPtjyIWB4Wuax3l52Rue+HvA9zZ1u68YaJDz06UsT+Gcvfkwi/N
gTQvW+EDETQralTW0M+5urEBORKp7w==
=9ozI
-----END PGP SIGNATURE-----

--7i2xBcyZcHONdB8E--

