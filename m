Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996E1C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u6DmhQebAn8HJqGrojMFxFcfMUaAkIoK1a1VDKIhcE=; b=ClSpYvCalO/R92ZBuI+7eeCtE9
	dXGhruvJwKHpGFX9exYzruS8Hb9GVUL3DgJoDncRAvK3X/g+lAUEVHNfLP+iuJiYvvYLL9Vd3I2VQ
	0uCKS3lMBb7+PzqTVfVPS+8buRc037UXOb3yiQHbiagz6StJTU1PgpqNklOuxFvWEwQzLY1d+nYr7
	d5Sua7SjtAuYsFWwUBSCh393njCAqoZWi+DUy/Lh+NeUcNRm36UupTsOVx3nKcYYVAHP2kWr4bSVb
	0n6ouwp1y3aEnCSR9R+JK/wAnt7iDiHmSqsr8V1RzkCHDC4mQOF+HkxrAnAI7OQBwH4gXU7RsSlsG
	MkpUtHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHXC-00000009RZI-1vGf;
	Wed, 11 Jun 2025 09:14:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHQ7-00000009QMl-1cQr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AF4244B63;
	Wed, 11 Jun 2025 09:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0000C4CEEE;
	Wed, 11 Jun 2025 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632814;
	bh=O0uQCkVF2DF0j/u8y3WHsonkojrCpDOW+gMtxCpHxYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmeNnFz0+/K5eSgh8l9OZLPHDZUhrvOiw0gJVG/B6B1SroJCxbdfVNm1J8SJ5N2ww
	 y5geFDy8k8v7zyaOon+Rf//Yknp/aYhFeC6KzgB7LpKi1/fN1fJ6WXQIqM8ze3kkNZ
	 VMrokQj4jMkV3gqbOyop7nZbrk589Y9mouQ1Gf4NYW/z2FBsR9ihPaLwqK9upaRECc
	 6ll3JEDg2di9UY3NSrpVZ83eAylG6S4jgvMjGfoGj4zmys+c304iwEv3/YaliFFeta
	 kFAF59JEIW/sqzdWSmuEJ8LwWcVtbfhRon5BGhRGJxeG8wHypFvGfEcPpNMjXAGNFl
	 PgLsvxIdBbcXQ==
Date: Wed, 11 Jun 2025 11:06:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250611-purring-ochre-basilisk-3fd08c@kuoka>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609-bbg-v2-2-5278026b7498@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_020655_447509_3FD1DC24 
X-CRM114-Status: UNSURE (   9.51  )
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

On Mon, Jun 09, 2025 at 05:43:52PM GMT, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation. Add description for Bone, BoneBlack and BoneGreen
> variants.
> 
> Add several compatible that were missing from the binding.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Subject prefix is: dt-bindings.

https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


