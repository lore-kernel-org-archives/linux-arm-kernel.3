Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4DCC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a4YgE6FuNguXwHz24vQhNNH8KYecZKNu5eCrMZ3rY7c=; b=EaSmLO1p+nvv0gO72VjnmYX12Y
	xVMdyTUmhVlK1+MnYXrfGsSuyk/V/1P4+8eByccE7iAqFR9gOyB/hy3cK7RbLZrcFq3tDD7ltImA8
	pbYhR/g2wu3PGX80iI1UtRsOTulyRrAWfeATQ37aSy2O9c+ivgbsroyQxfqVGRdDqiNtev29oSxSW
	6F5vEMgqH/oTjnO0WAHr/EM1VnAEOvSGj+LN0JtWaZpJYjyt1YB0CI0aCnap+BmQn67mBleVbIrDH
	010Bl0Kb54PF1eQmwDMyxcnVJWviqUmhpDrhPxA0xoGoXP+cekPZ6dGrxhmCTWPwE2nWzSKNWG5lQ
	oIHh2tXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvW7-00000003cmg-2QLt;
	Thu, 09 Jul 2026 20:38:43 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvW5-00000003clG-09u9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:38:42 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HVCRX1635088;
	Thu, 9 Jul 2026 15:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=a4YgE6FuNguXw
	Hz24vQhNNH8KYecZKNu5eCrMZ3rY7c=; b=mkUc8rG5tvXcTwcVv6HCtx86BzSWk
	VpEweoUF/yuJy6EHkZEPzcf0uZitf+YJG/XDmS6l17tO+SUiesvQEJ7cpV/uxHy+
	y9yDhhwXa5hTUT8SA/Q/aaQt8XHgAFRrcQDFNmUSZjwgoABiFrzJyHzxcwqA2s6k
	9pZrMsDy9y92nkpcYe2+TkDBFx42K7O1xTqpLRzdFjxIqXOYxo4saRDq7jHnZc79
	SuTSlsSzbx1BGdsM2w0CO6uJ3rgeNCFm5TRqsPn6NUK746S/6Z58AUQ7o9sKrMHs
	yYYGAp/bI2/K0t3AbpEdUAvefqFi+eFpoLDb9slsJYuYLFGkDyIizjSEg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4faakykk76-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 15:38:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7CiCPstFNFAozyTbqkOEHqi4wUSs84hMteT6Bh1CQINMhqQyYfavmqmgwR4ViGci7ivV/NTCmpN2S2dXvJd9+K89FEmwYp5xhbqDLMu9KlM5rdCIWQQYxl2m0wsGlqnJHENrhsspFKwzTOP91hdLqUNoBSOW48CYaKqj57rKX1rXzQ/mGvQC8SEgmmeMOY4PpNr9Yrtf8irSBuwe7/MC3VDrLbSypGqqQQUNrSCgsfpOY8tdme2/Cz9j85iOT42oKQ+AqCDiINfN/bfECpMfHGLYcObhHRqrVwkW4e4394a/FGtNs+xXVLWnbwativiBKSqZNvxZPw2dbhMTKsySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4YgE6FuNguXwHz24vQhNNH8KYecZKNu5eCrMZ3rY7c=;
 b=O5z8YmWxPEcBpw/pg6H4ZlfACT83H1VgI5+erfZ8mSbJDv9dat1aUdL2ND0tXbq44GHp8mJfSfg4z2NGT1lfpqFt3eQi83EXXZg4bCZfoBtqM8G6s6m9VEPRsc1yOrLGfa6Zsc8zjTc65Ge7kVnCNGQkCl9OYYxeokgwZeCyDuAOgzSwkviUtkxdFk+NXsmzaT4cwIgzAnVuWctzrvvaBOYPcZtGq7kgRjUlF9tPe1NpXlzMVvEboXvNDoqi1MRDdWjMBdmu6AO0rUJ7m2jNVYJIEl7qukUF97/xmRZD41x8YPe3Ds4Kk0v3YHOlD3ngGphZMWcJ2S4YDhAS7Fb1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4YgE6FuNguXwHz24vQhNNH8KYecZKNu5eCrMZ3rY7c=;
 b=arMCechVP19T/A4zTKdLo2fqGlLJl3EQwAnGJ2rk7aWoE4+yaWpQ26m8zcXIZUAIkJ50lFOgEWLEMsrjdk8hgqiWMgVzgBP4t2t6DaNF9WCxdXcXOaDEm5l7Bpg48FpYKAi1bbQsmCXSazCJTWZRvFNiCZTJ6/P5NsMEdkF9vtY=
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by CH4PR10MB8098.namprd10.prod.outlook.com (2603:10b6:610:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 20:38:09 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::ac) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 20:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 20:38:09 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 15:38:07 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 15:38:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 15:38:07 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 669Kc7pk2083035;
	Thu, 9 Jul 2026 15:38:07 -0500
