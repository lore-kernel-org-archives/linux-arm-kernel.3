Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3azQ3cROPGjXpBz2bR1DBzNe5iTvKYhbzZ5cw9r9JNo=; b=NaG1kG+fUuPmDPDUQ47Bd2DaKg
	KmoiF+DwKAsvpXiVw/1bLiuQx5UeuwuzfZ8UU3PueU0qT3sL65I212lDi3xmXYI5e9e3EcljBD2q3
	F6LyXaKb9SLH7U5guhphWKEwCx/AM47q2f3K1t/hWQPCcI/WgbzogjFpG7Kd8poEksTH93ezRb5Yr
	du+J0KiVkX+1j2H8TDgpNe4qGCnCabvV5s3vIzNwOldADAv9GpNQ1gSdvl20qeC/B7OJtNmIfb6Kl
	ReYBsLwzTFYZmYrtmp+r9Aj2qhF6V95KFAqBeW3QkWAwC8FHS6Ua+YA/f6CyzvWO2EgtrtF0I16PR
	seObs6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYko-0000000HByz-1JRv;
	Tue, 30 Jun 2026 13:43:58 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYkg-0000000HBvt-3xnO;
	Tue, 30 Jun 2026 13:43:52 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UBCNWF401219;
	Tue, 30 Jun 2026 08:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3azQ3cROPGjXpBz2bR1DBzNe5iTvKYhbzZ5cw9r9J
	No=; b=XR5gFC0YTd+pQsYBJFnVSgAxCmRKMFLO3lCiq2UcX1G0daMIBfQ+9gZ8p
	dn/Q9ReLaBTGF9Bcpml8PE2TL/rHLvFfDidQ2ekkoNr1a/SMlA7YkFI2hqVrbQnH
	2c9kYLas0M9K+zQJvTYitup7QO+hn34RSUqgrfnWZO6uxIZfSl6s5rllub65n3sd
	W52Dj9TR2L2HU58dNuH86UtQfV5GGUIKtVC4TUiEVEBeniDfhV280l/6QdnM+B2x
	OQB7b7pUts/wowvqyllrm03FiFqnTfJ/8dKXi3lxVpSrAePm1ERN9lab4f3Ka6qg
	wfHkI/u7z6Or+fJ+KVqYMPfGU3t1Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqj8tw9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 08:43:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puhNgMxbt6GOxIc8UTFz9IVf16cI2kp9E/n33JN/t38BeYg/gdPpI6PW3So65rA5S3et1V1RJUJ2N7SM/jpcgD4aAoAFJuC+OyWGtuyraieW0NDrNX+DKhZ1fEM/HG3hV1PTAoGrAIj+/WeFiAIKHT7xnOzLJGnw4efDj79KbdHQ/lrluIKozRx2yndiF6gu1Ud74g9vFgj+MGSW9QojuYcE33hT3T8hC+ynOWMvH6B7ojpK8AIzOiq0VD9yfWvZFMt1AvsbZ3Y8K+nXGo91jlWhO3fWY78x/Hw5MiBWS5iv57SzFxp0D5UneAPfTAW1iieMhC0j+EhhIviFredvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3azQ3cROPGjXpBz2bR1DBzNe5iTvKYhbzZ5cw9r9JNo=;
 b=smR977E6CIYWOTDWVLnX1yGnhC8k2Pi75X7NWR+cVmxP2qTVsdQKl73u8HUWPzjFgKitjiFyCeEtSI+SmedsgKwl2PJNDNexfVBgqki7bh2j8eS8HpRmEfqjBalOiT2MXnu7N9oeQMpko0Vmjc3ci3XKCyOThJevLO5cjDdj47vNurEJBhaJCak753ra2hGUWiSkBQgg86w7l7/AfQxnsEjdqGUdKmROljf4e4/5UxGxqyROXJQTQk0Pif+226Cornc/NuA2+corNKrFarierNBSVOTO//mReRsjJl/z12i3IhPZeC2AOzf2G2uMpJrhL9AcIqUI55K7frAx4jahlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3azQ3cROPGjXpBz2bR1DBzNe5iTvKYhbzZ5cw9r9JNo=;
 b=AJfKJ74rfnOXhRkOV0Qr9U3viLsjZ4sWrZoCi9pzu4KdyQpQQrza8/AmrppNI+DDZv53B+3srSqMzaHSooLB9I9Xl2x2TGKciWciwV9yi76BmHcKbhIaRQyGScIOia9eS/ZDE1PkGOowvPpTJtMB+Oy+JSFu4YlpcOVLm9ErktI=
