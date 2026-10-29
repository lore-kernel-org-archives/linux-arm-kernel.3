Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15FB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cIF3WPF9;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=ajDICKWM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lWQXmSUvfaLFMY47sUDWd/lKEbMFVmreWTC/iOPXKIE=; b=cIF3WPF9YeYU+7
	7UBBMSwZER6cFMai+B2yA4r9y9m3HGIbZJXc9jo1a4gFoIXZr9Eyf4n752yiSMdC+iRH7GL1mg6qQ
	dZph002lx4xrjMvD/IJAJN5kjx1GibCCGe4VZicplONsSBW1ozS/gY6pdD5DuHsoQ6yE5SbLrD/+u
	6GeQ4IBNSE3aGBx5ryMQUKROJD7EDbo/RsKIzGwIPYofRLwyzLv8cXYL+nRZFuA9O91WAS+ruiSfF
	uTudxBNrDRVH/YBjR9sDDgoPhaPkbvyrJs7Dljc+wtNUAkVfQ4AI3SQl9ITuoF1zbL7mvG42rKOOZ
	wLmzhpsM9IMYdy+8k3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOm-00000009NeD-2auA;
	Thu, 29 Oct 2026 13:42:32 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOW-00000009NPb-3Iti
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3tyxAOl9wvwha2wKeHKi7TndW7QRZltnmDAUohxBxpAK3V7eur1tqsprs6sRyiBOmxk5/Au/lYq6uyBGkSuTn2ww6IF+9omqtgXLCoRpZvaU2dBB1ilANC95VcXGg/8FOEHMzzszvtH/0VnFjJF6mbtlyOFBlJgMrFFn8yznRIy2RO5b4uNydcAEVwMv99KDW0SZ5Iq7xr0sioqGfnZQj0p+ALMBsaBNGcjkmG2qs/9a9jIvVPpCBY9hQLU1jnljKCiXr5so6XCWNTFn66LAKXlb99I1tqEKn1+3yUQHaBSKodrASdmolh0UYTVsqm0F99GMBrBenQt16cZPTjRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWQXmSUvfaLFMY47sUDWd/lKEbMFVmreWTC/iOPXKIE=;
 b=HqvXDduCsZ1lFPS09vTytveODrb1SLK5W77TSOzWBiS7Cm5BkKuro1XwtdLqWGkTVR3dew1MYmjF+nfxv/cbxz7el7TxBBkYERNlh7y5+qKRGkcvovjduEgtKORlx89OwFkXQIJwLLb2zk17b8JRMyrWZEopK0AAFy+iVkkFaAomZVn75RYN1iNWePuJ9EAudqy0ZAfJwRibNpqXbdGTzjnsqkulhpMtNGfo63IrjFnqBxKjffgcxn9JS0FKz/PCPLwMOQGQqrrfa9xahduBaI4zZjR/FeHHR3rLo1B06NAKHvqJ68psQpTA7GiOw8PSK355mjmq4YoGlRX6CSkqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWQXmSUvfaLFMY47sUDWd/lKEbMFVmreWTC/iOPXKIE=;
 b=ajDICKWMNnVrvVYlDqQbtFgKdoUxfc5x9HpS7ui9IAlwjLNlsm7T7hx5BcXQ5X7jISPB3hzMgQm60HdCP/rXKMUYcg23ZdJHeEoP+KG9YxeSPuTljJwsikqpzOJsjhLFT+PkvQAEOEtsaCT6uy70mqxRb+i1iF66YJKiC02qq8WyxoumRE8byh7zYO6/bUHi0f5QzoFgi0m0bZN3woJj13LnveLsjY1LSizNu4p6L1Fo+Lk1AelODnzOWtp/My/it0NYUrNA46r4lXgOofpYx6pBhKICrtCI5/DieBgPSPV4+OWFUHzk+K4EntWTuax3rdGyQ3EYzDIzDkEEp/xLtA==
