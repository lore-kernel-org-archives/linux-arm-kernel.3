Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D2DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ3gsu/+Nz0H/GR7MsuvkCswY4cSY5Uv50se5eJ30HE=; b=qi3zge/QHUkdNvIJfE5ew2SqAD
	uTfUtLm8fRXVec9SuIuEFZZmBUjiPlGq4lE0mjIsOCIHh/Qv0TNd99ZhZM9llcYikc2pdUubNec5Q
	XY0rPE/pZKKSgxHmhlNCK5l9a/CHzo3XqWhSRBIrNH5WHy3edr288m7WyVZCWhOIha6vk02iids8m
	CBHPJMQQESLPMyhrdwUJ2fEed/6XJp/FHgquakfbCr6r04b5iB886HVBAjdOq0kGzVngoAgC6odte
	KGokxt3oYsHfIDmwcXUhFKL3b4WpvoKrn6nvJDFGDyJIo0CSFZAdzB5Hf6iSyulyCdJnM2NOWyJc8
	DKOm9fFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA0x-000000054BP-1eHR;
	Tue, 07 Jan 2025 13:52:59 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9zi-0000000541D-0GC3;
	Tue, 07 Jan 2025 13:51:47 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 0910113800C3;
	Tue,  7 Jan 2025 08:51:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 07 Jan 2025 08:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736257898;
	 x=1736344298; bh=mJ3gsu/+Nz0H/GR7MsuvkCswY4cSY5Uv50se5eJ30HE=; b=
	eXwKXoxw1efnvQuiHMe9BGJeNRaZzvMWmanR5rhdTomqoUpH+W7tXaqIE1/OQDNX
	TXzv2r763Y5MQ0oezeiZUSBFbixOHnJIEFTLxUYacn/YDj/LAjGUSxRN+AGoJj6+
	p9X4ACV2LuDuHywV6qvqjICqukWvYPLGtlt/H7hMRQUOClQ3QUMjhvAinyWmtYL+
	bobSHj6gFlqBI5GJFeJF9PL9HnE4k5YjROMZxnJJOfX4OULhE1T/+BL0GFDCVk/L
	ogBcPFkSGwo/2TQayrPJkQFrV84Zv1hhwli5rQaiNyCpnUdUSyksnwC7m9Nkr8ag
	it0bdiSQ0h5IWqhGhCn42g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736257898; x=
	1736344298; bh=mJ3gsu/+Nz0H/GR7MsuvkCswY4cSY5Uv50se5eJ30HE=; b=G
	sY70qUrEP1gl1JmqNzVK6Mx/8c28BJ78vUcJO7JNM8lh3w89azzet2NIx1atdgh6
	6tBRFn/253U21TJl7yHSP5M/HrS/VlKJ1DH4lmkzXEP5PTlJ0+9KfA7hzFykjdSP
	uco1O/NCvQ3yvmhxgK7ELeZSFpxpdKWaK5bWgIMxw3ptwN+k8+1DWa1JLWgOtJUt
	76OvMJlHqqr/wc3llkI7OC0+NI4u8XOWGtAVekAR43qKHsETu6mCHFg054HAOJRd
	zCX+XouxB3rMt6Mg/F15ChHNUSaTYnXYwyor6PaSRnSbjyTSekLfx8rAfkIuMse3
	8+TTyTfkPrZ7xTWfzYdSg==
X-ME-Sender: <xms:aDF9Z3pV41Z8ilSxpuZ6kZwq1soEpbhUJmxiYaggnn3WSIgN3xVh_A>
    <xme:aDF9ZxodBR77iuH6RTcFq32Z35Tz46y4z6EWn-Mpwce-RfDyz3bd81AckneW_6Qo9
    A7IvVhlnPPmdhWiz1Q>
X-ME-Received: <xmr:aDF9Z0MYq7euBag4bww9oThV2Lxc8ly3ollEx864zINLN2DoVtD_7oEvR5VGk8Z7NyFijjGGDgGCA5OD4zJ9LRvqT1kUHV6OnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedvfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohif
    shhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnh
    hosehlihhnrghrohdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihig
    rdguvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
    hriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmh
    grihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhs
    shdrshhtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivh
    gvrdgtohhm
X-ME-Proxy: <xmx:aDF9Z67yTKirpIXhr7uOAnUFRHp29z-QED0WIUbsrTWDoHQwn46erw>
    <xmx:aDF9Z25sd6O7ooA9V9pC0JGVHYZoM0pVMgN7_K0p-x3LVp09locyaA>
    <xmx:aDF9Zyibkr81z35nI-9gUnSq7HyHIl1ixbleLn2TH9p5Nz05Xdu-jg>
    <xmx:aDF9Z46RT3TQJMg8X0ITjlQIq-BEw3jgaz1VKShuv7wY1i_1OQWOkQ>
    <xmx:ajF9ZxKisACKEQRyKzxYwIjSDnzb92ZSmhtFGzptkKUq9ZkjNYrOmHLR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 08:51:36 -0500 (EST)
Date: Tue, 7 Jan 2025 14:51:33 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Correct indentation and style in DTS
 example
Message-ID: <20250107135133.GA3765919@ragnatech.se>
References: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_055142_717323_55B5043E 
X-CRM114-Status: GOOD (  15.20  )
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

Hello Krzysztof,

Thanks for your work.

