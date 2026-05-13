Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A23FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUYO7MRnr3RIJyGgfiLnwbA1gI149KSTiEC+L2FbyN4=; b=qA8Bph0uoctHle3kl/W6cTwzNB
	EkcL5xPI8qCTOPG+CpLjtJuiSNetNBcmqRGcHsMJ1GCqfHOAsZMtVZZUhA5TxVtvuIBJCTOb7pXo9
	gWoXAwxPSIUYVDibmATMgQvf3RWF+0Tk3CF19Khtz5RZDxqhr/q7vPvMdx8k8ast60u+SPe6KKPvd
	nCK0JnImZNHtPzi0IKzYcIX6Pix949ClTGJl+gZZXaF2QabFXMM7oF5JhGqSnOUSY6u6pCNZky3/3
	IViwBpoKBx0Vcb/cXhu8SM8QhDZzVCKGcRT0rBa19ck3tt6G29wTwd6ahVKrLOXDLgjAwo0uK4BBI
	H1tk07+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJSt-000000046H1-49En;
	Wed, 13 May 2026 23:58:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJSq-000000046Fe-3tAI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 23:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UUYO7MRnr3RIJyGgfiLnwbA1gI149KSTiEC+L2FbyN4=; b=BNlgRvwdE6HKe8lggpaIHXuWbR
	6BNLGPB337p1RqDc2uoy1s0wgjJ92CLprji2Zc0UrRbXVXF13nAMYB8mtXDCtuU7DGNOSrgMdVNRl
	gEnPNxx1wABjlLCvnhz5FGLSXJvwNYleN3vBOBowMdzFDk0URwVsb98Ps61LoaXatrmRJG8mxRMEv
	dcyVrY5x7dm8aayFVo3WzTkcE2ci170aRdlQo82sdRDNWsELgfjsj4Ytdh2JSFPB8UDf/kkUFZ0tD
	/N3+Nu7NG/As5q2ZPSikQ77DgswiztiW0mEPkxp4yCECKM0j5Sxx3vLa08KeatspxqLwNlLTyZmsS
	9ubrOTWw==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJSn-00000001mzn-3FOl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hr2NxhrGWFRT0ua+LREaKq2zK9qsfvujTQm2MFI99xiqZoUbhXhbU8UNY1PJ32Q7qmTTb5w0K9gJ/lOpt97269E+iJkSQ6TCCEPAseS4VtzompWzP+dC9cQsTIiPcho6C2jwIpTJk3I1Xihp65XlUZ16LGL4u1NBbVNC/cQZ82DE+nqN9llUdi+Fjhyk3JuYE6KwIVIBpdmACoK0Q3n7z8FtjqJnTfXtie0z82b4/N0Tna6nivqR76clcFKs5rmlfsyan40OWilu23zZsMtC89LBxfKF47xVdrRUXi4SrlnMGJ/1ySUmjKdfQafUwvrW/zlsifL+8FLmQabfuoeu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUYO7MRnr3RIJyGgfiLnwbA1gI149KSTiEC+L2FbyN4=;
 b=YxiDkeYaXryLNi7IWKN7RhC2mRDfnnxBJrzitCHvordl4z4e6tOO4LToMtFudYIHdZUQVbJdwjVqYHD6RBrMCqY5Q6++Nl2e5SnN+Uv5h9zTjzLb4tFAob7aGrxVOj6szJYB0ez4S8UdV9Gvox+w/ueA4Q4hUi70ur7ci3LjGKShWB1lWS2FW+U4nkj0jRubx3fnkJ7kvmU1nTTbjx935n5LcvVWSzexFRspmlcKTtpYNX6pcq7lUisXvwHLpqFsReBKyts/eJihtJKmfSDo/o6JJtKHOZ/yykqFyJkmLbibzKpxI8tlbfsvNR7GuTQp4Wk7mmXdvR/s/yJUzDvCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUYO7MRnr3RIJyGgfiLnwbA1gI149KSTiEC+L2FbyN4=;
 b=ZUX3wbjMuwXtpwAH6rA21MZgjogEsP1uH/T0MJR4CV82U9p93haONH2QmJL9FyfC5uAwCPGjcTpPSviU2s9J+GCH60o7+Br/TUUM0h+KlJZTTjSgFUFTV1JN6YahNGYzNRWmbEjBOscI+/F+Xi/Tnvk3YGWrS7Q1/l3dtrg6XhtS192sW16lonvhE9nqZJzIuQMoK1OKlM9NxDwS6w5086VwZuAbrb/wTN3XOeixMYJTPIm85ZBCK0tcbP/PkyZWCfddd0jDDR80YhHlH7sb3q8whcB6f8y5C/c/GcBJPdHqalVLAYD8XFQeEmP+pOSdZdursB2sEAI+OkYyafmmRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:57:54 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:57:53 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from arm_smmu_cmdq_build_cmd()
