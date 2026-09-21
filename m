Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A0FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZBDS/fjV8mTU4sbd8xKsPOs2kwUo6QT2nm+gOvROos=; b=K9wgYoS1Xt1SDtoZSoEMlmX37B
	/8ypXH989da5BrORA7GGHcNxj/h2flYo9J83oFPTCelRlkr2J3SyI2icGFE7Stq80KKKxMwn3yCqd
	B+t0GE26E8wDIzktTPydz3vXDNZ74tKzvQoGX0AdNPsCBruaqcYkeBb7YOEUcpwOzWZk0v7n792/m
	KSy/oWTsjAJeQJ63xMUiMWdVIWWMq2pLOqOoKgLcq9gQqIxjW6OJtsS3JypLeZSZSh4FjqbIXgEJz
	/js136vlVJie+BUj3Kw2sD/G095NWXt+8GLu9o1T5trcyp3u+A0vb2rczzfpFLPk6TNLHr5N9tHBz
	PeZUgROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i9e-000000033BB-2Oxv;
	Mon, 21 Sep 2026 17:50:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i9d-000000033Al-1iAi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mZBDS/fjV8mTU4sbd8xKsPOs2kwUo6QT2nm+gOvROos=; b=SPHauhQ6csvUSf3Y+cnbUzw46b
	MClztA1vibc9eeOqRhIdje0iHaTdS7fdBKo1XDZ8vNEaBtmuEyIMV6VXKwU4DqvVNPidcdaMm1f/F
	D0S7tlLYIUx8kUN1Hoq1Rt15gja618zmXojsvhZFOF+laT4M6cwryXK/rXDiRIx09iFA4Dby+Ofe8
	8qNGhTTYfxMnwJBAw/IStIPRronODmk93tQS7dK1AbPS/c1Qk1PLzPVTmguf7ABrfFYl4z8zTTWNq
	bwhZ9VV2dD2F4dziv+ldPGvUl2NMdgvhNM/CirYSI6gzUMbCV3bhZWaiw69VE0aWWP2Nmb6e8V6i4
	4hgrUAyw==;
