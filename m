Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2ECC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHBQObiX3H9lMeqOd/42gPo/UFKtuqd6uccOAVg6LBA=; b=djYX5PFwK2fa3dlI6pvXcV3tjw
	Mpz95fjpxcyfqM+q62wOa3rcF9JukZLjfovgBJqQC/ZdnNRg8Blcw6uLd/J2Wbr9b9v3lkUzHE8Lv
	KT8pWhAOkbchOzHutDF74MZEHaTTpIcq/PInyt4vjaseu6xiLptYddnce44cTuqOp1/oGU/L8oc9+
	3kiaBMInbjsGvJtfzjNLh+/0yhhaCgXkUMMsmApjZSUMKzrc1S0rfZmKprCFFyeewAJ33qhOiWmN+
	mpIhUY5EtdeGgaEy87sKlSAWIoPEnwuHz3uoLLw7Edw3relRJRxpDrnvwzg4Ae+NPmsvaLIWZyhQN
	jz/396kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7SS-000000011vT-0ePG;
	Tue, 04 Aug 2026 05:12:56 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7SP-000000011v6-3bjN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:12:55 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67418ufH1209037;
	Tue, 4 Aug 2026 00:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cHBQObiX3H9lMeqOd/42gPo/UFKtuqd6uccOAVg6L
	BA=; b=oUxBiy7NGqUziS/SpxPpNK3HROElDaCZ4tX/crqDmCV1toIKPtw7VssTV
	+ZBEd1JY6pcrY60sYzeCAgKk0ZzF/u8ES1B5bFbFFBTiOlRlDVHbQSxTbDT5h0g6
	91FHoWicutwzHXzJZn/JTa9lKj+9n1hGc1b8AP58Meeb7+mS2WzJwWYwWjfPw4MA
	3MFwedd7L3UOgH9KWnCtdSTf3o6BqRrtYEuo/h5ZsXKgKuEo2dg/hEz9wBtTE1Zj
	QvjUXbFGxxobDKjmu7u+0+RX2PwLaYo2BTkk7mLm7VPMs8zbcUNRfeGWT2vpnYhs
	3xmMBu5rM0qpQMb1bvkvc9rhj9XxA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpqpef-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:12:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTUcF2Zln60yaWrVrzTFyliJx9y+kN31IMAQGvZWM7+Fsexg86L9D29k1P3nUu/odjRyfF/7Sw/XGY5Mdzh1qc9m20DX8HSAAao8ze/r/QV1wI6ZmyxItc8rt3PO4uQcDCYzmzwIAycGV5vo60su52OuE9EuXhkT8KcNUE3QEX5bc35hnKNXhQsyMcNOHJsJikh+qFun1w9X9TJqwNDnASXg4YNrwAY5TOZWBnSK3maDMpT2sv+ntarZpHBPdvNGEMQdKCV0LS3/apwWQm5wa8dv2cFOS88no5RdLR5DOzLf7ffPDudkfXsRsoAj5VItRG/RpC+6XZ0XMgLNdwzpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHBQObiX3H9lMeqOd/42gPo/UFKtuqd6uccOAVg6LBA=;
 b=q8PljAAdMUA98XtSKnwzLlhGiVSo0X63c+Gpzhgq3BOLx9CJLUOyeoPR+5pwt+wkcpdgR/TZHxzYODwQuvE5pImttUgEkim2nAKoxzgfKHGMQln7lgeeX8QJwwZjBV/p8DquQnhML4i3w+RvKrGT/HJLghHxpJZohT7LOzIT4XsD6ihYCfDS8tVM6cO2fPMUfXTKgiJxhjiyzka3ATkftqDIbrD/DhrI11lYN5pJSt+4LG26XHkYCtstafjqhLS0ZBP3ih0KgJP5w2fIfxz9kcxNv7YycZDE/GNQk2dEYxFOxsGjOmdX6kmCdDk2SBgHsbgU3izg5+GayoclCrPcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHBQObiX3H9lMeqOd/42gPo/UFKtuqd6uccOAVg6LBA=;
 b=jJDCARsdH+NLpqgrFmUVDyU/uZiFPHCaHOwpDFWMPrNuhfC4eEHRzKqplDWmNVqyyMr849cb8APHvGYQEXqUEmAu0fnrweKTJ/ktpc9CPX6j2/bseVsMJx7bNtjapScK31DjR04qML1gVPGrzYd/9RpjDJbfouLh6L3uElnJ15c=
