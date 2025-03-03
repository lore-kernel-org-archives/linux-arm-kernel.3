Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF5BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR8tmI+bFqSQNSGqsOA9WHdMVHUZSanXCspyIqDFK9I=; b=FMAIJh6+nlZ8nvMIJPagACecX5
	cQHVq/Urh36m8MloOMgmznb3yrtA7NG+lEturHBsrO/uI3Y6FlID4VaYOAwT7HbrwE/O6HZm2nj2p
	edq4KYQbIVozGgHB+xQyzlOZQgpSYjw701ddmHpFGA93Xip9SBJHFIYJy6P1uH76MvxD9vtGFgS4o
	QpQDgyA/dXqaCHchWEmAczeRr/dgmBl4ACXgdX8ZWSMytylcQ1gXv+u+Mfr01mJxIE+mV6PscUACC
	Pa7hXA/4S+FURtPG38P1hdR6SFvEbwcRUL9ZNqoa6+xod9OsPg+sAe7TV+O1thLTOULs4b6eMygH3
	Ms3RycIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8R5-00000001StJ-2KqP;
	Mon, 03 Mar 2025 16:14:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8Dh-00000001PkM-0XTz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:00:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35789106F;
	Mon,  3 Mar 2025 08:00:54 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CF9B3F673;
	Mon,  3 Mar 2025 08:00:38 -0800 (PST)
Date: Mon, 3 Mar 2025 16:00:35 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Cc: <liviu.dudau@arm.com>, <lpieralisi@kernel.org>, <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: corstone1000: Add definitions for secondary
 CPU cores
Message-ID: <Z8XSIx75B4mtcV48@bogus>
References: <20250303153744.376419-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303153744.376419-1-hugues.kambampiana@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_080041_212306_060CA2FB 
X-CRM114-Status: GOOD (  18.41  )
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

On Mon, Mar 03, 2025 at 03:37:44PM +0000, Hugues KAMBA MPIANA wrote:
> Add `cpu1`, `cpu2` and `cpu3` nodes to the Corstone1000 device tree to
> enable support for secondary CPU cores.
> 
> This update facilitates symmetric multiprocessing (SMP) support on
> the Corstone1000 Fixed Virtual Platform (FVP), allowing the
> secondary cores to be properly initialised and utilised.
> 
> Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
> ---
>  arch/arm64/boot/dts/arm/corstone1000-fvp.dts | 24 ++++++++++++++++++++
>  arch/arm64/boot/dts/arm/corstone1000.dtsi    |  2 +-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
> index abd013562995..df9700302b8d 100644
> --- a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
> +++ b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
> @@ -49,3 +49,27 @@ sdmmc1: mmc@50000000 {
>  		clock-names = "smclk", "apb_pclk";
>  	};
>  };
> +
> +&cpus {
> +	cpu1: cpu@1 {
> +		device_type = "cpu";
> +		compatible = "arm,cortex-a35";
> +		reg = <0x1>;
> +		enable-method = "psci";
> +		next-level-cache = <&L2_0>;
> +	};
> +	cpu2: cpu@2 {
> +		device_type = "cpu";
> +		compatible = "arm,cortex-a35";
> +		reg = <0x2>;
> +		enable-method = "psci";
> +		next-level-cache = <&L2_0>;
> +	};
> +	cpu3: cpu@3 {
> +		device_type = "cpu";
> +		compatible = "arm,cortex-a35";
> +		reg = <0x3>;
> +		enable-method = "psci";
> +		next-level-cache = <&L2_0>;
> +	};

Why are these not part of /cpus node in corstone1000.dtsi ?
Also I see the original cpu@0 node doesn't have enable-method set to
"psci" while these secondary cpus have. Please add the same and move all
these changes in corstone1000.dtsi unless you have strong reasons not to.

In that case, please clearly state the reason in the commit message.

P.S: I was about to send PR soon for v6.15. If you want this change for
v6.15, you need to be quicker.

-- 
Regards,
Sudeep

