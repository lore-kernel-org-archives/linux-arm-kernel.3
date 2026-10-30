Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hdgwc0yh;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IKnOga66
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nADw7G7nX0/WsOexvWRMiLM5lCNYbuu2c5SbIKUBeBA=; b=hdgwc0yhhNaswesGY+27OO2wwQ
	8gvB4PcYbDxTOdPcCrcFEQtn26WO7E2/jZSAIKPFSj1743TWt8+Kdvjg7aNKBMblUnyvtHIKoHDAM
	GcxXcb+uyBUAmr5J5F1bg95R4XQfkfcY3Z1EoZaHPzu4oeFH9WUalfaYa9GZisw3ET3uotplD8fVr
	w8nRIoPP0nIQKbkSQb+M1mJ5Cp46LxeM1gsVovP4RPW+kGEm7MOGg1QZ8A9nlaz/Ub6Qp4+CWqGzO
	mzs3pRMrCL7JMXIN5JCA3N76Axaw1EfwLIE/xD86xaMXKf7PqjAIz+HU1CGuZGhsaveWDkhpFS6f4
	aIcVCqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoQk-0000000Bzvj-2KNl;
	Fri, 30 Oct 2026 15:22:10 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoQe-0000000Bzq4-3N5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:22:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdyksf+xZa6AHq1qCtKpETbLeW2PDJeDTmLUQBSdS0o4zuDUgtJeU0OPrkc/o/2Sg4wcRclQZ1J0AXFcHt5wj62qbeg9u9pny3ItTTkPH3JJokWqvByMMlqTCaVFjPul4JCYurzX0a5oBzwRHUlZ0VrXmIkTe53V5xP7MM6YtW/Sr8it3ut8LPfMSZ1I5VzexpZ+yc164+7h0sJfud/XbRBMr5/hOsAT8Exqx2xDf3B1J5xP1ddI5DA0L1c1mgDBr4SOfYCULFIoM1TCRrQW6NbOT7ubbtqE7geUzjcSizIdPbjsy9AY85RvJ5YKJ0nO5G+dgV/vGycfAUZiWSThKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nADw7G7nX0/WsOexvWRMiLM5lCNYbuu2c5SbIKUBeBA=;
 b=QZKaK0h6nk6DEP7WtqQ3nv6ha1QuJWgEJjAo2CC3NTbMvunayQOqn+crAldHrpNnaT/2U0T9/xttwdloWFOEXg6Gci/nYqyYFBFppM15qfmeNGUvcMNuX5HBDZsxsIEw6LEUboB+Nv0VU67zJmYE6HMhOomLWQF8Wx51vBlnsxns9j5Jz/EmUkJ8NebHdLni/G1dKvqIThV1G3Yxf3dVjQP/gIodmYcHV+ctbcvpnjJjkH0SvwEbGOwiae8/TvPz94AwRZP1I2nvH7EH0C0jcCH15IK0KkOUMdxtv6GEJIktbM2mQMSwWLZWP8ziJHRsQ7uDnvU4NjwZ5jkQIBtSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nADw7G7nX0/WsOexvWRMiLM5lCNYbuu2c5SbIKUBeBA=;
 b=IKnOga66bn8yNtv4E8GArHqc/FgKRc/pT5A/w0dJbEnc5AYGsumVISEtM8OiE7GrVvgZOaiebUyCe4CnaD3F5DW34G/Ad6J9m3kkJOPTBWHZ/hjMuSJdXvoNt6/egOFQR+rjwJicSP6G0K7i7ZO7dd72Y41k4ZPErl3lne36mU8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 15:21:55 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 15:21:55 +0000
Message-ID: <4f0aae0e-8a0c-433a-b433-f1346b88d492@amd.com>
Date: Fri, 30 Oct 2026 20:51:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dmaengine: xilinx_dma: Reject transfers that map no
 data
To: kernel@nullptr.com, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Alex Bereza <alex@bereza.email>,
 Folker Schwesinger <dev@folker-schwesinger.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-1-20faea2e7a80@nullptr.com>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20261022-xilinx-dma-work-v1-1-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::8) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 869a4004-83b4-4d74-cd3f-08df36998857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|261026121527099003|4143699003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|22082099003|18002099003|261026140227099003|6133799003|261028144727099003;
