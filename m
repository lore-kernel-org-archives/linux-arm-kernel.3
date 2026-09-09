Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC68C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90h64WVg3svZDYE0pawCt/9NCmZcIXdTtEVzn1vGyu8=; b=KgRyydpIEFRgXRWUQDl+Vnkkhp
	uQavf4kB4Otx2rO2Q65gnUZZszfW5bjjtwCex39/AagZPzn+e+P88X4xHiCuhFFCxB+o9JusjHLwQ
	DAKEAT+jOBZnKOmWe4N3ntVTzonI2a2mXEAwAOU5piBaGNfk8rGOc2umZRjSIkWqimwsTxMGyK/Sl
	TVCw3PrGcRpWWR8N95u9WFNhHp95d5hZ0pzqvSJlRaJ11U7a8grqBS8/3ZZxR3jI57eDxIfor45QS
	yjObNb6gGVjGFJp3ZEOpbuF9LfOIdkgV2XENLJ+/1FBFlSW+9o4kybQIdTRwoIMo+64xs8EEnIWjX
	7iZCJffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FgG-0000000BRvQ-0NGO;
	Wed, 09 Sep 2026 10:37:28 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FgC-0000000BRuK-0lLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:37:26 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898omMA4083185;
	Wed, 9 Sep 2026 05:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=90h64WVg3svZDYE
	0pawCt/9NCmZcIXdTtEVzn1vGyu8=; b=dzO/ZffcXC79t81etsdztIeRbZzMJiq
	OoYucrKp9lZ9ZHJHdNDTBhR89tTDktTBXbDllA+d3aMQWik2kLcWMmRpBSj8Z0Ip
	3lDP0oIpnUy2uirbL9kfAitqIVZv99B4CMI/v6fXhHKK6fc0bkrQnaKa8DkHoAnH
	z9KUhUwGFzYrf/fiNiGVdxEFnRKhtMq9n7ADe+7MzFc+1x9nGpiLmEXJdnn/ZDh3
	5EZowP9KXEWRMq5jRfp711qOPNPKzkeA+OyRmmlCvopjGrxwxh15FevtJ33f6DGo
	gFsblauHpJtG6iHdKMnoukCPctgB0+KPfh3Di8HOw0zafWnysH6c3pg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gk4a8gey6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 05:37:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrn5uAEqqj8/ihr3pECCwh+fdicmy3Yffp7a2CamE6p4hP3+CW8DOs+Vm3UBGoS2s+mJZ+tPXvR/IIhysZQNKH/HGs44VlCDS6hJBujcdD5oJ0cFHO0bYLFhaUoBLhW22oobUsc0OSt5qItUk4Nm2fX2HTtIe5zXgWfvURWyHYBCCvREfa3WmI/ymd5/ycQbrYYNy5FnlCk1Sk6Qzoi8HmyrUtNnh1tZkuHiVfjYCysh+UK74tcQwOzlwBhIrQEF4cSiG1KlBlHz9sRtUQ+hq9Gu11AVKTzm+8ExWB/RkegwBDakBdJBf1dL6EPAClNNlIETYi8tOxz5vbvj+aefJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90h64WVg3svZDYE0pawCt/9NCmZcIXdTtEVzn1vGyu8=;
 b=O9oqeC8lH5fGgX99Lte+1ogxloaZT5qMG2gN+LNdFeaS2fcv8metsJLULrzxu8Gdk/b1wVz0t1XjF5vnnFXBEJRIVBqLHAc2Tk1jAzkIz38+SNpuSsVoS2G/40PKSEJlEeD9PSrv+JfMyNTCU2YEChOgkAjaoky1ahrkueGO15ks4NQXBaNlHCHWBr+piz3HEbmW030kbr1M5TXd+N+d0GDFpPvDjWau434rL1nnO5AvcoLtiY8wxPDW0qDgNOBmdbSDOzbjuVnsxa1oLQERdiZAll7XqSyoe7imkOvvHbbTkyWJLRc2iagpCrLMr+awYjJUbixrdlEZrKtUsxBimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90h64WVg3svZDYE0pawCt/9NCmZcIXdTtEVzn1vGyu8=;
 b=FD28fxWnnkMGgO6FL7A2DHCNPHxnzViirBQbdeYjCz0bejmeqdcyQiiPUAZBe2XnTDQBDMUd2HQtIWMlkm5zjAykVHUQDIda7OsUyui2kq1aog5WGXw2ep7EsLmNN1eoW7caVCY5AnPC2uQVOZ1cYiTeWr6zYkdVK6nbO/YTyg4=
