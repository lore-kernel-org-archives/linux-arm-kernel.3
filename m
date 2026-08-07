Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FD8C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrMbeDtSQlhSgNrbLkiq15nIVBWXNtcN0NqY2+7szXo=; b=3vjOX8x9GXk5JbWDkBcwTaY+HV
	2AnMFt+2IQrpEz0N91JaDsVpMmT3uu/1jsrzrizUpdyflgN/XiUsfmsQMa3b+CZHB36kjGiBEsOM+
	pd643Zb6ZJgWc7yysepDSctiyfA75uRBCfzjX29l1Vi/FKKhUcLhgFc6LVOchqOFX8KoogNx4vr+x
	vJHvVArKP/DcP9AlVl1BvlSeUdEmPnxNopaRUnmCP964mvG3b9Ho2mwDOisR+WTsXxMreHLs5rHLC
	e5GwHRs6srgYD7aPXaAmwhAHTOKfP8gWyXP/KZ/o5qhDBFT07OpCUhiBpCQVl9gRHsh2VNUs8Offs
	b4YZWInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL1g-00000008ByC-2hpn;
	Fri, 07 Aug 2026 13:54:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL1e-00000008Bxx-2wcA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:54:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30355411FA;
	Fri,  7 Aug 2026 13:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2E31F000E9;
	Fri,  7 Aug 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110858;
	bh=LrMbeDtSQlhSgNrbLkiq15nIVBWXNtcN0NqY2+7szXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPAz7OMsggRQ7QcTvFsfkCdc1vsvSkSdCCPF+larKoF9MfnPwchfBnAhnqvMxp5rT
	 OiTJ7+CBqRK18/yFf3zpt87QSiibbNWN70Ri+NLzGCGIJpcsS1BJjzJgWlxvUELXvV
	 KLCg/kr2HK3chT/+vWvG1SGr/zk2FDWItiX4t1FGa5NBRMv1odKTInB411jK4da2wp
	 aB8e6jXbNSUC7sY3/BVt//VlwyINyEHh2AJSsWVDbS3taDe7aihnzQN3LaknnVnbET
	 VguGsEbX9osV/tzXlvUO9jslcz8ooZ1SIgsGLN2e3qJIVmHMRYSs9TVq1yw0Dk+Cm3
	 UGwvg5S3H+4mg==
Date: Fri, 7 Aug 2026 08:54:17 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v4 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
Message-ID: <20260807135417.GA63178-robh@kernel.org>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com>
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

On Wed, Aug 05, 2026 at 09:02:29PM +0800, Colin Huang wrote:
> Document Anacapa BMC EVT1, EVT2, and DVT compatibles.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Missing Conor's ack.

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index dd7996960de3..1c2656d99807 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -84,6 +84,9 @@ properties:
>                - asus,ast2600-kommando-ipmi-card
>                - asus,x4tf-bmc
>                - facebook,anacapa-bmc
> +              - facebook,anacapa-bmc-evt1
> +              - facebook,anacapa-bmc-evt2
> +              - facebook,anacapa-bmc-dvt

alphabetical order

>                - facebook,bletchley-bmc
>                - facebook,catalina-bmc
>                - facebook,clemente-bmc
> 
> -- 
> 2.34.1
> 

