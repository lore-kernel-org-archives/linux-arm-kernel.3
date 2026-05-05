Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDD6FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lq+7Y+vsXRQT8s4+vBhwnSz8vGg/ibDRCsKu2Y+cHpU=; b=PfoEqBBTDqJ1zcCYYvTl0kOwkA
	2w3J2o5+YHGwVZdB/atAC1vDmb89G8ynRAfqJqHBL3fOfvq6LcNDPNFMgAW028jbPIFjReLQKZhpY
	JmX333zemTIj8Gert/e2ueZ0sOfoBXl2Op6rG20qBeue+pEW7XgirPnYNnDbl5ikw7YXYI7DU2S7X
	6gVzH7GMytSh59LmIbfNnlSSwnZbMZTcVcIg7ECzL2reAaGg4lx3bNeYlLt/q6DZM2Xbr1jyjDBGP
	+Onqq5a7vXNNqX9Uo65yiUefpqRK8xpjxzLgp86PBD/K5x/veKc7zSCTU9U4ZDB6US0qCOSXRLAOd
	0WV7q+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLUK-0000000HIln-2o6B;
	Tue, 05 May 2026 19:31:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLUJ-0000000HIlW-1fXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D61560252;
	Tue,  5 May 2026 19:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F32C2BCB4;
	Tue,  5 May 2026 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009482;
	bh=GjclJVRV1WXsBgkEYNCF0uu63ubfAvR0q8rRqvwUTNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm6P7AxM9wyw8dxiPZS6tpdUdzCAsLqIAaYizqFTF4z9vXs6/dhxM0Wq4Jde05jrg
	 UAvo8feUU8C3bE+4VLBb6ltBp6g7EdTBcP5bQ6dYN8gf1qEg6I9LSF7Flsz1JBKd8X
	 /IVchF2nmdmgogq6q1buJXt1v713NmxW8ZLfQCnM3qoB/8MHdLNhutSJoG0ZE7BIMN
	 zOhKMBhOREfV2AbdaH8ayH2zdM9hosNnKgRORUxz3O3f1Hhk17it9getJNuXKfdAdC
	 XMdYwrTYjflOAkQUZ6zl0oXeojbBPkcIrbbzaZsrqbr/PoKWRHPssYf1Ta2Ed5O7wR
	 AIy3m7dDJ63MQ==
Date: Tue, 5 May 2026 14:31:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Devarsh Thakkar <devarsht@ti.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Nishanth Menon <nm@ti.com>,
	Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
	Swamil Jain <s-jain1@ti.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 02/15] dt-bindings: display: ti,am65x-dss: Simplify
 binding
Message-ID: <177800947953.3784799.10067421854229298328.robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-2-f628543dfd14@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-2-f628543dfd14@ideasonboard.com>
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


On Mon, 20 Apr 2026 15:54:09 +0300, Tomi Valkeinen wrote:
> In principle the DT binding for the DSS IP should mainly cover the DSS
> IP. The current binding also covers the SoC integration topics outside
> the DSS, mainly via the endpoint related rules and descriptions.
> 
> A more recent SoC, AM62P, has two instances of the DSS IP, and while
> both DSS IPs are identical, they are integrated slightly differently
> (e.g. which DSS output goes to an in-SoC DSI bridge, which goes to
> DPI pins, etc.).
> 
> To make the bindings usable for both DSS instances, relax the binding
> slightly: remove the explicit endpoint rules, and generalize the
> descriptions.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml          | 55 ++++++++--------------
>  1 file changed, 20 insertions(+), 35 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


