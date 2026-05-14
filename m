Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87947CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 00:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdeFJ47cU8es7pnalbHhsixnNs7WT6Y+dAAA0/CoTlI=; b=bUM2OplmCtlSR29K+M6zJmteqc
	v6GFsLKcGSLWGjXyTNVX4C35cYXWUEhnC948AtLda15uTe2QUOQuwVji1u/7MbzNlzhyvBlz9J9Iy
	WA8oWvq0kFYxjGVPe9k7Y4QIgx27h4BgI1IMA4YQU1/q2tJ27ui355B0SxlKXoMo8zMUqeLucR6QO
	BIo6cadF2pbhtR6NMNKnSLkRTjKDAYBebHbslwXHOofhGhFYWxwks0rNjjtv9SG/fzvlzLguHajUi
	59ndlRGfngQaaAnMkjWG9S/BDF2SWGwXwB9i39dBuRJPT8PHUDIoqjoNUDAcQ8VemTKye/ttbaQxh
	C9mbyXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJXs-000000047My-0Qbh;
	Thu, 14 May 2026 00:03:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJXq-000000047Mr-3LZm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 00:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HdeFJ47cU8es7pnalbHhsixnNs7WT6Y+dAAA0/CoTlI=; b=myvOHiHiRtb2mVioTQyro14kMU
	huV/7haST1OyQY9Et8eIG5rLMakfQDC5SJsBGo1l7QupVfMShkppoo1iOsJa+9tqMfKLJTN5BnMIZ
	FWeBBdIDzNJ8sT8i2qKZLaX5f51allU19Rq81aRLQDLZqGH4++lzHJlLIusUmt/DAmeo7EzK42NQo
	3bLVfv3IdmdiArQRmcVQyqp/tZhSfiF7cJESnLJh7maFsGLYAH7VAXQAmdwHBT5SOiKK+UYRpZWno
	M8EY2zGggynUzWKFhGVGwvxr9+q2jun8RghctaCkklYMgHQxzGhL8gZV8Dn+r9nKsMWR/yk7fJO6t
	oPp9moSQ==;
