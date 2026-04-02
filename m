Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D942ED39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OKXeHHcF4QAyMIiBQqrBIK7KqfF9/6tx/42tSIlUDGI=; b=wz+ecSQsPmHvojVn9VT/Wgx7mG
	T2Uy1yUxTg97wTVPAukdaJ4r0/mBFNyP5fetbKekF794MaCvZkDz7n+duffS+NBUZ5Yko/2nmf+Ow
	roMYC9lESfYfre5KwAZ3jRFaYFX++I15n0AVmy+qfvJV/ZItIRIKvSPHS3ypnTA9VIyvoaDO/VZQJ
	FQCc7/uYvFdE44zUlN2qboJdjazNjmckkkfQz7cZW23mweDV+vg75RINnUv6WH8k2SmQlsYl1ds2S
	ONBduIMtu4fPaZLJHDoIVemaVAUi9Kz92w+pE0ScjVPl7LOVn6GGGXEFG4zjDQ9aqgbcH/xgnZBit
	PUT1M+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egm-0000000HIbk-0lEG;
	Thu, 02 Apr 2026 09:50:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egk-0000000HIbP-1D9g
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OKXeHHcF4QAyMIiBQqrBIK7KqfF9/6tx/42tSIlUDGI=; b=pBSfu8qv8nAIqqdJOaXRqJKVOQ
	R4YnO2NakLoq8dw5MLEgH8FYBFUv4W9isteMdRIfasHEgQ06Br4a6wgx9vP0HAgDxwMKWHavyFsSd
	IPO3NeMOZPw+jqMREhB8FKqur2MTQM5qhClkn7+zByjgWTGvKBbni5TgXvh6FKLVlcQPAvv1u5Agr
	ApMgvdqmplsbluVIbrwcsDTqTY97fuQ0aCoy+cS17xcCWIczVuwPhk0t/Tu1NeOKrummi5nxKk8e1
	mqkqijUyDlgfeCetToJQIyLMoVoxEr1MlTZfx2itJ1uw/A1kR0hz3GunQ345FqYCg7t+SNcGjpS15
	nyy7EGJg==;
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egg-00000002A9E-0z1V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMBFFjgtmbFmdtq7PGHAKVPhQWDBCKrl8/ZC/jt15K/oX/aVpNlSUhCtZmUyZP9KCZIuHY+VvAcSKvijgYxpP9xv2OUbRtXe+PXO5skSJ3ITO2sYbtvamD6L5WuLfs9st4UMgUjeKWdv4idyu+meOqCL0f9DBzXs13nobUo+jdOu/yAS2dTy3vagPY88iOSwwPstHjGvjzdglVWwMAXGF41yqUMxzaWRW0pwTpk8h92+rvi0IzJMLfgiMLKJfUUCJ8nBYPuztZokXyboNFRZR1oFnff3MuIxaylsA/EcgrtZdVUi5BGq9I6FQQrqDtI1JwqJU8GoDd8YA3hRuto1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKXeHHcF4QAyMIiBQqrBIK7KqfF9/6tx/42tSIlUDGI=;
 b=GPZwtlHI1Lr8z/egpPxxzLvC6QBoLdZ23YqL+ugdiqMRkLRE6YBWMNeGD4gVHK2B6fPE2fkecbYU+UoPUb9xeo2+ZgOg18fMdOB1zABdmG3up/8eZl4TsfFU/ZevLYcMHbKipHrNQb7vJV0RJgRRe/lDg/a6eWkSuWYTg8btU3e1UuCl9l72WdMUVg73DAKEhIA3I3/E6Phvax8yDR+4+50HxZ7ANeW3qc3HGN4XNsdfGnmAcMXERc92fM0Z5AM6vQzk5namRWS1c9twX/gkdgr5Fb89DE12Afd7rOOQskamQmlmBsw9DB4xEF9ktAkRZO4u4QCoEBM1Plk5Fm5yEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKXeHHcF4QAyMIiBQqrBIK7KqfF9/6tx/42tSIlUDGI=;
 b=aA+k6oELWa/dfFgsw7pbPFIJUNC3bTrzi9oRCXxxmzpygB9B4h/p1lT664dIMZOnWyADXbt87b9LBZb4ZPv/X0dQB0f5A6gG+tsc4m/R+XMt6pft+vIUfLL0puZxsvMD4hMyxzlhuVDI58CNmqpm2eWJfTz5biJLYMXqaj0siOhqyFAc3dGrf/Y5ZnWqrpOomxgflNw7akzhekfvEm5TBQ89X/SupXKFZo3cXFa3glOw/u3b4QPzPFvx0EabTbx1rmxLp2TIXcILO2qsmiYcZ+svMCI47iD3WfUc8tiFdPofJIRi3/51W29qdBF/lFUGctQhNnvKU2PS+NO2Bb0xLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8471.eurprd04.prod.outlook.com
 (2603:10a6:20b:416::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Thu, 2 Apr
 2026 09:50:00 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 09:49:59 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 00/13] pci-imx6: Add support for parsing the reset property in new Root Port binding
