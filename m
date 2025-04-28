Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F0EC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ktsSLpDHL/YXYlSRA4w0F/KyZ2Iy1Ve2h1qSr/sg/w=; b=f4wxmaaDoGLhTucPozVExYjJnj
	lT0XE4YR3qVirKBcMwbMTpEdddNmF8rycx99r/rCFbljothQD6QsolLrmU4rOgi1l7U7pW/6kIxu6
	rECnboe09iBJSmHD45NCCMu5FUDFgRzd0r02eRBVXHoZ/wGeh76HoFwRERc5Izseq9G0aG+NaySyC
	5uMwmM3ebyJosWPPjbRDtfIdBDAbZOoXR5AsHTp4ZU3yQSmBHe12JDPzn2BqjK0EGZuN70LaMGbzJ
	4kEw3JKRb79i4RtwAmZW3AKvNV7HiAnVdUIlugp2QDmrhRvaJVx6MDHr702BPPBl/VHpJqrgP2Qnw
	khYetd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RSQ-00000006x4R-0v7O;
	Mon, 28 Apr 2025 16:35:50 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RMG-00000006w26-0aZ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:29:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTOo53610771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857764;
	bh=6ktsSLpDHL/YXYlSRA4w0F/KyZ2Iy1Ve2h1qSr/sg/w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YkUKNpGuYviCbnm2NmUujjNnyx/hsW+3bCF6vezGm8SuvlAaH0MlZsc0p93R/UtbV
	 mzaWHWPV73W7SGNfjSrGF+PRLwhukngK60e4PECqq4pJQpDsUIULLPhtZ1x1pOBsjE
	 Xa/94eYWpJcYTAf0QFodPVPn9JsJAhqSqCcjMzqo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTOp0031572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:29:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:29:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:29:23 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGTMkS115141;
	Mon, 28 Apr 2025 11:29:22 -0500
Message-ID: <72e88ddd-dcf6-42ad-92c7-15869f83dd8c@ti.com>
Date: Mon, 28 Apr 2025 11:29:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4
 for C7x DSP
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-11-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-11-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092928_229260_29679EEA 
X-CRM114-Status: GOOD (  14.00  )
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

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> The main rti4 watchdog timer is used by the C7x DSP, so reserve the
> timer in the linux device tree.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 8d7645bb90337..032f1f18d184e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -830,3 +830,8 @@ &c7x_0 {
>   			<&c7x_0_memory_region>;
>   	status = "okay";
>   };
> +
> +/* main_rti4 is used by C7x DSP */
> +&main_rti4 {
> +	status = "reserved";
> +};

