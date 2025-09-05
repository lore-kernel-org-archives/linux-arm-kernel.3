Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A26CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0k9zSsrRaAgBuIpWMVva+/xd63Gms5V3Uc47aoBR/s=; b=FIW1McA21SAxY6FdyzDXEDzLxN
	fdtap/0onzY1oyGMMdqo/mKv6UGTQXDMKDcU1J5BDAd9ipHDeCCtQw1LNZVxv4Ae0tQeHMWytPicR
	kxZdaecZpwS+hAYuxOXHlOof01/flc5XwBKxyp+Jr1wso9V5rFapjFSSkL+VeVu0EQED0h/YrgrwY
	l34C+5NtSSsWrd6IySsALHhA13260pMSFiND3t3NeGqX0ODnf/mPG7CK10niveTVtmfQijKUH6wUH
	LN4gnUNhAjXBmLqlfw5B61cnRVqtiiCpbulwoYC/Fd7fsoQ6WHFdCwJMcKvCdWeD/t3nFH6z5JWvU
	uWtv3qKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugWK-00000005TLZ-2iZl;
	Sat, 06 Sep 2025 00:11:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubDp-00000003oJP-0TCg;
	Fri, 05 Sep 2025 18:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05760437A4;
	Fri,  5 Sep 2025 18:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3F6C4CEF1;
	Fri,  5 Sep 2025 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097098;
	bh=+0k9zSsrRaAgBuIpWMVva+/xd63Gms5V3Uc47aoBR/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmmJ9MfrhWCErNS8Ex44NuU8P1ZE7acYA+VNTxBIkbmwwPJkCPLhm9IQkElVxTxVY
	 7reHJX7lzwOaI5PCwCpQniFwajwAitTwD7dOxu6A6ZdXrpoqK3VEVtI5j5H9nmIu0x
	 BfNC2pU1ISX1ywM08AyktGcHSolASvh6xmchj5s3GHPTUMihHb2lpB9bHk86BER6xk
	 /sWN9f1hFx6TApC0pQDuwhD0PV2XaFS3KxcGE2SWUUzqR6hwlysfeepcCMlm/g+r8o
	 bktQFnoWGi3837AroRL2TiWVuS+xQhINHXeNuJgZKn2/NAhL01azHYgSLilmtWCx+3
	 BbnD3nIn1gxbw==
Date: Fri, 5 Sep 2025 19:31:33 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"hongyu.chen1" <hongyu.chen1@amlogic.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: keep alphabetical order
Message-ID: <20250905-vexingly-crudely-36f9e510e9c5@spud>
References: <20250905-pm-fix-order-v1-1-3596e03d66e6@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P0lPMlRfexJbfzXl"
Content-Disposition: inline
In-Reply-To: <20250905-pm-fix-order-v1-1-3596e03d66e6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_113141_179688_17DB5BE3 
X-CRM114-Status: UNSURE (   6.46  )
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


--P0lPMlRfexJbfzXl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--P0lPMlRfexJbfzXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsshQAKCRB4tDGHoIJi
0k6NAP9CeDhBrMHAGGTDXecCGYptogB2rhgtMISin8uWUx6DhwD/UQis763f9CZ+
Na/sRpHns2qf9+LJX1POz1BTVll6mAQ=
=Wyyq
-----END PGP SIGNATURE-----

--P0lPMlRfexJbfzXl--

