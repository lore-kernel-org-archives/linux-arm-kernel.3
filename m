Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89863C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ+pjMXC2Zmf+k3azV2wTZbnYLfzVS0FL+k8+g+kpUo=; b=y1RiSvj8KxIMVI5Ea1UQqyibvE
	vL9he13nKlYpR+iyH3P3M4OqnINScZ7m5fPluVX3mNRK5NaUCxUYwwIRLNNVPW7LsZQKqKXfFzKfQ
	OWSMaqVhY+XdpXhNcsec731hCs3kwxy1hZSLAZvEOcHJzFDw8JUVvoWDw5toE4xiTEd1HPujhxAqm
	nSbMbbKEpvIae2nzwJ6lvT0vXoMcKU11QAQp2ob1FEiodABGru6bCoWBf1WKZzHroZOUkCBDphS0t
	vV14llS0dSduuz3/6YJ3fJuqZG8tP4qVWMqGCCCLqLB0AYtDAP+Kj01/sn0K6Q5Rhcq3NU33nnm8q
	O2Xwpb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69KE-00000001PIo-0ObI;
	Sat, 19 Apr 2025 14:37:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69Hn-00000001P4n-30uN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 14:35:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEZBZw1215283
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745073311;
	bh=lQ+pjMXC2Zmf+k3azV2wTZbnYLfzVS0FL+k8+g+kpUo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NixDSI+I+2n56yXHoyjD8dWB6M4CpFTB37/qCm5o8pcAuSf3iAqlBug9dNYFAqLNl
	 vXh4ZW135cr52A7o5049pjMgvfec7VEuhh0DhB7J1bX9b2FtLKxyQm3DK1G6ALgXCH
	 JOf48wcyNtA9LXqdDCTS7mYwkGi5SRXzn3VEOD+I=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEZB4V006564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:35:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:35:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:35:11 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JEZ6T4116797;
	Sat, 19 Apr 2025 09:35:07 -0500
Message-ID: <a6e16f44-884c-4b36-aa87-306a764829d5@ti.com>
Date: Sat, 19 Apr 2025 20:05:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for
 main_gpio1
To: Nishanth Menon <nm@ti.com>, Jared McArthur <j-mcarthur@ti.com>,
        Robert
 Nelson <robertcnelson@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, <u-kumar1@ti.com>
References: <20250411203950.2859356-1-nm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411203950.2859356-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_073515_807678_0A54D03F 
X-CRM114-Status: GOOD (  12.98  )
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


On 4/12/2025 2:09 AM, Nishanth Menon wrote:
> main_gpio1 controls the voltage for the SDcard from 3.3v to 1.8v.
> This is required for proper operation of SDcard through various boot
> stages.
>
> Fixes: c5e615963bbe ("arm64: dts: ti: Add k3-am67a-beagley-ai")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> index 9be6bba28c26..bf9b23df1da2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -309,6 +309,7 @@ &cpsw_port1 {
>   };
>   
>   &main_gpio1 {
> +	bootph-all;
>   	status = "okay";

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   };
>   

