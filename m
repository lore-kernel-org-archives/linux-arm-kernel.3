Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF1FC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rad3oPMaL/9tapjox7RROrrz09UQBz6hi0JifyT3J+Y=; b=CqBhO3o+qPJpGSWe5ROtPbgO51
	n4frOO7Yu5UCVIFoIzuwNbrm6aH1UJmSzboosPNW/QHAh9IcrfCOx7fQ1iR7FeOODo6zAdMeIDBOz
	3iMRC9aUtx6NKouAr/5HAEwrU6JED/deS1A8RSpIzRvEDZouQQnr+RTO5EVXJkR9OsA3PKm/M9KAg
	uUaKuKQpKN5ix/yGLSXn+Wdm/Z1nE6lCArmTPkABc8fr/OXhfMVXD3sVLDuDaVlp+vc8vh3Ki5wmn
	OYCggVVqVnhezUinIA56f+uIp0laWcRuGWgBeT0u0tutilo2QqPTJyYRQZeWBAgTQz1vrKP7AyQbg
	SNIeE4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUx3T-0000000DDc4-3t8e;
	Fri, 27 Jun 2025 00:34:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUw03-0000000D3Ut-3wIZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFFDD6112E;
	Thu, 26 Jun 2025 23:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C547C4CEEB;
	Thu, 26 Jun 2025 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750980442;
	bh=rGd8vHm/pPWBrQU2pyGvRYmV2BAuKK2EJhchFvW1jhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7jYLF0tw2pR7Hfsb/eeM3tS6+x9BiYkO1MmXkp5lMY3wDl7vxrlGP+jyGJGcxP4C
	 /un5N8u6PQXyfXvbbkWd5hIVeyO6Ci3gIqzfKWetXWhMmQodR3EaWB9HfKQMlfIdwu
	 fYurMq9P0VUgvlK2EPtT1gj9nkaSIeZ+rfuC/eXMbQGS1n7vs4BxkIO87xb95mPqNQ
	 g9yKKW/csMUMnElCSTVr6z45DixTZ84TSgC9as+/BG7Ml6athlIiVlWg6bUDyFqQl0
	 4s4wPtKxunL0/ZR9QIXCXgCjNEZ3MzZXi5BlUTaFcF3Jz+W2nhBuyAvpdJ9plcGF+q
	 4QmfjxWg/hpDg==
Date: Thu, 26 Jun 2025 18:27:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
Message-ID: <175098044101.1398221.2403754383485344517.robh@kernel.org>
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
 <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
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


On Fri, 13 Jun 2025 23:17:07 +0200, Sasha Finkelstein wrote:
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 95 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


