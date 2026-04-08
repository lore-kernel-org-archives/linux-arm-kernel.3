Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246F1FD5F8D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKUsmS6puE55Tmov/yLqrj0GviEWoieWhd0QcUysVZw=; b=UxzThC8+C9hGyRpgbAgJQcyFYJ
	keVeQDuh03g7UM/RNK+H2t7I96bscbRsPVKY0qQzeoBoYJkViZKI2bh17ycUczdqyjPY8MxZPUVSC
	j7FeIUE4vV3k4nSMsg6tCa2p+/UIMbofBm0n9qcUtlrrs0bjDaKgpaAQoUrRJuhCgy3ZcD+Jap2Yg
	/k3Jf/siazw+OPaj6eeHdlfSUAzCsOTQ5PEoTRBn9ZVCkXoEcoPH90G6HH3XnguUHi4uwcatGwAbT
	+BZ9zEHB1nD1wUiVvZYYzQGH648MXtlfgHIht2vn1M3V3l+eE8X5X/KyOAlA/WP8mEebuxcHCb55M
	qT76Lshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAN0W-00000008OW6-2b6E;
	Wed, 08 Apr 2026 07:07:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAN0U-00000008OV8-30El;
	Wed, 08 Apr 2026 07:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E020E60123;
	Wed,  8 Apr 2026 07:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3D8C19424;
	Wed,  8 Apr 2026 07:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632041;
	bh=/EreH6nnagSd63yl+aXKbpFWDULrFRnaJw1l/DUx2v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBu5Jew5BsdtPd/yMzktEyMWyEczIiAPASbp0PGr2s0AjLYzxUrnvpW6uYGSh9+rf
	 kd4VGvl6+5GevSmpjdl4q/9e2ZTUg0BrwFf7yEWpwsRtmHnETZ52FxwuIpdHp5kkJV
	 2B4wbfPgKNvyj5gVTkSeW4rJAtVlNyltUuQ8eG/G64WAsd6WyuIVn2sRh2Dl3qcRpc
	 Ug5hhoamdKHbaI4ivMZxpJj8wmqYSXcJeNrwhpOC8RBjX9KP0XJn8eDJK0knhic/lW
	 DOsiTagWejpMx8uSVxNosXWaAdm88LwCYlJMOzuPLzF8Oma7ZnpK49HgVGVvFpSYqd
	 v0LD0WQTN+P7A==
Date: Wed, 8 Apr 2026 09:07:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v4 1/5] dt-bindings: phy: ti: phy-j721e-wiz: Add
 ti,j722s-wiz-10g compatible
Message-ID: <20260408-faithful-stalwart-mosquito-cee89d@quoll>
References: <cover.1775559102.git.nora.schiffer@ew.tq-group.com>
 <1ef8adf850f2fd41b6c4e3c89e4f4e6e0f469a0e.1775559102.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ef8adf850f2fd41b6c4e3c89e4f4e6e0f469a0e.1775559102.git.nora.schiffer@ew.tq-group.com>
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

On Tue, Apr 07, 2026 at 01:42:33PM +0200, Nora Schiffer wrote:
> The J722S WIZ is mostly identical to the AM64's, but additionally supports
> SGMII. The AM64 compatible ti,am64-wiz-10g is used as a fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  .../bindings/phy/ti,phy-j721e-wiz.yaml        | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


