Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64B606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hhgNbOKM;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MB46x0ty
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNWyhPXoU21O353nTjCFGz/0pi5ch+sL16ZIZx5ALzc=; b=hhgNbOKMo9PLEo2URWheyIqXkB
	nbkDi3UqM51+gW8bH22YKmbQOa3H18PZ5+Kts1RLiJex4MmOA+qv0cNBNP/EFTqPM7iDrD/+m8K7p
	DQemCgej8u/D+GGdIfuT6a1HMXf8sa8YvEMNHeGu3LojlUuQfFVD1XvdeBzoY3nF8xvTgqSxAX4lW
	rUqqU4u7cVRRx2eQyyasFjbPPB6/wsGm++leOUU5apU3DAjf43NRL0K1UqfM1l9pGKK0MIG3XLGuc
	mJLXL9u+PKGvBgjsRvv53V8QfOKBN2OMLVoggk+HBt2zBhYDf52gluw76dfAaG9/3cQG1nd990Tfu
	8ijt/8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfSU-0000000D1Ei-4BQK;
	Wed, 21 Oct 2026 23:10:59 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfSS-0000000D1EO-0e5W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYAIuqrQKixzKruh5xr7DY+XmXxLcZjiyuNeFeTg9RVYHc7DrHNq6kMCWon8SCgRe5miUDWtZDgdxcHMawLAculbQbwKhkP2G0bMRYKyISGk1HxsQkmkluOmxpeVS99Yy0NNk8tiSq23/TCwIjn9xyKcx8ladViJXhFJhon77ASKEq96XMdvkQ3yA/Bo3yXXUTv4SOFHB2bpyaimWTA/uHQAQ6FEMESqxSD/guOAjPfR1NLCiu0gtyUn+EFuJ/Sj/OBKIMs6LZlX4iXXnBRKKapzAmw2Sy7LpR2j16Dzb7IOr5l2RwWkiByn39MaFHTs6sF0uPdfEtVKErkAAb5fCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNWyhPXoU21O353nTjCFGz/0pi5ch+sL16ZIZx5ALzc=;
 b=fXP3IYJsGMT47Z1JscnH1k0orNRJ6DYp5Qz2SFVrFarx2V3fOyIsrsrtKO06Cm8jYmgr3jyfx+pOPwWTMrVf99UoE+f2QYs3tZTdiM83OUYRMmcC97M2r3iMkHmTV0SqxZRbPH/+hWsoEPYNi7NUloQyHPVeVN7UIhxF0P5d3vedVAVrLtrQV1jHnwKhYGHRkhtsCpGz28pBRFw73IMasd/OWZ/vE8mpNS+hL5Sp7UO7FuctJC/vl4QPZcHlU2raNGan5vJfwsyRM9q/I+61QvCTKrfFtKhCLfPjndw/Jlb5tz2uCPIWUSOfIS4sC0V4d7pPsFmAm5Hmj5Ohc17krw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNWyhPXoU21O353nTjCFGz/0pi5ch+sL16ZIZx5ALzc=;
 b=MB46x0tyIVC7s0lqJirrhsGGIgkmMrFL/j/g4l6sJDCKmrve5aQRvR2Q3jFro/RCtBohK0S77vwYHsj7GWgHT7x/2FkrgYW7hT4NkmI1MpqrFcCG42HtdEAGtCEtpZUEmqTC3I6TD9Lz00iweOo8ojcgiI1XPaui29wfkgWGRzeSDrBi1MWyIFyZKQ6mxIe9cQEiX62JouI+0hdA9Y2XTBWizMMttcfgV6bRr9fK8eB/Q+TZiTaoweYbRo75hUtTN2BNopxR4dy+zHEcsNayMX1PTi+vSm1TVtrSFNGutU++xutY8lN2OJvrY6Wwat2PLMoVfRZCXYR6k1TdxDoKeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by SJ1PR12MB6339.namprd12.prod.outlook.com
 (2603:10b6:a03:454::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 23:10:49 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 23:10:49 +0000
Message-ID: <658ec783-75c7-4f06-9f92-b3c179e0f8bc@nvidia.com>
Date: Wed, 21 Oct 2026 16:10:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
To: Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>,
 mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
 conor@kernel.org, jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
 <20261013070205.3566865-3-smadhavan@nvidia.com>
 <23e9b66f-083a-4a77-8214-25f30c08057a@arm.com>
 <c0c04151-1ba9-473c-86a4-e066d6881858@arm.com>
 <03b070de-b0b0-44d9-89ce-891e6c3ac4d2@arm.com>
Content-Language: en-US
From: Srirangan Madhavan <smadhavan@nvidia.com>
In-Reply-To: <03b070de-b0b0-44d9-89ce-891e6c3ac4d2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: f90fdb24-8a7e-4d0b-f407-08df2fc88b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|11063799006|4143699003|5023799004|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: bfP77Cn6KRl/oxfpc3w5CujLASFfRaCMfaZ8BELuzYTlnjXs1j791VqDAdAOL8S7UBJOIQ2qmKXp4uidNK/xTRB6G/aaQlIXUObD4e0NoRuSUPO2nE2Bzoez80aTgYTDaJLoikI3ktmXjGF0aD+THkb/jxNbHrohJu7rgXmGNY2akGW6COdTNS9UUKkZ0k52eQ0KccoDgErWafvyESMi24W0m8Yw1+uIT9sLBO5EvzOLJ8JR2JrXpOdSRkOrQp+mnFztfWprhtzgNHJIKy2NGa1rw3jARCDrz5YvERxbw59KAS1Q38mfVhyjY/XT0yFxnI5d88KkaS1Uf8mnzhvOblQIIFZtgO/fwL59YzEm/4sqAD/sgjb4YQ+/pjP/dDl7dAOA00gG2HOIfPNnk0KdAtPPLTeERYD3+ZmFwoASYz2kjRsevcuVhmMqRFZy2/Gors7yoUFuYWzMz5jrU8hL1/QwlXwr1UVHLRWn3ee35As+rOE7s389NOIDSTwdjfbjl9JDaSQgBDEThFq/CDx7Mt0LpeGUXJmZZ9J1B7RhfolFkD+vF/8xX7P2H4CnDLPTzLOkMEM70SJJ5RfmgVPts4Ec0ZCTTI76q5wDSiZpVcgJpbPnrUoCC6leb9j/gorWkYW8jKmWW8oG5rqvsBpCovLs9F4qHQzVC544eKhj0iY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(11063799006)(4143699003)(5023799004)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29QU25iYU5LNjZLdHJSejk3UGdkZU1hc28ycEV2RHA0eElXcCttOEoxaW9Y?=
 =?utf-8?B?NHRGdjdTbkUvQVVoVThkZmlqSjJjSFhVWkNEdUNUSE5CQXJUNVdXWDJlb21C?=
 =?utf-8?B?T0pKZmRLSktGNzZKbnVnOUhWYUJkTXR1YnVYOHhRb3VzVkZib0g4MXBNL2l6?=
 =?utf-8?B?aDQ5NGUzZmZDalNzMnE4QjJvYi96cHdsZytuMFhtQkJXbEh4bDBjcGxibE5i?=
 =?utf-8?B?dklGcDUrTk5xaWxLUGJLT1Bka1NLM013WmJ2WmZQdWRpY09Yb0dBTVlxK09B?=
 =?utf-8?B?dXJia1pyeEJyMlM2aTlKcUw5U2dDd24rVHhvUmV3Ri9rUE5RNTFBNXR0dlk5?=
 =?utf-8?B?WjRQVU5wT05aeFAybjZOUEdrc3dpUEJOSmNlajdFeU5GcWhXTGlMY0krNy9j?=
 =?utf-8?B?WEI4dFQ5YjE4V0V3RG5wNXRuNCtJQWEzQTRMTVFPcjltQmFEcjVac0MvQ3gw?=
 =?utf-8?B?b1lIdXhxZkdtd1JoOXJrTkQydXV0WjdLbFl6Q3F0OG5HWEFPd2ZKYnZlV2Jr?=
 =?utf-8?B?bXVwbWZ5YThZU3ZzaWUwMTJCS1IvSWhlV0pQeWxFT0tuNEN0dXlBZGo4akFU?=
 =?utf-8?B?R05QQ05MOCtuWVQzYWMvSk9NeEtob0d4WHoxRjhJN1lycDBTa05wenhKaWNz?=
 =?utf-8?B?bnREdVh5NkZPRXIwMTVDbk1XRnpLOGpwaytXNG40SDJYcXZLUmxzdmRnR2s2?=
 =?utf-8?B?bWtQUGhHSlZ5a29BcHRzTGJPVFl0NGJpN2ZleC9QUCtaamh0WHZjVjZEUG9R?=
 =?utf-8?B?ZlZ3UUhVYmZlZzBJQXc2KzlMUi92Z0NObU1kZEpXQVhUUmNRNllQMVBhQnlU?=
 =?utf-8?B?RkgzaWdTVFFCdVNUVlRsQ1NveWxlaE5tWkJaRTgveHQ2ckE4aWRUZ1YrRm40?=
 =?utf-8?B?cUs1OGpKVG9ocDJ1YXBZMm43alJtWUlHMlM2TVYwOGFoLzJtUFhsWG1nTVpS?=
 =?utf-8?B?cVBZV05JSkJvZXBiVmhTNzVyUUZIR3hSYWl6TEhPS29LYXkvamwvc0xsbk5w?=
 =?utf-8?B?ZFNVekYwaFRGS1ludExSYlVodEp3dFpIZG02SFlDZnZBN3VzT1MwRitpdU1B?=
 =?utf-8?B?REFDYXlNZytQcDQzK3JzN2pETU5CemZwZTRFdDNGbDhXRXBBK094RGpRKzhi?=
 =?utf-8?B?dE1hR3hoVTBPUnFqNnIrV3NEcldJeVBPUTdmL0YyWTltNVJhVFNhQmU2cGQy?=
 =?utf-8?B?Q0lrWTN3bTA0S2JORGhCVnJYQ1lGRmtaazR1a1hZMkZFK3lCN3oyYjQzR0Fy?=
 =?utf-8?B?TzQxVlRxZ2Y0eGlGbElsSVRxUENtVVd5cnVlNjh5NWdwTVR5NFY3eHVaMVRr?=
 =?utf-8?B?VUd1OE9ybC9GblZSUGc1VG9TSTg2TjcyeVFaZWI2eGJIZ05DZ2EzQU5tNGlQ?=
 =?utf-8?B?ZnpjQnd3b1hIYnNvcDU2YU0zN01kTE1JZ1ZVYzRvei9rb3BzYTVIcys3V0Fz?=
 =?utf-8?B?MHhrVTNKZTU5SGJ3Q2VSQ1Z6VUJ3WTBJbEJ2aEJQekhZT3lwSWRLRmFXT2tC?=
 =?utf-8?B?OElQZFV2NGRKT1NNNU9zbFlCUzc3UGwzMHFrRWdCYkh6RjJEbWZMdE1ESWdP?=
 =?utf-8?B?OUl0a2NDZnV4Z01HWTNKTkozSktQQ3NNSzZFQndjbUxsczk0NE5XNHUzL25n?=
 =?utf-8?B?ZHpzUnpnbmhGcU4rMzJCSHJhYXlPbGNMNU1xRzNHM1B3REZRVGdNMWRtWU5Q?=
 =?utf-8?B?Tk82Q1FVRm9naHY4MXNLN0ZSSm5uSFg4ckdVNEd6MU8xRS9Pa2FVckxPTDF0?=
 =?utf-8?B?UEJQMGtRZlBOZU45Z1J2bytVZFQyRWZTb042aGxiUGl4dzZTSzJ4RDBnbjBt?=
 =?utf-8?B?SmJESTVqWkEzU3NPeXI1ZllBM1VkaGNhYkZqQjh4WU9NczI3d2Q4T0JLT29p?=
 =?utf-8?B?Z2FJNnRCdDhzZFZnQzQ3TDFvWTNpR0xjTTkwd2h5aCs1cUZEbVE2U3pURXZF?=
 =?utf-8?B?ZGNpaytVd2pNMFhCSjFhTHdONzgyaDBIQUdpTG1jVkNyZFBSZkpVVWp0ZnQr?=
 =?utf-8?B?MUtVakcwZjI4ek9nemkvN01rbFBITER0TzNKYW1WekFqaU9QK2FQVXk2ck9P?=
 =?utf-8?B?RWVtZ0ppVjIwVURkeXByd0NqMlRQZ2FrS1ZBZjcydUhYMUh1TGJJclpZU3N3?=
 =?utf-8?B?NldoZ2p6dXBSOE1xNTNoUXdMNU01TWZGR1dLQ21odHYzaWlVY1QxZUxzbGUz?=
 =?utf-8?B?L3VGbFR2UVhjWnpqTzN1aWMzVEEzYTNmdWZ6aW4zSWxwaTdtOG1GQkZ0bnBL?=
 =?utf-8?B?N3NTZ3NyN2lGdWNway9WcHgwcVdqWGFRMGxNUEVBbklEaEZSNkRQSmFORlo5?=
 =?utf-8?B?Q0tlTEdQdURMdDh4WXNoTmVncktuYnVpMURHT21qTmtQeCtQbDJ6UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90fdb24-8a7e-4d0b-f407-08df2fc88b95
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 23:10:49.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lnHsTX1zPKxVQJzyDp2XG/oB/B3TiTHrEqgSc6/sVVq42mFVoQezK45n0W2Rymc4lkskFMATSSdNtkaBx+Qzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_161056_198041_023655A9 
X-CRM114-Status: GOOD (  18.41  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/15/26 3:03 AM, Andre Przywara wrote:
>>>> +static int smccc_cache_probe(struct arm_smccc_device *sdev)
>>>> +{
>>>> +    struct arm_smccc_res res = {};
>>>> +    struct smccc_cache *cache;
>>>> +    int ret;
>>>> +
>>>> +    arm_smccc_1_1_invoke(sdev->func_id, &res);
>>>
>>> I think you should provide the explicit function ID name here, and not
>>> rely on which function exactly is used to probe for the interface's
>>> existence.
>>
>> I thought that was the point of the matcher, that you could in theory
> 
> But that probe() function here is not a "matcher" or a check function,
> that is done in the SMCCC bus generic code, using a function ID that has
> no side effects and does not return -1.
> 
> The reason for this SMC call here is to learn the attributes, they are
> used below to fill the latency and rate_limit fields in the struct.
> So we should then make this explicit, I think, by using the
> ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES name.
>> assign the same probe handler to any function ID? For example if there's
>> some FW that implements this (or a compatible) function, but at a
>> different ID, you would only update the match table? At least that's how
>> most subsystems (I2C, PCI, USB) do it.
> 
> Not sure I understand this, this is a driver specifically for the
> CLEANINV_MEM_REGION SMCCC interface, I don't see how you would reuse
> that, or plug any other interfaces to it.

Thanks. The SMCCC bus has already performed the device matching before 
probe(), and this invocation is specifically used to retrieve the cache 
maintenance attributes. I changed this in v5 to use the explicit 
function ID.

-- 
Regards,
Srirangan

