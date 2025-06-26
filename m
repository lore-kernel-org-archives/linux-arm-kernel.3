Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C723C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 06:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrnBb1u8+xN0axh7RXZF3RUvtezK1itX/RvwUC1NtH0=; b=Wla9Kw4gCeJ7UHk+p+HDHRjXJ2
	zUwq0IRXvI8EoJQa0VPSLHMbm8KF9c/e0Y6Gzf74vVVj0tJdxssf0GXO+dtfJF614YhCQH2YxCys5
	c3+Igr2c1SGD6JfSSUf/dMAjIGkVkCJaQ8pTM/ecF4/XIsMiAk1A1fT2vMG3QoK2fvjbfqmvRH/XM
	x/M9CQP7l+hGB3wkH3sJG/1P3smaBKF7zsDObmew99YTsd1BS1Cr6kYra44s9a8fS/sHMaq0dxKIb
	BZcLN2uzqgVzE8AtzZ9wbAbHBIrWzw4LTlhQt1hmdiLxAodBBE+I4m1E2Uiw6hLR0ICkcuypm3/Ri
	6irP86oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfvn-0000000AjEi-2HqW;
	Thu, 26 Jun 2025 06:17:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUftW-0000000Aj6E-0uED
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 06:15:35 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q6FU9O1658138;
	Thu, 26 Jun 2025 01:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750918530;
	bh=BrnBb1u8+xN0axh7RXZF3RUvtezK1itX/RvwUC1NtH0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MmymMmnGVpx24An7rZMbUABpApdcdUpdAEwaML+iE+J6pD7A0v+z94gmACWgZ14ru
	 /b8yCIO+YqaP694skNPA7oxeyieA/GGQU9717Qa+YJbXAggSjOc8hb7sqK9iDFlkck
	 FGmDP88Mr680fn+E60tZtNqrVjGJA1WYcIbCLIsE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q6FU5X1980491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 01:15:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 01:15:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 01:15:29 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q6FQpk506594;
	Thu, 26 Jun 2025 01:15:26 -0500
Message-ID: <0d81594f-ad1a-4c65-a00a-9c97c8b01a65@ti.com>
Date: Thu, 26 Jun 2025 11:45:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add DSI display support for TI's Jacinto platforms
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624082619.324851-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_231534_385918_272849C3 
X-CRM114-Status: UNSURE (   7.33  )
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



On 24/06/25 13:56, Jayesh Choudhary wrote:
> Hello All,
> 
> This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
> - J784S4-EVM
> - J721S2-EVM
> - AM68-SK
> 
> Relevant driver fixes, CDNS-DSI fixes[0] and SN65DSI86 detect fix[1]
> are Reviewed and Tested.
> 

Are these merged?

[...]

-- 
Regards
Vignesh
https://ti.com/opensource


