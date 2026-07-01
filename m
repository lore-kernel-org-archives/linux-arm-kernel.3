Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA182C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeptgWv4YOjHf0APczO6fqkHNUioqKwtW7DjEetmSvo=; b=i+gUgUJoU+2uZNaxLNJycDNXYU
	t2JtNTs+gcRSNWt+5HQxpFfjW48/yLL1CwXxsgBxACs7jUVLp9Zr8lSIx5iXW3ediOZvqhLWuDXVz
	Ch/ljGHJ2GaKuvDea9Ug5lJFWE+bgj++LAZhJg/F0v3yheuOkuZLwwaX4mg+R0RfO7cpL6ErKihXh
	CqrxXb1ucQCfMJt09q5Ey4/L0pAhyH5rpcP979ssf5lpzSIu8N3/4eMXcyU59vefnOyoIdgarvjzp
	S/1Cccp2prqoLvKK7Q9saqVVXVOwEAVsjhwYA4zNIYz0DQf1x6krjdwq8+Ww9ofSKFrzD+HHnMgi2
	OX3MwqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevtA-00000002Hm5-1Wgj;
	Wed, 01 Jul 2026 14:26:08 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevt7-00000002Hkl-3Txp;
	Wed, 01 Jul 2026 14:26:07 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661BHIGf3568649;
	Wed, 1 Jul 2026 09:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OeptgWv4YOjHf0APczO6fqkHNUioqKwtW7DjEetmS
	vo=; b=PxClAib8dPoLwYUgYzuY8AGPgqRvjhyjxzLqFfNo/MyUn3K7UfQxbndMD
	pTWSw2kt7KFqJHz6FIdZda8G/ORlZZOpJFu4F7m6OwycTZ8cS/SfsLBCcH6y+8hv
	j+F2gCNU9KBQj4Qa1+Y4DEEjgpm14cLtmECEPkoy2+JndXAsiJ82S1wiPLC+nO85
	5wJce6VXljvp5yt3Y/Zrm8sn46VTNvvxWT/XTbz+dP9maUNy/glyxNi2UM6YHezd
	KzVUeVjsVe3N/iH5f+W2G9/4yKmoGhhsd12eqnIyN0N8XsqddvQ59WuslcADjGhl
	TbgcGevsqp+CsCOu43hjEhcuARxLg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f51vu188a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 09:26:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThPVTe45jLArIN8AypggSocaPllETC3BDSBlr1HmirfnuW/Ydi7BQc1D/Ozd7Kyup/OoalWP2MbS0zwTkGsKvFv7TM4k7J0sOcBhMq65WRefkpIkv7cySalCcc3IQ38zoCxNHgXCA4DaTBJ1DFtJpj847cOCBbDQgmZgrGJZ9hPvOa428wK0c5yi2k5udu7RraBGF0ap3VCuc01maJi4ze+7zgQ18CrhoEnZnq2qJyTh4lsk+Uja6Vr6J7zCk5ZNdj/5QrykpJB2GkklG/A6oPw++LcxVH30ey48dICxDWHpSvJxcKhvMJT7lJYInbqUEvYxElAdClIzcPh/PRhQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeptgWv4YOjHf0APczO6fqkHNUioqKwtW7DjEetmSvo=;
 b=VknMohIevPztkExML9FDlcQ+qYDpdhXuU38ypgimVbJKXSU/hXVaBLw8eg4NTR69Z6PchKRV1gyYHkT2Ichd87i7dLThz8xX7A9PGICi17M4lanOKHfeEHiOLopJ5IqV6M3vLL3IzvD8DALABN5bmlyjMAE/byinEvPmNTdmynqM4e/K8PftxsJ4vyW8h38QoV6h4t1NUt7i9wrH2EdxGp4S9WJeXl9fOcWeXTdqCGHbER963o1jnD18KqxLMqpD0MLVzhZLSGGycW4G7/uBq9bXnjpn9Sdr/NUW8f25rAfNLMZdoZ6HH5+8mMmtWGZDn62BoXHWKsCOkoDhC32aOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeptgWv4YOjHf0APczO6fqkHNUioqKwtW7DjEetmSvo=;
 b=jzWrBmCdyFyd4IVasiNf4Wm4sZg2Gw2vCyyr1VARGugbv+aRi+0MRUQu612ipJl06KLk5ooMXBx6DQFi0JUadT6i7t1NlqKINRoNOT/qYdgPas8hitNnkDqNv2R9FVN1vLAodB2+VUJ9flC3lo90xmMtNerfaRw6w4YORnODUn0=
