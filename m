Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2746C7EE2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5jJ8n+EtfFv9cDVIlDdNHGufzfaA7lJO2j+NzWgp/c=; b=bbXsGO842XUXu4+Sr9NT1P5Duo
	ExdIMH58D+S4h6LtE7ZnRThcD5X0BR85CPkjbufDLpsdFUAdpq3dJMVrxZmBhlTy8Dvz7r9Udnl//
	OCh3xQBP4F8Oj5H1L1Mq/XCPonPq/htvxWq2aJgLBIOVy855BmO2KcTVOarHpoR/EhrKBkgyu/YGd
	13EwyX9uE5e/KnQY6iiA+9iOZtyIljM3n33AU4kkO7K0ZXyMymk4xB9Cg1tB14gAHaGXxRUpqazE5
	y2U5JKjORfuIJVQ5xaEwYolD0dbnEPm2h1NT+B16yscVYgEd9wQyoCf+kZHbbVNC0MS8Y3ATgZ44+
	kp4uBpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJk-0000000FcKF-07kd;
	Fri, 20 Jun 2025 12:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaZJ-0000000FXxd-2tF7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 12:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v5jJ8n+EtfFv9cDVIlDdNHGufzfaA7lJO2j+NzWgp/c=; b=GqRrdaOY6zOLYuAjIUtaYdcfTE
	/DPaJ5QYLOxuDNZC18LS1L/iuI7MRAUQ8+uUoM76VmPntGMvpAMFPsWDBFVmjC/Pn2JsZmYfOmj+8
	sPpqKtmf2usk6I6jH8GQdfnwfKTUfVCb2XHtRvG00L1wkXItD8clkdiKRgs/nQaN6ppxIn0WTx9o2
	ZK+kzGQpF+0JWI3q3rjTQpaNPHjkg9WL/GXN6yrnV4GyPyXymNi8GEqzJJHPbz6lMrT0/hUAh4DzY
	u/uy/pif5aa9/mugTLqLTyuMlmXvHDbXGXTkZHuloTzJAAkmerDLo+I+jteiafINrtWloDaynGp9Z
	p+9pnotg==;
Received: from mail-co1nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2416::601] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaZH-00000004jAg-1Gnt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 12:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbuAU9YInKqYpiCLaBEfbWVVV90r6uLMvGkPbgd9KN/61gFpurRWcxvgbRFkbVkR261mSp/DReA1QkvQV45Q/VWVLox9EN5GQ35i2YeaLM+z6h8UZYc9ydQScXvD0HGJVU7ueYL2tHorgkQvT2cYMIAL0oU6pH+xx1ZENp+KTLSHM0pvvMNuGguhyqx1U6VNeYn4X0Z2Zq9N7j+C8VSpbD9F016e6VqcrbVATfUfMpPqKWWB0fAkMm4xLgQvEX9MsiYuvuz9RBjd44bS8w0pDi/TaI2vX+T9mekzULvUQ2etKsfEwYPo3p2ENWLto2qthJr74XKf27QpkGvW2XTsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5jJ8n+EtfFv9cDVIlDdNHGufzfaA7lJO2j+NzWgp/c=;
 b=Gn3VNl93QOP2Py4vneUzXBkWFbcssclgl+p1pVz/d40A8zPLgPCE3+Bb46/HRjdja5QBLUAcl34KhCnRhb5gILSFeX0Q9NbdH8BzzZVbtSL6N/xNkG7jlRI+7NlYQaESesrnGFLAUKMEH7g2m7zVhFi6dzveSKOTtnSPjJsJ5u4uZn70MzIVsy22gXJoCPtqkGQtqtSBRcmJ2A3q9uTjpFJNqwSgPp+RrWMLEeb3QN1K44dStgkUOTYC5iEmhcKKzK4yU5DzJ2zht+KD407l1rD6NzOp/8JzFoHOiSqzj3rKpHwM/0j63MrzMP7vsxfCj2wUqPlrElaLwFzplsG6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5jJ8n+EtfFv9cDVIlDdNHGufzfaA7lJO2j+NzWgp/c=;
 b=gLEbmM0tgG6LTPwV6L1LxqtRGbJmIPgnz7oSJ1MBNof0bAZ6z1zqUoxBm/sMRWecDID3SVblrMTps3VpnfurYmrGBxcKcIeZHcw/a5CHx50i2LXUkR1lam1tqAsBAxa5yaK8z9JGtm8LYHz2JIVfkPvEN65S5XmMaXPsx9gPmXQYCezc/JegfiSaStsyzA41I/7kvdioPlEzSrVvOpJ2Rzzc9fjNZGrEDaST//hybFw7uvgIMewD7tPT0KdpR1UumkzP3UGvFKA4kijGo0gvEfOkjtNfNvdgVJ0z5eCsvezlupXgWQOodZX+2mgtU+bC3aLMakowRKTFpTUVHlnG4A==
