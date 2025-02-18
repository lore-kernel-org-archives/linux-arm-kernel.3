Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EC0C021AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz6Z2JYzESsvZAo3Rvf0Kc31H+XHBiUesncBjE8EVHU=; b=Y++Dxzd73/I3oeS+TrsCBnzLki
	ge2pTlHhbCSUeKgdAoPLQY6XYO0mCKoO/4p/vaiu8DuaZeu7Jp4ZaS9unyyTQtjM+WDrBzhabb79W
	LAJdpbYzeny3qbrRoIHzFiAKRJoqaZGbx3JMA2spx0oW780P2ZWMvbehKD8l3TgKfqNprc4AUwSvy
	6Qs53LwL8HseL1FBUg7c1pGk7HkD9JphpAJ8DDZgq3PVzrOXjjhULsfykZVS0dj5OdvYF5sAbtyD7
	89q0/2DsSlVs3bgo3WJ6o1904655KaKQZc4UbLdz7yFAmCy+Ix6kVf4AeVMQi9wrJ9YxU8OzEq8MS
	U3iep2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVXc-0000000A4ZF-0cvG;
	Tue, 18 Feb 2025 21:54:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVEX-0000000A14t-16PK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 21:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sz6Z2JYzESsvZAo3Rvf0Kc31H+XHBiUesncBjE8EVHU=; b=chMULMPzts1e7quSa8o0KXT6zV
	yy/4XlaIQDv1dXb8X25+dfsHHZi1lpO6Y1ry4cf+DRXOFZAaWUIW7EOZw4ZZSM9ixmVmXAwRrKO9t
	GrB0BtUvsF9o7EkQ4sFroj8E36EQOy0fI2xLNnXw9IshRwZjR0Yh7hUbyD1lomf8lVHAmwJXTke/J
	ha0Zm2KfC5B4d+84OheHqmnjvUDKIkQpH3qD+3MNYEdUyqZlApIQVJVsJqUEcv/4DCv+PXufCYK+Y
	l0BAjsE4fICIJVOEkSdMRvuCYnMjkj2p/XmEVzKRJAspqA4vkkY8yi8G7A0WfD3ascEov/hwNu0Hs
	n+EpAeDg==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVET-000000023hJ-1vgb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 21:34:23 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ILMZrC027688;
	Tue, 18 Feb 2025 21:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Sz6Z2JYzESsvZAo3Rvf0Kc31H+XHBiUesncBjE8EVHU=; b=
	nMMQ9lrkOMi6aY32kGBk5I+Q6oEHFDE8nsoNpxZxvQRJVHOX26FAUMVkbSh/EpZC
	/pxmFEb/OfeXEzXlU8hq+cp+XlwVdkTaCqFPmxVa56h3hZ8+4jau+RPxwl1wp/RL
	Ja2DUQkc9swZwe/jicIMoHMFhX0lO7jVpnF4+tIvX63OxAwUY5hcBfGROq9T5OIF
	CNtJ2MXgq9rDJTVv0Shjz6QFa0qGDi65JZXfJ47ZDL6WhWhzaKFnfrkbArCNyPYp
	3Wfrl1LMXwRJ5n5i3rtBUjMgzU9zMWUKmlYAVpcQq8/eulzUzK/6PkScJNvZDHqb
	gxEagXeeZK95D4bGCqA3cQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w02yga9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 21:33:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51IJt672026248;
	Tue, 18 Feb 2025 21:33:48 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0sn3kpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 21:33:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdMwmrguJp3gwX63xj/XMU9zXSjEs9UAfSa/Z34pXAy1wrPTsrWZ2kOtWbtigANz9wbUs7Z21W86Jkb0f5c1x+XqRYlyxCVG5NH5zmxYA8xL4jmsMzLJVbxQIXVgnw4CAY9JrIFFotoeWwgqxYdzLEpCgxM9oYLq45MfVK9ntDYmF9NEXURFWicQuEh+QI6XCfSnLsbhpTvQuUlEgdE3TtDO4w68R5mj6QY+4GhZzDLKKNhIdM3SbFBbdgDMPKxZP8LkOKCH/Q6cxI71aNx8E/qd/oMle1D7N/GWwArmKBqnwt3I5F4lXWLuf4C2GLkQWaZqZQYr697do7PvjQMg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz6Z2JYzESsvZAo3Rvf0Kc31H+XHBiUesncBjE8EVHU=;
 b=Ws9EhyAeUUXQc9xjHSJYCyrLgFDncTVBdlsoCZ6ha4/Dd4cgYQZYmP+n3c5Wq8excnVeaySJShlWPh+QK0vgbD24O2lJEqAqkj1qEASCI2e7NQVIA8WfarMWDUCyGk2Ocw5od8l557OAzgf1tSgTR2nBCmf+/kt1ZCvl1nXdBU94PhyKoyuOLkQBkNUg3hE5xLANlZd74NY1q7lvgSrbTv5gCpaAv2bLWAeHTvwkgXCx39hS5jrt0oNgaoCRMsqKZMio/QgeQgMe+w3T1oYb9g3c2BUmS4I8BkLJOWPJ2I4wo3WgECW/e9usOs8Hk7YU2zP+2Z2RoQWOahDv2MriMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz6Z2JYzESsvZAo3Rvf0Kc31H+XHBiUesncBjE8EVHU=;
 b=ej23zQDOpd/7kYZ02DHlgY6dYbaVVIbrqRBesrTJ76lOprzlMKc3BDKbfzB/Ug8PV8fYbwpNtAPRZIsJ4e3zfGyG4f8zXSZA4rMll61WwDGWTBP7oe5kGxHZ8xWHfCVtyBldeWwRhzJ9DJ6dguE2kfvd75w9c9mzFaZ9GXeodWE=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA0PR10MB7275.namprd10.prod.outlook.com (2603:10b6:208:3de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 21:33:45 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%2]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 21:33:45 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, x86@kernel.org,
        pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
        lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
        mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
        maz@kernel.org, misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
        zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [PATCH v10 03/11] Kconfig: move ARCH_HAS_OPTIMIZED_POLL to arch/Kconfig
