Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58337606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fgH3d6Ih;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=WsmIwkmq;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=jWSGuscT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNl0KM0cuvpOQHCB5GJpMylSIRgTPP3f/yswg87ZV0E=; b=fgH3d6Ihilgst5UQyx0O+kfjw8
	gwQ4OHygZ5PA+cBgrL4Wty4kxAS9FOtcrbzjXHVyFPyRs2jTvaICYH0R8VO42ff5onDFQjktKJPFo
	wrCECb7XD2pU5sUvDoI+B+gYx07VAWvvOfYiM+q1pCW0OdFAJyVG8gkVjFbpEdF+Y8Qay/c0d8ZEz
	rgI+iWx38/vybI2yCcnAXIuwHZLhxy20EL8VBPbFncy0bqOWif7UDUDmaovBXDVrZuFzDqIhppr6/
	9YdZxEZEICJkqaYOlGekz3VE8yC2w8p2hzVbbcyXzIYxlZ2vPS8OIWsuv8IjkOmlTDKLNZnm0kEaS
	7PsCBIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZmm-0000000CW2Y-2JrT;
	Wed, 21 Oct 2026 17:07:32 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZmk-0000000CW1s-1k42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:07:31 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LFrXOe1878870;
	Wed, 21 Oct 2026 12:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VNl0KM0cuvpOQHCB5GJpMylSIRgTPP3f/yswg87ZV
	0E=; b=WsmIwkmqVuKvlu2rzpnubqiTKRyZUK2aWxMCdNVgtaUgvvFSxwbvdk4W2
	ClzPobbKBKTrJ78b7XObNnFuTGSgmA8ql8Pb1xLv3tfgTpr0V2V8udgN5MB5n/57
	uoJNG4Zx7Z/yeYE28aal6/YTjC33L3wM0Yd3aMR6j+/aCJajj0Sm6UvzzXwJchH6
	hYxF6vipTw3ifRKgC89LbGegHCEs9lNFYHDIjbdLn/qEyXrR8GtsTbYmUtYyc6nb
	16Rj/9hY/KJ9tHf+5c/kTsPzGEQubFPNuniauO5yH4kJDDTHhTjNXVsggtp1TQPt
	wM5NJzHtbB0EJyuRHBuIVPMerHExg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hev9yt1vt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 12:07:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9PVT7s1wXEWsQ/FyCwUUFiU/KW2Qu0Ixhzd5IEMEU8TSNz/3fjXaqNTZRW0g6thBjkVaUrnH7Kqpx3xZUbdAnu1jxo9GeJ4YOZI81FcLRC9QIZQlQulA+c3pnvriLlSbDkS/tefxseiSTdde6T4ndZhUxPIwSWs3WR0xiXHKacJY3QIXE8S4oBBghOihDVEiiEkSaIdCNDoOvNtrzex0ZPSxoQc2dQsuc+qOtbR3R2ZXmPIOsVMkEH7JSw01sVx/TVgylBdIzrt3sAGo9aNm8xqB5T/0s+3tnYLiejg4cqYlZJxazO76AG5jVTBnvEnrOHVBIocGksBxviEu2T0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNl0KM0cuvpOQHCB5GJpMylSIRgTPP3f/yswg87ZV0E=;
 b=yV5NBnP25Vu/MNSD4A2olLrF2CNViOoPmAg3RNJTVxePgauQlcco20uAvbehBbMHt1LnGIMo7Q/BzIRwNRJYZSdvRkPUufjpjyk2H38xV3uHKWjyz0bGDn8NZfFUZlvb7Gxx+4BksWn0e0NP3Or6ngbCtI2CofeTN7E2BWrDxK9k0mLrBFbuT0/+qhQnPnmEA3VyTcNFBwBXvXmZbmnbMM0+M9v4RbM2xbUfHsNTrVXFbgn/35ZxWNaZPRi7+hHvLCsfVlcX5fhFUSXCidwZ/64jlX9sau9QTLZ+RrVpqP1LcjSKyUg8cGFrqQinmpFs5yxH/rpNOuPjyxUR8x4MiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNl0KM0cuvpOQHCB5GJpMylSIRgTPP3f/yswg87ZV0E=;
 b=jWSGuscTseOKrIC0iYDJ7yE26l0b86TkGi42bBkrj/hjc2UbIPbA3763yQZavTI+2byLtVxQreeCRIU1dOuSaeZcEhbU8V/vq0T6x61x4pLC9EH9kKQqzAiY3+P9G91VUKVkkO0WWauiIkA55MdfuSVy8WsBtQyOyjanOHnjPQA=
Received: from DS7P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::33) by
 DS0PR10MB6726.namprd10.prod.outlook.com (2603:10b6:8:139::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.12; Wed, 21 Oct 2026 17:07:10 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:8:223:cafe::9d) by DS7P220CA0039.outlook.office365.com
 (2603:10b6:8:223::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 17:07:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 17:07:08 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 12:06:44 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 12:06:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 12:06:44 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LH6ddf3005964;
	Wed, 21 Oct 2026 12:06:40 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v12 13/20] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20261007102936.2402427-14-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-14-s-adivi@ti.com>
Date: Wed, 21 Oct 2026 22:36:31 +0530
Message-ID: <179260239138.2416099.10337060549635969974.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|DS0PR10MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: a6698079-a255-496a-7f2f-08df2f95bd83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|7416014|23010399003|82310400026|56012099006|4143699003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: 90gxHGbI04k1Hq4Tw/XfDXDQX1QJezkXAJWZAg3AOiXXgPODNRhPJTwNconWaRuyJ0afsDx2AlMKSn0M4H4w6a1PYWkzmeSGXF679WxTj189iEOHORGZZStyP1jXUliDg8tVmUH8KkKgR7htN3HERtNwFGPmFAbPkqQpjKQ7+4yy8/MRKjs4c5JEb7Thno8JWKJaHnZJr0WlnpotnFL1NvrJSgOWep9H3bdSXIfsclwlRmMuGpaTdl23OjM/YkTixPOYHfjXDg18zm2q0p1+INZ48DHvvf+i+afEeytjEvFKmxCfXho+W6z1Gg/N0e23PQ3ia8ZO1Nl9dQPwclSFpOUBKHDL6LKZPmxE0bHXELmuG0cJOf4DcSY7UbbJoKmwQ3qrp9dD00lxPL/7zHZO2nVZ3CMhQ2gBYOSh9pa6LHITLgfUd6tv5rK8iMnjXRQLxaDcvAh9b8l55c7/0A4PjmNuyeAsBT7FREAPCEz5WvR+vLg3VRrix/AE89bKgNShBsgAWOSQVQ6yknBAOEa6NiTZxyqf5fWNBZqEBJ8tQqYqs8RAT88+XOTAZaeXaBjBuQDR6YQx95SVHXRSG2+HLBnLc25IM2sQQAa0A9RFa5rWQJv3bOVjIWKGWzDchjvuZtKm+PEncQ9cZjYlp6n5eVEZvP+kVJnOBuim/8Ul+mIi9HpPyflDQZQNigKAFsBR973IkRKxHeDGIRWXab040w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(7416014)(23010399003)(82310400026)(56012099006)(4143699003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tk8jObnSV3MvuriiIiElGe5NP/ounFJdU+341sHPmGTbTk727u3hMK4d/voYq2JC0gzxdr0IcmwBi+7ytXxy2zAd6ClozQyXCK7LMRLq2ppyPMO4I/+Rb/hdsHYZArq9GEXR6GHL/OoTaBasi4MGQsxNut/m2+O11LIvQ/FVjT7C6SCX7DKJhkS7Hr3jE+E3fM/FHXoVYBD7RMGOfoGjbqg/OmOGjdNMqRPu5YLxWjXdRMIFDlqx4jfIb4yteHMTc5/BO03lwGzYoMyFEzSH0te+OGe3F5j+j/X09FZYakrcOQUajLtgnpYyZTF3TUl644J5MPoGKTWGbin/am0Bh4ojJG14IaI8Zy9qvhdPyylqwN4BgHpMz21MFJ+PU+ccYl5I1LzYOt1H9dyqia10zCIV74Ti6tKeWY9/zmO81yGeUZQ9q22zmHjWZuWo3k9Z
X-Exchange-RoutingPolicyChecked: XzntaDfQU3a7KctImm2sfVmH/rJv1dRZ+h5qFUau4XnwMSZMlEKvRyVlQrcenGT5lGw/ArnwhuaGIy821FFrbyjU0Xi9RcDgeEEwV/k077A3eIfsO7+46I5nNdaQMwGxCW+gMj5ZpKJ/dtFhFNQAavuktfeTZTHZKfdcnY9JQoU42iqEdqziqO9qkzLM0LpUAeYDj9k+MpARZIMWrY52PMxeHcpk1yvjTnW2XRMTRp97DBm1i0iKWODxaPSEeVEFwOmyBQlgy0BpJ1jvHRhFqN1velu4a5LQT6H6tAmsDvfGrY268+rQQXdmfu9rDbY9mto9qYyhIwGwNQruVpxQaQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:07:08.4917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6698079-a255-496a-7f2f-08df2f95bd83
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6726
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX0MeUf65I39Te
 1ZmBFanAawK4cQF9fNi8vdtJq3tuQe0CUE8HCbt4NRaGLDDGHOhtmhmYmg8e+xMgCFElFUm7o0b
 KoFmQggkX0RDY8DBk5euaNsooGcV5/8=
X-Proofpoint-ORIG-GUID: Nfu42OvNyKLf_kbDKodH5aDzClLHDGd3
X-Proofpoint-GUID: Nfu42OvNyKLf_kbDKodH5aDzClLHDGd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXynIvl00L2UxP
 1GwL5X0Kr6ouRKMBdcBVbdXLwMDhKH6lWWGwsciyVuKujgVTv5NoWmJD7X9uMld+8cEV0cAZswd
 Teh8VaxNWIukur0hTIjxlpfdl/JtfBDQN5bo9cFHpgvCQuRqH4pLp4K2nY4BEUdd4ia8bZAlfsE
 YcRIz3qK5SHaw/Za/SklHHPpLwAQ7iMbRkB3TUjvbg/cPWYS44WYq/N6ZqB8airtJx4/z/HVCpO
 p5Q6v7hXe0nxuFPUkUCG8+WHA6wKlDu6KWMpKvICnAa8ASiUcNWxVq2jABOAR15yHRGAr3m6NKV
 vEWvuFXJ3neYHJ+7KDhTsynmL7C8NM/Rx9wBD6foA4t5Fy71zyR5fmQGPAJoYOtuKvudL1m2EEV
 5P8hr7WZ5EgtuZR4XZ7PgqsHaswXh2CUMUvXDJcNKWElpMg4szSQHvnIeeoobjkBC95UuUEyX5u
 YE0h6gMcrojJMq/w3og==
X-Authority-Analysis: v=2.4 cv=R+uWitRX c=1 sm=1 tr=0 ts=6ad8f14d cx=c_pps
 a=GLOgxCHNDJEaGAThK2D1wA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=j6zkFcs84Sazrcaa_B0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_100730_532376_407250D8 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 07 Oct 2026 15:58:54 +0530, Sai Sree Kartheek Adivi <s-adivi@ti.com> wrote:
> Handle absence of tisci with direct register writes. This will support
> platforms that do not have tisci firmware like AM62L.

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Vignesh


