Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5538C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJkXfrPAxpJPDeMDmwVXBCvheZa++B3SkX7TfmxEWUI=; b=3TjVWcecFr41C/ntAMBhlIMGXt
	EcOIKsE5Xn9aBb0C1veaLPsMVfl5OCn6tXThlmBB40VCjMzTDfTWOuG/+iSiTn3tm0nIa6iGvDtba
	NYr/FxQmsFq4Ruej+x3rX+ZawqtVlQPa/6B3oXw3Lw8bThc5wUD7bCtGZejjtU1Y0ZIk89Y0RD+qm
	H4GmpGLq27vyyJKNYreSeUTUKaP1x/W3DZSQQ5bHUNi7lkLGBVNQ/qxBWXVJUFEDUCw3YNQKeaQXs
	4SLS9Uwn0UbBsZsoIru7xsIh88OgS1kt/kCYqg6r5J9+LIcTZW0AH9itYPYfSQsA3KfGiVhkel18V
	BdCF0M9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXoQ-0000000DCxf-2nlC;
	Fri, 04 Jul 2025 04:14:10 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXlE-0000000DCQn-0vpl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 04:10:54 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5644AlXR3718250;
	Thu, 3 Jul 2025 23:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751602247;
	bh=zJkXfrPAxpJPDeMDmwVXBCvheZa++B3SkX7TfmxEWUI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PfU85ndYBC4X+eoY306KEwfcUjMe2cXNwldNP83irprGxwk8ILAxdwgDsj/x2z17A
	 0P+o85f8wBkDjXdBhSNFS+escb7U2UrMYuw+GsJYSiOdoJpdNUvaaOl2BJbKTaDByD
	 MIYYDi6xxAF1aFhAeIzd1+w6lrAZgRQQhPqzotEA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5644AlJ42464333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 23:10:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 23:10:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 23:10:46 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5644Af6l2296864;
	Thu, 3 Jul 2025 23:10:42 -0500
Message-ID: <485dc90b-dc9b-4b1a-ad18-9a9ef117637c@ti.com>
Date: Fri, 4 Jul 2025 09:40:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250627115753.2246881-5-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_211052_542952_6DAF8C64 
X-CRM114-Status: GOOD (  10.72  )
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

Hi

[...]

On 27/06/25 17:27, Paresh Bhagat wrote:
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> new file mode 100644
> index 000000000000..70aeb40872a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
> + *
> + * TRM: https://www.ti.com/lit/pdf/sprujd4
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include "k3-am62a7.dtsi"
> +
> +/ {
> +	model = "Texas Instruments K3 AM62D SoC";
> +	compatible = "ti,am62d2";
> +};
> +
> +&vpu {
> +	status = "disabled";
> +};
> +
> +&e5010 {
> +	status = "disabled";
> +};


Norm seems to be to use /delete-node/ here instead. Please respin
accordingly.

-- 
Regards
Vignesh
https://ti.com/opensource


