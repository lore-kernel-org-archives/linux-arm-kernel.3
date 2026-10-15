Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F85CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MycHCtKOpCViJUeUQ3alLvxWUMdQesuZvEMWTh9BpTU=; b=MJXz1OdW1AjqSjFjs/vY/rsV1/
	gxPXfBqWcMGNF9GGAssbvMM+0g83l6JS3iqWrJM8r55ABILdaqrBuWZt0Vj4PiiPDXgR5lF0s+vgs
	KnyR6tZAeZ3DT0uLobIyNDcsb3n4YTHXKl7BFoh5vrCl7WvJ9ajg/LohwSkHwE2lyGjax3tJWCQ8L
	VnaxVcjR15kdvF6bSxI4z08gS10sRIydlMsRkZ+pJo4JdFluGj0pgG0Cwid0damIxtdzwK1iN4SNV
	bV0csk63KPWZlyHU8QMjmDau+jmUzWmlwjJMyQPRdA/g2taztOsxcRb0uMOimmvM6gIGkC92DKI7R
	cJAB/I4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHnq-0000000HGwz-2gMx;
	Thu, 15 Oct 2026 09:31:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHno-0000000HGwG-2aS8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:31:09 +0000
Received: from [10.94.176.134] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 900F720B7166;
	Thu, 15 Oct 2026 02:30:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 900F720B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792056662;
	bh=MycHCtKOpCViJUeUQ3alLvxWUMdQesuZvEMWTh9BpTU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HsS7G5z2YTlyMJh+eltF/Bob62gbHOQPMm0/uY+RUwcHz/a/n9Q7DHaDm6Nf6CLAF
	 79v7iwxOtdcJ0XgDImeJ+bgCeYQWMLG3q3SveAuSHE1Up5OqX4XKoh7C51G/xWqxmn
	 LeFvjc3+6mIVpVxjYBuim3ZfN6F2BnZYsdful1Uc=
Message-ID: <20175a31-2ef8-4c12-b329-616cb07d3d0b@linux.microsoft.com>
Date: Thu, 15 Oct 2026 15:01:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: xilinx: versal-net: Remove CPU idle states
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, git@amd.com,
 ptsm@microsoft.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, sven@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
 <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_023108_696896_D0C58CCC 
X-CRM114-Status: GOOD (  17.06  )
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



On 07-10-2026 17:49, Jay Buddhabhatti wrote:
> The sleep state powers down the CPU core, and the wake-up time cannot be
> guaranteed because the firmware may be busy handling other tasks at the
> time of the wake-up request. This leads to unpredictable and potentially
> high wake-up latency during CPU idle.
> 
> Remove the sleep state to avoid this dependency on firmware. The default
> backend CPU idle state simply puts core in WFI and retains its context
> without being powered off. Since wake-up from WFI is handled entirely in
> hardware, it is effectively immediate (a few cycles) and does not depend
> on firmware availability.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
> Changes in v2:
> - Remove the idle state instead of replacing it with a retention state.
> - Update the subject and commit description.
> 
> Link to v1: https://lore.kernel.org/all/20260727121842.3410495-1-jay.buddhabhatti@amd.com/
> ---
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 29 ----------------------
>   1 file changed, 29 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> index 21bb917bcba1..9b74e59fd64a 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> @@ -103,7 +103,6 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			reg = <0>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -133,7 +132,6 @@ cpu100: cpu@100 {
>   			enable-method = "psci";
>   			reg = <0x100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -163,7 +161,6 @@ cpu200: cpu@200 {
>   			enable-method = "psci";
>   			reg = <0x200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -193,7 +190,6 @@ cpu300: cpu@300 {
>   			enable-method = "psci";
>   			reg = <0x300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -223,7 +219,6 @@ cpu10000: cpu@10000 {
>   			enable-method = "psci";
>   			reg = <0x10000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -253,7 +248,6 @@ cpu10100: cpu@10100 {
>   			enable-method = "psci";
>   			reg = <0x10100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -283,7 +277,6 @@ cpu10200: cpu@10200 {
>   			enable-method = "psci";
>   			reg = <0x10200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -313,7 +306,6 @@ cpu10300: cpu@10300 {
>   			enable-method = "psci";
>   			reg = <0x10300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -343,7 +335,6 @@ cpu20000: cpu@20000 {
>   			enable-method = "psci";
>   			reg = <0x20000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -373,7 +364,6 @@ cpu20100: cpu@20100 {
>   			enable-method = "psci";
>   			reg = <0x20100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -403,7 +393,6 @@ cpu20200: cpu@20200 {
>   			enable-method = "psci";
>   			reg = <0x20200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -433,7 +422,6 @@ cpu20300: cpu@20300 {
>   			enable-method = "psci";
>   			reg = <0x20300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -463,7 +451,6 @@ cpu30000: cpu@30000 {
>   			enable-method = "psci";
>   			reg = <0x30000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -493,7 +480,6 @@ cpu30100: cpu@30100 {
>   			enable-method = "psci";
>   			reg = <0x30100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -523,7 +509,6 @@ cpu30200: cpu@30200 {
>   			enable-method = "psci";
>   			reg = <0x30200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -553,7 +538,6 @@ cpu30300: cpu@30300 {
>   			enable-method = "psci";
>   			reg = <0x30300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -632,19 +616,6 @@ llc: l4-cache { /* LLC inside CMN */
>   			cache-size = <0x1000000>; /* 16MB */
>   			cache-unified;
>   		};
> -
> -		idle-states {
> -			entry-method = "psci";
> -
> -			CPU_SLEEP_0: cpu-sleep-0 {
> -				compatible = "arm,idle-state";
> -				arm,psci-suspend-param = <0x40000000>;
> -				local-timer-stop;
> -				entry-latency-us = <300>;
> -				exit-latency-us = <600>;
> -				min-residency-us = <10000>;
> -			};
> -		};
>   	};
>   
>   	cpu_opp_table: opp-table {

This change works fine.

Tested-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>


