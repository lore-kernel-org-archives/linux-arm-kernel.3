Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tD2UY85;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Y9+SLxzv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lfdLt1KS7ylWnzDuifdYyS/a8uqWpl7D00iPO+bCULA=; b=0tD2UY85tpShBl
	BV9uN8IP+HmKFUrG2OkcOgZHzyf8SQV/swfNx0ewHyQYIRFwqzJetk/pG9bJ9VN9s97ok6dW2zyi2
	YLrTmXg5N7GmdG/Unbn5SHf47AurUs8Z0wI5JQK/JgAoPz9NCKq46SgPUxjRaSry/i8cHqIVtDbmc
	9HOfK4Na6RgktWlO+prCbC8NASDxXmoL/6msJkhvl43muZHabJXvHnFZf7jQo777pCahj7gIA5Wus
	656zI5DkomXX6hWr3/GiQqAlooIm67gvWI0xuGLu9NCTgzuJ9oBEgdvI5ygsAEhp5BMc5z+FbNpbH
	mG/3DNtQZ91b/2IgOTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKbU-00000008XlB-1iqE;
	Thu, 29 Oct 2026 07:31:17 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKbM-00000008Xiy-1cR1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy9IUie840tfweQ83rVC6FTG7aGesL0OVxjzW4w55gm0JCp7rDWue6IcyVh7MLHrTbd0RmafkM7CrBN/5HMXMLCsYoADFJQkQRvzpjBS3u9+CJUqOfkWoIRwvMKDiBxmbHRbZv5H0EhLI9y/BkxJ7SOQbpQq7IvyF6f3Qa5puZX4bbTOVOaEfCSwmb6I+Si7AHINBSHPiMzpfHKC8zkCPza9FsvfrGy0K+eOp/4Ckx5us7TurhTpzaRRo8ntISiOd/K9h0uzdszWoJHYQKlCQvqnKrILyMuiiPIgKrSh0fGkKgq9k+uxRli2zOh4A4uEvcIl6wC1tbmVdY3lf77Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfdLt1KS7ylWnzDuifdYyS/a8uqWpl7D00iPO+bCULA=;
 b=VSpc2WkBeMV2I4PbsTP5slkadCKdCpSpJZeRFpeBr9bJf1BTm6PUHwFXKQ11gyDP6GYNupTOEbiRGKCJBA4XGGJkbYJARPAo7EOLvTL2yp5TMOtg4NDjlGf9BA21LB92Y1LpBAFgaz8YCJl4sEm2bAGYaaY7sfJMCFAwqYaxDJlieZLY71YuQobFl47G48RqNP3TNRFwQvDpnJihBuTfV50eLv/iIQxmXp7jsC5gqNQhCuapwHSS+XD8HQYFNAZz9QHSHgxjcpwRWTCHwidJ7MPBLXHlA9ozux1lk12AQYNvjWDhNWknA/O+0bw4zMpkae0uNXPrDyGKx0Qzn5Jnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfdLt1KS7ylWnzDuifdYyS/a8uqWpl7D00iPO+bCULA=;
 b=Y9+SLxzvzB4HU63fQOZcHabU+qzHgWqyFUPVSe42YZ4iFagICSm//MtOWfAznDSsIW0ewcRxcDCIIhvSzTa6H/Km3akdwcFrASrJQ9fzPIeF4SzcW/TBtdsuhAhKqLpNGQq7MlxG75v+I6+wWeUY0pjjntA3nQrTb3DtKDYn3glqSWxtvQCqpwIEKb1R4xYlFp8w6zy5kisSFq/2dtvnzEjGXJwQzZMbKsHXuR9GMsj+yjlZi7VuMCd+PrHmnlfyk0tZFG8ZCET+4EDN8PzAZd6DJkgHZQwWX8BCqVABtuNk/lZeD5PlbmaN9UoanBcgaYAv4/2QLnd/MkqrWcqU4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB639722.eurprd04.prod.outlook.com (2603:10a6:20b:789::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 07:31:02 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 07:31:02 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
