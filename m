Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E844C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE8ZVF77Q8olof0Q3h+z5+sV11+Hg/Pz6SdsPrODRLM=; b=1euEYCtAUlNjRvplVjWi75zqJE
	O3+q64vymTnuKsrgZt5ckbx+Zb4ncrRg/QURHmlRb89bYLqHcssObfRqn1Ez6u2dEwGwpyVnCXtqU
	0HpwZ2eVoseSTjwq/7w4av93xGrCJ6XJp1hQu9LulX473vE5CM2uljnd7IDrM1/boq6UbEOpooD5B
	t7KltihX+FmRJjsDiyaj0gwxSeMJVFGozx1RCgm3YTwcHF5Ragm5bWYdjvUKozRyw7dspM8j0sX8V
	HeNdqvtemRvPK2q3zpLJ1i8JcLuskZacW6ed2T0lKK+DGyBheUd1fs3MqVD9Ja5eo0aS3eEqwnfil
	7CJj/v9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rDh-0000000455i-162Q;
	Tue, 22 Sep 2026 03:31:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rDZ-0000000451v-3pJx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tE8ZVF77Q8olof0Q3h+z5+sV11+Hg/Pz6SdsPrODRLM=; b=GZoQ/6cRgktmahMbh91uoS4Sf1
	8Jdnbv8FyAJyiegYZ3ZBZOgztIeDirGqdyDjYwVMFUqHclIObjs39D257W0cg7WS0KGGb+uQGK1X3
	hv0kBSSgwS5/HXjT92D7cym1BzCly6+/Npi/+FjCbXBcIJNB7F5hVRbgmNQ50Tp3jU17kG72b9UFN
	BCTjXYBgYaRHrNhoM5HgdjWURK9Z8x8gGSzoR598Q6h8zfFjjPlN4Sys7JJ4PSl1x2vimS+uLeW+Z
	QW4N5Y18Vz3BmfKBDcXfq3I1YFuTTMZrf3xqYvoinmvoWRbkBZqbZDt9lQTmjb41z3XW9b/mZb69D
	aX5HKBwA==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8rDR-0000000D3dO-25y6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l03FQUNY95ZZ308rkYn161m7X0E5q+q3CvFe2e9srz+RWIM2a1PvnFkoTsbysaHwuCHAVR6ynIM4VpvWmeMx4I6S8Gpo3fCVsiAUdNyrxwWlKNlkUQm8KL8XApFDmixkGD46W67AaZEkU709ix5OgiRCGZfhUOB0xfdT2zCnmn7FhflSJrmMUlOLUfWS+Re8grakVEveLvJ2pCb0gG/WerWMOTEyy9gT8q9vJJs4GSb0RR8VeIVIqnDXZKduuEJujz+Xl6HWda0jm/GM9rC/UYAEad3kNz+E87+sHWTwmc9ieZsbJTt9UW1G5KDy6NyGRp6ywWd/zDNCtL4WIsMFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE8ZVF77Q8olof0Q3h+z5+sV11+Hg/Pz6SdsPrODRLM=;
 b=ui0F49BpY9Hd7nVMBrVQ1rIiYReMjJxe3M+hb8DvqREPne4kYl5389BhpwKgApvkBzu2qVvRWwHKnvtAJcHP9DIju0/ORn2pqGmIDg4sm3RgslGH2kWTH8qYmVTWL+P6PxLxyj1GWqp9nW767tLxQYF0hzMEirZP8/Hswgme7vX6NpNSccWpvXVWSFShIhWhxLLORikEHdZWR0Lb/qWia1icwK83GYG4JB0A2wDFF7E8BWHjerXMNB2IMcVhSWr+NmB+i53gsj3xenWTdIYYqvfDQQHQuYXnjK04S0w6KSfOIZTI+nvU9GIGYRZ/SszPL1WcRMwyt3edzzjSobeU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE8ZVF77Q8olof0Q3h+z5+sV11+Hg/Pz6SdsPrODRLM=;
 b=bZFY7DWnwvnfBLyBxT4oAjJ7UW0u/aMCSDU3DSLfLNYhIkbJu7YXHbEVlf//ncolz4VRO1Bnml2KGQgz+GRtri1MLUhijCVpABniysCl8OT/XB+N/dA+NcWuR9fN5hKrAPYnHsolTLC6/RByLUM5oqS/8nhFS4C++VotS7viHkGpdw+SMqspYySagTOiDDucdXb11GLQtAgEjOcrFekMZesmOXTiPmW1GrbVadRXKBLps6jyLbbFqqZspPiCEJIyCnILcXTOQMCi3aXhEw8LElus/r9Ad5B+10V35vYD+1dc4RZyYSirjmPHv7QnRCbcKEl0rbgqrWQHWk6iiPLoIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 03:30:24 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0428.011; Tue, 22 Sep 2026
 03:30:23 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [RESEND PATCH v5 5/5] ASoC: fsl_easrc: expose individual DAIs per conversion path
