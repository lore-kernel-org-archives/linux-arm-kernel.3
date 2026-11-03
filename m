Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6F8606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LLfl6/vt;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RRpvWsuu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:Cc
	:To:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UwzFpOt58HuMKCoGI+E/bGGBArZH0GIL3noqckPud6A=; b=LLfl6/vtKS3LgE9ebhOXTc+KPF
	v4Ub3yhzS6ADljgGVJGqQoyvS+7iW1V5gDvHOvHjvW5PJBgRl/LsiYNQD47qWtanvsG0oYEZ9sGNi
	vshpsAjT1NKg7JJfB7l03H4FPH1EnI9AOX0z5iBy6R8h/gtzsCwNGimC0hlq3rQU9vKJw8j7jw69s
	1uDaN9VWIxQkuuuCp1Y441TZyLQaO+YYzSpKwnHLXqkLEw7IiIDe4rGQ3vl3dFbhZxeKgU8dBOwuh
	3bW/D47GVZEPmqA1hBP+lWqdq0eWD85nH+1OGnZcaxp2XkxWrx3DvIZGvYCc3allxL/dkLeAV3/Cy
	P6rtJumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODbL-00000002NRb-3557;
	Tue, 03 Nov 2026 12:26:55 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODbF-00000002NPp-2Trj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUaPmAJLeeuPhnzcNkjdXpacQARyZGy2lasOOFqRfsY7Caho89K6gEKxPVtj+eNIpcEfJIkyrllZu3IHBYIVOjAhwFL01a41b5jVjUcV60UdnjBFeEEhf/0007jmlsQvBnRyxPOwGEePpT7mQkCQ3G9mMF9km8Pp5z6c0m0iVm+EvvVw+2AcpqeBY5NXRsDcaddboR9hC9dmdK4zimwwEPLh66MJeVr4P82DJr9Ne2cTy1Z6r31kE2ThlmfKbecEQG5Rq5bi0dMoxFMyw/h3kDudNWbF04KeZynDZ5fFpuy1G8uxuu5n4fxZMNV3sA+10Xum5IqxSfIGRk1uh2gOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwzFpOt58HuMKCoGI+E/bGGBArZH0GIL3noqckPud6A=;
 b=lJND6CjHPk2O8EofGwF0wknTq6YhTBWoBNPuFT00S/G4xIbUhR+wuepNFvK/agZqRE1+rGnvYKLRWWtBApWMOGKQ6tdMAXQFYR1kkTFTfkLCmRjAVSHhjQ2iQ0j/ZwhqylHGu2VfOIB4YnDrlLxuXAkq7Z0zRrA24+3I4AtErPsUCS1ur6L0XAGQ5cjKiwJx/0CdvoPoE6OYnBUXpOkkFcEc2vpItVzela6n4D4/7pjTiUDXpUyx8K78iHd5PRe8LNOVj+soK5CKvcq0LOCsSUj+J7RnB9djykX/JTD16YEIrO5c9o56tTnhtTlFM1oyg6j/VXVdhKdnsaj8hzHLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwzFpOt58HuMKCoGI+E/bGGBArZH0GIL3noqckPud6A=;
 b=RRpvWsuuFjxBbEWfFEiS1Rm1XAqXiVPx3KPWLR2EFLN4zfiTGolBvUMMNOdb6v7tEpfDhjKOc3I5oylVwfVjjCZYd08du8fEZgV+RTSzYNrbAEYfuDSwLJozprxd9y7XSLhWW2hRkSW4vr89wK+JR6ifD7WiPew83DKSsFkuzPo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 by CC6PR12MB259526.namprd12.prod.outlook.com (2603:10b6:170:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 12:26:43 +0000
Received: from SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6]) by SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 12:26:42 +0000
Message-ID: <8986493a-cc47-4ad2-a142-764d4069c146@amd.com>
Date: Tue, 3 Nov 2026 17:56:33 +0530
User-Agent: Mozilla Thunderbird
To: ptsm@linux.microsoft.com
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, michal.simek@amd.com, srivatsa@csail.mit.edu,
 ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com
References: <20261103063515.679043-1-ptsm@linux.microsoft.com>
Subject: Re: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state
 cleanup
