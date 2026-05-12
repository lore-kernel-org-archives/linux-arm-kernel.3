Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA99CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Za6grCrNecMkHljJ/y7tcLqNAzMXsmuQ05DMz9OHhoM=; b=nnN4hXvzhd2N3KzuFRumGKzEDr
	DXnxXCStZujoBfd/u2NpqS7uZ+/Ma21PzoG7hyRQeiK/Bt0nZODx8GLd5SiiVwN2Hi0iuwvsIySvT
	pVx0n5bxIpusX3L4qujUQAnqGZPJiJ7yUl5Rot6CYPjPJ5kadtlJajI70mwGQgV3QJprw384tRlFC
	qreb19d+IyHqrYJHPS/uI/h5aKsBpQ9gc/G0IZ8fDcC1IwuWrbCX+umSGHYXe9VHkBpUJhTEf0qki
	unWNUGxIiFOQOIWFNmYA9fF9DqF/bgIlH7CQ+YFI2qR1N8J9MeFcJCFk1bixoFgCIaVQktOFRloje
	R4ZpSTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpnw-0000000HKhf-1bWX;
	Tue, 12 May 2026 16:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpnu-0000000HKhF-4Bj1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 16:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Za6grCrNecMkHljJ/y7tcLqNAzMXsmuQ05DMz9OHhoM=; b=EO/wDN71AuqbRlhSlq81uv6iva
	zEuOLtHY5ecNXwFxJ+H9NuOQmCeH2bW+IJ1l9V/yQ6y1EA7Rf15As2XSLpqpJh14iqAkOidL4Tz8t
	GUjwPUsQ9Vl1P5RdjE+VVoAE7RJdCgijL7BL3dUaMe3mRBdmsrHJPCZ80n0wUfVuNiRkVrXefcQE1
	twG2zvL1id1nxQnshmKJpd0feSat9rMM96yQFAAPE7I+wWjj76LDjx4d/wFVczZmN+inm6rjoR6df
	HIgcLwt+srr1X/odPFvn+IVLkDkKJe3Ui+q/TdL4WhRx1tOs6GxrKksTeoUtvD6gsotphsF5/K1Ck
	ifcrCvgQ==;
