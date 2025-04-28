Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B62C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bY1ywG66RL+G3pt9cSKNzcJKCBSE/dlplhs73FFSD4g=; b=CuSyQSUht4n0e/+NasAS4pJ4uj
	t1IiIoeYhVsLxdpSZQaC/nbmu2ZQFoHYIEU08C3Jv9GPLumkfttd+HOXSXogyfsdUALaNfByRECBc
	JtkQ7WN4eSw3Pst4VUWap0DyLAVDXyIdb8lqbOfaiwvtewrVkNHbfptdXf4hYgF1RSPATRcWG8BvS
	tchVH9/sHv150sbbfKyKlPD4AXs5SdQJgCQrbngXQbpqFYP8q5R/nDLQmzHe98gjg/fwUpWT2M0Sy
	1fvJV5SXAf9JDei57bbwaLlNMu6wGKSYKllbBPY1sGrR9/ZiDGByG2xoBuisywBS8Eg47SXERvhSo
	/bPS70FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9L3n-00000005hep-1r8G;
	Mon, 28 Apr 2025 09:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jof-00000005QTv-46kX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 08:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bY1ywG66RL+G3pt9cSKNzcJKCBSE/dlplhs73FFSD4g=; b=ScmNmJ+H+XsolVt16KSEamEDIF
	+FmUicIA+XYK7JRLRTQ5CbSoRbOcJa04a3VBm2RancOQCzPvuvsaYijeGPzwPvYmXtu1wbbpdDl/2
	T2+/GljWLFA0xiFOkoyjdtWWu+k2EB4mRSnWUEDrnl1rn/CA8MG85t1AKJMTaVy+D2UURIdL4qFJF
	wMXKeGbwr/pSOzsNZScgx5kceEvS7nIjxiHLA0vZAbjPPjSj3UYvpggDQI7A6MJuMWL1Qh28a280V
	qKwWbP8D8o3AV+KdzhTeg9ZtQZ7DGi56x9k3afZj4OGELYtnF0vKwGN7GLSlihaphMMrXjkO97kcU
	ZzfUmRkg==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Joc-0000000CbB5-2CLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:26:16 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8N7wD027084;
	Mon, 28 Apr 2025 08:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=bY1ywG66RL+G3pt9cS
	KNzcJKCBSE/dlplhs73FFSD4g=; b=hYE+o1xmTfawwHJPPBJ6i21R8WyVszfkNa
	FqzzJzkjiGfLYOxyHvygFI4kmacFMA01UqwXDBwmZSumCnKSGCirY7WuNvXm0t8p
	/47+GVXt4fbW11zVOygeoSEZ2zCyi7Q5l0Dw79uTUAr+EctDI0K90pakLmyFvN0M
	oXspwvpiY6Tb7waCjJRYH2XgUF6jvlkdkEHnws0e7jGc4DqsfB+nlyguepe40n3V
	JFEVnMuVe+ZWt94zAr+VW7uNlyoLQGvu2G/tG/xRaMTM3f4KizDSFr/5qkDyUICZ
	/Bdd/pr/l2owultMHcwdYjpzFDwAnNoXxyYhRSnTB0tbJqVR5/0g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46a64300f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 08:25:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8AtDH026567;
	Mon, 28 Apr 2025 08:25:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxebv4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 08:25:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUZ+qv/y9jHiwlqJM8S/0v66hvHhjX/j3KeP2ERxt49O5Ajr+89E+zjBEjskcj3KPD3xTQIfy1oFcATFL7qRpxsjLinNCONIHxMSkmBxwAgqAJXX+9ynydPMwFjPM5KH2VE/sYvDyQhM21tKv4gkPfEGJRG5xv+9N6whUJSIPJvRy5ro2ZrqSSFZDYnHSIjm7qLLk2IUlKkHLTJ8P5vTiSFtkwXDD2xFW2vfKRtjlaMg47emtZjyX9iAd9rQUMVGjFr1Ja4+w66iMXdILWYQop+P0EkDi9QHj1hZd8O6b2Hp5q44h3ImyPCmMEZ4iIUX/GkyXKjwcDgk9esgivLjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY1ywG66RL+G3pt9cSKNzcJKCBSE/dlplhs73FFSD4g=;
 b=ISYTSnXPE9iPiaz06DnV3gKJiATpWsQoPkAZKD6GnARgVATpEn9TjwxtLpFgbKxbGJf4FyKOUK0ubxwlP3yjuNvFISfySPi1D5ml5g0QhU/Tw/7h3+K9PUjGe1IrgBwV6Fv0uyJ5FC6MkUUFYLotCiSE72Pm9evfURaLaAExDR4IziHWR8Y6S6C9pybWXG0UfA8K3NWF6p67NL2s19mvUMnl5kWRwkVmTLlN8zb2Gm0NFhtVWefGpLg+fntmtoovGLemm/X/PADHcF6trga3dlDrvczuJhJ6N/YoQD1vJIBGtQqFAYv3/4YSPUydEI3FQgunKxd9Y4F/KKlxTC28MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY1ywG66RL+G3pt9cSKNzcJKCBSE/dlplhs73FFSD4g=;
 b=m0dWl6UPSslAR7IwteyQWsG/De1pXz/JrO10aeftVbm32FE59GMKEYWzFKMG8g+DSQHgZxHO2b7Mb9gYve1bsLwUCJB2ifIRWHJdRN9LqXoQOVHPyF+3m0Q5XZ6jWKqrIDlW+FnWQpL+l9Tf1LO4cAjZBBYRYBbf+eIld2ppfQo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4346.namprd10.prod.outlook.com (2603:10b6:5:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 28 Apr
 2025 08:25:40 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:25:40 +0000
Date: Mon, 28 Apr 2025 09:25:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>,
        "Sauerwein, David" <dssauerw@amazon.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-ID: <afc4052d-8e0c-4875-b1fe-a68d3f92f589@lucifer.local>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-8-dwmw2@infradead.org>
 <e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
 <20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
 <ac77c07ecda8805a5f942f5c71b3a2ef0f9183ce.camel@infradead.org>
 <20250427160746.13040000164752386b936be8@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427160746.13040000164752386b936be8@linux-foundation.org>
X-ClientProxiedBy: LO4P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: fc800572-97ed-4031-88cb-08dd862e42a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TAvq9Af/QBYnh18GEe48+e/Jlq7dpXZmvu8WjSdAljG1FTthQ5GVcovQE2eE?=
 =?us-ascii?Q?G16wZyTXDmHOYsBGCubvBdTZLwwoeamgbcSYdVDaevOiSHvNZHO8PpQfEeFD?=
 =?us-ascii?Q?jconKe+9eVzp1sezR1iSdDycNSq/gcVJq4GaMVSBhZbQWaGO2ekXjxUmvVb3?=
 =?us-ascii?Q?VKUYZ/euYf6kQGz2YKihJA0yepQUG42gp+I4duSKGe1S68uNQoT/cotsiQln?=
 =?us-ascii?Q?v0yH4oru8kwimABcYxNic6FmrWcNmvWE89P0UG6jcvm34tjPGhbeyLToM58w?=
 =?us-ascii?Q?XNRy1yL9KHjBvQnQsC706odM8QLbrFLtYuQcZIJ3ePalND9dM2vpNhk0EyLS?=
 =?us-ascii?Q?CSCLNxPh65D8rbZA3HnFmvkqPG2xscMegvv1zhmTHAUj3uXnqg3BrHB57+z8?=
 =?us-ascii?Q?EU5BSYmwYS+Hooqk/kdWtpFZPofSOHqLLxad51DSH9f/RkTsTnehvz1rWwdC?=
 =?us-ascii?Q?VhXzZGcXhJFwTuw46zJZaH7y2Czm57nmzGj3QdG+qatqtOn1+J378nSBh1h2?=
 =?us-ascii?Q?9tPEqzmCVskGtehf4Gq4vcUw5XT8PZ1un0y4oOpHhtVABCDArN6NT9hFMTAU?=
 =?us-ascii?Q?dafqkgp4taEowTrGMWZCLzhwvZLbPjSAAqDbIOBVDkyB+Lyug/nn5BMGN+Mw?=
 =?us-ascii?Q?w6zldMUlS5kj2g51McGCcTNWJCaPTU2ocnd8Jlkl6Gyxr865TSgAeZinq7sM?=
 =?us-ascii?Q?bmZlsT1TSrT6YQbamfXA5NKX6Sd5NivgG1QANhJNMW5BrBEKa0lKkDaElEc5?=
 =?us-ascii?Q?oHhRydqGSgt08e3kEqo4RenLp9CAy67lAOj67u5sTPFxqoVWohR+kKpdW9Yu?=
 =?us-ascii?Q?S0gWOqTY2cqip4tqz/MyTgXOsxlhUZvlRyMsl5NHxfrFaSKRlHFRULc11zIT?=
 =?us-ascii?Q?cUv63cEJXCtyeOkmyPgtlBbkVyRtCzmgEtMU9b6Qfg7vXv37A33TJCVuGyEB?=
 =?us-ascii?Q?ECAGwl4G+E46REWABiKdWSP4qu6widgVCw64SqFYFpIe/hxfOmdL7bhgScre?=
 =?us-ascii?Q?hp4qB8JStcyYtprnJ1yNpWYY/b8iMsYmp4OKGBMD4kQXlc2OjHREI9e31k1c?=
 =?us-ascii?Q?IKFuTUZlqhjWpw8FZwDky9JUFKO0rr8eddz5UjqxKrV/Tg0ydqflFxD8VDjf?=
 =?us-ascii?Q?xttMtKUdPVrMGlDovI427v2D1P9pPRbwqB6RJcYtzr+kpdLj5dbTeFwj4sqM?=
 =?us-ascii?Q?NuoGf0rXnCxmEdLfseb4pdxlXxO737aQhgV1fZYZTbNgjNLClwyQlMwTP6XI?=
 =?us-ascii?Q?Im8wz1rCxNhwTmkaz4ore5fXM1aW1JR4VpJGyqBX/xZNksnkWPwGKdjF9yd1?=
 =?us-ascii?Q?bBOmHACr6PBGA5slrYIYmZz+4+t/5gLYLIetOBuzTKZ7qw47iDhKeUzzDwm6?=
 =?us-ascii?Q?Bz7vCpQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cSwANuI0TXjkPI4OAsfAg2SU41ZR/mxV5hgP6RoYpqxueQgkVLNOGGXM99Qa?=
 =?us-ascii?Q?1F4gsJ1F9BcBh3WVafEBrRN4hdUrjCbeGCiDqPNSa2nToqjfP7AfE4qefWvC?=
 =?us-ascii?Q?9mNDI7cbeVqn8fGfCihCNGdYlRc3U4975z8wy60CXCJbc2qa0VrqsdjssVqi?=
 =?us-ascii?Q?lGKP9AZT9hzHELnK+h3UkYBBDSjN/8vxE62pIvRIRhGrAPNw5OShtmk+OCnk?=
 =?us-ascii?Q?rcuAQzm3MIU80hjEcxY3owMhs3jlbN9xJZvMS3OT25sAYMijMMwCVRka9t9P?=
 =?us-ascii?Q?URY6ewo+o0OtO92tzD8ENL1usHhni1/R2QiukHZ+h8/fCmd5oDzuEY7EmnrE?=
 =?us-ascii?Q?z8k2jLDL2NaU7QeMDm3SEEJWvt9kEqkl7nriBvHkfzcJmySdkAeUsm/fpeM1?=
 =?us-ascii?Q?bw/BAuWZroZsomSllGM5OLlmffL4ttB9wesOj0cFiid1M1QqNyyzR7PaS001?=
 =?us-ascii?Q?fs8eRVcMvRN4JH+ZHyqY0DllIc0O5fq/WoRXxeEvXur1TLALSCSpmZuOXXrj?=
 =?us-ascii?Q?Hh9ilN4/KZUgTysJKS/MddEkUDKzbzwyLpKSLuDjwvhPaWx6ErMedVCKJyad?=
 =?us-ascii?Q?poKOR7LpMP7R9mYM07gqkX5kvPBAewPPNY+V3o5b5tDiR7nlvM1bS7qvAwk1?=
 =?us-ascii?Q?oJA9krKt+cmXsIPPmdY9HmNbNg/E+KWp3zrB06ieatrHN1LpJsAGtxlZjJ+a?=
 =?us-ascii?Q?CVw3Gt0G2C6f+pJMg+M0gd9s0IZ9krdgnaPYzAzTnHVm+yyh7PrTEnyTAQF9?=
 =?us-ascii?Q?o8tFtnmKv9u5MVdHWUdCPH7+ESK4g2sERvpEYJmWiEYeJtg9aYl0NCOTeYYc?=
 =?us-ascii?Q?OIp8Y42hHY85hmtEULkIpYopodZlePetn4OGevT2xXf7lyYCVEv6Y1+dZ4qK?=
 =?us-ascii?Q?F/eyEvwpdb2HmCJoLuSGaj8j4rvjHFzjdPRoH9+yKO8sDynw9yw3eZ3XaVHq?=
 =?us-ascii?Q?JQ2wwhIFqHs7kPN49qMrhCt6J1DONAF3XBPEIofHzjuWcDtAw/oxQU/PZb+U?=
 =?us-ascii?Q?1qMcVVmS5m7PZIOW1Aht/OU5dND8kouowDqfgcYmba8g2T+FRAoQ9ZLdNZsJ?=
 =?us-ascii?Q?4B9RomrLSoByG3hOVBJLuDdU4S5WX5gQ+Aw8MJMxEy3+XT2waraVHAA5bid9?=
 =?us-ascii?Q?vuUUYjFQOW/JMl+9mR1cMSPucpzPfIToIpKKQZboAXwmFEzip3wFd+2YyCdb?=
 =?us-ascii?Q?bOn86JsJ6U280g83I6tOFG+6Z0VzKRrvSyqI0dAHY1P6zNIvKF4mrk0Udhad?=
 =?us-ascii?Q?2D62RUP2c66INwvxMSfHCAnbWFLUcxacUrXzvM5dsK7JjW26Y+artK2tJXgx?=
 =?us-ascii?Q?vLwZPBfjGrFu+qb227NsA2Tm/k72rqJvPPgG3nabTRb1+aBhUJ2U4k5c28Xm?=
 =?us-ascii?Q?Em/JQDUwcj7n2lBvU994KJcffSZvgYd0QV/ZfD0R+kkBAz/HFqFG8bJ4jPhX?=
 =?us-ascii?Q?I8zqII0PLbAg2RmWZ1UPiIZOgpEndQUZkzkpXeifolKUuWEv/2jQF+zwbkXs?=
 =?us-ascii?Q?+g3QMo1/MqFu728jLgvJzBqSt9+G+3rrtNzflzOVoKXl3K4IvyEfGhB+8aXK?=
 =?us-ascii?Q?z3/1T1CEgdmMnrm/eQSzEuddZMXPjoPPheFRP7esoUtzgaFZqNT0JRFxe1PT?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: C3U+Ql/IPEuSP8rZTmMZ2/LwCT0MSFcT8JmKdLDnT2Gtdv2U6mFgRV1ktbgfMNTWSvVxcnvw0ckJ2xfCK+IUp1dRMs4LpjfMsQIY8YBVe3hRsz7U8WS3Q+trwpUEINO0L6PjAVTYpK/4cYkeah26oYmj41W9grp4gOfr7IOAGFbVadnEpdm/xh452o3Ga3Xen7CGDcvYiu4LrEjx09MkJHTM3a+8Ug3bbQUPjEgzj67tdWZp8T+iuycyMV74ZRAvvUZSR/QM890hxEpVk67f7ZwTFJTGvwHUX0uHyARSOjirCf2ldo2HQGcDqZvFHGdDzRhJtiJceWziFjFnA8QZylqVn9oaZUoD8uDDPWD3umyT11clloQbiV/2wP7ufhdaGPjIkcXZ1c6Nffb3KtYBcyBj7XAUowDuWClYobdaaaBvWbcmWs2AHG37w4cmF+8PRni5WV/wzA1ipZFTA9ZcySK+f6J/X8ZNwDq/YJWV1MvKYhCZrDDzV3IQcEoOpLMD2al1Xj1xgjAsHh1y9JMl1wYWnC6jiYgDTCKct8S+LHuwIN29Z8/4ptuTyfan2wOJa6LIz75mxQ+4Yk/aOxEYPa2eYXgvVkf1/3QrVOYueYM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc800572-97ed-4031-88cb-08dd862e42a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 08:25:40.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3/YJfOEsfNGB4m7d/x2ZjQHenDynFApM+bANGGgu64B4R7gtqAgQM657wf/zCNaw44kCzoRJ2A8Ml8dMd7vH2aM8tFRtwe/7sPpBjK7F34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4346
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA2OCBTYWx0ZWRfX2UAWGK8ccMww q5a1szPBIpwIlHw27VWTVMgjsynzZsF+/5n3GDgHUWt7PDRqMtqMbbbyO6HtThXVEpwqgvvCbK2 lUIhYBrxtmqCsjwdj1l+6q+3pOyOfdnxPZTGGdA+tMLjbnt6Q/E3EGXt6ejEwd3IoM1YFpOMMrt
 9aRUhc/kvpyX/cMaK7CecKrL5dM4vCbhoN6ZzYpEOV2hDDIG3CSK5hyu7SI4Xzxjb9WuUB8OH5b 3uR1LN6UUMu/8KqXDK8rt5kDe76J5cE7DnMO3+4N+kTohUK/3GQpaufF50FdKsUOA7nQDOjuj/W y/i60E8zbw9WS1tqTNEd70v7gJdMGrCqBTfr8YGyddpaQLpmK0xG8C3FOK/xwyXNfHgp0fIIUVM CeI6FzK+
X-Proofpoint-ORIG-GUID: y1VNO498SFmkcQGXBxBFG5-0spv8hQQG
X-Proofpoint-GUID: y1VNO498SFmkcQGXBxBFG5-0spv8hQQG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092614_901699_011326B9 
X-CRM114-Status: GOOD (  30.80  )
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

This fixes the issues for me thanks David + thanks Andrew for taking so
quick! :)

