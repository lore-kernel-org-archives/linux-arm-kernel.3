Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A97CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSLvVPaQ0rlIcm6Z9XUeylLuoGuT2lgeopOGTbrCFC8=; b=nD0AcEC/x6It0pJXOHc1M9KM9e
	sAVAFVjvOJFUF6kUaSPSVDdle1QnKaDt0RziuiBLQF/xx722kUD1DBsX1NIx1Vt8vwxfga9GkNsaw
	/yT4hRx/W1YVng0kH8xcOkk0o2dBVz2lBvtypZyd9mdhMdYKamViWAnc+Oos5ax713LjBXe9kRaMb
	JL5DJN/uvGeaU03XFjr00674Pj+mnNLNahmpr9tzMJYWPtqX16y9YeQ1SPZbiHuPcyQYV/y8BceUg
	kSYXq5PMRrg2m0bNTK3omseHh5Jo873yodnOiwfWloIs/EBnBvspLeBap5sXKiHZuKdWlWsYoGn2D
	HdomRSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC16x-00000007BMg-2nbH;
	Wed, 30 Sep 2026 20:41:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC16w-00000007BMH-0Cxe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:41:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28CED601F0;
	Wed, 30 Sep 2026 20:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB891F000FF;
	Wed, 30 Sep 2026 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790800864;
	bh=jSLvVPaQ0rlIcm6Z9XUeylLuoGuT2lgeopOGTbrCFC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahlsScF1V1nutlzVUBh2PZwWPERWmEX+e/yOQXe+DUHRby9U6ZOD8CPiHbOU2bN1M
	 UTVsvVbiMqCdchWt1rjXT1Di8ELPm1PQgZPFinzUoLJtOp9L+fHxTLi0ukzdbgjNZc
	 KhoyiOEXy+MpVf2dbjIcX7Na+ACI/Sh6JuCALmDFJV4V7b50VXWxXCmY7bKuXhPy5H
	 pIOQ2km/teot8yk40JClWI51EMX0ndW7wYhP9K7O8oB3bl//ItQcvT6T5wA2yygdeh
	 JK6MKpBzPShY4a3Rx8es8hpcMeOmOcYqI5L69Mm0/HJcz3hWj+EPPmnrOq7wLiUsFE
	 YPf0bQSK4npIg==
Date: Wed, 30 Sep 2026 15:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Mike Leach <mike.leach@arm.com>, Conor Dooley <conor+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <179080086261.186348.9807658580842807205.robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232834.3138571-1-robh@kernel.org>
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


On Mon, 21 Sep 2026 18:28:33 -0500, Rob Herring (Arm) wrote:
> Some static funnel nodes have APB and AT clocks. Allow one or two
> clocks and the apb_pclk and atclk clock-names entries.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Applied, thanks!