Date: Tue, 18 Feb 2025 13:33:29 -0800
Message-Id: <20250218213337.377987-4-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250218213337.377987-1-ankur.a.arora@oracle.com>
References: <20250218213337.377987-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA0PR10MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aee525e-fac3-4c34-d27c-08dd5063ec16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KtZMqa6nKCpuUo9Ydq2rWoQbx9u+3ldDO3OS+I6FuCL8lHYTdRst1Xue3Y/9?=
 =?us-ascii?Q?3IoTr9461xnzjllGgCP3wksEi6Valrzp+g2rfaVBzIxHj3CJEMxvqlFkz2rn?=
 =?us-ascii?Q?TpM325oYf/r5CIy4b9xcNOB2dEyPOPnWMsV0J9bHHCfQv6sVQNRumLEGPdz8?=
 =?us-ascii?Q?Oz+7NjnCF6u9rYjY0WZyAsWn3lAycxhqgUhPSO7oTvImh4d/a+8PKDlpEhC8?=
 =?us-ascii?Q?7TCHZSZ4uILYmqgxp1J+WtwEi7ej+zI7em4zqMLoVOist62CyIXAwr2crlXs?=
 =?us-ascii?Q?+4O4cM4tX42q2SE1R2baPZdrHIl8vsGI8roRnO+NdYSNi/xXOMxdmKSvWgxd?=
 =?us-ascii?Q?dXkzKNuEfIHM3wJLX7r7YEkk0xH8ZjM8//yr0n7OGhFn8OWrpFGNzQO5o9XI?=
 =?us-ascii?Q?WKDnO8AjKJaHCMrZ8xY/YI7OSdtmsEAEJNI9RUZpnjV3OKHKgm+vsi55SHiZ?=
 =?us-ascii?Q?r/zd7sMrWz1+8R2n2+LsIrpegOrNFCOnj26yvqXnLwgFSQPGyVUBljDbzzTi?=
 =?us-ascii?Q?3d8VvM5EF2w+X1DufuL0+twoBxRk6ITxUYbBxUSZtEiD7RZ4nYgyq0FlTKdA?=
 =?us-ascii?Q?VHBTi+67gt2lX6ChoO8vB91XM58tGHh88sv+T92rSFmBug4GhvtueVZPlmH1?=
 =?us-ascii?Q?MaG9M8Acx6cRcTsdPSVvItYz1ifbhlTWpF/BzCVy2PBdOIu3+CqBRTi7FqGG?=
 =?us-ascii?Q?sYRgyXJBPhw1wxn9O7pgvExU1wRX1zyFIrwyg775rYIIHQfnqocvkSqdAb6p?=
 =?us-ascii?Q?RVC5+jzO2JRtV+rIOoe9ma5CfFeBmzTKzUBArNlVcVO+2FSM9FPPKj8ShKbC?=
 =?us-ascii?Q?hWqUZP/U/o5a9Mb5AQ5+tt18uVFMeC3yyyFWLmFh5DfNAhq7vtXhvxkv2BqM?=
 =?us-ascii?Q?jw6xcNtjHLm5TDhQ6tZ8xWL1b6MLWcB9L9UzK6MyjoRmnURhoNBTJSPdqm2/?=
 =?us-ascii?Q?5aR8tExVl/2jmewzUk3cjznBCNVVSK6LpdaWH5nUwHIbOB9XGfYq67tfjvNE?=
 =?us-ascii?Q?DxmKWOq2MFmOvQxXxC971tktxU8DcpVAPzOQZVggwylxLl2hrDc43Ke2a/CC?=
 =?us-ascii?Q?LtTgmoXeUhQQqxTMtX4RLmyw+wNNZy50oOcgCZjXu8DOKQY4c/3wuZN844Nd?=
 =?us-ascii?Q?cl4FSWk190GKPUY8KturYRfsxtXob/EeEynq/dT2nECcf+6UnRn/KrhlPXRV?=
 =?us-ascii?Q?4H/sPHVWUauks7T4VQa4xZdh78vxwZ2FyAGnfuvcVFfLQpbKLqRAqG7OH4p/?=
 =?us-ascii?Q?Ndbm5moT3dD6kXhJ0AktBEuMkEyy6iOpdCE/mG7b5hnq4Twpt5A07xJPWP4t?=
 =?us-ascii?Q?OVV33fHDK6O7gd7xRYH8tG00PIsWy8Fp5bNqWgCKqn9ieDj/WM+bGWCqEwLm?=
 =?us-ascii?Q?LNkIADazb6ZqbBq9Z16ae+aqK/tb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vNiHdG1p5vxnLtaSdnNu74Bmr5j2kJaONfsRaRe/wfQW/jAjz4H3ZiQ9E+3R?=
 =?us-ascii?Q?c2/sikDGQvLYEXY+dOnN4xmLgtDSDzBdUq1ftmfKKkZfZjMoyD+Gk0im4KjY?=
 =?us-ascii?Q?PpsMg58AzxrujLq1LmYFTbHbLgjO1mkbJ8kYlZQtE9svA2RARvSyWgvAk5Jz?=
 =?us-ascii?Q?Geej03VFwKBMZCDsz5q2vldS7yDEXerNCVs/JYHEbmdCH6Tkk/YJXkjoZWwq?=
 =?us-ascii?Q?FyCUmMEZ0bueNVVu/lbfdFKEb9P1QtCEO6VoFsRNI1Clrlt7NzjBNS/bmjg/?=
 =?us-ascii?Q?FIPLT22zCCVZi9k3ZpNDv0/5gME2D5vMIGehJ5CQLX6NbHuK9S6LdV9cqz1q?=
 =?us-ascii?Q?XYlZ1kcWT017gsT1v3u9oMbtP5DF+2pDvohvFEwKULh8+aNhu8i2kjNJTbd3?=
 =?us-ascii?Q?i56yCdIOYqf+waDzF67wQwg1UH43e1Vvtx6wk17thUA0K06dlGii/UeBWX9g?=
 =?us-ascii?Q?KfRlns3zdE12ZvtKtWieTnOPbJC5HSb57Sh6VwYITtEOBulYo1LwjBxL8rT4?=
 =?us-ascii?Q?Nc0Hg2VhB+bFtguGZV8+050FWf+oo+gTV2uMn1kltpW2ouxCvdvQYLvx/zyp?=
 =?us-ascii?Q?t3bcZ7j2T5hfzRmjr2wAwBBZnPWFjzf6uUf6+g0oCDY+f3sBUrpmwi21fIww?=
 =?us-ascii?Q?8/qc+GaWXhSMTNt+8NVv/o1lDAnRrXqVF0bPn8R5Hp9UMhDD+4ttUEJ58NZ9?=
 =?us-ascii?Q?fIIZJl7RFZ0UoyZIDb4WKlxlI6HG0eTnUGzCZ0J7ur+mraSOyv2jVHPD6Eca?=
 =?us-ascii?Q?I1Lf1pSSJbJ5YQnUUyWB2sKhUoBhEklEaBweAqrpToPMuALKgc5aXw49bcrl?=
 =?us-ascii?Q?KSJ0jtzGMR5GECFcemaVE1WZfrE3+DWqtZdO4Hx9LxwSfGOyfZKin3U04L52?=
 =?us-ascii?Q?9DFvb4kqt7HC01O1mZbZeswwlFfowJkItlSMwPSO/oYj5B0ZIEfaAckNlA1y?=
 =?us-ascii?Q?1J8HM3RHGtvH0epZ3fnuSCB9tNLveAKNECPRxCFHzSfWJ7f7dOfvGF4nPuhx?=
 =?us-ascii?Q?twy+D5SLmcrqbHs5HlINVTBg0CUWVibN2P99AGzUQ/3Q2EBoK8VSki06xBy/?=
 =?us-ascii?Q?02wv/N6BWUtu7DhqRyWlOhKG+ouaQBpx0tWwwytRHCqhKi0/hFnMl7pW5xBP?=
 =?us-ascii?Q?Kd7tVRX8lAqy2Ti2PJXZm4qvVlE0xJYxXtYuMoxsLOCUGn0XgqdkAWpeU+KA?=
 =?us-ascii?Q?SMQIiKPMoEEmCqKsA7BpoIktbPTqf2deTJZYu0TDty56ZYqZRONjB06k6taR?=
 =?us-ascii?Q?5Yzs2bVJuOuirhgEAHnp8sLwktakn4JRVkAcEkDEqh8FDgIWZmPh2d74bE9q?=
 =?us-ascii?Q?wRiEVq8lLYpGrigx/+fYO6uihO/Tcn8PKJ8z8ZKXpH1sLVstY12tI0Tf5mbd?=
 =?us-ascii?Q?VK3rrtkPTSjPIGl5GkooZSnkaDu/r73tp/NKOLhifcYlU+sfK5eNjs06HL46?=
 =?us-ascii?Q?t8e3sI0PcivQN/THyI1B8sG0cnnXBJuXLK2aW4YWeYDFkS5cSSkRnh+TiKj9?=
 =?us-ascii?Q?JtaOKyx/fBkX4shMVCZLorUAuQBGGsJngfWsJpOrIUoR9Z/ZS/eHDxHh1hdR?=
 =?us-ascii?Q?8RnYCmnKHDS++7sM100+YxuuAd4mGQR74VgMx0P8oR8DDjamKeW+ovJSFjrk?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IoYOQABMkfAhZxAsrC2cGz6g2LOSK8lNouENekT/G1gbsQPBbcW9pAs3XqbrpoLsrp+ia3++ndTw81yNnt4DBBHOsjUaFvd5U9cxIrxC6ypMBrLTzTCbn354sJCtog7PgWQkUXw/n89skxPnopqBWyzmIULmnLBtl+i4aqWXudy3FtnJflpiN5QhrV7sZkBBT+1Kc5eTgz2YUGNyqG08jxky/tF4FnxorfbwUyPS4v2isQGiFHMEQW/SYV8LhB4uIBdsP9joSsYlMFG6JyGAq3v5HlN/p8ErdUZpP/pxEAUqyVGs9rkE8xqWhyfGqA9cfQC/GTbU7FCFGKFgDHxJPa+UD9wxOV0585cUxzfMkknX8K+MIT3d51GRyh5BEGlaqir4MwrVieWHs69vmNlsgwZmioXB9RMn+lgbk95u8sCOCgtQrgEFTgc1dtsmz1PyN6iVlyKfMlLi/NQaPQG1hoGzfcrM18HNLhcXXWVK9LgVuokjx8VF5pH4K4160fQXFA9L7LOpU/mDqWslUjkdyXEqcG2wMghTqtF7Ze+1yBKZHmkv03GM3g2y6T7QRyO3KLuMjMvgTCs33Z7OAc9+/C3Rr42RcJogGkENYMabdp4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aee525e-fac3-4c34-d27c-08dd5063ec16
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 21:33:45.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93R9OI1jJn8jcMjHRL9bVMOJ2f6FCMh9WkbrYhl/C7HuAKA+MSX8vQYpCwQ0tg58rZ8x4x+v1GBejK2s2wUt63Rj6XF7I4VtuYm4NJ74QLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_10,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502180140
X-Proofpoint-ORIG-GUID: a4cPHB69-aWipORLx-mfpM7687o_Q1cd
X-Proofpoint-GUID: a4cPHB69-aWipORLx-mfpM7687o_Q1cd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_213422_120949_036D411C 
X-CRM114-Status: GOOD (  13.20  )
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