Received: from mail-centralusazon11010010.outbound.protection.outlook.com ([52.101.61.10] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpnp-0000000FIOk-2B0c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 16:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtRSIS3BtbTqKfq1ZEeUH6vnja8DRTe1hs9FCxTVlnPgB/tcqG9ZZzEGQrTXtBX17CN3dAYg7xBQWL6SR4MKEdqU6z9A8BSeRhGv7SDB22NuHVSNW+mBFgLQYTQh6cQcXKy1JPxc0Q97e0N5bsw/z9ORc+vc2Si3KAfUGof0ulnRMfFtnHmmdhEm0mgrGec75yWfoZNh11edAPlFYR/SWLSA2FI5RmNltP7/rfTA1Ep8OK5bFCdDj8jG7Er9C2qS4cp4w+tJouo/AX23EXb0EvBKyu4KtrHiju2LJWZsCIMIUsCEzARwM+nAo3ZT6xAsYsShdC4N9jKBwUw18DTK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za6grCrNecMkHljJ/y7tcLqNAzMXsmuQ05DMz9OHhoM=;
 b=ZDWxBuaGxb5Bc/mACGA1Px392+/aqigHW+oXCB4S2Spbz0upk83QtWFJZmrl+5Q9D8dKpvhVKZe2NQUZZmjIK8zVVWJu/xE29NgKqzPJycD8kTLDo0PrxmXSfxVE87UmagAfpzbgr23XNEKYafiCzINM0lbamCUo6XqUo/qIbq5bdIF3OnBaE3ur4uQP6idUHypDXugWSMaTb8Lt8MMOVogMBNUkExHqHCG6idl80PmVognMCI/Ieggx4G1uI6sDUBZ//KvBss7sjEYJlMZE5xfwG04nb+Un33wFET8n6OKFoFjjFmFoRV+rFRwAftItH0zMpNxm50HjN33CRFstSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za6grCrNecMkHljJ/y7tcLqNAzMXsmuQ05DMz9OHhoM=;
 b=l0y66MK1NAc6y8jKgYoCu7C2Y948AcUIn2Fzid01C4AUvqx/KzoOGKRToPEGPNcdY5YHhCLXwqLOg9U2QxTVhIrFV81Vh+2DmjDN+4M0uvmORwx6Y4NheTOZbdc6vTWTo6ienpMhXpfne9v8ZryA/ISietvYkclD19SgmGKIKqw=
Received: from DS1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::16) by
 MN2PR10MB4400.namprd10.prod.outlook.com (2603:10b6:208:198::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:17:39 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:8:455:cafe::26) by DS1P220CA0010.outlook.office365.com
 (2603:10b6:8:455::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 16:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 16:17:38 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 11:17:37 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 11:17:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 11:17:37 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CGHbKp1803413;
	Tue, 12 May 2026 11:17:37 -0500
Date: Tue, 12 May 2026 11:17:37 -0500
From: Kendall Willis <k-willis@ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<tomi.valkeinen@ideasonboard.com>, <sebin.francis@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <vishalm@ti.com>, <vitor.soares@toradex.com>
Subject: Re: [PATCH] pmdomain: ti_sci: add wakeup constraint to parent
 devices of wakeup source
Message-ID: <20260512161737.pflweaz2r3q3nrfl@uda0506412>
References: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
 <becb54adc0bea88578c8fe4c7c1b7b68bf5cc6d4.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <becb54adc0bea88578c8fe4c7c1b7b68bf5cc6d4.camel@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|MN2PR10MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fba6018-f394-4c75-b13e-08deb041fc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jcZtRxOYBzEWWhz45FPw66szuCtzmXOEfXqxl45qoGKi07TaWx2XdXZZeC37Ov7nuXpEdGN2pwlAdMdhTibe+MJNpOAwVmmkFypZnyXmqjEWgT0nlxaPuClaBeQGg+4gbdfzPV3m/q4OB5EmlckIjybx/Nlv0fRwY46kjuXePrHm99IXeNcoS92CmPsXkIWnoC3EVMK+UDcXnuHGrBPLOQgW37x/k8+KfTtVuFa9GJQjU+/pR1b1YElxfW3X95W0RVTGzowvl+MgjgDZhQTONIYroIHPpb2WtxB+NdmA/ss72cJfOdtKM+P8nJXAI3XcqNxV/MpIabXD5DBov4PX7r2mOTsojtrtQFIfsbeYCpnBmu5d0DIBZn297K93heML8CK1bQLcrkBUShzG6gsF7TGhIBjmDoJF2aqSPzXksPwHjwhxKfbnLioUNnOBebWJmMryZbVXhBiPakWTvWEWpq7ZazsQf8iqp5bR8merqo6QOTqHkSOqXFQA6b3WovMiQXoHQCleX2s0T+zCKXL626Xi5HTa4+3lt9L8eMdKaf4ZDJJ7VYdXadxTw5a4RD6YjzFHmMlVCLtucDlDmTrHvrVEm0uIXgG54rUsHS55eywp8HPhuHTLoO5lSKBaeE8Q64U2QadAzS+ZlzFrUZxdyfxv/Q8Dv6jm4HUVZqLuzDHRJs8Zt3zAUgAdAjC6VNm+bZWWwQ+YuWjKJ80RnDsjazBef9pihaZKEX3tAOCn2VM=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ip6zbDN6cNE41Lcry5Y03uzfALPOIGwY/ZSooWNYOd6bekFCSBh5fLIVAibxXOtqHVfzI5VyyFZlRNMCV3dtzDXbYUFx+UHM13bAssLrstRnE8Eq7WVZPfG6GrTl9BL3ioQLPojWBrXI4y6Xxvcwk6Z2t51cN3P9qTzR2Upq2IiTsqL0NujDWcwlwGAK1szdkAuLlSyTAqN6Nsvw668Z/3bSGU+uYHNsZoad93b33qvIDSEV4go4UNumduR5HUdriSPQE9R/s2r4IqPBMS9SFHttmOHg9UBDXTP8miqFQOyAX42Z5a2tFrfR49nQgxGzrDbh/UgtW8RN/0uM4vmJ0ChXbtgMTJtbpcw1dpz1OT63LLMFrct8+UQEWMmmLbFFFx9vbPOc4Nl9TkoSJXatAqCZZbdSVRODeCKc+LGL/BmP0fdFWlbyrLkfb4JzPTOp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:17:38.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fba6018-f394-4c75-b13e-08deb041fc77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_171750_538213_E75C2554 
X-CRM114-Status: GOOD (  17.27  )
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

On 17:51-20260511, Vitor Soares wrote:
> Hi Kendall,
> 
> On Wed, 2026-05-06 at 22:16 -0500, Kendall Willis wrote:
> > Set wakeup constraint for any device in a wakeup path. All parent devices
> > of a wakeup device should not be turned off during suspend. This ensures
> > the wakeup device is kept on while the system is suspended.
> > 
> 
> Thanks for the patch.
> 
> I tested it on our Verdin AM62P. As expected, suspend now fails cleanly with "-
> 19" when an SDIO WiFi module is registered as a wakeup source, instead of
> crashing on resume:
> 
> ti-sci 44043000.system-controller: PM: failed to suspend: error -19
> 
> I did not test the IO daisy chain wakeup path, since that is out of scope for
> this patch.
> 
> Best regards,
> Vitor Soares
> 

Hi Vitor,

Thanks for testing the patch! Could you add your Tested-by tag?

Best,
Kendall

