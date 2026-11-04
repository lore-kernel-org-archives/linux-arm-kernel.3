Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB7606D808
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjqdVs6U;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=VnwLWyDu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sf3dt81KgF4dIVTtzIECPw73AtQuWlZSqAxfOxxLm/Y=; b=qjqdVs6Uoj3vXT
	mx+3gW2AuREAmdL4jTBn0EITGr1rpN0Okc7o7jjOwA+wFtIbu4zOzftfDIMaWawqEOTKFM28q53Wb
	5icwEOD7CneA7GzweeO6U+z+QARXD6cQVF2FCmMz8QYyPOTSzCgCrFc7KTCaSOzjQbRz6T06SshnS
	9x9apG++NmgKEyM93FNeNuAHoG0Gw+DXT/oL46RJAO0xrNKihFllmvu8wyU/RCzl09n8+jG+hK41+
	03YNjlXznhrhV1LR3PM8q2oAXXNcQeXMB0HvvUrLhyPBLyG/ozpmfP0lhayrgoe0sTi1wiBxYgXX3
	hyWvmUgGuQEy5Sio87+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW74-00000004fmc-3EjY;
	Wed, 04 Nov 2026 08:12:54 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW70-00000004fhJ-2qig
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDiEdJj/StnXeI8YZO+m7JLP0ryyk3DPwQpj1F5ojFW3Z+CIJ0hPmLdGRZyDYfN1UxBT5l+fquZfE+Mks5V08hhP3cgP60xaeXpX4sU/0jGTg5duV0FfN0iefWQHLFYLSZwxPlcM4lGaRZIN6yGn2FC60Bzmv9VDjMfq/R3iQJgxgS0c68AXnZc7+u5+ZmiMtSzEtSMU1sj8j92LhwRZV1h56Z9eFj+0xyw83jbTQPkg6xFEqopQAjmaBZBWhB6zFEiGVXbYZ3TzmE42zIc8iRigBN88XmltKBPXfYWvstDzmy2vxIOl4DWxzj02UfT4Z5vJf4VE+aJrT0ya56goPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sf3dt81KgF4dIVTtzIECPw73AtQuWlZSqAxfOxxLm/Y=;
 b=sarCfqVFJ/NVoQSFMxyhZDJKLS1r3iW1hKHesubNFR0/C0tUCk9tna4ZfYrZE1Vdf6Ytl+2WrG1xcvK+48PFgvy8pkhypZgSes1ZOyxczsr6/gZlPihh9KwW+M/yBzfSoQ4qwpOTiKxbVcrbNPwJNuwVTeD2c7i1tZ2ye1X6ZrbS6ICl2BXxPbO25fDgTSmaml264exFVzt3aMENk16yFPc7E81YutT9PreZwoe0/KtwolpFX33eo+X+aFXQ3A8c1Ki9uBziixk4FnZ4S1cIWpf9g+UnqoqDccGHcFnmOAvfrJWHwJcAcrGPyaQpHwbQk33rNQYKONI1+ftKD+yeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf3dt81KgF4dIVTtzIECPw73AtQuWlZSqAxfOxxLm/Y=;
 b=VnwLWyDuKnhGDcwYdfMTcOewcDOdGKWBZkzJ3PuAYyvUebdZs0QwoCjruJXBzGzr3m7CrzU4emy9Dn1Sgy9ud8ijfndGjokC8u7Vjtx6cChX1mOwz7TdWaYAZGxMvNHidT0KwO1bStgUg4iw4cOMSXF+8QvKQOyJVAd6lCrJt/7R+JAjZfEAB8X2z9I+ZGUR0tOuIApmDju0ldPIYjeUnM5z9vdoh2UdUZ5f4q6rH0QBJ2OWn/lkd49ji4W02/ebxvUjyvgyVJiOdAgLLaJt6Goe7rGPz20ouzYdIZFXrYHIK6YDlXYm5sFaFy1zdu5d9rnRhJDauppPXb6PiMNlDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by LV1PR03MB989626.namprd03.prod.outlook.com (2603:10b6:408:3f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 08:12:39 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0569.010; Wed, 4 Nov 2026
 08:12:38 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/2] net: stmmac: fpe: Move fprq configuration to stmmac_fpe_configure_pmac()