X-Microsoft-Antispam-Message-Info: ZNCYvAaAleDeJ7Yy6NBgNZuXrvjEPHUXPZvcKbYH6BinO6hPQTVtidanMyOGi9faSKLT+MYPJzaudtmT8YRpvrT9wn2ZdE2Pm/TEtwGSutZAez+GSrdBjqUjIEVmj2Y+1gFjqz2IyDXRzsKrKL5CaV41a550n6+eWb9gkGe2QGDgTgd7vL/m+38+C3z0L7uwiiwOLoSl5i1v+AP4tE0SYz/Nk62Y27Vu8E74btSn3cLzsS2iG7Trch2XxbCw4a8UiL4HSFD/ziAuYksWf1YuLs1/Hff6rG1MQxd2NZzLxWSn2FAB0SmQByXTtzfx52CjZL5ODCGZLiX1+Ij+2COrFvfEulHVNHY5mhWltNmMHxHBPEip+eyh4g17rWqRdzom2CcViUpJwM7geAKFYzZanYLSlwSrDDCayZkeQMQF0sG6wAw53ZQAohgMNGdG129RWUeI6gu7uxrHndt4VPfIM52fBM8k1Xp+gRdYbePAb7GJObnQ6nEdKf1IkKe3pFhxyoNLECjYUJ24qd3rxGbtppWK6zAR4+QsOEIkXt7mTymLnzrskw4xOFrdnHqb4CmmpPkh6vSKq25H5TflzpvSFFQMUj/+vH4g+MU1ShxPrKxBXyW1mI69zWBDNBX+8jsCSxn8fn3P9Ko3r8owQ+mopVC3Re5bEkoc3y5dG3NLt1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(22082099003)(18002099003)(261026140227099003)(6133799003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFUza0RhUzliVTZPd1N6OGJCQUFuRUowY2VFa05YWmZPZTM2bU1rclRhbE9v?=
 =?utf-8?B?R1MvbndvV09SQ2V2SGt6RE9VS3RWWXlraXlMamJWTmdoV1NiNW1oY21BU1B6?=
 =?utf-8?B?UmJOdUdodVBybFIzUDk1NEFDdmZHR3VQMDY3WHZPVm1lME4xbzgrWEozaGov?=
 =?utf-8?B?Y2xMQUpxUUtTVElWbFgreFFRRXlSZUx1cWlZOXBsd0dvbC9Td2ZRS2NUTDU4?=
 =?utf-8?B?bjVnODRJdUF6SitERlpGcURxK1RBNmR5dXNZSHlWa0xwYll6a1h4aHhtZDBl?=
 =?utf-8?B?eW4vRVI3L0JIdGk0NEs2QnloN2dsMW5JMExXRWJ5U1R3a2ZQczZJU0EySWx1?=
 =?utf-8?B?UkFIWC91bTBFdXhKYWhXZ0k4eVc3ZFA4VzRBRGR1WkJwY1NVMGhNMzZMcDJH?=
 =?utf-8?B?aWEwZFgzTVREQUhlbzZ4Q1g5Y1hzNGpEQzlMTk9oWDdVVkYvQlhpNEQzV0JS?=
 =?utf-8?B?Nmo4SGQ5cTRTTnpSa0JtYldBOEZuWjdGZ1FZMjQ2eEVLUDA0QU91TUJVMjk1?=
 =?utf-8?B?SXVhZ0FtZ1E4REJOMmN2eE5oL2RHL25xZ3I5YTNJL2hhb3VVSkk1eXdSTVo0?=
 =?utf-8?B?OWVJcGFCd3I5eWQrdURtYXFUc01VREVQaG5qWFM1TGFLN0dMY0N5Tm9EdUNJ?=
 =?utf-8?B?b1pmRllNaUo1UEkweTZIYmF3L25nYVN4VDBzQS91V0hlNnpPaDc3MkVoRGE1?=
 =?utf-8?B?Z2xFd0JRb0hObTZqR0htYjhEMGUvWGtQNjZ3WlZFRllrN0hEbHZ4T0JQb0I3?=
 =?utf-8?B?VFRGVlFma1g3RWRwbGZsNWh3VHpvcGVPdVlnYVJIZmJxWDJKUE5TV2ZwK1NX?=
 =?utf-8?B?bmlHS1lxWlZLRWxRVi9BT09sVmQzVXlTZEpzWUJOOEthUEZId3FjQzJmQ1NB?=
 =?utf-8?B?QXJ0TkoxTE02eVlDbWVocHdDM1dCQ2xhbFlhb1c4bm5KeVVvUlh0MlNKcDRr?=
 =?utf-8?B?aTJWRWw5WURXRzJ4L2dMUzZla01DTFNwTmVMWmNzWE12ZGZ0YWFnbkdrWDBu?=
 =?utf-8?B?ZFh2TUtNNk5sQVVWY3VwZGV6aVpGSVZSRGtmbGFqRVYrTW9HNXdkSTRGN3k0?=
 =?utf-8?B?Zjh4a3UwQ0dhWDB1aDFUaGFqeFpMNWtMVVJXNlRQVENzZTk3WXM4MWFISkxq?=
 =?utf-8?B?ZWpLRC9JbWVjSnQ3eUdQM2o3NTlWck1sangrbXN5djl2bEtTMXdTSUdqZ0Vz?=
 =?utf-8?B?a242clRueVBkdG1ZZytoMWcxVWRkMFdZRXZvb1FJMVU1SjM1ZFdEbzRUNk0r?=
 =?utf-8?B?ZWhLa3VrQU01UTZ5TGpDMTRPVkY4U0JkYzV6TU5EbnhLcUVGY2l0Y0dVZVFF?=
 =?utf-8?B?V1JaN0QzQ2ZSZUYrNmtWcFdwcUZqZVd1SFJDY3lDSFkxbURZbUVocWJ3U2tY?=
 =?utf-8?B?Z0IxMmh4Vmw1dzN2U0NDQXBuTGdYVW0rbk5MdEpDYS9pc0p5NmZjbnN2UklQ?=
 =?utf-8?B?ZnlIRlg3VDNIM3FRMVhxYWtEUVd5VFZFb3dRTlFFcTlqZFQyU3d2SXFtaWhK?=
 =?utf-8?B?RkhwZmhZSEtFeWpoWi9aRUcxR0JKbEdxUXZNaWdWWHBBMFU5Mjk4T3JnYzhy?=
 =?utf-8?B?TEJ6cjBKL1JNZXdkdjcvVklySG54M2liL1gxbmZ3djBXdDZvVEJlTjhMWXZt?=
 =?utf-8?B?QVJ3bC8xY1Q1SmpsVTREd3F6aWpydjZpeVZXSy93TEg0c0d6S0tGM1RjeE9W?=
 =?utf-8?B?RlRxWXFsZmNzSWJCTGpCeGlYcm9sVGxTQWkwN0M4KzRwZ0FkTldYSk1HUXE4?=
 =?utf-8?B?Slp4dFkyV0ZxZm84NE8zYUQ1K1JNLzRTK0ZIQytqQWRGc2hJbTFBQUY2RkN2?=
 =?utf-8?B?S3lFT295KzVsSkFBbEIyMk9ZNmdXOVRXVWRSclo5TklUN1FFbi9tTG5hTFg5?=
 =?utf-8?B?QmpDVEpOemlYcTVINXl1RENncW5qN1VkNVVaaWF2VlVzdXNCQys0dVZ3UkJP?=
 =?utf-8?B?aWhMdTNwOWVERWNlNEhMaHRDNmdGMFBxcXRqUmx3QldySGtOUWVSV0dKK0xi?=
 =?utf-8?B?UktSeXljVm4yNENMSGllQVBOdU5jRGtubWc5d3FVTnNrUW9odkgzZEhlV0Z4?=
 =?utf-8?B?U3hpRjB1N2hWWjdWOGtFaElXdzN0QUczRlhaVlkzYS9TMmgzMk9pZkRuZFMr?=
 =?utf-8?B?WTFqUkpEV0dWdlU1N2dGV1kvM05GWjJhZ3NWemZvZXU0Yi9kVmd2aFMzdTV0?=
 =?utf-8?B?ZHBhZGQ2WU1OdFl3U0Z2cWh3aFpwYjNoZTZLU0JQKzF0R0lRMjVEOStBRnNk?=
 =?utf-8?B?NDRVOCtPUlVCSHdRd2lUU0VXOC9lZGJJMjNxS08yOXVLOTFCRE9ya2xQSTlj?=
 =?utf-8?B?cGdoenI4K2xyVE04UnFOcHVCR2xzeGtWWXkzV3VnT3hCYzlwSktkUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869a4004-83b4-4d74-cd3f-08df36998857
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:21:55.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMJbB/Xr+m1nEh7z3Yu6JsLFGlsFgWQsUQAuLbqD1tHRElT8SIp3hexGC2gxXLaeSFmpFNVrl2WUM7dhxSxy6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_082204_877603_5E455B7A 
X-CRM114-Status: GOOD (  17.02  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 3:41 AM, Jeff C. Jensen via B4 Relay wrote:
> From: "Jeff C. Jensen" <kernel@nullptr.com>
> 
> If every entry of a scatterlist or a DMA vector array has zero length,
> the preparation loops in xilinx_dma_prep_slave_sg(),
> xilinx_dma_prep_peripheral_dma_vec() and xilinx_mcdma_prep_slave_sg()
> allocate no segments. Each function then takes list_first_entry() of the
> empty segment list anyway, so desc->async_tx.phys, which is later
> programmed as the current descriptor, is derived from the list head
> rather than from a segment. For DMA_MEM_TO_DEV, the SOP and EOP bits are
> also set through pointers that do not point at a segment.
> 
> Fail the preparation when no segment was allocated.
> 
> Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
> Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
> Fixes: 38433a6fdfb7 ("dmaengine: xilinx_dma: Support descriptor setup from dma_vecs")
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
> ---

Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

Thanks!
Suraj

>   drivers/dma/xilinx/xilinx_dma.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index cffe7c6fa640..5ccc9f9d58a3 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -2305,6 +2305,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>   		}
>   	}
>   
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>   	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
>   	desc->async_tx.phys = head->phys;
>   
> @@ -2406,6 +2409,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>   		}
>   	}
>   
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>   	segment = list_first_entry(&desc->segments,
>   				   struct xilinx_axidma_tx_segment, node);
>   	desc->async_tx.phys = segment->phys;
> @@ -2613,6 +2619,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>   		}
>   	}
>   
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>   	segment = list_first_entry(&desc->segments,
>   				   struct xilinx_aximcdma_tx_segment, node);
>   	desc->async_tx.phys = segment->phys;
> 


