Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625D9CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDVdOjmj4OcZNqpvZdf/XcWH79s7bJ6ZKXDzR3SWYiQ=; b=LT1fE+Y0g9hp78U5ZgdacHQeTO
	dKPdg2Bjoc4i8s+mGqhzfMD2G+Ss0r38FGgjZI0u8R/vtpqb/dFLOLb8XgCw4ep13Pnc14cGjXC0L
	b/eX9KDg0ThBOvKNB6MKBT07+swszxH5qkzKIqvMijhanG76q34Vas1UUG8j8HvKxSy5AR5cdy+8z
	Qlnl8G4tZQNWiyb7FXPKeR6bDkeIOptZwBLPEaF68PI+6E0ZCN5nRyE7nXQ0GLw/FQ4dF8cEv0s/L
	H90HIrXGxZCKKyJBpTGnUo7tG4Jx0dtsyVB2QqLQMP1RmiFKRLkn5Vp9IqibjL14EGmEqClJytbht
	uNKiZXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFYN-00000007Iw7-3XIX;
	Wed, 10 Jun 2026 09:48:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFYN-00000007Ivv-1zIz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Jun 2026 09:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vDVdOjmj4OcZNqpvZdf/XcWH79s7bJ6ZKXDzR3SWYiQ=; b=ACFJhgNtkiFQJ01VRjInFG2qAn
	4cKXccBz7Ord+huY1Q7efgyg+0bpN5h6jTCCxCmyLbaaY2kNwR+j+a9vxW6WM4MWBTUewaOrfPRSI
	87pBM8qIrXwJQ8GIRU2MIEdXJP5Fhz1nHN44kEr3m6kvQ+K1rfRXG6f5Umd9tCUD2jM83yuv5NSHg
	k59cJD7044sP5skGnzTtiM4EaEkFypk3l1anSeKYIUFghq11+Iw+PjhI+M6mNmtbd7sQ48dSqdQL4
	Apeh700wUyM6+6bzrDjqqXXoDi5RM1iMaI5fFnQaYUbbWNvt+42EiG6EZ4ImqUfHjGIIA2f4CRlgN
	hTLAJ75Q==;