Date: Thu,  2 Apr 2026 17:50:54 +0800
Message-Id: <20260402095107.205439-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cdc46b-5260-4a51-22de-08de909d345c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info: kkuj7Mtyr775Elojx8qESheyYJ29qyEihjm5xtQbkTGPDQFmrtC7UV7cv2tD9lkhS2Bv3yR8nsUWsZRYzzNyo82Odk96waPv2CJcujYfr1iGkHFw80A/b0l2YaSnFQJ42UgSyMg79BPebFp+RjUBf8C2qWPPZ03b5GoVyUm/2xvJ4Q9sGYXbauJgPAObLlBVqt9vO7i4XanNgeJYWZZ7/+MUoOSvr3bRAbTAnwwNctOc1dB+EdOGx6XyPUOuoBJtk9v5vo771naybXM1y1bFijIIBRqfMZTLppR4zardA7JL+B30F4swlWduyjGzutJEnPuX5QE/CBC5my5/XOATMoRQAT5QilOz19FlatF1NSrn9CgPiDvRKBS6cuQ6TydO0ipU4nhcNQN6y5FWSzfOFF3ydaQkGu87jkiGfvwxukkofFSS7TO3av1JLDmT6fNBirflPp5Gpl8KXltzaWmPtHAVmkIwh+KGNEPi05tbM6OgPhAGWGFPgtxxDu1tsf6te/nnX6LUZMrrXM6fK42f34JPw7ROu/VR9omejWQCLJMAOijbDYCva+HCZ+CIs4dSk8Uw0CFHq/fC7FmH2dwh1ovPveWcVto3snJVswFsz4h8ZuH41M74YjnjxmmlEMC97wboJhs8z/Y6l+/fuwynf2jVp6YQKwf0jpnkKiokXNUnJbDxZDJHNu1RkGA+MwxCWq/RGYS1NrRrCJJr/9osE23Ap0l0U+TlOQ/9CHg8hDArszcRiY9JGbWYgIBuwmaSWUVK+0s+Re9P9J4YwCEardI6o0ZNVBb9W7B+onxRZbMoDlvcoChxwNCRlnZ6DzR5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnhCLy83ckFOK3lMU28yWllnNWZLRlozWmRDaU1iMkxiYzdDM1U0Q0s3T21J?=
 =?utf-8?B?dE1rb2k1aERoa003eEJDNEJjcW05aFppMFNxZFhVWmlCN21yWkZ6TGVzRlhO?=
 =?utf-8?B?c0tkeVFKYWpLTkk2a0F6MklUMkc5YUsyZy9uejdndlgzUmtTVXdreTdmdUdu?=
 =?utf-8?B?U0tNYXQvVGhhNzZ0VEt5QmF5MExhNkFXTHViSExMWW9BWXRRcklIMGJWVDFa?=
 =?utf-8?B?MDQ5WVB1bUVJT3lyZWptbEQybXJuYlB1d0Z5eEJia25pU3I0K2syY0dqWG1m?=
 =?utf-8?B?OExIb3ZkYkEvLzNrQU9WV2hKMm1yVGpDMkNOYVZSRGZrZXdGWXdXaDJ6Sndk?=
 =?utf-8?B?dnYzZHp2ZTZ2WE43SzJtTENVMzVJOTlZZ0xhK0NYODlNcGc4OWpNbDJOelho?=
 =?utf-8?B?OTkxbHFPRVZzRUx1aFdTZ29wWGpvQTJzbHNRd1dwdGVGU29hMjd6ZU5vUjl6?=
 =?utf-8?B?TVE4QU1OUGh6aWdUbEg0QnFWdW5Pa1N6c1dZTGl2L3c4WnBYa0QzS1B3SEFP?=
 =?utf-8?B?OWJGUXdBaHV5cDU2UEJGam1SemJEQ0NkL0VMUys2cS81dmdGRFZQb1lTTEp2?=
 =?utf-8?B?em5LRU5wNFowbzVQeW8rWTdEMDJtdGtFNGRXaTVobnZyU1g5LzVGRmFVaThN?=
 =?utf-8?B?TjYwa3Z4MHJHMitNaWs0TVYzV29hek51QXJNa0srYkIxN3o3aHI1V3ptOUpj?=
 =?utf-8?B?cURqR3BvU3FZZ2RDVUtRTGo0MU5sZllWOXA5emd2d1E3M0k3cjZFN0NGVHpl?=
 =?utf-8?B?TVk0MHpOWndienJRN210UWIyZWtVT3NDcGdHME1EanZxSitxNnI0eGNnWGJo?=
 =?utf-8?B?K0kyTU91QjZ2TlVUWXp2K0Y0UVc3N3FDT3FlT21nTkdQdEl3U3hCMlhlTXBl?=
 =?utf-8?B?ZVlWbGtvb0RqU3ZBSXVhNlBLejJoUzQ1eEdsUjlEczNnTHBMb3hYTEhKQk1u?=
 =?utf-8?B?N29ucGlwWkFwaTBoaHJPNHdBdHhBdlh5aTA5aTljOWdTNVBQZUxUcmdPemYx?=
 =?utf-8?B?V3UzK2xLMjJiTnJZSHM0Zjlxa2s1cnJlM2dnRmw1Zmt1TXF5cGNIaTFWcDBN?=
 =?utf-8?B?WllSV0UvMzgzcWNBOGgyMkdZMHVpY3haNEk5dnFQTkVtUkI2ck9rOXl6U1BX?=
 =?utf-8?B?Y2NlelM0NUp2ekNFd1RlZFptR1l6QUpnM1ROcTZIVVVUT0thdlY0bHhwaExR?=
 =?utf-8?B?U1NUamNXZ2syRjZPWWF3WkQ1WmZQNmdnS0JMSWIwM3gxOHg1MUhQdkxrRk4w?=
 =?utf-8?B?RFRWK3ZKbDJBTGxRdmtPOWJRSFgvYWd2SHVJV0Y5eUR3SlF0bHBBT1crWm1V?=
 =?utf-8?B?WEVIbmtLKzJZWStrTjBvTVNyYUQwZWE4ZkZLN3ZKUi9lM0RZOFQ3ZlN1N3VO?=
 =?utf-8?B?YlhOT3BHRHZTSXhlUEpEZ0QxamYwdWUrbUhRUTF5Q0pha1Bndzdrc3Q5ZXAx?=
 =?utf-8?B?TytwaHo4ZUxtdk1oWUg5Um5Xc3JZQjhrbEc2NG00ZEhoSjFvRGhwQUtsbWhM?=
 =?utf-8?B?M0lLTHYvOWVtMUY2WGxtUzgrK3NBTlM3MVlJWVhIV2gyVHh5ZGdHM3lsajhu?=
 =?utf-8?B?NXJWZk9kZHIzTTl0UjZxY3BxcWc5Q01VNWFXZmdHTlFuODlqblRLU0c0dXRZ?=
 =?utf-8?B?cm1NRmdHK0tqS1lFaDdkY3JncGJmYVhKbkR0a2ZoNy9rcGpPZVBSRmovMVZq?=
 =?utf-8?B?NFNFcGUyUG52cEV3dkhNY2VHQTQrV3FaRmgrYmdEVnpYVkhrNnRCeEZKT2No?=
 =?utf-8?B?QXNkRjNmd0JJVEh0eUxpTUNubk5tSGJPSU1UR3NzQ216bzJ5OTVEUE5yMFNX?=
 =?utf-8?B?NGR3TTliSHA0VU9JMGMrY0pWUTlId1dUcEZzNXdINitjcXRVcktNWE9lOENZ?=
 =?utf-8?B?Wk1MakJaN1F4R1pYVHBuMFZjVlkvYlJjVHQ5MHEvYnJYRXRpRFNtbUVSMUtF?=
 =?utf-8?B?Q3pza3E1UWtwaXN6cjFIL1I2dkFydCtnVGNCUklHdXRDMzhxNnZCS29FclY3?=
 =?utf-8?B?VEYxZzFjSnBBdTExT1FtU2I0U1ZRTEQvUDNTOFRIS3RNcFdCQ0JsbktSQ3px?=
 =?utf-8?B?bEJ1Vm42cHFrODBFaXQvdU8yVm9FTEFLU3d4V2xvZHlyR2ZQRGxVM3NSTVh5?=
 =?utf-8?B?VGhreUlBc3YxMHloYkpaR3lnL3hvZER5c3h2b2cvR3dMbDl5QnhLMFFoNlly?=
 =?utf-8?B?ZUM2ZkJsUEZlbUk3ODZUK1lYUkI5YUV6Q0Zid1dsNjBlLzQrNTR6alFjb0VT?=
 =?utf-8?B?dkkva2NqZmh0WDAwK0plVzYrSHNOeWtNR01ZemI4cmN3SXRRWlFZZXBSZXRY?=
 =?utf-8?B?Z0ZRSDU2YW1FbzUrZWhaY1NZZjQ3N3lPK2dsMnRUalMwRlAya1FCdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cdc46b-5260-4a51-22de-08de909d345c
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:49:59.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ik9TvC4MqDazsa7u7o392T7KzdfL5PxVNtJ60/EzD8CGHQ/P4Hn1VYZ1ibluIp4IuCQteJ4pWrY6iR6GMrmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105006_704072_68548459 
X-CRM114-Status: GOOD (  23.20  )
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