From: Joao Martins <joao.m.martins@oracle.com>

ARCH_HAS_OPTIMIZED_POLL gates selection of polling while idle in
poll_idle(). Move the configuration option to arch/Kconfig to allow
non-x86 architectures to select it.

Note that ARCH_HAS_OPTIMIZED_POLL should probably be exclusive with
GENERIC_IDLE_POLL_SETUP (which controls the generic polling logic in
cpu_idle_poll()). However, that would remove boot options
(hlt=, nohlt=). So, leave it untouched for now.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/Kconfig     | 3 +++
 arch/x86/Kconfig | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 6682b2a53e34..fe3ecbf2d578 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -274,6 +274,9 @@ config HAVE_ARCH_TRACEHOOK
 config HAVE_DMA_CONTIGUOUS
 	bool
 
+config ARCH_HAS_OPTIMIZED_POLL
+	bool
+
 config GENERIC_SMP_IDLE_THREAD
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d5f483957d45..e826b990fe50 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -142,6 +142,7 @@ config X86
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE
+	select ARCH_HAS_OPTIMIZED_POLL
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
@@ -381,9 +382,6 @@ config ARCH_MAY_HAVE_PC_FDC
 config GENERIC_CALIBRATE_DELAY
 	def_bool y
 
-config ARCH_HAS_OPTIMIZED_POLL
-	def_bool y
-
 config ARCH_HIBERNATION_POSSIBLE
 	def_bool y
 
-- 
2.43.5


