Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD44C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e+pJHWWRnwxr71jaRDXKYTgvd1Bl4KjdqSDq+VXTD0=; b=mt7PUtZ3SLHY0rQLj6vQawpjUo
	yNnlbDKwTRLxcS9WtyEtvyUbnN4J/n4lfOkC0gr22ws0VEH+mKVrq60B0XqBgx378op/7YVp8hMLw
	WDlVgrwuD6KuayWqJopxk0wr6ljfqftHz1o1Kc3iurmBWucY0eXz5T2PjrLsLk54WBt1wD+KrFAva
	7dkYCf9RmS9mqoPBXD9ysquWGIj50H/MvmFXFztazuTGWpuuqxxDR/zkp6Bso6lgxsBunGlDvrKqB
	I8j0igGl9ceMyCyU7uvTNBRHeNtjPUOXkJMWoZlLng7plse8Tkygzja78bc28PSTVUyO9845r6T6T
	oCSeRDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KDW-00000007tXs-0PIB;
	Wed, 23 Sep 2026 10:28:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KDM-00000007tV9-3GQz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 10:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9e+pJHWWRnwxr71jaRDXKYTgvd1Bl4KjdqSDq+VXTD0=; b=W8I+Top5Xn9pW2HXR4pv6SxoRI
	8q1E+L4kJbSB8F6JHKe4Gz1n6fsbmERsb9LY32eoiWLL4Dguy+kfAaziYplUGqPregsbEyXkPi4si
	3ZqIzLkhukltTeZ037g85PYN5sCKcFQw14qbnlNqwlX/59pvJSyO9Wvtjr3sWThR49b+q4G1zM2j9
	+ekKzlAvc6t7QoFHbEPsWOGUH4kxwhEFSyGJC2Fx4pJVhYnCkHH0JILsVOLqmum0N1NoNh8iadSSJ
	atGjX8BTh07qot5ZiLho2Jrehctk6W0tu5FYOWF8VEZHJ3+MAwq93MTT09nN7oOeB07ukoYNU+TPP
	VU0/dyFQ==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9KD9-0000000Ee1P-3iY7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOkydPepSueWC1RRLZcPRbJJJlathkdv0ZV+C8LFM/89RvT2bs4EnBKCBA5FwMnUKhhSZsGbQuPeycwSNAZjuMllHeIbKj5EgEYnwL6sfh6x9ZFxwJVRMcqwdYobzMUyKLO+CpbxxIsMIfWBThzy0XEYzMZMKjw499xxfYu61Zxi4AH3GNTCeyExHbhCC9NexqmQ7dfubgru0p0y48zhG+feDBOPtr0vTLLtN66V7UrIuvhf/49O6uAHIKglgOZNKmGZcTA9Na0ODVFiX4L8/Rq6iHGttixcgp6YwZGGMkwQeS0wvNlLMH04rOImk+20AkKVaJmwAJlIaxQpDwXITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e+pJHWWRnwxr71jaRDXKYTgvd1Bl4KjdqSDq+VXTD0=;
 b=KGSdRzAptsEAwuntFkJwIOklIL4QmScf1sC7rQe287sEP3C+2OKo9BPbUOdGo0f5IYxXpnT3ALQ2nwinFc6C3NCkq+Q051BAtCY5L8NitF2GMu1xQ5ZKJZ2Q+0BT7B1rBtrxdmeewgHX6JUX0oWaEudHcnOpDRqlKcsGuxorXXhEuqtpZ38JSohkXtOG4tSVjfOI81Nqi/EabrokOgN23K0BfTAQOnkebu5JduAM5tHQU+hs6n35gKE1RCNKw2jOxEvcp7drvRRnQPd93TSIrdUAqZ076lUkyeDTYUrYHUIHZ/8PoqTnNcUHTO7c7qwr264Nfuqnnllg8rpT2bePvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e+pJHWWRnwxr71jaRDXKYTgvd1Bl4KjdqSDq+VXTD0=;
 b=tZeMi3rLmtdbBBWXUBaZQ++8MK788ZnmDs83RW/FHWU5erB2wjaj7zQX3N+RyA1h7dwYLD+js4jkXWdIkxYK6YSBTFCQNrQdBUxillCTSlawLcxmTpgW8gUGWYK1Zj6qbxEYU6Fi6LBmd27seD4LHonrh5qEQVFbBCQKnnGWJ9aZLMLn7XycYhCPc8Ihos3jJgWRo5FFYhsOFqc8VpwjXd0+1Laywxn7drPihYnqmgS+BAV84/yqhUPl7OsdGLykEWFVL/c7pQ0wR+F8+1hMmW4ntE3cnnPSb8PNwFASBf8s1PU7OsLicWgkP6JLLWShMRds0guvW3ga1wiRa0dmwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 DM6PR18MB3524.namprd18.prod.outlook.com (2603:10b6:5:2a4::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Wed, 23 Sep 2026 10:28:17 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:28:16 +0000
Message-ID: <69456648-cd41-4cf7-9df4-02237ec05953@axiado.com>
Date: Wed, 23 Sep 2026 12:28:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pwm: add Axiado AX3000 PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260921-axiado-ax3000-pwm-v5-0-202aad28e129@axiado.com>
 <20260921-axiado-ax3000-pwm-v5-2-202aad28e129@axiado.com>
 <arFAy5wMZ2Rl7ubj@monoceros>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <arFAy5wMZ2Rl7ubj@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|DM6PR18MB3524:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e48267-4ec4-421d-71c2-08df195d6168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|4143699003|3023799007|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6eUFuDdVTr+lTa8bb/BGDQ6PjVQyg9uS8dmTlLzr7BZN7Y93wDX5ldmIxENq83ctfkgc1xP1l3Ne9QYUGiMNfTz/fQMiFOBSGeevSAfMRBYOmizdF2YuD9XhYv+Fp6I7RpdvEe4wrm2WEHzVYg5xbf8+/MNUwaS7r4xL1qkskKluYYZNtFc+X9f0C6m1S5K7SiR18/n9HpreQ4gR35PqP9OzPZppwPZIX8/Xc5KvSKwHzH+w1E2ylk9xVSk13kIAbCr2TRhGEUMAO75B1jOWOwmwICD6mJwja8UfqJjv/odO7MlB6AFQy38H/7Y9pYvl7y+K7hn2mK/uidjy88FpKxWmjoQpl2txuyKEGjbVUksOwHLhEyfSfEoYIgfxTAXvwqMwFbp+wSZRsC6Ugef4V09T+XeKNgjBm7h1yxfmU7JURBD3ww6xTu23Av1MGjspEXTQ4uVzgI0ZQ5oKq+yww6p+6GjVXiA0jA2h6ezV5xdJN2D17ZXlWRTQIakNRCX3P127sSj00vFKA5xxwGf8JLbwKszxqwqWXoZobEiuUJIwoi6DHnr41gwa+SZrYzJ3/j5L5nWDtmuij2wcG/tCurMKpH0IM3eRhqia93Kki6hC4pFHJu0O9DdPkO2d8aSDYZEe/oNKC7BSbLfTm6AP3OggfhTsqcIEOTbRQltgM8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(4143699003)(3023799007)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzEyT3JaVUsyc0dudk8yTklXTG9vRUxvdDZmVlVPRlJCYkRuemcvLzMrVkVN?=
 =?utf-8?B?RE9Fd2o1MmREQWJXYmhpakZwcGxpZFlVYWZaWDFHQnllU0RnREoxWEdjWUE3?=
 =?utf-8?B?cUdNRkFDTlJoa2o3d2hSS0YwalVRSDZCMXdNaTdXeklyR25lNFZDVEEwVmtl?=
 =?utf-8?B?MU84Q0thWEZLZ3M0aG5ibHlwR04wUTZIZkpweG45cCtaSGtPSEdVMU5zTHA3?=
 =?utf-8?B?dzFpSHJ2YW9RZDlCRjZEditDRVY5N0h4MTcrOTJaeFpLUHVCbjd1WllKRlR2?=
 =?utf-8?B?Uk1OOVFtVkl4RkJ3Nkxoai9OVFVuMy9tcW0yUXhBOFpzM09Vc1pUemFUeDBH?=
 =?utf-8?B?STlkSE85eGFEVFlBeGhuOVY3MEpvaEhJeXFTdjBxZVlSQzExQ1RYVEpGbkNx?=
 =?utf-8?B?SG9TZlNHb0dDN2sySWptYlBtdFJKeTl4YmJBSmZ5dlUxMEhTM2RpSjY2a0VH?=
 =?utf-8?B?OTlNWEFZanZNL3R0KzRRWHgwUzZMdCtvMWZjR0VPbks3eGRsODI5c3BQdnkw?=
 =?utf-8?B?QmdPejZxZ1RIWXNXanYrWFJVNnozQ1BVeERlTG1uWk92MElyQ05HemVHVmxE?=
 =?utf-8?B?UFVvN3F2ZzJ4cjg4a3A5YUdaOGEwY3d4TVAxWmZVTlV6eTFiRTNwKzhTb0h6?=
 =?utf-8?B?WHF2aEF1anIyZXl3d0tWakhHdWRGbk1yQVhmNHd2ZlBaSEhDaXpidjBnd2lV?=
 =?utf-8?B?MVRGbEtnTk1pSXYyYVRweFlKVzNtUGplMElrUHNzaFhNUlFKbUpHS214cExD?=
 =?utf-8?B?bmM5cHUzV2lGNGtmajcwdGxreEhOWHFvSUV4QTlJbWpsSTJrZnBobFV5OUIy?=
 =?utf-8?B?QVF5a0FuSkFCR2wvUXdIUGV2eVlVK3NFTVhKTUxIU1FSN2UxZFJHNVkrSEhE?=
 =?utf-8?B?cno1OGlNWmFEdFR2Z2d0OWRFRVh1aHIwalZGcldJWmhxdlcxYXVoNEZjQ08y?=
 =?utf-8?B?MzBxaXl0dkpVaGtyNDgxMjZjOEZCTzFiR1BndzNYSHVqek5hMVZOTTJQRHIw?=
 =?utf-8?B?Nzc1dWxwbk9sWjhRam01bGVrNE91Mjg4Ynk5TmdPWVI4bHpSSU4zSVRTcnNu?=
 =?utf-8?B?RWRqMkEvckJxQWFyQTYrUnMzVExVZXExanNBNDlnN0FaUWlLQi9UT1pOc2Zm?=
 =?utf-8?B?SElhSDFtYWN2VnVTNDdjdEpMdnllWStQVCswaEpZTWUxQy9YbHRWbEJ6dHFM?=
 =?utf-8?B?bzFCUGp0OGFoNk1sb2Y0ZzA0RHR0bURXeE1oL2NueS83WGV2c0tiaDAwaGRs?=
 =?utf-8?B?MlQ5SkQvQ0ZJQWY5NFN3TUlDb3U2WjBCcHdIbWtiaDBvY1lQMDZXSFVpTU1k?=
 =?utf-8?B?Q2F5NFR2U1Y5QmNwK1U5Tm1OMkFzcHU3aFN1WVNNbW1PUGRpUG0vSzgySDBq?=
 =?utf-8?B?cVVOcHJEZGZyYnd3VjdPS0pIaG5zV05BVk9aUHErTFRjaU5qYVJqUkFOa0Rw?=
 =?utf-8?B?UFRiR2N0WlowdnlRL2NRb0QxQ3NUc2NON1QxMDgyL1ppNjZtSlZpZzBud3Fh?=
 =?utf-8?B?VUZpQ2JVRGxEbS8vNVVKR1c5TDYzQnlkUHR3RUpZOGpqL2t2ZU8xK05JSlJC?=
 =?utf-8?B?bCtZdGNrWkh6bk1HbExmTHpXUTFsUlVXRkhKZXRaQlpMN0Q1K3BMMUNDZjhw?=
 =?utf-8?B?N0grZGE4ckp6S0RGYTIvc2wzd21vb3M4MXNFdTlTUFQ0czhEMUV3WlU3czUw?=
 =?utf-8?B?SE5yTThyM0ppb2hWeUlaK1NGRFpGMGhkZXdycnVhWDhJYmYrVy91c1lFMXBk?=
 =?utf-8?B?T2xxRmVLUDFhVWYwV3ZHTDFzTCtKZmRvMU1nTUROWXVyd0tkTVRIaCtYWDNS?=
 =?utf-8?B?SDF5OTNFK1luMmR1dzlEc2ZXejYyOFRndkxFSXptMm9xS1Z2OVpVVXFTdzNl?=
 =?utf-8?B?TjJWLzQ3RkJ3YnlMaGZJNEFMZVVZa1NtQm4rcWZSK1U2NnlZdUQ0SUdJMXEv?=
 =?utf-8?B?RDJkVng1dWRUTDg5K2dDRjB6b0NpNHlLZG1RejJpRDlyOXlPN3VmUVEyOE9p?=
 =?utf-8?B?Tjc1c0lnZFRmdWVjZVdieG4zV1FkNnBUOERpbXBnMzVzb0k0RVFPU21YaDdS?=
 =?utf-8?B?WnJxOW5ZeUNoQzRtYnpBcEZYdEJ1Nkc2SlhaTVZKbW1KSWRwSCtPT2prYTVQ?=
 =?utf-8?B?alhLNHFOTWJ6NlZXemJQWnorNnRjWWt0WnNQaXJjUVlIZXA3cVY5L1FXbFpo?=
 =?utf-8?B?c01aVE91RUI4WkdhWDB1UFZtb2pXcnk4MTdVTUlJNGQxSktkN05jWmlzYm1S?=
 =?utf-8?B?cElSNHI4MzR2QitSeTlXcmpadmVUS05oNFdEL3kzTndRSUVLSUwvUHpHOTIy?=
 =?utf-8?B?dWlYeFJsM240WmM0WiswSFdYdEZ5eVhEU016SU0zWEY2NUhNdkhBZz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e48267-4ec4-421d-71c2-08df195d6168
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:28:16.8409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9U5vEtMB5yMhewfmWedATTtOvBTgpDNBAYEUWm4z0zKHDnmwtw3EoczLZ9GbARuI/580Tsjc0h91ZsM33Dqkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_112833_254822_FE44F67D 
X-CRM114-Status: GOOD (  30.24  )
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


On 9/21/2026 4:48 PM, Uwe Kleine-König wrote:
> On Mon, Sep 21, 2026 at 12:21:31AM -0700, Petar Stepanovic wrote:
>> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
>> index 0dc0d2b69025..4466a29e780a 100644
>> --- a/drivers/pwm/Makefile
>> +++ b/drivers/pwm/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_PWM_ARGON_FAN_HAT)	+= pwm-argon-fan-hat.o
>>  obj-$(CONFIG_PWM_ATMEL)		+= pwm-atmel.o
>>  obj-$(CONFIG_PWM_ATMEL_HLCDC_PWM)	+= pwm-atmel-hlcdc.o
>>  obj-$(CONFIG_PWM_ATMEL_TCB)	+= pwm-atmel-tcb.o
>> +obj-$(CONFIG_PWM_AXIADO)	+= pwm-axiado.o
>>  obj-$(CONFIG_PWM_AXI_PWMGEN)	+= pwm-axi-pwmgen.o
>>  obj-$(CONFIG_PWM_BCM2835)	+= pwm-bcm2835.o
>>  obj-$(CONFIG_PWM_BCM_IPROC)	+= pwm-bcm-iproc.o
>> diff --git a/drivers/pwm/pwm-axiado.c b/drivers/pwm/pwm-axiado.c
>> new file mode 100644
>> index 000000000000..781053e255f0
>> --- /dev/null
>> +++ b/drivers/pwm/pwm-axiado.c
>> @@ -0,0 +1,277 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * SPDX-FileCopyrightText: 2021-2026 Axiado Corporation.
>> + */
>> +
> Is there a public reference manual for that hardware? If so, adding a
> link here would be awesome.