Date: Wed, 13 May 2026 20:57:44 -0300
Message-ID: <5-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
In-Reply-To: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb1cd3c-2777-401a-699b-08deb14b70d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: sQf0lFtIgQQAX9tj+30Hzm72Pg3DPzWeJMq8PzA3zoZcWx7P0Dvld0hIQNfnolHit5MYuJDVbUK9aL5y/mUB2L8NKhbTT3xDBS0XAZY9D/XC1WDZZBtCyu+WiJ+63vuswTAsvye/anTkUZDraoOxMlEevrsSCdw2BpeAprZsaaUJFIQA0P/elrqXHeakykBOg12aZt84p8vFhUJsJ1nF18cuqgnv5rcKj7wYFbk18RQUnybVrg4ym4yOyCnYY4rFH4EDBtb7yPY2f/Ij7Vixt7/y+vjt5UtOVw2wx9wM2JumyCyXUin1L7mNF8VVQv5qY3TK+PziFFOeZBCxVxD82Gxt55AY32ijrT6WxBhaoY8qHE1Oah1VktMG1imj9ChGT0V4CB9hTwPMp04rq5CiDSqhQ83FTNx/DjnUE7ytjqgFGoDYZSv4F+ZksAQZyCmS4ac8Ky7NDF/Wi2GsfkxRve8+/k7g4R0r/DuivWBYitlEpjiGbO7M9JO++0YpSgp6N7sqtBHOpjH6HuwTkDeYsfrsAiu1yuCXQjqi5prwz5rtCjX8+k9wcSR0Qiy5qXheH9bYtVnUl3SS9adrBfUo31j7G+57BtSeP6b5pTzD/lpfw6rlQl7eqdm0bAtWoDimOWg/uNko11RIvNWeLiak++ijRVVTPZ9NLpY4KZxHBhOpxRT5gHhA/F22kH6wYXfx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iLTkJtmwVGUNuVV04cLpMwUtYsJd8CQt4fmu3aDViOD5tgb4z+gSEFcTmOsj?=
 =?us-ascii?Q?1rBYjpLdXj9qs1r8iaymnc2wWr/Sxu+VHD21AUlDH6J2OjUEuczY9csGnAVu?=
 =?us-ascii?Q?5NmNmYWB2u2OdanREMpfDjh/rbgL7a3GtESpeeG3iKsSMdVa8wj0iKYrfMqh?=
 =?us-ascii?Q?EnowM2IGg7QB89SPADmU4JDxa6tkRdOlTPfJIw3XQ3Zs37NwSDfK/DnMZclR?=
 =?us-ascii?Q?JVAuAT2Zm9qHOL+Bk37n8UlJ86zWaQ/o5Xf2Uj+RI2dIxca82XIn/az8mttg?=
 =?us-ascii?Q?EaqHWWry30HWGh64DeCXLz1a//XECk4VO16vOeYyk6zAHnmthABEc43OqZhN?=
 =?us-ascii?Q?jSb6xCR5pml77xj6z3OZ3/h4m6oIpa8zIqnyO/GaR5eC3GgVk+Sw1gO030e1?=
 =?us-ascii?Q?hyO09QV8a+aHPjdMo9VTlrCeTDxhLTPXZi4mChRBbK9J9MXY5O2/uwcc6S2C?=
 =?us-ascii?Q?0Z2JNdaey+up4rOj3D3lpHv3dNvwNA17qtQvETaP1x7PvJmD1X5rRkA2mIEk?=
 =?us-ascii?Q?F9GSrgcqPvnVANjvHwe/oiEpNr+1OH+R/x9O/xEAC/35xz3R5J8F7/Zm/YrA?=
 =?us-ascii?Q?cuhQyvZRL4GHB0l2s4RLNhhueSmEymLpHI+sOVnfkAUhKZdVExQiq/kf/jYd?=
 =?us-ascii?Q?ALKM7LZb8M+KI2kyDNIzkfX00kWzBwBj3TvNghhPOsWsIC48C7BRH0khfttX?=
 =?us-ascii?Q?Km1J1d9p6hn/QoBSR3HbyRxKz04Pdrfuhe6nia93zc5+0NVoIgFNQWvJERew?=
 =?us-ascii?Q?l3khHxfhAKSDhIiJJJlCYBjV+dfIaIJjZ0dpOiTe0LpQkz9Thz+3413wiWXd?=
 =?us-ascii?Q?K7f3CTVG6gBBIr7/YfomTnt76lNeSzYf5XM5tjwJvPQyu7Ebf4mKFnfHZddm?=
 =?us-ascii?Q?AyuG/O8FvuaQ2vDP4qBj0HoHOnOYwFmbyC/PBfIuuWa+ULvepauywtKVGdvL?=
 =?us-ascii?Q?UYPkkSsKIu1snZsS8JATc0Kg8t0NIUifIDMA+h+wa87A7Gi2eGd7BERnzm7C?=
 =?us-ascii?Q?fwh74a152HjuwwU8zRXwX0dFTnEfzYenUiYYZ4cEhmkFYCrmYLd6v++pqyVK?=
 =?us-ascii?Q?yAMaDiFxuozf/m8Thn4IK3hzObtxe6f01lazC4AC5XotdZm3kTZhQ+6GH3Sc?=
 =?us-ascii?Q?eXELQd3uelC2e9icufEWcUHTyW5ekqLgFhWfqlOz1dyfR2h8HQnysBRO7ua5?=
 =?us-ascii?Q?yIpDtq0kzkhzJ7IUZAEmFSELQyNX0d+EMbvWHnJwwZsaayEGZyu4eamh9ITW?=
 =?us-ascii?Q?wgUZhr1sdhgK1LJcZJBjhrTaEsd/9Qmse7VWsQ5E03EqcFmmMV6I9i0c/Rjz?=
 =?us-ascii?Q?wxiDrJSZJGeWRsnxbh8dD+XTpuAQyBkrOZqQzFpWeybftqbxXF8TimhcDi15?=
 =?us-ascii?Q?uuR6tfAWW7CepeZ+zcNRemD0qcwfwe771m/P31gbJeVi0OVjkala2qMbtv7h?=
 =?us-ascii?Q?guOk3lEd40tcFRkNFtwsFcR7VFIG3FoAH4lDnMGz+841q6BPAvgsh2VJrn0G?=
 =?us-ascii?Q?3meZ7sPrUwz81e96Va4C3FEibVykS5JYHASasFqnJNejnRis7+4ju11PxOF+?=
 =?us-ascii?Q?bZ9d11lo1W6rYwfh1EFaVjpzRfbVCd7PjApcAECv/i2riVI3taEEGOBEiczn?=
 =?us-ascii?Q?Wh+WPjP2t8O+Cz4JTA/QiM3vLveUPsG7uq4/OUZABf6GU9zHrDRpVZgrdKhz?=
 =?us-ascii?Q?4M3L86lNIVbURTvxoCI/C/QuxPclILYnqDU7fMZGG6qMcjrD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb1cd3c-2777-401a-699b-08deb14b70d2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:57:51.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxigr3FLctj1v0fuSeM+ac9peb3exH1kCSZ7HJt38AeCslcubQNQ+WB3tA4M/j6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_005806_234544_629CF1AA 
X-CRM114-Status: UNSURE (   6.98  )
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

Nothing uses this, just dead code.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Tested-by: Pranjal Shrivastava <praan@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b3ef001ce80d23..ef0907b1a2204f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
 		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
 		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
 		break;
-	case CMDQ_OP_CFGI_CD_ALL:
-		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
-		break;
 	case CMDQ_OP_CFGI_ALL:
 		/* Cover the entire SID range */
 		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
-- 
2.43.0