Date: Thu, 29 Oct 2026 15:32:54 +0800
Message-Id: <20261029073257.84594-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB639722:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0ffad1-5da6-49dc-9729-08df358e958c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|921020|56012099006|11063799006|10067099003|261021121427099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: soovBmzA4J8M+NCIgugVpgsTklzHV3KqnsG6vD1MR0UQM9u8L4MtTip8cXMNj3i1dtQCVf0OF33+iqeei/S7Lqa+qx/46In5ddLu+OrdE1pVYpGmLCmzPKQQ72jAq8BxI18Kj2YTE+BlU8orWPAXfx4ks+kTWbVl/3rzxhQlxZtqkYXZeloQGUfgM6RHcwhs581Gldmaxa1a3sQ4TxWNXELPMcM9GS7OeLTNdlLJsGroPFuMTZmlFgzHwEw0XQCxJ83YvWco4iCJfb4YJGwF9vjLwg4NhYFM+9rnKCSt5vMoJ2G92lrRFR+vzMlPPcMZB8xBuokIUeqw7orD6ZtauNICQ2VxDvZuImPSkzuu9TuaQdtwY2+JhYclQISNbcPyIJPk0O2v2JwCN91iu+Xnlo2nYakbKCzzGZzdoxzXN3EuAHDwGPQC6Tbv83kUEuSXL4PSf67Uag7KVVjI2YS+uwtbqPuSlLSOi6DjNu+QQdCrLDfKECORJamfYsuvpFOP6LwLVvMmestuMUDXb8uveFNy2TQwLQLNnoquc8wJZwsA9HqdUrPH71hhLYj0R41ARa8wUiG6CjFEy4RftJUZXEAufiTvxWeRfM2n+Z5bUyvPUjStZUL0WgNVaXZLBlYpj9fotv+VE4QgoP1lGEJkSx8fRbJb2wr/zLgc1PzSj2UajmI6il+KwD92gW6C6pDWl3UupmGguJZJ/lhMcsdvJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(10067099003)(261021121427099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tRt3wg5U/oFqvqGbCRZFxom14sWbLcpbu+X0RWAEqX+2GuArbF56p3FVdRY6?=
 =?us-ascii?Q?ISS3m/JNmwxihPV51nfY34G4o5HXbdOhpoJKMcX+1C6iqxtWsvV6Hrh0Qi/L?=
 =?us-ascii?Q?D9G8qpAriPXf4igVFv8xFGEBcwb6KQ7lACKAj5OUMec6a95/ZEwPWahnJ+2J?=
 =?us-ascii?Q?K8a+5gaG2OhKKWQsGrmuNpG6pmaK1bRI7wj78rbkwh6vEhKXttf9dBKQQmKq?=
 =?us-ascii?Q?CDEqmMNYY850n+uVfEm+uMI/QCCtRKkpNB7D9C451BQhonoA7EWQFrvDmuJ+?=
 =?us-ascii?Q?cEXquE1NH8To33/RELaIE+aChRXi8YHyTcoQM09nZDGTqUs+5YvPV9pCN2lk?=
 =?us-ascii?Q?4iZmhkgNAsvS8wqgzpKVNrKkHJc5WVswvHCZ3BYKcdULQFRyBs6NBOvwAAQ2?=
 =?us-ascii?Q?VM+RWoM+RW5JJYG3+Irlb58Dd++TK5tDMHpg0KThvg6fXnByd+Cisn0FeDa+?=
 =?us-ascii?Q?U6+IKU9Acwkw9/swLa8vKQvnH0H5BxivPCacR2bNRoLQpjPP2Z6zZ6pQHEf7?=
 =?us-ascii?Q?yXttn81yXpwVMOw12imwTtyaPseZS2Vhl8Hd+Z3RX88CTtD7ri352EmrDLnI?=
 =?us-ascii?Q?ICJh5c00Bh+wI8BsKqYp6+mzJFn9RrQhKi9LUmP5jY5dRwgp5fN44KTzR1am?=
 =?us-ascii?Q?ZXrozStqEYZaVAlOGrC+kvkV2heYPnJiU78DKrEMyn2yq1RqmVSvy8T3ZMWL?=
 =?us-ascii?Q?8TJf3Z3MY3QnJ9IqAnve/o6JuqtxzPe3NCeH1XCn2bEddVnFwR/YNQ7QABQ5?=
 =?us-ascii?Q?R73gt92Abmd8z2t2FBUTUvChuWHx5kHPNw5I7E/7qNNDiPxtNW+YZy+F+q/K?=
 =?us-ascii?Q?8Xi+t4/jhrW0WTIudqDfPV/D9zhHMHn/A51As1O3oedJJyaUORdzykoPAPS2?=
 =?us-ascii?Q?ZAr9ZhOocL2S6iMrfU9A0Yk+oOOjFBmh+GN3eNrxvpoBQP6yINbJO1cRRLED?=
 =?us-ascii?Q?RTswpKEDl30vvQ/9m+1sUr2Du1i7StXD2+EQc0xdLG9mK2jr9TO3GTXvztbn?=
 =?us-ascii?Q?4j4MpSR5GzzuQZOmzZ4MWexrUl8P6iJ9NYproXeYHvf2s0hUacKAhiQ/b9/x?=
 =?us-ascii?Q?jTiqH1/mmLUKvsUxnzYVdPbmuZKD9hmh5rymcn1cwD1l6gie+u0LAbBqDta2?=
 =?us-ascii?Q?gl5WAWrTswxzDdYlWDZaujuDot3EjUr/yRBgJuU2zDStBzO+SMsasV8L9iSK?=
 =?us-ascii?Q?3CIKIsacUY5ASMdSQa2SvFaHnuumGrJTEau4R5JnSMnWc5urBgqSNMBOXO+/?=
 =?us-ascii?Q?j6zl6+TyxUugUkkdaHnqhP/iFhnyGFtSrAukGpRn5YgFY+keekjMSPpGTXF5?=
 =?us-ascii?Q?F8wZ/U0Ew2PPNyBivz+qjmUEWEngtzxrV+SwWUl3FfGKWu+YmHjJiUn18fCJ?=
 =?us-ascii?Q?Nl2/JSlgCBtmcugfoKgdhFRYSxqxzyB3ZMQovE0jGtIkvsF4PJDIA5ZjZuif?=
 =?us-ascii?Q?VfcgFIGMXRuFpITpVub6r1g7S6CekZ1GQDW5JZI2JvpxXKhtAegfBZiHCEOx?=
 =?us-ascii?Q?hZa92d/DrHxEK0nkfrAW3++owmHcXlzf7kHJj9E+QEzeFS2Cgfg2TKCbrza5?=
 =?us-ascii?Q?vaSzfQ1GoDdYj1OaNW0LUG5JinYjmlXBZKdUMb4mtW38MwPQnQ5hCvnNljzi?=
 =?us-ascii?Q?0R2eVmtld8i1hwC8igB0A7yVAyoFDLM/Raxp7FgiV5tFRky/N1GGpujOq3W1?=
 =?us-ascii?Q?OKbO1aipBkS/vRk7KJFFAWplzjIP+zF4+JuELjSo+K3lgOgJY5RN0FyVjP1n?=
 =?us-ascii?Q?7JDghtmwfawBzkd3yEbF7T6iFTP+uOINc1bNHG5HWMTnmcRLiJ2Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0ffad1-5da6-49dc-9729-08df358e958c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:31:02.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPZgiIqdxu8P4QFMgCXaQpfgvNPiUMhAH+HULGXEtzLFOo44nJemV5jb+ShRJ9avnBxTVNi/qb6Zlh3Y8YyGvC3dIDjY0msWy+qayoRPOxndA0dUoaz14ZOvuOXzF5p+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB639722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_003108_515986_6029EA50 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The HIFI4 DSP provides an additional debug reset control that can be
used by the debug interface.  This patch adds the `dbgreset` entry to
the `reset-names` property and expands the `resets` array to allow up to
three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index e610b7636a08..4a75a271b7fa 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -84,12 +84,14 @@ properties:
 
   resets:
     minItems: 1
+    maxItems: 3
 
   reset-names:
     minItems: 1
     items:
       - const: runstall
       - const: softreset
+      - const: dbgreset
 
   access-controllers:
     maxItems: 1
-- 
2.34.1


