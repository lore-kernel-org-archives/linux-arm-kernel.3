Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54596E87839
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=; b=s2urr/COhWlU7AhSiAOl2Re8Rl
	mexw3Lq7SI9niq6a2G6TQn/5AruF1WNYLtU3KPYNRgiqGMCptbvaRpsTGC+3sWXUfPw1hkv5Gn7m8
	1NbrKrKZHVBUl+Jg2do7fMps8K5xKSfZ2A3INYB033wotin/8X6gpgbc2ROAOYM8HpLuAeOfwRzFY
	6968fYBtESCAvslMEBygL9HnsqPkbeGUKc5te1E/CmUYiaND6fvqgarYX9YrStkjSsEvgbmgDWlF3
	6q14aKRIVbDOVwLG/UefwKmdGWt2pIO1kkkE7IP3ocySOzZOj0jo2dUdpeFHONhuJHih4Fxl71ZIQ
	cSZUDVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHOB-00000006l5k-3mkd;
	Tue, 03 Feb 2026 14:28:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHOA-00000006l3N-0IZA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Feb 2026 14:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=; b=KCkgPJ89UnMhGoc3vEjhivJ7jk
	Yt9MNv7WtIGyt0TfD0fUQxYOUsnv3/S++SCAD5sqhQV3dhT76+Sx7QKXFw0VFSfueXM2moiSw/I2l
	nEjNP67S7wA8khadnCJfhxacs7nXxJVrAw0Lz54n+p2LoOK/bkbPoi287jvdLdOHSFZGn5miSGmVo
	qhOZH6I+cjfUZ+voD98/J5rJNlgIJU+gnvYQlbszjmg4q/AIa2E8Wnn9IV7FefJ0RRcHgNKaIw8w/
	D97AY5T4f6fLg04vNOq0AMiE8VOY/a9p3UbyT69RV9208H31HSGoEyqT86xvJ7v7niNnqmoMT8Zip
	7GbnpjdA==;
