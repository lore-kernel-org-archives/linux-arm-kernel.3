Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2088CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTZm9U1cPD9vimLxQimadHgaUdAe55UKDx3bvY7y6mo=; b=Vfqq/pDx5CUNwwPy9n6CF7tUnw
	hqUdpfsXkuwJ1Xd/ULBD3jdBSXMVuZCwGXVVdUsRYZ+lz9p0UDV/MbED/t2YwSKRjmWCoD3Pxc21r
	uB9f3fwEF2R2UoMBp+4hCaxSVlEfZdQKVH/MAG4Nmrd8UpM+4zR1oA+IKAi1fBXd2RvEr63e83wOs
	1x4vtGAH0We2zkxiNyXT774nTJ6xIxOgJSir8JLL0QDQ0ab+oZNAWce4dB37dGt/kg9lqtLeuRHlF
	Y/DfEvFOzFF/1MABGYrq91UuXqcwfNjoDKf2hR4pOHEDFWXOYxZaaGrEW6B5gn02DMv/kerO7hoIy
	EoVS/3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNP-00000005iXM-14Q7;
	Wed, 30 Sep 2026 10:17:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNM-00000005iQO-2CsO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F28C660258;
	Wed, 30 Sep 2026 10:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E711F000FF;
	Wed, 30 Sep 2026 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763443;
	bh=PTZm9U1cPD9vimLxQimadHgaUdAe55UKDx3bvY7y6mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFk8MjPA9rDf3CgYl0N/4cCaosETF5OcNcOBcctT2/OKgZ7lFm7+yUbeItvvPeFYt
	 vyvu1kytXTxr+KmgnXaZZ6Z39TASLCzNR7/8PHtubwuZaR+GqyT30UKpCY8rl184Ix
	 gH7FBaGO+4Lw97IJuMAoALqV1Ms+lztrExeylee1zBJsx0mRQvrf9HDkQBpBtIwIFe
	 wKSTCrQdIt/wMYUAV5i1V98MVHVBQIVE1fjESdhHgyOsCUbxiqfO7Eu6nNbMnRFm2J
	 4Af8pv76K3KbjnSvRHbR4yzXvO7nlINWYIfy/p+yo3Vuwr8SdCHg4UzWWLNdhiCqWu
	 Xx/OHPB7zTomg==
Date: Wed, 30 Sep 2026 12:17:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 09/11] dt-bindings: interrupt-controller: add
 Allwinner B288 NMI
Message-ID: <20260930-sparkling-fair-peccary-06d0e3@quoll>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-10-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151016.186493-10-pmazzini@gmail.com>
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

On Sun, Sep 27, 2026 at 04:10:14PM +0100, Pablo Mazzini wrote:
> Same register layout as the sun9i-a80 NMI, like the V3s.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