Received: from mail-westeuropeazon11011016.outbound.protection.outlook.com ([52.101.70.16] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXFBW-00000003gUB-2Mhq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZN7jhwWxbdCHCqGfDwM9tDlv9YWvOpCygLLjQhAt5Dx7ZLWgPX4qD/YywdqfTdcfptQWvoP5NfGRwrw26kyrD3BMicUykZtYu8FOew77dqhaz7KYf1r6SAoBy3J17ne/HRjA2uvnWzoiUWVtN+YbZrRjNCbPhX5YYsNH5ZF+J4j+CnyrfHL3SB+iq3oEF8Us1JJeT7HzUmQSwUG0b/F5AfM+I+yCYWGKKsdC42X8eJIGiOZsSaz4figaMeAA4vqF7UMzo7SFkC2hMGFcBfVEg5k+sRH8+FRNYJfEzyb4Hem4hS29qWlMfKbLJDHneOAPROETZzyuglW4ibPBBJkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDVdOjmj4OcZNqpvZdf/XcWH79s7bJ6ZKXDzR3SWYiQ=;
 b=RtBwtZSofdDBHNvhEXFpiBFGJQcyBNV0f67YNdB24xNGb3rmMdbNOspdwppgZWCSdG47Ft+tzUG5JPrlIEZbAczBrfzoqUXsXJrxjOsrfmAufqijq6jXS3p+AMNpw3rpVNds7OpNpcwdnWsKqvWCCYm+BTbfW/r1DtPnRI/q5Y6LifCDu+emNVDh+xeA4Zhe1OL0+9iaPcXioN1+QM2WIeoEgE2fa/7Qs3RwoCdDM4aqUjzBvGNCYqc0i0wJunHKG3HGX7jIobZraqaFVW3VCHSmsvJLWB+YIXlRX3a9SIikvT1RjqzoIo6cb2jEa3g6l0jI4191MqaVMuDAUDeYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDVdOjmj4OcZNqpvZdf/XcWH79s7bJ6ZKXDzR3SWYiQ=;
 b=ICPllFzUrQv3dd0BEGV2j8Hyg1mf9YBBDKG0fwagw8iDI/YXsGpNcz43lReaQLE8rtLtBB2OIhHkeUCBWhockICnYs96Gjygx6xwPQ0K8f8Hhyr0Hh6Z430Tk8CPE29CuvrFszzI9iUui4ifXM6MvnAyuWvu8Ar2zPibyDaH5vZx9YvX3rdkK+sfRCGkq02/hGUB4tWyVQuWm6v+Kr/D6qvbIxoFzdCoe7IGFIECZuNLoy58s1XvaGaJupH2Onh70Zk17/9Jl7ja3z0SNOH3Ju1nrvuPpO2a+iVuSuSjp7eoFJ/Nyk6EhrY33tbnkqcj+dguONGAztMejtysXR98cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 09:25:13 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:25:13 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 10 Jun 2026 17:26:23 +0800
Subject: [PATCH v3 3/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS
 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imx93-ldb-v3-3-c9b65d742753@nxp.com>
References: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
In-Reply-To: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:4:297::18) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: cce822e8-b72f-412c-9f40-08dec6d22d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|366016|1800799024|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: jzrLlyr20BYW0ZlUNlXL98LKBqt5LnnyzmNL+T1MGI8rbQIVmncSeKlTEVU/NvdePYaBLToyzgFFeBcM5MkzUfECY95C3q88uAhJ6RLbRWvoahKyIuj+xFNw2kkZHNz57mtvdy3mK78RAt3N57YW6dM9OEXV4dxGaNzg37ULpcUk1cpI5gigbewl9pTQJOYX9t3Hdtr8J2CFkF+w7tFRLJjCJIJmHorbt4TNLAyZ1EqyNnamCnJ9Ac2705qSUalnnDjwdjbgX+UUqPLcj2+v5fFRHV+9iuxLfauuLW+0/46MouWQ5EyGhS0TYk6w/Y2zDLaSpKBfQmHzwq6PXxki7zEhJ8u8aeHy+MhtSYA0ctr7KAnQDORs6Y04bzaUWwqcA4b4iOpFJ0MB/hxOQsWndlkc8ee8ixa6Z6j/tMaoiMNfAwOKkjKXyz52NXAmbfkOOWT0gaRSXvny7HXnwxMgNUKU5noL1r7NpnqU9QNsAvoFz3Im8KnFt6SMDOHZVAAvHiCrR1DviQq5X3bM4MDJrPkbZ3GatI3+OhU70EQUZGJDaiZO7CsP+G7fC8d170RXYFtqrNbdU6Zd6c+YGQcYBigC6MfEULncN5JOVFQCan/Dho6n0BR9SQPzyYTxvtGrsY6pnWaP8hJDZ882NjuAUBIVunNaKgdd2nyNBbwvMNZrBY+xRyyLFZ4EX6utYAAt3xMF1FddFEdANBLrF+3p8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(366016)(1800799024)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lxb3I5UnFLZG5CamxRUUZ4SFNlanJJYlRoUGRGTisrSEIzY3dEejIwT2JR?=
 =?utf-8?B?c0szQVNXZTIweFdjUm10R1dlLzlUSlZKTnFqR28xYUZUaDgxYVBGTHFCeXhs?=
 =?utf-8?B?dHlQSXhRYmlNMlFtdTdrd2ZkSlR1Qlc5WlJEeVBlR05TL0xNVFFVMHEyNHMz?=
 =?utf-8?B?bEw3bW9wRGd5TVgvbzBHRmFkYXhiZ040aUYxOXF1cEdRbWZqTEF6MXpEZzI0?=
 =?utf-8?B?M3c2ODBHd21TNVh3RHQyVnpxbVRHbW5HbVBUcFliU2tQTXc1dXA2WjhyNWg2?=
 =?utf-8?B?YTZsemNoV28xdmtBWHdPNG5zZm0zWVNPWDdvRTR4ZU9ReDZtTFpRdjM0TTVH?=
 =?utf-8?B?TjArSjFuaTIzRTJlT29Ialk1YytWN1pQWXlZNGFUTUpWdnFYaGhwT3h6bVJq?=
 =?utf-8?B?MTVaZmJ3SXE0SSsxcER3KzdiMXkyblBySWZVOCtWU2F5cjB0bW9mV25vWWpU?=
 =?utf-8?B?UzF3ZHdxdlo4eXBkRWU0T3RXUlZFWVRmL1lSeDMyeU1kUDZCRVhCY3Z5RFQz?=
 =?utf-8?B?czZRbFVOYzBwcUw2cWo0UGJkZzdVTFRjdVUvZmtQdUFLZVV6dXFjTG5VZVpV?=
 =?utf-8?B?TlZLcmVGamNiVVlVak9rd3dNdVpkUzgwUWpETy9IZFhlYXFpTno2Zno1RXA1?=
 =?utf-8?B?S2l3K1pEVXY1MmhjTTh6b3JsbTU2RzlQUU1qdE8vZk1xaTlpZjNtOGFSWXhH?=
 =?utf-8?B?RmdMQXFiaGcvQ1JjVkxiaWd3VzR1em5zeU9nN2lXN0FNNW1nSlpMa0RBQmRN?=
 =?utf-8?B?WTNRaUp4NVRheUQrR0hmUHhkQ1BpamVicWUxVmhmMG5CelhZWFdxaHVmUHE1?=
 =?utf-8?B?QzZ5WnNieE0yWGNJbm5LK2MrOWhmS0Q1RUJMUFNWdDJDZGFJZUdWU1BRR1dD?=
 =?utf-8?B?cCtHbGJLTUJyaDVWa2hSdTZHcW5yNnlEMlU3ZVc4MXFteVp6SDNMNDd5K05G?=
 =?utf-8?B?RVJjSHNta0VwMjFRWndZSzUyeEg3cFBtR2duR2tIVTV2aW5PMllkdldIbkxa?=
 =?utf-8?B?SSs0MHJGbFRpY0E1aDhKWGNWUEtIUUJUSk40b3lta0Q1dFJxK2ZXQmYxR0RG?=
 =?utf-8?B?WlZrT3lDT0FjWjUreVRiNzc5WU8yUzh1dWViYklzZkdLNVpXL0RNSlFENmc0?=
 =?utf-8?B?UjJGb0xwL2k5bElvZTRmOVVCQk1DVkZSR1hwMGl6UDM3SGp6R01acHAxNmZV?=
 =?utf-8?B?bFFpdXlxN0dQS2x0V1JuUFh5RHBCaEk1T0FndjR3TGgxUjBNUDBQZFJpZ0o4?=
 =?utf-8?B?R2cxTjFEeGpHNHo5cTE5K2dwZkQreFpCTzN4MFdoVnFEWUVDOWFLTW1vWW1a?=
 =?utf-8?B?RUpLeVpvM0drRjY0cDZtMEZkbmg4bGhXZzJucksxcE1ocm4wUWtqa1VWRnZy?=
 =?utf-8?B?ZjdwQmFtY09OajZPZjYxQzVnWEhYMXVEcHBTM3RNamkxQWpmb0dNTGpGS09Y?=
 =?utf-8?B?RGRLaHpmcU9Ta1hoVTFHT3Zwc2pkWkltSDJmQTY4elhTWkpXb3hIMlFHN2RC?=
 =?utf-8?B?RzB5cXBkWWxNOWM0c2o0TzI0VEJsQ2dhMWxMRDhQKzBrdk5tVTlHa1pZRmZp?=
 =?utf-8?B?NzBrbGlkdjZnUXNCNi9CWUJidGZ5WU9LV2dqWHBKQVg2VDdQWVBqSDhHa1lZ?=
 =?utf-8?B?T0VwRGM2b3VSUkdqdXJxVHVEYmZoZktyWHUzQVRDTGcxdjNrdnlvQ1NDVU82?=
 =?utf-8?B?ZzlKTkRRMlBZL1RLYWY2dW9iZnEwem9JMTVNWlIzM09BaDV5eTljbys5Rmk1?=
 =?utf-8?B?dFdja2RMSjdDcGtvTWs2VUozM2FQdG8rL1cwWjVnNFJGa1loM3IyN3I4S2Vv?=
 =?utf-8?B?bkV5MDNvNytjSXpNRXZwcVlmTWZ6dmhpYi95bmQ3d0IyY1gyS2tiWFRtZ0hi?=
 =?utf-8?B?MFAzbW1pa050aW9pMUhlZTFiMDNWMzlsRnhlTzVlbUlIc1l0MlZ0VGlqSlFS?=
 =?utf-8?B?ZGNpTk9pYnNNU05janhXWU13dm52Y3E5TVdkTGE3Z1kzNW1sNWZ6WS84cnhW?=
 =?utf-8?B?czd1MjlpQllEbExOUlBtSkpmbGgxeC9hWVVlMUhDNUFDYk9YSFkxTUM5Qk1W?=
 =?utf-8?B?YVFSL2RTOVZaenJETXFOclVMeTgzeFhYaEVIMlFad2lITjNRZ2FxUy9nTHp4?=
 =?utf-8?B?MW1mTng0Y0JpMmFBWWdsWHEvY1RIMERyTThEVXVRWFFhTUEvUVdNckxxRFd3?=
 =?utf-8?B?QzRGb2FaaE1vTlZvMUVFN1l2QXFqdlZCMW5CeHdXZjYzZzcvbmdSQWlYR1VW?=
 =?utf-8?B?aE9IOHNwaHNhNU1sK1k1NGxaR0QyWGhtUStYZTlUTlMra0I3Tnp0bXdJRnNs?=
 =?utf-8?B?OEw0NHVtcVByVDdOcTZjcDc4TWM4d2dLRXY1Z2dMQ3hPNEgvQ3Axdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce822e8-b72f-412c-9f40-08dec6d22d2f
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:25:13.8453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/t+4qNXHeE+yLtVmfeX4NOzYc9ykSB/VwSdANle+uDwXuDkcTFC1jjgg5ozWEwb3kwc+qMolOValyiF5GjsXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_102518_780060_4A1B77C8 
X-CRM114-Status: GOOD (  13.30  )
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

DY1212W-4856 [1] is a 12.1" (WXGA) TFT LCD panel with LVDS interface.
The panel's 40-pin connector allows it to be directly connected to
i.MX93 11x11 EVK board.

Link: https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856 [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9..dbe27d757c86 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -588,6 +588,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-tianma-tm050rdh03.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
+
+imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
 imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
new file mode 100644
index 000000000000..35f7c5699e3a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx93-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "boe,ev121wxm-n10-1850";
+		backlight = <&backlight_lvds>;
+		power-supply = <&buck4>;
+
+		panel-timing {
+			/*
+			 * Set clock frequency to 71142858Hz to accommodate
+			 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate
+			 * table.
+			 */
+			clock-frequency = <71142858>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <48>;
+			hback-porch = <80>;
+			hsync-len = <32>;
+			vfront-porch = <3>;
+			vback-porch = <14>;
+			vsync-len = <6>;
+		};
+
+		port {
+			panel_lvds_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_in>;
+			};
+		};
+	};
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+			  <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	/*
+	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 71142858Hz to accommodate
+	 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate table.
+	 */
+	assigned-clock-rates = <400000000>, <133333333>, <71142858>, <498000000>;
+	status = "okay";
+};

-- 
2.43.0


