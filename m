Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE81CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQE0aY5MhdEY8l2Bw2mamjLMhpmSGJlW4kqMUXxIi/U=; b=zxJ04gdzXAWaR1G4YQHE6O22wP
	wFtubR7ULMxjgyjMMNck5ViT//wLLVBWeN+kcCyFL99Vj09obh3MQR1vateoIZYJ4xlXt/LI0JzRd
	dpHZp6rJgGpp6u3k+cWtMjjPT/kxEd31f1Q20+JnR2GhmDGo46d+tmt984Bd4k95JJPOT+ZiJwoCt
	ggdhBVb0+dHB7j/yHqcw11ngHtk963Cqhp/9axuO1snKaCTQCN1xmxJASeg5FIFkCC3lsVCQFcKxm
	aUrGy+ajOR1ZAMnxWjZypoLXXEMSIxs9LOE3u+a7BHE0RQ4KUh0jiRfg4YRv6xySfDfFkeWAXw2Ev
	fKt4eCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vy-0000000Bp3s-1Jvt;
	Mon, 01 Jun 2026 20:45:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vx-0000000Bp36-0CV6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 20:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TQE0aY5MhdEY8l2Bw2mamjLMhpmSGJlW4kqMUXxIi/U=; b=KluXY05tT60wp6HEUiWhfaALwh
	596GO3Z1mBixS0NVWXtc1dnDBxSmPEVqrZ3MLw73tPPGFI0ZGeFFF0JWSiHhizalit+VctQ10Syti
	Sx2YlCVB7paKnIwvKHOrngLZ6hd1alEimlWxJ3PkkSI6kzfLzY0Y4CSHRP6PtIRXAkVuehmfsqsQ4
	TGDxqY7MzmT+ocvaD6gbhDci65dqJJaLbXUwEsbVOhe8FiKxzVY0HxECd5v8bhBx6JdOoVxmhSvPF
	SxS/K36Mg+3T5SqwTfTq4O9SEAMpW7qJknty29pHDzfkRmk55OSGxMV6pc/c7jCypJ6tZ8qA0YHef
	gQY96GZg==;
