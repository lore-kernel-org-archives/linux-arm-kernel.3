Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E287B1075275
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI2UrckBzF17ns/wBn+hYi8gt9ywOOjF7CkWdCC689U=; b=BgwkRlswwT5BVWTPucYskRoFaB
	ddrbzPUAntTe8vpaXhzQ/wwV46nbuE15Et0AVbwfdiJ4Wc2HB7wf64XbYrPfzGXGy28nPXeCXxHQ1
	XmgK0PxLk3zFSVkICk1g6xmSZX5UB9ZOISxSU7jgtPHEf3lUoSOWtLrGN3tjEKhoItiLswV/rgSi8
	5pPWTrxLDRwuB14WGBvzV8cOQeE3rGYUFZBXgHiiNSABFzHUe/cNGi4eQHL5qmqLv3nd5FaNM03aj
	X4oxAr6ah28BYbbTPm+JwF+q4s0n5Tv5C4+fOAvbhBG/YL8cUferYLWjTc+CB4xmfe61Dzm2j8cst
	PUfarAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38Oj-0000000ACnJ-03r7;
	Thu, 19 Mar 2026 08:06:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38Oi-0000000ACn6-1rKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 822E06011F;
	Thu, 19 Mar 2026 08:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19E5C19424;
	Thu, 19 Mar 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773907587;
	bh=LND9QP38YR3zwrHcZrV2AQ0j85RMG+MUPI/TxNx7ph4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAoLMsnhwO55TSj97BpIYQ6GGdnoo4+804Ny+0owESLqk3FJnTkHlhyv9bLhrCF99
	 0sT9NpOmTKokTvdExb8z1iErj+uk0TzkZSU4ditf/VT0VWAYsiFFZTHZWFPSA16YBz
	 HGR/abXCzo4q5Nmyw6affJxlSHF78KGysbFhvCPbYOEvMAGCORBZkJKJ0R+UAZYJ8O
	 qAgEa3Sl1SpgbcJmBhJAcZdxXh84wI39Yqazewcwl3riFVXoG6FzQetlqQ50sJ0QmB
	 u2L2i6/3KU4FprDksfvPZ2uG4Xm+QPvcKE0Egk0g9uftSHIuR8QAnY/gyQMB4se5cW
	 +2bWg2UcYBLYA==
Date: Thu, 19 Mar 2026 09:06:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 2/6] dt-bindings: remoteproc: Add STM32
 TEE-controlled rproc binding
Message-ID: <20260319-prehistoric-mongrel-of-essence-fea9b0@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
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

On Tue, Mar 17, 2026 at 07:03:23PM +0100, Arnaud Pouliquen wrote:
> Add a Device Tree binding for the STM32 remote processor controlled
> via a Trusted Application running in OP-TEE.
> This binding describes the interface and properties required for STM32MP
> remoteproc instances managed by the TEE rproc service, including a
> linkage to the TEE backend through the property "rproc-tee-phandle".
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---

Heh, and standard comment...

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


