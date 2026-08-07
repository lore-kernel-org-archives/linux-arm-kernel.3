Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCE7C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/YK+ve18dI2RnqnI2vaBqh+a24TJ88tPstElXtHvRY=; b=KNhdZ61VzA9g5KYyJ1kFj4LNAi
	yA7xkZP1WLSAWrsXbzJ5hVpS5BeCnhKai+WL5tTgcyUnxcOdcytlGIi+Tku8HntwxWeuEcs5/mPul
	OhwAstN7NS+d4EoFoB21NewLAyC1MVSwHEokrt/sMiEa2ZTEhZ1GyinAVvcndsb0fstxtOAkpzkdf
	fKD9BzEshNYQP30agz/9QCiRvEXGacGOLOeAWYpuJUv7t5IObauPOeGJCYdsHpKuloRcDOagd/X1r
	attGvSYGzf2GiIHfqI9z+Ml+up2vV92s4jMP3pbPWcwuMkQfwCXVp3iwQYPF0vjk+5uIIQLHJnFva
	slTIrNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG1n-00000007Qnr-0FWf;
	Fri, 07 Aug 2026 08:34:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG1l-00000007Qmz-0bTA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1/YK+ve18dI2RnqnI2vaBqh+a24TJ88tPstElXtHvRY=; b=LreznnukBUainBSRxdbLU2iz/k
	Ta3tKlawv1A90CuIL/CLWBnrUOYXb+POMSbHNizL78rHxWQA9FtTLgjaXxwWW9AOzMUFqqJW/Od7n
	n5DzCqHmtykFEIyheZEQe2XP0IWBmKJIX7wpxc0s6ZQJ2OpS4zDV4UaYgvEqqxeiLPnQ4bCai98gj
	1viZGM23NCSC4+7ZiWKqPkUVEj/U3DRyhgFdNBC26qLmC6AM5pes7dSdB85+ilHL6+2xsZdfrKZXS
	SkrdjBOtQt8RG0fY9ucYsnPp+/5Wr+URvppRHFcYVnNpvP/cftV0CF2bbmbV8JA8TAnpeIJfcsKlj
	uEO+k1Vw==;