Received: from mail-westcentralusazon11013030.outbound.protection.outlook.com ([40.93.201.30] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vt-00000007ioz-28bB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqeNcwmuHBZNZaKMlinv7MMq2Ahm1oMitL2ijXzDlPqmFB5utfEUZ5EHOskDP/j5iM+PJ609+VgzaunbYZG1UhhltnkrdwTkcgJN/MfGJFsxeJZXsLiB64q84T13bewjB/c3kNi7jzd6hNNEBVIC8wQHx6OKaf1D5yi26b4aPBAN/ATsHX4jGFwBeFY+jx6CjDeFXrsOi74qE1mGh6Axhpj+IPAPVG8ZwtA9sSypm/mbmeut/aRjHavtm5v1qy6DxtUIkXsmQETkQ8NbpLtLE4C+lJlnv3XURfkGkHu3kbmdBojU4dpnjTJ+9Ds/o09u34oul3MaAj5ioj1aSUXnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQE0aY5MhdEY8l2Bw2mamjLMhpmSGJlW4kqMUXxIi/U=;
 b=SSXXa8Yp2yPEfGElCHxJw9ZTJRkgY3026ef8461eLeElPZYFCx1vFTwuLTtOeXo9A3qNXUh4KwuRbSxuBAXtyQj7GYs3nha8xsVIHx43x6eGAXKSA2foWcLly92o4R/12bKY9VjnXm557Y3QbVTVPT9gfSHww507DSpKmBY86a37+Qps5HoOz4M4igEdFhZROIHmNkptsVWmeAbN+yz/6+9re4PHqx11g/LejhINH10S+4naOFa1tTbDEo1avXldEtMGQe8ibScAekHdbKce/x7DOtMks1pKR5P0bLH6991XHA30cvMjDuYOXZEmuLnXi6xMjPp5aufJe4XeHSh3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQE0aY5MhdEY8l2Bw2mamjLMhpmSGJlW4kqMUXxIi/U=;
 b=e71ykhjD03s7tFqZxdZ6pMt1ew5cJAycgtb5aYb7cVn5DoumjT6axv4doHaBWb7wK6W/P8CM9s4ibLkp7TmQScGIzxg9c5d5uAB7On6mkFgBBNkX2SAEJIk7oYKB1H/YZFaSCU5FFkAbcJlaLEIXAkbc/o9g1bpMh6iKCN2XmNR1BNN5PLVN8gxGZObb97JtHmjqVFAbjTerNTYodUVfTp162YbjFQpx9H8IbVRFVfkVdNz9nUjyC2Ya/RbFauktIPSS9MFJ/cbCnoyN0Z3I0yMzBwNuCis66nVQw9M16726LbMwzLfQTiADfvJ4uxXdqrsZLzW3vaslPOwHNIt2Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 20:45:24 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Mon, 1 Jun 2026
 20:45:22 +0000
From: Seth Forshee <sforshee@nvidia.com>
Date: Mon, 01 Jun 2026 15:45:12 -0500
Subject: [PATCH 2/2] firmware: arm_ffa: Fall back to minimum buffer size if
 RXTX_MAP fails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-b4-ffa-rxtx-map-fixes-v1-2-c071b12ae05c@nvidia.com>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
In-Reply-To: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Seth Forshee <sforshee@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: DS1PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:8:458::9) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3a299b-6bcb-46af-a5dd-08dec01eb372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|5023799004|3023799007|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: klSJI3lFHGweyeFQyTQ6DJCHp7iesmY64cDXrKKjWly2dE68VK4THHTqKe9qV1zB7QE7v7ZLNRl0hE9DZ+HU5s8S9CKnS/ExzwdxNQhkXvDksiElN7oZ37Jd8yNLSHXoo9Zn2y9xqUHYKcRrg4AOAZPixkOLniFUCguEIhvBud2Cw7CuHM4nfrn1zTTQsHY+1jpe1EghObOj9xy2JAORCJ06/RJnJ8F/forcPWmXE0XIKmImk+ZCrL1ux+2xFAiHLx/6v++EyfEsSIp3DbZL89gVy4MO1VL8Al9GQapQvMwq42Vw++ZIoJBBbBzcWXZq7+KM18wC6dbQbwRQ64YxplzX5EXZAxYWSOxKCtB2CuBJL2MGnmp4mubNtoF1ev2NKFDlgj+oVPcyH7kZOJ2ao1gVXvu+tGHfkHzT26pVyWXVsC4Rp4nzSoqzAjpyBU75RwRDws+uP4XIHMiGV4p+Z70n6W/X0z2BH8iVg269COjORvs2Ia3IbGIS3+z6G47uieisbu00dPO/f3S0uJz/E6ztZahhPT1biA/hSxANdXB7N3A7HIFD7bkVXkF2zKpcFJWaDAhGIyyzDqZgxuyYbu4MbWkyIMHNLcrWOpDeuXL+Doysh4Am5hXXC6vErCGHgVzJBW5feogUkpe6EVd6QWl38sBg1lRDRp/kVefuJWBSZ2Scrwg8INkIIJ3+WBdz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(5023799004)(3023799007)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3dhdm1wUFVmSElMMjZpU3pZdjZ6bWEra1M2ckhxOW9qang1aEFXLythM2V5?=
 =?utf-8?B?VHhGZWo1bzRIQ21YTXlQbGtqWlZrZXg2WnJHeFNqUEVjaEdEYzB5MnduK3dr?=
 =?utf-8?B?OHVaV2JXc2lCNW5KL0MwTHJkM2RSVG1oaXhscUt6eGRLNmVKelJYZDFtRitB?=
 =?utf-8?B?L1B1M29TZ0RjQWxWN0JaSXNEdTBvSm5DYXVqeWxKNTVEdTlmaHdUYzVCWUh0?=
 =?utf-8?B?WXpGbUplcG92RWJxTmtWSGRnbUJUMitqVERqMWZHRVZoVFhITERkTHlERWtD?=
 =?utf-8?B?Q1VXL01haldNUVFhUlJZWEZpQlFRV2J0Zml1QlpjN1A3MXFWQllaRysvOTJF?=
 =?utf-8?B?S1R4dkpaNVFOK3JlMUQxNDlQVG52S0VqeFRMank2WVh6ODZoVlZtcWdENXlB?=
 =?utf-8?B?N1cza0RaektpU2FmRUFFajdDSDVqWWxVNzNiRTd0QWcvUDNZcHp4Yk5sN0VS?=
 =?utf-8?B?Ry9VSFc0Ylpwc3VkK1FCVUhrMkUvckFGZFJ2dGQrRFYwR05UalBJdnFJdUtS?=
 =?utf-8?B?cGYxYUVIbUwwRytxZk9JZ3BiYlhVdERqTDlwM015emRaRkViMW9CcFovdmRY?=
 =?utf-8?B?K2w2MTJPRHJZU1ppTitrZWN5ZTZPeUZ3SzJ0R3hZa1dHT1pOQzA1SjNNME05?=
 =?utf-8?B?dWRmd0lRdldCa1RQK3BZQ2ZGWGpOSmRNT0trcEJESHd4VTVhMS9WT3FQY1dH?=
 =?utf-8?B?THczOG9kbFpNVjI4ZVBjSlU4NCttR3gvR1FlTWQ0aG1BWE5Yb1ZIdm43bVFL?=
 =?utf-8?B?UzJneHVCVEk4MUlCRDIyNG9jL3htTy9ybncxemFYaGRhRDFZWEhTbCsyN1Ex?=
 =?utf-8?B?bE0zdjJzTWo2YVhiT2szbzAzdW5LZUZ6Q1E1RWVuWVVHckJ0UXNqMDhVV3lZ?=
 =?utf-8?B?aEVQc1dtc09rZlBrY25xVEhBckRFYTdLRklNeFdubjdpa0FJOFZaSjlPVURF?=
 =?utf-8?B?U1A2elFDSXMyZEQ2WkZwTXg1c2ErbGdTYXV1QXlhSkRYY2VZbjZwYWFHNFBx?=
 =?utf-8?B?RGUrTk1xcThNelM0cmNqL3p3andVa0twZHhPeGhPdHI2dWRzNzNSUG1iOG5T?=
 =?utf-8?B?ODhqbXhEZDl5cGY0U3BRaE9iNklmRFpHNG9ycGNkWU5vVWd0Lzdza2tpWWZ4?=
 =?utf-8?B?TzgwcDJVVFJXNnp1dms5cHQxMTIvd3VwZ3IxVjkzYS9NVTIyTVZaVW9GQWVW?=
 =?utf-8?B?bGdOeFgxaG5acTRXTUhqS3ExRGp2a0wvSm5jMEJKVXgySXNveTNQbGxUMW9Y?=
 =?utf-8?B?VFc3Mk55VG0ybmdpVHJKY214Qjkyb3YyZ3UwU0FOV3orL0lJWlFZbzA1L3lL?=
 =?utf-8?B?N1dCRGpoYkUyZHNjbjEvV0dteG01b3BWTU1tUE9ZcEZDSEZCaEg5YVhyaXJn?=
 =?utf-8?B?RTlCS1k0UDN3RDVva2VGWlZORzZ3NVN2V3hHajBJbWlBY0gvSE1IcUhqeEpj?=
 =?utf-8?B?MjRMSzZ6dEpKYllQZkN0ZjQ2Rys5dWlTaEg3TGN1dGdBRmQ1NHoxRHhXbUNW?=
 =?utf-8?B?MUtVQk1mak9EenlyQUpuOVUrN3JtQ0JDMjlEc29TekNTOXhnRytla1ZtMkI2?=
 =?utf-8?B?b1dmRmNrQVBEMDZNam5DME1XQUhrTFhwU2w4Ri9hUmp2ZXZSb1lsM21kUWRC?=
 =?utf-8?B?WHFmMjN6bmZTcG0wcmYwRHpOS2MwYjVodGdteitDb1ZUSk9WcHgreHcxcWhU?=
 =?utf-8?B?QlJYU3FZb1d0ejc1Z2tDMEhjNVU5cllKMnpXN2V6akIyZUw1eXNXWmFSODJP?=
 =?utf-8?B?ek1heFF2VDJtcnQveHNNTkNuOFErOXVSd3JBMnB1N1FpZ3JTTGliMmJsdndZ?=
 =?utf-8?B?RktPcVp3Y3FLNXRpbmVkNzZ0eXdtY2hhTFM3UTBOMVBtdUZkcFVqVXlxdmsz?=
 =?utf-8?B?cGNaZkI0dStSVTVGVFRZbkp3SGhvWm5nYkc5Rm1kRDFjNzNVNEdNQ1dMbGJ3?=
 =?utf-8?B?Y0M0ekZjc1daWFp4WGMydWdKQ1ZuYm5PemxKWWQrdWtpTk5xdklIME5sTFhu?=
 =?utf-8?B?YXhWTFdwang0SEFLbVFlQ1dIazkyNURDdm5MOExpZFd4aE9VZmJYd3JkTjdz?=
 =?utf-8?B?SGdNNE0yek5sQlQzbG5wL090QkhFQVl0WjlRc0UzT0cybWFvVEMyVjFVek9W?=
 =?utf-8?B?SGgvSTNqemFHVHd4R1pjekxLWjhETG4wNDFDalNaRHR6eXljUjRHaDVnYWdk?=
 =?utf-8?B?YTFMMGNLZVNidW1pOHI0V3h2R2YySll5NGwzdmQrcHhWL2UvWXppRGZIUjIr?=
 =?utf-8?B?YWpaY2diN0o0K3REUUVlR3pWVjdRcHN0ZmNDTmU1MmxHN0t3dUU2WTJublJy?=
 =?utf-8?B?MWdETHRMdDZhdGw5eWU4SHh2YWhRTTd4QmpOcjJDTjJlTk15NW9qUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3a299b-6bcb-46af-a5dd-08dec01eb372
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:45:22.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQXM4ktiflwEoC/lBKltkdndPSdNSbL2WeX1giZm9AOMDeaD/9k/JLm1O+JHNVl8+O5T7+Jf30IAZwgxM3CFSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_214534_124372_EAD250DC 
X-CRM114-Status: GOOD (  18.32  )
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