Note: This patch set depends on my two patches [1] and [2], which do some
cleanup work on the pci-imx6 driver. 

This patch set adds support for parsing the reset property in new Root Port
binding in pci-imx6 driver, similar to the implementation in the qcom pcie
driver[3].

Also introduce generic helper functions to parse Root Port device tree
nodes and extract common properties like reset GPIOs. This allows multiple
PCI host controller drivers to share the same parsing logic.

Define struct pci_host_port to hold common Root Port properties
(currently only reset GPIO descriptor) and add
pci_host_common_parse_ports() to parse Root Port nodes from device tree.
Also add the 'ports' list to struct pci_host_bridge for better maintain
parsed Root Port information.

The plan is to add the wake-gpio property to the root port in subsequent
patches. Also, the vpcie-supply property will be moved to the root port
node later based on the refactoring patch set for the PCI pwrctrl
framework[4]. 

The initial idea is to adopt the Manivannan’s recent PCIe M.2 KeyE
connector support patch set[5] and PCI power control framework patches[4],
and extend them to the pcie-imx6 driver. Since the new M.2/pwrctrl model is
implemented based on Root Ports and requires the pwrctrl driver to bind to
a Root Port device, we need to introduce a Root Port child node on i.MX
boards that provide an M.2 connector.

To follow a more standardized DT structure, it also makes sense to move
the reset-gpios and wake-gpios properties into the Root Port node. These
signals logically belong to the Root Port rather than the host bridge,
and placing them there aligns with the new M.2/pwrctrl model.

