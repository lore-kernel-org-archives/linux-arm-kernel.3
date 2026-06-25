Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258FCCDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F4KQo/LXvQMJy9qOTC9S3grc/gHruRxFqZpg6KBf04=; b=Wa98LnIEAqo5ZcoAGis2YPoK0P
	JabSqBVdcF5mPjJoVB/9A+zVzDYqoKcuKEGiqPI2RANKnK7ulSA+sK9AaRVFEEOQbn3dR9WtvtyQF
	toD3rLAAMMa16IWWKh7CtlScsBDLIcjnMFt18MPdfpKwcUZ2LX2XBbp0o4VQqnd/Bh86ntagtxdj4
	cGjXEPrhu0ElOA8eikOFBSYxmpk+6lMBnntsFURUp8lj/UaWA/xtk/f1JjG0ufNUcouWZCGWligMc
	gdxicY9EERlw2hdVu54pSCwRbNUNUVLTwf9NqBOsESmvUfc88SJ68A3LWbW7c6Rh6GDaASXxVsPPq
	TddRNAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmq4-00000009TEZ-36GT;
	Thu, 25 Jun 2026 16:22:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmq2-00000009TEO-3haS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:22:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3E9942AF4;
	Thu, 25 Jun 2026 16:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F871F000E9;
	Thu, 25 Jun 2026 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404522;
	bh=5F4KQo/LXvQMJy9qOTC9S3grc/gHruRxFqZpg6KBf04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CPb2stxq2fbb5nyx10ATYrdvRljtwQNBjpQPpbtK+MDdx5+qmjvZi3vjTeKoRNsDf
	 U5nEbMn4qJKg3LoBsM1BLKS1hLFOrn+QaOM0vf3ESt1y3Rvryi+JK/oTCoJNX0bkVF
	 hZKGcF5KwypW+/Bs9zKlYxLP4D5e4UYCUQb6t5al4mZ0vMUnUV3Zxb6IScXf2OD1p8
	 e16imCYj9iYV/76yz312gV9GocAk/EO86j7p+3JiW4i1haku3JoeLoNSkK17yBIoqW
	 3awiBgZTF/0ee0CcGpUrzr2ZeoU52jpjL9SNdmNEzhzRYGOQwhcM/+JU3zRb/CSYqz
	 4kKCi2MeX95Sg==
Date: Thu, 25 Jun 2026 17:21:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: xlnx,axi-dma: Restore xlnx,flush-fsync
 as u32
Message-ID: <20260625-deviator-wobble-61d333ac6f49@spud>
References: <20260625161016.1249570-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xYKvzKvso3jUBxOS"
Content-Disposition: inline
In-Reply-To: <20260625161016.1249570-1-suraj.gupta2@amd.com>
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


--xYKvzKvso3jUBxOS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xYKvzKvso3jUBxOS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1VpgAKCRB4tDGHoIJi
0hBYAQCNVVgdgCzxxO2gAoULpvUyskuiTrcqKn/RmNfGzVdb9QEA5Ne9VcnFMY3O
ywb2Y78gEz2yNU+2gRTJlDk/4KUtfg0=
=4B50
-----END PGP SIGNATURE-----

--xYKvzKvso3jUBxOS--

