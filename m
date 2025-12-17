Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA626D65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVOOD0oX6H5lnhqoOO9kSPnDHon5igPG7Kldg5a0Tug=; b=1zJi59dIMVrY2IHEWNRakRlU7w
	2YB2+kzu3g7F2EExve6Uq9xPZqbBz+Kpxb+C/1R+dX/cfZ0vHezN+5yRR/OhHujC0Tz6Xcwgo0r8i
	Mxd97fPJK8oZCAC1BFqhXjyGFZk87yr/UoG/B8gMpEesDazZskMk4VbWL7Zp4G3S3nD97a7fD+HX7
	TJS+WY6/jB4OhmYy/YPlTZuXcl0YXVNodq/T1s55daKzhKrhlMXUhY4ZBuJB/Veft8TFtQPsmc7Bq
	tBZdaPMfUuAA2MxAzA92O/CMicrvrjv3yPUpvJQquh1p9MQX9mYahZ5n7EGXzYbih23BffzHQZeA5
	Vc4+PPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsQa-00000006v9H-2cw7;
	Wed, 17 Dec 2025 14:22:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsQY-00000006v8u-0hEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:22:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DE84FEC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 06:22:43 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 56F353F73B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 06:22:50 -0800 (PST)
Date: Wed, 17 Dec 2025 14:21:58 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vexpress/v2m-rs1: Use documented
 arm,vexpress,config-bus child node names
Message-ID: <aUK8hkoz0LmsIZXA@e142607>
References: <20251216191212.2879226-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216191212.2879226-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062254_275115_BF61A44B 
X-CRM114-Status: GOOD (  15.89  )
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

On Tue, Dec 16, 2025 at 01:12:12PM -0600, Rob Herring (Arm) wrote:
> Update the arm,vexpress,config-bus child node names to use the
> documented ones. Most of these were updated a while back, but I missed
> these.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> SoC maintainers may want to take this directly?
> 
>  arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
> index 158b3923eae3..248b8e492d43 100644
> --- a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
> +++ b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
> @@ -420,7 +420,7 @@ mcc {
>  					compatible = "arm,vexpress,config-bus";
>  					arm,vexpress,config-bridge = <&v2m_sysreg>;
>  
> -					oscclk0 {
> +					clock-controller-0 {
>  						/* MCC static memory clock */
>  						compatible = "arm,vexpress-osc";
>  						arm,vexpress-sysreg,func = <1 0>;
> @@ -429,7 +429,7 @@ oscclk0 {
>  						clock-output-names = "v2m:oscclk0";
>  					};
>  
> -					v2m_oscclk1: oscclk1 {
> +					v2m_oscclk1: clock-controller-1 {
>  						/* CLCD clock */
>  						compatible = "arm,vexpress-osc";
>  						arm,vexpress-sysreg,func = <1 1>;
> @@ -438,7 +438,7 @@ v2m_oscclk1: oscclk1 {
>  						clock-output-names = "v2m:oscclk1";
>  					};
>  
> -					v2m_oscclk2: oscclk2 {
> +					v2m_oscclk2: clock-controller-2 {
>  						/* IO FPGA peripheral clock */
>  						compatible = "arm,vexpress-osc";
>  						arm,vexpress-sysreg,func = <1 2>;
> @@ -447,7 +447,7 @@ v2m_oscclk2: oscclk2 {
>  						clock-output-names = "v2m:oscclk2";
>  					};
>  
> -					volt-vio {
> +					regulator-vio {
>  						/* Logic level voltage */
>  						compatible = "arm,vexpress-volt";
>  						arm,vexpress-sysreg,func = <2 0>;
> -- 
> 2.51.0
> 