Regarding backward compatibility, as Frank suggested, I will not remove
the old reset-gpio property from existing DTS files to avoid function
break.

For new i.MX platforms — such as the upcoming i.MX952-evk will add
vpcie-supply, reset-gpios, and wake-gpios directly under the Root Port
node.
Therefore, driver updates are needed to support both the legacy
properties and the new standardized Root Port based layout.

[1] https://lore.kernel.org/all/20260306021247.991976-1-sherry.sun@nxp.com/
[2] https://lore.kernel.org/all/20260306030456.1032815-1-sherry.sun@nxp.com/
[3] https://lore.kernel.org/linux-pci/20250702-perst-v5-0-920b3d1f6ee1@qti.qualcomm.com/
[4] https://lore.kernel.org/linux-pci/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce903@oss.qualcomm.com/
[5] https://lore.kernel.org/linux-pci/20260112-pci-m2-e-v4-0-eff84d2c6d26@oss.qualcomm.com/

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Changes in V10:
1. Use gpiod_direction_output() instead of gpiod_set_value_cansleep() to
   ensure the reset GPIO is properly configured as output before setting
   its value in patch#5 as now the reset GPIO is obtained with
   GPIOD_ASIS flag.

Changes in V9:
1. Improve the error handling in pci_host_common_parse_ports() as Mani suggested. 
2. Move the list_empty check and the comment to imx_pcie_host_init() to make it
   clear that imx_pcie_parse_legacy_binding() is a fallback as Mani suggested.
3. Export pci_host_common_delete_ports() so that it can be called by
   imx_pcie_parse_legacy_binding().

Changes in V8:
1. Add back the cleanup function pci_host_common_delete_ports() to properly
   handles the ports list instead of simply using pci_free_resource_list().
2. Improve the patch#4 commit message.
3. Remove the irrelevant code change in patch#4.

Changes in V7:
1. Change to use GPIOD_ASIS when requesting perst gpio as Mani suggested.
   using bridge->dev.
