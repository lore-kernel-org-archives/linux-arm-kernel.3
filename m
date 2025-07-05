Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A5CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIc2e1gJuTQrZEoQGBh/ZjGwcoWSCc2ZYuU7ApNwKmU=; b=Ghhf22QmL7TPCOmXWPUgBbe7xa
	5d1GtZjvz19dmfXiJZAlsK3dPCsssJ2+CIKgfvpUL15oLajPVvEOsy6K1zIyr0VrT8Yluo99BO4MQ
	nGdHjX53Z+83H/HIm+6OszuP39OKCq4JiJGcpEvAT+BtIXWOh83Se/kePU4Xr431XaZKwUJuhRPrB
	GuTM6SZfRFUwBskfPkTk2Jmmj6FpMR+yVGXXbdSt7oTDuOfx3AiET2jwLz65Eci7YFCq2q714L++J
	HXxam0sbaUA7clQCrF10fWraSKscUVOyKRQbmr8svTgcXwJGw6QwcBpKbrwfWC6/190t6t7bggrfm
	q4qiiT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyAt-0000000GHmD-26Wb;
	Sat, 05 Jul 2025 08:23:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXy8X-0000000GHf3-3tfL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 08:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E91C8A53896;
	Sat,  5 Jul 2025 08:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84892C4CEE7;
	Sat,  5 Jul 2025 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751703640;
	bh=9I85kkzttzt8W0D61CGAt5BTcsDYsuzD5spP/3r4tYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSVweVJS68HR8H6mXNh752tIIU2k2XiL+57f5HTpCTnjoG7LPFH42KmIpDBgN9wKd
	 s/UTQxlhKQkD2Me0o1/6mQtu5KSD7789l99eLo6X/oCBG80dtI9m+opgmvw+KfV55n
	 g27ptmRcsDvRZ9Jj40bnjiFoxcSpqtH/6fYoAoTqeW45kWhgfGZ5GB5ctC5AEIa9dT
	 Y5dAfMAMTIqG1gldZY9Ir+PMTnQBozVzBTq4t9g51KvAaeJMe8B6IsTrrJxaa6BS6d
	 jxg6LU6GXTNp2FhmDbU591sLKXVQ4w2aAReQT4iOjsdapfpziVIcTk6gHXiupVM7CR
	 Jt7B//9g2iZ1Q==
Message-ID: <507129db-a84e-489e-aed7-f1f86e6d188b@kernel.org>
Date: Sat, 5 Jul 2025 10:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/9] arm64: dts: cix: Add sky1 base dts initial support
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 maz@kernel.org, sudeep.holla@arm.com, kajetan.puchalski@arm.com,
 eballetb@redhat.com, Guomin Chen <Guomin.Chen@cixtech.com>,
 Gary Yang <gary.yang@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-9-peter.chen@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250609031627.1605851-9-peter.chen@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_012042_135667_0FB2BC2B 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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

On 09/06/2025 05:16, Peter Chen wrote:
> +
> +	firmware {
> +		ap_to_pm_scmi: scmi {
> +			compatible = "arm,scmi";
> +			mbox-names = "tx", "rx";
> +			mboxes = <&mbox_ap2pm 8>, <&mbox_pm2ap 8>;
> +			shmem = <&ap2pm_scmi_mem &pm2ap_scmi_mem>;

These are two entries, so two <>.

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +

Drop blank line

> +		};
> +	};
> +
> +	pmu-a520 {
> +		compatible = "arm,cortex-a520-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_partition0>;
> +	};
> +
> +	pmu-a720 {
> +		compatible = "arm,cortex-a720-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_partition1>;
> +	};
> +


...

> +
> +		mbox_ap2se: mailbox@5060000 {
> +			compatible = "cix,sky1-mbox";
> +			reg = <0x0 0x05060000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#mbox-cells = <1>;
> +			cix,mbox-dir = "tx";
> +		};
> +
> +		mbox_se2ap: mailbox@5070000 {
> +			compatible = "cix,sky1-mbox";
> +			reg = <0x0 0x05070000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#mbox-cells = <1>;
> +			cix,mbox-dir = "rx";
> +		};
> +
> +		ap2pm_scmi_mem: ap2pm-shmem@6590000 {

This should be just shmem@

> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x06590000 0x0 0x80>;
> +			reg-io-width = <4>;
> +		};
> +
> +		mbox_ap2pm: mailbox@6590080 {
> +			compatible = "cix,sky1-mbox";
> +			reg = <0x0 0x06590080 0x0 0xff80>;
> +			interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#mbox-cells = <1>;
> +			cix,mbox-dir = "tx";
> +		};
> +
> +		pm2ap_scmi_mem: pm2ap-shmem@65a0000 {

Same here

> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x065a0000 0x0 0x80>;
> +			reg-io-width = <4>;
> +		};
Best regards,
Krzysztof