Received: from mail-eastusazon11011046.outbound.protection.outlook.com ([52.101.52.46] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG1i-0000000CCbG-0407
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMgsrmhnzcaq5CIrTX921kiSSN0G+PMSZy9RTE2j4k4JH6LetDtrL71/vGyYrOOkCa6/PgIs3Zlv5ayfrtdWVfvvLPDEDHbNIo2H+prYbzKTt3MBC0TpkemmduK2/oAKqLkePqjDgtJsGkegaAgyHb57QXXvOskxtUZbi2yWIF//LW0vSDPVuVFWonXKUktpcpHEekfAsnO7MPvedbPLkzv5x7wSH8n0MBBePgdmNAGEPeBMatktCPDycIt1CGtLivjjXgpLbhVcg0u8JVUCUl65jGfTZ6q9ZEOON0NyGQbZaRPIYyRuofgeLoYgqwf2ruIABf8HPFet8R7sMuJS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/YK+ve18dI2RnqnI2vaBqh+a24TJ88tPstElXtHvRY=;
 b=QlfxI99QVBATzmBPZUaOXCkWsKrOIhb3s1TzAo1GBcpnFaW/jweQTDYT8W/x2qT9GrHktTPTHoB/tmbjFxM05F6eAlRbZ+s4K11Hf1EXJDCGg6gp3igcGWJLphCEQdw2NNrdtZc+2IeLgBeFQdXlXjUfq2F/Jah4wueYGKy+Mz5QHHx8t53GBj/PyTHbldcfLRfObQgQTfkl00xRCfRpDr1K8wVnmNkUcrJmL7o1WNue8T6MuFXvKfAGEYQpxeXkbjtbH5Si38AwPtBb6TYgoO0Gce5Dqdo+RXfwrqhixwIsryUpvX6IC+pAzVWCwLwcwH+X4hX3Xfm87WxqNUCp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/YK+ve18dI2RnqnI2vaBqh+a24TJ88tPstElXtHvRY=;
 b=GYGtNb8w2msgUtmIEVzecjqBERhIlvaV+fJG+NQ4F6FhLGF2f5MHNJQyGMPXJJZamQY2QQgajXnwKnfYFOvy9P/8tTvRjeO5QOprn5No8N+kxkfJ2rgXmrIrVQ93UuA816K7OGCVvRJsqHjnj2otTAMVFx/EhaFgV2E+XU0W9G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Fri, 7 Aug
 2026 08:33:48 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 08:33:47 +0000
Message-ID: <0c33f43b-782b-4c15-ab67-a5038bae3925@amd.com>
Date: Fri, 7 Aug 2026 14:03:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: xilinx: axienet: Treat xlnx,rxmem as a
 required property
To: Suraj Gupta <suraj.gupta2@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michal Simek <michal.simek@amd.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806170253.1199749-1-suraj.gupta2@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260806170253.1199749-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b022e0-231b-46b4-6c24-08def45e99c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: etLm8sxl2LU48D49Q0oZf78UwunpY04crezpkHfpFMtPJKrz1Tk1ZmxZX3dQ7vtjp5mL4Rgzz/FioPhQIln48xQYNU+CtXIZ9iFDITskYg/FIwz3ZQoLqVra0a0/+42K46Yw61FX5usYUyfupKBdGsB71L7Kcu+x4xlLYQ3QcyAEef2nsEw7N90DLANnSAxjCvleeiXj14wDRwroVRzzrj/YeASaS6i19pd/rz6bDCFPCGvL+bRm9P2Q39L1jYwDOW7xCPhyqHtuGo75hxqDIoxydyp3aYqg1Vv4XlaWegiI50Tmbz78nHlDzX0cVQnAjFEFeC6Kw8R5n61DYonL+/uadArr2McwZdqSMnb1YyKeCNIasNUzEY3ER5vyElAP0MyjbOpj+f9iQBnIKMaAwWGDu/O4yopp8NTGIRFNDqFsVSpbFE3yQk83CIoyI7hRTS37p4B3LaAsvwW8SvV0kAjI6aL9OUuaq8O8HAEawjrsq3MgPaHm3LSesmJjNAXQTjW4XLqyZznEWDEBi3lWaDUf+DrZNnetNi9zd1fPCWdfb5XBJgpkIxquWNQCiAI+Qafnpr+gVzkbFEEVAflDcXU87kgaXZIsGqsK0DUwMXNiB1NTQG5NLL6QH5Gyp9Y3Oo3HtyQm9R0uzjmafKdKQ81kTJLmm2GvvQIFbT66muE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXBFWitjSjJ4d0t0ZFgyNS9NbkxLam1UNVAyTVlLZjc2bml1UU8raENVQU1E?=
 =?utf-8?B?a256enBwem96d3BBNmY5ZU9xNVJUOWJCTzFnTE9BMS9aY0I2UEcrOU4vRFla?=
 =?utf-8?B?NmRBZUo3VzNCM2daTWhpd0tmc0VvUGlDbmZTdDlBVHNvb3NCOFQ0SlIrdHZL?=
 =?utf-8?B?cEpqUGZKM1B1cERjWmtDc2hZanZEZ1AwaVFDencxODdyRURzYTMvZlMwU3Bj?=
 =?utf-8?B?VDNmOEVVNm5VM0xrbzdNODlTY3VoNnlKaEdmd1IzeHNPSWhXeklhejliQUdq?=
 =?utf-8?B?a3Z5dDA4N3VRd2pydjVBMGFpeDYyUmlPUE54dzhzZUJhbmpOckJqZ3VkWkpv?=
 =?utf-8?B?a1hIaFNUYWF0Tmhya3dvN2dWU2ZsTEVlRHM5ODVZbVJJK0VHalN0b3JYaWF0?=
 =?utf-8?B?cGg1aFJMYXJJT0JIWXBRMnozTDc5SVZkN0ZtUzg2Zlgzem5MNm9rTkxxdGFt?=
 =?utf-8?B?TDFQSDNFRU8xYWJ4S2w1MEZEMzBmc2VRV1VVK0s2QTlKbnN3T0I5MmVseHli?=
 =?utf-8?B?aExZbEdwRkNJcEpCd0Y0bFNOa09kc2Vsb0hMbGkzWkpjQlJLWU4yTEpHKzVz?=
 =?utf-8?B?bTNnOEFjbUhxdnlrQ000MHhnWWdNVXhjOERSWW1yTGRjcWRhUUpSTVEvSGhR?=
 =?utf-8?B?Nk1tdktZWEtVMlpvMjZLQkQxWmY3V3ZabGp3NUg0TllKNzdFektINEFIR0dQ?=
 =?utf-8?B?cDV0cWhrZEtHTVFCNEhrdWlvYTdXeEFML1c4T1NWREpJZGp4WmdTUjczL3Ro?=
 =?utf-8?B?YTRGdUM1bnVSblVKM1VPK25YWGdsWm1qcnFvaSs2Wlc2RkVKdVFSMDd2WGNv?=
 =?utf-8?B?SEFBYjJ0eWVaZDNIN3E5bjdCRjJSTkF3NUEwQlJzUC9KdW4vaHg2R0VJS05E?=
 =?utf-8?B?dW93NTllRDZmM25CVUZ0Q3VNak1GZHNOWmpJUnFVSWlnRVR0UmNXTFVmZTAv?=
 =?utf-8?B?QUJSN0dYazdyUW1vTHFSVVlqWERtK0xrWXNJTEcxU0FqY3JCb1lPSU9aUGdH?=
 =?utf-8?B?NEZLTnpGNFJyUUlJSU5hR3NtY21BeXVGcFdzbGJhaDFYL3ArbkF2a2pmOFJt?=
 =?utf-8?B?ZHpheEtsSThGaTY4dUpxaWwxb0FUWDN2ZlFPVmcrZUtlZ1pIMjhENVR3Z3BD?=
 =?utf-8?B?VnliejhPZXdWbzJ4NXZEc2ZsejBkSFIyL0xBS2RsaE10WWdiTkdaQjB0aEtx?=
 =?utf-8?B?dk9KMlY5K0c1MnhCTGpZMnFJcmtOSTZDTGtPd2l3VEFnV2lGNjFFL2hLWnov?=
 =?utf-8?B?c1ErdkVsUXppb3hpQ2pDTjAwY0E0VTFKU3gxbUtxTXh3dTlkaU5SaTdoMFJH?=
 =?utf-8?B?RWtJdS9JQWVZd1owdkdVbkZNNU83aGxoQUV4SmRXbHlLcy8wWkQxY2pydlB3?=
 =?utf-8?B?Qy9kbUZQck1uWlFWamgvNEw0U1N4aUFVM1ZOZUJaL2lmWkpndlVqaWpQdVNJ?=
 =?utf-8?B?eTZyS1ZRa3pWRjNhbGNoM0xhZVFOYlorWGs2Z21aU1RhTEJyV1d1M1B1ZFJN?=
 =?utf-8?B?RnFXdkhoWWtQTEZ0anRlVEUxOW9yUEZGcXp1UTg0MUJWNWhXQTEyUGZPUGY4?=
 =?utf-8?B?UW4ydVJpRm56T2UzaXc1RkNTcERIRk1sUVM1ZHdac0lyUGxSUkFWckduMU1S?=
 =?utf-8?B?N0ZMdFhUNmU4RWlXM2QvMXFqeVk0ZkFtc01oWjQ1MkJ2QW45WWQrVmsrNzIx?=
 =?utf-8?B?S2czQ3N3VG8reWh5OVFXM0pZL3kvUFMvaG5FNjN3NTg4ZnRVbG54WWI3RGxX?=
 =?utf-8?B?OStDdU5GbFpLSk5pRFY0Q1pvSXFSd25Ud1hDckkxVERUMnNMdFBzcFlIcnJu?=
 =?utf-8?B?SXNyVEFxdjY0YlQwRzNNZkZzSHI3bllLRGhSN2xKNlhFUUlKZCthU3BTV1da?=
 =?utf-8?B?QitSYmJDMkV3Q2sybHdqam1SUnErL04wTHJhMUs5QkNiRll6WTJTTDZxTWFK?=
 =?utf-8?B?SVk1Wjc4cGFRV3ZkQ2FiRzNyQk9QOGNBQjY2ei93ZDZ2VDZWdUZtVFovV3N2?=
 =?utf-8?B?ZzJzVDdwMUdieDFDU0hKN3QxSi9BekZraldjak1jSVBTZlArUGV6NTRYRnBk?=
 =?utf-8?B?R2p5MlJ3Q3dEVi95amJ3NGNhNTliTGFCR1pvSi94b1RoQWlSOXptTDZXUERM?=
 =?utf-8?B?YUtkMTFjUW5sVFArbGxDQmwvRjhtVVQ4UUxkZnA1Y3BBZlgzNHRzWWZ1LzhQ?=
 =?utf-8?B?Ui9IM1pzSFJCZElvQitFWnkxWUpkVmxMZkgwNWgvc1YvQVdDbWxMMVZiSmpE?=
 =?utf-8?B?QTMwbXZaL09UOEFWSHlBTGpUTWFJc25zaDkyZjhUbDBJZXRIRzhQdTBNaVVF?=
 =?utf-8?B?ZTVvREZ0S0dRVERWQVd1VG9kdU5mYkhUUlF4a2hiUHd2aDVuUkx3Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b022e0-231b-46b4-6c24-08def45e99c6
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:33:47.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb7XSUEoj058cO1yuDIF4cVCWqh3rS++BTqUK1zKNgZsKLmxtOWKRLhGpRNO47lI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093402_162180_828C5A6B 
X-CRM114-Status: GOOD (  20.79  )
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

On 8/6/2026 10:32 PM, Suraj Gupta wrote:
> "xlnx,rxmem" device-tree property is used to learn the size of the Rx/Tx
> packet buffer built into the ethernet IP, but return value of
> of_property_read_u32() is ignored. When the property is absent lp->rxmem is
> left at 0, which silently limits the interface to the default MTU and
> disables jumbo frames with no indication of the misconfiguration.
> 
> "xlnx,rxmem" has been documented as a required property since the binding
> was introduced. Check the return value of of_property_read_u32() and fail
> probe when the property is missing, so a misconfigured device tree is
> reported rather than silently degrading functionality.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!> ---
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d16..1722b7038f34 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2898,7 +2898,10 @@ static int axienet_probe(struct platform_device *pdev)
>   	 * Here we check for memory allocated for Rx/Tx in the hardware from
>   	 * the device-tree and accordingly set flags.
>   	 */
> -	of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
> +	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to read xlnx,rxmem property\n");
>   
>   	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
>   						   "xlnx,switch-x-sgmii");