Received: from BN0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:408:142::14)
 by PH7PR10MB6578.namprd10.prod.outlook.com (2603:10b6:510:205::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:37:10 +0000
Received: from BN3PEPF00022BCC.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::7e) by BN0PR08CA0024.outlook.office365.com
 (2603:10b6:408:142::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 10:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BCC.mail.protection.outlook.com (10.167.248.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:37:10 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 05:36:46 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 05:36:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 05:36:46 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689AakmV128060;
	Wed, 9 Sep 2026 05:36:46 -0500
Date: Wed, 9 Sep 2026 05:36:46 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper
 MMC power cycle
Message-ID: <20260909103646.7jk5vwvyc7tku5yv@kennel>
References: <20260908170635.238775-1-jm@ti.com>
 <20260908171613.bpd6eo53cjtlrztr@macaw>
 <e8abc328-578e-48cb-a469-1e3edec6780a@ti.com>
 <20260908174934.pbbvtrfhlnjinipu@constable>
 <f99dff87-6fcb-4a19-ba3b-4d31e3835726@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f99dff87-6fcb-4a19-ba3b-4d31e3835726@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCC:EE_|PH7PR10MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: e06d6419-9b90-4552-f766-08df0e5e4df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|6133799003|13003099007|18002099003|22082099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: GGzOwUQWL4JuQd+tAkKX4bdDGA3HFT7HpBMXuY1dh2lql71pCSTeFTrNGWqzkM0fMinb71iRdERdCUMFBhlBHzF/a5SpbUyJWDHMZiHFB1QaTQqLa3KvfBBXGSIHc/TuIQv4ujIfjt28qzyTx3m4EoXtotn0bBpcoNwoDdFQPwKdCBiYyyj7v8Q0kOBpPLLrIdox8900nLaG70P8wrPZ2Sj1HmYBqfiqa8/PwlDSENRiu03YLRr6xPo0YhNNYaBD1iEOj6U5ZlTL3y+JBCx+4lSQDXtMKkUR9JDE/d5R5SG69ZqJ5FL7ufRW961Z97K5DUa7diZ9dLwR2mVHh55dy3tJGsaFKqCcxxaUxDGzs7iBQYOps5jcV83bNujKtBi3LpsrhoFcYXnFUpZ5AxhjRzIgJ2Le+Tj1Ilm0rzxShlRkGRQzFnfuf4K9RugdvCpBQM4SkyTwacs0Nazw8a9Q2EWDgWHpWeQ2q49HpdoodFacxzgqfMw/IwEvg+z9E2ZHCCUwDzs61lzr/+qbWFxwb0+zFof+qlZmAmAKwgvbGJZ97hPcYiIXmsrT6r3BBFHiQKKoBIkQrhiQA410trKxYVlhUjwHaukqb1OQ+vNOzUAAbtsle+ujX1XecaQMKEwDVidr5hcpOJQ2pMYOMn2LjlLphozhTqz9WT9GCQsguCT6R2DaiPt25dio1Ar/grPzZhxWh+d3wX+DRFtuarDAEg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(6133799003)(13003099007)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +oAnWBJ4/DwLsSnMCKunYEJB2ySxvFBPI2CKN2tsa9Iio9YzLYYjRaFjox4WiMEjNXujaqgDLwRcGvZif5kskbTeClKFWaNYyeWJMJpPf8NlKm8YXBb64xl41pfvWwcvDRiHTfrHWdYZBmt9f6Np8Qu9kVXr11p27mSUsG4L0+v+pcXkCILqCVfFrPNCRHhVmYRNFe9CHkO3eKqixXs2wkbkaEjKmGamcIbURsLH3leNMuSLZKd5iYuLCAZRtLPBA5/BfwrVEduGzKjNj2WWwMXUXXEZmv/sDhn+Sm+gsl8RqR/vyFeKb83/NZN5WEUVivRm+XyDIKRWIQ7hZ635edPOnXvv9BFPz/ft5XApuoYH8oh3FDqAusSiAvvfSUp91V7YYijU5NC43lbCAO57I9vXVRbdSoEqgR+2Qbk2uu4ffswMaAi6bYIVYMuPcPtd
X-Exchange-RoutingPolicyChecked: 5h5nog70UNw3J+xqQtOnIK610kVVejzOinP9A+9dYQif67Lc1PmDOy8ZK/+AiEwkaDhSBwnVuYq8ZT/k0UdShHCaBVGXy+UOSgPxDeOuj1gIs/pA36ttz8QxirmaYSMI8UPApUPvpisSSdF4vDpAdrkqucrDG2/ANqr3omyniiWpKXYXLyn5YRGcAoP1dl688qlDt+PUnuEWd1bxwsMnDTxFS/05B0wq8yTjzT7t60zkzBuKxKAoe3ax+4KPybFcU8tvRcB+/skViB1y7YUthkUxW1ZlM/Tz8kKcTXlqlsXA6lcooDFkinNgVpSM0aH9PHAQTrogz1aiEedHMYiByg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:37:10.6259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06d6419-9b90-4552-f766-08df0e5e4df4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BCC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6578
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDExOCBTYWx0ZWRfXyOdQix6rgwLL
 /NtZg1yLBe3rTFaqe/W7oE4gkk3dKfDY5p7dVf+kZIfb79co1q4d5Ot1Jcy9n+ujWvaFPp4zaUA
 SJu3xhptDdDb/iGApGCY3At8pcxwcO6sOlVHr2tmrQpazfFYtbfzHrPzLEkfmq1ZAb3mWrXBAzr
 3w5hDAt7y9v3oore+KGRXU/eufoS3KW+h39tYUpVSPphjFhDPQPQhNpyDfDHEJJdfkp3DTj7Mth
 z0byyRHRJRD7Of5Nih6U63wTYf0X4QQaPd+tTUNVOZ3ECfM1r1AxgGLhlKRy3K10MQqFZK6uuCA
 Edf2tQ4Y3DVLClf4TFVsP5VPcU3d+PzNpL60MBkNajtOMUv6zGYoFqMJRi+D1/TY0JjIgbh8X5+
 RzVudRgd/vBHAT7D4m1cHa8A/u4ypui5qlIoeBfc35omAhxafSV0UrukcHepYN5+9QRvRvhpRoj
 JfOlQLvjcq4xUqdrX6A==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6aa136db cx=c_pps
 a=+4AL93Ollhzyglb1kYk7Zw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=CvZwwOHjOIMOI0BzBgAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: yD3JPOP9sBzA52XlivfnLxTWUKU_KF7b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDExOCBTYWx0ZWRfX9dMzg3AQC6VQ
 IIJ3BcsH19xMWP7m4p425hmBWpyJk9YMxmrM/PMqU3iMasXfQp5HdtLzrKwpQYs6XkBincR41jg
 x8g1F1xMgEofLXDzEeSldrB+nhC4WPE=
X-Proofpoint-GUID: yD3JPOP9sBzA52XlivfnLxTWUKU_KF7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_033725_002184_D10A9393 
X-CRM114-Status: GOOD (  25.82  )
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

On 13:13-20260908, Judith Mendez wrote:
> Hi Nishanth,
> 
> On 9/8/26 12:49, Nishanth Menon wrote:
> > On 12:29-20260908, Judith Mendez wrote:
> > > Hi Nishanth,
> > > 
> > > On 9/8/26 12:16, Nishanth Menon wrote:
> > > > On 12:06-20260908, Judith Mendez wrote:
> > > > > The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
> > > > > SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
> > > > > power cycle. Measured discharge time on this board is ~632.97ms to
> > > > > reach < 0.5V threshold.
> > > > > 
> > > > > During boot, MMC power cycles between boot stages. Without power off
> > > > > delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
> > > > > from previous stages. When U-Boot initializes, card no longer asserts
> > > > > S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
> > > > > card state and forces 1.8V anyway, falling into a bad state and causing
> > > > > a boot failure.
> > > > > 
> > > > > Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
> > > > > during power cycles, allowing card to fully reset state between boot
> > > > > stages.
> > > > > 
> > > > > Signed-off-by: Judith Mendez <jm@ti.com>
> > > > 
> > > > Fixes ?
> > > 
> > > Fix is really for u-boot, don't think I can point to a u-boot
> > > commit here can I?
> > 
> > You'd face the same problem if you are starting from a different boot
> > media and then enable MMC in linux kernel, right? what was described in
> > the patch sounds like a discharge latency of the evm. This was missed in
> > the original commit?
> > 
> 
> Not exactly. The failure is only seen at u-boot specifically with
> SD card boot. Very specifically due to the MMC driver in u-boot and
> commit [0] which is not reverted since it is technically correct.
> The commit just happened to expose our EVM's issue first. According to
> the discussion, mirror Linux patch may be coming soon, which we are
> now prepared for with this patch and [1].
> 
> [0]
> https://lore.kernel.org/u-boot/d17a810c-e2db-4a24-a37d-2d7e02466ce9@ti.com/
> [1] https://lore.kernel.org/linux-mmc/20260806162202.657512-1-jm@ti.com/

This context is useful in diffstat. I see the driver fix in kernel which
can use this property not present in previous kernels, hence no fixes.

That said, please fix $subject for v2 and repost. I suggest:
arm64: dts: ti: k3-am654-base-board: Add power off delay for proper MMC power cycle

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

