Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE84C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF0nARMrbGZPduCsywQXMPkjoUWOoTVLpmoZaFs2qio=; b=dgusxcdEvyIMZWtqs2SUhkmg7u
	s89t/PlD5Rtl8MZIjDLG6sJsSvmdxWM/e3J4h9DWBIpf2iZqtRUlvgUagxmeYTlOEVcA1ANg4SRIq
	wmvQYNZI8Pr8av4/ABNlAIaaUTX07NxBFq713PhizPklnMEs0q9wgdZajfyCy0xqz/JDcZMX9t7YO
	Hrfp0eJccE4bSWCky4c6vw4hwASMMI3WnMw/A95AHz+VdZAWy3f4TeHnZUXRy7HpBco6xYBbfViMW
	oI9jUEgHY6CAPGgOoGlw2ThhwL0ke18H++jSKzkLJOj+7/PWSww2F1m9HH8T1YewzJsYYzPlsDdBd
	LRzTLcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASA-00000008v7o-1Sga;
	Wed, 29 Jul 2026 20:00:34 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARq-00000008v2r-2w6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:19 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ5xdJ3536768;
	Wed, 29 Jul 2026 15:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CF0nARMrbGZPduCsywQXMPkjoUWOoTVLpmoZaFs2q
	io=; b=ZuTwuET2NdwvOBX3J6wW8BUxF+ZW23+aqezfqe8849zOQfOTZXjC65E5e
	ZqSsUJSncfTcgntAinxyrrSx3fZWvqtywxFm+k5aIbzkAqI4ZpKlzz5FIJMqwheY
	PBS8ryYxrNxWDKq37buQwf4kC8sqt11d7LIi/g5BcAgvrYLwC1YAsUU6yb8RwS/H
	arU87Pl+4ykdN03AAaHx/12HavAaVYVdwc0azhKbX6NrTPwf3SK7OUE8rN/y0wF7
	8NWn+5nvaInZIYxmazee39HvfaeGEK/yxIOO+vVxmTK0HN2QI6t7W02MfoVe40og
	iyoqc7CPFM25qRgXDCey0K13K0RXg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqcmrapk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq/Gnhp0faS/0y1EIL/afO09ji5pRHHCPK9sf/qDxSbLtB+uTxXMDFMuv+hPio6X1+7oMH8I8uVwBRn3ElgJxgEiSkjDfog+3HInhCjulrOvu8r8fJsvZg1eo0awZnGzUy7RUUti6AfgcN2v/nhajL9NsSmvKGpn0TTwvg8srEeY8FWtI/RMvvSJBBQD59tZNNBsyMOVGJ051DEVKQHhSGrupVLL5+hLKbA+qwO80z3KyZPS23wuq/vl0fjtGNmOUZD9XKciJvUSg1skVuevpyYq4Wuh8587Z4sg3IfPt+3WYmI0T+ZiuPXUxPU6A1ecni09/Y3vHPDJeZ5b4+Cb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF0nARMrbGZPduCsywQXMPkjoUWOoTVLpmoZaFs2qio=;
 b=reBl98oFu2myHOf5CkeYbDXv2fRtxFwBDLisw7/CFCZmQWZRgFlW41eAzB+QksyiiIULVm3YIONjETPIOIBqBf6oEvhN6v8+1cTd0caK7bg4TSkT92mOBDuFugeegNmJuE6XN15zpKetdQxfO+XNY5qfPWJsSn3SRbRbmpBe9bSx8UUk2Iktx3QaFeC6YYV2tkWz0TT2QLacdP1kxSHiw2D6x/MiZTbGOaIA23CmxL36z5diw7fQdMM2+J2oBhYWDGmls7U+eBp31MXLixLQ2+wF+ZkEO6+wCwuAUwP6lnDHhebxrF248jKBX0kUXbX3sJoodVcEzejXQIJWVfmLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF0nARMrbGZPduCsywQXMPkjoUWOoTVLpmoZaFs2qio=;
 b=fYlkJRi0KAa0Fr/4vgE9FR134agCeN/qeX7ANAgWMajKAxzQaKI5Wo5ORDuyZByt6UVnfZgZSmeccVrGRZIRaNrbEk1ufFnSp5PKG2j5jh2yta1N09P6+uLX7C/kTP4gisAwKze0n7AOmJw0Ln7qQmujpY5PIx4tnIdH0BfRhz8=
