Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD9CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PM7Hsk7rCZ7i7ss0DWokkdpyP/aaxTsbqAbCbIJEgO4=; b=3k0+NZ48o9epwTs4UygJvRh6SK
	s63DUxkFeZZBwJPfh9NGXwxCuzBVZue/5tEoalyqBiC2+aHMTdHrXQkaUKmTpo46kMXBYpuy1yfv4
	/qEeoSGKhvaPdYmd3zPqazkJoIoK9m3XC8YNWCtbrzOW62IMzenPEm3RKqynXUJdNC+1cMpZH77mn
	veN3r7wllBsHouOdHToBQySRRG4d2xkhbbNnrOVs4Hjg4K0f04VvDfQJ55Kiw6mN/YAZTgZQJWMKx
	TVX2hLkByvwb+eqk8y1ceETVEBiEkERuZ9ZfxSiiLpw6whqROpp2AADS3lldiHOMhZjvNmit/08Ni
	Dq9YW1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqds-0000000HVTA-3szn;
	Tue, 12 May 2026 17:11:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqdq-0000000HVSd-2WKP;
	Tue, 12 May 2026 17:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC53408FF;
	Tue, 12 May 2026 17:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B3FC2BCB0;
	Tue, 12 May 2026 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605893;
	bh=PM7Hsk7rCZ7i7ss0DWokkdpyP/aaxTsbqAbCbIJEgO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx/RlZ20DHNQSDtLHsoojSgNx5+PmGzfx6uY+qJpWhuz9d4XDZqu1YIQcpSCyyxjs
	 4akB56wGOcega4tbyEQ1CNnW/foikCpjYjj5hNglKjM6d/QRS0aMHioQMpyJtSrz/r
	 8K3W7/VJBIIpVjq6MoN/e+J1UcvE4GetAimajeSBYCHa4+uQBUwunbD+4Q6DDfYLYR
	 i1FeJFd+DnPmJ3KXturPPx5uRUAPrkGX7U1114grF1oHAFZmcktaMXNz/GjZdFPQeb
	 33jEyLQatlsAtya1GEtTpoxhay1gozyGmDqRZukaVKxXhihm4ForjIdaPg307qba8m
	 4fvM5Ftlo9Xng==
Date: Tue, 12 May 2026 18:11:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] dt-bindings: display: rockchip: analogix-dp:
 Add per-clock descriptions
Message-ID: <20260512-unmoral-jacket-265a50cb4ea8@spud>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
 <20260512095644.1946084-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xz/8nfi28M2rs0iV"
Content-Disposition: inline
In-Reply-To: <20260512095644.1946084-3-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_101134_654750_38466354 
X-CRM114-Status: UNSURE (   6.43  )
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


--xz/8nfi28M2rs0iV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xz/8nfi28M2rs0iV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNfPgAKCRB4tDGHoIJi
0sU8AP4vxmovvT1OpZFfAxAwr95num10Rou4WT2dmzmv35Q8YwD/ZdnsttL9jh2J
o7mrpvcV9tKvqbzCroKr/tILpzRIHAY=
=kWPn
-----END PGP SIGNATURE-----

--xz/8nfi28M2rs0iV--

