Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD02CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9envwYzZ92clWlakOTwEB8OwjhYiaIjEdDGYyGrbM9I=; b=XANUQ1hmGv2/BX9r1ZAMFJCvV/
	lU+SHk4pFJo3kMAlMrOtHRVatGUcsv7hTqOR+OlaECbjDm/pnHgfCQpoFz9fOgMaMepZoWNPExo1B
	P4wNOhm4CyZdFhz6kOcNCwLGS7UpOZqZ7FNic7v3wFLdW8qJc9v/gEBwMH60HvZAkt41CqHTJAJeO
	KbwP2CjPJu/Y+v2/bee25c2gGZMHz5R/EFzL3TgjbAwx/X/c9OXXzaK3gnea3zhiYAFGzWd2sjp9k
	pXigJ49seQKLS02ObN+Y387dbBWTE9w+hnq/LaClA3n5E66TZ0eSN8htvrp+P4SszbaNimO4ihSl7
	zkV7eKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBJ-0000000AhHo-3Taf;
	Tue, 03 Jun 2025 10:47:45 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOYM-0000000Ae6R-14t7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 10:07:31 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553A7RYU434801;
	Tue, 3 Jun 2025 05:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748945247;
	bh=9envwYzZ92clWlakOTwEB8OwjhYiaIjEdDGYyGrbM9I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uc9ZcM797rALfcu0pPISYFmZytwxqQlE2KwzzfUqTNUgiSkCBtCP5Zo74i2mAoVZo
	 hyLpyo/bd//gNNDXeD8peqymFytRcuiYxu7Q4MP6MuiF4rN1QdwLsF8+H4iJ6Mwk55
	 MEm+O+HqhPCWWn9hWwb0LDrxoIt3e4FgT8PU69YA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553A7RPW3669887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 05:07:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 05:07:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 05:07:26 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553A7QFm270530;
	Tue, 3 Jun 2025 05:07:26 -0500
Date: Tue, 3 Jun 2025 15:37:25 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-main: Make the "scm_conf"
 node a "simple-bus"
Message-ID: <953c4aae-9010-488b-aa11-4cc540cef127@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-3-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603095609.33569-3-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_030730_387703_80D429B0 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Jun 03, 2025 at 03:26:07PM +0530, Jayesh Choudhary wrote:
> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
> "scm_conf" node to "simple-bus".
> Also remove "reg" property as it is not needed by "simple-bus".
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