Received: from MW2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:907:1::37)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 12:09:54 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:907:1:cafe::c0) by MW2PR16CA0060.outlook.office365.com
 (2603:10b6:907:1::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Fri,
 20 Jun 2025 12:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 12:09:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 20 Jun
 2025 05:09:50 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 20 Jun 2025 05:09:49 -0700
Received: from localhost.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 20 Jun 2025 05:09:49 -0700
From: <ankita@nvidia.com>
To: <ankita@nvidia.com>, <jgg@nvidia.com>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<ryan.roberts@arm.com>, <shahuang@redhat.com>, <lpieralisi@kernel.org>,
	<david@redhat.com>, <ddutile@redhat.com>, <seanjc@google.com>
CC: <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
	<kjaju@nvidia.com>, <targupta@nvidia.com>, <vsethi@nvidia.com>,
	<acurrid@nvidia.com>, <apopple@nvidia.com>, <jhubbard@nvidia.com>,
	<danw@nvidia.com>, <zhiw@nvidia.com>, <mochs@nvidia.com>,
	<udhoke@nvidia.com>, <dnigam@nvidia.com>, <alex.williamson@redhat.com>,
	<sebastianene@google.com>, <coltonlewis@google.com>, <kevin.tian@intel.com>,
	<yi.l.liu@intel.com>, <ardb@kernel.org>, <akpm@linux-foundation.org>,
	<gshan@redhat.com>, <linux-mm@kvack.org>, <tabba@google.com>,
	<qperret@google.com>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<maobibo@loongson.cn>
Subject: [PATCH v8 6/6] KVM: arm64: Expose new KVM cap for cacheable PFNMAP
Date: Fri, 20 Jun 2025 12:09:46 +0000
Message-ID: <20250620120946.2991-7-ankita@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620120946.2991-1-ankita@nvidia.com>
References: <20250620120946.2991-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: e50c86ea-e343-496a-aa38-08ddaff35dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KP6FUxcmYXU8hQJspG2I3mwkntmYCUMnTHY857bHG8OWXUg5GeQ2HJiS6i8H?=
 =?us-ascii?Q?6VUllmb1Wf+7d2N2CbWqIunVslSMn4pL1eSluXNFb6Bem6bVXgOT0w2gTYwT?=
 =?us-ascii?Q?ordYunIyMKybG3zrUBSKPSfyOsoTe3icv503UDhgi1ySlZBjVahynJt/abGB?=
 =?us-ascii?Q?udBRnusAYK/8M5EQeoMtrPU8gkW/KrHAZGo8qe7OofUpdRzEJZQDVjAvYTOS?=
 =?us-ascii?Q?3at7qKgUnNN7+WknmaJc8aMbHT4LeIgohveyEiNWXv7SWU9vcHygKM1nSAWO?=
 =?us-ascii?Q?L7bBqAhDq3QKoS/R4n8lhqDmpLfaKLOy5b/wFfdBRRCDWo7xbYnG1Psem81Q?=
 =?us-ascii?Q?SfOInNxMYkNqQUwEkdhpmTh+nYyNKNw6q4ecQM3UY3CAWK088NV1t/9+6xZK?=
 =?us-ascii?Q?3FvK3spvDYBllojKKz0kw2am/gPqSKV0FXphcJaBo1xcc5aBqFpVsvGe8tPS?=
 =?us-ascii?Q?R39cV+sneAzj8CEmZDPeh2y6b2tSLNkRcjauJJNf1lHhCIleNWs/3+j0cAfB?=
 =?us-ascii?Q?uabT761lBYmZxK/NRlZWFDzjIsKzT83IucIePn5asTfhSPtlr0IIMdiFlFti?=
 =?us-ascii?Q?7Mwy1fytn8nJk1JePU2RqLMbMb1jCy4/1rY38G8BWcgM2HqgHrTjQyBEnhul?=
 =?us-ascii?Q?aeyHYZ59FD2fOJDT7EFNR6MO/ILXeB5lDXWWEAae/6aFR9+ZhINIb2Xo+VEq?=
 =?us-ascii?Q?Q5GsR+p+S4BqJH8jLYSFozJzBAWvMGAUEozzIqg6E7h1OFko/cR5SSrWbqX6?=
 =?us-ascii?Q?3Gen69DXvlcPEBHJHu3QIq2JAg4KFn7OYnEU+4ZWj+UTE4PE0AzWPaUmP4e3?=
 =?us-ascii?Q?lAaDQzGDO8FDULkAoV2eFpFt/Vxs/Jj5bcb7WDiuFJZ11bjPXDsfI+eOhmiW?=
 =?us-ascii?Q?RqRx+5anLianioxiOqW+TlMSNA0Nqmli/BeaNbv70z8XPjZC9lCrn7Rkbsbu?=
 =?us-ascii?Q?HWJ3SNiLeu77GVTcvzgV3Ft1NtypS0U9YpDHI4usU1mJN1/GkGmtkLdxy5/d?=
 =?us-ascii?Q?i+NrK4bWvvEbgixPsFFceQS9oHEm/xdpH3M8ytLaIZ8/UARNSA4LI/GyggPY?=
 =?us-ascii?Q?yflcEtr4HEEHUsnLC7lD+U2a+PgaQgh7HnQVaEFyQyM98PoWgWFLr5KCwt3W?=
 =?us-ascii?Q?DNiwIhny3eRsQVggyMgq/YRembWW61kxyfVO43v7FoM1rrGI83LVpi84PG/T?=
 =?us-ascii?Q?a/FywcR1dSIIm1z+ygghUOlhMcr1RA9qOzNW+K+aX3j0NnHae8QQWmYfhymG?=
 =?us-ascii?Q?9FgrmLcXSK1mfNkeoAHdDNT1V/wMSoBSqLDeqxCVT3PZ2jTvny/QQ7JbV2YA?=
 =?us-ascii?Q?IBKc7ct7DphaLfTy01RceSx+FIS7fsLqH3QXjwouw4Mg/n8Rv5Bf1r1JxrAW?=
 =?us-ascii?Q?/Vn00jrofxDy1XKUMh8FWAHZQknrL/K9SuoCqDVt8aCNZgyBlT12zuBLhu8v?=
 =?us-ascii?Q?wunsp128GdV3bdi7vD867XfQlIr7D4loGCcgtoaAz3DaGuGqUnGh226SH6BT?=
 =?us-ascii?Q?d48/yy/dLliH4+nXDA+nquHlTXiMDcmwP1a/oR4k0DYlsc0J/fVvbzF89g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 12:09:54.1927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50c86ea-e343-496a-aa38-08ddaff35dcc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_131003_477349_C8B2A6F7 
X-CRM114-Status: GOOD (  12.24  )
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

From: Ankit Agrawal <ankita@nvidia.com>

Introduce a new KVM capability to expose to the userspace whether
cacheable mapping of PFNMAP is supported.

The ability to safely do the cacheable mapping of PFNMAP is contingent
on S2FWB and ARM64_HAS_CACHE_DIC. S2FWB allows KVM to avoid flushing
the D cache, ARM64_HAS_CACHE_DIC allows KVM to avoid flushing the icache
and turns icache_inval_pou() into a NOP. The cap would be false if
those requirements are missing and is checked by making use of
kvm_arch_supports_cacheable_pfnmap.

This capability would allow userspace to discover the support.
It could for instance be used by userspace to prevent live-migration
across FWB and non-FWB hosts.

CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: David Hildenbrand <david@redhat.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
---
 Documentation/virt/kvm/api.rst | 13 ++++++++++++-
 arch/arm64/kvm/arm.c           |  7 +++++++
 include/uapi/linux/kvm.h       |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1bd2d42e6424..615cdbdd505f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8528,7 +8528,7 @@ ENOSYS for the others.
 When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
 type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
 
-7.37 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
+7.42 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
 -------------------------------------
 
 :Architectures: arm64
@@ -8557,6 +8557,17 @@ given VM.
 When this capability is enabled, KVM resets the VCPU when setting
 MP_STATE_INIT_RECEIVED through IOCTL.  The original MP_STATE is preserved.
 
+7.43 KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED
+-------------------------------------------
+
+:Architectures: arm64
+:Target: VM
+:Parameters: None
+
+This capability indicate to the userspace whether a PFNMAP memory region
+can be safely mapped as cacheable. This relies on the presence of
+force write back (FWB) feature support on the hardware.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index de2b4e9c9f9f..9fb8901dcd86 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -408,6 +408,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES:
 		r = BIT(0);
 		break;
+	case KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED:
+		if (!kvm)
+			r = -EINVAL;
+		else
+			r = kvm_arch_supports_cacheable_pfnmap();
+		break;
+
 	default:
 		r = 0;
 	}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index d00b85cb168c..ed9a46875a49 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -934,6 +934,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.34.1


