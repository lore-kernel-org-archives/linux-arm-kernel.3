Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtqvaOSvetymIpUFY7Yj+mzkgKexqkLh++dBg1DHMlc=; b=KaxseGR9fXF7ZsVNgq2xCr7be0
	tU6hLQ1ddSOKM5BMXImGvz5OKMb2lYzWB/qlw0HihZ8+uD04VdmJpNamp+vssZCBcTLcfiz2ymOas
	CemvAap1AzNyaXJ3NXELToeW9glpPDsz9oPbyOEdvCTCcSQ9Va2vUbOEIEs3RSZLjpOG7MR6pSp6y
	vENKeMNK1B5JI4BSzdq7CONi9lUxexyVL5xx5gA2Q5Nf5KNCzFcY+22/P+rJHhyytCXbSzC60g0gh
	zocLVvOWeUXy3K3A8DGMFNbwQjFbo/tk0V263j5hE6jTGzLQ1PRM/apuqucrPi/RQp2uqo1ibiWWP
	opmBAMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHsR-0000000GFe3-1czv;
	Fri, 10 Jan 2025 16:28:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHRT-0000000G842-14RR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CAE75A42588;
	Fri, 10 Jan 2025 15:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD8BC4CED6;
	Fri, 10 Jan 2025 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524857;
	bh=WsbcWmB4avxs8PQ/QnaxJWbjKMgGATeU+dv0LMHwpN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBtxZpWCC3jEJLSPpplJMW60G78iuBm7SqVlr734mSfH1iNP3M8nzUsmrupFykPTu
	 XBW/1fyZXEsjeCgzc4/XI/8Y1KkNYq6Za5LIcMaVQP1vjzu/WrhJ53ekwE6ir5izWD
	 lbNM9O8tlsuJaflzHloCsXh5YHPmz8DQdaSPo8QvT9T1eaB8qwPzoSQnY14/Q3JjQZ
	 qWvti6dJ5XXw4S0uNoi78Cnq6HCPWqdvkgxt7/EVg7nY2wTHFwKWyZmbUT8enQcloT
	 ooe33jKH5mRxApn6IDhliX85a+XZ19V7oXhBfYJUIgo0lsyuCu54xH0hDglXZpEIPs
	 QiGb/2cpr5s1Q==
Date: Fri, 10 Jan 2025 10:00:56 -0600
From: Rob Herring <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH] dt-bindings: soc: Add new board description for Versal
 NET
Message-ID: <20250110160056.GA2939302-robh@kernel.org>
References: <20250108113338.20289-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108113338.20289-1-shubhrajyoti.datta@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_080059_356328_4CD1A31B 
X-CRM114-Status: GOOD (  16.40  )
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

On Wed, Jan 08, 2025 at 05:03:38PM +0530, Shubhrajyoti Datta wrote:
> The Versal NET (Networked Adaptive Compute Acceleration Platform) from
> AMD/Xilinx is a next-generation adaptive platform designed for high
> performance computing, networking, and AI acceleration. It is part of the
> Versal ACAP (Adaptive Compute Acceleration Platform) family.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> index 131aba5ed9f4..e0fa36be7e35 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Michal Simek <michal.simek@amd.com>
>  
>  description: |
> -  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
> +  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC or Versal Adaptive SoCs

Perhaps make this more general instead of adding to it for each SoC.

Also, the '|' can be dropped while you are here.

>  
>  properties:
>    $nodename:
> @@ -187,6 +187,10 @@ properties:
>            - const: qemu,mbv
>            - const: amd,mbv
>  
> +      - description: Xilinx Versal NET

Above you say "Versal Adaptive", but not here?

> +        items:
> +          - const: xlnx,versal-net
> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.17.1
> 

