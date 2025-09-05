Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B476CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyeDu2i+o9HDa3/kwwKLQ3zkEkc/YK3lZMNTzfpm8EU=; b=Xjy3VrQNdtC6BcC0CFo7IaAe6b
	hoPTLhVjOcZ6Gs4HC2nx9MqVh5s9fRVIu4krnYJ6rWQbmygDRRMR6NS5FJ8PwYrZityqol/9oecBa
	YS9bfJ9GeaYAn933sm7bnOtpC3Og5R5VlkJFDpd/HdxqR2sQ5lY6mJYZ9DttoIu9/v2juhcgU9hcv
	tdwlOBH7LcXf4Ur/NPkJq+OhlNUYnvm6QlY/xHWPk2mHkNWMVckTL+/kPmXtqsXW3IfHYioq1dVwP
	7z+Jv20hoMxFGYj/wsxPweH5v2izxMkYa9gIkbC6/yXlLNaiOuxlLT0gEAgca3bNbp8pQP9lFSG+3
	ys4EqxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugWE-00000005T5z-2bAy;
	Sat, 06 Sep 2025 00:11:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uub8w-00000003mV2-186B;
	Fri, 05 Sep 2025 18:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DD09601AA;
	Fri,  5 Sep 2025 18:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2770C4CEF1;
	Fri,  5 Sep 2025 18:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757096797;
	bh=LyeDu2i+o9HDa3/kwwKLQ3zkEkc/YK3lZMNTzfpm8EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lr94/cIuJT3cZOFrv+NriZvDh0IBH7VOJn7CT/KUMfAUQDE8iLCaJtLXo4eT1m88d
	 AZHs84jECVBUSd+0oFEPmter5XOTuZdNlaaHKbmKunMTFPEDeg/WNHYUeRelnaWvQq
	 E89pKiOCUVfEC19gjzIgWORGIM+aHE9OoQUG+hyQkhEMwn+SBrtfvaJk5mERqGRobt
	 mrEyfLa4PNybctRdzkie6d19QhJJxUnLa6ORrl1VcjnjD6GPWgV3FUCOYoObIU428b
	 QKqIVGv2LYyhYl+qkrLfh1eDnLaGhWUxwk43oLyUkS7/tFVDmqVTyb1194vWvSK+oG
	 fWlmeHZSW9ypg==
Date: Fri, 5 Sep 2025 19:26:32 +0100
From: Conor Dooley <conor@kernel.org>
To: WeiHao Li <cn.liweihao@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] dt-bindings: phy: rockchip,inno-usb2phy: Document
 rk3368 usb phy
Message-ID: <20250905-crumb-district-ca69a00cf6ee@spud>
References: <20250905125318.7956-1-cn.liweihao@gmail.com>
 <20250905125318.7956-4-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JICgwRvRS9Ky+b8v"
Content-Disposition: inline
In-Reply-To: <20250905125318.7956-4-cn.liweihao@gmail.com>
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


--JICgwRvRS9Ky+b8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JICgwRvRS9Ky+b8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsrWAAKCRB4tDGHoIJi
0l5zAP9FcI/1JClbYyW8Ww/u1FjWaaTZPlI37QTxc3eyTNDk1gD/X+NwruBP7g7o
k0a2fGxRECLLi6BGWP4ublx6JyltjAw=
=gGkB
-----END PGP SIGNATURE-----

--JICgwRvRS9Ky+b8v--

