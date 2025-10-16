Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2649CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5MxHDjhVnMQw7538nov8Jo1+Up40NCVNBoxNeVwnxw=; b=mp2DRd8zmXPXg4iUBIZUB7W/Cw
	Wxcyr+SnB9z0tfkGAR5kSyrVCVb106D1rAMiuZ3YpVLp9aoC/eeYe3U60F8kNi9Mf6WAsZYLrIuYl
	lTGCxSie9kxn7fPWxAEvQDvpjuVyfYc3JSyi7BZAzzndOofubnmTliMi73X+FIIXYZCCmArQhHZnZ
	Hc89P4UbN16FRrbCr1OjzRPuN/DAXaQ7yD8GHqu83QTL28EykHch7IJT7usyAsP7h1mPDXFVtDa5E
	vlouuD4+7pmYG0HIXdDWPxioHnqIrvDej94R936Cvt6PiBuW1BPGs3iILNYvQmtSnGDziGSA7YkB4
	TeKYnJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MjD-00000004fBK-3rQe;
	Thu, 16 Oct 2025 12:05:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MjB-00000004fAy-2x9C;
	Thu, 16 Oct 2025 12:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5714A43D11;
	Thu, 16 Oct 2025 12:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0ABC4CEF1;
	Thu, 16 Oct 2025 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760616305;
	bh=s5MxHDjhVnMQw7538nov8Jo1+Up40NCVNBoxNeVwnxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AtNK6XZKFQXhYFJZyvQq+UuuWYZXaylSiYtJyc179f8ve8nE3MJwSs/g4w/SBM4Ds
	 1eMtuIoHjTFSJYqeycd0nnqlXUEeor7/wf0J9W4TAJxFiaK8SAVNWo+fZ5eEMP/Tbu
	 0MCaqqCpGjWdTUVX3Swj2pXS2swBlRp9pV3ScZ8zJKABsWfV8wD0xlHg2/9Cpm6g4k
	 Nv/HVulNrtSV2ni7GIal+DU/7h4fkG3ohYvx7hMzNabKjyOB8Z1m9WSJVM+UAKs9oe
	 KudcBdci2+JRYNR5Eu7/ofq17A3uE3cUUJGmn6810eo4ZjxzNbqPRyhLznJRVwHV6w
	 NWLARMj9H1rHw==
Date: Thu, 16 Oct 2025 13:04:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH v10 02/16] spi: airoha: remove unnecessary restriction
 length
Message-ID: <dbefe024-9b5c-4531-abb9-a1a7e9d3d769@sirena.org.uk>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
 <20251012121707.2296160-3-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3tFlK1kDVpufwE1"
Content-Disposition: inline
In-Reply-To: <20251012121707.2296160-3-mikhail.kshevetskiy@iopsys.eu>
X-Cookie: Whoever dies with the most toys wins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050505_781968_38DF2C33 
X-CRM114-Status: UNSURE (   8.93  )
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


--q3tFlK1kDVpufwE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 12, 2025 at 03:16:53PM +0300, Mikhail Kshevetskiy wrote:
> The "length < 160" restriction is not needed because airoha_snand_write_data()
> and airoha_snand_read_data() will properly handle data transfers above
> SPI_MAX_TRANSFER_SIZE.

Non-fix changes should be after fixes so there aren't any spurious
dependencies.

--q3tFlK1kDVpufwE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjw32oACgkQJNaLcl1U
h9Ax0wf9Fl356s/j6iNh98poXzDgSc/amMedVpD88bacOl/P3k3rHfVm3j1ZPo7k
SpoHlhWo9B+lVhKzicATIsbyurrxmp/vKaanHlb3GmYQ0kM77wBC4t0EmLa5p/Ec
KL4Z/D0vD6MtAAASPFO4Dr0b2A0qSn9rKqw44FyekhlE42iJVFCKQ21CudKTkOYG
47VRzbVV2GoR+6W+kijZG5XMFay/720b9whQiyOqwGlzAkdR+aAOv6yrNaXzFUpV
m/Sy7u/XiRcozPGXlQ6G87JRx06RTDpXQbjY6ieyWHopjSOROafd381vke5qZusN
mhowoJz3f1xAAkkobiuujUY9Zuk8RA==
=wYyS
-----END PGP SIGNATURE-----

--q3tFlK1kDVpufwE1--

