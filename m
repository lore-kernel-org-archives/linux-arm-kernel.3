Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E513FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64gjq9YtekxWTCppAv9Geq8upJcZj2N/k3LuAvBLUdI=; b=gByMbMT93tfEM4b636Uxindq31
	MTiy+b10ALOVUu/tdFYZ5aoN/A6ghIkzgmIu+QpFUy+WeojzqPHXKvYKQvmQvY6419Sko3zlhjkNy
	Kmupg5dRclrpmbsPLn9LXnqEUmU22VU3Y40yuT0fcdncjfjws5zVCV4kepsy8+moosKCbF8jmOXXo
	w5Fd6e/dxZb4mSYDKcde73jo1l+d/Ga5pYULpi7/oRhiOykrmPr3uMjE0oCCbxlBURbPa2CfrclbJ
	UHYNpgWufMMvAXOiaxMIy55MG0zbive0lKa78bH1/gG3VJO3E8ShuM7ed+1MqXreJCTYqTimxiUa7
	cXbiP+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaJD-0000000EH1X-1X7B;
	Mon, 24 Feb 2025 15:23:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tma2y-0000000EDih-00VE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:07:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OF6u61921099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 24 Feb 2025 09:06:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740409616;
	bh=64gjq9YtekxWTCppAv9Geq8upJcZj2N/k3LuAvBLUdI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ui3379+2jVld0ccSTVkxmTwn9H7pVz2STTMIbb8EKb3uPBnAFo5t+FRVwpnWI80+W
	 Y1kYWF+C+gLo6RZgxYvGrvu3CfP9p2pPDeOPGyftb9Zl9nVcDMkKbSET3aS+vV6b0i
	 2pTKU53ZePsXKc01GwMQDegWnG50z9oAN/pmQD+Y=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OF6ulo020354;
	Mon, 24 Feb 2025 09:06:56 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 09:06:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 09:06:56 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OF6uRC081701;
	Mon, 24 Feb 2025 09:06:56 -0600
Message-ID: <c81ccd05-4fb7-4ec0-8cc0-c59ac4dff91e@ti.com>
Date: Mon, 24 Feb 2025 09:06:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62a/p: Add r5fss nodes
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Hari Nagalla <hnagalla@ti.com>
References: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_070704_330250_A96EABFC 
X-CRM114-Status: GOOD (  12.93  )
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

Hi Markus,

On 1/22/25 3:54 AM, Markus Schneider-Pargmann wrote:
> Hi,
> 
> am62p-wakeup already has the r5fss node defined, but it is currently
> missing from the am62a-wakeup domain in the devicetree. This is added as
> part of the series.
> 
> For am62a and am62p starter kit boards the r5fss memory region is added
> and referenced for the r5fss core 0 node.


This has already been sent here: 
https://lore.kernel.org/linux-devicetree/20250210221530.1234009-1-jm@ti.com/

Thanks

~ Judith



> 
> Best
> Markus
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> Markus Schneider-Pargmann (3):
>        arm64: dts: ti: k3-am62a-wakeup: Add r5fss
>        arm64: dts: ti: k3-am62a7-sk: Add r5fss memory region
>        arm64: dts: ti: k3-am62p5-sk: Add r5fss memory region
> 
>   arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 25 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts     | 11 +++++++++++
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts     | 11 +++++++++++
>   3 files changed, 47 insertions(+)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20250121-topic-dt-updates-am62-wkup-v6-13-4d15b4e9e996
> 
> Best regards,


