Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51A9CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qj0AmUnwcDMOIIQ9Wf/AoscdN84qRBVganyN4YGf3I=; b=nz3cZpCeSfSS8kNjm5p3vtm9N4
	P0dkrdeFhGVL1CjJrkG758twXLMiV/+tMIDdT7j6tHWXqtprYf2IyeO7w7VFhrJ4fO9ocZuB1nw08
	CNMDKyRoCN7aWgbJ08OIqQmcIuBJAYfwMxIDtcZtZHt1gFTLQJAt9XZOt0TB+Ob5OnOoG4yitiOn+
	lN0wPMDE0XWmKQcH/al0IQGFBJFT9a9sk8+O39XPEB5WLWEWqx62JOZ0B5SeeP/utVqQYJ8UDjhNZ
	NpKy/Dw+fRRqro93ujdKzPyqUisPkyDArRRjpTFTpHdA+OBkMUtJCxb+HYUqGu1RT9luYNaXyfobg
	nEvaED+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQaZ-000000086oZ-42sr;
	Wed, 24 Jun 2026 16:36:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQaZ-000000086oR-0lIu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 16:36:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A43060018;
	Wed, 24 Jun 2026 16:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5311F00A3A;
	Wed, 24 Jun 2026 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318993;
	bh=4qj0AmUnwcDMOIIQ9Wf/AoscdN84qRBVganyN4YGf3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BqIhwCwMkO7RhB+snlRAdSwJzSPtFtyp5yyRt97HyMthHMwXf0pY08+btM5Wbqm7y
	 QFsHsUpvd2a1LT7/0Tn8+ITuPYio+EmiDejRME/QhXPiKws9b/OqJ/uf5BAFg4XIy4
	 pxQlnvx3S0yDq8JY3lHXYX1bdrYuIFRIu3ier0H0E60fnTMrCa+XP1dNy3on5F5mF9
	 lq4WupW4yraAcekoKnCVULQzfh3XnSnhR2VkwSqqq9s3V3wN0hd84pZYv6Eo+x8Rz8
	 o35ZwHoViZ9hkk4lB794Su3LVUkDaFa5OZms+iroPXj3k/R900Bs+Xdxha84JnVEzU
	 Q58Gsn4/WAZxQ==
Date: Wed, 24 Jun 2026 17:36:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: axiado: add AX3005 EVK
Message-ID: <20260624-dweeb-surging-e4d9a09b763d@spud>
References: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
 <20260624-upstream-axiado-ax3005-upstream-v1-1-c05bd0bc9124@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XPet7htPfyKjHq6e"
Content-Disposition: inline
In-Reply-To: <20260624-upstream-axiado-ax3005-upstream-v1-1-c05bd0bc9124@axiado.com>
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


--XPet7htPfyKjHq6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--XPet7htPfyKjHq6e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwHjgAKCRB4tDGHoIJi
0p9bAQCQQESqfdT8st6eXeByVrp1SEgUqGhBTc5t+/SVXNk/PQEAhiI3rvPuEr29
/Xr6hJ7m23s10O3QuVZsgLVISCJjiw8=
=OioU
-----END PGP SIGNATURE-----

--XPet7htPfyKjHq6e--