I know you're probably rebasing this Andrew so maybe not so useful, but
fwiw wrt the reported issue:

Tested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

On Sun, Apr 27, 2025 at 04:07:46PM -0700, Andrew Morton wrote:
> On Sat, 26 Apr 2025 09:30:50 +0100 David Woodhouse <dwmw2@infradead.org> wrote:
>
> > On Fri, 2025-04-25 at 16:38 -0700, Andrew Morton wrote:
> > > On Fri, 25 Apr 2025 17:11:10 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > > Andrew - can we drop this from mm-new? It's breaking it.
> > >
> > > I almost did, but David seems to have a fix.
> > >
> > > --- a/include/linux/mmzone.h~mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix
> >
> > The symptoms only manifested when it got used in
> > init_unavailable_range() but that's actually a fix for the sparsemem
> > implementation of for_each_valid_pfn(), as David H surmised.
> >
> > Please could the fix be folded into
> > mm-implement-for_each_valid_pfn-for-config_sparsemem.patch ?
>
> yep, that's why I named the patch file
> "mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix.patch".
> To tell myself to fold it into
> mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range.patch.
>
> > This is what it should look like with the fix:
> > https://git.infradead.org/?p=users/dwmw2/linux.git;a=commitdiff;h=55bebbb093
>
> We're good.
>
> > If you want to keep the fix separate, then that's the patch that it
> > fixes. Do you want a commit message? I'll certainly give you a proper
> > SoB:
> >
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>
> I already unauthorisedly added that so I don't get grumpygrams from
> Stephen ;)
>
> > Happy to resend the fixed series if it helps; it looks like you've
> > already basically sorted it though?
>
> THanks, it doesn't appear necessary at this time.