On 2025-01-07 14:10:22 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For renesas,*

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/timer/arm,twd-timer.yaml         |  6 +--
>  .../bindings/timer/renesas,cmt.yaml           | 44 +++++++++----------
>  .../bindings/timer/renesas,em-sti.yaml        | 10 ++---
>  .../bindings/timer/renesas,mtu2.yaml          | 14 +++---
>  .../bindings/timer/renesas,ostm.yaml          | 10 ++---
>  .../bindings/timer/renesas,tmu.yaml           | 22 +++++-----
>  .../bindings/timer/renesas,tpu.yaml           |  8 ++--
>  .../bindings/timer/sifive,clint.yaml          |  2 +-
>  8 files changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
> index 5684df6448ef..eb1127352c7b 100644
> --- a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
> @@ -50,7 +50,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      timer@2c000600 {
> -            compatible = "arm,arm11mp-twd-timer";
> -            reg = <0x2c000600 0x20>;
> -            interrupts = <GIC_PPI 13 0xf01>;
> +        compatible = "arm,arm11mp-twd-timer";
> +        reg = <0x2c000600 0x20>;
> +        interrupts = <GIC_PPI 13 0xf01>;
>      };
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> index 5e09c04da30e..260b05f213e6 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> @@ -178,29 +178,29 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/r8a7790-sysc.h>
>      cmt0: timer@ffca0000 {
> -            compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
> -            reg = <0xffca0000 0x1004>;
> -            interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks = <&cpg CPG_MOD 124>;
> -            clock-names = "fck";
> -            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -            resets = <&cpg 124>;
> +        compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
> +        reg = <0xffca0000 0x1004>;
> +        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 124>;
> +        clock-names = "fck";
> +        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +        resets = <&cpg 124>;
>      };
>  
>      cmt1: timer@e6130000 {
> -            compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
> -            reg = <0xe6130000 0x1004>;
> -            interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks = <&cpg CPG_MOD 329>;
> -            clock-names = "fck";
> -            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -            resets = <&cpg 329>;
> +        compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
> +        reg = <0xe6130000 0x1004>;
> +        interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 329>;
> +        clock-names = "fck";
> +        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +        resets = <&cpg 329>;
>      };
> diff --git a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
> index 233d74d5402c..a7385d865bca 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
> @@ -38,9 +38,9 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      timer@e0180000 {
> -            compatible = "renesas,em-sti";
> -            reg = <0xe0180000 0x54>;
> -            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks = <&sti_sclk>;
> -            clock-names = "sclk";
> +        compatible = "renesas,em-sti";
> +        reg = <0xe0180000 0x54>;
> +        interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&sti_sclk>;
> +        clock-names = "sclk";
>      };
> diff --git a/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml b/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
> index 15d8dddf4ae9..e56c12f03f72 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
> @@ -66,11 +66,11 @@ examples:
>      #include <dt-bindings/clock/r7s72100-clock.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      mtu2: timer@fcff0000 {
> -            compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
> -            reg = <0xfcff0000 0x400>;
> -            interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> -            interrupt-names = "tgi0a";
> -            clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
> -            clock-names = "fck";
> -            power-domains = <&cpg_clocks>;
> +        compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
> +        reg = <0xfcff0000 0x400>;
> +        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "tgi0a";
> +        clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
> +        clock-names = "fck";
> +        power-domains = <&cpg_clocks>;
>      };
> diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> index e8c642166462..9ba858f094ab 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -71,9 +71,9 @@ examples:
>      #include <dt-bindings/clock/r7s72100-clock.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      ostm0: timer@fcfec000 {
> -            compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> -            reg = <0xfcfec000 0x30>;
> -            interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> -            clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> -            power-domains = <&cpg_clocks>;
> +        compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +        reg = <0xfcfec000 0x30>;
> +        interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> +        power-domains = <&cpg_clocks>;
>      };
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> index 75b0e7c70b62..b1229595acfb 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -122,15 +122,15 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/r8a7779-sysc.h>
>      tmu0: timer@ffd80000 {
> -            compatible = "renesas,tmu-r8a7779", "renesas,tmu";
> -            reg = <0xffd80000 0x30>;
> -            interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> -            interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> -            clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
> -            clock-names = "fck";
> -            power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
> -            #renesas,channels = <3>;
> +        compatible = "renesas,tmu-r8a7779", "renesas,tmu";
> +        reg = <0xffd80000 0x30>;
> +        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +        clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
> +        clock-names = "fck";
> +        power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
> +        #renesas,channels = <3>;
>      };
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tpu.yaml b/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
> index 01554dff23d8..7a473b302775 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
> @@ -49,8 +49,8 @@ additionalProperties: false
>  examples:
>    - |
>      tpu: tpu@ffffe0 {
> -            compatible = "renesas,tpu";
> -            reg = <0xffffe0 16>, <0xfffff0 12>;
> -            clocks = <&pclk>;
> -            clock-names = "fck";
> +        compatible = "renesas,tpu";
> +        reg = <0xffffe0 16>, <0xfffff0 12>;
> +        clocks = <&pclk>;
> +        clock-names = "fck";
>      };
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index b42d43d2de48..d6a73be66765 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -76,6 +76,6 @@ examples:
>                              <&cpu2intc 3>, <&cpu2intc 7>,
>                              <&cpu3intc 3>, <&cpu3intc 7>,
>                              <&cpu4intc 3>, <&cpu4intc 7>;
> -       reg = <0x2000000 0x10000>;
> +      reg = <0x2000000 0x10000>;
>      };
>  ...
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

