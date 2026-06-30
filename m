Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6CBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQLtbHuIgyrfDSlSS98GeCow+0yBpueEAxPGLSSVVRc=; b=jN+t9TfG2H/dj707LGTcwQ3Xhe
	wga/r+vlWtkgppkorT6jrUcG1UVl0JpW/0ySrnIUbQUsAcNQOE27oi2mY6e577/VZYNjoVLPwkOvU
	3KF3E2qf+u2LqDYqWqNK12Z80GuxKXx7wreDVz8w9uy+dLXYtUkF2b16lNNCBUQbgfaYXuunKcM9X
	qQYBaIaDsqqauZo2Se3tld6AAAQHWmpZwHeC9FoV/F5wpqFetoLBosKVOFAy2F0u1LtAhm9d5sqir
	T9H2rrvLwWSQd63Ev3CWYHMyAlKbEZqP0pXb3xGFyU55dD4D0DukfILuV1z6xrI8HPqnqzl786cG1
	CN5vVZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTjg-0000000GG0u-0qCx;
	Tue, 30 Jun 2026 08:22:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTje-0000000GG0g-19s0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 08:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PQLtbHuIgyrfDSlSS98GeCow+0yBpueEAxPGLSSVVRc=; b=fXO+CN58HvVHTTSVu2bpRjH6od
	dxqr9Hmg47ntTInovEjhQa6I8sD36u45cIZHxFzvGZrO4bnywqaIdMjpFZfH6G9dV47g6P7xMtquy
	9HiGk8AUjuB1zl7zkQrj6KLv7vYvAXB6SJXWkyyQic+BKrNQzVL3mPBjqEc74oOkLXlUdHIiVZsBH
	8741F0DlXnqa5K1KHffSxQNS41MTyJVluzVpKZUEmrbGaTfQFaMDlqw3scZRIijYUk4xBS4Vo6Xv2
	8t4HFjKGSEEafqe+qRPyGItlJxK4bu7WW5fsGqwFTA9s2yeSFeJJlt9wczeb6iHQ1abyVoZo4yNup
	Y4DfLPiQ==;
