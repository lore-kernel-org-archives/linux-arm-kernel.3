Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3935DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wfwq6+AHqb1f5N9J49Vb0+0+K01Wjb10Qiari9CNkM=; b=KQ9I0W+lM6DKi3B5ctp2mcH4k9
	w6I3hBSZubYiH+I2fFBuAipyhVBnyvqnAhxPSII3jACLR0cvICoj/9lbnL9s3acH0r62FpvddlqKV
	zk5RVAQctBExwUzxVEyH22hgnxviR3ts+R3aqT1ZxRumK9P1Hx9V3A+mS7Y4trwamtS0EXQW8oADN
	ARwfV6yMVuzbLyNKK/aBTu6xyoaO6i/A7+FvHjP2OnBSg7gd7IUBEAaOYLcXPZRjsuSuf8J1em82r
	6zijkzTv48v52+Kc2eYRTN8iVZACSm0AqTuWtnomzLfyvRPLFxpE13LWPGa0osqqxvv2xRm/0e+VG
	FrGH5erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD38h-0000000184k-0FV0;
	Thu, 08 May 2025 15:26:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Y6-00000000zWr-2RlZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CD5B5C6353;
	Thu,  8 May 2025 14:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A865FC4CEED;
	Thu,  8 May 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715713;
	bh=B9AeV/I++i7Bk7tOgydnTHZvyHSJOGKVCcbaMsF1F6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaSLuKhqVM3WYUsKUrfKX4nnQ6RLqwG/k0AEh0aw0klA47XAZIwcvOwkx84PVfcDQ
	 uzGxasQTQqa7qvE7EJ3SYWSEv39n4ulcODmydXDXM2oKOUJ20fkhiyNxbZukytABNy
	 ANYJV9GSSA2h5AxDBWZuNtphjBKUJQHcrpvYZ/v9n5EuhY7NMXjeJ6BDZXw1CBlyS1
	 v1RFFW0ffW+Dh7e1N1zJ8ahNXL3cWRAJAvDsG4LopqkR4FZvHVoSOZJNoFpy+MWza8
	 WSuQCjigKMuN/fMoSRUtJPn1beT293rK9KNfar1Cuw0RTRkY7MskkkjS2RmE+RGmSu
	 b8LHabQ6Tp3mg==
Date: Thu, 8 May 2025 15:48:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Message-ID: <20250508-sufferer-evolution-e8f9c36fc911@spud>
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebtE20JlmmST2Bac"
Content-Disposition: inline
In-Reply-To: <20250508091422.288876-2-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_074834_708083_103DE732 
X-CRM114-Status: GOOD (  16.29  )
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


--ebtE20JlmmST2Bac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 02:44:20PM +0530, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
>=20
> Some highlights of AM62D2 SoC are:
>=20
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>   core variants are provided in the same package to allow HW compatible
>   designs.
> * One Device manager Cortex-R5F for system power and resource management,
>   and one Cortex-R5F for Functional Safety or general-purpose usage.
> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>   single core C7x.
> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>   which can Transmit and Receive Clocks up to 50MHz, with multi-channel I=
2S
>   and TDM Audio inputs and outputs.
> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>   external ports with TSN capable to enable audio networking features such
>   as, Ethernet Audio Video Bridging (eAVB) and Dante.
> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>   controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>   peripherals.
> * Dedicated Centralized Hardware Security Module with support for secure
>   boot, debug security and crypto acceleration and trusted execution
>   environment.
> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.
>=20
> This SoC is part K3 AM62x family, which includes the AM62A and AM62P
> variants. While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
> does not include multimedia components such as the video encoder/decoder,
> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
> processing, or the display subsystem. Additionally, the AM62D has a
> different pin configuration compared to the AM62A, which impacts embedded
> software development.
>=20
> This adds dt bindings for TI's AM62D2 family of devices.
>=20
> More details about the SoCs can be found in the Technical Reference Manua=
l:
> https://www.ti.com/lit/pdf/sprujd4
>=20
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ebtE20JlmmST2Bac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzEPAAKCRB4tDGHoIJi
0rTwAP9+9XYHVqasEK6q5qgXwf11wK84ap5HWyMjexLTOdyjHwEA19BxGR0c9k8b
BXaHJfQUx0Rv+XuQHeX4DHLngwp5CgY=
=JpI0
-----END PGP SIGNATURE-----

--ebtE20JlmmST2Bac--

