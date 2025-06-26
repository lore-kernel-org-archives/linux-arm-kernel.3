Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA802C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXM74UcI3u4k+JqE0dnEaDmrDYErzhRMmIPodB5MjSc=; b=bM7q2jebCXju0MCmekqT8mKR78
	z0QWbCOw0CKCYtnPQmXqiVVd3+6/+uJhxI3O9pD5HGa2n8+EcWLj2pPmDbwuzDqi+Fb7itucYwCf9
	/PQEDc9VvP1BVe6nXBS8YHuwp1y84+e8LxVb+y5HSMp0fw23n/Kob6of/qyb2mBx5i7I32W0j+GZ7
	Jxt4+ylVqSXFjM2Jyk2iEKLbaNoXxpAoh0XE1lG2gGylWbluDERuJxCrbs3AuZftAW3d2I9dMug5P
	pSxQGqFfMfu67CZfEOLLhzsAsAXMvXJKDJHX3TGqv3/65+o1VHKak+3b2nRKh4dvp0SMMt0b9Aavc
	CmNEDZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiTb-0000000B4ZT-2l8k;
	Thu, 26 Jun 2025 09:00:59 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhum-0000000AxZp-0pxr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:25:01 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q8OtI41687514;
	Thu, 26 Jun 2025 03:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750926295;
	bh=zXM74UcI3u4k+JqE0dnEaDmrDYErzhRMmIPodB5MjSc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZOP3EYIkT1Y9S1WA4H37Otn9+Dm5Kb1brjFZW/Ku+jce1kb3TEkoH20dkt3D/iino
	 V/a6XOZv8Q0d5arEs4YqP4isD4wW5JqMZvLFaKmsaal6Jz9AGZd1ExgolExqXgG4kX
	 sILMvtLSv2aU68vxK72sMZ4dcjbpypRa3BiJv0zc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q8Otdx3455408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 03:24:55 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 03:24:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 03:24:55 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q8Onfa684895;
	Thu, 26 Jun 2025 03:24:50 -0500
Message-ID: <4fc54cf9-6417-42f1-8da4-4c8182f74adf@ti.com>
Date: Thu, 26 Jun 2025 13:54:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCHv4 4/6] arm64: dts: ti: Add support for
 AM62D2-EVM
To: Andrew Lunn <andrew@lunn.ch>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <devarsht@ti.com>,
        "Vadapalli, Siddharth"
	<s-vadapalli@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-5-p-bhagat@ti.com>
 <bf784ce6-aee7-4366-87ab-f0f79f8ef28c@lunn.ch>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <bf784ce6-aee7-4366-87ab-f0f79f8ef28c@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_012500_344374_8015F100 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Andrew,

On 24/06/25 13:51, Andrew Lunn wrote:
> > +&cpsw_port1 { > + status = "okay"; > + phy-mode = "rgmii-rxid"; > + 
> phy-handle = <&cpsw3g_phy0>; Does the PCB have extra long RX clock 
> lines? More likely, this should be 'rgmii-id', and you should delete 
> the ti,rx-internal-delay
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uXdgV9dududxisXOFnkjP9PiILYQjt7Q3CKXWbpFj_azwskWiOd4wL5JX89-p35UM2TbsxxlxwNFQJTlPm4wjyyHNTY$> 
>
> ZjQcmQRYFpfptBannerEnd
> > +&cpsw_port1 {
> > +	status = "okay";
> > +	phy-mode = "rgmii-rxid";
> > +	phy-handle = <&cpsw3g_phy0>;
>
> Does the PCB have extra long RX clock lines?
>
> More likely, this should be 'rgmii-id', and you should delete the
> ti,rx-internal-delay in the PHY node, allowing it to insert the 2ns
> delay in the normal way.
>
> 	Andrew

I assume you are referring to the changes in a patch here
https://lore.kernel.org/r/cover.1750756583.git.matthias.schiffer@ew.tq-group.com/

Will fix this in next version. Thanks for the review.