FFA_FEATURES only supports a maximum size value for RXTX_MAP in v1.2+.
Older implementations may still reject larger sizes, which can happen
when the minimum size is rounded up to the page size when PAGE_SIZE >
4K.

Fall back to the minimum size when RXTX_MAP fails with
INVALID_PARAMETERS to fix the regression on these platforms. This also
has the side effect of falling back for v1.2+ with a maximum of 0 (i.e.
no maximum), where the rounded-up value isn't expected to be rejected,
but there's no harm in retrying with a smaller size and it might even be
of benefit for a non-compliant SPMC.

Note that this may result in passing a size smaller than the allocated
size to free_pages_exact(). This does not result in any leaked memory,
since the size extends into all allocated pages, and free_pages_exact()
correctly handles sizes which are not page aligned.

Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Seth Forshee <sforshee@nvidia.com>
---
 drivers/firmware/arm_ffa/driver.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index dc45724a29ba..60ad58e229ce 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2095,7 +2095,7 @@ static int __init ffa_init(void)
 {
 	int ret;
 	u32 buf_sz;
-	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
+	size_t rxtx_min_bufsz = SZ_4K, rxtx_max_bufsz = 0, rxtx_bufsz;
 
 	ret = ffa_transport_init(&invoke_ffa_fn);
 	if (ret)
@@ -2118,22 +2118,22 @@ static int __init ffa_init(void)
 	ret = ffa_features(FFA_FN_NATIVE(RXTX_MAP), 0, &buf_sz, NULL);
 	if (!ret) {
 		if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 1)
-			rxtx_bufsz = SZ_64K;
+			rxtx_min_bufsz = SZ_64K;
 		else if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 2)
