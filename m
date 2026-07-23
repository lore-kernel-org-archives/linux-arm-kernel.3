Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A0C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SjoC21z+GpO9l8DV5YyFwqM5SQRRUVRKuOc+IA5a/VA=; b=qQ7MwPFSGgiekLRrxTmJufyIKG
	3Bv3mq6Gb4ZiMQhKk7MxMGwhYJ9/IMXdj/MNs4Ltu01etRpjnoJ1eQeagm2IBMOTZqdYCB9BBfODV
	mTYA5feRUj7tG/h6EhmDdxulxgIxS2FlA3na/AmXCckgPfVkQvAaz2PrYxeCf3PvximtHcVTPDeUv
	h8m9Lk7xIPH56FyeXJQkDKfcfKFe0bXpxYHxmPd/4QI6xbIy6rg9Zp+eAB3T/NwSHq+OqiUNZG3+u
	By9rmjDDzu7VmtcyHueCEEvaPc9zw5o2WYqszX/UEDV6uyPF8lwMzuuO5Ww+iArXOTr+1Uv/S+0w6
	52XRFZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqcS-0000000E1LS-0NMS;
	Thu, 23 Jul 2026 10:25:36 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqcO-0000000E1L4-3UBf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:25:34 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66N9MF884111028;
	Thu, 23 Jul 2026 05:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=SjoC21z+GpO9l
	8DV5YyFwqM5SQRRUVRKuOc+IA5a/VA=; b=RM51H5SLPdPPg4f0G4fHqaQu5IHIS
	dSPF+HnJmMnrLk3pIDsblQqQezASpfAsI1YDzhbykV2blsVF+BX7NCZOqhmRvniR
	RHO4HEuhADFOirPktz6a+tUn6kcUllJEgONB9jla69x9GGkKoXOSwI30oVyNxtx+
	+W227r/PHPvaCAcE1KynUgsyZTFb3w6wLBQxMppdQ32DMkNHJhzMJfkQ0n28gvip
	/M+lC84c3yz7P/U0c0KasmcYJ06PsBK1by4ILBjhbR5m5LADv0iEjyc025gFystt
	j5IurMZezhdFxen8YvTkivTe11Ce0FsI3D5N8sdMLwySysked9dMwB0fA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fkg9088ck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 05:25:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLOS+AJLNFosfGp5c4zSj/+wlJdQXsA+G4KfRnNt2QajknoydipcHxAAOATd4O8XuRUm+M0yo4gkSqRKVps3F8JbupnWuzblI4pQrpfdD7EkUYJFcBcRZ6eMdehpceacx6dkzqasXHx+ANLn4tKWc0uaSyatxiH9PZnNOEM8agqQpmVsMPLLx6cy5DkglcKc35PO2FBNMM57Fv9wWAJ6e0B0b3Ir84PEQL4vhgRkfq3K1jICWQXaSiDBnc7OfvZHQ9oBn5meVtc5tOESL4jkOn1YDiyQmq4Nj3+alggGFKDTob6pK2/zPQ2YZeCnkUfiFsNyE1P3Ry1MaFH0jx0z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjoC21z+GpO9l8DV5YyFwqM5SQRRUVRKuOc+IA5a/VA=;
 b=DC0JfwVv9HMUdZ9uyu5UtfXdNOeFbJ2HM0/mfSJBJLzwdPBA43dz0vTHwh5Gir2UFOmf7Fk/ZaK/wuqTqcyMyofY2xNuBJCOijGXfqVeQdn+7jzizOiaVx0+1whTnNMCZguC34A4w+eIy+iMWZMpOr3tMtmJYq56q42dMaoDDwR3ZDTRKIYPsxnq0qR2GlCjT/OGB5LICYE+vTdub31FaqA6ywapL1LdHcYdfxnVjXvVHSZVNUUudOGDUIIi0bWtcuDF7vjv1d3noJt+uQ7V7qQjm1xvEZWCaV4kMAV9kOtGf75Z9+GKMzVi1OhyLyw0tlkq2oEBKDWxc/Zd7WjvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjoC21z+GpO9l8DV5YyFwqM5SQRRUVRKuOc+IA5a/VA=;
 b=KJVGk59mZq0vuNpKSXQ2SHIcpg+HZXSoQO+/yPMqcDkT/krtyQVnufu8TZ83Aj8zxdJ5scr8LhS8hdR9tRTQ5rBcvu79VQuAzvuWdGLhevygxL+r2t+uEigZpCXuzZsU0X9/bE8NwYArOHZ3IU2aMzxZDGVOBWXdKuDrM1jMltI=
