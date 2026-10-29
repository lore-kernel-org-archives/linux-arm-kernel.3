Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F67606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 05:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJfnayT7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nN2H5DGgqfsM6LhOOow1rNzEnF6r4+OX8KtRg8lWZs8=; b=cJfnayT7C4qB/4Pehc6GdfT3IO
	Yq/cnnwZ5/rkEG/8L6O3sXNa1Zcb0BGOuSd3aq0CAEFMghBvx7BG57JFyHWM9LYNtFb0ZBXz25gb9
	S+wMcTUZ6Vscz3LYmt0nW4Z5QfpzhboaiJRiINPj+h5e2ayfEKqWI4sqznQJ8RSK30/wTdpKItN7U
	cEeVb1Ooi9MuzVhBFLRfljv94JFnBszc24gEgVZcUf7VqKl7pVRf0o9CB7xhtlXJZT/A3IYdpj16J
	bg7TPLrN/sYG0vxG1t7nxox2g0DrY7l+qHxFJCRYjC2A513OU8ZVq8trbusDkYu4wgr0Sp1nY7YaU
	ZdcXtAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIXL-00000008OOj-3ZKq;
	Thu, 29 Oct 2026 05:18:51 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIXI-00000008OOQ-39Nn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 05:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvXOUxVetVzXyIrygtiMXbzV3o5kOmMQDIgsqsA28E5LW/VjUg7STzF+/khO6ZmZJ2mUNk9vTuNr/EmkyQFLCqxYt5unmsXa6F5SOexNQWj48q8ZY8leeWICczb27IMJ2iV3YCwKqfW8dKWXRU+1rrGvAnVzm6a+A8U5WhwemaXNdhUfd+flGE9b5SK7z9pt5K5oj5sU+ufCydG+F5RzkfhCdsUmvg4/pYBHqUQldsWnAouasN5AUvgp3srIpjCQEbsrYlecjKJbf+qpotMuH5KxA7vjXs1PqKkCppgPcyHvnOaKYfIu2Y5sCMGK7TJWX5odkFjTqs/h2sTfwqr+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN2H5DGgqfsM6LhOOow1rNzEnF6r4+OX8KtRg8lWZs8=;
 b=ZEq7dNx3TfmAwyWqgSYuqjahSoXjf3dn+Inx1XlcXJCcs0uShEjaHkyye4xnUUlRm68cRgZwLpeT6LRw8jAAVewv7pJeZrt23X07YyOvdiifZ7X+ZFNXZERv5tj8NTKl1gj38xKXkWwnhNyv2RaaJ4I2vH3QVK7rtJQ2OhVpjscYFZr9aM+B8RUaXRhRsuhFU8a7YkTzDxU4kFoTcYXUDFPC66lLUcsjyhhk158pp1Jg99ai3Ye99vwsPklEAvISnyIA7rZN8BpGfr1RZPAFvAdtfKz1hIarek8Nqz0Uag+73qnk+HhwD0XJBTVd8Kdtmyxg88pXMTchyOVVNiZ9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0003.jpnprd01.prod.outlook.com (2603:1096:604:dc::8)
 by OSQPR06MB7183.apcprd06.prod.outlook.com (2603:1096:604:295::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:18:38 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:dc:cafe::4a) by OS3PR01CA0003.outlook.office365.com
 (2603:1096:604:dc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 05:18:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 05:18:37 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C744D4102B51;
	Thu, 29 Oct 2026 13:18:35 +0800 (CST)
Date: Thu, 29 Oct 2026 13:18:34 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <auLXKpDj9xBTKC04@ubuntu>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-5-Jelly.Jia@cixtech.com>
 <auInKn0Z7TUP8yl7@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auInKn0Z7TUP8yl7@lizhi-Precision-Tower-5810>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|OSQPR06MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f236fd3-481d-4f28-4a9c-08df357c1660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: s7obFAYCo7GQTs/nObuqL3QMRKZlChBSVRPxKJl37BjEaxubzXxnnMw0hwSKzNd5JvYoOTq6CXkuj9j8s64bX0aLdHAW3EQESKSJUI2NCXdzwPWHmUtIKR4xaofQSxI/CnGIwNcQnmuTN/9xyy63uagf2A1Jg79Jqt80mTyOj2ugYbdceqXzFlrXar9fB4JUH6y3PdpGSSBAfKebph8ZJRczBa2W/O/NBCXbpoSS+BZh5vKaG6MMc0Wb5BPwmo1SnSGQJ98JTsL5raAkSQEcrVnGjutRf2jqMLROWcBOXUDHLTqqyLcdi+ZKf/LJDebDNuM0DBC/jOpv3Tv6S0zvavydpCMhlya0JYU5m4FHE5D1t+xjIPCTBhXNLXxAGJeMwu3ZNeoqa1MVz9ksWtUYoWe0IzR+ZnXvm/WphOLhIZgQLdDQ0Qiq34UJNNiyEgnUTBiFLq9smh5qPXd1AthU468N5SxWH3pbseD4Let/njhH0bpBJEqCyya51a4qszRc8A7wWIvJ9YgIB+DKHPGjQTAXPbQ4HCf0NmclPeexiKwnHZqRR9/xYDkx0kwkxsFgoDIXk4/WvZf06UbNgRvqlFsG8SM3eIbG3z33DjRuA9Edmh0UFiV/BGu/oFqJmjwhK8wnzl3wIiVJkzBn/uuZ3+LzA0l7WaCCOEglDsge3JbpNqa7o+Ao46EosbbejFgcyd2cSLjPFUVtoviaX2dwjw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ypBSLJAiRVpI1920V7IyiGKDWuxWrPlCZG5lqGEoKtYCJIev0CYWtUxhDCmoP9N/0BC4oJO5Ai3FKJ+9qZiZH4EWWJUpT4Xg2mIdZ2hC4ChveXTendFUQB9RYAHFYEddu5Yeot0iBsKRvB+d4vj9whsLQlDTYVJWi9GMxTniVWR+HYW/xHk2Q1A04SXCKBSm8p3PyRGui9kbDx4827+LaRaW2szB9Fu+3hg4m4jSdZIGI/rUjiIhU7mXaGerYfpnFBSKq+cjTLqL79gL6F5sOtjY29kxBUndORBE/NeBUTx3Vc8uG7MgQT6o6B7YAvUVRtxhTUHZ0Rh5xUU0BkLpdUNpOrlyO6Flg0XDsgAu0WQlR/4Imaba9Axna452kpCd9NipG2mUFCJNWLuTIjI3CHJ8/tM8Hwy6CS9lZk9K+btHWX67rYDw36USkprL63Im
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:18:37.1797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f236fd3-481d-4f28-4a9c-08df357c1660
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_221848_797927_3908AA5E 
X-CRM114-Status: UNSURE (   6.84  )
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

On Wed, Oct 28, 2026 at 12:47:38PM -0400, Frank Li wrote:
> dma-channel-mask is u32 array. If nchan >= 32, you should check
> dma-channel-mask[1].

Thanks for reviewing. Yes, the common property is a u32 array.
For DMA-350, however, the TRM specifies:
"Number of DMA channels between 1 and 8 (NUM_CHANNELS)".

A single u32 therefore covers all supported channels, and patch 3/5
also restricts dma-channel-mask to maxItems: 1.

Best regards,
Jelly