Date: Tue, 22 Sep 2026 11:34:28 +0800
Message-Id: <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df2af52-4be2-42ad-9706-08df1859d65b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|23010399003|921020|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: j2r6H3/yKyGw1wbldgyWsSFcjg+PHJlk29ojfDsT93bBvuMNNxCmngxUtBHlYessHLHq8TMAHWpQZ6p52qDqG93ug5r9OFFAoZFaabddgkSBzqiH3GDistqcPR9geNEdcyKKTnnjYgln5UQpWkEo8eL3OLSkGdIBOiJd6On+I6uuPFFQociAJ8o56/0B3IMFJD+ROiGB/OuZHqcmADtbJdljKevFcMqcihErkx3d4XEZYPTPIboDbP6Lcht5JMNRipC6CCxYYtj8fyxe+VTuuFhlZ66StC82jc5WJ4tU2lUy4wHS5XxXaKpZ+xcyDyT7vxA9MGXalcWsloVy80n8BQCyUTyofoxdSERDqO0gGWKfj7GWvL+00mN6RDwP8sPDpe/W3M+dWgvXh3Z675/bk65Jglb1GED5imkSS+f6wzuEBOpZn8wUdNT4WC9T/6M97V2o7eOiItkHz8M6vLm8ntlHeCfiA015Z5s8uVYOwHE4sCptF9RZNHqF1bYVUwHabbDqmR2QL4HE98/cCHQoZ8Ium23VdA5IgUyaOeITB/bYru/TfBg1w6xS+1PECsKoaaSqO9uH4d+K9Ov8om7hXbcbJvRP88LnzrrFLeRWUnVHge1YMLDwxq5hXGeN6NwSdcFy5+BR5wKqXrIDwDlooIq3eAMwUIu3B7G83YV/aNsgzYEx9DfPpVKAzeblI7tsVqLM8KGj/z+TnifXfYuxDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(23010399003)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXGWS4vKijDK8vsXq76y1nMgMDCiZHi36YS1BY25o1wAtZKBM6pqBLsRWjX/?=
 =?us-ascii?Q?O5+LcNHSI9WathbZ19/TLB+cwq/TRgjBJCisUKbQqHmcZ9617aMuEBRI2vSP?=
 =?us-ascii?Q?/jwUCfvYgtmVUjh/tTFO+CDvaJA7fVAEMluoVeO1IwVvnWizoGh3zIZ0v2Vh?=
 =?us-ascii?Q?M9yGQvy9qLbznU/nQSjxRWUSiVVjD5oWownUFqX1OxHpYDQnKFe4Mr7A/JFQ?=
 =?us-ascii?Q?49FWp6zDz6y25jXivTsbHEr+O9RD1RwWGvGcNVPccmp6diuKo5r1mxP36LfO?=
 =?us-ascii?Q?q8a8KpDU5NtqGnkI37vCthR9kDfOBpUjI6knN0BjN3KTBV3n/CssmR5Dby23?=
 =?us-ascii?Q?O+TMmLIko3K7lLIIfAjtGAIweb6aGVuw7V5FG4Vc5xnKKC2l+3eVAfRDFN73?=
 =?us-ascii?Q?oKoT1ru1OKzLdXEDFcGJA5KbEN/ZI58fE7YHtFMVYCUhPwYt6ZCmcnSQ0AX5?=
 =?us-ascii?Q?xp2ofj1SaDWRaNWasZlS6BgQluYCd+4yn4aTfdBbsRvCBGnSfivtmUELo1+I?=
 =?us-ascii?Q?2HFuKKc3sWVQLz54bMkjpIM1xxDenibFvSE+R5GL47d9J7rd7YovD/kod7BE?=
 =?us-ascii?Q?sva5z5Z/h9ZIvm6kRQIOaZVPoIAib4vck1Bx35i4k5X5kDJ0vE1zuBLXWlNS?=
 =?us-ascii?Q?u5pzbkeg5jdt1HoBUUU2QYUTa8pyaIjyoYmR/4mwLgzk1doiVS8Bsj+O12YM?=
 =?us-ascii?Q?SJIwrknuPmCggPsy4Ffi/wash5x3v6HEBRtsanbNVj+lkyvjZXPA8otv6BfM?=
 =?us-ascii?Q?s9lY8YVU6s6yjE5VLmMRcdpYWiaxC77Zl/icQfegK7uQRSb6/KK6+6gyhqx6?=
 =?us-ascii?Q?EVm27snqirq0S152G7dCUQLbKGQil4xYZ8pCMgRMJF1abLvKYVZpfUjxq7lB?=
 =?us-ascii?Q?MRVFJbMTDGyJ3U7BmGxbmK4gWExyHOgV0Q+LFpvamZ7VoHbyl0KNWpn3XaOh?=
 =?us-ascii?Q?xcGWpRDoqB4k6JMgIdNTrNsFL5UhjrpfVH7M5jtdPeAtU6k4tlgty1wka55n?=
 =?us-ascii?Q?G8fo0FJmefDuS14u91eotJjk/44xcn/zAd/gkUgxfh86gXXgS3sMuvbLFLLF?=
 =?us-ascii?Q?qpGxUILyXWq0WGvHHRW05JaUY4vLWirCoG/DstMmxhZTwawnNZrsP6+MIrhr?=
 =?us-ascii?Q?uyQaN7KxPTtaFcBZCJhMrS5Ltlrr2SDRb/s/k8nZT2OpPHRvhLWfjLTA7HSS?=
 =?us-ascii?Q?LeiFDjz5obf03vQAOwkTuxfBBJU2IvTw9TssF1c4aBtJTLLVaOScD4H8x0NP?=
 =?us-ascii?Q?ZGsskUhiOo53TCg0IbifRkxFtV+pL/bXLTHUyqui/O+22lCbB9m5kT1K9HMZ?=
 =?us-ascii?Q?FMDg22O2VzKWoaKzlH7bVw0nBiRpkDOU7BIff3LwcncJ6FO3uikxmcqnXzF+?=
 =?us-ascii?Q?kxEU0XnKkdXwCUn4SBDEbzQsOYkSD8z8Fw24nIVQcOxtjktBwOQWGfYquMqi?=
 =?us-ascii?Q?ivh3TTY2HDiaHmBgRgOv6towmzWrpZ/huoYcvz/6MHwQDmmWdaqNkCyO2OR0?=
 =?us-ascii?Q?9Cs1byVQzX1RSMh+2ditN1MS8vvuAJpPpXjQM58PT5AehmGn3MXyOlTzGQHw?=
 =?us-ascii?Q?TxsHHc1PXPxRNH4dQ8zGli0ClhXs9WJaHxip1/PXHj5sqas6/w2Al5Cgyw0a?=
 =?us-ascii?Q?Z/+kOouMMD3t7Edy1CPJHrWT5qn86J7TF6zFzYMAKZl1P4UuPQygOSFOQRUE?=
 =?us-ascii?Q?UsPepFN1PHOJnaQ+0cdVP7rBuZVwPRWzI2KObjojGnN6ISuPy9FPPj0huD1i?=
 =?us-ascii?Q?dXt5o/Zth5zn7a7ZSH0b++SWBA1KHfGEixWM+0UkirWcxDsJMiri?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df2af52-4be2-42ad-9706-08df1859d65b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 03:30:23.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZnMj/ssOGa9IsO2ICIVmJ1aanScB7MSFgwKmVsIkhiSCs1klVoA52eswtkJpBp403i5rcsx/wk+IVqDO+8lsmCr31KN86UyB0f9GEcu1V/rFP3aZ1POBkIfOSkpO+GG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_043046_145941_5AE54E9D 
