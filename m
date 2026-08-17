Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC1BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJq/NEqpyI0j+eTy2U2bsI6AtQTfq+l/OpHu1gOBeiI=; b=osoIVDV1dh283ZJzDUtmtUOn+t
	CZhYVLdOrU5KESpDwUIIR4KgDcqHKryakWKd92dLIGBbMiqpJD9lijqEBoz9y7DQJoRnRYTcgH6S7
	7sq5EV24PCOU3mQzuw+1QVxpZo7gvq1Ltso6iHBXZZ1BDbelaesdhZqtZJZgFofJHlHeNBOnTNU7U
	uKl6UNA2zZQ6qI58iatwEzaZa15Qma4c2lBM6RLODZyM46ptiblB7GJPbquilkpNFEVyGRELgnnAq
	NohzPW/sBvpRSQd0CGhsNlsjV98CZafdstD/JZGDrwg9I/D1Xq8+5SpNLE4Wb2EXNbbD82480jyS2
	FtY/0RIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3CG-00000006jKE-2Yiq;
	Mon, 17 Aug 2026 19:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3CD-00000006jJn-3aIM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 19:40:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 084A31655
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:40:26 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A96FE3F673
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786995629; bh=J3MdS4PH0Su/2ookildlSnvG/LcVZKRvW1iJ6HnLlBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuHPe3RQiHvIVgjbWXWwDI6MNgIRx1nYqT0l7fqPtuRaV539AWX3TVp3RfhNd559Z
	 8xJ59tAbtrw3UmFMsM74g+pYx3pLuIRWA2vpRTm4f8WKQ2kxdy6aekiCy86De3cCmy
	 Y+z4X96HzXYsldwOnJ3WLIJRYebHh2aR5/Zs3/X4=
Date: Mon, 17 Aug 2026 20:40:23 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: arm: corstone1000-a320: Fix GIC
 redistributor region size
Message-ID: <aoNjpw8p6tUw8b0v@e142607>
References: <20260817185607.1756124-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817185607.1756124-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_124034_021156_41672867 
X-CRM114-Status: GOOD (  17.31  )
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

On Mon, Aug 17, 2026 at 01:56:07PM -0500, Rob Herring (Arm) wrote:
> The Arm Corstone1000-A320 has a GICv4 which means the redistributor
> region should be 4x256KB rather than 512KB. This issue didn't become
> apparent as SMP was disabled as a work-around in early versions of the
> FVP.
> 
> Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  arch/arm64/boot/dts/arm/corstone1000-a320.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
> index f0937914350c..f895a024fc92 100644
> --- a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
> +++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
> @@ -73,7 +73,7 @@ gic: interrupt-controller@1c000000 {
>  		#size-cells = <1>;
>  		interrupt-controller;
>  		reg = <0x1c000000 0x10000>,
> -		      <0x1c040000 0x80000>;
> +		      <0x1c040000 0x100000>;
>  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

