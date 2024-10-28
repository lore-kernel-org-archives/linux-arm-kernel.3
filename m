Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B318FD3399E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/gCeVTPDfCZ9Sq1m6pfoJ1aYry8ZWlrjxDFFQhYtRk=; b=IO5YdrviFdhTPPkeWGtBV5o+Zc
	gDSnWcFGSYIzOyiyLQKnRk8Vfqlu8nMkGxiAWCfCrPugubh2nCwShCLIsOzeRw+BCC/kqL5HhTSap
	UjcmOdjHgT/icjnNsyJhsPcTwTuebc04qm0r0kSGhEF19nizMchN4+W9y9mR4Hr83kvpuozHlWMjV
	0OTXld4TGdTBq5R4yyZ3Sq2/u0xIm+lzAfQ0Vkq5YGHyWBJPZ/qdAG1AJlOwoCxEH1ypIh4FrY5Ij
	jzW7+a5+2MWjXJvVHOGCKLi6EXFleO151Bk/iAZFa/nRDBhcsrV4iYOdhL7rZYMYxRGHnhtYRHyu+
	GpZsgxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Soh-0000000BXhG-3EcK;
	Mon, 28 Oct 2024 16:42:07 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SjZ-0000000BVch-3nH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:36:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SGajEu053859;
	Mon, 28 Oct 2024 11:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730133405;
	bh=h/gCeVTPDfCZ9Sq1m6pfoJ1aYry8ZWlrjxDFFQhYtRk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B5DrNiN0pEhLp8QSnCI5A2+V2KDXIFqTp+MceeqNiuSE+sLDK7LuHXunemDEZG2AE
	 5gfegkfufNVCYnh0U0MIk3UHD6u7zBBwgmJ9UmOydfoBIuJn+y3ccMxbMFL76uL5MD
	 2r1gGviVduJDS9WGCwLYZ8PiquWBzESUSiSXScMk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SGajIk109530;
	Mon, 28 Oct 2024 11:36:45 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 11:36:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 11:36:45 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SGafbs106057;
	Mon, 28 Oct 2024 11:36:42 -0500
Message-ID: <b2dadb0a-fd85-42fc-b340-6c77fe5ded0a@ti.com>
Date: Mon, 28 Oct 2024 22:06:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62x-sk-common: Add bootph-all
 property in cpsw_mac_syscon node
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero
 Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC: <s-vadapalli@ti.com>, <srk@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241011110207.600678-1-c-vankar@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20241011110207.600678-1-c-vankar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_093650_027569_50DEBFC7 
X-CRM114-Status: GOOD (  12.27  )
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



On 11/10/24 16:32, Chintan Vankar wrote:
> Add bootph-all property in CPSW MAC's eFuse node cpsw_mac_syscon.
> 

Why?

Please make sure commit message is verbose enough to say why the change
is needed vs what that change is (latter is obvious lookng at the diff)

> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
> 
> This patch is based on linux-next tagged next-20241011.
> 
>  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 44ff67b6bf1e..82d34dfb91ed 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -303,6 +303,10 @@ AM62X_MCU_IOPAD(0x028, PIN_OUTPUT, 0) /* (C5/C6) WKUP_UART0_TXD */
>  	};
>  };
>  
> +&cpsw_mac_syscon {
> +	bootph-all;
> +};
> +
>  &wkup_uart0 {
>  	/* WKUP UART0 is used by DM firmware */
>  	bootph-pre-ram;

-- 
Regards
Vignesh