Unfortunately, there is currently no publicly available reference manual for this hardware.

>
>> +/*
>> + * Limitations:
>> + * - Only normal polarity is supported.
>> + * - The hardware has no shadow registers, so configuration changes take
>> + *   effect immediately without waiting for the current period to complete.
>> + * - The output is driven high while the hardware is disabled.
>> + * - Supported period range: 2 through 0xfffffffe PWM input clock cycles;
>> + *   0xffffffff is reserved by the hardware for a constant low output.
>> + *   Longer periods are clamped to the maximum.
>> + * - A 0% duty cycle is emitted using the constant low encoding because the
>> + *   hardware interprets a zero high time as a constant high output. The
>> + *   requested period is lost in that case and is reported as a single clock
>> + *   cycle.
>> + * - A 100% duty cycle is supported and emits a constant high output.
>> + */
>> [...]
>> +static int
>> +axiado_pwm_round_waveform_tohw(struct pwm_chip *chip,
>> +			       struct pwm_device *pwm,
>> +			       const struct pwm_waveform *wf,
>> +			       void *_wfhw)
>> +{
>> +	struct axiado_pwm_chip *axpwm = pwmchip_get_drvdata(chip);
>> +	struct axiado_pwm_waveform *wfhw = _wfhw;
>> +	u64 period;
>> +	u64 duty;
>> +	int ret = 0;
>> +
>> +	/* Encode a disabled request as a zeroed hardware waveform. */
>> +	if (!wf->period_length_ns) {
>> +		*wfhw = (struct axiado_pwm_waveform) { };
>> +
>> +		return 0;
>> +	}
>> +
>> +	period = mul_u64_u64_div_u64(wf->period_length_ns, axpwm->rate,
>> +				     NSEC_PER_SEC);
>> +	duty = mul_u64_u64_div_u64(wf->duty_length_ns, axpwm->rate,
>> +				   NSEC_PER_SEC);
>> +
>> +	if (!duty) {
>> +		/*
>> +		 * A zero high time makes the hardware emit a constant high
>> +		 * output, so use the constant low period encoding for a 0%
>> +		 * duty cycle. The high time must stay non-zero because it
>> +		 * takes precedence over that encoding. The requested period
>> +		 * is lost, .round_waveform_fromhw() reports a single clock
>> +		 * cycle instead.
>> +		 */
>> +		*wfhw = (struct axiado_pwm_waveform) {
>> +			.period = AXIADO_PWM_PERIOD_CONST_LOW,
>> +			.duty = AXIADO_PWM_DUTY_MIN,
>> +			.enabled = true,
>> +		};
>> +
>> +		/* That single cycle is longer than a sub-cycle request. */
>> +		return period ? 0 : 1;
>> +	}
>> +
>> +	if (period < AXIADO_PWM_PERIOD_MIN) {
>> +		period = AXIADO_PWM_PERIOD_MIN;
>> +		ret = 1;
>> +	} else if (period > AXIADO_PWM_PERIOD_MAX) {
>> +		period = AXIADO_PWM_PERIOD_MAX;
>> +	}
>> +
>> +	/*
>> +	 * Period clamping can leave the converted duty greater than the
>> +	 * final hardware period. In that case, clamp it to 100% duty.
>> +	 */
>> +	if (duty > period)
>> +		duty = period;
> So with period in [AXIADO_PWM_PERIOD_MIN, AXIADO_PWM_PERIOD_MAX], duty =
> period yields a constant high output? If so, why is there a special
> encoding for const high?

Yes. With a normal period value, |duty == period| produces a constant-high
output.

There isn't a separate constant-high encoding used by the driver. The unusual
hardware behavior is that a zero high time also leaves the output high.

To generate a constant-low output, the hardware provides a special encoding:
the period register is set to |0xffffffff| while the high-time register remains
non-zero. The driver uses that encoding for a 0% duty cycle because |duty == 0|
would otherwise leave the output high.

>
>> +	*wfhw = (struct axiado_pwm_waveform) {
>> +		.period = period,
>> +		.duty = duty,
>> +		.enabled = true,
>> +	};
>> +
>> +	return ret;
>> +}
>> +
>> +static int
>> +axiado_pwm_round_waveform_fromhw(struct pwm_chip *chip,
>> +				 struct pwm_device *pwm,
>> +				 const void *_wfhw,
>> +				 struct pwm_waveform *wf)
>> +{
>> +	struct axiado_pwm_chip *axpwm = pwmchip_get_drvdata(chip);
>> +	const struct axiado_pwm_waveform *wfhw = _wfhw;
>> +	u32 period = wfhw->period;
>> +	u32 duty = wfhw->duty;
>> +
>> +	if (!wfhw->enabled) {
>> +		*wf = (struct pwm_waveform) {
>> +			.period_length_ns = 0,
>> +		};
>> +
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * The constant low encoding doesn't hold a period. Report the
>> +	 * shortest one, the output is low for all of it either way.
>> +	 */
>> +	if (period == AXIADO_PWM_PERIOD_CONST_LOW) {
>> +		period = 1;
>> +		duty = 0;
>> +	} else if (duty > period) {
>> +		duty = period;
>> +	}
> You don't handle wfhw->duty == 0 here. I think this is what Sashiko
> pointed out. While .round_waveform_tohw() doens't produce this setting,
> it would still be good to handle that in case the driver is loaded with
> this setting applied in hardware.

Yes, you're right. A zero high-time value results in a constant-high output, so
|.round_waveform_fromhw()|should handle that case as well in case the hardware
was configured before the driver was loaded.

I'll update it to interpret |duty == 0|as a 100% duty cycle. I'll also check
this before the constant-low period encoding, since a zero high time takes
precedence over that encoding.

>> +	*wf = (struct pwm_waveform) {
>> +		.period_length_ns =
>> +			mul_u64_u64_div_u64_roundup(period, NSEC_PER_SEC,
>> +						    axpwm->rate),
>> +		.duty_length_ns =
>> +			mul_u64_u64_div_u64_roundup(duty, NSEC_PER_SEC,
>> +						    axpwm->rate),
>> +		.duty_offset_ns = 0,
>> +	};
>> +
>> +	return 0;
>> +}

Best regards,
Petar


