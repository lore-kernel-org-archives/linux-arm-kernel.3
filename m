Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BF9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdMtPBXKk1u2j4jjpHs+vAXDIB1/oOWn7NFhrksV4Jw=; b=xVGn+/AhYkXVEDRoHqclwToQ0c
	gVMQjCglc4LaOGTetZyKOlNOhLPyjsm8Eah2H7vKZNT5MqoI/0DclAlhH+KOGDPkRfaMhzgZs+r+V
	2S3hFISyyWtGBJXGijE428HIqEtC74W9o7yWlp7bBYvv32LJposJK80EO4+e71wVKDFjXBPsKBYBI
	c9WeZYIwEF4xKCU8kte1KHY8QogFWHzaV7jq7qHM+AC9y1jCNjEQo6ZHBVgcPVnZUK+4gdcUD8MOX
	W0yZfBy/ld9MDcmdyWDSQFMEw+1O/n5R54qvzRn5T+sjKJ+yUGklybckCAqb6QgI4ZZnUr7WPnr9q
	qiVFTJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeux-00000000X4D-1foN;
	Thu, 14 Aug 2025 20:51:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeq8-00000000WfB-15Cw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 20:46:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0412DA5720F;
	Thu, 14 Aug 2025 20:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B816AC4CEED;
	Thu, 14 Aug 2025 20:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204382;
	bh=YdMtPBXKk1u2j4jjpHs+vAXDIB1/oOWn7NFhrksV4Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOrbQn1noZWRB9b/kz/zPp5AfWDa8GsXKJb1bhpz/f4X4fQDJ1e0HeSXXrfXMebBn
	 TAEzCSM4IWgU9R9dqWXA8vQOLb4iwUa068vhPrXnCh0aiH8oHyjy6uHL+X/Npy9a8t
	 e5Nxitnsu1Z5e+Xx8tGCJXdgXhsurAT5QJgNDwhFAVIszGgQNCrw3BhaFAqx0HWtlp
	 kiUk+cbDA7fSaH2bKG4u6X64+ag5Wd4mc5a8/4TjxH2baeYvbCzthYodzQyBIXvf0F
	 WoJNWdO26yjtBoWIpxJsvogtWYS1XeA5+vKVkIrgtZcZb1QAfd/MqA5KCH1FJzGDVz
	 molTqE7AMAeZw==
Date: Thu, 14 Aug 2025 21:46:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: Add Actiontec vendor prefix
Message-ID: <20250814-activism-earlobe-cb4e66ac3929@spud>
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
 <20250814-ixp4xx-mi424wr-dts-v1-1-b7c10f3c4193@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+sIP5LDZwZ34Nyx"
Content-Disposition: inline
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-1-b7c10f3c4193@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_134624_358581_391277E1 
X-CRM114-Status: UNSURE (   7.21  )
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


--0+sIP5LDZwZ34Nyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0+sIP5LDZwZ34Nyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ5LGgAKCRB4tDGHoIJi
0tVdAP91XXuBvJp1CZerEY380UTqLoTlCFjD1u/qRdyVHGFvVAEAoEuk6Um0q2/F
xZ1tjnVDge1slMCIY0fVlVAqDUt54AA=
=7sIA
-----END PGP SIGNATURE-----

--0+sIP5LDZwZ34Nyx--

