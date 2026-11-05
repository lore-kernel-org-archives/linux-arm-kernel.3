Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60EB606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OIQ7ZZBP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SebBKmfhtvA4XN5jZ2SI84YRvgNOooZ5HVpz40dOFmU=; b=OIQ7ZZBPkaaYI9S+yN4AaiwVAW
	T2mHM7madArk2oooNnEV/B4YmbeiXZE/YduSel0iy4TjyKM4G7qmEVsGTrFGTwysHCYZWsc59W7Dx
	en2MFxeF3tffOsGky+agtlT7n5M57N3lzpthV0LGteJ8aPuB6N4ZUIwHRwenheQFCinqx+TmRTc+e
	kucYlG/oo3F1QysulhmdtN6elya9QSKjLiePn66/qKcDp+kSeCJFIm8UETwBDgwwSLMyE478WMIsH
	Uc8X4sZS99L/ggq9M3YjUaZEHbQr2oJF4w10Zl9U85+3SlpvmNlCXeXRFEe3j5Y6O/xkwsTh0w0OF
	s+lQ9Xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt2w-00000008BDk-1DCY;
	Thu, 05 Nov 2026 08:42:10 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt2s-00000008BDF-0EPg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWHkfqJd8jyKrBGLk/H4UhylVI7J2ncK0YhAbsBKhkWTkCIUtWI/D0mss3E2JdVdX0DfdaUC+XntriqLBvbPrDdXba2kltXOw3QFmSfswDMGpgmAWiSszfi/30qkR3lUzATR3QPu/kZf5X9XR7PVpnYZ7i3KENm0CeX31MU738eDrdx6/vy2R54Bf8EHc3WXyzYFUzSpPhVPn3gNYKNuYtbXBWEkE16MEc59nVTXZvzhb+ZvAe79RFezxR1pDi+4G4Bt5Z8GTxIL27q4XSjDzQXiUn0cbXTfa9ztEA03LzfWkp7wFkhPU4B9qX5ka9Z4ny8LsGb6By6SnRYh2LCG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SebBKmfhtvA4XN5jZ2SI84YRvgNOooZ5HVpz40dOFmU=;
 b=K9HfpRSVgh2PFzRlXURRpMtVtEBBZQxDiteZLtawDX+kmwXcdSZNsXMGao5IjJgBpnuWiEsM9wGG1NLXBmxOAsJmlXot/hY9H9LbqhxKlzsVYU0k6FNdkYvQD9JgG8PQTuL8tsqLl7tGYj9htUaz85WQg0d2nfmtN5cXnVEV5GtRaZgQqgJtgyqHLK2AwFRrpcqcLW+hQg5mY/4Xs//2G/b+GI31rJvgdytjgxPDChwcfI0i6mHeDXq55k/dqEhlz0XB2eV76LLJLUNlRlK3brTgwz9QLKhU7BRfqldwezTRWi4VTamNuvEZYhvVFzogQG0ka/X1+SklKLVpm280SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::9) by
 OSQPR06MB7156.apcprd06.prod.outlook.com (2603:1096:604:293::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 08:41:53 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::44) by PUZP153CA0003.outlook.office365.com
 (2603:1096:301:c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.3 via Frontend Transport; Thu, 5
 Nov 2026 08:41:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 08:41:53 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 05CA64102E60;
	Thu,  5 Nov 2026 16:41:51 +0800 (CST)
Date: Thu, 5 Nov 2026 16:41:50 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v2 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <auxBTkn7Z+Ssr05B@ubuntu>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
 <20261104124437.296753-5-Jelly.Jia@cixtech.com>
 <auuLEgmZFGJ0Ol0g@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuLEgmZFGJ0Ol0g@SMW015318>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|OSQPR06MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: b34a18ad-c616-4d6c-bcee-08df3b18a47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|7416014|376014|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1iKjxzsrYrIKuSnUIykAwftPl9jtumQreYV2dparnsjc4to7o8poQZKyl0CgN1M5juoSVx2AC60IEISmPktQuU318i7K5n1i9lGWqkMletnLZh3I9WfBYLrCSGUu2Wfw/oHBH+R3eH6Ip6aPlh4rlhVCtzSeWSIHgartLdubMuwWtdWm0QJxXFBUia0STVV3fbgvlARGXnxUPXWQf78GuWLYhPWS1qno0E/Ukff4SO7uIh1C/xLrPvnDaaNFIqxDXDHEmN5E8n+L+vwqsvv3Ikr+OtR+kB555dwEt2X3LkTgNiGp7Uq+sQ+1tyGb3+xwU3yq8vUnCuUA1T+YxwYOQ5wnH2fFY4zHQcBDtvPnachfbZjLwFVaDSg7FuCDT/keT24PjHLT4fPE96Bu2rySvLC2Hi+uJ8in/ZvwXTYYwphAti9FyvLmXzC8+XsOXqjN9Hh4wfpZXXkjEnHFbYnvwjmZpdFDVTl3/WDxzwgyScOv2D4/v2UWcxXsygafOCtffivSmtqc/xiZ6cr4LTNJ2jqyVcoE5uNwYNkb/GMTdOIy6PbEXxY/zVNzpoIF4ffn04a/1BJAfhsjUgGidCJfnL5CZR1l1/WvH+atQvc6aKAKp5Pt5rtTqmHR4lTI5UxJnbvBeMsANL17d9Ua+i8tfdyLZmTB2KXSC3KCtBoH6bvpUehV5TRCvUcgpvDLyJOghWz3R++agYiUqENmMlH+ig==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(7416014)(376014)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M2RukX08AyQUcW6PUXy2+1hovag382aKjAfpUCgPaSxdax0TXdw/Cb2uaDjSuyHi6l3KsfU+KHm4aTBbp6DBoSuBCyHiPOeiZoF9FoRf+H//cWrACjl0Zv/LJras9EzmNWCNfv7tXJdaFIvHCwHagkzQnDm95YpRRHxKU2K5WGtLhZbiUBiWxIIwQj5L03cjLVcuj4Fl0cRXFDHchEh0qjh9L6mH2otigxov7dQUAjmZDq6/xFcMI9UuCRT061l5Cb2EG6bsPgOHF22lWSD/N8pn1Hwgg0rDu+Nx4r1Z5Y21nu206fliJCB3szBQ4qKugAxmqaLEBuk5wN7pjIuispoEkCpme11pbCMOJYllSQnlckQaoOUI6fxtaOrDIzF0xMO0wW8IdbAq1AFx3lx0dveuTj0pU5p5G8+8Q2IIo2mgFy8km6DKEeW437GpPj39
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:41:53.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34a18ad-c616-4d6c-bcee-08df3b18a47d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_004207_113488_6E3B7B4C 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

> max nchan is 8 (in your cover letter), why need check i >= 8 here?

The i >= 32 check was intended to guard the single-u32 mask and avoid
out-of-range shifts on 32-bit builds. However, DMA-350 supports at most
eight channels, so the check is unnecessary. I've removed it locally
and will include the change in the next revision.

Best regards,
Jelly

