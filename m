Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CF606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oEIHWWQX;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WNNgcjNA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sf4QosnMgzAh3RofiboigMhdNzKJqkk/xLMACXdazmU=; b=oEIHWWQXwxIGlqrdO2IiDlMVXe
	ZZ95rBreElGpDWFtj+QyuPDbva7JMq6yp4rE7eU6fiPz+pOyayVbcDm+tKIKPJQTO0ZZ3zlLNQxTN
	6emuYAR+mfISEEs/Qp8OqcLaeBFXZFH93DctxiC9zDa49jf/S3EBdTkYlPwNNG3/+bDpd+nUpHAvy
	X+86yz+8dYeYLiILRXtt1R0nqcXHXhxVHZgpoHEduILC0JH6gRAU8WlG7AAmPYY6Lc66JFUclzF1d
	JXS074nHAcUAj4fqEBmnY3RpUp6zfD1anbRIvA2sbToG2Ss9v9zdx5DI2QJrrG353aNkHQPkDt4T9
	+RqbEaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGrp-0000000Bqtg-3hBx;
	Fri, 06 Nov 2026 10:08:17 +0000
Received: from mail-eastus2azon11010027.outbound.protection.outlook.com ([52.101.56.27] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGrn-0000000Bqt9-0uUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpQUdjX/3jHx8Pk/+c4hiHYStvRmyQ6O5gjJHaKrFjHT89MZWt06MZx6w7dbGxYAeaPm5GbJJ8g87TiAkWDlew89Q6daHCFL5QsE4o2BRn10DKjq4W7gjJPAHjriRvTFHtvYC+8SRowj5sDXpXlGd7X5z3Gp9m4FPcU5SHYm4z1RqF1mQIEnXbwL+fKc4xPorntbSPgBf9JQPo1iK8ocq8EN5R1w/ll00nAl+qzg97CvCR8kiJ5j2Jnu7rXJSqs+i6xing+D0aYG6vW4S88Lbd+4CZzc/HhJ+dn/Wu0IDrVGA8wS7JXHI3yW8MfVtivCgTUABjv4WuYmJ6nJU6Es5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sf4QosnMgzAh3RofiboigMhdNzKJqkk/xLMACXdazmU=;
 b=PGXmpkt5cUbhjlaa5Z3duapnQ7Q8/YBIKBFjGLeNo8QCyv4OAHLd6TEQ0uv09/H4QPPhU1d/UjFRhMCTMj37loTu+lGYTtPo4ypYHddzLVWJcDj8nquibyqPT4pcrjRdPlcuViUefhTf7/qdHxcMrd470Y5e7YBjEv5hYN029QFTlBG+faZpUkIo7/zR/57ZIZQ1GOd6zEMtnH1ZTFWpLogR829o9m/+MC5++9I210St3v+1Dg7Fy8eYCDw1oj7Ro9rTVWFY/+WWR26TIY2UO13zux3z0ghr0S3TrtiIXfXMew7/agLmWYJrLcj+SPV42yF+lm9rLrVO3Cqr+KVFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sf4QosnMgzAh3RofiboigMhdNzKJqkk/xLMACXdazmU=;
 b=WNNgcjNAIuDIL2jnFShi5uYyrejlTKqSM5JwtoExQ2awOU1fg0spMLkBAG0UxnAP8ZSlxQsNrWSVmBdC/zj+yYW4CjLbkwa/7IKQfnGG/XK7ZL7sZy50o5j55WtohzA8Klc4p3tldF+ZZPswJWeqfrpaV9bF7TG6uPYXiNar9fg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) by
 DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Fri, 6 Nov 2026 10:08:10 +0000