Received: from MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::15)
 by PH3PPFDB63D4CC3.namprd10.prod.outlook.com (2603:10b6:518:1::7cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 20:00:07 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:303:80:cafe::9d) by MW4P223CA0010.outlook.office365.com
 (2603:10b6:303:80::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 20:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Wed, 29 Jul 2026 20:00:04 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwft1923570;
	Wed, 29 Jul 2026 14:59:59 -0500
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
Subject: [PATCH 2/8] arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
Date: Wed, 29 Jul 2026 14:59:52 -0500
Message-ID: <20260729195958.671147-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|PH3PPFDB63D4CC3:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e38928c-4dfb-405e-6c32-08deedabfb68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|22082099003|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: Ro/rRQbCYIW6EsPZ8LanBZpfiFMYmSA9fUm/mkPLDYprmvvRJKZeZbn/Wjov6Uj5JgLMYKTTsjSGX4TMiqN5q5g23TkOHzRKWqnHvvZwoZ1Xa1i+OiBADA3b0PYAXZ+2aBejo/QD2sbVoha750w207PFqRcjjmL28D+2XlAWu174ODfqE0T5gLtqakFZVFV3EMS3J6ebYdA5/90A9nIecB0uAHCzORbmQnbTdZiiD8Qrfh8WFV+3GM1dKPMn55wYRUfoioI/w+Rft59b2SdUGhqZ3pRcHeI15VJYC/nscxvbuYkpez+viWAwUzPFXonlDPJZbHJKJyZnH26XioV9SD59CavKlvhtk4DJrctSfjgeGcBR3tPvF5stZeVDGQOTKhcp5eTRMcSkOVCjTeFsRR6eqMQhQoxvWCGOfAcUBWcU2gq4KoI8SiLawtn3mkw60t9V8cxvpaCjvRfqAY95Kq9gg2AvhxRF9h4n4X77jMaxti7eWms+GdXg2bFGvYAnV3FoIBRWaaqs2zIHp1H9Mq1V/fqqDAhOcjwr9Wto/le6m7ctm5d9VuXsVD8Yq+udQPShKqI23rDoqfPheBdUnuAjahIBvc6pWLIppoPbmZYY74XChZLDbqFEudd79XLpjp5XcyyTvAPEM3omCDdS7Muq1xty0Tz0tKR/jzR71uSyWjIz5jVS0IIb2iH6yVTIR+xYvEPHoYZCe4J2GFBK8g==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mCNbzLysC8yEQTnY8KnqQQuBgNaU0GW8xZLyE0zpvMOx4G01ys0GMNzcOB/jadcn1eScuVfi1zW/5bAEUuMvobvGD8KBO9FAPqUQ83l1M2ENsQaw/FuQquI/QaTEjzoiwhFu4EE3TF//WkIlqtN6fhGopSPZCywmRbtO3uq6zpjO7yTjsxgEhOBh7QT3t28GwX+2zXrAX+zNJuvXKkqTzn3Dh7SRbrHj4Sss+QwjhwysBu8bpMLPzPyVsgZoFODNwgdllWvApNXxXxV9biOZa7K3wced4krySZeIiN3Ob/dKje69GNoZr9DshUsgq4INlqDJtNjamE9hqF1ZIYhPt7D3Zn0dn1jtpIPMc/tvym3ayZn3suM0K74ZUOeNjBKceWrP7YoLvTLynarV/g4oe9rW3o/EHOVV9wFcdrOf63y/rDhE1E6WJNmqunQnmeh+
X-Exchange-RoutingPolicyChecked: k38Q/nLbCtBNF+L7MInuebibcEQD5hZqflzZfdN2/V3Kb4VC3O+y9pnn15WjS7JUC2oB57tQZPzsz6F5Jn+6vih8Nn6soK0TikKf+OZO5+v2BBusjKokCztib5UurWrxhBG7ys6+sMcW1Jx66F94665/aS1z5J3w7Lm9Z6WARjFa7I4nrG0ugLvcXXNmJn103Ke1qK63rGbdFYTf7jWuz1xXYw7IzPZwLEDeWsrbPL5ix1PEDbCm03dfuBwZ/UohwyJxJvzVQ6sHRgaA1I46hJVpmr8SrfeRErYHd92LTPS9ZPlgLQp/Ox+ji6M66a7eUodpsbKIzss1LYsfscGveg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:04.4935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e38928c-4dfb-405e-6c32-08deedabfb68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDB63D4CC3
X-Proofpoint-ORIG-GUID: MNv75rV0U2tXAxv0r--Q8UT54_dCGJmx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX8IrF7Jl6ND8J
 aG+qO3xVLWpe+uD0QISXGBgjTkOULEqYdXVFKkDPlW/lH2fzWndlecSGpaw3OUJAWt4qIUNSVI4
 Vbw1iI+Rkh4psz3gy2i1392UeUcvJXA=
X-Authority-Analysis: v=2.4 cv=UtZT8ewB c=1 sm=1 tr=0 ts=6a6a5bcb cx=c_pps
 a=MYJxclL+TLfs1lE1Gew55Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=7hcFKwaUi2NZJbDi7I8A:9
X-Proofpoint-GUID: MNv75rV0U2tXAxv0r--Q8UT54_dCGJmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX2/PsqM0FmkYg
 ioNs74GVtYp7Mko9wPTeOi9cqjx9l4z6jfuijeyyWYKn/A9jl/njvPsvftbRRYXXIjCqASBg4Ni
 5hw/vSrwOKRgJed4kzoAjpSk2VboMzw9i9uxOoqL2iksaUe0I3czSkvqPmvQ3EI5RrINNNGdkb2
 NW/VoWakqhxceA09CPZm3xt+JEd3ur/MTB6eUMWD0x2hGENfU3B/8I8oZaOSg2LiAgtnoIfOy30
 s3V2IayL1gqq2nC0IW+tUbrB0bj+VFvPt1M64vb5mAyRBL0qBxVaE1Qe9OVlMA2qcrez1vaNp7v
 5NsICWMpPgYn9a/i4rxqU7WOMcO2KqHzwtm2FTYEHDuSoYHAF6l5zvqZTlE5ufEYef62IV6J6XM
 rfIiuI3oSUOv4Kyy3IdetxNp7jyzXwGVm8eRBFhZX9HJyhCG5+n0YPWfed1ivbY0owt3GEw6hce
 fMl1TTZVkcLMWiA0Z3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130018_223399_27404DB6 
X-CRM114-Status: GOOD (  12.32  )
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

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 826fff38cfb77..9b120cd9b0c37 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -324,7 +324,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
@@ -340,7 +340,7 @@ AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62AX_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
-- 
2.54.0