Date: Wed,  4 Nov 2026 00:12:34 -0800
Message-ID: <20261104081234.10153-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261104081234.10153-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20261104081234.10153-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|LV1PR03MB989626:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ee7434-15e5-4b28-3aa9-08df3a4b6407
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|6133799003|10067099003|22082099003|18002099003|55112099003|56012099006|11063799006|261021123027099003|261022075727099003|261022105027099003|261102123227099003|261026140227099003|261021121427099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VYqCxc4D9ZCifZJc6KUQad1Hp5uY26E1pLh04fEDfSimzgIyjxZMQgMCmrCWqR2id+AmTeAz5XVktOayjHIhztm0IF++DCXog3nYSJ6ddbRtq3COSkRYzjmOuw5JSN6W8WkXIxU5x3crLNNvf9JQprGeoxi6VYoQA7fLl2HwnY3t4kKFYEMVZBjeSDWaR0p3ZdMkRv9FlIS1XYNkP0l2NbsTjW0e1PUWWK8hjvZNcYdRqTlmj7vuUKZoONirG5eFlQOdmZnVwP1HNCEUqzbJ95Wah2NCtkJLRGQ5BOEm0cV3YXCnIeblDe8dCICXOsbNMQzRvcJsn+n1qkB+E/ZV0Uv39tsTor47tz90aEY1SwpMz9hhk7sSuYnHvwbUGtVQonyaPDTxgu3ISxPA09A1/Al39J0cxTwfSUjXb5uktjSWgIVo9cu/Ssq3wPsOCyWswxuweRtqLDPEOTAtGHUaDtwhd0/LUMYY9ubHpVZJY5J1f2cLPJ6BREKtqD1o6t8WxjptHpSu92V5Irr4iTR4AtFqOepwT2DVSnd6ziwBrCE4sh0hCjFaicp7vJxNYps6yq+U5LKKXrung/Q1bhblEpGgRbml8gx1WEJlGmxg7lFrUg5M/laS7gUEw22mvnlGzVST105lHTLIzdwET53CHsas7CNQMqFw4Phx2xbyGXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(6133799003)(10067099003)(22082099003)(18002099003)(55112099003)(56012099006)(11063799006)(261021123027099003)(261022075727099003)(261022105027099003)(261102123227099003)(261026140227099003)(261021121427099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ufXmzo3Htd57Koaf1+EKBaZA9seo9buBgx/Jm9eEx+vizJlHCw6Xv46vm6AR?=
 =?us-ascii?Q?jdLMVUOKT9UAd7xJuNbraL8NYNDhSbu07GFG2Yw3n5h1x1ZhAwTvmxNEUedY?=
 =?us-ascii?Q?o1XTe6Ihc7kbSldCi2FStpmrFxsEQ8gGm7AwdTa/UbVpIGOYGlDOuAl8PaWV?=
 =?us-ascii?Q?wf3j4zja2oEUQ99VVfNCa+MV80tYOrNYf7u5LS6A08drI76V3EXK4Faonv/L?=
 =?us-ascii?Q?q5YtgR/MUznlcsEtAnki2NGSHYMLVos0MJMNKo0UkCR4DdrAJ0fKjgQ1hJvN?=
 =?us-ascii?Q?WNZctIOu/IbRgl5ILwFSqJ/i9BLjx7KviiXjv7yJSmzQPPy5lRUquE04kJT/?=
 =?us-ascii?Q?YBIm0+ohhT8KrR8xec7CdzDSPk/XnfqGcIvOt5RYQ/XzkWJKtd/8PRj1qxwp?=
 =?us-ascii?Q?a60nQmum2uCHmOTTpjCtZr0lwYL2jozcptu2LMkYEK0jydO4aevhZcL1/rSH?=
 =?us-ascii?Q?09toAu/nLovdUwqmPQUtzH3v3/zAXwThUyPH4CQfST9oVAmOga6KfCBFk2kS?=
 =?us-ascii?Q?EOgWjqGoreaT1PeenXquDpP/atV8AJz489Lpjcmgi2w/rwHcV2thvhicszF9?=
 =?us-ascii?Q?MJVbreJ5Qmy3GI8OyqqCq4TMHaNSHB0XVTjPsOKjaICPs0c9SbyJJvgr1DLf?=
 =?us-ascii?Q?Kx+dZ5aVfyaavIF5Q2O2UKLzu+tPLZVPERFiIAUnaYBMG0U/ki7nKz4Ex4hJ?=
 =?us-ascii?Q?A9uh62h8hBX8/pBj1nL1iLl3X/okPq1xaV7X430A7JhUUMsuColzUdYmMagW?=
 =?us-ascii?Q?nY5StEPxuOxJ9CrwgHiz4icGTp5mnk1AgnXkaIYHekVFtZa87CUEwREs3Obn?=
 =?us-ascii?Q?SQgpqv3YqTtUoZki+HwT/EE2mgYTyD8Tyk6MfhKT6PG/DTPNK5ICVyDwJF87?=
 =?us-ascii?Q?fTTP6d9mVSUm+quMsbWMzkmHWPeYIrWqcCNzj9ZqMSJZwxfvakj9YrMpRjhr?=
 =?us-ascii?Q?PFJJpLpvNfBPo16yN5gBzNC5lUT0ih0+zuQtZGwaVUS5Q0qHnSvJ4BXSQieM?=
 =?us-ascii?Q?j1opxwGrCD23rS6QFp1y+a7YnbUBhhOb9hMCEg3kkuEOPdzPpNdcZYRUZ4Tj?=
 =?us-ascii?Q?34TWen/rkhsChIIWMwC0YzUAY2Gq0zhu1FWUXiUPOmnk8GYQeae+MeAdbkPk?=
 =?us-ascii?Q?oiMbaWTu0OgQscAGJtU2R3qzQ1t6v4RFZ3YLZNrfekjhX+KY0gskP5kCbuTI?=
 =?us-ascii?Q?tWpQu9dWSaH2jbBFyMSChCSSrvF2SyNe6ilglxw09lG9BVFbZmo235yJ59R1?=
 =?us-ascii?Q?cHKHFFA2qDKElwa/KmreTKI3S+mmf+qPiagum9OQpm/ZcHW8FgS5ILF+7GCz?=
 =?us-ascii?Q?skvynXG6azItNZhAAbQ6ogHH9OB95PyFGVnvj1la4YhvpgNpzd9qIWmMvGCk?=
 =?us-ascii?Q?3taXOKYo+LtFls5DX1+4qScXn+jhF8Rso5R7bET7dCwIPNyYZ67wnyQ/d6kF?=
 =?us-ascii?Q?PS+4fFoxBlt9TYzqEll2zSwVUSfAacenYFsIAfMB7IhCFrkONftFnqKd1olI?=
 =?us-ascii?Q?2WRpAukyB+QCN14CFA7GyGLUaj5WlAuYxbRZz5pTev+yk3bunJbfxMe1uujr?=
 =?us-ascii?Q?Qp428tNAP9p2LuzmefGpWRZ7zSs51g6feuI3JoKypo/a3w66qlLS6gvapsBW?=
 =?us-ascii?Q?xFWs+lHLbcPcdd1/CJAet2vc+uvbHj6uBabQDhly0EmIhkdAQ/EaVN4DhTTn?=
 =?us-ascii?Q?eCRLYmhAHXI/lQ8w3GqBc6jD//LMx98ReWw2BNHJcNNhY6ikFZw1/acplnVh?=
 =?us-ascii?Q?4+rgYUdR2pYZQ/DG6kGYLercGQmck9AukEDlW/ixMoIcESkwRNOvn1UXTNdP?=
X-MS-Exchange-AntiSpam-MessageData-1: TmmfBve00KixAw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ee7434-15e5-4b28-3aa9-08df3a4b6407
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 08:12:38.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOoVXFEKky5GNF9cbHi58K6gmtDWACo0JwFcL0IWMFPVvGU7GiThrSLQsZQixENGO0xKWpd558Nt8lCXDIssNNf4KtHxpFCrwaycITvJ7plbb4fTbBKQbwWvWsfyKH/aeWOEm6fjZ4MseKNMyFsCvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989626
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001250_781609_0ECA4B49 
X-CRM114-Status: GOOD (  14.52  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The Frame Preemption Residue Queue (fprq) controls which Rx queue
receives residual preemptive mPackets from the pmac. This is a pmac
concern, not a TX concern, so move its configuration from
stmmac_fpe_configure_tx() to stmmac_fpe_configure_pmac() where it
logically belongs.

Keep the open-coded mask/shift update rather than u32_replace_bits(),
since fprq_mask is not a compile-time constant.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v3: No changes. Was patch 3/3 in v2.
v2: Drop u32_replace_bits(); fprq_mask is not a compile-time constant and
    triggered a __bad_mask build error on x86. Keep the open-coded
    mask/shift update instead, per Maxime Chevallier and Jakub Kicinski.

 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 2607e29930b7..cb153857077f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -47,20 +47,13 @@ static void stmmac_fpe_configure_tx(struct ethtool_mmsv *mmsv, bool tx_enable)
 	struct stmmac_fpe_cfg *cfg = container_of(mmsv, struct stmmac_fpe_cfg, mmsv);
 	struct stmmac_priv *priv = container_of(cfg, struct stmmac_priv, fpe_cfg);
 	const struct stmmac_fpe_reg *reg = cfg->reg;
-	u32 num_rxq = priv->plat->rx_queues_to_use;
 	void __iomem *ioaddr = priv->ioaddr;
-	u32 value;
 
-	if (tx_enable) {
+	if (tx_enable)
 		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
-		value = readl(ioaddr + reg->rxq_ctrl1_reg);
-		value &= ~reg->fprq_mask;
-		/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
-		value |= (num_rxq - 1) << __ffs(reg->fprq_mask);
-		writel(value, ioaddr + reg->rxq_ctrl1_reg);
-	} else {
+	else
 		cfg->fpe_csr = 0;
-	}
+
 	writel(cfg->fpe_csr, ioaddr + reg->mac_fpe_reg);
 }
 
@@ -68,10 +61,11 @@ static void stmmac_fpe_configure_pmac(struct ethtool_mmsv *mmsv, bool pmac_enabl
 {
 	struct stmmac_fpe_cfg *cfg = container_of(mmsv, struct stmmac_fpe_cfg, mmsv);
 	struct stmmac_priv *priv = container_of(cfg, struct stmmac_priv, fpe_cfg);
+	u32 num_rxq = priv->plat->rx_queues_to_use;
 	const struct stmmac_fpe_reg *reg = cfg->reg;
 	void __iomem *ioaddr = priv->ioaddr;
 	unsigned long flags;
-	u32 value;
+	u32 value, value_2;
 
 	spin_lock_irqsave(&priv->hw->irq_ctrl_lock, flags);
 	value = readl(ioaddr + reg->int_en_reg);
@@ -83,6 +77,14 @@ static void stmmac_fpe_configure_pmac(struct ethtool_mmsv *mmsv, bool pmac_enabl
 
 			value |= reg->int_en_bit;
 		}
+		/* Frame Preemption Residue Queue is the Rx Queue to which
+		 * residual preemptive mPackets must be forwarded from the pmac.
+		 */
+		value_2 = readl(ioaddr + reg->rxq_ctrl1_reg);
+		value_2 &= ~reg->fprq_mask;
+		/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
+		value_2 |= (num_rxq - 1) << __ffs(reg->fprq_mask);
+		writel(value_2, ioaddr + reg->rxq_ctrl1_reg);
 	} else {
 		value &= ~reg->int_en_bit;
 	}
-- 
2.43.7