Received: from DS0PR12MB9060.namprd12.prod.outlook.com
 ([fe80::e096:864d:d60a:c83f]) by DS0PR12MB9060.namprd12.prod.outlook.com
 ([fe80::e096:864d:d60a:c83f%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 10:08:09 +0000
Message-ID: <1f35380b-3831-4824-b9a3-c1bee134ed6f@amd.com>
Date: Fri, 6 Nov 2026 15:38:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: xlnx,zynqmp-ams: limit
 external channels to 30-50
To: Arnav Kapoor <kapoorarnav43@gmail.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, stable@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
 <20261104164510.105359-2-kapoorarnav43@gmail.com>
Content-Language: en-US
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
In-Reply-To: <20261104164510.105359-2-kapoorarnav43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::11) To DS0PR12MB9060.namprd12.prod.outlook.com
 (2603:10b6:8:c4::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB9060:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 478e30e6-2f28-4dbd-16e8-08df3beddbf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: bFaQbXK6IlzeCfyJoXWCfpgH9IwUqZWyG049cIuCWgNXgtTTxxMIu7vvcOn4KTAeej6uNZ/YivB7GH5jMCsW+Cb5Q2uk4SrawbivrP+/zQE4aEooBYVVvnrUEmZ+FbFRWHOugWOvo6X2NVdzg4jMTO4G8lET+TMhGxorWuyjHWLT7nhGLn75K3itBOM+azr2u3O2Yjq3r9a8YKm6UQk09xAwHDkRZnItpBhJexEl8R738j/zoZCz2Mw0i0FcJtk+PVIYyaz7fPtCSDna9mNZzO/70xTiU21ZDTBY9/C3N/YQntacctpNUIvp61tGNM9q8T/mp94OsnWGNzyCOu0wrPrkDnw2PacLbkg4GoGKDTdpFzqPuDReUW9TFv6GUaVqY9r7SVPjsmr0qSgZ8epwg9iXKZ34yDOpPlEhKEl80OdTZleTumKoeWxB1pFcq0GKGsxdCglBKNttW7A4iwsQL/Q8xCmovB2OzLTROMp96p9+cGIV4EloKhR5dau2R3lkRomdKa+dkYBYotAqSPTTfExgrylDnJ9Z/zsnEozkuqqCYSiFUey0JK6Gu9+5zcd50Je1adgqvwDEmgw7UxkJo3BhZdfUweza5vC239epTjq8srbu3HqDjtrua0nxM8pNWATrkTbF8EN7AISb8zaT4oSkQdneXo7hCBuboaZfdac=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB9060.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXdvWC91eGpCMUdvS2oxTVhIYVZRMmFtcjhyWnVpdndhRmN6VmxGNzE4NjV0?=
 =?utf-8?B?eERpZ21JQTFaQzIrb3ZvTUE3bG9iRzUxSG5ubzQ4MEFKS0dQeS9ZM0hlYVFx?=
 =?utf-8?B?ZWs1VWN4TkNpVm1MTjdpTmkxNkVHekpoVVJwazlRcktkUnhJcUFsYllBbHBQ?=
 =?utf-8?B?ZEJVWk1TL1VOYU5xVDkwWnUzeHlNc095UitjK1REZEVMcys5N3Yvb2taRXNS?=
 =?utf-8?B?L0pKNkFMeW1HeTd3Z0laNDlncGg3Y3pXbjBoY2M1eE9FejZXWExITEJNMExr?=
 =?utf-8?B?bzZmckhGaTlHdjluWVRQQjNMcWc1bU9Bb2hxVzVJRVphbnEyTC84Y1ZZV3Zr?=
 =?utf-8?B?dzFhS1JTQ1k5K0hhaHJRZVBqckQ3VDVtZSsvMzJVNTRCQ1pDT2NLOGUwc1Ar?=
 =?utf-8?B?UHZONmNrVk5ZRUgzOTMwRVY2K3hmUXNKV2hMeGZFZmMvOE8vZU1xd0p1dEFa?=
 =?utf-8?B?clkrdE9veXhteDVYRWNQNUp4ZnQ5ZUlwMXJhNEJXZE4xa2ZpSzBmOUg4NXQ2?=
 =?utf-8?B?dkJPTmpHNVVLYjVyZExWRXBzS1hWMUEzdVI4Z2I3MFFXbC9Tc3lzSzZVVFVK?=
 =?utf-8?B?NTczTUhSdkJJRHFDRGgvSmtzM0t1Z3RDTnhhUm51YzUrWWdKNTc1cFBVeFBO?=
 =?utf-8?B?b2dMVUxmYkFKMGIwb3N6R3lNbUpDNTM5NDB6MlNGcHlTVE5NUGlSVlR2OWt0?=
 =?utf-8?B?dHVGdWk2bkV3aGJXeGI2T3IwY1ZIZEpUdk1XVC9pSVZyUzIyT3d1bFhiTXBa?=
 =?utf-8?B?UkZuTG9yZ2RNRFhUaC9RK09OVUpVWmlqSHc2bmRCLzROaFAxRHJvTW5ObEha?=
 =?utf-8?B?aXRUc0ozenBzK0dtMXVVWUtOZUJBUzdrQnJ6TFBaUlN4c1RvS0gzUFVTSng0?=
 =?utf-8?B?RTAySFBpS1hSTkxhOFhxL2NFdmdtYzJDN3VRUHBKZVg2dHA2TmZJdCtmbklu?=
 =?utf-8?B?NXVLSHZtSlV2NDYxVU16dmUxcld1RHRLYUtHZ0FpNGtVYUtKVUpzUEt0YU1I?=
 =?utf-8?B?cU5qYmtiU3VpNjNQbHVOUDFnQUl2SnRXVzN6dVpHdFZxQkhpL3FWR0VSQUhC?=
 =?utf-8?B?NnUzaGhjUEFETnVad0pKVmNYUWt4R1B6MXd5U0FSdFkxd1Zsa0ZpanVwQlRp?=
 =?utf-8?B?azlrMDN5TnJZQUJoTC9MWDBwUnBaWDlGQzBhcmRCZlR3REIzdTJNWDRJanl3?=
 =?utf-8?B?dDhBNngwSWM5VG5UcnJjWFIzMVJvR0FyY2QwaXFxNUU0RURCNHZ6VElhZ0t2?=
 =?utf-8?B?MzZpemE1WGtBdFZ6MFZTME5Ia3Nyc2FjcjEvVStTTDBveUxKT29wNXY2QnNy?=
 =?utf-8?B?Z3BpeitQc0FMZUZXQ1ZlcTdBUmUzeG00N25mU0JhcEZGdzlpczBZQzlvMUg2?=
 =?utf-8?B?d0sxczcyWktzSGRaaEVQdTVSNkprWXRIcWk4SVJLemZQaHNmbWZORFRoMktY?=
 =?utf-8?B?UjBjaUFMa25JNEZ3ckgxb2JIcndHTWxueDhLVVg1U010Y01KTWRYUGRYTnF4?=
 =?utf-8?B?UmtEQmwwZG1tc1ltTm5BS0cyTUNyaFRDdlZSWXB4Nk9ubGo3MkE1MW1jM2c5?=
 =?utf-8?B?UmVHZDBmNWY1SkV2c2dnRXdZQXFCQ3VTZEtsczdCR3RYZkx3UUJtWE54bm0v?=
 =?utf-8?B?MFpLTmFTS1V2ME4wR3FBbUppZWhwSHRVbG1KdGQ1L2FNM2VWR0ttbmFSQ3l4?=
 =?utf-8?B?ZVpXWnFab2NJNkNSRnVWbHpBdzdlTWV5TVRlN2Z3REtvK0F4OFdHRXFaSFB5?=
 =?utf-8?B?RVNQdy9KVnVXbnpHWEhqbTl1MmgzQm5PdW9rZ09ORmw1c3lkUWxCMnZqckV6?=
 =?utf-8?B?YWFPakZ3UGJXZDE2RTVESUhvT3JkZ3laT21SdTZobzJwNDF6aTQ1cjEvSWpr?=
 =?utf-8?B?Y1FYN3RBRVVZak5PdTJCRFAzYTBwU0dHa1BBdDRzaTBvOXpja05ZZ2RrUnha?=
 =?utf-8?B?VVJBaXliSllYbUcvcytJQXJUN3lYVS9wWFl6TnRoUG9HMG4zQ1pTeUhUVHVE?=
 =?utf-8?B?OGRUY1c4ZGRra1NuV0hwOWtYWG1Yak9FTlRQZjZYRldGVnRlNUVKRGF0VzdK?=
 =?utf-8?B?KzVEVjAvYmdvcGgwV0MyZWt0Y0dOK3orQk1BT3BkbzlaeXVFK1p4MXVxOHJj?=
 =?utf-8?B?eUJuZWVCMVFKVUJPSWV3bVVkUlJmYUNEbVMyOTB4TUpWak9oMmgrTDJObkVh?=
 =?utf-8?B?ZkJndnVpa3FzT2dPUnBNUHNrTWZVV3VhZXVBQU9YZHZSSWxkeDV0OG9HTTRj?=
 =?utf-8?B?VzROa3pSaFFZVFR0THI2SVBTSHVHSG5Na0JucmxPVTJKMWNKaURZd2c2RFBU?=
 =?utf-8?B?UGlFczhHMm85dVVQcEprcXpUU1N0OGxKdDhRR3RWcHBMZ2ZGakszdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478e30e6-2f28-4dbd-16e8-08df3beddbf9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB9060.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:08:09.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBjVZsERufLjhxlR+4OijGFgohN3XR1yQllO4YjhDUZ1h8PxyOwHqRa8YwfBqUo+cz+0sJtL23VqEmpTeJqsyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_020815_418542_E6098FA4 
X-CRM114-Status: GOOD (  18.39  )
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



On 11/4/2026 10:15 PM, Arnav Kapoor wrote:
> Channels 20 to 29 of the PL-SYSMON block are its fixed channels (PL
> temperature to VCCADC), which the driver always provides. Only channels
> 30 to 50 (the differential input, VUser0-3 and VAux0-15) are external
> channels that can be described as "channel@N" child nodes, yet the
> binding accepts any N from 20 to 50. Listing one of the fixed channels
> there only makes the driver add it a second time.
> 
> Limit the child nodes to channels 30 to 50.
> 
> Fixes: 39dd2d1e251d ("dt-bindings: iio: adc: Add Xilinx AMS binding documentation")
> Suggested-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---

Looks good to me.
Reviewed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Regards
Sai krishna

>   .../devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml       | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> index 3ae1a0bab38f..0872f5f314c1 100644
> --- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> @@ -160,17 +160,18 @@ properties:
>           const: 0
>   
>       patternProperties:
> -      "^channel@([2-4][0-9]|50)$":
> +      "^channel@([34][0-9]|50)$":
>           type: object
>           description:
> -          Describes the external channels connected.
> +          Describes the external channels connected. Channels 20 to 29 are
> +          always available and are not listed here.
>   
>           properties:
>             reg:
>               description:
>                 Pair of pins the channel is connected to. This value is
>                 same as Channel Number for a particular channel.
> -            minimum: 20
> +            minimum: 30
>               maximum: 50
>   
>             xlnx,bipolar:


