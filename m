Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A814ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7eCumLJRVxXkVrrCzfdq48+hh6xilH+s0pYgrmlgbE=; b=zJ08KaBtwr5PaCoHfWLlfKac+4
	qE6Z4/BQV3j845ls/KVDK2X0E28mjWRuOZCfuQ3WOIAwWmCxgPvlsAB+PEACRdWBYfh6iQkzk52ln
	iMQUSm8KZJ9uggxEJKR9K+7AYOBaRXFv03VZlDTnsj/BMUs1Doz0G1MMlZirCaad56XTW5F9s8eUj
	ZN2VpcIK1kgR7j3mwlwoAltfQQWFkiMWjBOvKDUSqLln1ds0EaWOZtOxJYvox44xQp/KSPQVoqa33
	RhDtNY9ZP4jERYoO240JKNy9uDJX9K1OXPywsBoDiXguHXvbY7kT1yTCiwSebCfzo+X7h1nXMTDlN
	2mMQi+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQwZ-0000000036j-01Ou;
	Fri, 05 Sep 2025 07:33:11 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQ2L-0000000HJUR-11jr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:35:07 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 732A7245EC;
	Fri,  5 Sep 2025 08:34:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1757054094;
	bh=m7eCumLJRVxXkVrrCzfdq48+hh6xilH+s0pYgrmlgbE=; h=From:To:Subject;
	b=MTr7dAou1BzD/n5kZvgWpUlcsxUSShVIOKD577/anK6dZbyF1uWzkF/XNu7r3lr4C
	 BCNDa7/CudLSQsB06MB72d19JQU7Rh2FFO9ju9yOphO0uKfUIVYnxrZwrHKaVCDs8z
	 G2FgZHlb3f4fCDm4jhYEwblST1EqUkW72OWVvkzZ9RrB5dDJ0qH/lzvOtPDjb/CnRE
	 3B00jxIi2imWCxG9CVCCS/971hgJbbvre+VrLLvZbnuu7v98OdSdmmpMGNPsfWH6pX
	 /enfx1K6l2vtQ7n8CCKthU+xiOUC5N2Mz8UFmDq0Hc1H3FIbG83Nryb0qXZUI5OePn
	 B/4PzjVqfLMbg==
Date: Fri, 5 Sep 2025 08:34:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Josua Mayer <josua@solid-run.com>,
	Logan Bristol <logan.bristol@utexas.edu>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH v3 17/33] arm64: dts: ti: k3-am642-sr-som: Add missing
 cfg for TI IPC Firmware
Message-ID: <20250905063449.GA6194@francesco-nb>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-18-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-18-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_233506_315916_8C150768 
X-CRM114-Status: GOOD (  15.22  )
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

On Fri, Sep 05, 2025 at 10:48:30AM +0530, Beleswar Padhi wrote:
> Currently, only R5F remote processors are enabled for k3-am642-sr SoMs,
> whereas the M4F in MCU domain is disabled. Enable the M4F remote
> processor at board level by reserving memory carveouts and assigning
> mailboxes.
> 
> While at it, reserve the MAIN domain timers that are used by R5F remote
> processors for ticks to avoid rproc crashes. This config aligns with
> other AM64 boards and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Cc: Josua Mayer <josua@solid-run.com>
> Cc: Logan Bristol <logan.bristol@utexas.edu>
> Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Requesting for review/test of this patch.
> 
> v3: Changelog:
> 1. None
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-18-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 27/33] to [PATCH v2 17/33].
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-28-b-padhi@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi | 54 +++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
> index 81adae0a8e55..8cb61f831734 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
> @@ -162,6 +162,24 @@ main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
>  			reg = <0x00 0xa3100000 0x00 0xf00000>;
>  			no-map;
>  		};
> +
> +		mcu_m4fss_dma_memory_region: m4f-dma-memory@a4000000 {

this must be

mcu_m4fss_dma_memory_region: memory@a4000000

the device tree specification requires generic node names, my comment [1]
had nothing specific on verdin am62/am62p.

Francesco

[1] https://lore.kernel.org/all/20250821060629.GB7503@francesco-nb/