Received: from mail-northcentralusazon11023135.outbound.protection.outlook.com ([40.107.201.135] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJXX-00000001nMp-1LLL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 00:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1lhWhP7RElAQQe1L9DjyYe0xFIcLujeu97GRK2/+5jcfqvOK4tRKpDtLQuIqI61+5pZbbdQJczlPjTOGi82vL5K8GaraOcAbCJXcCAzP3R+eRnlSrr8ofrD0FOr0EkmX2aQIHrejcVUJUoPf4ozgRJpv0H7A8lEcCIh5HiLD7oYyIQWRp+bIovxX6u07QyiQm73fOupjLO80CegnX7z+IdDUBNrfnPOk72W86n/o4lXG6qgCYZjw/33kOdQN0XxuOU/nS6MiR+abBvG3yVRvHUMjpqyEAnKE+Fhh6zSOuegs7pO5g4COcr6yTsziAm1l3uRSvGZ8lvH4IJCxQvyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdeFJ47cU8es7pnalbHhsixnNs7WT6Y+dAAA0/CoTlI=;
 b=tUnwkcMVjnAcE6BYiFHlL0nh6jcFEFqDpgnT6sSKzLiwLg0K1KLdvUSvm2Xf9W1S4MNS26+9f24GHUjHSOVdz9l6OMVdjK8UqUbfceDuyD48+epA4wnUbmGiyU8H8F24BRR5+y6orYcgEGfxBSuTjCmd7Hbs3VdGVEZDo3rBLGLsaupGbPNdJOE3n/oCC9yl5GOwt0nVVMwp9gy2T1RvyWMc+0Z0Lqlz+F6fRknbpkwdKsihWkKIjrlZy1ipFsmVI8tDcoir1OsfTwOzRpy1Ajsyk4oDOF745s9ptu8zo0J3GHFya43wXjknDoApHp2hqix83V65lDOb+hU7hWXs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdeFJ47cU8es7pnalbHhsixnNs7WT6Y+dAAA0/CoTlI=;
 b=eFuAFW1iq6tlucYblrnpqKZ4xaNuuatg/m/zpU4mr9VBtTh1FeMPUDtxHY4ZRfWCiKJdp3X4GskHl4fsThpjRN7F64eJg+Z6k2F5LmaAssc/w7wLk/jonqJXXruMNA76bmCR1Dr/oXCxX2DNkZygwi8bp0NB9D8j6pL8p5Evw/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BN0PR01MB7071.prod.exchangelabs.com (2603:10b6:408:164::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.15; Thu, 14 May 2026 00:02:44 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 00:02:44 +0000
Message-ID: <e0b79232-67dd-482b-b6f2-8f37f111ae9d@os.amperecomputing.com>
Date: Wed, 13 May 2026 17:02:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260316192933.3993042-1-yang@os.amperecomputing.com>
 <agNFou9cAavEILXl@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <agNFou9cAavEILXl@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BN0PR01MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: d69136e7-48a3-44b4-839e-08deb14c1f95
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|4143699003|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: +pf/1Z+LVZnPuwHMjnJB/WMR3v64/dRUPkfVKFxscRCjNSN2oLwQn/iwBrGk+kRoGCqhQqm4y3rUOzHK8fo8h37QpVd+RHDsrPiKoZRIf8z13VtCjdMFFuvShbZGmLgLYqmtchpbs9jo8eq/th9uh5E8Hf/CLRZFjPOfMUS+OErprL+q93eI7v3i/jNE3ikASmbEYFc7QCR1OzQ/XW/QjGiimJ2fimosMwySW1fq42AAdhCnink87D25U7pReMlAJcS3+mnBtfUNThT3kPI3hUpe6qBsKhKDiCvaVKrWnZwdWkz9Gqllnu/IH/XAl6QnM1chwokVrOnITWuDXAIhohmmG6UMV2Tg65OWmEzBGrPyg6fdOKg5v6NTBNnNuDOAYH19ZpJqJVuqvc80+CQotVj7D8S129JuQfwuWlS0potYAtH/XnaOazC6KM4gk+3xeFSs4fajfG+OkS2t+zSlNoLF+4Fg12Y6tFvEa74G1mhrg2MPp4BhfLxsdJltBAwmI1kpX/qxdqfULXujUD42L3pXI2pusFv7DRC9CV77qXus3e6XxP/QSdHbONm0USZcMU3dq6S1yYmMeZL7LLvkRm/1KFudWJ5uB1vo2SAuvyEy6oitL+GWsVBMeJAbDpYuvSRk8WAuTRdeHUwqXfdK4nu2WYRtND7wwLN9DplmUTy3fIq3unSUkSUHvCPIjIw6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(4143699003)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmNqaXNKNXp3RG04TXBIc3M5ajJKYnJQSFJNTlV6MzV5UFFGV0ZXNHpQRVpQ?=
 =?utf-8?B?d1ZWbzYrRktYdXFOcWxNUE1jSm1jZ0VsNnVBSm9FRkVlU1RNNUY1WTBCaUNE?=
 =?utf-8?B?R3NDN2grejNIakRRQ0JKMTBpVVM2U29GOUVaQmNZZnNtSmZDYitjc3BqTHJY?=
 =?utf-8?B?eVBPbmlOeGZ5NGVFOGNMYlFHQytkUWRvaEVJOGtwa01VaWpkcDJhazIvbkFs?=
 =?utf-8?B?M0I4dlMvNzhyOUdtNWhHeWp2SE1MQ0tyWG9uQnk5RW9JN2JMTUlvTUVWd0RQ?=
 =?utf-8?B?ZWkwTDhBM2ZKMC8yVk1hekhrZDhVemNvMnQyOUk3S2gzVHJ5SUo0UFgvS3U4?=
 =?utf-8?B?WW8wRGpKYmt6a3UwQ2F3S2RPSUY2ZmtFMXEyd0lOd2p3U3QzYlZ5ci9HeExk?=
 =?utf-8?B?cXp3SE5KZnAvdGxMRDhaQ25tVGV1Kzc2QkxaRVpiMnl4Yy9lSUdDU1VYQXhL?=
 =?utf-8?B?Qno1RStyN3I2NlpXZDNXTUF6T0VHUGExUCtTbTg1YXowYXNXYk1yMTdHZzZX?=
 =?utf-8?B?WVRwTHlWeElUQ0EzVk83TWhjQUJVa2UzYkNMcGZqT2V0RzE2blEzTFNjT1h6?=
 =?utf-8?B?ck9LSUY1cUkwNXFLenIwTWVtcHZxZ3A0S0pWVy9CeGZNelRJSHg1Q2VweVZn?=
 =?utf-8?B?cVRYeWZaOExVQ0I1WVhPZml4S29nZGpTWVh1eXNzN1ltSHIvNlJZS3BDTTVk?=
 =?utf-8?B?OEhoL2podTM4N0MvVXRnSzVDN2cvd2hpOXNXQVlxYWpPeS9FdkZiaUthVzd3?=
 =?utf-8?B?RDI0SGdEbElqWEliNE4wT1RzL0lGQ01PSHlRTCtMOE83RTdNTGowWjNrS0hW?=
 =?utf-8?B?U2RHY05IZTFtWXFuYXRRWjE3MkxBUXFIV0Q4UURoWldITWp5ZzU5bitJV3hw?=
 =?utf-8?B?VXJyU2ZrMWVMQjlhcTVPemtzbUZ5aStGSlJ6dmY2WDdUanZrY1hMWWlIekZv?=
 =?utf-8?B?S2JZZ0l0WXRZRi9GREVHTnVVZG9qMnRHb0xWUERyUUt0Mi96Z1Bkb25vam5P?=
 =?utf-8?B?K3ovVTZLZzRTc08ra1cvdnFLSFpOdEs4VXk0ZzBMV0drR0xGNTdpTVR5VGw3?=
 =?utf-8?B?RDFSOVJtUmNJY1YzeUlodUlndFVWR0tqVE9XTUM4Y2Z5TC9UclVRRDZRRGVH?=
 =?utf-8?B?T0FjY1Q2OG4xdnNZMWIxM2hmNjN1Wm0vUVhoREhIUGhsdUtmTlROR2lhL1dJ?=
 =?utf-8?B?Y1c5ZzBYckduTDBGVUJuRTBLLzEzWFcyVk1UejJjYk1iRmYxUjhBb3ZWczBp?=
 =?utf-8?B?bVlpT3RnYzBOcE5MNGJrOFpQN1Z3SEJNb2xWT3JoUnZKTlh2aU5YcGMvcXZJ?=
 =?utf-8?B?WFZtc0VrdUV1NEhKVGNFS1RWeENKZTlxcTBEUkg2QlBYdFc1RmhhcTBBOXl3?=
 =?utf-8?B?dDR6OHNRMEtBd1p5M1RRUGpYdEdyTjkwVnR5L2FnU1VMbFR1VFpCa203bjJr?=
 =?utf-8?B?RWt2YXhjeUdLSUxNZW5ubjBybklxNmp4U1R3bGpsOXMraGdCN25HNUd1L1dY?=
 =?utf-8?B?ZkdTVDZiN2xQNFNOdnd4VytHeWhLL1NPV3JER09Xc3BuQnBMNWFoL280RHpX?=
 =?utf-8?B?cFdNNDJEL0dYMlh0a2dKSldWUmozWFNCd04xTy9xSHBzR050bVc2UW1GRERq?=
 =?utf-8?B?SG5MSXRIZXZNYkZKZXEyY1ppTHcwTmQ3UXVoY2FxYjl6M0txVjRhS3N2ZnpH?=
 =?utf-8?B?VU1Jd0dBd05MLzRrMzF0RlFyTzlYcEpxbVVhY2VVRkJQd2I4RkRZZVJNQWhZ?=
 =?utf-8?B?QWJkWkdLclZucFk5L3FGWGZtZ0QzK2RWaVRDd1g3elVIWURvWG9JMTkxdCt0?=
 =?utf-8?B?MUhLQmxnV3IvV1pkYytiSnlLL0tlUDI3aUN6aW1jbmZJSDdDU2J3L0pLTldJ?=
 =?utf-8?B?dlFUelFFbHZkVzFUZlZjLytWZTdXQ1VBT0pGeGFOVUo3RkFmenNFRC9GR0hM?=
 =?utf-8?B?cXZzVGlsN1BTSUNac0NRaHlpL2xmRW53elpEZXZvbCtRc3BDZ2lRdkt5WlhE?=
 =?utf-8?B?cm1yL1p3Y2YxaW83ZUl0WDZVNC9hay9KZ1g3L0wzRmF3cDM4UzZDNUwxOXp4?=
 =?utf-8?B?OG1XcUdiSEx2MDgwM3UxcnR5V3VYTUQ2dzJGcXZWQ0RzL3dDVEU2OG1FQklB?=
 =?utf-8?B?ODgvcW1GeHJ4cThJL2w0WmFoZzkwUXVWWGd6ZWMxSUFPSzh5T1BtTWtreUFD?=
 =?utf-8?B?ZWVuWmlMSmpPbUNMMmY3ZDQ1MmdtMkFsbnl0SjhJaFhsUGtqRUExSGpnNEZx?=
 =?utf-8?B?RHgzV0N1M1RzYWlsR3NyaHVyN2Fld21pNWQ3eHhOT1ZJc0xTWGxxMnExTlVj?=
 =?utf-8?B?U1RaelJvVnAxOTZTRWhqTjc4MWg5NTR4UlpOZjdxdnlJQjUxQXZoaCtZcVlQ?=
 =?utf-8?Q?ANubJhfOVVyQAXjA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69136e7-48a3-44b4-839e-08deb14c1f95
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 00:02:44.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7l30dV9Sn9u/u3chx7UOHPXd/Py9XKqJdIdef9NPhUEsiA0x9MWpQFW6CyfFZYybEO8lFmJeyxlIxUhpeDjVAkXVt77fWlH6GqLZiHc6J48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_010306_049604_D135967D 
X-CRM114-Status: GOOD (  25.17  )
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



On 5/12/26 8:22 AM, Will Deacon wrote:
> On Mon, Mar 16, 2026 at 12:29:33PM -0700, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:       94792 kB
>> DirectMap64K:     134208 kB
>> DirectMap2M:     1173504 kB
>> DirectMap32M:    5636096 kB
>> DirectMap1G:    529530880 kB
>>
>> Although just the machines which support BBML2_NOABORT can split the
>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>> that the users have consistent view in order to avoid confusion.
>>
>> Although ptdump also can tell the direct map use, but it needs to dump
>> the whole kernel page table. It is costly and overkilling. It is also
>> in debugfs which may not be enabled by all distros. So showing direct
>> map use in /proc/meminfo seems more convenient and has less overhead.
>>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> v6: * Rebased to v7.0-rc3
>>      * Rebased on top of Anshuman's v5 "arm64/mm: Enable batched TLB flush
>>        in unmap_hotplug_range()"
>>      * Used const for direct map type array per Will
>>      * Defined PUD size for 16K/64K even though it is not used per Will
>>      * Removed the misleading comment in init_pmd() per Will
>> v5: * Rebased to v6.19-rc4
>>      * Fixed the build error for !CONFIG_PROC_FS
>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>      * Used shorter name for the helpers and variables per Ryan
>>      * Fixed accounting for memory hotunplug
>> v3: * Fixed the over-accounting problems per Ryan
>>      * Introduced helpers for add/sub direct map use and #ifdef them with
>>        CONFIG_PROC_FS per Ryan
>>      * v3 is a fix patch on top of v2
>> v2: * Counted in size instead of the number of entries per Ryan
>>      * Removed shift array per Ryan
>>      * Use lower case "k" per Ryan
>>      * Fixed a couple of build warnings reported by kernel test robot
>>      * Fixed a couple of poential miscounts
>>
>>   arch/arm64/mm/mmu.c | 197 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 176 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 5fb9a66f0754..7e95dbc69d57 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/mm_inline.h>
>>   #include <linux/pagewalk.h>
>>   #include <linux/stop_machine.h>
>> +#include <linux/proc_fs.h>
>>   
>>   #include <asm/barrier.h>
>>   #include <asm/cputype.h>
>> @@ -171,6 +172,87 @@ static void init_clear_pgtable(void *table)
>>   	dsb(ishst);
>>   }
>>   
>> +enum dm_type {
>> +	PTE,
>> +	CONT_PTE,
>> +	PMD,
>> +	CONT_PMD,
>> +	PUD,
>> +	NR_DM_TYPE,
>> +};
>> +
>> +#ifdef CONFIG_PROC_FS
>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>> +
>> +void arch_report_meminfo(struct seq_file *m)
>> +{
>> +	const char *size[NR_DM_TYPE];
>> +
>> +#if defined(CONFIG_ARM64_4K_PAGES)
>> +	size[PTE] = "4k";
>> +	size[CONT_PTE] = "64k";
>> +	size[PMD] = "2M";
>> +	size[CONT_PMD] = "32M";
>> +	size[PUD] = "1G";
>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>> +	size[PTE] = "16k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "32M";
>> +	size[CONT_PMD] = "1G";
>> +	size[PUD] = "64G";
>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>> +	size[PTE] = "64k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "512M";
>> +	size[CONT_PMD] = "16G";
>> +	size[PUD] = "4T";
>> +#endif
>> +
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PTE], dm_meminfo[PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PTE],
>> +			dm_meminfo[CONT_PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PMD], dm_meminfo[PMD] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PMD],
>> +			dm_meminfo[CONT_PMD] >> 10);
>> +	if (pud_sect_supported())
>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PUD], dm_meminfo[PUD] >> 10);
>> +}
>> +
>> +static inline bool is_dm_addr(unsigned long addr)
>> +{
>> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>> +}
> Just use __is_lm_address()?

Yeah, good idea.

>
> For better or worse, the arm64 arch code tends to talk about the "linear
> map" rather than the "direct map", so a little bit of renaming would be
> good (i.e. s/dm/lm/). I'm fine if you want to keep the user-visible
> strings as "DirectMap".

Sure, I will rename the internal APIs to "lm" to keep the consistency. I 
think we'd better to keep the user-visible strings as "DirectMap".

Thanks,
Yang

>
> Will


