Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D1CC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUoEpxJAPpePFUnYzadpeX3o71EYpvH2B9GUgZ/Ia3g=; b=cKAssGDknmad386RsNoh8j4rpD
	n23ZbazVJe9JdLiMUY4wXl8K6qrfbUD7aucYh3F7EeF0P9ivmEaNP0OVT2d6+blQFLvPeKkTId64w
	xz+CDKq9x2aEaUiWHzbN/chpQSQf1mKsqGLHPZOt3S8Zq6Alur0GUvwz/EIwWCTwu7WVO4U03y9lE
	BiPdacbW8uW45rs3QiuWL5rHTI4r0FQIx64T8ylpEiXtiqI1JahNsOfMzA1YiufNyqCMqf4GKCPjK
	ACAURGRq/dL2H7zGnqDGbxmVd07r9QZSYNJulZpJ/zrJ4yvO5FZ02NmyRT2zOYF/+v0B4nafFzI3p
	JF7j/cNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64YK-000000015iP-1pVC;
	Sat, 19 Apr 2025 09:32:00 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64WP-000000015b8-1zdu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 09:30:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9TpKA473892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 04:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745054991;
	bh=tUoEpxJAPpePFUnYzadpeX3o71EYpvH2B9GUgZ/Ia3g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qK8qWIVT8IVJlD91hhub8378U7hhcJ0sKLPzsaNs2sMq9pTMRrqxsKMzOAeF66Iha
	 Czf1mSeFsYns282PK+m2ZxYlKNX8XX3cDwrzZuDC2uu1v4RpHNT8ftL9tdkhOMiUuf
	 bY0MeDfka0/dlHPQlCWTrQ1a/xPbObjSYxeoo2g0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9TpoW113705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 04:29:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 04:29:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 04:29:51 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J9TlrM075765;
	Sat, 19 Apr 2025 04:29:48 -0500
Message-ID: <945e0247-a971-48de-adb1-60a1e7fe5f24@ti.com>
Date: Sat, 19 Apr 2025 14:59:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 DisplayPort-1
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-7-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411105155.303657-7-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_023001_604471_902088CB 
X-CRM114-Status: GOOD (  13.15  )
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


On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
> Enable DSI display for J721S2 EVM.
>
> Add the endpoint nodes to describe connection from:
> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>
> Set status for all required nodes for DisplayPort-1 as 'okay'.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 95 +++++++++++++++++++
>   1 file changed, 95 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index f691ae4c19e6..15a7d9b813d3 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>   			 <3300000 0x1>;
>   	};
>   
> [..]
> +
> +&dss {
> +	/*
> +	 * These clock assignments are chosen to enable the following outputs:
> +	 *
> +	 * VP0 - DisplayPort SST
> +	 * VP1 - DPI0
> +	 * VP2 - DSI
> +	 * VP3 - DPI1
> +	 */

Sorry for basic question,  In this series , you are enabling only DSI 
interface.

why you need clocking for other interfaces ?


> +	status = "okay";
> [..]

