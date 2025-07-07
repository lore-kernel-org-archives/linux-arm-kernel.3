Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5291BC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adOl+0ZROT08R4gkFgtW0IB/T2wkeUgUvkFVxuu+NYc=; b=iYpkSDzD5kl2rVgorU4VjSio3h
	q6mZ8QwHcLeFlKpeEGMWVRxW2uxjXX+0r8cT+xynCs7j5V8iPfhvL33n+CeAJ4EQakThIvNOTUafX
	HIzqQKCLW3R735DgECW9OgdHTZKTIeVAw1YMH63ZdWMSRQkyseUrUr2TbptUFcTvfQr6wHvQQCIg+
	I3k5yxTTtVT7+qvTDrbM0cmZBdOHX/bi9ff5g4df2gLBlO5SkAd8dYcD9pUpDNWxtQV1xQYk/N6NX
	vlRsZ4u1BIvoo+regRCPeMScTagDiUveBo1HaMKSXWxiob4p9t73Wax8DLtDdHKk9ch4zXqBYKt9h
	4sRA+sgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpRb-000000038x4-36qm;
	Mon, 07 Jul 2025 17:15:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYooI-0000000329q-48uv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:35:20 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567GZECo272112;
	Mon, 7 Jul 2025 11:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751906114;
	bh=adOl+0ZROT08R4gkFgtW0IB/T2wkeUgUvkFVxuu+NYc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Jb+md87f0hCU48J8NYDmrYFm9cW/xbIkCvhKNm5VZUGAPSfZa/5fdiLg84Hf5XYjR
	 uKUxKsBqRjqZSlCI11hbbFf/8xkhRkHf18G9/pVkYj2TZPNC6OqG3/Oh4qhOvvR3Ub
	 iHXwD9OkB6ylEHOAmYM0DCbGss3yJu2dCs179nJw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567GZE0w2389392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 11:35:14 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 11:35:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 11:35:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567GZDaW223977;
	Mon, 7 Jul 2025 11:35:13 -0500
Date: Mon, 7 Jul 2025 11:35:13 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v6 1/4] arm64: dts: ti: Add bootph property to nodes at
 source for am62a
Message-ID: <20250707163513.g5mzvuf4o26dq7cg@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250704100954.2231853-1-p-bhagat@ti.com>
 <20250704100954.2231853-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250704100954.2231853-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_093519_073637_CC65870A 
X-CRM114-Status: GOOD (  10.14  )
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

On July  4, 2025 thus sayeth Paresh Bhagat:
> Add bootph property directly into the original definitions of relevant
> nodes (e.g., power domains, USB controllers, and other peripherals)
> within their respective DTSI files (ex. main, mcu, and wakeup) for
> am62a.
> 
> By defining bootph in the nodes source definitions instead of appending
> it later in final DTS files, this change ensures that the property is
> inherently present wherever the nodes are reused across derived device
> trees.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 13 +++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  2 ++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