X-CRM114-Status: GOOD (  14.75  )
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX EASRC hardware supports four independent conversion contexts
(A, B, C, D). The driver previously registered a single DAI with generic
stream names "ASRC-Playback" and "ASRC-Capture", which prevents
multiple independent conversion paths from being used simultaneously.

Replace the single fsl_easrc_dai instance with an array of four DAI
drivers to allow up to four independent conversion paths to be active
at the same time:

  easrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
  easrc-1 -- ASRC1-Playback / ASRC1-Capture
  easrc-2 -- ASRC2-Playback / ASRC2-Capture
  easrc-3 -- ASRC3-Playback / ASRC3-Capture

easrc-0 retains the original generic stream names to preserve backward
compatibility with existing machine drivers and board configurations.
Each DAI retains the same channel, rate and format capabilities as the
original, including IEC958 subframe support on the capture side. Update
the devm_snd_soc_register_component() call to register all four DAIs.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 112 +++++++++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index a6ac94055b17..cd22ea3e03bc 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1589,27 +1589,99 @@ static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
 	.hw_free	= fsl_easrc_hw_free,
 };
 
-static struct snd_soc_dai_driver fsl_easrc_dai = {
-	.playback = {
-		.stream_name = "ASRC-Playback",
-		.channels_min = 1,
-		.channels_max = 32,
-		.rate_min = 8000,
-		.rate_max = 768000,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_EASRC_FORMATS,
+static struct snd_soc_dai_driver fsl_easrc_dai[] = {
+	{
+		.name = "easrc-0",
+		.playback = {
+			.stream_name = "ASRC-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRC-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
 	},
-	.capture = {
-		.stream_name = "ASRC-Capture",
-		.channels_min = 1,
-		.channels_max = 32,
-		.rate_min = 8000,
-		.rate_max = 768000,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_EASRC_FORMATS |
-			   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	{
+		.name = "easrc-1",
+		.playback = {
+			.stream_name = "ASRC1-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRC1-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
+	},
+	{
+		.name = "easrc-2",
+		.playback = {
+			.stream_name = "ASRC2-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRC2-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
+	},
+	{
+		.name = "easrc-3",
+		.playback = {
+			.stream_name = "ASRC3-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRC3-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
 	},
-	.ops = &fsl_easrc_dai_ops,
 };
 
 static const struct snd_soc_component_driver fsl_easrc_component = {
@@ -2234,7 +2306,7 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	regcache_cache_only(easrc->regmap, true);
 
 	ret = devm_snd_soc_register_component(dev, &fsl_easrc_component,
-					      &fsl_easrc_dai, 1);
+					      fsl_easrc_dai, ARRAY_SIZE(fsl_easrc_dai));
 	if (ret) {
 		dev_err(dev, "failed to register ASoC DAI\n");
 		goto err_pm_disable;
-- 
2.34.1


