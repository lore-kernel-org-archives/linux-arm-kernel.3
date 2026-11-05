Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30F1606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAjkg2a5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nMq3/V33;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hi+59SID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ffOlhY0edizRkUbuvKbot2I8Et1phstXhLA9S0EOflE=; b=pAjkg2a5MRsJQ/cNMUDAmFrIcB
	Bi38533/3tfIrjidmT79w8U7vy/QEEQI18p54JJhogOxZHVZtR1wakjUFIhAuA3UBNkTlZAZhnP8J
	R+811u7VoSwiJaydwowK5NleSLsIeIQwJpYqH4iDe3oBmZFvewwuQ1PAvw2k8O24YTh+wnmlSDzAd
	1Cawis7e1tWJa7UkA60nfBg7zkH9dSzUqvF1K+K1QLzeqnCsVVypdPbJBgDf1ottNi1Xho7zvClaE
	rKyewgK63zK/b+N4NdZjyoSiqFq0gfB3vfajw0tTu0Kpo2/l0FEn2Bts9y/dgPTPPD5WIjDKNV3Vi
	kr8KM7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP59t-0000000Akpa-10E8;
	Thu, 05 Nov 2026 21:38:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP59r-0000000AkpS-3btq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 21:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ffOlhY0edizRkUbuvKbot2I8Et1phstXhLA9S0EOflE=; b=nMq3/V33FuXhqQpWJ66cjSn4OB
	jIq/G8VWAdKnzhIZdGEfVFsgZd8bWiKats9q0n77LWABj31FNUOitF5AyRESiSY7rahxVJ9RtbRGi
	h7FijW8Yr0uXwCGfyNt+lEWzW/mIbnn4XNK+48sDgdu7zf5XJeGl4FpRleoHg6tv3TYjcouB4GE/V
	qoicUiVLz2quv9dRJIozywFQP5hr2aUnUGDdEhGXju0H+OL/q1TVZO46Cjl4Q4P8lE9QXHA2wIK/n
	ScqAitx1QYEj3Kl7Fkemu92hsBgBLJ0t+rmyIoGWuGg4u4BjPtp0MxS/wdhmxLw7LrJ8wv7jVKlnn
	ITfUajKA==;
