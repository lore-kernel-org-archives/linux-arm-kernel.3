Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF283606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXI6XBpQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RPE+Iu2I;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mHWK57Jh;
	dkim=neutral header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=oWcs6DLs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KEq2DxjnY+eiFS4ty9JbaSg8CjIuXPQARyTcelp0Jsc=; b=rXI6XBpQrfAMeXPSw6DfLGv/TE
	Bip+g/qZF/xJBjW/7ZTxZSL7TDinG62UOey1InbWO+t3914MPDRyU+ro4EpLlI1bBqlWKCKqdjJT1
	AaQBHqPI1em2pajYoiBzUyu+DvWEeZU1p0GqoFiucIAK0CQrNxW6pYu28aVUSPKeHQwVOg92kH7bq
	pnc9BZnmikuvYygq+2mmkGIB8we+D6sFDThVCxC5J1/UVpxyQQkERAsgAkrIRttrCLJHzDq8MhUsy
	vfD3b6Mpq1yX+YizG6uPVLloH8q7uiZLSTQmGGoLDrcrPV2Q6j8kV25ExO6BXtqbAs5yKTJQf6W3y
	p19JYH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiqG-0000000BE6J-0Wxv;
	Fri, 30 Oct 2026 09:24:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiqE-0000000BE53-3dUk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 30 Oct 2026 09:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KEq2DxjnY+eiFS4ty9JbaSg8CjIuXPQARyTcelp0Jsc=; b=RPE+Iu2IovvmyN/XTxwX+7DQ5Q
	f3Dhgen8fWCUW/u4m4DOxr9u8ameVxvBS/S0pelgImYuCukijptqJQFDkrCPJCBTLvweMxipnQk27
	dU1QBVHKCCtODQ2AVaK81hKNvIk8lKwXf07hpTkp/ddhcyUHbi3MBKVT/fkXs4b9P+wnB/F858Zmr
	a4etWxkJQ93bwomyeEQuNR4HaQ7ymVQUflBth5ub2jJz76Fqr1Hih9thwC8ipSAQVwyRom88cuWp4
	IPlvInC1Su50th51CCIY1ZM2kelGW0tHQg3wVz9mt22tc1XLw+GKiH+gybcvKcY26+ovPDjairDeJ
	03uhtfwA==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiqB-00000000Avs-1uvE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:24:05 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U4G8Ve2968767;
	Fri, 30 Oct 2026 04:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KEq2DxjnY+eiFS4ty9
	JbaSg8CjIuXPQARyTcelp0Jsc=; b=mHWK57JhhBUCULbpZQH/rSniNZNenwD34p
	t2qCMU4QsVN8UTHc/VEemPplpYgeAVQBWDPpugV8ppUEau3FbLAcSAqvL5N4RxTS
	vmhmCQA02kwCNcyRF3eofs+gFm27D9xQnvY2wEHhu6mAWk0xu2cOMafRFoHSPSpy
	kUdrdk0kXfTl16fZTFeJYw9We21nSwSXkrwVfcUA5J1Hl5MxZcfqni1D5YNuv98P
	UcESZn7DNivm+HteOD7V3CW3gee5/Z/Okgpvr7P9KAYUojLs0To8QmAP55yUk+Fq
	lqIjiFJodQ81tmHRZOcgZMU9cICK4eKj182UvamTzI1kFu8YcBEQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021140.outbound.protection.outlook.com [52.101.52.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hme5ygmfy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 04:23:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI9VmtOb5byIYroq0t8hSi3yc0TQCELxRXxFiw2HtZkDUhkP4OvkIUTfpjqWVcELpV0EkYKSf6OBX7ojUoIq0Fqs2vx2LbuTfnB58NJXRKDozc6vF0923vYi9H9rHl5gh63jw0BzfamflEaS0vzZ61w5mbwLN/7l2GV3E1Dh7NwFdIowC2vxN+pTxS9M/u2I96u3zsSAXNzx8Lza5qoBWpdAqXkLBPy71Ojge4geSU6bb+NPMadpFoRjBf0Of17lWN9mp8ecoPUSiiFTGmjNWYWC5U8uD2doGVwYrVX59ZhrXqhAj2Wm8Bp+NeOu9FwJAJLqTk/MHDOxMErlu+b5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEq2DxjnY+eiFS4ty9JbaSg8CjIuXPQARyTcelp0Jsc=;
 b=gZwPBda69Zmmi+XprjGYdVZYNK4bWUBO6TTD4e8fLbIveQa3OgtSRk4VoHqEElByKpAPBcnv7VQurHOLONJq8HRKykCAyIuOb504vUNw+qj4FoANlR0SuCzy+u90tpAKuimJ8g2/AJXmHStsnOt9WHuw0PUeMwxnPp3i34maUWDXtHOJE705MO4EZx0yen8shGht2pSNt08xhaSkzns0XwxPfiTfAAnqiqAwKP1EKUM3O/8ltkmH+AcpCzK1+oT6x/dIZgoTr1RhG4DZqcKDngBwfEtb0vUW5Z6udR9wkWrQnx/zJ4Olzmm3kNgD//wf5iKezhkLnWekZjPyrFAH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arm.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEq2DxjnY+eiFS4ty9JbaSg8CjIuXPQARyTcelp0Jsc=;
 b=oWcs6DLsIWyyd+VCv2ZbRylGo2/MS8jnMMQElbdjCqy6M18pvF0hjJjflUe/QnyKyv2uUHDFJYZ1BO/nmmAc7zrpb4KaBQuGWqzA2iUB+wpe1083icEYwv7jwod/w6h94voZ/3/uKV3ozndZHVYpZFyzR1xWdoIXcd2NQI8zm8M=
Received: from CH0PR03CA0246.namprd03.prod.outlook.com (2603:10b6:610:e5::11)
 by SJ0PR19MB6891.namprd19.prod.outlook.com (2603:10b6:a03:448::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:23:32 +0000
Received: from DM3PEPF000265B8.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::b) by CH0PR03CA0246.outlook.office365.com
 (2603:10b6:610:e5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:23:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM3PEPF000265B8.mail.protection.outlook.com (10.167.23.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 09:23:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3F7DA406544;
	Fri, 30 Oct 2026 09:23:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1840F82026C;
	Fri, 30 Oct 2026 09:23:29 +0000 (UTC)
Date: Fri, 30 Oct 2026 09:23:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
Message-ID: <auRiD9uVjZ65tl/B@opensource.cirrus.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B8:EE_|SJ0PR19MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: f51dbcb2-84bf-4dec-6276-08df366776a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|61400799027|36860700016|82310400026|11063799006|56012099006|261026121527099003|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info: LcXLy83KtVHNuq7WkqmRloMi0ieBGIWlA5o/+OkDIvY+dt84K+v4mLwnB7LngPaZmAdYzumruvQe8U1RKNHrjIoKCnBn7ABxZW54rF/BG0k4GM0Fd1dsrs40G8egrO+oVuZWY/AVzy96T6wJZIxwWt4w2cKSf2xjUWn2vAMKE9kVUNFdSeYMH29wgAijWaCEH35DGmHVpbdJUdRlreYXUvpNWjQA3yTExoi7Xm3oXh7EwMU3kA5FEvgACQNE0MTLFd3JZHmWpQPvExUVpkXqCWgzn5bTXlh/h834j5Oieo121fuNPn4oH7ZgfVw0kA6nCXxR3JmT2PcgwMSDZQ4pME1f0uhAK736ZKVtLFbiKgiYsPswQrrAVoOQkovayqS0Roemu+fvGn5TwwtG+24kbhdYX0Oprw+vaK2iksFPaZTZpz9XeC/GYO2KHuIWoRjJxnURWU3d5+AoLgVLs94Bd6KZqamaHs6FneEOBfOUJe57T7gfsQeRJGE+0LPArIeDD9Rxty4kC68QpB50mMzz25XsOUkVdAPVkPKZQEeP2qjrXlwBt1G74SWIUCuA1tfhxRspCNiPv1OdGEfJ8GRUEnBCw42wL8aeEhMgb8G13vW5Zz5stbwBkq+6Hw7c9Abesx2dU98YocjiNFCe1rg5BpcjYJlBsTI0t6nELoqCO2TvGDaVeshhi9/RJ/P23bTp8yZqtYOCxBpU0n0emb/A1A==
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(61400799027)(36860700016)(82310400026)(11063799006)(56012099006)(261026121527099003)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AForpitOqDTKDs8fr3mLMaOm5gnK5l8Fg8s5+jel5/d+ephCZJZdXkC7YPCQOHVazE7ISNVsZKgXaG/GGi468+V26dhtXlGeefu2FXFyDnyCF5I95YiIqtrIq+7HtIyTwmaswssZEGh1p/68qzhYGsSIHEwp/UA4hX0oLymFPzYSHhjicUXTz0y84rfKclHuBMGZsSSPRTWWdC9d4GdM7FlycRd2wX0NwhJSyD9ry6Q9t3UfqspRG/pV0vNxPr+2xbJGJOGpf0i+uvmo+PvQLK+dunT8at+ZpKfDKbYy5Il927IsF/yEqaG9tw0bsq9zwIfTtJ/sbzMQimXM5jR7x9mmT61zZRwJXAEsG+P0cfoBrAmDtf55sp3kOGKhIma/Og1hwUo6JrdzAL8BiXMEDjxm0mehWzVYUplu5g6KqGEPBHpI9FTGIdWSqlQ4W8gz
X-Exchange-RoutingPolicyChecked: APSXMUvq3cpMuZ6zjbO+/hE1V2H9MrO5k32fd81J8A2EvF7tPvDdjQc3+WB353qosQhVPRjJdb67meKKdqKq720nT/qkWnYJU9nyezBQ6yrBZn/XueBnL0GTI8m0Dklpz2w1j7acVy3nkbV6YR62wtXArbUvK5EbCO7vOzEC2mVa4S8rCmFaSDSjZNUZU5gg/j1IFkesiTOpBMoRc322Y2i6Y2EqhQ7vDbe9Vw3qEe/00HvAo0XGVsYOS9Vb0HVgTqLGOaX/I7gWpUTXzuWV+KS3nGrJD/OzZJuyKbsR1vGTi0LDALlKYiyLZxr7UNXDHC9WQ2I+wnXYF8n9/G0MBg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:23:30.7159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51dbcb2-84bf-4dec-6276-08df366776a1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM3PEPF000265B8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6891
X-Authority-Analysis: v=2.4 cv=co8OAF4i c=1 sm=1 tr=0 ts=6ae46218 cx=c_pps
 a=gYwftH0Zntp9Uye4m1fzyA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=Z2M6g7cmp7uy892tyZQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: NSho_YCC1BK4LPvz85a8GsOzCEK6ecoo
X-Proofpoint-GUID: NSho_YCC1BK4LPvz85a8GsOzCEK6ecoo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfXyi5JhmeeSWIa
 QPPIXopRZ7RKDL088yU1pssfj2wMo490MkEygFlTSJbf3pP2xM9ef1EzurnbCs3uICquuCgLhl2
 PoLqCbtxMx0U7/Q7G6dLU3iGSkulYgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX8j9l9KnOmuTT
 3MCSUA2x6NmOuvExzA2p9LjaEvtqvnxSIiREMGVQz31MHd9a7eKK65ekU9lT1+loK/zwe9IiG7s
 dPvbDXWhFTvHvWf72KH33fxrlJ9MBThusyj54bF+wTu9jKfmBmEqvyVm3Yl2+wdIosTi80XSCF2
 i/THhhhfcYMsf+l7bwSFKP4TGxwf1Jk0MyQC9Mg6QDYtWmKHEPAArJ8wD7vX+bbGaXus+8qKVF9
 BsG2qC+Ihm4MlsdmL5OHZ93TV0eSlwScYy/aurcm/STvM69DG74pN3CXxYPdlKz+BY35YnEzhkY
 CcmnWcJrHIGQbtmIKC4oR6Ydlrw/Za426zb/AnaXF8KWRVYrX1ckO0B94dMlaqi7ZKRGRq12x5F
 SHX0coUcNLcG5xd5PTb5e3Jfdiwcxa4xhzsLEFr+64Z4tQ+J8hJLRUspA2ZCEkN3M5qKHju7eT7
 AhRYbTlcLGfw7hAFH3w==
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092403_872020_C82F2B28 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -0.7 (/)
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
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mfd/wm97xx-core.c             | 2 +-

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

