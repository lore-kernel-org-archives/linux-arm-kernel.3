Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9682D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCO/UVHN+3+vCatdmn5NArPP89ULfWIdCXCZOp6g5xY=; b=IqOrdj1F6Gu7hcdvXW3mqW1ScC
	lHX3OZkJ8Bj+1JIM35DpVNYuwgy0+RWkPig+WlhBWSQBcOoj9YdUKQJd7hQX9vs4/DGYcASsir22a
	caiEAjbDBdex1qiE7IhklNDRD/AeW6qpr0+/NeOC4F3Zkk4ftMHBGXfICB9mSZbLBbB0M35OGjsZv
	h1YjbhwvQ62qgXTVB8TCg/q0eTzFshXAx6q1vVYE7eAbLk74oAQmnGwo09r+lxTXDssVBy4XH9rIP
	tX21NniXD+ZV95UQ4gNPER8wwm56AT6GxbW33UgRWsdSPxRLmkV6a1HRmpcwEq3JmmkyY3yOJYGra
	vZLG82YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOC3i-0000000EjTt-3MF3;
	Wed, 26 Nov 2025 09:43:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOC3h-0000000EjTM-1Y0u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 438FB6016D;
	Wed, 26 Nov 2025 09:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69459C113D0;
	Wed, 26 Nov 2025 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764150212;
	bh=JWPUcitBJ/2M/fR3u302ELJCtt2/p8EGJveANa8B9KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwFfWPQF+efOTX2luRkKb2J9DqVFgF1Yjvb4m4IKWMZEjIIeijoJTpsle/pTzI6WA
	 PSkW59xXHMvRxLOaKUzRpjTExl44paz/HaeKGh1WZRhMT5CcHxUbJszwzd9o6Rc5FB
	 7uI4m8GGQtXm6C2Ri8xJE1sPFRHvUxYzywXw0OW62UMG/MGZ71K9s0dUEHrwtgVp3R
	 +qBK/I9SY1EW/O44uQFkOmU+8Y7wGr9sPtuq7RaLreVftV5u36BDrPfg0ucloovsG5
	 WqWPLijwDgb3cn2BZDsIQg7oXXhpv/KGJ/xYCulmV9S3s/tphDHCY3Hq7opi5//TlW
	 jSxvTYrsQqI1Q==
Date: Wed, 26 Nov 2025 10:43:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: soc: imx93-media-blk-ctrl: Fix
 indentation
Message-ID: <20251126-singing-stoat-of-valor-2beade@kuoka>
References: <20251125105006.1612348-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125105006.1612348-1-alexander.stein@ew.tq-group.com>
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

On Tue, Nov 25, 2025 at 11:50:05AM +0100, Alexander Stein wrote:
> Indentation is 4 spaces in DT bindings.

2 or 4 spaces. We do not change the indentation alone, if the file uses
correct 2-spaces indent, it's too much churn. Also, if ever doing it,
then do it per subsystem, not one file (not sure if that's the case
here).

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)

Best regards,
Krzysztof


