Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44F4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRGWTHgGwYeRGtMbF7wolQdkBEUFLXkw8SB4nbbhEkE=; b=xLrA7Sr77gYCamZ67tTN+IRrmb
	AU8LW8OH/b67KBt8d521TYNDtvtixmIghvfQkmTnMiilb7ewxGR4a3kQpQeIXOv5c17vBpAklkAXF
	nz8USNGx7zR69YgtnRc2F6P4xo+7ir+LOmIdeAcdoFAuM307cuJ67myHrX2SndJ4wKf1gZozXcoX4
	OKCJtmz2opLJ2QvEPQl2BQRPhm3wvro+lDtkiPatjy55Kwi2gnpd58U+q21VWtfuV8V27NowsVG0s
	09Q1u1wqtnJ/y9AxDXoYjYJWJ4DA1YcVyJd0B9oCYDLhxCjzc8ZfpUnttjtKYmo2tOi+ixSF8eHPh
	dkMO076g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjQj-00000008yHX-0TxF;
	Tue, 14 Jan 2025 16:06:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjPS-00000008y0K-2e8A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EA2B5C5923;
	Tue, 14 Jan 2025 16:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6FDC4CEDD;
	Tue, 14 Jan 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736870693;
	bh=qhWdcZn1dnf9UswuIjBHrCxfXiNgcVjed/B1j0/Eqtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCsq3Rc2qthMAhAiSM7c/C7pcVVoI80EmGwO2gE4wneNBcSqS/zBtMKa0HK+IvoYx
	 dPRNXLMNBWGPrE6PRGuA9MbsQ5O6hNqKuOKAFe4igczL9VghyWZUZ0wZbGNY0Dn5pS
	 st8HmWv/85vgO1xs2xewKdtW7FAsRvQA0pnqxzSxRO34vbX89L+gwdcz7lgboEeXFB
	 38psowrl69SdQ5KlOCu+5ED14AavMCyIl1CufyXnCG6vSFwlD8miyda2K1MTxBdQvz
	 4jYfUHGM98REpIS5LaQKW7t2hfx64iFMUhbq5a3seUklkxsCdr/fgTAp3NH6F588H0
	 MFKKBMNK75ieg==
Date: Tue, 14 Jan 2025 10:04:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: James Clark <james.clark@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: coresight: Update the pattern
 of ete node name
Message-ID: <173687067372.1133944.2572630345939017589.robh@kernel.org>
References: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
 <20250107090031.3319-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107090031.3319-2-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_080454_706793_C6CBC0D6 
X-CRM114-Status: GOOD (  12.16  )
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


On Tue, 07 Jan 2025 17:00:30 +0800, Mao Jinlong wrote:
> The device full name is embedded trace extension. There is no good fit
> in generic names list for the embedded trace extension. ETE is abbreviation
> of embedded trace extension and the number is the CPU number that ete is
> associated. Change the pattern of the node name as it won't affect any
> device tree node as of now.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!


