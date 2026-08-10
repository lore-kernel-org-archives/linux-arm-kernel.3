Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC09AC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sJIOAVqsbdvGpmoQFSamfFSaGQU/sBJa39bOlX5FNkU=; b=KCpvEqqwJLy2qCEGjD7UDgSbff
	DjCW0zl3F3vWj2ZhzcCRMapMw7iffe6MLvRffO0kZxJJzFEKEkIHLrd2Z6J/if2zcM6tMq/vgPFu0
	zZWViqCIgN15ntI6UaCXpeQDylSArsLWpnftF1/VJoWOPiK1gzxbQjeJpTrtZEPrTC+zshgngCjWd
	gq9NxZxpbdMion1RGE2G3aken+he2KZG5cMSwsn82C6Cl58E0phoYCkd+raYhV+zmh48R0LYYRL4J
	x8rfq2SLFDzKXdT/RzJ/dQx3XGnaw+hXjIPYb4E0xcIh/r8jowaMwabhq+J6VuB5JwM1e777CiShL
	Xl6m16kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWz4-0000000CrO6-10jt;
	Mon, 10 Aug 2026 20:52:34 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyy-0000000CrIy-0vLQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:29 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AJj87H3700687;
	Mon, 10 Aug 2026 15:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sJIOAVqsbdvGp
	moQFSamfFSaGQU/sBJa39bOlX5FNkU=; b=K4p9ZJQCKNNChsad2V+2bB6v48BdG
	L8To3LI6+HU4IbGYjufilF3kTZydJkdZYDNBQ4xbPvCb6zxlW4w5t0WNaQ9r5JES
	xxJAbNyk3DXw8A13kJXr0a9j+ddFWJruuC8ltzbtIp5k4qEgrUPzVVYdawXWOufU
	w8XM7wbKWJ7gXaiG0HdFKqBYhUCO8JcsB25+n0w4KcRPfqxHeVgfnQe2nzgMsXZn
	CJn9jBE/Q0ofIEwOaOB2JV7CSKCQ+Nz2viXJMLWbDd3+Nhg6v+IsdEuE1Y3R6opk
	4GWcNhW3dHVPu/ibFAyCelQhJE5ui8qcHVQSnZDIkN/81MNzsIdU5lgLw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013037.outbound.protection.outlook.com [40.107.201.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwv08n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hht2P039fBlzWr+y2QioqQ584GN+B4rejNBqVuquqbZ4qJNYczZwbOkcgAjJ2GuhkvTMnuiUBROWCjXdBod0uxXTrCDygu1dgvNdKF8McSty3j81eJoDdJuPSCMOhcuwpmzuEyJTx23/pu/8zuWNb0mxtxHGg1lk2HowUy6inRc+t00aYfb7ZigqaaK72fPNeOBaFlXIw7cqrs0O7/NrNxru7VXTpaOyRD55A4WbMB6ZzmHpLLlXKAaO4FNRJfZood/W5b6XLSHq5KjJBCPTskVYYfXLF9Sowe4BTJwCaPEK/sydT6IG9s0xcl+l5Brgtt5vVC64RxmbzdhnXSQVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJIOAVqsbdvGpmoQFSamfFSaGQU/sBJa39bOlX5FNkU=;
 b=EM2fQEUFQng5IhsUCLTYuixnxgQDA0MfHbVWnTMCnztv3xBTlfBPfC9hFCbyBuGu7VdebxPlDKYT7Xd409wJTbQ86ysNyxLW9HgPnsZGRYewcGeQ2h7loCQ8fZpFyj1hgvbMc/4Ozgbj0qbToXEksqGNzdLcoXRa8SodmS2ePYMaoQo20zxJmdlWgO6AHw6LdKbwBomSyRAarMc7xct8d8wS/ELHEDmRRynaoYlpvVeKRFwNC2Oq+2AD3+N9zpNm1uS/+mniKnEuvxUd6LsJjyoFWvRxtCF0N4JrMUQHIJMWdQEbIqzkHpAvkYtiND6eVGYzWO4pOF3xgjz4kVGB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJIOAVqsbdvGpmoQFSamfFSaGQU/sBJa39bOlX5FNkU=;
 b=wRL9cZ4q3jGhjZqgpKzZuCDDYELxvpIbtB7QB3KUHXscWz0zSC8HyFM9QwQlyla2PDgX0SbPvvJsP8HTSfxUs88kmwsI0GMLu4riKiTTB2F0asoo6m8XTyvxWVI8XdSORuyXtFYkZy+/3gfc2yZLhqFO7XpBQiHBvSgwMjUCdCQ=
Received: from BN9PR03CA0700.namprd03.prod.outlook.com (2603:10b6:408:ef::15)
 by DS4PR10MB285239.namprd10.prod.outlook.com (2603:10b6:8:4f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 20:52:09 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com (2603:10b6:408:ef::4)
 by BN9PR03CA0700.outlook.office365.com (2603:10b6:408:ef::15) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25
 via Frontend Transport; Mon, 10 Aug 2026 20:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:09 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:08 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:08 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Sd3838072;
	Mon, 10 Aug 2026 15:52:08 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 0/6] Add SRAM Nodes for VPU
Date: Mon, 10 Aug 2026 15:52:00 -0500
Message-ID: <20260810205206.685971-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|DS4PR10MB285239:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe9735f-87e2-425d-60d9-08def7213ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: Eu/T42EswDN5ZHIbgatQ5C2HfUKFB7WALlV1PZBfqZ7werilGaU5TDd/4iOA67yCK11TvtapuVCwE2RGzUE1nOkm30AlIokockmtaT7ooXGzdThvdgNimSCDAC89YpPIc7weOPLyE5ZsQ0CNnDC5lfY8UvTWtNi9mIV0OEbxR13axnTNNxVofwpyXUwZLi+gLzH9Nge5Q8BzLg2MTWqbhJDeY6/CKuBOCxQHOiuHMhI2MVkTkKlk0YJL8EXDn+xu59Qa6VzhwCMvCKzHghPoIS4gaYxMR/VOboYANaKXl/QHSZdsx+2DAqaKjLKssqt+EvoSSBKSg/2ZqiuiOkpV32kxgeu679CbpRfa735HQX8wWMlrb/TeBGOsVBUL73o/2cb8YbTlO3r9ptuV9i8LiT8uB7IcGG6jcBajVCrbhzENqk7CgMxPVXmMJ8baJBDuCH53j4E3Eu86LSHi/WFL/m1yuFfBjmiu+4y614FqDllwl/dIJSoXCpMH7tpqXY5GsAHgIPnfgP905j77ax6Eom0sl2++wWte8/0y9U3bhJSOmCMNabFTMjVQsANBcbR0OwGqkt7BGRJ+hS8qjsNbyz5gtDxmey80illriu4ovAWufhRE+LNgfc4ROrqEcU2fhX0Nm1hv5SN4avBmlHliYxmHHApIZ9835bvELCWlPNvR4cn+7+3PFcPvsAvwblWYyEG89KUcBE9zL6jo+mCm8g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oEOY3hgkMX20zdGRHrQMhJ3soGW+O51a3WYYxRsNBr59PeYXuwPNm3+rknVwL/SJNy7RT0sFLJUF8L0ynegzcT439eRC4rk/PB6QBc3xgU4chiolTR9qYwxM+Ba8QO8rwVXNKmkDTUz4iV+8Fy7HJSFNTOCYcnp7jOsPUaOBAsGdjFAoMOnxI5bFfeLfFKIBV5nCZgJ3xIWOA9NTMrUvXivc+u1vTVWGDLl0Qdg6W/vN6CuX1v2+AUapmsHj3SnwisvNUYFZReD0Q/at8AJh/5CNQBQcwvpmrKurw09NKCiA2kq5K4e6H5J2PeO5PMHVwd325zjucXFZwatEiMI1RSS+UiaolEXY1MhDYtYqAc7vW+2FRJphwqJvNGLVUqPxpS0vepP9FTlbXemGdK9Qn86coVBUNRk5Qvo2XKfi2WYHQVzXqBi7QcZgYuiDicMP
X-Exchange-RoutingPolicyChecked: WUDiY5H7bw2FFfxEb2OCEoFgRhCmoDMyJBrskkM8HQR+jb/PrwxfybfvW36FyjAgoymZSsBwJ8clU2OMeK0XaUUauhBZLleSCZ/S37qZ+bA6Q1vmSec71F0ZAiQC4l1BBxVpFlPqUstQD+UyWgfol5ECUDHfBQUxOkCUS75R75IjJqcAe1Egtb27bBCEQLtZig55Jo/+JFmuw/EK0gMhA9eW9Kfv/wYo7mo7Y+j1d7/Zhb6vqFxErX/sMxVGvPyFtHucmD+HTDdpx14nH/oE0LsSId9Y7qJzuzS4mDX44jpQ2WKx5XjRW8E/RVpQp18ZQ9PzHg0fnrq0sIAhcHc9qQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:09.2699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe9735f-87e2-425d-60d9-08def7213ede
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB285239
X-Proofpoint-GUID: RcMLKGwF2a-WH6wW7F3zAeK1DGkzvkk5
X-Proofpoint-ORIG-GUID: RcMLKGwF2a-WH6wW7F3zAeK1DGkzvkk5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX81uEmY+6ThOl
 owO9pu+WeT9smDnfkkAHzxD5IozLAhJuaaASSmZHX7O4ZwCyM4Rh/S99NLhEjgncpaNRQ8dghJB
 ivjzZmVIx5RS1MSXsxR0jKhyJiskF5xp7bpKMnm1RaUBgFlOg0CJ9DSCUO3wyaRfrgizMwimk5C
 Q+DAQALTVN18vlWW41u9FsfcO3ofp9fbJWYRQ6oM+5dkxKxn2MbY5AN52FrGLsBnjE3Y2nngk5i
 Z4dkYJ17L9UuAmOsO93MNRTMSsbi9T802z93dl/ctI+B5+lhp2NgdDlyZIMNfBSNSGeyb33TgZh
 5h+RRHn8YctlE2v6+b8LVeHQc2LT8NCkZZm8tKr6kpjHq2qcbfpye6Dt5UgIFIkxtw/2s6ws+f8
 VSI2JPi0vuEIwNqZCbr++IFzvUif1bP+MHYMFm2672TEaSIeYmfOcAJoSzvXhMeXHAxFKIUw09+
 MgrmrX0Zk62Gul4junA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX/FXHEDxIybuF
 EZIg2PfQNJaAimlioscGI3z9Afo4tKWzIb/JuHctS+uiIv+krCm70xpmuFkATbpvvQ7tK4Tproa
 hjlK1DgwWqrHJJI4zo/7tgwgHVNIMJk=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a7a39fe cx=c_pps
 a=ypQUhvKNp2hcSTodc3zn+Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=KTJWZyFEcVJfwqtDpzcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135228_288937_19BEE75F 
X-CRM114-Status: GOOD (  11.59  )
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

Hello All,

This series is responsible for adding the SRAM nodes for the Wave5 VPU 
to use. The first 2 patches are responsible for carving out the SRAM
pool from main_navss that the VPU will then reference in patches 3 and
4. The last 2 patches use the existing oc_sram pool already found in the
relevant device trees.

v2 properly updates the nodename in the first two patches to pass
dtbs_check. I have talked with Andrew offline and he has said I can keep
his reviewed-by on the first 4 patches based on v1[0].

Best,
Brandon

[0]: https://lore.kernel.org/all/7d8582bc-e88d-40a7-be39-57045fa4c010@ti.com/

Brandon Brnich (6):
  arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add mmio-sram node to
    main_navss
  arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Assign SRAM to VPU nodes
  arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
  arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node

 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              |  1 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi |  1 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi             |  9 +++++++++
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi      | 10 ++++++++++
 4 files changed, 21 insertions(+)

-- 
2.43.0