Received: from SJ0PR13CA0192.namprd13.prod.outlook.com (2603:10b6:a03:2c3::17)
 by PH3PPF18C4487EB.namprd10.prod.outlook.com (2603:10b6:518:1::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 05:12:47 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::a9) by SJ0PR13CA0192.outlook.office365.com
 (2603:10b6:a03:2c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 05:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 05:12:44 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:12:28 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:12:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:12:28 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6745CMBi3058100;
	Tue, 4 Aug 2026 00:12:23 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        Swamil Jain
	<s-jain1@ti.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260715073531.2346803-1-s-jain1@ti.com>
References: <20260715073531.2346803-1-s-jain1@ti.com>
Subject: Re: [PATCH v4] arm64: dts: ti: Add LincolnTech OLDI LCD-185
 Overlay for AM625-BeaglePlay
Message-ID: <178582034051.4187098.17289270626053842900.b4-ty@b4>
Date: Tue, 4 Aug 2026 10:42:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH3PPF18C4487EB:EE_
X-MS-Office365-Filtering-Correlation-Id: b11cd4eb-4611-4c8b-a776-08def1e704a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9cWjRKBeg0cGqov1dtlCqY14o/YE9QykDeAvx2IBmQ5lP8TQvJ/EmSp5Q/o01GbkT+nFcNl7jnw9lt+j9la4fVpKjzX9UdW6nYu/3FGcWQqYW6h5t/o1aQDmQUuF4kXy/dVfjo3dOWfuqIYQcf3LsuavmyedAUsoRb8WL/x19/soeRw/lMiVw14z0YEwUjAAvVzvRjWjf87Ev2F5Jqcx84y9TA6hNBU9BI/CURpXwMvnPH19oA31TsqMIhLpcm2hotyhMmZnKDg48Jp4xykdf1g9BX/JgvvX5k0WFRbBdpPGusJTFCIUX36yH8OloPfAaB6c9o2QXhGOy/w26zISQGQw1ncc1aES3PR3x2bJnajjasnydbDqMU7tfJg29OK6odNx+ldQxbXEKr6H/IVx/qJK0BjkC+RTdmWwpUoApVza7UqvG0uhTH/5cEFHDRFMb0F2cGyRndpMt6y8ZvCRf0i+PltN/mz5stOvVjKQ4vZeT0MhSUMU2wdov6tco4ZvfMI8yKsJ4JegXepb6dWbyESCkHM9v0Uh/Kx+7NoRkQqb+GL6hDgqvjV2UbApmFzn/SF/hHYfjQsQP/0IGN+fVyt7PvTuGpATjRhVaMTiL0DbM9hHnNAx0z5ievsRvGQiKcznj53+IlFAc7QgTEsn/9cs76Pzf2t6n6/wi22afnX5vxkVtpbJ8nlVonqjWzjEk+NAPTmzbRNyGX1Flpd1hw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7OBAtWouMvFCBzEflFKZE95Xigs7QsVMN+yVdOV3oYbD6x0B+LNSq7+X/dMSZ64bYM/NM6ihzqZLuIwltNAhiKzSsZpfhWCW1vLmgCVOzhDHoXUGNl/2pg5CUYOCszTl16uuxuDTBkyHjgBjhZ41FtL3vTo5uIkngAQY6asPFgoqSmLox02NFR1BLEsjtojiZGBQdgjXBPRaFvgFxF5+1p3r/cvICInbdonjEupzwSrE5p1USp7EJArTXBzn0v5c0+jQjAUAMoIF1gAyBJHK9GzL6UX24BtfjKRODZOv9m4ok9cQWPrZ1+dVYilrSDRmrlOulyCYC+qDz3CgWVYJl8tCNo3eEgMdxpYwdyuxzqGaSGoe+qcGiq9DruUJaZfEJyHgx3ExpV2/cSI/0XaUMq3KTJtrlpNtKTQTf1kbeusWwkCgwjoHq1gLPpP+UktZ
X-Exchange-RoutingPolicyChecked: JaPN1zWnezSRdoPX2iRYIogX0e2b11XeQbKZDaP9hGpnRvEM7p7tWG8Z78ROhjRcHDvAZRuFSP63RgftNMlNGCETISK6MXAzLY/laaZSvV3p/F3SucuXSVrfgg2KCiNMRGv4LxR18bAb5vokOB7BeVMdDU79r5WxUVcqLp2zgKGZzEO6eL04t6z5E9AfHpUVeIpjnX6Xk1XP+1qsP3tBtqTCnQa6LYA4n0tFrpYBITVIQh09Ry/qi8S3N8qywHB1qEEPz/uqr1KPNOOWRk0CbbmmIkFlF5R2NHB3MPz/d7dkX0SZA6/UyBZ4sdRHCnQ4I9yYOXbqv9xOxUVkISZO7Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:12:44.9512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b11cd4eb-4611-4c8b-a776-08def1e704a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF18C4487EB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzOCBTYWx0ZWRfX3nl3VgVY18rO
 1c+hTznNg3ahWytA9sYHujzEiBk+aW5sxVMwefDr0wNapv33z2wPpKJhnSWQt0sNC7MlhRQ6XvV
 4w2iaQ/PHZcK3PFWkvAJoYV/y5QpQayA5GQv456FRYXLPcTgCmU1W/sZduZZd80yaiOOsRFE1o0
 vWp4CmaksCqIVQxYZbqoJlCGhBfb9LRzoWI+nVMPWlaYIj6HeWicc3a/FbB66kQg66hC/jQD0Ai
 1t/QKwqEw4mZ+w4WyCfuSUAD3XoenivUrKAK69YXoC/vUnam2wsA7+5fknxfDd8VU+5boIKUfyQ
 dv8kQHW1g8PDkVZ2HPau3g03jNVPyQW5Jatck9BGM7R9ioog+FgNpSlmi3hED+OaSsAntzkBXxh
 Q1TJEABvwAkK2ACl0Tiap1R0tvYf+5HU6gMg9GUw5cHMA+0g2aAUWS3A4sf5PNbPa1E6pgWodv3
 vUx1B6HtyiAg3GqBNOg==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a7174d1 cx=c_pps
 a=CcIcsZDwO3wB2ho3dvPJ0Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mNtiBwv3ZOZrBbxyUslW1Yn2ntUfQFKD
X-Proofpoint-GUID: mNtiBwv3ZOZrBbxyUslW1Yn2ntUfQFKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzOCBTYWx0ZWRfXymQzg3rl/Fg8
 UXoBULqlmOBMWgqqzjdf6tH8YnE6CLR2KffqGcU/Mah+VNJUWFLmishiJ5KkiYJfyAKZvpiVVEM
 4tbyZcJU+EjE/gVnBUgDGdgWViMfGhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_221253_907240_0053F5FB 
X-CRM114-Status: GOOD (  11.83  )
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

Hi Swamil Jain,

On Wed, 15 Jul 2026 13:05:31 +0530, Swamil Jain wrote:
> arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
      commit: 986ba6851f0dbfc1b190190ab8d4cd75c3ae7956

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