Received: from PH7P220CA0143.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::25)
 by DM6PR10MB4236.namprd10.prod.outlook.com (2603:10b6:5:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:25:55 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::66) by PH7P220CA0143.outlook.office365.com
 (2603:10b6:510:327::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 14:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 14:25:53 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 09:25:06 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 09:25:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 09:25:06 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661EOvlX1000238;
	Wed, 1 Jul 2026 09:25:02 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
Subject: [PATCH v4 net-next 1/2] dt-bindings: phy: cadence-torrent: Update property values to support 3 clocks
Date: Wed, 1 Jul 2026 19:54:56 +0530
Message-ID: <20260701142457.81874-2-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701142457.81874-1-g-praveen@ti.com>
References: <20260701142457.81874-1-g-praveen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM6PR10MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: c803cd32-8777-47b6-a712-08ded77ca837
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|23010399003|18002099003|22082099003|921020|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: KXIPRoXTcEytRRdMj1WKNr6QWJtbrQqxaiTjal95h/u6PB8jfTh/gIVHQnyY4au2QgM6OnIydId9p8x5TlRr/mmaYxNUDb4/16wBxTXbAkoJzOojTSyMTbVuTTypxCVCz+ekgETlhe0NblEl33rmeGFPAhWHHGVhgcqEaB6HUqJQKh6rwHhKcVXJk+58nSrMMwV4oAdd3lPVTRB7nkb0Ue5TRmRGfy45MlH/Udr0NeCUIDmvnMQqxdRm7HXRp1hJ80OkqAm1Qzf6iNAQfZCpKZ6MhhdXkyomL+yjHy95E1+fWZKe79J49kfpL2DSCfXp5IXOuSRnLxpfnAYhuEbf1mpQk/5scIurfVVNohS0Bv6pWUF9jQGP2XLjdXgOm4mCGY6+6uCEdSySvcsuw0vPDtM640ketlyE2wARGRi9vrrQtcMYFktgy0ny+AwWFe5u/LnnqliHjHxDQxnx9irIyCjhe7f22Mx+vjr7vQ/rz8FS7zfKOhnnb4uHK3iozmJlxyK/dESR9wxVpSzqB/YpuZx1bKaXLT12yrZGKMqj6ffS5c2ABjR2wUXFdbnrNuZ7Yen+XjnP1OdHEcJgbeKI5MfdSobb/LrdH0ahOo8PCBC95BVQiaPyOvmDC1pFrK9DHdDypf64T0Zq2FLEGUkgsmRzAOyy2FRi/0aVBHegavvwv0I/IwxCutu1XqoSJ57zEw14QKBblX9z8DFN0jz/nNVbv3VixiMHzzCCOTAlVx4SHqrJcyJrT1hyeiZc1ppQ
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(921020)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MuUv9HVZtRvlcw+ay7JcQXc0nvsrAC0kyh/z/VRAsDEq7q1ZKahlxliBOSy08ry/FR0urHuHwXORh9VZx9IzSZU1hTI7Nx9JDm8FSU25FF7Ytr8Nv5aYRJfpr8xDTPuNCOYnZhSeOjSkTcTUwQ23aWPHHM4/ycIWhB0oMb8Sta1sQakunIYPmlbOdX5WAbDmWAcA29YdBg4Et4+ZORA56ifEblfXPH6Ff+3Eo8kbLavMMQ4ItsXe61KM1KMe+vnhggupfE6EjckG53UF3Amqg5a66zZj+TJduOK7kB9k1MRFkN1fysADpB1td1aCPmd6ZE8+9YTSRo4iEVwAkr+qa1i4m6N5vdkxhdv00n09/o+D407eV7vxOC0EWOIuFAsbza2S4ywmsFViKsp2ddnRTTFulhOXS23f4Gbz7jqnbv0I7tYfDBYoTTWre2GtzqCJ
X-Exchange-RoutingPolicyChecked: rDdfD558CdBJeTTJ9KPEFCK1c0VWjXRWMSI6KTQ/3Dz33UXIRLvOOH8nP/iahi8HysN1UdHswEYwqJ0I8rHB8JaQ1B68wL+P4+DDaB+CGr2JCGbAVmdqnKZG8IJW2IdeHGNrdiyCtlwsnuRaadlbnTjN7KUJ1fOBMVMOoZ1FcSrzMo9Z1f6kr8r2LsQWJFecRK9f2wEu4HeLwtntUbLG3impcgLSI4F8H+88rVySAFvjOliKJNAsri0mdZ//bA0I0JqUOPb7Knux57Nr3l7zS151FI0j6EZlyYgLe8B9QW0VDHRo+KaznUJsz437BYIO+F2q5vKE4kBmBOOSgP3COw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:25:53.0448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c803cd32-8777-47b6-a712-08ded77ca837
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4236
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MiBTYWx0ZWRfX1iCpvBM++lsL
 kXVN3mmt7oT5dYDQuxZrmOljX8Yg0kgP1f+1l02Ywr/eTDMySCMY2xe07KW188QkF5dssj7eNCg
 lCvUL4sLxPwmeXFnq2HpttG4pAj8k4CVXmjzu4VCKiqF65NIlo8O5XADo2u5TvPKKoJ8SqYmn4B
 ZSE/IhWhd6/af74C4QgK4PdkuGyggcRqKedrwRaxc9gZA10+lRR2rrFsylHwhImDPPD8XmPBcOO
 fVHlD+X67Zr4g3MLw0IR0THj67SBj/3h0zgd+Dr13fuszNyvSn24t31GRzZj1Yzg+6hineDsxFp
 nGn5Lg+VZ/OiP3Tw94nQlfMnlJUawTbq5+Hiq9ycShpE3pzLoyMLOF48T8B5zBP8K7ZCDLpAsJQ
 FIHFya2tjf9LtuIx71pmwP6RY6j+wM5pcc4uT4nCzwenHIooost+z5gOfj9BEI+qmGMuAlv3Shd
 IldxIrAoMeSCM6lpofA==
X-Proofpoint-GUID: CD5UPPjJ86VDoU1XZGMF7ubcPV7ImwD2
X-Authority-Analysis: v=2.4 cv=FYEHAp+6 c=1 sm=1 tr=0 ts=6a452378 cx=c_pps
 a=VvAZzv+PhNtEUaR8E1V7rA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=uSPA2Th2IVTVKQU8YO4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MiBTYWx0ZWRfX9X+gA8sxaDDz
 UNNjqQppXeouxNjJNNd6luoWETJcEFlJRJfuNNXqNA60bAp5Zm642p2A4juUFKCSo3MGt0Gw+By
 5wDz2RP/li7k4kUryqzsLMq5tYvQpwg=
X-Proofpoint-ORIG-GUID: CD5UPPjJ86VDoU1XZGMF7ubcPV7ImwD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_072605_985543_AB7EC125 
X-CRM114-Status: GOOD (  11.06  )
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

Update maxItems value of "clocks" property to 3 as description of
this parameter already indicates 3 clocks(refclk,pll1_refclk(optional)
and phy_en_refclk(optional)).

Update the maxItems and items value of "clock-names" property with multiple
combination of clock-names possible since pll1_refclk and phy_en_refclk are
optional clocks.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 .../bindings/phy/phy-cadence-torrent.yaml        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 9af39b33646a..96c664d50629 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -34,7 +34,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     description:
       PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
       pll1_refclk is optional and used for multi-protocol configurations requiring
@@ -45,9 +45,17 @@ properties:
 
   clock-names:
     minItems: 1
-    items:
-      - const: refclk
-      - enum: [ pll1_refclk, phy_en_refclk ]
+    maxItems: 3
+    oneOf:
+      - items:
+          - const: refclk
+      - items:
+          - const: refclk
+          - enum: [ pll1_refclk, phy_en_refclk ]
+      - items:
+          - const: refclk
+          - const: pll1_refclk
+          - const: phy_en_refclk
 
   reg:
     minItems: 1
-- 
2.34.1


