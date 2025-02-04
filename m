Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78034C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=payM3Lv0i2tFvtWvDl+mDAKVdtJ2xzD5z915sZ87mYA=; b=wAyBBJI4QIhX52xg9+SasiQVMB
	WTexRRwv0kBApWkaWr3uyqMYzw1TDMK2Ku2kNNOd719czKKsz0dxxzZRjUPszKbgtkCeiWUjUbu03
	0/a/kq8hi9aR2rsy9b8iIHZn+3iKmwpmzrT1lhq9JDy32hWPAVpobA5mFuYgfs7znrJ+8qoe7Hz4N
	Pi5zMZoCu89qxqIAnv1bXiaiGIP60iY2KfQGwBm54SQROtAAzKUZdu0CE1jqxXZRVdt8V9wdQqVDC
	j1z8zJKGpvoYGW+Iz2bJ3SFMWEcBk2rFPhUaK4aciXy9vbumJctQnHq6Z5HwLF11qY05YmC8Ys92E
	8+zPl/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOec-00000001N6h-3GFX;
	Tue, 04 Feb 2025 19:32:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOaq-00000001MRG-3XT5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 481FC5C575A;
	Tue,  4 Feb 2025 19:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD53C4CEDF;
	Tue,  4 Feb 2025 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697299;
	bh=payM3Lv0i2tFvtWvDl+mDAKVdtJ2xzD5z915sZ87mYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlBxqcOvfeSKjGTyrXHq2OUXcbNTe7hFhrMrHfk2gMRrSHXyVv01XMrWEVwUFFrj0
	 IRONpv9NOGWvsgRhCuyYaB/cGcpNML15JDbRoR5WWuwqSX2E8xII3dZPg2a92osys7
	 yoPvTrpxCLGiyG9xbXL1ODndgIPRgSJp4zge2DI8bHvj5FwEE9fVstdSLxN7K3BD+G
	 5wXKNXjp1v+Xtg8wVBj2YMNBuMfD2S1JcB+CBy+JyNaB18JIbJl7tkd685xMZDaLiw
	 9KTJ9D3Kv9wah1hSom4WKjnfVWI1m+livcPswyoQMyOhFGjpW33lfHAipZ4U6HnH+n
	 a18+G+46kmu1g==
Date: Tue, 4 Feb 2025 19:28:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: Add new VN-X board description
 based on Versal NET
Message-ID: <20250204-vitally-catering-7006a7c6c1df@spud>
References: <cover.1738657826.git.michal.simek@amd.com>
 <6e4486141cf9b1d36b03624cc73621b2e3bba894.1738657826.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rihF7DvlGIW5aR1L"
Content-Disposition: inline
In-Reply-To: <6e4486141cf9b1d36b03624cc73621b2e3bba894.1738657826.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_112820_923298_A6BA0635 
X-CRM114-Status: UNSURE (   9.22  )
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


--rihF7DvlGIW5aR1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 09:30:32AM +0100, Michal Simek wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> The Versal NET (Networked Adaptive Compute Acceleration Platform) from
> AMD/Xilinx is a next-generation adaptive platform designed for high
> performance computing, networking, and AI acceleration. It is part of the
> Versal ACAP (Adaptive Compute Acceleration Platform) family.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rihF7DvlGIW5aR1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JqTwAKCRB4tDGHoIJi
0g4uAP9NqvqiRCTrc4sSRsD1Ar/ITRdkdCG5QK+HJofHimbPaAD9GQoMS2RdTGPX
WUyBpEzXaR1CSHZCIk4qZYHnkiM2/wQ=
=gypN
-----END PGP SIGNATURE-----

--rihF7DvlGIW5aR1L--

