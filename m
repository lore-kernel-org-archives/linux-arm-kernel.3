Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EC8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5is8=; b=wygTdw4EgrMteBJvtEr5wN+UC7
	S6eEMVLKN8wD4FXbhFLxbZr8D68fdRWykZQmF/OzjnKyDl5UTsxCfGOxVI/RkDO2zzCzMzhmFM3p5
	KEA/xTo4qMpqLm0RUogaoYjSnwMyVTBo81DiP3UAbwHHoi2R+TVlkqaw0+9JwzcNbaQ3snxr4ViBm
	C6C1HRslDsjQQn/g0OM7WPtulaaxEGVJW4wg1EKeRjyIFlKcw0xRb0Q0J9gzUEvihPuGb4cQLskSm
	Xn7U/2QcBKJvdYQaT3kHmnaDm2RwlSLPmQ6PMsdm6NSeqF78Esu2Bw+AJBD3igvADegQwg5Uiezsl
	Ow82HFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevtD-00000002Hog-2j8f;
	Wed, 01 Jul 2026 14:26:11 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevtA-00000002Hm4-2Y3L;
	Wed, 01 Jul 2026 14:26:09 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 661BWTeb3240543;
	Wed, 1 Jul 2026 09:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5i
	s8=; b=nUeklTUfJmL3d/dK8P/ULMFYgmI/aCnPUjzqK+VhPtN2PK5jogHm8NCfd
	C592AyqSb4G5tXEcL/GdrJda5hvVdN1u3fTVCly83w189le7Wb0cZ6tiIgowhhMY
	CtlajuaVO/esIguqcBfpW+7ZnfQhXghUt5emJI5M1/7cLzMuOtWggG4KDnrmpkpq
	+3RyUw7yCvPY9e7gjPbWHvi4N/pIeP/8UG36TC5xAZEhUSaPz34YfASd5QTeTu2E
	hD4IuzJa2c3YiyFT3QQaA5eP45lVP6OsN6dQvPrNZqIzrfVYzZgsJyWRP2xCSmyn
	aEaGL8+/nbmjaPC4qTtA/AEWY/oeA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240s4kw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 09:26:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebp/73xwHguMVzWyFkKeepLBeOWXSB/U5ar3d6SRj1FNxbG2ZbxzMW9ji5AGlrTPWuKMRgVP0ReUuZHTyhKtUJGAXWx9UePZQpXC3Wg3slOuDcBlVmgd/PrzDZhYNYdf6aiCFNoUOU4vZFo7AFeLYlLhcVeT8H2Y/tmAfuRWWvw+sFE2dcgiIaxbKuwIzZAe3CfXEf4U4KQWozVeL0ELASqSltizShn5Y7A+Eozx39rSElr9yXQaQuIndKWBRcsVZRV9uQVUxv53uOJN8ZuxkUw1z4ArPvLsYSeKE1n/r2H7iQYjk+u70o4cTtu/xXrN4PV9JrHfC10+WahKHXkd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5is8=;
 b=TBhytOxevAsPR/Hbm4ZM2hwkw/v4P3X2UlHVQeSjYU7kO4thMFdHu6bOp4eGuOs887TT62cOEWBZD57hdQ7l2sAW0viT3Tf59fIUSWnIADtTmDVGWjv/qU9dxnoP0DETxuu5kfhdbSldlT+1yf1mq9xyb/WMprHYY3QBnDKdMHMktugDkeWGIJxyfN7qHy+1d6sAUUeJ+7ZEWTGmGiKMbsLo0jjldWxGSyIsOoOYgGXWxQZI0Jz0oTr8m95Yr55h76dAEua0anbaWIrgD/sgX31f06Iw6NYIydL4ILzPsil41FILxBaPdQ50xi0lpV0gpqx9e5pH7m8ko3Bbr5gEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5is8=;
 b=KUQ3eE96fMWH6RG3d0V6uvCcLFwSIkUGWDuZpw9NgPb7/wOGikYp172A2SNeKkMBt0W/yQNtF2jsJLJgDEPJ6r2V6CjxLQUIq0Aof1hCEQckrjqkStkDmkibQtprL2faUD5EyntYfUSep+zMyb7QtwWbfXysyAllLU8FbyXhh64=