Received: from mail-westcentralusazon11013050.outbound.protection.outlook.com ([40.93.201.50] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTjH-00000001eku-03aR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEUB8Dm5tcYWsP4v17If2zOl+JmJkUDEQsYCW5jRwqq0pJAW007XgCG0sIiUsH7O85Da/HKrIYSV/OJuCYYI+ABUL4HpkwLpLCn86EfO7mkL+Stq0mmXhcL5siCE/8QpjKTHxS0IJxbpsnOVjcd0O9oX6c6b5Cx/WqyyUqfamZbMaU60nUuU3kM9GTon+OLZpbH69mfMboFxZFsz4MyWLzzE8iLnr/K0WTd0IOzhJF3x7zLxDDi63m2OMsjkfmG12tnDd00+6ZuBPZl7+mKVg0303ZIi6L9CSm7tGEAcKedwo5GwnDmboKGmusZGonN4yfBKLJAKtt2kK4LHVZ68yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQLtbHuIgyrfDSlSS98GeCow+0yBpueEAxPGLSSVVRc=;
 b=beilKECcQIcBoTnakEAdkCEydf2GMTgPQqEcFMP1fTXh4P7c1VklhUKCuQtTgErAkeoCS/PnUMyYVqX7R82f5N/7MVXNX4bRDbKL+C/n2kbm2K2TxJTpUapVoo7KR8A7303YedYabnH+7sM7rz24VUjIc8gIObBqQe+S/t1BZNGsbQoj7Mtwg8X5M2mtPlqNjhOYhrbaoLoKM5XpL/HjthTYjVqEL50P/6LOpeLzqCR4vSpJsVNbKFWTnX3pZ6N/EHuYPH/zsg18NelabqH16pIfATeFRtaFPJYuT/niAK5YuK2kfVcYnjkr6tHSb3qdkfa9d0xR3YdBnXjts6sK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQLtbHuIgyrfDSlSS98GeCow+0yBpueEAxPGLSSVVRc=;
 b=cl4ojxaQqanwVathnyssvqzfKgstYEK3UmBivj9HyWsEOxkQOkN71etxbUfgvA46tqNSudBgtFBe03EEf+Cx1R1WmP5SeM1QwTE6SKzpyvi+XUKBX7s6/0NFNEAn9pHdBdKv3hPJfn42jUithXOiekAij0CY/Gi8Gxxz9fRLyXn//0uoOXYukEZ4J9vCjfjW/ogYYar4PRlgX3v5aAMxDT3dX7QUlBCWkFcqnmWdMgfn8OPwuNRxhiH0FuAgz7uLeIpXvenBIH6xIxEMzo6FG7u0CjOcxVeKEwXBgoyGjrwi//3qPeYmyMLrXWtOmsso2Pdabc0GgEEkSWnyEVdVpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 SA3PR12MB8000.namprd12.prod.outlook.com (2603:10b6:806:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:21:50 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 08:21:50 +0000
Message-ID: <73afa0d9-5b3d-4f5b-b888-abab9929cad5@nvidia.com>
Date: Tue, 30 Jun 2026 13:51:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] PCI: tegra: Add Tegra264 support
To: Manivannan Sadhasivam <mani@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
References: <20260617-tegra264-pcie-v7-0-eae7ae964629@nvidia.com>
 <20260617-tegra264-pcie-v7-3-eae7ae964629@nvidia.com>
 <slfaxyt6p5mwsqmxvmriy6npilpjhjxv5ruegj4hnivj6zufkl@o6adjy5jmzfy>
 <aju3jokcWR5DzPrv@orome>
 <23rcfdnhnjhdlhiw6eclxap2tk6j5ni7qkfsd3fkfmucvjemie@fvf4j5earp47>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <23rcfdnhnjhdlhiw6eclxap2tk6j5ni7qkfsd3fkfmucvjemie@fvf4j5earp47>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23f::12) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|SA3PR12MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6c3f54-9bef-45aa-7dd9-08ded680a256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|3023799007|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ZhJGwe9D5PToHVCa9TRMi4jvbtwMrCBPlqqXRYF/KjEdMWzo99+QLdG/JOzBmMf5sgLibbjiYFUh4cTVapR/BwCIee0kd+30Oy8ChDcsGWI7kSPa0Ph+O4vhMHcX9VBh97aEK0y2E5rpNG8fdtQh6orIkY1Ni1ZCn3dlsj/yPen1KAMexDB1suBEfFbug8KUY5J6cLo32wQKErjt1lcL3Wvg4Q1p5aHYaJSX6YZMfd5B6wiXMzd7635dJQRSYSFEF65l22gVECuAVi1hMBDCydDjd8LEk7OUTlMIqUSWOCgX/zpAtnWLMJPZ0YZdvnH1W+mSdiDahsX2lvEJS0l5pefYCoARsDGwFKfvbcD60tUpuWRO4kPE0XdcEECgIyQZTrl25mPJckIROVdeYfidM03o2U8fMPmc1bndIfKXh1oi6BBppX7OcsSp21UX/425lXz5MdvY2dAT2rk+0shCEg21F8+xekU318Q36nIi1pbq+4azWhSZXtXdnZnlkX1dRoDjgn9RT7tW6+Y5r8c95ia2uYMLrHTdutNfer19ONwP+1rVczSfMUCOOXFW1TVywxtwqjx8LAbhF40DOe90WIybHXimJ7bNVuPPisOSpFnABI5+fwGxTwTdLKjb9iD3b1m5b4NHXcvdK+detnTEj54jB5wQuc7UfC36I3GoYtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDE0aXdnazZBSUd5Q3d0NTBjZDloZVdGNjdOdWZyd0cySkdVRGt4QlhUcjZK?=
 =?utf-8?B?UWJpcjRIOGFxSDViWTVNc2UzVzArOFFZc3FOWHhMbmVSMEVERW9lbnFiTDJ6?=
 =?utf-8?B?NzM1WkpOQVREL3dsOU5MOFhtVll2NTFmcE9HUmFDU3l3YW5vUGZWWm9WM1Qz?=
 =?utf-8?B?THNzR2pDVmZqODZrZ2FvZ1UrVjZXeVBFTGUwVGVOdnFhR2d3T3QyczFrYmdp?=
 =?utf-8?B?YS9oR1BEOE1zY25Nam1JTWo5RWM0cGh5dE5ycy9vQ2EwY01HdG0wQnBWZWhS?=
 =?utf-8?B?K0VBK2MyUnd4bnZBbGZVcGk4TU1XOXpoMStCNDlPZXY5RzU2WlVSenBxaXZW?=
 =?utf-8?B?b2Q4MnZoelMyNHpxR2tFelhCdXRCMFhkOVRsdi9wZUpzeFZjMFNWcExEeHFR?=
 =?utf-8?B?RWJtZDFvR3FZWnNBV21wTGlOU3BNb05XTW82ajhtcktKYnpBaU5ZWW9JdlZK?=
 =?utf-8?B?WFpEN0tsajBCK3A0bzdCWEtLeFhtN3g2c01RbWlwUEwzSGo0Q0Vsbm54OFVx?=
 =?utf-8?B?NHI2dDRlUllDNFB5N0FSSXNQMEpoQ0c4ek4wdEJibnVUekQzUWptaE8wWUN1?=
 =?utf-8?B?bXFpSGpxLzNGWEY1OENaNTQ3REIzd0M2cCtjb0NkR3Z6Vnl6MjM2NDdNZDZI?=
 =?utf-8?B?cDVkcWV2b3V5SGFaVC83akEvcWJ4YTRDRVlmam9VbmhyY3h6MVlUQktsOUYv?=
 =?utf-8?B?QTA3V2xtWXVjd0lXREFrVGRRVE1KSjRMU2VTZGJTcjJvMWVIS2pwWndSZVNw?=
 =?utf-8?B?Y3FEZktQQVAyaHVJSk9BRWdvTXpFYTRXZzkrOERvU2xRQno3dG5uM0R3bGho?=
 =?utf-8?B?ZWZBdlh5YStoOVlzZEtMSEtkdHlOOXIrU0c0Z3B0T1VGS0hGWGYxR2Znd2pJ?=
 =?utf-8?B?VDU0bDVYc2Yyc3YzeWpQY3RCMTF6T3V5bnZabUZZSkZtb1hGd2ZkelJuR1Q5?=
 =?utf-8?B?SjViWFhsdGtaMWltS3NGajlwd01JMUxOMGRra2xPc1VWTnA2RTY4NnFVMlhk?=
 =?utf-8?B?U005ZG53NW9DeTRQSHdCRlh3VlB5aEd1WlB0RCsxZG0wZmkrWStGcmFYdk93?=
 =?utf-8?B?SWh1Q09BRFhjdm9GYXdiWkhjNGZOdWo0cCtsRW5sYklEQlhnOHRqSExlU1FK?=
 =?utf-8?B?UkJmakdhMWJjOHdROStEUGJFakJUSWRZakxkQnRVMGMrVkZrUlZmUzBqQmh3?=
 =?utf-8?B?ckl5bGovSTNNekhPems5TmZsQXdWWFRzRmo4bEdTL1pVTGpPdXFlOUpFSkFQ?=
 =?utf-8?B?WlV4UVA5QTZ5SnE3UjdHcmtIUG0wRExMNFFqSWtBUWtvQ3RvZXBpVHh5OE02?=
 =?utf-8?B?MWpLeGdDS2tpR2FKTHREaTQwaTBWNWlocDd5ZVZCdktXVWFuRmpTZC9kK1NU?=
 =?utf-8?B?OGRpSFlUeFJTejl5ZVV2LytRZllpMzJqWS8xQ0dEeXV1bXhBQXRJazRhQWlp?=
 =?utf-8?B?NzFLRk5aNlRXSWlmUXoyYkFPaVhsRUJ1cnl5ZCtvdWlLejI4QTI5RmVNSTRF?=
 =?utf-8?B?aXFIYnd4SmErR3p1TDdYM1N1TFprKzEreUNuVUFaMFlWQWZrZlBqaEV2V05L?=
 =?utf-8?B?VVBzS0E2UVRIdTBGYktxcHhoZXVCVU5DbmpuYTYvMS92aFk4L1hFa3J5MmFp?=
 =?utf-8?B?T2ZXTjdvV1U1V1I4LzdCK3Vya0MzYVNuOHNkaloxQytTSVlucDFjN1krVXBm?=
 =?utf-8?B?Q1B6clp3QTVvaEdjWjc1WnhVcmRDS3RVa0Fob0dKYjNqQjRpVGFReGdVUjlV?=
 =?utf-8?B?dVF6MWhvK3hXVFBBSnpGejYrdC9GdWVDNW1WeDQvMHo3MXMrT3lQOTZIRnpR?=
 =?utf-8?B?NWhZTHFPa2EwempLcVJ6elRxR3FFZ3lickNwWWxPWC9XdStHbDNTajVTaGI5?=
 =?utf-8?B?RW9hamlSa28wZWgvR1BhTUZIaStYcjBVa1FSWWVoMlV2UDFCNzh3S0JqWTI2?=
 =?utf-8?B?ZEFrdGQ3cXlCN0FGanRqUmx5bTNQaWl5Q2lwT3FsQWt0RVc2R0IybzZTN0ND?=
 =?utf-8?B?TkZxK2xxRTdVWmdRMjI0eDNCYis5WVF0SW9ySWRWakpYR3ljTGt1cXh0clBU?=
 =?utf-8?B?c1J4SzVJbWp4dXdsejhoRnBpWVYrMWxJc0J5elJrc0dNVUdiUVAyM0hWaVFJ?=
 =?utf-8?B?VkNtbHdiWWJ2QlRjZnlnVWVSMHQzV2orWjkwcFF5S1lWQVdabGNxY2E4RkJR?=
 =?utf-8?B?T2JNbGZOTGdGK29VUmRhRDhic3NGYmhUZFl6aXA4bDBtWXlnNHMwZXJ4eEI1?=
 =?utf-8?B?UG5TNUNhM1EyTExsMDhqYjJmMUxKeVhLcVNKRUR6aGFCY1IzN25uNVlnUnVH?=
 =?utf-8?B?bmVCMjZPci9tRXBST0E0eERHZEl5UW03OGpzSVZtUDB1WithRzVkMFhqTFdt?=
 =?utf-8?Q?wVVOqiElLLlE3fMM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6c3f54-9bef-45aa-7dd9-08ded680a256
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:21:50.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IMpwIB7XLeMpS2FPVchFY3VaBPv0TZdW2eF10zEJspRNcQb58wejqW9KQWSDfniiPrPL3phX+aKQUKebiRNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_092221_746789_27FEA855 
X-CRM114-Status: GOOD (  11.99  )
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



