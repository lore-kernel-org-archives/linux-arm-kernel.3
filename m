Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5230606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DpbEanKI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOvqxxLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Ds3C65fvT5xCzj/ZU+yWxOGchnXx9nGZT0Im7vt7Dg=; b=DpbEanKIQhtkguaTcPJEtAsI9o
	2AY+o3oj9FRhfYcj33bl2u0Gxo7Q+bw0EvNWvMTMqDBk1xOpCHyV6QHaHvVqbq99LyJWagmmkjkxb
	neX/qUy4o28hGYVZKnzBCfbvezTXRPr1LyrxJfU6wW+GC4TlYdS13iekj3dpMQMGyQfduLozWG5f0
	raeU6S83UO6Hu6xb9r7xOM3T4amrP1SuH02C9YZbb9dJrXfDosIdFXjqZNc9SsW0lJ9pfL/csvQpz
	MfGUxCqWGdKVD9LcPEB1DJaKQTxQ89SUYQyHB4OPFwnO3e3ohl7p5EyskOyW4GHgXxOMB3GnE54Wx
	0o2rIF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFO9-0000000BbCN-3VO8;
	Fri, 06 Nov 2026 08:33:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFO8-0000000BbCB-0zK8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A4F9601BF;
	Fri,  6 Nov 2026 08:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D111F0089F;
	Fri,  6 Nov 2026 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954011;
	bh=/Ds3C65fvT5xCzj/ZU+yWxOGchnXx9nGZT0Im7vt7Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOvqxxLOekQ7EUVCDQNPtj/sHckLvw3Kf0CnNnFTN8zanboUDBRUbyAVWlYzAAyT1
	 5F1O1z7WFQgGJpcFn2xfTSR1hog0cX5bEO6qercwxDDAbFb827qrKFScIC4X3epbRb
	 N0iLBzT9BWrWzzekB0Lf9iOV/CiG0NAxW/kUB56IqLIrR17kk/2bs3uUNcGbmU6v4b
	 J2VNtX6g1EnT9kT/r/ydbzE8ZjySAkhAbtvU0yGQ7Px2d0rQMyHmjTAVkPlihnX7Sf
	 Jh4I99HWZMPXmaX7iKZvUAB414qD9opTp5xFzpD83B7W3WwJG67M5zFzgm+cYrlCNN
	 wQvnHH1nhyjyg==
Date: Fri, 6 Nov 2026 09:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, devicetree@vger.kernel.org, 
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: dma: arm,dma-350: Describe the CIX
 Sky1 integration
Message-ID: <20261106-screeching-tireless-kingfisher-db6e07@quoll>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-4-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106013453.1134239-4-Jelly.Jia@cixtech.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 09:34:51AM +0800, Jelly Jia wrote:
> DMA-350 integrations may gate the controller with a bus clock or hold it
> in reset. Describe these standard resources on the DMA controller node.
> 
> Add the CIX Sky1 compatible with an arm,dma-350 fallback. Sky1 requires
> a bus clock for both its FCH and AUDSS instances, while only the AUDSS
> instance provides a reset. Require clocks for the Sky1 compatible and
> keep resets optional.
> 
> Both resources remain optional for the generic compatible alone, so
> existing device trees remain valid.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