Received: from PH7P220CA0148.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::16)
 by DM4PR10MB7452.namprd10.prod.outlook.com (2603:10b6:8:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:25:59 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::37) by PH7P220CA0148.outlook.office365.com
 (2603:10b6:510:327::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 14:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 14:25:55 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 09:25:11 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 09:25:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 09:25:11 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661EOvlY1000238;
	Wed, 1 Jul 2026 09:25:07 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
Subject: [PATCH v4 net-next 2/2] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
Date: Wed, 1 Jul 2026 19:54:57 +0530
Message-ID: <20260701142457.81874-3-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701142457.81874-1-g-praveen@ti.com>
References: <20260701142457.81874-1-g-praveen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM4PR10MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: b8769efe-5998-4ff8-158d-08ded77ca9df
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|23010399003|1800799024|6133799003|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: saiS5JK1tgGqQ5X9Gux9NtnzKzVGxMVmGRXJYpuOwZ6LPoif6IlBRPz6fiRNCSsrBWyzPgi5kdcAzmvDn0AMSkZ4evV5CM0uhbqp/9EnVl8wDUJWpiyOs9GhJq68NIwjya6AaR4l8ROREdPqdKTdiHwVWRoIItsPoWn9bJfGHOqvd0P5/RkZeN8s33BL2at4wjd2alTm3NBnzARNMifygTosTb0YkvP7Kgf2yQgw3Uy7yIXqdFGszRcWgDzAMfDWudAHhb55ypav3bz16dz7aLgYIZX3b4mPLgbJigqp4KYOvuBuKPoPnJmlnmjW1PGrUqx8nDBR0R8NTjNad5p0UcZYHkkiQsdCBjhR8/0HIEzYXYTpwNZB/o4eXhzSkeg3pgTz3MUNsFJJBdNnpCJJosH8/3pK80zezDZKc57yfCVyua9hdodEhEV515+LxCph4wNiP+AWn7x3oogFR7HfxcJn3Snxr0a1ya5Gy1RjCNfj5hO1rSwDbFNCaNuU7xJozBjTXij9YgDz17lFjJkX5lv8lAO3dB44Yqy50bQ8N3UK74qU8d+/mTVx380Tx6seC7Wn7/3XrkkZfBG6TrQLBsnaBF7ArQ/uCORG0tOg4GvZQXaWo/839Eh72FyCEsDyLW/evgmytJ5nqYBJ157GT76WPpXznFEjVilAu2xI7ynmilg57eKcPt1CzZg23fgvI7PaJsCQ6CtkpmHo9xpSOueqWakckZMW8bfNttt/pD6P+09ZI0bQxbCB3QULDAaq
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(23010399003)(1800799024)(6133799003)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /IEObNlpGOsohuKxUm+r8vv4pVbfRgi5AYOtZkCwR/dplXwOWd3bXFm/KAJCeChirSUEeQp0Z5SM5DiRLkgWi2ccu79QAl6Btj03FSvq3qL8I8bSw3+Fv9AtR8oEEDVQtfq7fU+CDE/EUCFwJ8JNYbZNL9fygfby0mwP6ZRf6k850v3BUiEJtN1K+bdAkhUxKIglZcENbzSTwP2uqQfSwLpKglGYVfpXl54keciWXdhqbBmK6+ADd9Z4l8xEjBQi8d5afKQb5sWwrSBogW3fpLzEnWWSY8p6PDh+9d3BbgYJQ/3jbETS58i0Qf4KuzsPf9xEOSkqnsAmwpjyWiH0oE5xtvB+LtpNp826oNJ9rebda7NCIvzzFC6AT2rH/9QN5kVB51lN10id+oCeOaTAYJN0II9GNOBv/UE9rlazjMkTQH5iUIB8NCBymQWhvdt5
X-Exchange-RoutingPolicyChecked: CpXlkEctrBPXYMDFpqjTD5Dcx72WsbkG/DHLzAd3dlTSXOWRevoZCFwyjNMhWTNUtX5RGuK29Rshg4thjDSgL1WxPRl3I8D1a3RTmdQ16DyS+6YB5gH/hoF4cCOh9Gu39dzSAW4Hd/oEtQpQFZjPKshzm1+QG0jLnJBB+RQjCakZga9bbA31EDOQI7MZMBcr+vgBuzRvqcVciz0xKr/tkJjOeelpjfRYtJj0mxi5+xNsWfxWbbicoCSWGUfzLwnRGByP5k6BOCWjNa7e9uMByWzQ4/oQp9MYVusvH0Jmb6rFh/EikOQerBuFm2M36YMuO4L4UO+4qD4f9l2+g5/W4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:25:55.8177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8769efe-5998-4ff8-158d-08ded77ca9df
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7452
X-Proofpoint-GUID: gj7-tseAbApC09B9xPiiOdaCe4eBm7Eg
X-Proofpoint-ORIG-GUID: gj7-tseAbApC09B9xPiiOdaCe4eBm7Eg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MiBTYWx0ZWRfX312uL3lwI//0
 2CtgCoWyWQeRelu4lkARIIl/CYi6BHykkcd32c4cUV1xRg75O2w7KMrUxAz7ubaJOrtobTxBN5B
 WQqQVQb4lPTesO25RkFdYeZ80HssoKs=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a45237d cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=LJxii-BNQLeJb2iqeE8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MiBTYWx0ZWRfX9gl6vFg13LZw
 clII0EtQi2Hibl/yIlpgJ3r0zhFXpsni2g+s8UBSsUmCRXW3zxXgO8ym6x7ah77Yn2xdo3n3mAE
 qbokWqL1pzF4P3eNjWcPY2jRWSe4QMe4/mXnoCuSUQoO1LdY/IoG3sSi1H4LPxiNAVY+frLXzvj
 uwfIkONiSFaLU6Q+kMrR9F2XXpvmZHxACAwgpUPDu7YeSnUbFbfghg60r03q7DfPiDPKlc7xhhO
 00+idPNs6QZIpleuBNUjIyoH+42k8cRn/Ct2MVSQhJhQKFod6QK0zusmqKOmDMPf9LJ3Gl3uP4b
 W2vu+APJFPbelCncYZxf3eH94WwEQ5nZxmCRPiyKYJ7/PCwL2HqVR4Cug1XgANnNVLiyKtAGswW
 BVsRphJ1IvnliM/vvkxmge2tcPXpCLpcUberuayPHSWWXcSV1fLnf54kDwcMKA4FlyeIbvUveYp
 PH+qs57hC6rHq4TTueg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_072608_662858_9431B659 
X-CRM114-Status: GOOD (  10.81  )
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

Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES0,
SERDES1,SERDES2 and SERDES4 node as "assigned clocks" parameter has PLL1
and serdes multilink configuration fails without PLL1.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 ++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi               | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18..e5224bd7f538 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -1149,8 +1149,9 @@ serdes0: serdes@5060000 {
 			resets = <&serdes_wiz0 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;
@@ -1186,8 +1187,9 @@ serdes1: serdes@5070000 {
 			resets = <&serdes_wiz1 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz1 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz1 TI_WIZ_REFCLK_DIG>;
@@ -1229,8 +1231,9 @@ serdes4: serdes@5050000 {
 			resets = <&serdes_wiz4 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz4 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..53109e2fe527 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
 			resets = <&serdes_wiz2 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
-- 
2.34.1


