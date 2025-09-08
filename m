Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F08ECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 05:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD10PMU1TzZU6qCBI/H3X2vWuvtCsYpb/SWrbhwPDQ8=; b=J6jqVo05sbv983nX1vcQjaWDKE
	DnghNN74sMCoOTL0vRGNYgx4SDNXePOVlQGXR5yMu+itR6X81B0HgUZCd1ML8xA7zqentrTDuEP/v
	B+fR/Al/xYDKHdHfNPe/OL+T3hdL8ec+N+fbalQPPawzq2jhVrdKuzVdCurxKZYCJIF0hh6k9q19L
	fArD2pn0ous8Ef28+vz3d9KE+yPcDm2ZIoRpwd7XqpwnKVPjkusi0ZUux/F+zsdbjS3HFcB632DN/
	Sy/IAD+WfkeixRhop/bR90OXb8+RSYl5NXvOk23IhFg5ockX4bFQAoUC8hbF1JfPDi8Y2p2JpX7hZ
	PVYBvB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUCR-0000000EfXD-0vdu;
	Mon, 08 Sep 2025 05:13:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvU9b-0000000Eefx-0f3b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 05:11:00 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5885ArRM3786043;
	Mon, 8 Sep 2025 00:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757308253;
	bh=FD10PMU1TzZU6qCBI/H3X2vWuvtCsYpb/SWrbhwPDQ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dvxxrrk9D331FhpRWuIikGj76xo/4pAV7N2GxyErr1r2HW5eKp/bwaLsVNP02OO+6
	 uJBWXK14Z16FZUEaFE0TH6Ui1iaxs1LC1DybjPcDY2nXwEK7czzr+/mKLyQfIhTcp1
	 QnOkZvIIkFhjQZG4ev7QN51hrQI34PnggWvfuuI4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5885AruF2752898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 00:10:53 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 00:10:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 00:10:52 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5885Am0H019772;
	Mon, 8 Sep 2025 00:10:48 -0500
Message-ID: <ca85e58d-7c5a-4327-8c2b-e0f9143fb0d8@ti.com>
Date: Mon, 8 Sep 2025 10:39:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250904112538.529857-1-a-kaur@ti.com>
 <20250904112538.529857-4-a-kaur@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250904112538.529857-4-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_221059_246071_4A7EB140 
X-CRM114-Status: UNSURE (   9.78  )
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



On 04/09/25 16:55, Akashdeep Kaur wrote:
> Add the drive strength, schmitt trigger enable macros to pinctrl file.
> Add the missing macros for DeepSleep configuration control referenced
> from "Table 14-6172. Description Of The Pad Configuration Register Bits"
> in AM625 TRM[0].
> Add some DeepSleep macros to provide combinations that can be used
> directly in device tree files example PIN_DS_OUTPUT_LOW that
> configures pin to be output and also sets its value to 0.
> 
> [0] https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 47 ++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>


-- 
Regards
Vignesh
https://ti.com/opensource


