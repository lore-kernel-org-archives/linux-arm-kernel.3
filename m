Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCB8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVjtWRQj//qcsIk5ldU0SmXs/R0deh67fLAsxifApOI=; b=OGeaSlt1Mp8xJrngSHstYqMqFw
	MIFBFpPD+R/iJ/f9Wj/4lmJLZdbe9aWXnd/duuV1qI7e0dFmNQMhlxO+gsbIjMK6Ws9jM/1v3Er/X
	rhm8SrhL37Us3b2I/PwlYBbk29v+4825Z7jHID58Vm5oi405lZ3ZXbYp0HNkJD9At57zJnsHZ7Y5A
	KYLO5oZq1cDNGShlTBOEhor/i6F1FUTm7K4X9b/yXeOQmP1ne0J1Hs5qnm8oEQy01LOYQf8btCssV
	PhTD9TANCGorIZsM95bb3IRtB0VF8CehqFciqs34nbgZUhk6KFF/S5vPe+Dk+8dUEXjAdqLDw6VOK
	cx7UrtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDNd-00000005L9Q-1Qj7;
	Mon, 15 Sep 2025 17:52:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDNa-00000005L7b-4Aoi;
	Mon, 15 Sep 2025 17:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58EDD44013;
	Mon, 15 Sep 2025 17:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9434C4CEF1;
	Mon, 15 Sep 2025 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958762;
	bh=QVjtWRQj//qcsIk5ldU0SmXs/R0deh67fLAsxifApOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teYt+F55IKAnrnN0DZru8mB8wI5H4tTsk7wt33eSj/xn6gfkjRBn4gLKUSBL9UYr5
	 UZ1GCuBUvYn9PHoAbzvjfFvik9bz0u9zyDfuaey9guJ0I3KYuHEuRNqlmA3qrrhOY8
	 CegsA90hjs/Q+XEWmrv/tbYvqQN+UKZtUSLRjRS511mPcTv92vkYztU1QNfywHwQA0
	 A7VXZbH7r+oPzFg4UFr5AJbMBdvCb8+HcKh+vh9PtlXC7WlrApvgWecqzGPqAgvJuS
	 PGfXC48ip+Q9Zw9B3cYeuQ4jAGsp52T3c841rbLTGv7gGrSs7++GuOBo1Eh3lFZtru
	 eYNflOjXdhjOg==
Date: Mon, 15 Sep 2025 18:52:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250915-deodorize-proxy-b18e41fa8668@spud>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250913002155.1163908-2-olvaffe@gmail.com>
 <20250915-numerate-makeshift-c076500aaec3@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zj/IpRh5L7G4umUF"
Content-Disposition: inline
In-Reply-To: <20250915-numerate-makeshift-c076500aaec3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_105243_049408_78AA0DF5 
X-CRM114-Status: UNSURE (   9.59  )
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


--zj/IpRh5L7G4umUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hmm, actually there seems to be a more complete binding proposed here:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com/



--zj/IpRh5L7G4umUF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhSZAAKCRB4tDGHoIJi
0h7OAQDrJvvwez35Fxek/+gxVlWQMSUkdCozpI6UIMXqKSSfyAEAgfq/22/qmjlG
oPynLEW/PzKMbJDGm3gR2kAUCl+J9gQ=
=LQXY
-----END PGP SIGNATURE-----

--zj/IpRh5L7G4umUF--

