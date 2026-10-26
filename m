Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE1606A328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0gIo3wnE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kK6KAtcp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ReopTLtwQNEVhs7qRFvgKJ+ZmFHz1cCFpaMGBdlN7ds=; b=0gIo3wnESgqDdK49MDGAAs+mio
	2SfwNbpK8Bu+b3vARgDr+VHXSS2LRtsY2SKj9hmovGE+p/0osqinZPzCglXGF3DOZDht45r/cNSKV
	c0xR/BkeZzO/XzhB/yfXCtGgZRWzzhtdlpDbbnphcmObMOvu8Y/QFvIYiCeRliKbaNLG1TsQC0QEs
	3JT4ulaV09vmA4ONt7dm+C1HxLo1XLXYeDvx6pBOXsTPvnlRwng4ybDvIxdJzA4tw6q10yo2knITN
	XOQ/sa/MOjHbPvHbImkrL1/VlaF2WHy/+s07PTNZZeTdKqmBcGx5yemmMG6E7pYgR5PiovtSDGU3h
	XaC705+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFUZ-00000001s3h-1jBT;
	Mon, 26 Oct 2026 07:51:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFUY-00000001s3W-3jLV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 07:51:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 545E6600CB;
	Mon, 26 Oct 2026 07:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF581F01825;
	Mon, 26 Oct 2026 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793001098;
	bh=ReopTLtwQNEVhs7qRFvgKJ+ZmFHz1cCFpaMGBdlN7ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kK6KAtcpcJVtoleORKRGvQMTbkBoXD6YMNGx/enpf+xC5rMP/oswCcruMBvWnxCVb
	 09gboOOnQYNlQgt4cSaAZhBLWhfSVpuNq9NzxvM0UiWrLykPMgkZPt+rVdFngQChet
	 cV0Wke/cdj5gDrWaPCG5jsaMbR/kST2oO+jDHGfyGfHFtAS0qwhf3RJtK6HALcr9aq
	 ffYblwaIm+2djIWwu9R9qj0k6vBwfJwFEKXmIclifXTkCFxZPAPMTfd0MP6hxBeXaI
	 j0u9OEX5daFxBICOSYnIHtKIpT8MqxcUSPM4g5i5JKcxORGxBxEx/nLOXtru05DHFm
	 Yt9lksUulWEkg==
Date: Mon, 26 Oct 2026 08:51:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu.vizoso@gmail.com>
Subject: Re: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
Message-ID: <20261026-encouraging-musical-piculet-debfeb@quoll>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Andrei Aldea <a-aldea@ti.com>, David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Tvrtko Ursulin <tursulin@ursulin.net>, Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org, Chirag Shilwant <c-shilwant@ti.com>, Beleswar Padhi <b-padhi@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Shuah Khan <skhan@linuxfoundation.org>, Robert Nelson <robertcnelson@gmail.com>, Randolph Sapp <rs@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Tero Kristo <kristo@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Andrew F. Davis" <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 08:39:28AM +0200, Tomeu Vizoso wrote:
> A firmware may drive the core's timers, which need their power domains
> held; the remoteproc driver does not hold them, so let the DSP node
> reference them for a driver that attaches to the running core to hold.
> 
> Assisted-by: LLM
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> 
> ---
> 
> v3:
> - Initial version
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index d6319c8e96f8..80eaef0a19b8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -76,6 +76,23 @@ properties:
>  # Optional properties:
>  # --------------------
>  
> +  power-domains:
> +    description: |
> +      Power domains of the SoC timers the running firmware ticks on and
> +      times its work out with. The firmware programs these timers itself
> +      and makes no power request for them, and the timers' own nodes are
> +      reserved for it, so nothing else requests their power; a client
> +      driver of the firmware holds them on while it drives the processor.
> +      The processor's own power is managed through ti,sci-dev-id, not here.
> +    items:
> +      - description: power domain of the first timer

first timer

> +      - description: power domain of the second timer

second timer

No need to say that power domain is a power domain.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