Received: from mail-centralusazon11011029.outbound.protection.outlook.com ([52.101.62.29] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP59o-00000003aqa-2SB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:38:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQbDj7HLXMffh8GDuEoJdvftxmuLovJKw+IRCo0h22M2zWsJkDmEnVL7rCssKmpYdq8bcfAfxNItWNYaPZo2S9w1smKqJIQh8vx9R6cjbfvFThDOVOGOfdLAw+Y2YgKeMlJQPCPUmTDY6OrZUll/Z64dV3rg6pwWxMlicE/LCebVIWCu53KWSIxlmXLeHiu9qHODeGCmVIULm1hF3HchEAZbBIazdegC2LRe8Fsi7XL1U3HzC4CmspmFGoffArVyDvmjsL/Wd9BYdD2FK/el1owEy5a0h1AlPKRG6AN83U9qXr8OeILitLuga3ghg2I64asDKWpzbRf/L9CN+nT4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffOlhY0edizRkUbuvKbot2I8Et1phstXhLA9S0EOflE=;
 b=Fr5NqPGiQ6C5JvibE5GHuqvC/7NeZYHN38upjk7Hl+nC+eNeyOnhX4wmFuz+XKAL+KZbQmDB+GF02Hr0MCxn/hVKJou+kyCqYhdiyxcdeeMVnM0o36myF6lEstoKPoD2RYmuRVklrHmW7qjtPusCD+6808XosDwiGRkDZ4JqaXHXqRzzCAhgLTwrWCaPNWFSwgjGU/UFCVfE8s68LOOvrJ7LxAOe7x4HgHRvmmXjFfyTGuqeXUt/pCwvTx0zVdESSAgmuWtWvJLsr83ruCT1pjLVRCgmD06SP4QcOD1bhtzuOe6njx7669bCGuLfDswYI/RaaCqeLMFtVOTl8/C7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffOlhY0edizRkUbuvKbot2I8Et1phstXhLA9S0EOflE=;
 b=hi+59SIDmMv4wWRbo++FEeAaSx6TbVi1L4bRe4zChiyTaSbaGsGmSrq9FseO9NZP6KbxGqKrhq6+44gDyphdkXi/vmd1mr+DUFQcWisecJ9+1EizxFNs1iX5PPgPDzMS+Hfnj0q84YOD4xsyi/BQ4G0sBU6M4706ci+NTkKQX40zJdqjWUOyR18pbllCr2W3kK2d5tLkQ6JN1Dl5Vt9ukf3fve5GGzvtn2f8To3WmTQWS3iOvd5yNvLdsDXeJPDOrhXUAuvlaBxLPKhL3P9toToCObVCyfgASWwNe0hU7nEEsNflE/w+4GoCOrl9HYS3hzD3GuUQcEPYYmg+ayLAvQ==
Received: from CH0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:610:cc::18)
 by CH3PR12MB297944.namprd12.prod.outlook.com (2603:10b6:610:367::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:36:14 +0000
Received: from CH2PEPF000166BD.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::aa) by CH0PR03CA0073.outlook.office365.com
 (2603:10b6:610:cc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:36:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF000166BD.mail.protection.outlook.com (10.167.252.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 21:36:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 13:35:53 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 13:35:52 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 5 Nov 2026 13:35:48 -0800
Date: Thu, 5 Nov 2026 13:35:45 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <auz2sUAFRdzFjtxT@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-13-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-13-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BD:EE_|CH3PR12MB297944:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da32274-ecdb-49d2-411e-08df3b84d19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|10067099003|18002099003|6133799003|22082099003|11063799006|56012099006|4143699003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261021135927099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 6lnr4Ir1dUlZlPcKI9YKXiiRWdG1Bmr/pZm4gG4j1kybgJB9tDCD2pqqjcFKCOHz3YJipxmAV4Mhu/AmKPwacMEJG9r3MKbmECaoKb9LtGYXbCAW9fMuVEOD2aat8AtaaWm5DxaNze5rkzEVGuKnbcvqp9Pxxx2z1KysMAKdtjLgXfo3YtpY/qrArAc0sDwVxhkg2INucPmFJDUxtTr7NTOJdSsHMze4nhQchI0JcrGuqiMDfL7w5EQ0yUaNiHCG7dIDM7A1pcNwZ6RcZJqr7HZuiqvjVE8qoT/D10IeLqovZKHTwLfjwqNdIya8gVUdXU411afgfY0wTJzN/1ZS2Pmb1fh8r+4YEwjW1XjWVrIJWIvv97FGQU13m6eP9aZyXf4GklD/PKlO+bs+Ewt6Q2dN2ZTKOqziu8l93DeiotzZDC38NElzatWFLwseTwiz/KiHe4jKmdHZjk9Z79CTxEn9gPRSEvXLakJPxrZpQOf3EOb8n2T9LCXlcak8upnTohupzfw1XyHDHKJviQlwMlntOkH1ixDQYVjsaDQgqUFlN25TFvMkolbOZvc+415ZfUdWsRBmX3elgoFDX0d+2xm3Rstf2ylZ7V+xSnAvrARVouONkhDzTSwyJItmIiBCXcTaLfo4rUEjP9eJv4jD+6tO2V/PcHftxZTBupI5reepMSys5UTfQH8HakCWFe8G+5Nd3J2hsyLvkQaB4tjmhQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(6133799003)(22082099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n9rDfx0oqXveyXfkdKmC4BPKMnn4Tuc52bqgE+XD90SD0Iilx4SUK/cf4opBWULhgUL7d4qV+FLcjPzwV/x4Ik6lgddaqcTf1R4Jqzmkjyp7A+vEa8bmWxuY8JO7tOcSuyXR56gW+p1CZNKzQQgnFT8lSNamGthlY62xtFAuhMkMYATzS2v6P/NeIwJt7xR1ao+/FRLMYxwTBCrVNoCeHp3KNvzJuvvIAt1RtkCSQM0OP4AKRb9yt0JyIKBbxBrVR6gG0gIqOjocwxcnXdeSLosIyAEtkROIRzTQeI3fwIlsuBzTyA6fEVQDpvaCYoemNCKm4Y5c89sbHtkbS6uyjEJ1/3o/xXKjt7zQ9rzmzdK4rwdvK4ijHlz6ToV6tnY6VytsK3ZU7qO+Asgofmgm8PPQHEmLhmKkX5bfazpuqNAHNs1zF+92RKhqgPXmAqEE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:36:14.7129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da32274-ecdb-49d2-411e-08df3b84d19a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB297944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_213804_664908_D211016D 
X-CRM114-Status: GOOD (  11.69  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 08:08:43PM +0000, Mostafa Saleh wrote:
> Probe the SMMU features from the IDR registers with the functions shared
> with the kernel driver. SubstreamID bits and queue sizes are not needed
> here: CDs are not shadowed and the command queue is set up later.
> 
> The hypervisor requires two things the kernel driver does not:
> - Coherent table walks, reported by both firmware and IDR0.COHACC, as
>   it does no cache maintenance on its tables.
> - Nested translation, as the host keeps stage-1 and the hypervisor adds
>   stage-2.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
 
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

