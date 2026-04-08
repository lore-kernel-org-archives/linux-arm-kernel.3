Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7839FD5F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL8Wl6LsXso5YMa03wj7RBp4a7hEApGuHxdRHun3jCw=; b=w7SpaeUkYFshOFg0TmkjaTNZAp
	l6SJhNJ7h+ac9eRvfBKXcqjZWEsC8UP53F69XB+XNyWKvu7rHBEhej6hiutmqIgx3lfRdo7Doppjg
	z/lSRAtJVmbvXezFkFhhtk4RmdSfIlRS0nfcEEHrUtaMhE5PZLcH3nTAgvtv5UoUIvGSGOoKPDTKd
	8WyqH13MhWh2coijI9uD1Ed1daYR+vf4eq99D5nVRrwsytp9fgz1LjeOAa+yD9dgPd0L0Ht0YL7KY
	RmZ6ZMNBA2tbAJVsuauK6Hp/6pBAbxmQ+bLGwKHWYMG7aLlSaGYjTFoM/1bG/cnrOcsU5EvGoHJyn
	eGNxSt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMzv-00000008OJr-4BDW;
	Wed, 08 Apr 2026 07:06:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMzt-00000008OIv-3PLl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38B3440160;
	Wed,  8 Apr 2026 07:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FFBC19424;
	Wed,  8 Apr 2026 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632005;
	bh=5RpO5nqi0Qqh1hOnIYFFnZ/QZ0Tn4Y20lPuI71HCfzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k41L79SIJiM5WqyLTBoBGW7r2qPtkFVHzibbF6pSMUoAydWX01XuSbGfTN3AGRqzv
	 SKUhoJUVgEP9wpEHNVJdnMsyj66IOwpRsjgR0nrN/wGogpvPbcioCLzGY68aRi51/9
	 7BlOw+JTDn6aXB2/vbJCiNGByB3zVs2MLdxJ4lEitvV6Pyd/ltfE4Inyraclc3/cKM
	 YLmI6bASiucXjIzFyQ+LtHYTg754fyuNi8dl11DoekwavyAUTKvtyw4TauJDUrG3p6
	 SmfN9Jzf/Cgg0ZIqGo8cTxbgY3eCAUB/Zrl/K/SM869TGIFxEHS2jKi5BU8eATE/Ot
	 //A/SUgs/RU0w==
Date: Wed, 8 Apr 2026 09:06:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: ti:
 k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss compatible
Message-ID: <20260408-lavender-wildebeest-of-freedom-ebf1fe@quoll>
References: <191e9f7e3a6c14eabe891a98c5fb646766479c0a.1775558273.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <191e9f7e3a6c14eabe891a98c5fb646766479c0a.1775558273.git.nora.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_000645_873378_4711A99F 
X-CRM114-Status: GOOD (  10.25  )
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

On Tue, Apr 07, 2026 at 12:48:01PM +0200, Nora Schiffer wrote:
> The J722S CPSW3G is mostly identical to the AM64's, but additionally
> supports SGMII. The AM64 compatible ti,am642-cpsw-nuss is used as a
> fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
> 
> v2: keep ti,am642-cpsw-nuss as a fallback
> v3: resubmission for net-next, no changes
> v4: remove redundant items: level

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


