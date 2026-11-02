Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E318606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yg6P1osB;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q3z1EAUO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eKZAMK1cH7Ud3tNm64L+M5qqrvzZSRKgcGk+IUYOIUw=; b=Yg6P1osBmHZdkZA4aGLWixFU2d
	g4IChuBtg6ZH3wycsN7dIeDcTOmqj2OQ9IFtFW5y+oohSM4K0taSTTBUV7AFxxDGyalVLgC7N7RMM
	6K9U35JxSRh4hX3mDi7GJLLR8GZJkoM3wEifNbIorOCiRzMS3J1bKbOu94cx4hu6dSzfy6cMBLUYg
	9dQm2xSlqDAMikZYh1dIRQv0kH+eqU3bt6xrinPUAbi5KtsmAFLp0x+bfYJO3nn2qbAIMc53BuyDq
	7G61aTQP+o0OErIBS0DaCypLFoFELPisW7lQjH/YZR6DW0o1+syXiW2pmhVs7np2oS/ORosIQWlF/
	2Xaylupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmzS-0000000Foun-0eOK;
	Mon, 02 Nov 2026 08:02:02 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmzP-0000000Foty-0mK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:02:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/iFS9Q3e2uO5iXHcRjqpqfnR5YBTzyooUErdgCXtcrv7CmiGkMjvaLGx6URbEJIzX/G7xlArZRj00lclDxQ4yGzPNerJucJAQ60pbnmgZwt93YybqfeAu6nWVFkkyCUTncpPo/ntLQCarvQ2Czx/fwN/43kudPyQKE6NtKua1QJc2meeocqMdYsJmbGUSHGXMo4ZN2jVHeW3ho0ydGaH03FO7eJDWROfKF26w7w0IicgXqGTLqmnBDnegHCpU5PeokzkaR7cQXkyFgId+s2d3kLnQ8qA/1smvqBOjbyyVj3aPk37UyGzaxDQLFKTsu3dluIrb8afSPFyCiG1SsxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKZAMK1cH7Ud3tNm64L+M5qqrvzZSRKgcGk+IUYOIUw=;
 b=GpOqCmvHqbvlB2QCaMCIQRK9xFFuGsCaNpkWGrS5CIiCKnvQINPAKDrn9/C4PFxKT/TQsHyJjgKwYiAvUtIjvkc47PZ4KIac364CavFisW9F1ymZba5UfaKtJBh/MYCXB7+AjGQdQpj4nWOCyJHirME6wr32hUJ7nb9k0543B7qnTAlDFizpaFBJHFFHVqg1/7dODa1Toqrz54rQE4rbr7zTkn2/lpfZforI/20o2I4p+lRCyKUCn51Qc7Dei6bVpg1jgOPDLTne1VW7jiCldDVGTHQsVyP7WtM5F40cyBZIcbbFO8Wj1vdUyo6wI4UG8feyhGKlvqQXnFcLdhHXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKZAMK1cH7Ud3tNm64L+M5qqrvzZSRKgcGk+IUYOIUw=;
 b=Q3z1EAUOmEl0a8MHi/aANV0PfkKpRuRfM2CwxIs8CaeRrZcgN1zR0F5IohelVJVGb7bIFKRRYinQu27MK3cxg944LdyCOyNbtNJmtg8EoPwtwTc+1iGH2n8t7Y8+t40LEr0zRTK2dskGxzMDVPF3iIDtt63fPOkfuHM1nX5e3nU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14)
 by LV1PR12MB484207.namprd12.prod.outlook.com (2603:10b6:408:512::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 08:01:55 +0000
Received: from MN0PR12MB6053.namprd12.prod.outlook.com
 ([fe80::7657:d4df:ffcd:2e7]) by MN0PR12MB6053.namprd12.prod.outlook.com
 ([fe80::7657:d4df:ffcd:2e7%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:01:54 +0000
Message-ID: <6bad7904-80c5-41c5-bd6c-2890f6097d8b@amd.com>
Date: Mon, 2 Nov 2026 13:31:47 +0530
User-Agent: Mozilla Thunderbird
From: "S M, Suhan" <Suhan.SM@amd.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on
 empty EP0 queue
To: Li Ximo <lixicaicai@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Wang Haoran <haoranwangsec@gmail.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
References: <20261023073131.637062-1-lixicaicai@gmail.com>
Content-Language: en-US
In-Reply-To: <20261023073131.637062-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To MN0PR12MB6053.namprd12.prod.outlook.com
 (2603:10b6:208:3cf::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6053:EE_|LV1PR12MB484207:EE_
X-MS-Office365-Filtering-Correlation-Id: cf85bec4-1a68-4fa9-ae64-08df38b78f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|261021121427099003|261021135927099003|261026140227099003|261022113327099003|261022105027099003|261026121527099003|261021123027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 1yZKOMu5Ym4nJJf6/7XzsIIy791PxItUwF6HzsI/xN/XBOcP86bM5NQpkLZXXpPp6lH0z+WYqoU2QHasmWWaD9BhJ5x9VpKoBN8cn5cOpNPL3FNZZmHKHvA9vuv2JnllXILn/zvUOStd8g3cz0En8lE7iQNOZh7N1mT8NzUH1fOE9hzBQdRQsuWeY6DMS80iWTMDFf2SEmlElVE1NN8DGR8yglmplD/01S4NuhiRn6dboWOzoBa6u94GYhYveKAwuSTzyQ9egqiL8Xal5Pi5dohHnNkeUOj9K4InPjp81GQ1or8ooTGiRf1L3tEL+HI95FqMk52Wzx10O1W2D13/kj9io4ZomRFLqTMsFRJVzyM6eD1SQN/NA/42RQtn5RhLb81fF1NDtKMpBsZFKLPoX6oJ0nyBnq1iBW18OACOCsEH10dNU9vInQz0M2CK7it0sQCtwgCukgxZ//1HNGEh6kxcSJrDLkbxYOR2b2YKh6WwmhjXRCTdtBgPSNhesRpmbw9VLMnF7/E5az34D7cr8mqVDcLeHNV2jXdS/kJQdtNcVyw4zdDsSHT6Sx+qoTubUgLFmC0lUdQ6L+JnohvXtsJfZTZKpIJWnIi3u/SR9c4InOq4I9SjNF1Q6GcMuoXZZ5bbJIinJdI+8OBa7B6o6919YcckWj7vDSeCyYEkQpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6053.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261021135927099003)(261026140227099003)(261022113327099003)(261022105027099003)(261026121527099003)(261021123027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBxdnJHaWREV0FVOUMzT1VONStZZWRuWFdoZUFRSjB4b0dLY2VsZFNReHBm?=
 =?utf-8?B?bWlRTFhJVy91ZWtXcS9kZkw5aXdDem1BdHptTVBSdHppZ1pkNEF5L0JndCtu?=
 =?utf-8?B?S1hQY1FzSCt1eU1DcEl5YWs4RTFpaDJrTmYzU0VTdXgrWUtqY05lRjcwVTRM?=
 =?utf-8?B?eENzVFAvblJLNEVrUnBoazFRYkNCVml1RVg2aTErQzYxY2FKWVBsdHM2UGhZ?=
 =?utf-8?B?WnhHMWtMRGRzcVlDUGZXaVEydjR6OU1sVXpHREorbHk5QUNsZVl2blhhRWlC?=
 =?utf-8?B?cWg4ZWw5ZXhycE1TYVdVSThaa0RFVytybkpWNkZyYktuS1Z0QlVxY1ZHRmli?=
 =?utf-8?B?c0dON0ZRaXArSVlYb1VOc25BUmJ5RlM3Szk4QzZNS096SVlCQTdLSW1jK1hp?=
 =?utf-8?B?WFVDRG9qKzVIbFpSeWhXV3JuUm95c3ZVTnN6Y0ZMaG1DR2pSV2NUMVZQV282?=
 =?utf-8?B?VWJzMzVIZ2VsTDNkM0hDb20zUnplcWJLdDF6ZENJaVFEYVp6U0VSN1RQVWRO?=
 =?utf-8?B?NE5PY3h6WWNqTFo4dXdFVmVQSHBHZXBYSUhvT241cXovK0s0dEc2Y252ckRq?=
 =?utf-8?B?WS9MTk1VOG9uZHJVSHRBeitmdENNVFNwTGExWlNUMWt2NjJsaXpKTVRGNWlQ?=
 =?utf-8?B?NUM0OGEzdEpCN0J0amNyWTkzbnc2OUswSW1Tck5PSGlOMmlsWGNWOHFTV0l4?=
 =?utf-8?B?aHV4dUlYQXdTYUJUZHVEcnRsbWRIdVdqeHhaUjllT1ZNM1kyOEIvL3g2M3Ni?=
 =?utf-8?B?eFkrc1k5ekJ0a1QxYWg1SDRxTGRjVHFyb01YK2J1THlSUjBCckVCU0NUQng5?=
 =?utf-8?B?dVpudzI4M3phNFFmeHB2VWZaZnl5Q3p5ZmxicDdMTE1ZV09qeTQ1cVg3ZDdR?=
 =?utf-8?B?OXlBMVhXYVpSUldGNW5EdThqbkhhbTNwaDlhU0FPQ0lKQ3pNaVYwLzhOaDBJ?=
 =?utf-8?B?OUVHUlJWdkI5TElkYTZSTEpBLzl2ZWxKMVNFOVFDbEpOcm1lWjhLZ2tHTUdw?=
 =?utf-8?B?NUQ1WXFETEt2Y0NrUUFCRWdDVVcvNE45SUdKalF1WUQyRERVOWR1T2dlQUli?=
 =?utf-8?B?ckh0Z3dFTk9xZ2lWYzNRZFMyR1piRE5hRSsvMEVHejBKUHdvVTYwK2ttaFhO?=
 =?utf-8?B?N01XSHVrQ0tXMnBPcHhlRzUrMlRUUXlQckowZWdOTW1NV29mNjEvdFI4N3Rm?=
 =?utf-8?B?YUMxRys3SjZtNnVQWFovcFBtdjdDOWt1SFZmc2xBcWM0WGxsTU1IYTRaR3Q0?=
 =?utf-8?B?TTczeEZuM3VpY0g5RjdydkRjMUllRmRFSUZuTm0vNFduU2lNcHJJK3BOK0RN?=
 =?utf-8?B?LytBcUVxdkRMYnhrbGMvQ016S0ZKR3drMTl2OThuZVZsWDYwOFcwNEZHTXo0?=
 =?utf-8?B?YitSeWtDbkJxam8rRGg0TS9HQWl0WWJOekZBWlBGeGZVZWFtQWN4V1hMWS92?=
 =?utf-8?B?cXhiNFNIcVZlMHZURUlXMUgwMDB3WjYyVVM2enVtaW9meUlsdmhuY0F6bXR2?=
 =?utf-8?B?OXlnWlhjRzVOQ0hIWUJaV2tkR0FOUDVYZ1BUanpFbUtJVnFzZzU0bjF0NHhq?=
 =?utf-8?B?dHFQWmRzczVEdXViekNONGVxN3RHbVBON0tUdldrZUFqaWlnT0xzMGx2VmRk?=
 =?utf-8?B?aGZuL3hqeFZoQkRNeEdibHRnOFZiU1ZRZmdmeUwwalRFdnJ1eFNpMEp5bU1v?=
 =?utf-8?B?a2FwWUtIY2d1SkFScVR2Q2xwbUFtN0oxajdVUTk3NStiODdlb2ZlVFBXWjc0?=
 =?utf-8?B?VnVBY21CNWVLQWtONG50ZmU5VGxXTW96OTk0ZUxvVThkcUx6R0pWYkkzeGg1?=
 =?utf-8?B?WjFNSmhQTGhVL0V4Yk15K0VYYmxOckttR3QxNUUvc1FJd0lSRnJvNU56b09n?=
 =?utf-8?B?RWZmeHg1S0Q2anZnMGRXZ2I2MHM4di9NODNXYVlKdUNTd0xTeWdEcFpVeDNm?=
 =?utf-8?B?N1A1VmtxSm03N3QwYnJxV1B5VVhaTUEwTHZxc25QMHNLM3VkSStsc09wYW94?=
 =?utf-8?B?Wm5CZHZVT3FUUW5pTzNIYnpOVjFrcjVxSTZvaEhYRmg3SnNTYXNsVHVoRXJW?=
 =?utf-8?B?eVU5eURnUWFINnRuMWNDbW1saU42bVhmVTNWdmp2SjhnV2I2amE3VjFEaS9R?=
 =?utf-8?B?bVQ4UysvTmxZYldrbExPMU5QdXN1UVdpTnUwT0NJdkdWS3hSZG9COUliOHpD?=
 =?utf-8?B?cjhRN2RmZFFRZFdPaDdmOVNFTTJkaGxvWnRDNDVQZEpOMGdtVFVSVFh1Sm5a?=
 =?utf-8?B?QlBRaUVITU5aVldBWWVHWTlCOVJmUFBGRTRRNTZUa2lTWm1lZG5aTGZQdnBp?=
 =?utf-8?B?Q1VKa3NRQ2FyVHBtTE82RSs3S3p2THR5ZmpPNkFLTkR4ZXNiNHljUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf85bec4-1a68-4fa9-ae64-08df38b78f78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6053.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:01:54.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Isb/FMgsM+oBOiki/Hzij7JwTSu3PElDUiUZyOwjgkjj8dZKp4bAHLwLvut4Nj8e4ONd/usG+DLcbTqRIVZzlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB484207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_000159_232137_32F9BE9D 
X-CRM114-Status: GOOD (  25.67  )
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

On 10/23/2026 1:01 PM, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
> 
> list_first_entry() does not return NULL when the list is empty; it
> returns the result of container_of() on the list head, i.e. a non-NULL
> wild pointer pointing into the enclosing struct xusb_ep rather than to
> a valid request. This was found by code audit.
> 
> xudc_ep0_out() and xudc_ep0_in() are reached from the endpoint 0
> interrupt handler xudc_ctrl_ep_handler() purely based on the hardware
> FIFO status bits, without checking whether ep0->queue actually holds a
> request. The queue can be empty at that point: the gadget driver's
> setup() callback may not queue a request for every control transfer
> stage, and xudc_done() removes the request once it completes, after
> which bus timing can raise another FIFO ready/free interrupt. The
The claim that setup() may not queue a request for every control
transfer stage does not explain how xudc_ep0_in() or xudc_ep0_out()
run with an empty list. Those functions are reached from Buff Free /
Buff Rdy, which complete an EP0 buffer that __xudc_ep0_queue()
already armed with BUFFREADY.

If setup() never calls usb_ep_queue(), that write never happens. The
SIE NAKs host IN/OUT, and this code is not reachable for that stage.

So "bus timing can raise another FIFO ready/free interrupt" is only
true if software already armed a buffer. Timing of a bare token does
not create that IRQ.
> unconditional list_first_entry() then yields a wild pointer, and the
> subsequent accesses to req->usb_req.actual, req->usb_req.buf and
> req->usb_req.length read or write unrelated kernel memory, leading to
> memory corruption or a crash. On real hardware this is triggerable by
> an external USB host controlling the token timing. Note that the
> enqueue side __xudc_ep0_queue() already guards the same queue with
> list_empty(), which shows the queue can legitimately be empty; the
> dequeue side was simply missing the symmetric check.
> 
> Switch both functions to list_first_entry_or_null() and return early
> when no request is queued, mirroring the existing list_empty() guard
> on the enqueue side.
> 
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>   drivers/usb/gadget/udc/udc-xilinx.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index bef06fe75..032d9f04f 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -1822,7 +1822,9 @@ static void xudc_ep0_out(struct xusb_udc *udc)
>   	unsigned int bytes_to_rx;
>   	void *buffer;
>   
> -	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
> +	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
> +	if (!req)
> +		return;
>   
>   	switch (udc->setupseqrx) {
>   	case STATUS_PHASE:
> @@ -1875,7 +1877,10 @@ static void xudc_ep0_in(struct xusb_udc *udc)
>   	u8 *ep0rambase;
>   	u8 test_mode = le16_to_cpu(udc->setup.wIndex) >> 8;
>   
> -	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
> +	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
> +	if (!req)
> +		return;
> +
>   	bytes_to_tx = req->usb_req.length - req->usb_req.actual;
>   
>   	switch (udc->setupseqtx) {
This check looks nice-to-have, as the non-control endpoint handler
already performs the same check. Please refactor the commit description
accordingly and do add the fixes tag .


