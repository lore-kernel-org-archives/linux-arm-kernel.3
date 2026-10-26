Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C30606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w90YTTPU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Djp6KgM/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tGan54VoAnB4BE1bGQWN3/UB0AMHIKWY02TwZZSb8dc=; b=w90YTTPU3r4CKQcLjCUaBRrrfm
	GjaOco9uLNZ87nerzyX5lkxbwKEmoaRm7KTdmLPJYcQ4k2FyoNvodQbNu2hSB9aN3Wa6wMapHYWc/
	5sVPJXbaDBbp61Ghl9gb1hjTw4fHyOwudBm13QKqNJGc6F1v14rWhXrvAREv/WHEW7eO8OODKGUcI
	YJWFUo5CPkEYp7tL7K4vRAsXNCQkf83P4Zz1cnRhO527V6gztUCWIlt7qSwG4D04CtsBDRkTo5GHK
	Ubz8mrt6b2Q3tcMz66J9RJmEzfounCtavgPdI435cp9ribUu/9//GeWlkAZM5FoM6auX2bnZPX5dh
	+aDphqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFSb-00000001rj4-3oZA;
	Mon, 26 Oct 2026 07:49:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFSa-00000001ris-0CGd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 07:49:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DAB2600CB;
	Mon, 26 Oct 2026 07:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CF11F01825;
	Mon, 26 Oct 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793000975;
	bh=tGan54VoAnB4BE1bGQWN3/UB0AMHIKWY02TwZZSb8dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Djp6KgM/ed2JB1GYRGErLaSBWyk2umqHkL8Qd/t3iZ3KIQyMH6wf/SZcOl/F2nvnm
	 J08z3u6soNcscjlSljFsrWs6jyqderjJuFXv/LlciGkUiS9YEcnwijYS5Py3Q9pAwu
	 5bzhC5Ss5o53wBcVQrBHXM+T/1fFyG6FzDtDj8up7fgb9EzaTeYsGguzFoWm3A5Mdz
	 kQcxdWEhC+PHL5MtK8b5dR/4RhmmD/3Bfil48gkj2uelsLrQDnV57mcsLKCJGorOM0
	 Q2hbssBt6WxooFcoe9hM9jjebnDbKqSAs8zh4kX5GjMY1LopHj+IACG3uZoTLwjQLC
	 n/FTqA94ydnpQ==
Date: Mon, 26 Oct 2026 08:49:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu.vizoso@gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
Message-ID: <20261026-illegal-gifted-rooster-047a1a@quoll>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
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

On Fri, Oct 23, 2026 at 08:39:27AM +0200, Tomeu Vizoso wrote:
> Allow specifying a second sub-mailbox that could be used by the firmware
> in addition to the first one, which is taken by remoteproc.
> 
> This is required by firmware that doesn't use rpmsg for their
> communication with the Linux kernel.
> 
> Assisted-by: LLM

Drop

> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

DCO mismatch.

> 
> ---
> 
> v3:
> - Initial version
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index 278b88b7f906..d6319c8e96f8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -51,10 +51,12 @@ properties:
>  
>    mboxes:
>      description: |
> -      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
> -      communication with the remote processor. This property should match
> -      with the sub-mailbox node used in the firmware image.
> -    maxItems: 1
> +      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
> +      communication with the remote processor. The first is the one the
> +      remoteproc core uses and should match the sub-mailbox node used in the
> +      firmware image. The second is optional.

Instead list the items with description and minItems: 1. Don't repeat
constraints in free form text.

> +    minItems: 1

Best regards,
Krzysztof