Content-Language: en-US
From: Jay Buddhabhatti <jbuddhab@amd.com>
In-Reply-To: <20261103063515.679043-1-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:265::10) To SA1PR12MB7366.namprd12.prod.outlook.com
 (2603:10b6:806:2b3::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7366:EE_|CC6PR12MB259526:EE_
X-MS-Office365-Filtering-Correlation-Id: 483651f6-ab04-4093-4e97-08df39a5b76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|56012099006|11063799006|261022075727099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: d+sWlQbheV6a3avTrqdQN4m6aP15oy0m62L0SWH01pW7/caYZFaGCqiYYK9HAifJ60lMqtfBhNElyjrm9y7yxMFaLKX5aR1cNuqm9B36vYiGG6RddupySWZhRVXrmhaL7vjPYmEZPZiWssH0v9G4SJwrMMIM4J7rcVgNQf0Hu/5zjvj34crQuMQOy+G56JEpFeVO8XQR4YNOHrJF9xqNSYa1S495LDuQ3mcsLfwE0oK4FLjZcP3efHNIQkOtCOypJl6jQUNJYvI4tSrYdeZ9cWD0NIxooCTQ5P4KtVDMfNpA1ncidxYa5xlEKSLa3dMlIQy+r3BoHgryJW033yX+xKwU+6jxvqWNOg+fLZk718TsPAz/EjNSX8VkZTdNlDt/OhHGXv1SAv04fTZZ0jkhpKHBC6FH5IecgXRxuRv6TWmRdYM4nt61rMaz0j9/y+wglntbiMXr+6TrC6/JO6QGpMpkTGju7Y5y+rd7zdJtvCD7fzf6377RltR8MKHKa1VDqPT3VWXMRbUOZfSf0OXeGO7ZRhVowaJnMCsVLMyik23u7M2W26IMwgAeJ1wDqgAirny3g+F4wgfbZBhpFc0xjxyeBICVEy6s+fnhIvmstBPyzK1AYPDOwUtp//D8uVZdbK+J2HQOVoCMP39dx+gNckcalXyoGX7UyGOpHpSQO1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7366.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDROZGdEQXYwcjVHTzhYYmgzeEJWYjNSNGFGWHBQMFVoeVBsT3FGcmV5cUxE?=
 =?utf-8?B?Uk1wbFVSWVNVNlgzMWR1Yi9wRklZQ1I1SE1qZ1lSTzMzcTJSRzQzNi9HVjB5?=
 =?utf-8?B?dU9kbm1iM3dIY01Wd2lFNDNiRkYvUmRDeVNyVkQ4SEFzWit6VkovNHc0M1NQ?=
 =?utf-8?B?Yk91MHdyQmRmMFdvZlhxTkh1bC96dWZLbXc2ZmdPRUJhdmphZFA3NG9wckhz?=
 =?utf-8?B?T1F5NFZxcitiSUtQZGJGZlhIT1ZETkFvTmE2TC9IZUhFYnJXd2hVSG1wd2ZR?=
 =?utf-8?B?SVRQZ1ArcVoxbFJ0VUVmSTJpVlcwODRIRFlVMmZQVStablhPQmt2WmRXc2s4?=
 =?utf-8?B?eTFsSDU2cTBZeVIxN012ZHgzMjhYY2c3enp4dFpVU3UyZWg5dWFvaW9zRDhP?=
 =?utf-8?B?SHNwWFc2RUdLbi85QnQvUTZKQ3RNMjBNTElMeW00R2YycTQ0bXJWQXRTeXUw?=
 =?utf-8?B?TkkzU21kNnZ3R2RGbll0NE1LeHpFODAveWpSK2QxdmRSNThkWEZqSjNYekZq?=
 =?utf-8?B?WjVkVXRKZ1N4TU5TQjJnWkUvMDlIaEN6ZTE2b1p4ZnBUdFE4S0MvTXhQT1BZ?=
 =?utf-8?B?bmRyUC9GRG9PenVaR1FZL1ljS3RPS0cvTkJOWVJXekhHQTlvdVlMUFFmVVE4?=
 =?utf-8?B?K1JBcWdnb0hrQzVNTzdLQkRJTHNDbm1Zd1N3ajZSV285S2FsdnQ3OFdmOUFm?=
 =?utf-8?B?b1lDNndxQXVvTGRkVkg0REJUT2pEQlNTdzhzN2NkU3M3Z2NlYnNwOU55QXcx?=
 =?utf-8?B?dVBFLzBDUElRb3BqVEVtZ2IyU1ZMaWV1NEhkMlhSY3g3TElSbWR5M09PYTZV?=
 =?utf-8?B?SGhFL2llWGQ3MlorV0x2QXNvUDVDSHJ4dUJwcWRrTlU1a0N5S1YrREk2TGNO?=
 =?utf-8?B?V0h0ajNoOXlINXE1Rm0rbEVISU5Gb1B1RkpFMVZZWDVzaW13eldVTDZvdW4y?=
 =?utf-8?B?bm1HQ2I5Nm5jNjVLTFlwaWc3VTBnTU5CNlNwVVNtYWU0NGVWUHJVR1F4SkZX?=
 =?utf-8?B?cHlmWVhwaEkzVkt6M0hCK0pFaWRkN0Ezc1VRZ1pPZk9PdWtDQThWb0VLQXBl?=
 =?utf-8?B?SGNrRFhvV2pXa1V1L3Y3ODlKUkxqUGllcXJuVmlvVXVGUEx0QTVwbEovd21v?=
 =?utf-8?B?OENLUnM3bmphMUIyOWsxUExWMUpob09kbUxtSTUwQzNrR2NGOGUvOVFxQ0I5?=
 =?utf-8?B?MEVyZEF6dVExakl0NUZrUERxbE5iaTBjUFN4WHVpOU9oMlFYV1F6bXlXNVJK?=
 =?utf-8?B?ckUwNW1aVUwycjVLTXZSVzd6L1M3WGNwZkhIU1FhL3FKSFJ0SVZvakxGRUtp?=
 =?utf-8?B?YVBJa1BnUUdKbEthYjFxVk5vVlJCcHlqbG56ZE92ZmZVMUZ5YXladlFOUUph?=
 =?utf-8?B?ZmFoUUFQZEQyRGZ0cVA1Smh3WUdHNUNVNVZFU2JjdlpUMUV1TUlhY0thMUVE?=
 =?utf-8?B?UUFTMVFySkV0ZHBwS0xPUWc4eWIvYUFSd0x6dzdLSFl5VDU4eEFVZGFSSGEy?=
 =?utf-8?B?dFc3OXJBb21QS0p5OUNaMTdPdFlrdEkxNG5sbFNvdHNnYjZmaEN6TG5TbVdI?=
 =?utf-8?B?azJEOExab2pzSjFxS2lLVW1QdUdUVUsxbFNqZmRKRkhiLzlJeHlpQ2tRZXV2?=
 =?utf-8?B?K3pCWlBGQzVnQWZodTBjWHhlQWZoNzluQWp4cUp5R095cVk1Q0tTMEdVN3dt?=
 =?utf-8?B?YTVYNW82Um9raWNiQjZTaUhzU3MxMThZNlBTcmV6ME04dmxlQ1BEem9jRTVL?=
 =?utf-8?B?ck5mNzA2R2NDUFhUdXhzaHFPSHFBN0N5UkdDc0o0VTVKTElKRVRkRU40dzB3?=
 =?utf-8?B?V3YyY3Ezb2QxaGVicVd1TGR5OGQ2ZDMyZnBjbGlWVENmRjFxWU81eW91UU1J?=
 =?utf-8?B?SDJOcllFM05zcTVZdnNjd25aemVJZXJ2L0xSWWNGUFk0WDdtR0FkeTFTWkt3?=
 =?utf-8?B?d25jemp6S3JhS2hoeHZKYmJITG1BcWc3eGlGK3RVbGMvb1hyRmk1MjJyWFJZ?=
 =?utf-8?B?S0pqOEFJNTJ0eVdhckhqZHlGRXM0SkxyMVUrWFdpM3FVRnlqVmhIbTh3Y0tF?=
 =?utf-8?B?TitReU4vdjNQTGRpcWU4SmlqV3puUnhjdjhSaVBvVUg1RnNWY2M4MGdBVnBs?=
 =?utf-8?B?bmJnZXUyYndnakhsUzRWZGlEM2FNUWh5cmJDc3FEd0lKREJtNEw5akhFbzJB?=
 =?utf-8?B?RnZzcURFcnFuZVo2aDdpbTRPcXlWVmRTcmJpbmZuZmQ2SHNTaXFIZXZ1ZmVx?=
 =?utf-8?B?RGVOaDlkdU5ySG9mSmV3ZXNxZ09Qc3hKVW9lOFhZSHRIeWxLS1lBSnZqOEpz?=
 =?utf-8?Q?2/OcMx3O7dA7GGZw8k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483651f6-ab04-4093-4e97-08df39a5b76c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7366.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:26:42.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqRCdAo9urOuykXmgWSl6epEjNXkLcciehGTe/jy3VxLaP9Ohjd0Km1UMAkFxp0Fge4oLZMdXwpocu5s5J4VMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR12MB259526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_042649_636131_D16D4BC9 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Prasanna,

On Mon, Nov 02, 2026 at 10:35:15PM -0800, Prasanna Kumar T S M wrote:
 > On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
 > CPU hotplug state instead of the its actual state. This can leave the
 > event manager callbacks dangling. Use the actual CPU hotplug state
 > during driver removal.
 >
 > Hotplug registration failures are also ignored, allowing probe to
 > succeed without the callbacks needed to enable event interrupts on
 > CPUs brought online later.
 >
 > Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event 
management driver")
 > Signed-off-by: Prasanna Kumar T S M ptsm@linux.microsoft.com

This looks good to me.

A couple of small nits:

- "instead of the its actual state" -> "instead of its actual state"
- Minor alignment on the cpuhp_setup_state() continuation lines;
   checkpatch --strict complains.
	CHECK: Alignment should match open parenthesis
	#49: FILE: drivers/soc/xilinx/xlnx_event_manager.c:663:
	+       hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
	+                       "soc/event:starting", xlnx_event_cpuhp_start,

	total: 0 errors, 0 warnings, 1 checks, 44 lines checked

Worth Cc: stable@vger.kernel.org as well, given the Fixes tag.

Reviewed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Thanks,
Jay

