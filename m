Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE8CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3E70uCZdsVlnY5HHNZKc6pAhrrnlA5QbBWcg/yc6aGs=; b=uR/H3NJEExzXNMXb9MKKL17OvL
	QdLbYo2DtcjYOjIlVA4mPtK2FVGdKbzLIjpo3I4mfmLvqvGLiEDLGe9rpPouicVY7k+e+GTdfOqSS
	M1oy/a4cFSR1vgSAhXhjzwLUil2G6B3EHg32ljsDrW7unx/EAENmxWWvpmeSSG2QrwsfPem1oetIe
	1lX+fnL6iBr6uFX3Ko6XJMtmcUZbNaQgVUQSzdtQwjlgIOSQruf/+frrqhwsZE7xtXDQpEPYNrK1o
	3MrheWfa8sgmq6MYq1kACp6uek8s2pGddCw9D3zjANfiWJ8T+Lg6HtOAldfAjNz2dHYR9DYd+yrlG
	zjiC+W3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrL-0000000Eecr-0sZX;
	Wed, 13 Aug 2025 18:05:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEpv-0000000EV20-2gEY;
	Wed, 13 Aug 2025 17:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F8B65C6DF6;
	Wed, 13 Aug 2025 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69673C4CEEB;
	Wed, 13 Aug 2025 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755104426;
	bh=3E70uCZdsVlnY5HHNZKc6pAhrrnlA5QbBWcg/yc6aGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=By8FiGPMEFptGHgQ5TuONHulpMaV9p2sQTpptDgAywUyFdcoQ7+U6GiDN5nhvGueE
	 Owgw+K0YrlNTo/pENceZu+VwGDl78+SiGdyNH4TW6P1zX9IfJu/hEifFtmHl7xGvRs
	 nwQ8WRId3z+pM252k9FKgqVe5/JTFraR9Kh1MLh6s4bxHTSofilB++Ct+4rRT/ijLA
	 qfaHEpzl4IqjrBsEtwrN7SJN9bpVmE+V4JL9cOMi9/Y5a1T/5PX/doNSl7b0M6bOmE
	 gFyg8WSxC/47wxmh5Kclzh/ZnH68ZVx/uCpcr2vfhZQJtklcIUUcoWs1gBMFozF6rb
	 cj5e4Dm3d0Keg==
Date: Wed, 13 Aug 2025 18:00:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8365 SoC
Message-ID: <20250813-tinwork-outfit-ead86c38585d@spud>
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
 <20250813-mt8365-enable-gpu-v1-1-46c44c6c1566@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ST/TrnE4ajryBS2Z"
Content-Disposition: inline
In-Reply-To: <20250813-mt8365-enable-gpu-v1-1-46c44c6c1566@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100027_728355_97BD152C 
X-CRM114-Status: GOOD (  10.44  )
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


--ST/TrnE4ajryBS2Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 11:25:42AM +0200, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8365 SoC, that has an integrated
> ARM Mali G52 MC1 GPU and compatible with arm,mali-bifrost.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--ST/TrnE4ajryBS2Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzEowAKCRB4tDGHoIJi
0sDMAP4+0xSBcmMGGhX5SJe5IJFeOimSGjNftWdRCFtpLo9HWgD8D8T3LnfuaWZf
iFanLD4cGtlfmp+DFdIhwe8VPds0iAs=
=sFgA
-----END PGP SIGNATURE-----

--ST/TrnE4ajryBS2Z--

