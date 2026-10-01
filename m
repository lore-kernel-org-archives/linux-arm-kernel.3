Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF824CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q03nJx3gAI8xGJWXWFkyzeKu1KfgZSX1kV5FHCi+Y+E=; b=ZpH0OULJG7HiMzYoJZgcRcnklM
	0ssInTEOZ2+E5k3vVj06wqtV6G5QYXNwZDhFIn/1dzc97OWe4FvbCEp0oU/aahJg1gUUxnfXKOmT0
	VKipfuPo0MTpBpc6H84qodhQiGlCd5LzZ33nahKnGmDfWiimfQ+VCycxzEzL/yRAXgG5jGKJ/ygQ2
	qbs0wS222VEy7OwWQr+7UW9c3oSJlzO5HMuhikyjK1sH8BqzPNLCmhx7t6OutkVBSbhyA4k1Ww0PZ
	WMr2B+q+ANo4KRAKQ0rXrC7zhDyr8DFdrcn+d5FqZjBxq4GYBaZ+/aUO4dD/MkWoW3jqFgqRbTeEm
	wJwdpoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDex-00000008T1V-2ydv;
	Thu, 01 Oct 2026 10:05:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDev-00000008T0N-1cA4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:05:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 777C6497;
	Thu,  1 Oct 2026 03:04:54 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 752623F85F;
	Thu,  1 Oct 2026 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790849097; bh=EsKLwztTkRBxwN/w4nnn25vqOweKjPOVm31gLdIJuPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPgdssakxaI/nLFm5XI+lkSSH4zrG9Udn9VZ8Ii2J/gmGEnwcN9Avh7pCIeaYGtn+
	 psD4muIFAfZuUPwSaS/mXqLk7UxaO90VIXZA0lrpl0NC4FeFmvA98CiJeGJogiAPXG
	 Ik6DKBFJGELumlqz+i3AwfvmMuMLAxe28ZvGHrts=
Date: Thu, 1 Oct 2026 11:04:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20261001100455.GL14479@e132581.arm.com>
References: <20260921232834.3138571-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232834.3138571-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_030501_495867_5743D34D 
X-CRM114-Status: GOOD (  16.22  )
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

Hi Rob,

On Mon, Sep 21, 2026 at 06:28:33PM -0500, Rob Herring (Arm) wrote:
> Some static funnel nodes have APB and AT clocks. Allow one or two
> clocks and the apb_pclk and atclk clock-names entries.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> ---
>  .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> index 9598a3d0a95b..4a3d08f9568c 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> @@ -30,6 +30,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: apb_pclk
> +      - const: atclk

The question is that a static funnel does not need to program any
registers, so in theory it should only need atclk as the module's core
clock, but not the APB programming clock (apb_pclk).

Maybe I did not get this right when I initially enabled the static
funnel in hi3660-coresight.dtsi. We should probably remove pclk from the
static funnel node.

  clocks:
    minItems: 0
    maxItems: 1

  clock-names:
    minItems: 0
    items:
      - const: atclk

Thanks,
Leo

