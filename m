Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0155606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ks7YjAmS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjzRGLZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ShzVspK63fdOHkKO/fREdPnfmyl4LMUNmIISdYeZBvs=; b=ks7YjAmSPQgYb3Tp/ny/kaMuPT
	Fvamlfi8DXhgBD+xa82A9PxUf7l9ENo6T+hZAFjmLxUXNfjLlXkLAeYOkA1keo+PTZzika97lvol3
	hKFXP81FmetWrJmuHgcK9W93jT3tTO2z/9sP+NsEm8b/ERAHLtAqdVQsLzKZkECIp/8k8aQqdyTOg
	Sbuy37tsZhnZrTpuW0q4yG8ec6gifFnI01gzuSLit3F4ZfBkW4SJ1/yb6EqaaYIFDTLqyCA1bEyOC
	wqzsDPoJxeXKZF8290ahTFwlQKIHSgts7ZU1gkHg9tPmCnZPyvnXBLft/y+LKsBHTnMGRaVQhseW1
	WP9UVVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOid6-00000007416-3vyr;
	Wed, 04 Nov 2026 21:34:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOid5-0000000740X-0wsM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:34:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC42C60601;
	Wed,  4 Nov 2026 21:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD941F000C1;
	Wed,  4 Nov 2026 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793828086;
	bh=ShzVspK63fdOHkKO/fREdPnfmyl4LMUNmIISdYeZBvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjzRGLZyATdRZBvdjN+WU4amzH+gIDfCBzj7SUCFI5kHr9JhSawlSa0wmKrmX5SsA
	 PEnNgZDPzDocxjy4EVkMjIjLLI1m/sbbv8xnoXX+NeM12f8oOGl19B4cGpFvIwvo96
	 UWFUNxTukVUkSvMDIhOgs1MhW2NpIXr9iVAr+ZuaQf8zJSPW93iJOcwnMBeVXDn85T
	 9ezAvJ1ymvkTn/gpYXKjtedjzUzguQ0UGrZVgGn7oeNkC0/sPOvYixN4gEBp+AY3WM
	 MnxANfDVzFYjnfTmokKlCfp5Sd48FUOLPmcRuelKXrkyeyCmIAb7KSdP9uLBGZXBZk
	 Q7tAqPZck2KLQ==
Date: Wed, 4 Nov 2026 15:34:44 -0600
From: Rob Herring <robh@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Message-ID: <20261104213444.GA348285-robh@kernel.org>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
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

On Tue, Sep 29, 2026 at 03:18:06PM +0530, Hardeep Sharma wrote:
> The QUP wrapper maps its serial engines 1:1 into the parent bus. On
> 64-bit Qualcomm SoCs that bus uses two address and size cells, but on
> 32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
> forces those SoCs to spell out an explicit ranges property instead of
> the plain empty "ranges;" which dtc only accepts when the child and
> parent cell counts match.
> 
> Allow either one or two cells so the wrapper can follow its parent bus.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This fixes existing warnings, so I applied.

Rob