-			rxtx_bufsz = SZ_16K;
+			rxtx_min_bufsz = SZ_16K;
 		else
-			rxtx_bufsz = SZ_4K;
+			rxtx_min_bufsz = SZ_4K;
 
 		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {
 			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
-			if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_bufsz) {
+			if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_min_bufsz) {
 				/*
 				 * Per spec the maximum must be >= the minimum, or
 				 * else zero if there is no size limit. If the SPMC
 				 * violates this constraint, use the minimum as the
 				 * effective maximum.
 				 */
-				rxtx_max_bufsz = rxtx_bufsz;
+				rxtx_max_bufsz = rxtx_min_bufsz;
 			}
 		}
 	}
@@ -2142,7 +2142,7 @@ static int __init ffa_init(void)
 	 * alloc_pages_exact() allocates full pages. Use the full allocated
 	 * space up to the max supported by the SPMC.
 	 */
-	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
+	rxtx_bufsz = PAGE_ALIGN(rxtx_min_bufsz);
 	if (rxtx_max_bufsz)
 		rxtx_bufsz = min(rxtx_bufsz, rxtx_max_bufsz);
 
@@ -2162,6 +2162,20 @@ static int __init ffa_init(void)
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
 			   rxtx_bufsz / FFA_PAGE_SIZE);
+	if (ret == -EINVAL && rxtx_max_bufsz == 0 && rxtx_min_bufsz < rxtx_bufsz) {
+		/*
+		 * FFA_FEATURES only supports maximum buffer size in v1.2+,
+		 * and some implementations without it may fail when the
+		 * buffer size is rounded up to a larger page size. If
+		 * RXTX_MAP fails due to invalid parameters, try again with
+		 * the minimum buffer size.
+		 */
+		rxtx_bufsz = rxtx_min_bufsz;
+		drv_info->rxtx_bufsz = rxtx_bufsz;
+		ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
+				   virt_to_phys(drv_info->rx_buffer),
+				   rxtx_bufsz / FFA_PAGE_SIZE);
+	}
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;

-- 
2.43.0


