Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CAFC55838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/jZOu53mgdWy5n7enkdXKFlgqwlspUgQ81J/HPKvGA=; b=OcUEJtFynZJuxXC9I4G30vSSdJ
	1Apo0ijMETc9Z9NeSLkUFWIlPKyWe8HLhjt8rIRX+BOawj6P9uOBTSMTirl9xhFaoAXGJbXcatr1x
	/8of1HS51jm9TOtjkj8/yGKtpSwnlH5HjKbP2Vq/mtepgojdGaUBYm90viU71NNGFfEJAx6aNYIAW
	DD0JIibWv7s/dbmiLLQoNKInWK2AxI3tyelRmZDDva0egs1aX7z+zwAo3/Sv8phFWviG3EpWf5gr0
	GQtGivP9BOCFI3UUOTEYlkppjNYHqMh8s/sXXzWi3FrvTXIJ/qNWzRlXhr2LozjG8jYMiLKjvJtu3
	b2o/FPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPoC-000000030wQ-3nuy;
	Wed, 05 Aug 2026 00:48:36 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPo7-000000030sg-1Pxz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:48:35 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NFpBt3766934;
	Tue, 4 Aug 2026 19:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0/jZOu53mgdWy5n7enkdXKFlgqwlspUgQ81J/HPKv
	GA=; b=NqGBbqGJlhtnXHYwe7PRtQ+UpqZj32NhIwd3PF4LCiebY1+hGjy1daTbs
	vmhblBQMm+rBnZ8NNDRK2DbBGlGIqQYrDw+dzzz/eFEcbXR68ZBeJZechOwtyQQR
	YKY7V+jWALPaLs3ZRHL0cwT6AlYgt2hNM/EW7BiT+gOJSI+YKM1sW17Y7p/eewsq
	KGGiC8eWnL06814mKbiVjh4Pc1B1BKE1vOFo6XTf3a/jdfEsHF3rIIV2zaNMXeTh
	3n6KVb5wyntepfv/MTHuHI+84MUng6tF4qzH8Fql1K33ElFG2lD87f0vjROJzBjk
	ZqdL74bsKfkCswu5msux60vKEGoOQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fufc6whgm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 19:48:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnrHy6UJLbNZJxYN0cVlVeEJNcWis20T72tBSYVgOPbh+5G+OjZOaCnIY1D/iHpt1ckRFJP1OwVQPGNSMQMWEQ+PPaW54QgVYcuRLE6yzeDNgYxm6iSuVPWfzMO93RBU/UWupnIRMei3BVtEDkmSn6uoosBCeG0l/nUzM+Tzj5TE8dWm0PtZ2cMLi/ygEMzIoHB0qZi+j6R2+PJto6cmQY+RF7Iv28NsuHAGLWzGy9tQiL5cccMHSfY8k1Lursmhpix8S/c69e7XtfdahCfT9Lq07kkSDVcG5ZfupqQJTI5boWwxyTp5ak3Nj7XuinL/jaX008NcsreSxFGgV3KBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/jZOu53mgdWy5n7enkdXKFlgqwlspUgQ81J/HPKvGA=;
 b=iXCbJqxmfZ6yjEVkqJbxZpXzryTb4O3i+wyundpG8r+Wfqz2X91LOsyUXePiPzN5ObuMN486gVxK6P+XeVCr7gP3sVqNDy6aqaBexvFV6PcnX8y1Rho/RXBIv4lEmstjwVmQOw3rsDGZhauj4WtMFqVyMUrkDLZIC4Gm4kFToxjyjbEPVkNkZX0CIP9rBFKGuJog2KvnDcs+kF83XI8JDeJEx7hkxXaECalkw5Zr/bS6RB55T4f9LLxYZ7WFoVksyk2zkEQByZGo0Bmz5Gjzr/t07nM+ogh8MJBescINSLfTxCvMhzM1OEot92UW9jdeCavqZBQztLaY+Ilm2LfbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/jZOu53mgdWy5n7enkdXKFlgqwlspUgQ81J/HPKvGA=;
 b=mjwR9XsFhFNRkbgHxRkru3l5IYDd1KmqJvhePRKfL7NSXouejf6hpJnyZay0s8TBq0klEe1T/T+zd+DCB/UWKVq/Kq1jMvKrO5gFgpm/Bnlg6KAtGo20ew2LwDnVVzdO5DDDI3UMDokDkXyISIVye9HnVO9kOBue7ZqaUvvwGXY=
