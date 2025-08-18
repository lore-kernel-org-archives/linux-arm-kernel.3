Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD12CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8ql8aW2xXkwtqcVdQwkKrk5TzHToKM6uASKH/RmBog=; b=JQEKpDXuBEgeaBiDYexaCod2Yb
	vvB0QiED9YywV3JtDeTs4Xc6f46z4qHN03+PJCTjZ5XcPWQ7OdMPB1JZ9xji1pd6qgsBhtDv+z88U
	9Z71pIoSAmQUIE3P79Ow+IKxl2QAgYwzc7h/vpIROlqhCDuWYiwHUTrrkgKnTkt+9/pYlX99JorN/
	XC2RExN7Mm+4UZTLDdbOv3rbTLovRc3itp4BSn7+ypKzH9+bxLMfLueF1QulRya2nKHsyFsRMI+CV
	HfDcLzhjGfDP86L8LqZ1OUm3n7RT0hNX4+EyeTZI7MQjxATP63w5MEMWWj3nCYYz1yDEig71r9NCk
	4nf6I2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4X8-00000008KF9-3Erg;
	Mon, 18 Aug 2025 18:24:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3dT-0000000885h-2DLV;
	Mon, 18 Aug 2025 17:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1A2044C20;
	Mon, 18 Aug 2025 17:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5176EC4CEEB;
	Mon, 18 Aug 2025 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755538026;
	bh=AWvl4ook7i2j6QyZOwdHu6wz9TSNrHrcUecRwmKBbzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feEiPGvwbtsNISgJzePCyWYfDrBSCTVCBHYLFlj9RXVssS3tf5dvrY2WcdKZAi+dx
	 Uj0+zWpcmxc2uB3Tz3z/bkJi7q/o0rv/slFeNz4+xL7WTgCC7faJm8ysfXKOXN7qAl
	 Zdffn7CiIBNRNM1BcmOqrHNmMJKkMfO1HTY6vNuRb741e1jcvcCN27r4JgJ5pwHcOQ
	 zJaWsxZAZ/oOT1Cd0Y4VwxbeNbcSiboPvvqh4DYf0aL6wOKZNDa8xiMg0yJd1VKufi
	 bSXKONa0b3kix8J3jXJLIkRoDKfoJ3rq8BpGhyND3RxyksLTh0ZtyyovbQ/gPxzu8Z
	 ZDX7Eo0158VqA==
Date: Mon, 18 Aug 2025 18:27:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Message-ID: <20250818-steed-exploit-437c31f61ef5@spud>
References: <20250818100009.170202-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gMs5eglHAy8CZyaF"
Content-Disposition: inline
In-Reply-To: <20250818100009.170202-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_102707_582705_C609ACBE 
X-CRM114-Status: UNSURE (   8.91  )
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


--gMs5eglHAy8CZyaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2025 at 06:00:05PM +0800, Chukun Pan wrote:

>   dt-bindings: vendor-prefixes: Add HINLINK
>   dt-bindings: arm: rockchip: Add HINLINK H66K / H68K

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--gMs5eglHAy8CZyaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNiZgAKCRB4tDGHoIJi
0saRAQCnDnWIZ/GpxURvHgFTWLcDTyj4Mget697SxvyNqtN2MwD/Yz+ULwirqVd/
2bkbaxELYuAOZPRTEIpjWL0pzwyIxwI=
=iP5d
-----END PGP SIGNATURE-----

--gMs5eglHAy8CZyaF--