2. Add a seperate patch to move vpcie3v3aux regulator enable from probe to
   imx_pcie_host_init() and move imx_pcie_assert_perst() before regulator and
   clock enable for pci-imx6.
3. Add device pointer parameter for pci_host_common_parse_port() instead of

Changes in V6:
1. Drop the pre-allocate pci_host_bridge struct changes in dw_pcie_host_init()
   and imx_pcie_probe().
2. Parse Root Port nodes in dw_pcie_host_init() as Frank and Mani suggested.
3. Move the imx_pcie_parse_legacy_binding() from imx_pcie_probe() to
   imx_pcie_host_init(), so that dw_pcie_host_init() parse Root Port first, if
   no Root Port nodes were parsed(indicated by empty ports list), then parse
   legacy binding.
4. Add device pointer parameter for pci_host_common_parse_ports().
5. Add NULL pointer check for reset gpio in imx_pcie_parse_legacy_binding().

Changes in V5:
1. Add the Root Port list(pci_host_port) to struct pci_host_bridge for better
   maintain parsed Root Port information.
2. Delete the pci_host_common_delete_ports() as now the Root Port list in
   pci_host_bridge can be cleared by pci_release_host_bridge_dev().
3. Change the common API pci_host_common_parse_ports() pass down struct
   pci_host_bridge *. 
4. Modify dw_pcie_host_init() to allow drivers to pre-allocate pci_host_bridge
   struct when needed.
5. Allocate bridge early in imx_pcie_probe() to parse Root Ports.

Changes in V4:
1. Add common helpers for parsing Root Port properties in pci-host-common.c in
   patch#2.
2. Call common pci_host_common_parse_ports() and pci_host_common_delete_ports()
   in pci-imx6 driver.
3. Use PCIE_T_PVPERL_MS and PCIE_RESET_CONFIG_WAIT_MS instead of magic number
   100 in patch#3 as Manivannan suggested.
4. Use "PERST#" instead of "PCIe reset" for the reset gpio lable in patch#3.

Changes in V3:
1. Improve the patch#2 commit message as Frank suggested.
2. Add Reviewed-by tag for patch#1.

Changes in V2:
1. Improve the patch#1 commit message as Frank suggested.
2. Also mark the reset-gpio-active-high property as deprecated in
   imx6q-pcie DT binding as Rob suggested.
3. The imx_pcie_delete_ports() has been moved up so that the
   imx_pcie_parse_ports() can call this helper function in error handling.
4. Keep the old reset-gpio property in the host bridge node for the
   existing dts files and add comments to avoid confusion.
---

Sherry Sun (13):
  dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
  PCI: host-generic: Add common helpers for parsing Root Port properties
  PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
  PCI: imx6: Assert PERST# before enabling regulators
  PCI: imx6: Add support for parsing the reset property in new Root Port
    binding
  arm: dts: imx6qdl: Add Root Port node and PERST property
  arm: dts: imx6sx: Add Root Port node and PERST property
  arm: dts: imx7d: Add Root Port node and PERST property
  arm64: dts: imx8mm: Add Root Port node and PERST property
  arm64: dts: imx8mp: Add Root Port node and PERST property
  arm64: dts: imx8mq: Add Root Port node and PERST property
  arm64: dts: imx8dxl/qm/qxp: Add Root Port node and PERST property
  arm64: dts: imx95: Add Root Port node and PERST property

 .../bindings/pci/fsl,imx6q-pcie.yaml          |  32 +++++
 .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |   5 +
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  11 ++
 .../arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |   5 +
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |   5 +
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi         |  11 ++
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts       |   5 +
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi          |  11 ++
 .../boot/dts/freescale/imx8-ss-hsio.dtsi      |  11 ++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |   5 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |   5 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   5 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 ++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  10 ++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  22 ++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  10 ++
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |  22 ++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   5 +
 .../boot/dts/freescale/imx95-15x15-evk.dts    |   5 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  10 ++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  22 ++++
 drivers/pci/controller/dwc/pci-imx6.c         | 119 ++++++++++++++----
 .../pci/controller/dwc/pcie-designware-host.c |   8 ++
 drivers/pci/controller/pci-host-common.c      |  77 ++++++++++++
 drivers/pci/controller/pci-host-common.h      |  16 +++
 drivers/pci/probe.c                           |   1 +
 include/linux/pci.h                           |   1 +
 28 files changed, 436 insertions(+), 25 deletions(-)

-- 
2.37.1