Received: from mail-eastus2azon11011006.outbound.protection.outlook.com ([52.101.57.6] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i9a-0000000CeTF-0y30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwFLKAjz5eGUF8d6vQHjq8tZZsahcDGQUeUwe7e2G7hefqMf7V5yfC1RAagVl5TIUFAOI4L8inUgBzNpZK75vE00cg+ggeIoLUut+bF8n0iLJAHVZBY3z8ZtYrjqKH10z5ZIMy0yCg7QjkQdG4XpI/H7D7CaiE3d1DszV5VbPJ0THSSQAdrBuKWD54QAd35YCqs9c2K4A6dnXJVVInlwTEVZ6a/f2R34nzCbEMxTj8f4x3HFjA+uttEdexmcyQTU3HDFagxGYvDfbeBI3GinmgekSyMSYLh74UYBrGGgM753k+XUar6Go3tejghIE0smQVBX066hk38zs6N/TVenng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZBDS/fjV8mTU4sbd8xKsPOs2kwUo6QT2nm+gOvROos=;
 b=E66U9oUmjlfSrucRRLHg3Hj1ilvmeto2lFVQk60lkQv227yeQgzbwbgbtDC2n7xbG8kImYJffpcXCuvkL236lI1zeD2/CWk9j3/og6u32qD5NyUAmEOQuMX79TmaH7HzIMEFHnH3aNnt4ACRJTjFKMsdIadKCQrj526xYl14VF19hQ+zUHdZ+A1gcg08hmNaFXTOeIz2dxP28tkDcDGF5T5aC8nObLXYPXs9WT/9s4ti7vcbVVq1TkpLMiR7MBWDSh62PLFT2jxq9oJ/WLU9hhhKbnRCj9tcUwspmc/kWdID2wmeknJny4P0V2L/gLvs38yWuzm/tWJshyT4zWRkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZBDS/fjV8mTU4sbd8xKsPOs2kwUo6QT2nm+gOvROos=;
 b=ulHQliaqROhRVxhrylCScxNaaNmQBYgCp756ufEUwew+z5eQerR9SwgTMPAvA8m9dGY9lBdZsmxCLT9/MCHVpsi9rt6CqrO65HNI3xL0u+loi02mIZEUwuM+QzSS22ebAMzfTJRUEKhNiwZxGlXmyqWWXgYGqudWmjaX9QI632Qiu1AShl8DuxKTK+j+RN5NIeHKR6bymaW/7vzmSM9B85dJtLvXizGhcsKcNpgGMv5BpI2j6/7VJ5odl+SBOu7qmeLFljTPt6kGA7AHx0O10fjZFdms7nIXLW/VA7s95UwD8XNxTJC8gjwtINqh0qBXnVwn+MQm0smXEvhgATTK1g==
Received: from CH0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:610:e6::33)
 by DS3PR12MB086197.namprd12.prod.outlook.com (2603:10b6:8:60a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:50:00 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::47) by CH0PR03CA0298.outlook.office365.com
 (2603:10b6:610:e6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 17:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 17:49:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 10:49:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 10:49:42 -0700
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 10:49:41 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Hanjun Guo <guohanjun@huawei.com>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Dat Mach <dmach@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] firmware: arm_ffa: Split the response out of ffa_msg_send_direct_req2()
Date: Mon, 21 Sep 2026 10:49:40 -0700
Message-ID: <20260921174941.2406319-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <348dfed7-6aa2-77a2-a0a9-3aeed22f46b8@huawei.com>
References: <20260901192906.133670-1-jamien@nvidia.com> <20260901192906.133670-2-jamien@nvidia.com> <348dfed7-6aa2-77a2-a0a9-3aeed22f46b8@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DS3PR12MB086197:EE_
X-MS-Office365-Filtering-Correlation-Id: 49609326-cbb2-4ba9-bf30-08df1808c177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4ZpiIJ1T0mI4291frd7kXARohmO+1x3OUq/T0ZjkyJOvaNCgzfFdBIgBRBCmxRzx+Ie2n+hmM+rXbwqKR56lc+Ld+XFPZrbm7Y+nTkTjhikYNZ4f1GGUzt7ycQvh6Gw7D9YDcyyGjuBmCSIFFq2VbR73T4rO/JaiXPiDmIvhBXdHEVbbKE+ehPbhW4tDGcpgeBdnQrfl4LCbPlZyzUS3AifD5i1EWN4aol70eUGQvzF7L9wLOnj4aUmPTmYBCW8oa8LbRNkTRnDUYM2raCBKZE0gAqagsct+tt+3IL9tV/fUXPWBRANKm8qMqzJlxx1DcDw9k42aIXFO8AJv6hbFL8av3lUOdjzmrBme2jbGi2y9uO/PEEkfS8Qsgcu6sT7qVOj819b7X58+d3tD5PyZpzTzNRDUiMXx5stQg+RXB5Qbs2OCga2V9CVxPV1ml/biXWfD9vNFy/TcpnYV3SwseztUpVbfM8myImLtWycXcLmYSoK6Rhu3Mbb9GJe6Bw+CpzWBsUrH1A6ya4xfNfihDXgwFwYwVRU+XDWncS3S6bzEmjBh5u+9yzFVUNzkQ7d3Ij4cBYgZKhMriHEUR7qN4xDvFLL4q8fmuV7c6lSA7lBAn1ad5fA0lSjEf5MCQ1MSaPdY8iBNoxE6Gi3/K580HpFysld6qwa//9OaWbEmdnn/VPRAgCJHxkTBC+2vI0eZ8he/GjktrJ+/1wOcdjmFQw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zdmKmly1dVyjIQ4lG8/hCiza1/DOMUybpRxyUM4Z8cN91vFlJ86PYlL3ZksA2O7UWYpjaVgwVl4nhF0b8YOtVOZRLT9OSuKFgNqVls34xnypI/KPXhyloTMg4fGZgJHid4D6Axd4Ykpaw4e++MoD6XXRQMI7jQJ/DIFx5wviYRVr30HqqYJsK8TWBSv66xufUYgo62HxZp268FQF1HcVJ0DAaW8wrBF1njyT0CXhAn0lE5pf4g27YmqMWPE3T2GBf27nPejGK3bXxLu1+DSU4LNuHEUShN1n7Px8ESzmQCYTsIvF6usjbWEMFlp+J2T/p6FqQMVOZUvC1owpiiygJnuNC3I2l5mf8AbUz4Cd2nVB2tl6CLpYUpws/Xzx3lYldMGw7BzdSx1J1VYyqzzpY19cbwWLY4tVRvGAK0Ev7nK6REyIuJ+wPuS4OjY9Qs5U
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:49:59.2679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49609326-cbb2-4ba9-bf30-08df1808c177
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB086197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_185010_581505_471E7F8F 
X-CRM114-Status: UNSURE (   9.66  )
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

> The kernel document was updated for this, please update the
> rest of two patches as well.

I'll update all three patches to use:

    Assisted-by: LLM

> As you noted in the cover letter, the AML thread will stall here if no
> response, block the ACPI interpreter and the ACPI global lock when
> the field is Lock-flagged, so do we have some warnings if that happened?

There's no warning today. Would a rate-limited warning after a prolonged
wait be useful here? I'm hesitant because that would also affect non-ACPI
callers of this helper, and I don't believe FF-A defines a threshold after
which the wait is abnormal.

> resp_regs[1] is confusing, comment here it links to X1 register
> is better.

I'll clarify that resp_regs[1] is X2; resp_regs[0] is X1.

I'll address these in v3.  Thanks!