Received: from mail-francesouthazon11011043.outbound.protection.outlook.com ([40.107.130.43] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHO6-0000000GPRC-3arE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4eKW3hwuibSsfqfbspyamQd4GAOzDngkFcaA+e0iSc6dFJ+VPmoLe1zDZ1kcj0SwBj7FbAbPcHdbTaVRZfO8GDXu1iM9egGREFfU/0371H1yf9X21bpFs0MAkJ3UVeQa5LArrSO2Y5yZJxxHFfK0sxLHnsRQ0Bf6eaUE2+P27hjgPgNx5lXWeCqhsrzWtzIy5EnWJFdBWaZN4V3m41Qyfr8mWZbLzQm5CxNEyl0eVlyOdr/LrDEf2X07BwpZAYwAGb5N3011heHM3/hXBIpRwi8qOyxQLBqMHogOvhw1Wz+U7ZWxe7Lzd5g/nCAeKkCquPwJzqLdlxTbTFz4xRsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=;
 b=miSETTkh5QusaLKQm3Tmwj30wnqJJUF8p4fUMt6/p+YLhAO28joBjZsxw3LnQNbnrFhQLxuFkQmnqweXLiWknv/f82/f8xM6zRADf0gWe10kvQO+rexYV+8PVE+9FddwgVWGBsOBZdqCHzwXZQxp8cMNOpf7V7USbvkFfK9M+2/pfzeuJOIJXVoD+LUVdeVsPjcviqmjohv2jPSi2B+VBfkwcVjDcdAAYpeFthQ3Ep9/AVd5GdWNshb9BpDZig8fmkZyBbmRkeJo3qCOIFiVx6vQmSisMyrIJLwWR7yBKu1BWqHnuGsNxfozRDNtny3+ixfPf+2N9iCKJQJjfC4Umg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=;
 b=ZRlMDZQdcTuwwwqPP/zPVAxVG5Rm7Dz9FLRAhxCTtMGTXStb1nlMEZdRim1UZ8jXtvKb20/MBkHx3IWZNpKC8kM151frGDnQCmo90T4lnzFtSMGv4eNAEg6f1dkrE2ad28JFw3UGPOpspCwm5Am1uS2EAQVwxZsfSFyMLe4oshd5Dg6u7pNEdiLiCdL778xzSueO/uFg65Y0ZJ/JPd8rZXhOjkJw50sWaSrPLcKAmdBlIsKMgs+LrxEZN4PKQPqbDxijmdDJIzI8nkDhYig7l755M/JQT4UbSohHhKd/jvDZmmZa8PwxPMF0aUSzcnHnXkost1RSx2SSHHhGYrBPfA==
Received: from AS4P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::12)
 by DB4PR10MB7495.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 14:28:09 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::8) by AS4P189CA0021.outlook.office365.com
 (2603:10a6:20b:5db::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 14:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:55 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:08 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:09 +0100
Subject: [PATCH v6 3/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics h7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_uboot_properties-v6-3-0a2280e84d31@foss.st.com>
References: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
In-Reply-To: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|DB4PR10MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8722c0a1-39c7-4662-8bc9-08de6330743e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0lOV1Z5WHVWN045Z2Z2eXVnYW5kbkNHSVhWNzdvMGpPM0dLNUJXS1p3MGox?=
 =?utf-8?B?RDF3NU5SQ1c0RmZGWVgwS1NUVmwvVDQ0bStmdHZkOXF5L252MDkxalNYWWxl?=
 =?utf-8?B?SWdvSkZZWit0bXFHeWEzRTVhY1V2d0lDdTQ5NDVCc25mTkoxL1VrZEp0cUJN?=
 =?utf-8?B?aTE1N2xuL1BTdnFGN3BXTmhnTGUxMmlsbjIyT1ByM1JNUWNEem5JSmhPS21s?=
 =?utf-8?B?SWdPUzJOSDFRTDBNOEpDWjBnNzgvY2tXRllERDRQZkR4T1hFVG8zdklyTWh3?=
 =?utf-8?B?ZWVlS3ZZQ2l3ajk4a1BGdDF5K29TRUwrZkhWOHp0UDAvZjllYVZZUmI5Qjh1?=
 =?utf-8?B?U3JwRjFOMnlJOFgxMFZ5ZEZiZEl4NjFRdTBSODRlVE1KSXp0STBuT2VFNXlZ?=
 =?utf-8?B?SElnSjNPUEdaa2NTQTc4NkUvNlFmd0VtVkxvV1dEZkFzUEtUMkswenBLaEF3?=
 =?utf-8?B?akgvSTB6NFlaN2hYRk5MK2hUWDA4aEZPdTFpb1huREZNSVVqV3k3QkR4N2l5?=
 =?utf-8?B?LzJHOExQMGVwQVA1SXhQOXUyc2Z4U0E3T3JpR2h4Qy9iT1h3NTlRNE1KTFhp?=
 =?utf-8?B?TFRGRCszamc2Yy9iSVphc01oeVo4STFYVWJPN2V0QklFYVNYWEZaNC9pM2RZ?=
 =?utf-8?B?SWsrRjZOdTVhQWVoQXkrOUR5emEzaGxEUFdyRDFNZEI5VEZvTWkxdkZJblRu?=
 =?utf-8?B?NU9zOWJoTjliVnBkZ3dGblRTeDhISlkyN0t0WjVMQ01OMS9KV20vVGY2cjhZ?=
 =?utf-8?B?TThvS3dKZ1pIQmhCOU1sbGFPdGRqOVYxWU1UeUYveG93QVFYcUY0OTVJOEJV?=
 =?utf-8?B?SGNEdE1HNmJwWktZVlZJcktRM0dpcHhmUll3NkdBNnpjaDExN1ZnZUFuMERi?=
 =?utf-8?B?NzBBSjdGQ1greGx0UXBPRUhxTlBjTkk2SnhYT2oySHE1NGRTS1J6YTdtRjZM?=
 =?utf-8?B?bndFYTM1Q2orejRhWkw3TklMZWZpc2pQMEpOYVllbGw0TzJKa3c5d2hlQ0U0?=
 =?utf-8?B?SFJmSUFycVRCM1dwSDVBZlh5d3hCOWRPWDUyTHhEVDhKby9iWHJEZTFKaHRp?=
 =?utf-8?B?cEtuOHV5dGRCSHIzbUdaWjl4THlNOVU0ZjJqbWRJZjBXTWJKditCa2U5TWpx?=
 =?utf-8?B?YllteHRYMzNDbkwwRDdsN05kKytVZ21pS1dFR08rUnJvYUp0UUl3bys5Tjlj?=
 =?utf-8?B?SVJTYzNWd2pscUNBS21xamlhc3A1TkxFaHJoRU83WjJtOW8vRkZoSW1la1g3?=
 =?utf-8?B?UGVxTjlmV0UzQlpMNXVyK3FSOHRVVmFyN1dlY05ad0Nid2NtU2JXWDl0S2Zy?=
 =?utf-8?B?NXJQdFdJRTBsOVZhN2NvL0l0aFJGTVNoYnlNSzVISjNsV0I2UDdyN0ZpNEJS?=
 =?utf-8?B?K1JuYUpYbDcxTzZKRWZVdTR6c0MvYWxCT3pXdFltYTNZeWVtUHc1ai82dGxC?=
 =?utf-8?B?TUZQNjMzdHlKUUJTWUVSN0I3LzQrNkFvN3Vva1AxWUNpWkV3RFlnMFI2SWsw?=
 =?utf-8?B?TVY0Y2dadHcwaTNWelRXRkpEVVlROHUwR2RoWVVTc2k0SmVRZEIzM3JIK3dO?=
 =?utf-8?B?S2Q4bStFU3pwWU93bGZUVklxNlE0MUVxamdHVFBmOC8veU1wWEZicGwxd1pI?=
 =?utf-8?B?OVVwOCtBaHFqYnl4dy8wcEg5NlB6SE5aOW12MGJJTmhTQko5NnZTd2xlMUtx?=
 =?utf-8?B?bVR4S2hPc3R0c2VncFFNWW1WcEI0OThDT01kNTg2RzNOdEYvUWVRZStmYzZw?=
 =?utf-8?B?cmR1ZXNXcWpPeGhXb0VhbG1kVFpraVZKQlhOZ3FRQjk2cFBjalVxSXZydmdN?=
 =?utf-8?B?dkM5YXB5OWVvdmw5cU5sd2Y4aEZmcGtqSks0R2FkRXY2elU0UXVNclRFbDg3?=
 =?utf-8?B?ZUowYllaSlNqbWM2ajExVHRoVHU4RVpqbXlkN1ZCcVdzRzZ5amJKNzI5TXR6?=
 =?utf-8?B?QW1uT3pPWWlSbnQwa002SGxFQTJOWDZ4RVVsRkNVYlRqeTBnZmEzSkMwTW9F?=
 =?utf-8?B?SENEamh1SVNGd1FRN1NuMkwrN0pKYWU1MHE5K0VWNThzTzg2c3ZVaS8vYlFi?=
 =?utf-8?B?cStKTnozUEJ3QzBWcnU0d21RUDBGS0dQcTRsNUpCRU5xU0UwVEN1cmtjMU5j?=
 =?utf-8?B?Y25JZE9CWnBQTkNlOFRUVk43UWVJOTZ5eDdLRDVpanZNUE12c1d3V1NXSVQ2?=
 =?utf-8?B?ZHd2VE03cW4yRGxiakFQdTVycko1SDJDN1U3YWZ2WXFvZzJINjFTV1prOEhR?=
 =?utf-8?B?dVpnUU4vSzllaEdpRzRWTExFVHRBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dq9eZpyKxVYwhgluyRBZAGefZVWSI5ZpntX3xSQxVzQMgcRB4/8YGYycYeEqpewavB8l6/NAQ0HfW6t6nNR7EEyODy5q9Xt9sNb+lKCMRGq+xN/3u1wGHT0fM8C48RfvYghIXZAMPcsQ7dFUB7dE11IRzHFwJnpSwiFsrb3fHz91uDfkt/rEaOtTw7WLVwU2WHxhOkkOL/5n7tH8d65sZuFzRpmxHVTEz9sKv1Imda6ZUL9elmOjGI8X872bOrDCpHTUlC6XFlI4dN05x+q9jCGwPnw5ZM4juZwuGHby+WhhSSS1g4dqucrn8LMozN56avynWcoJ736z5fTPtj+51jTcGCwJwKmyKTchHFEcpUu1NDswm+4Vsh5kbg9VDZFgSaXNxGeOznJaF6dfhdM2XD1G0uC7pMTf2G9lCvFPaQsmuuw5oGUTPeL45qDzWKoZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:09.2184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8722c0a1-39c7-4662-8bc9-08de6330743e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_142819_117871_18B2BEA9 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 69 ++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 78d55b77db7c..1b4b9bc5c72d 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -107,6 +107,59 @@ u-boot {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &mac {
@@ -126,6 +179,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -138,6 +203,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index e5e10b0758ee..55674fe05431 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -124,6 +124,59 @@ adc1: adc@0 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &i2c1 {
@@ -155,6 +208,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
@@ -169,6 +234,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
index c9dcc680e26d..ef36454808d5 100644
--- a/arch/arm/boot/dts/st/stm32h747i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -104,6 +104,59 @@ u-boot {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &mac {
@@ -123,6 +176,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -136,6 +201,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 56c53e262da7..8dddc70c37a1 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -114,6 +114,15 @@ wlan_pwr: regulator-wlan {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
 };
 
 &dma1 {
@@ -124,6 +133,50 @@ &dma2 {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &mac {
 	status = "disabled";
 	pinctrl-0 = <&ethernet_rmii>;
@@ -141,6 +194,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -196,6 +261,10 @@ partition@0 {
 	};
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";

-- 
2.43.0


