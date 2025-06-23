Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2trAmon8nMb/3Uqjyt7L8fDFnJFLh9kd6estMca12A=; b=JXSPuseljwQDMm3iahmHtnpOt/
	hlXTsOab6rw16e2e43Rfxedc/gELHgrpvi3Ykr8kd9M1ABtahMhrT8fniti3LUrQr951ADgQyE48S
	175fjW/9myUeOFfhvzmsI8oZ0K5PywqMUMlZl3pq7BxVa5N1UeGL6eQWhfUCa3z2GXBZKPshokjct
	3+wuBsR5b+PthJgGHwBSn2mWMFTBJ3IjXZNmnsveXu+uifxbBrsLWO9krI+NB4c8WGGH4tJpceuyP
	m2Eu2XYloqJE9wTQQw7jtWu5rSHrjACeTdAT06E/3F1645tyZarJWWseNoXXgZoFN0FUQGW867aFu
	apTHr5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToTX-00000003zGw-30fc;
	Mon, 23 Jun 2025 21:13:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjp4-00000003Niy-1ZKT;
	Mon, 23 Jun 2025 16:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F63DA40394;
	Mon, 23 Jun 2025 16:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A605C4CEEA;
	Mon, 23 Jun 2025 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750695305;
	bh=V2trAmon8nMb/3Uqjyt7L8fDFnJFLh9kd6estMca12A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUAHjfHZ7wP9z4uLcLWdCsGlRAA4mxsqG924jEqzyw2M4VNvHQLkW7/XaK7eikRNx
	 nuWsZ4xTYXzcS1qpM0N9dUaJ5KvuHA9WdHnn+AfPFA9M9TNy0FWPw7mfibWHHaEnWs
	 0dVf7wJFCv8zWmjdrMg08ri9taKDKJFerpwqYC0Qq/4xJnmX8Hv4EVlbbJuWIWGC3V
	 aZ2uG/9IAJkd3CvKEU5RPBpEXiqNVnaHrc6udpbJ1s6JVTLew1crDKD2WQ/LYiRCYB
	 qCYU/TGhbcHB4MaAX6QB7kQXaHSAZuBSKB/QUcE8iZm+78j+xLUA5And5xhy37VDMc
	 kbKr417JlXlZw==
Date: Mon, 23 Jun 2025 17:15:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, jgg@ziepe.ca, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 2/5] dt-bindings: iommu: verisilicon: Add binding for
 VSI IOMMU
Message-ID: <20250623-squiggly-unopposed-8b0ca15adbdb@spud>
References: <20250623153931.158765-1-benjamin.gaignard@collabora.com>
 <20250623153931.158765-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RBUMPEX8/HmZilKF"
Content-Disposition: inline
In-Reply-To: <20250623153931.158765-3-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_091506_476986_DFA2F67F 
X-CRM114-Status: GOOD (  11.07  )
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


--RBUMPEX8/HmZilKF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 05:39:26PM +0200, Benjamin Gaignard wrote:
> Add a device tree binding for the Verisilicon (VSI) IOMMU.
> This IOMMU sits in front of hardware encoder and decoder
> blocks on SoCs using Verisilicon IP, such as the Rockchip RK3588.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 4:
> - rename and reorder compatibles fields.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--RBUMPEX8/HmZilKF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFl9hAAKCRB4tDGHoIJi
0jBSAP0QEA7xsWu1uTUJGvGMxKQiDolLdO1bwbcDbNWauJJweAD+MeNwvPqaJfCo
UGWS8QtxVnFJeDPlL0cimI/NBdYjFAM=
=8bDY
-----END PGP SIGNATURE-----

--RBUMPEX8/HmZilKF--

