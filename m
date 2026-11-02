Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57D606B1F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6mfMpBi;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2N/YUsv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uhM1UTWuc4g7yfe725dymwVdxVySHHcDwAeuexSN2yc=; b=Q6mfMpBiIvssWAEt2kA8MsQxDA
	L28BBym1TX1Gb+3R15w1vqk0QsFweYbmrg6aCX/qh1hERtEDmw0YlLZWMJSQcYEITwtu5TbYbHxH4
	zDCTtzrk6FGzpYNf+dHQQ9gZzZuBrdSXzVv7cL2pIobJvenu/bDFJieMPfMPdSUJ/COCfSL1EUf0y
	29zF6J7ZOmKYxBMaxF3XHWf0+BD2/mtQYJomHol6mwILJ+BNcuNvvh0JLCxDqSsqot/gS73twvTrG
	Cyc6lY2+nK6wylOP6NkySKOlQnPaoM/y8JZJVlumNjUyaQJVtGKSqonC8GDhR/f+p+09431J4mc+y
	T6rPFSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtMa-0000000GtvI-3DUn;
	Mon, 02 Nov 2026 14:50:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtMZ-0000000Gtv3-2vW7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:50:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 754484045B;
	Mon,  2 Nov 2026 14:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EFE1F00A16;
	Mon,  2 Nov 2026 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631019;
	bh=uhM1UTWuc4g7yfe725dymwVdxVySHHcDwAeuexSN2yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2N/YUsvjqd/tHl1+8rOb8n0OvOulRgpaoudqrAtZhLaL52QygC80DVbWfaFE8Wh9
	 h5htpDGB+I+nb7u8RsxE1GvdXO0doXtB1Oqmlr00nfyhO+jwo0D2EM+VrMcLYPAzD1
	 tZUL2IG8bDqpvrlfTY/ILmNK7Dr9C6N+9TO0n/INrDxSWaf3X16q/ixFrNz3xO6YrB
	 SV7gXHZEaeeiqUkQ7oJ9gA81+wqjqMAhrAzArb84fAgVfyuijDnjejSt0OhQBAMGXZ
	 URrmbhwVgwPKUFEDVf5Jjm+S3QzOxDHlwm2rGp0SV7b7upALWaRAnImmz5TBx8sjR7
	 S5ABUewfSLvLQ==
Date: Mon, 2 Nov 2026 15:50:15 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: turris-mox: replace denx.de links with
 official location
Message-ID: <auijGRVEv2tzZx6Q@solitude>
References: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Acked-by: Marek Behún <kabel@kernel.org>