From: Sen Wang <sen@ti.com>
To: Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, "Linus
 Walleij" <linusw@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "Eric
 Biggers" <ebiggers@kernel.org>, Takashi Iwai <tiwai@suse.de>,
        Kory Maincent
	<kory.maincent@bootlin.com>,
        Andreas Kemnade <andreas@kemnade.info>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Sen Wang <sen@ti.com>
Subject: [PATCH] arm: multi_v7_defconfig: Enable SND_ALOOP
Date: Thu, 9 Jul 2026 15:37:57 -0500
Message-ID: <20260709203757.2401699-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH4PR10MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: c4267179-c62e-442a-e0e8-08deddf9fd25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|23010399003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: XaSRrdeJd3xDGSs09Dm3FrLivIbamBsao5E1xpNA+QYB0jiX2ftudatIdwSyRRsB4DAcCZXMrO0fTvlwYwdM7Rlz/ezzmfQ74qiKWSbgI8fqE1ZokjCNvEY0TQX266HHgmvTfoUKH5AXzWlq58AE4wPsGvJr14Dia0coFgujsxnr1hrpTmGoWho/5mDJbLp+Tcxp78sfuNZ/X+yIukxci9uuUpU4Ha3Lc2DGMTWsXkp3eVxwo9HWD6OGrr6m6JG38hJqlu1Tfr7KxM80CDcqxtbCOe2JduN8+TB5UVuLuqO3xrbihLgPtcbeEjhVgDpq9SBzn11DJGf8oZuEigFsC+6EEDLeWnFm0aWL1/sBGeVWqN7G7V9irGaSnlc1ihN6yA2LiA8E/iDQE7j68SyfLhcLKzVQ2OnhyBUv4hwXvgV/vGlzMdj3w0VA1tCe+kQCX11lBzx7ZRztOFS+yb1Zl/yJuwdviHEfHtOqlMg4RfuvuNDrdaNoUewELH1ViCzdqyO5CQeq3TedzuLrV2VOXd8Po3wNa764h2nOlQFDXOG7sFlLvbx6eZQRbKcuLkY6GcuIjlUdvW85v3pkgFcQK2p5ajBGlc7LJ2cCb/KNh0DoAE28IVaxXZvIEK3eKKQS/2Qlq/sE6CXDxb98SLuxEPchYhZHqSMqb447k5zeUpwJXgUK75Jr4peMMTXg1RCEKRo6eqJPrk9zQAgn8EM9Og==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 24z67hwiGmGcGQVOD3U7FyJUUqNxPAYwPrwKRzYyAP3PAbmMnl0tbebDF725yxka1o72Je295ls70vNRxae4rImT23ubqmPfmMR6KM8nEj3SrtijZonRENvXquNLlG70hGrBO0uiJcaf+glNb+QUK1QGA62+9PDdSe2WhicT/sPfFxqNU9EpTTjEMRqVNP+IArku0b8KeZ4c6OPHqXAcYykjEBMIDkuu4LyspJk2Q5KOFWxZgdCQs6B7ni3JPYZkWvzIjjCERbNiqZ3NIso0XB8XjUMPnWaSbb1974ppPUx4idtYnytg3sE0PQ7BqO6HFGNk0RcxoQGmk60qqYz7UP1WdRanMZcEZyVaGp+ODJ1lad5vS5UNaieSTblMZ5YlYgLfCUl26S3kTflZfl44AzWHXMRjwdMPMe2s/TCFS5kzmypt707YRgus6LynhjrL
X-Exchange-RoutingPolicyChecked: Fp1JO2ZPJCsZ2A4Ltqn0m+wyeVEQO+r2e83QTGTMzKdB25/RTbZQPc3fhCU/9DkALE4fhwStPg930P2HWMn9a1+fOWaIhH0e2Ge6B1gMKaE+nHIOsVtIYrTrXkBT5353m4komCdBvJVbb5jHIp2Z0DibezqAAXLlT6M2xEUC2rebDHIjvAkqlN+osfyZjxab8YtTe1tRBONbXIENkUiEAzvFqWLYZZLcKKSC3WUUTNRifZZCB+qGQzwWCpqP9lm2YBCRAbiColYa4J6mQPRYewNZc8JViMXH31tVSkbbzkMD9tN7Y4Hm3CXiaj8jYz3d/UFqbf1bhUYHRxYbVKwr/w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:38:09.5597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4267179-c62e-442a-e0e8-08deddf9fd25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8098
X-Proofpoint-GUID: 5A1WAeaI_w0thR2XisWAVr9T_xsrIDG3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIwNCBTYWx0ZWRfX1GeaxRmTEkYf
 cmMbILVR9Kd01Ynxbr72kuNbiePGapaK3TG2C5CM2KDYXWRxC/agOctYA3iqZrHFUr0VViKpo0a
 JwIEWvwNGfipWMpxA7ssRIq5IomAG10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIwNCBTYWx0ZWRfX8nAgROM+KcZ3
 0RUzl0WWCuoXebxI/OwEFhyDEQKkDl/CN+0UbFRAB3Z3scI7+/MyWkKjVkueBNlhzmqxyiEODTE
 wocEoJL8Us5bfcxowYzv4lRHyUZBtCUKLiGczgAMD2nFr4PH/+mPkzahlDH31WppCinzH3mxr5W
 xQ3UD8/+ZKY5oLLWObps9iPjPq7cD1fBJ4sRHluarS+h+b3F4qvebO61jyg8h86M5ziD+/TxGjC
 F1w1czseQaTK6H9FafHyxEblIJl0BeGLHqDh9u6ZJRD7V5RsKxoaLF2lm6ZaxBpmcYNXQXoW3D+
 aU2cGofMUt3YNB78o2eyDyAHnBbyY4OUFz/Oqc0nDiESojdAtTCh+EnN2P5ZY8wfg4kHHYhkvtZ
 jWzacoCotkrKMAKWcakdlRWjyPvh7UbovdQuL4RUlo0QZpdT/37Q2zXXXcZBpDWcr6+90f5TpsV
 IGbeBl/jiK/GSVBEevw==
X-Proofpoint-ORIG-GUID: 5A1WAeaI_w0thR2XisWAVr9T_xsrIDG3
X-Authority-Analysis: v=2.4 cv=E9z9Y6dl c=1 sm=1 tr=0 ts=6a5006b7 cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=j13ubiVfCjCeuNpgS2EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_133841_298685_883DD843 
X-CRM114-Status: GOOD (  10.76  )
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

Enable the generic PCM loopback driver for arm32, matching arm64 defconfig
(commit 7235cdd9cc52 ("arm64: defconfig: Enable SND_ALOOP")).

snd-aloop provides a virtual, cross-connected soundcard useful for
routing audio between applications, capturing playback on systems
without physical audio hardware, and automated audio pipeline
validation.

Signed-off-by: Sen Wang <sen@ti.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 70d05f74049e..ef9ea0ae55e3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -789,6 +789,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_SOUND=m
 CONFIG_SND=m
+CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
 CONFIG_SND_HDA_TEGRA=m
-- 
2.43.0