Received: from SJ0PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:33f::12)
 by IA3PR10MB8640.namprd10.prod.outlook.com (2603:10b6:208:583::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:43:39 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::44) by SJ0PR05CA0037.outlook.office365.com
 (2603:10b6:a03:33f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 13:43:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:43:38 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:43:37 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:43:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 08:43:37 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UDhOMb2614781;
	Tue, 30 Jun 2026 08:43:33 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>
Subject: [PATCH v3 net-next 2/2] dt-bindings: phy: cadence-torrent: Update property values to support 3 clocks
Date: Tue, 30 Jun 2026 19:13:24 +0530
Message-ID: <20260630134324.61085-3-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630134324.61085-1-g-praveen@ti.com>
References: <20260630134324.61085-1-g-praveen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|IA3PR10MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 990e9896-ebde-4050-e34f-08ded6ad96d6
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|36860700016|1800799024|921020|22082099003|3023799007|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: VROWnFdV9UsNNp2V/dFrKKR0O1U/XHKiS/qudGCFFGiIcB9YN3H0bh7Sp5DzbcC1QpUMForS+Qv8SEd48dDu+9rXQNqO6icgsezdOAunR7FumPbP1nY0NiGligkiDQLFsbCnT5eUygtI6cU9h6nxtOBdMd7Lg1QxSjQ6Da/Qp7tEJJ/WB/OGhQDIVEDgDySrfSHm57zbdLFFKIgfePMLVBh0ECP5w6zG+RH5ABEuxFYx26VInsNHtPs3atyiywVAG9uSbTLyP838JNoIAVEPHD9vothgZmuO+UId2IKo1AG8q08JsRxP/t9tFinO/C4fFfSo2T/A0MJWAUyTMdUGqZunaZJYAX2fJTNA4tc9abjQJOT21scIaip5bL1Gc9JPCR2Y4lakdMh/a7s8Gh9WJ5JgY+duQw245Piv4gt22LZnG0qK1dFJKXGyD237+jXjnSO4iMUeNqqE/J7oBEvVvsFcLCBsrw6MftuzaE9Odrf6OT3QE7vM+PLxEeoNAmX17lLlzfNKVzqHsPAFF6MYC1QOevMbqekwj59W1PRPCgg+y3xRQQF9wFmbYYccRwdBBmjMuYTGy0zvaEnsIyl41+5IvMEOpaXdq8pNCQFFSXwJnX6uZT48n12WVv2NsHFux1PTct7ft3MrRd14ZHKjXADkW0AJd7rLYvziCvR+UTDnslit8vC9tCNGU9eRdjGTNNxDk7xjgdtOqQa4CnYjQRogNsTJfeNYK/lNH5rlFbGtvLZ/VhsBfUkrW4lcAGpO
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(36860700016)(1800799024)(921020)(22082099003)(3023799007)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bRpiiDYtgoH71FxhLRRIdqNb3hdNqSH/7PCRyoROXmr4L5D1m1Zg827eBkvFM25rfVT/CFD6mp6Kh449qDCrWcK/CcoYX+EYuvkFYrNr9OXE2zD7g9eWXeqOmWS06+22QE8bc3hVrrfs6sAt/lByPSp+Lut/Hl/x4g5cfbC3z04R8617cxPQ0BhxsqzfG0MjgIZicaDiGt5/uOsJp7fWjyHjqA/iwZb6oPoyVRzwGn1jKsS/OBRd0XT9MlE7BOGJ0mwwRg5j36SU+ibOibVMF4T/R5Sbe0ao0UJd0Mt5P0HfkZooTm78xnpJZejlELVIFvrv+eJHyoSt3/S28osEdxRf7LYHKJhgNDYeoo9hWtZznYSmuhBrXo8KA8yXL58IlbmA5EiwfpEZsF1GN403X2xNF1hwIVf8czZm/bBP5u2HbU+a/TrPkq3IbN/FP6UY
X-Exchange-RoutingPolicyChecked: B6IG/OjQ8Rt/qMgAAu7+Wn4w7YPsLW6bzC+uGYLdhxvaXxuModBo8SYvuFZQP1F+5F8YB3CPbSAwi3dWWpuynC8/8v8QkxWm3MszB7TOd8tE8e96lU5XOK9OD9Pb8sCF5u5sBDV7QUCgcU4BQTsn38CVwOi2ZtysuNpI20/PrcjKxDp4Ip74je0CAl/E/2FzIsc7ZVZrU3Jmrus3XdOhDFDjITm6GTYfRYr7vZhMZslxoKBMCL/YpxnsIFsJdjgoHQMOQUGKvA0muOLcvUlpi0Vbd2F1PB0fy3WmIbLZy6g6cVGo9TATs12uNuej9DYjiqGL83dz+Pu/FHqyxF+uqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:43:38.0146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990e9896-ebde-4050-e34f-08ded6ad96d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8640
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyOCBTYWx0ZWRfX62vyou2hkvnZ
 Wtu5mwPrDtIU+E4ff1Eu1ZvBJBFAWEk3GDezxAJjUJsyQzJmByKEeThQl1uUR/dY1qqw32cyyeB
 DZn9ASfQ/bhnAkayXlW3QuKdQRgb12stjjMazI7zxL7FXEr01l/+qjbgjqRpRNrIBZpopUlDCW7
 O4S9Cj0veKhYwhR6TOBwiloa0+nFT+L2PJbS7t4LGA/SFp7jfpie7L/hQMZgFGrIIXKO4nbhgrX
 IBjDLAmKUgjWef5L1bmKVoYlsAZshCsv91FRYTG5tqA/bDG1keH2bapbB//YhkyPefl6w337lHW
 dM6oKK4X4pcJvdg5JPIw4pPMyYiK62/UTjkEVOOVwTpsxGw4AJXMvtPpPuOeNdLh7mhhPQAElDl
 V0i2EahvTIEbGTogYiGsQgPo6Szr0u/couZkWllDsl7wSL48HKYhJK4oZMC9zJV7dj70M4gUtuH
 TgQGBsa0KlRyR13vFOg==
X-Proofpoint-GUID: RYmx3qngWDLzwGLT7-Mxqt9jTVV-xV0c
X-Proofpoint-ORIG-GUID: RYmx3qngWDLzwGLT7-Mxqt9jTVV-xV0c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyOCBTYWx0ZWRfX0CvRFVJL5dPH
 AINq30WhkrCKLh32ylQJ/RBke87bUROBcmMjYBiZpK7GNqxIggDgi16UR60RgCVatmReZ3CcDC/
 r1RASqnqmJxiE5G6oyUwH/FilUFW0dw=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a43c813 cx=c_pps
 a=sI2t2Ij5wXDMAk54xGiwVg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=uSPA2Th2IVTVKQU8YO4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_064350_993496_19BD16A0 
X-CRM114-Status: GOOD (  10.71  )
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
and phy_en_refclk(optional))

Update the "clock-names" property as well with the 3 clocks.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 .../devicetree/bindings/phy/phy-cadence-torrent.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 9af39b33646a..54fe78da297a 100644
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
@@ -47,7 +47,7 @@ properties:
     minItems: 1
     items:
       - const: refclk
-      - enum: [ pll1_refclk, phy_en_refclk ]
+      - enum: [refclk, pll1_refclk, phy_en_refclk ]
 
   reg:
     minItems: 1
-- 
2.34.1


