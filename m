Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JAj64ryV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ni+CfVrV5EAINJXBPy7UDKr3UD6DUbF6aBcKCi8Dt2w=; b=JAj64ryVW7FC2J
	VhQpHuf1mfp0ARjYxhVCPq6/1h2b1JW/xNYTO4iQYkFPw/0/kWNx5yLtOxsJI38mAr9f/fLX5BEJm
	vo9zE0LoBHnFGveJ4VmZYyhj8+Mig/1fuPECf45s03Z8iXvGTl1Ng8I0okX9K4H0VcTdr6P3qjCdr
	M2W2JRQUY7mqf9J08elE6WbIPQ9q9/EqSLTE+VVn/hB7yG1ubY0BRFZwZvT8OUYUaMDU6sFrteLq9
	z0yJV2Tvlr8TdJX1HiPhB6iAeVr2P4eLdgjVZeyczwwgiwXF/T6hZhC4h0GtIMYvFBOzgBULxSQZp
	VNZMjWIrGXhglKpsTLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPF8W-0000000BX2U-3iOJ;
	Fri, 06 Nov 2026 08:17:24 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPF8T-0000000BX1p-2vRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWuRAohTbzEjj+PgTKKJzHbSIdYqTi9A9IJaEEBE4PlsIHxMBC59AJLJUa9MIpMLfWgaBvi36g+UScR2Zpl0csLMVju8ub1AV1XwrY3xv3gYdcfFCYiS0Ep53D0QUIFrnNCwfNUXEmLayiHmArFUMzDBRWn1odJIvTGTbDnxXrD3FiKY3/TI14aUSyzs5rV++/Q7AReJYN97K+Nv7KVYXmnKVUtc7nRNa1jwtSwhXwyp3nYyuhVF3RZTAam0mwvfncgyUs/5nzbut3W5LNrovj9GJMb+JghAY4RxaEjfZK42CFGA3NXx3OK1a5482afAl+/IXnMwtDZnBhFpaD2rlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni+CfVrV5EAINJXBPy7UDKr3UD6DUbF6aBcKCi8Dt2w=;
 b=m73RiscCXQaBWPbN5Y8vB4+B89nMNvcb4bJFicN/SMqJDnT7+NPKFnAYJL8zu1CGtpb/ZFm7rmAmfQlld/eO+nhM3Id38H/RdJvA7AOFPt4xiUnE+iESO5vmZcjdzqphzh5ioO4U1Cri5aqtcssIpHP2oTacfYRed/p55STbQKMtr0bsvPGVuQDLjOf7tXFRR1SldJvxE+bYZIHK6YT/eQop7qxx+A+1xdRAl0cFCBUQvPjT1oOXDI9MbtDM9ieFjWTes+9y90zP/z4lUWKezLBvLkjBeO+gBnXewkvFz2NGxRHOTwh8si9HVfxhIdGOqChSCdTCvSlooZOq2S2Lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::11) by TY1PPF19F8E0514.apcprd06.prod.outlook.com
 (2603:1096:408::908) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 08:17:13 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:990:56:cafe::b) by JH0PR01CA0002.outlook.office365.com
 (2603:1096:990:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 08:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 08:17:11 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CCB8F4102E60;
	Fri,  6 Nov 2026 16:17:09 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Fri,  6 Nov 2026 16:17:09 +0800
Message-ID: <20261106081709.1004397-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <91d67c5d-d125-4834-b0c4-742951c59af8@kernel.org>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com> <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org> <20261106055050.948470-1-hongliang.yang@cixtech.com> <8ffdf2f9-dd67-419f-83af-8dd4206d54de@kernel.org> <20261106072849.985274-1-hongliang.yang@cixtech.com> <91d67c5d-d125-4834-b0c4-742951c59af8@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TY1PPF19F8E0514:EE_
X-MS-Office365-Filtering-Correlation-Id: 477cdb02-153e-4ffc-581e-08df3bde5bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|4143699003|56012099006|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: q7J2hEVt8jxIhPcY4QeRyv2AZh/4yM0hpCM9BpmwIBX20ps4pxBJ5OjAeyYnz7XFJuB9FFz0dVhUVbrYk6wvSvxMExSTsH3Z+gbdgcDRC/VxpErckJZ/4oUUuGbbc++c0zMTuZjCewqn6NHcLYO3MjXE26EibH5ql3wg31HyQlr3Su6ZNjxyqt7VvOkDvLGgskZc0S7AtIYsX8hZF2vkPupwlSFCBl4cveAthu6U7oUCIEx3aOMdkc2JEZwdft9T24+dMgy2CQ6ASCJq/6aMu45lTtYExnE5PUzlKtm13cAPdqe5jPo3QtT56pfm3/2tFCZmgfzPGpzZiIPsP7nmoK/8v+Dx6Y3TK8f5QTmzN7bm59yQFLkCbKem5+BJd+nf7KLcKG7Ic1AZcI/cgH+5zEIcFSBzpQ3abz4N15Y+Iffv2fA4SWehmENEZRAXnKto63OUG6A27eEAbJdxo5M5oBXroOreETj6pCdS7ITbF6PsPSCwpPFF0+Q01BEj2zdzQEIPvnZ6E52UVzxgu4Cexw7uBJe90Xxk5h3vZcWvegR664YwjiuohbUpurKVA/A6NqTkCRUaXCZGxf6hvkKCMgcC2LNxaI57pQTXSHEtIkwdCXrM8pSSFieMj6U/TW2nh8jEZPVBhqxizPLpi/NGWR9RSDmvkYktbMbkTocfB9pTjuD5E+ktVa3WSCsqJAZK
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(4143699003)(56012099006)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V3BHb0I6FZ+jDeF7iWZU26+pa848wmwjoHqkCPgLfMmE/ifAWb75q7DuDzjYet5ksyWiCIk7t8qsI8Icjw7M4RWKz75a+dKmiB38xsjnFIWbl8WUmg3CxF4DfxBa+LhEDcvKMPNyEVcmoW6fvDFbp/BHVoGpDieTagsAv2hYgAoxdi45tAwE5osLdz9CckPsCqTwgh9XlFqUuJz726AfulxTxsObi1rQpbEeVkgrHBSVcHx8+at8XAiIJlKIg8owMcjUVAWuQt/uFpLfIagswoHabczOPMmkLcDWfG909WUzdpjzRBE8EaK6dm2X44flFd2I6xyAxWOsrgvpHCALGZnv40JO6CvblH7aUmdA4dpXBTFEdGpCbmrPB4dYHryWji5LUQUk8/3Bdm/z4+VdrBlovxlHLgHeZIEibghXK2PiFzkCRSTM8CcBkwDzNT85
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:17:11.2555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 477cdb02-153e-4ffc-581e-08df3bde5bc3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF19F8E0514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_001721_738106_707094BD 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 08:39, Krzysztof Kozlowski wrote:
> You still combine USB with other subsystem. Identify subsystems here,
> please.
> 1. USB
> 2. SoC, no?
> DTS cannot be placed here.

Yes:
1. USB - the binding and the glue driver.
2. SoC - the arm64 device tree.

You are right, the dts does not belong in a USB series. v7 will be the
two USB patches only:

  dt-bindings: usb: Add CIX Sky1 USBSSP controller
  usb: cdns3: Add CIX Sky1 glue driver

and the arm64 dts will be sent separately once the binding is accepted,
so that it is not mixed into this series and does not hold it up.

Hongliang