Received: from SA1P222CA0101.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::9)
 by DSVPR10MB997796.namprd10.prod.outlook.com (2603:10b6:8:38b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 10:25:25 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:35e::4) by SA1P222CA0101.outlook.office365.com
 (2603:10b6:806:35e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 10:25:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 10:25:25 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:25:24 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:25:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 05:25:24 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NAPKNf1518375;
	Thu, 23 Jul 2026 05:25:21 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v3 0/2] Add DSS support for AM62L SoC
Date: Thu, 23 Jul 2026 15:55:17 +0530
Message-ID: <20260723102519.3581762-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DSVPR10MB997796:EE_
X-MS-Office365-Filtering-Correlation-Id: c0196d71-f9f1-4800-82cc-08dee8a4b597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|3023799007|13003099007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 3Kj1dQmKXzBYyHuI2NZUz9sChK93KTYNnm3gOaCroQ34q1Z0ZgqF4c485W11i3bm4bE2jM9KewC9UXX+U4TJ7eclevFnVcPmrDHzkrGthVSMnyMxvrc7LoR94ymU/8H6ROldXRYyWjgtBYUJoscrWs6h8aL3vMT7gTBvHI9Luw5dqMuA2w54j1ET0NLxUzMkH9/iTZM0fXbEuyyGAVEopympbc5UqHUji/8NO0cCj0A8YFU6qKMhhzLF5t+63+u9MZwsXL9gQ+WXm16xKEte4A1Y3WI830MPcrzXcWafbYfYc0+j2TDP/LQFK2JS+/JCKjcMzgA21oGCngMGYGCIVfudklgdPPH9uIAX/A5gT9ICMPYx7MhnAtmqMRT2fNU0TSY959r+/2OtBwEXfL36F0kD5nhjkDA0szQv2UNzxwrh25lNz3VOpZ3ZVVwGTEkI1cZ8pWG1/rBOQ4ZxN0zOGThgDCrFL4u74RdswavbGyXQANgMGgLwdpiL7ARZqXno1l+v6sw81/Q5K5FSD2qHcarS8w1f+jGEFHWRTRG1H4NCcvDXqq3c7WVRpCpe9WpmFAjOR+/I6n3RihnwE2R47YZTcix8ladhNg7ekv8Gm5YU27Fq6g+xoNPNWMYxuZvj+mJDRYVdB6BNgoSSMFAZChFWiBzejLDnOy3OUOMJg8Q4nTAjMvu9/B561+8lcc9l5oiJowEtlfzWykihEYgE3Q==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(3023799007)(13003099007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CIBgabFbgqLmTLBi974nBk3Yk2RifurGZnSkLuhmNMKx8mIveSghj6/iYKSVFKCqPCj15yYdnk7IL7lZuNHpWbf2GoiMv6VnCaKfzTEOvsk4OXwP2908p0Iwux6j62Ztsj2t/m23M3fBzZyTP37E3MdgbCT7ezuu+kRZ3oen8fWqAtvdYkDHAktYV4J0yF2qAf2a3FLgZv8xRZpn5NPf4wkov4ZSt8uIhi9i/SVP4bzjenMULJEF1fsN9XtfAM3QA/Q5bkWWMvPfsAOl6LteonNi0+Q1Ww4eF4OfHovdeDNETxMjbfD9kvdEXNrfFDNkegjRvo6Ato2GandvPmlE8Va+um3mKZwWBaWkdBgbPK0S0YRt/Tl2H4zBcJCdqfAPlrCRlC8TdewTtP3rv6cRR4ukkV/bYpaqN5c9a0GOUyg+9nM40ri/Emcb0JVX45gi
X-Exchange-RoutingPolicyChecked: pXq7Ch39aWxUCuP+vzlL9t5PgAGKcNHyRYonwU+tMr0l8ukXBhVCIr7G5EcOsGtmgvS6jeNoZPd2YdfjVI5FG9H2fHNOSP6CqvJa4/B/Bvgf2CjM8wEiNUQzVtfqdmT7WJ82SnU95GI8ZunC9sgRsZwlWTVo8Vw2pULfQjvymnUbBRtAkV6e8pgcPAZK9JacIWGafdNf/Dhuw5zVOhE35S/gcLnNat4ApjxpEp3ffyL5LHq1TKxdo6G8lhLeNuLP70Qj8wyaHwMSyZ9AJ1lQLoK8ayRD+ntRQGjQg9prymsrNCG+yFr5HvYoqPp/NXYlDpXXKySTnTjLtayrZDAWIA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:25:25.1310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0196d71-f9f1-4800-82cc-08dee8a4b597
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfX7BCTHc4iZSbt
 oEFQmcjLjV/m50RX542ojWH50lWH53eeYjhGF8TBWPa7sWGXxgv+llKg7lXPtSQoXti3oF80EHj
 4Q5pJFpVQLuqUfcTBP6imZP5frvNRLKzxeSmStJC6kGCroWVl4sl/3ehddW4VEPS9bYjesm3pBj
 B55C6SGWKJVzn8NCqJAIMSfKHuel/pLYmcQP+kT6ctaYmT4EPoao60ucbkb22/AIyNdJzjgp8CA
 Vw5KWxw4dRvTj2T+kNhyeaNbvhrWqayI5HEogkQgXDVDeYgeIBdCl94bhkCLotfRFe1W2kn6YT4
 Eg9s2rAsgzJ61mWoc53rAs/n1pkPlQe/gVkVKA0SVvrG+EW1z+DSwbZAC2EEJxsDw8CNJn5AIZd
 Xuf6ng+IMRtmLkuWkPQiKMfrO5vCSnbV0jMvdSMtWCJgNRHSmrRIhECUZ6OTv9FsFnMFJ4b/dTj
 BFHDm6C8Xy62BANc7EA==
X-Proofpoint-ORIG-GUID: jXecOJ17uA36nCWmCHl5TAcanf-Mvja3
X-Authority-Analysis: v=2.4 cv=EeT4hvmC c=1 sm=1 tr=0 ts=6a61ec17 cx=c_pps
 a=E5oZx+PGEUUM7Gb8cE5EWQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=8z7gb0t4Ly0oq3oeNwAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfXwwlBRd2AOOqE
 Q4umRs8sjmgd/poDVc11zGeG8O0Spon4UZzSU9CaoEKiH1I82wRiW0T7FRaHMftSymqXyYKX82M
 IG19NugE8TPD37oElIsrT2uanH1Bgt0=
X-Proofpoint-GUID: jXecOJ17uA36nCWmCHl5TAcanf-Mvja3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032532_877843_60D262CE 
X-CRM114-Status: GOOD (  10.42  )
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

This series:
- Adds base support to enable Display on TI AM62L[1] SoCs
- Adds base support for DSI output
- Enbales HDMI output out-of-box

[1]: https://www.ti.com/product/AM62L
---
Changelog:
v2->v3:
- Split patches for SoC and EVM related changes
- Add dsi ports node
- Correct styling issues
- Drop GIC

Link to v2: https://lore.kernel.org/all/20260528133529.3476499-1-s-jain1@ti.com/

v1->v2:
- Update the commit message to elaborate more about the patch.
- Add dpi-pinctrl configuration.
- Update the interrupt routing index for HDMI interrupt line

Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
---
Devarsh Thakkar (2):
  arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
  arm64: dts: ti: k3-am62l3-evm: Add HDMI support

 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
 2 files changed, 155 insertions(+)