On 30/06/26 1:33 pm, Manivannan Sadhasivam wrote:
>>>> +static void tegra264_pcie_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct tegra264_pcie *pcie = platform_get_drvdata(pdev);
>>>> +
>>>> +	/*
>>>> +	 * If we undo tegra264_pcie_init() then link goes down and need
>>>> +	 * controller reset to bring up the link again. Remove intention is
>>>> +	 * to clean up the root bridge and re-enumerate during bind.
>>> But the controller will be consuming power even if PCIe is not used. Do you
>>> really want that? Can't tegra264_pcie_init() handle the initialization? I'm
>>> wondering how tegra264_pcie_deinit() in tegra264_pcie_suspend() works then.
>> I had to clarify this with the PCI team and they indicated that
>> tegra264_pcie_deinit() is actually useless and maybe even harmful. The
>> reason is that there's a processor on these boards (BPMP) that takes
>> care of power sequencing and it will automatically take the PCI links
>> to L2 on suspend and assert PERST#.
>>
> Then why are you calling tegra264_pcie_deinit() in tegra264_pcie_suspend()? If
> tegra264_pcie_deinit() is harmful, then calling it during suspend should also
> be, right?
> 
> Or tegra264_pcie_deinit() has to be paired with BPMP doing its own power
> sequencing?
> 
> Not a big deal, but it just feels weird to see suspend() and remove() doing
> different things.

tegra264_pcie_deinit() should be removed in tegra264_pcie_suspend(), 
BPMP-FW takes care of L2+assert PERST# sequence during suspend.

- Manikanta
-- 
nvpublic