Received: from BY5PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:1e0::23)
 by PH0PR10MB5754.namprd10.prod.outlook.com (2603:10b6:510:148::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 00:48:23 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::12) by BY5PR03CA0013.outlook.office365.com
 (2603:10b6:a03:1e0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 00:48:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 00:48:23 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 19:48:22 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6750mLQ61184200;
	Tue, 4 Aug 2026 19:48:22 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
Date: Tue, 4 Aug 2026 19:48:19 -0500
Message-ID: <20260805004821.416613-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805004821.416613-1-jm@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|PH0PR10MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cc2b69-fee0-4b1a-ce35-08def28b4107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|13003099007|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9vN4pkrWbLx6LciNEuXuo5Ms+lDVd+X2gGyKMy1h70LiDVZtX49ec8BTrDdxoXvwyypQCcpdrD4VBfJkpHEN4VA2nbduUjWO56iBVsR1fTuz9Ds6PDgW6MrDCJ8tGwmyqsC9t7imStbWNOpp1nzZ5mg+7iBQPJPrQnJZv78my1N5c1PWjoAuBUROtHTwTqvZiBrxrPcgSbwKRh9i5uE0nwRQQwg77G9eJFX9SiTBjKCv7XhlDD+J0TsDRNSGn0cHL/nyj9qivD8odem1GUofv39hoJBQ58q6QO1MFgq47d9jSDRNdh7DYVOvswK3AL5GxIe2Jvg3hUSNeQHTuS0LjyAU3ZmeGRWCMxlfCrD5ekdv+sTBV+E8wUyZ+60MrSwiqP9o7rAEp7H5+R18OuhjImuiD/7XAiCFnH6XiCz1E1oraeYQv7rfbd5fHwDBiqeRbuYqlO5NSGgZbN3qvgc2J3zCpbWDyJiGtiTPuz6p6JSdqiuMeU1ELUVE/p9TaHM+MVZYgAQ+SEWS6R/59UAV64TTYZ/c8w/rEZhDxhW0+Lj2DdrTPgzECqok0PgIOKcYSHZUG7VSBkZ/mGT6hZDptfZ+Idj5YJS5LDPCjONHy5PDZpZUdANBdfFZqb+C1gvUSuwTiV0lZAc0KLNTTkuA7+kyUPZW2CVAPkz7vUkTHqQ6HKL6rlIgzlpg1GBmkhlPkUXDLU79hcQ0l2lcHjKMTA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aVjQ3QWuf9B5VApVfdEuGKYEG4PQl7z6YMP+oZBqpunFLlgwtA/JnP8cIMPHSg8kCQtpCCWEyEQ606drOn7eOiPFdZ8s9VJxVbVJZT35bk7nA4aEcPTLLh4gKFuM7X0oXkCtUXw9bss5CgNhOMuczYCgLIbp9Aj7oJk2Mw9POm2JmSLjo25cqSkjaGyDKKTcHZ9XXBQqXz1fd+nZZvP00zoOYXwNtKiBziZaY8jCj2EY0l4iAPaVfi7OC8oGjMzhPQlCn+mzPEkrgrCA2dMq8bcTSvQVrdcaYud6P+CsLvUpscgL9F/orvlQTzQOn1SEeYN+FMNsP9FnjKv81fiMsJ9nkK6oX6rZeV59f4wAyz2iYJaIRhCVCCHd5g3hvm3J5K9SfgeYCJQYc2GmGwu0MMyIphukXWjT6Tfwkr9oqKqDPf+ZVEo7Iab5QFu5se0/
X-Exchange-RoutingPolicyChecked: AHncoKmED3PrgFV8Dkp8D9W13U9r55ukvxLB3vliAXj3doDYC3mrq4UDQRQ8vRqGKXHv2rvxjzAOk0VePl0Bzi++CTHMdutLH6p1k7c41vDn58reAmJQ0fE+/QCqYPWEDbxO/0ujOgfQx0W4r5KZ4V1/W1vjWR31H7eSVfyhnBOs06tzgNrGtdPTtHSDgIgBOm24o51G20tWuasV2bwi/kHJ+lgnbN1/XpJOh9oT9uuQcQ699e40dkC6/W7CoKfJsqOdv1oNAfSPmTSjSQIUKibsVR/BQjCyg4H8vT3H1veUtxjTm+iubwBqufwTVuZ+kHwIczik7I8FfaJGQdjhaw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:48:23.7228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cc2b69-fee0-4b1a-ce35-08def28b4107
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5754
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX52zBRrqFEnDe
 hyAgOL3loCOBLoOgDeaAHKIKUS24XpbFYhozdnEjMzO6H3PCBcWAYrC+YH2riWFFZ6xHHL7Dv3N
 E6ZBoVSXp0n5eqnwFsI++qDHmPpAxdArPpF2luIdukC095Zu9LZLJpDzuJvXNVrMkhrVvB63Gru
 +NSWriiElDnYd3RipUxqrBrNB1oUO/1H2WNhY5wRJc+Hak6KBjQTpcTE+Qg++0Jink2VqAT8X8k
 AjHrXQmfm86/gPlRMQdtvC9xHcWpHNAqtzbpz88BtgQP2IJ8lfwxBHq7J3BsfO6JxHyEnejFgu9
 Ztk+SljVYFnge8huKmIZDqhHBcCX8K3HPLW7YOQXTWo5lFZ4sN5Eq806gGTQw+TNHk7fNTskh/C
 ZOdf62RNwNt9uQI+O4mVp/qxni+VOe1z8FTL2XhbTRi4ftPJIAQOfxJeHoM75S9rqjdNgkYF8G/
 sST6igUtgFNMSzIRf+A==
X-Proofpoint-GUID: V1S35459Ea_6dQt1oMBfRK7q-lE6TREb
X-Proofpoint-ORIG-GUID: V1S35459Ea_6dQt1oMBfRK7q-lE6TREb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfXwSo++QPqqeNI
 Su0ucl9vqiKWSTXMyiz0xwJBNH37eD/jZ/zSdu3xFz0yAAFLMu+f10rIYFWFQ/AeruWaoRYULI2
 H7BxDSOqlq7QwfppS5in9yyZ+1bjHXc=
X-Authority-Analysis: v=2.4 cv=Va3H+lp9 c=1 sm=1 tr=0 ts=6a72885c cx=c_pps
 a=M48x8qJemVpu2SzQJjJwbA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=N8RrIdEaZFVbIXh2HqYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_174832_816185_6A246016 
X-CRM114-Status: GOOD (  11.44  )
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

MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
as per datasheet [0]. Set the correct MMC0_CLK address and drop the
unneeded MMC0_CLKLB pin configuration.

[0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes

Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8fc..b04636cab71c7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -328,8 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
-			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.54.0