Received: from CH2PR07CA0066.namprd07.prod.outlook.com (2603:10b6:610:5b::40)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:42:10 +0000
Received: from DS2PEPF00006E23.namprd05.prod.outlook.com
 (2603:10b6:610:5b:cafe::55) by CH2PR07CA0066.outlook.office365.com
 (2603:10b6:610:5b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 13:42:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00006E23.mail.protection.outlook.com (10.167.23.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:42:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:42:08 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:42:05 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:45 +0800
Subject: [PATCH v10 16/16] ARM: dts: aspeed: anacapa: Rename FM_CPU0_PWRGD
 to host0-ready
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-16-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=2402;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=sCKaGaQB2QmfYwFpoVJBk4FFbAL+pA6eMw3uw4HcQs0=;
 b=G93S5qxydFDfM6c6Md06OkPygmN8DH1xZEkYFz6XNHi+pi9MCYUHyyI4je5pPFOu+/YuxRq7y
 NDa2dCrR+e9ADR0amg6v61e5PqS5Vo+CwxUlOUgVngYgtJuGH4rVY94
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E23:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: d30cb7b9-0d67-4e5e-01e1-08df35c26e7e
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|35950700016|61400799027|82310400026|7093399015|48200799018|261026140227099003|11063799006|261028144727099003|4128699003|56012099006|260925022911599003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|260925021911599003|10067099003|260925021311599003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info: knwmhl75/NfMHxhbQ92z5vJpzHofGAQ1Pcyd2FgNARpqCQI2NDsFv+ZztEz7HWSXWCBjN9vmxaHvjWjxVmy2t61W2eQN4ZxuDLl9XbQOaJ3xF8I371grJYLuHTTzEIRf5M97hPINhfxq8ED/iz3pCIUEu7DuECyd/larSEX8m0cW8HtjyAJ9ow3gb5CHhFyi3dmiSsQUr5n1/rIYVFoNoaND25986WBzv/hB1dxMGgRb2RrvA2CWMFeWnr43+0d2RTTiIv6zGYpa4nLj6cc750G5Fc8dI4GOrq9yh/GyQ9DjZOdw/diCuhX1pszFLiS/dhGCQ5AxbgTzg0oIuWOEmmKzN1HuoIfWbkfD2l5zNDffZIkNs0eSl22VhkqPKtuJ70MVyz82MF1Glo9YAhym2Lmzyu0gN/DgHs0cw74JJY6Y53f9UlrNzqy2vI+zw63k796C2dX5lsZ9OC6WiveUzmOsOUDM8UQQdK/RhrPXUk07e/g5JOjvjk4FHGclFHbBem0y7xcGtueK7qQkIqG0Hje0CtMd8JPLBOBUdn9aF5L4bIiTdxNbG0fApuWoxueYn6kPQSoQA+IfSaENd1MoaOrU1Th1Fh9KAdI9dJhIS77c8tL8FilsMMG8l2t/SeVwmHCQOovw/MgS9Gh8u/fokYAJXIbZQbJzRxnUBrVbE769VAE49l4YIhpPiamTVSg5NaUwLN7SY4Wx1DEuX0h8qg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(35950700016)(61400799027)(82310400026)(7093399015)(48200799018)(261026140227099003)(11063799006)(261028144727099003)(4128699003)(56012099006)(260925022911599003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(260925021911599003)(10067099003)(260925021311599003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fMUvzjmarShqOwDxdCOWrY7KtXD7GBg9Glsf+bhlC480qizkDHZ6cRIQwcFiJTYr7DQEa6/DE8EDSYiULwfpbWS79Rdy0dGsq7UP84CBMwSVDiXZq+fPMTWh9WIOmMDZfgR5hnj+Yy1nvzOwP4eA+aEjg3v9qxznzmt72BOL3ncZQmeaywFs2EOzHiKJWor9Tlx4Cyq/xQNrw9s19P5l8Ex9l0k8MKCoXhtyU7D3duZsRq6mLAUwvrzoSMD6R28tRrcejlXf5TtXErETAr7mh1gyB02kmLlh3F4lWMmi0ZDMei3bA+teeB28q91Gge6DVPtXu8YFYPmR1RUd2SpUerR/e0YutU5yCQBc9A61EkAqKZQPT3znBwAzcFqYKyOFopiPnpYM6VI/YXAsMgvpsgBm0nH75l6cxbI+jWldS0BuLSZjhikPwdFzC4gi+/9p
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:42:10.3164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d30cb7b9-0d67-4e5e-01e1-08df35c26e7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00006E23.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064216_869151_738B8CE6 
X-CRM114-Status: GOOD (  10.65  )
X-Spam-Score: 1.0 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

phosphor-state-manager uses the "host0-ready" GPIO line to determine
whether the host is running. The current "FM_CPU0_PWRGD" line name is
not recognized for this purpose.

Rename the GPIO line to "host0-ready" so that phosphor-state-manager
can correctly determine the host state.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi  | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
index 698308049c38..3685d47fb6f0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
@@ -250,7 +250,7 @@ &sgpiom0 {
 	/* P0-P7 line 240-255 */
 	"CPU0_SLP_S5_N_R", "NFC_VEN",
 	"CPU0_SLP_S3_N_R", "",
-	"FM_CPU0_PWRGD", "",
+	"host0-ready", "",
 	"PWRGD_RMC", "",
 	"FM_RST_CPU0_RESET_N", "RBB_CPLD_RISCV_RST",
 	"FM_PWRGD_CPU0_PWROK", "LBB_CPLD_RISCV_RST",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index 7745802d3640..6a526a7de2a3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -1084,7 +1084,7 @@ &sgpiom0 {
 	/* P0-P7 line 240-255 */
 	"CPU0_SLP_S5_N_R", "NFC_VEN",
 	"CPU0_SLP_S3_N_R", "",
-	"FM_CPU0_PWRGD", "",
+	"host0-ready", "",
 	"PWRGD_RMC", "",
 	"FM_RST_CPU0_RESET_N", "",
 	"FM_PWRGD_CPU0_PWROK", "",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 766aa26b6cea..f14985883291 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -458,7 +458,7 @@ &sgpiom0 {
 	/* P0-P7 line 240-255 */
 	"CPU0_SLP_S5_N_R", "NFC_VEN",
 	"CPU0_SLP_S3_N_R", "",
-	"FM_CPU0_PWRGD", "",
+	"host0-ready", "",
 	"PWRGD_RMC", "",
 	"FM_RST_CPU0_RESET_N", "RBB_CPLD_RISCV_RST",
 	"FM_PWRGD_CPU0_PWROK", "LBB_CPLD_RISCV_RST",

-- 
2.34.1


