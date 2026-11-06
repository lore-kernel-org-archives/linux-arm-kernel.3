Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t1Xy7HCn;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DZm9tmKV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f/c8oLEB96kGiQyQe8p7JPMgQIz5cmNIalVz0AhaNlg=; b=t1Xy7HCn1LvfWuAoa49XP67Nga
	Juk27+hgp93ErUfdKduvSr0OBKklpTMOjjPD6RGV5Nupc1eFI6bD6WJq3lbXZfqNUjliGkrjUQ+PF
	JID5STS1qaS1Dl8v5qIOCJQTUI2A+hVswTeQpioHCTp+LcBAZpElEfjvXFwJVMgNbcx4sIfAQWs4X
	nPthodU+QMMzg+s+0j0UmC51o0y0MvhdiVemCEVozwlMeb7KzL2C5mAyWbStECMf79MyYhu9F7b/Z
	Im2MBFTTXeE3BpaGkTAxGt2+H+bDhX/ixmT6Q6/2N+gVDLU1ebeR9Vx/3ztuDle8PNVYH+YICd6Wt
	wD82Y3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL1Q-0000000Cgbe-40pX;
	Fri, 06 Nov 2026 14:34:28 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL1P-0000000CgZu-1jge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuAA5xA/0Uesc/KsqBG9u4jWF84zOx7U+ayaRxLfDe9BoWPZOCEaXnv1PziLSFvPz/wfAyA9nYOLpCf4yhum1fWlvIC5blj6JyDXobB0t1JJkd655BdKGBm8/8HZaBslQIMvPegWCmLrzpwzt9fQwcTNXqE61nbfwvUZDIV37CrLQ7945XqdRnn4LmtozteS9hlwO9BNcDBJOUmW0y6QcT802Lg9PwSo7zr5qJqmO1Q0a5zTXcaANNQNUaHxcWcH7V4FSHozmYC+nTIckdZxzKGDnMBb/aUoHjMJUCGU7dkWRAQqqSV2Mbp353h4TsUPn5TmIFGkQvg4GPfUpHZEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/c8oLEB96kGiQyQe8p7JPMgQIz5cmNIalVz0AhaNlg=;
 b=PPzl3HO6vN6LwWoyK23uxT+eUh6+rUDIFc9Wj73GBPQCc/cdfyBRXvZkxE3Bp4X4vnQ0Xuoylsv1g72oy/u+1B5Ch1s/NzopNitI9hy0noCMhtexZEriUph607bMBohqN6CI3O3XOCOQey64IKCjLSGM48laiy0NSpEnI/adr6/xobRtLnz1V5WU/RYvxYdevbdgswXzSzPQPIKR9AB05wa6cm4u/tPCzR8Z+1/WM2WuM3Oo9SmFg//ptFlCxMWFe4gejSENd5SHdx8CyiqpseKAXdMHcr8V4gI/tO5xGJlY+uwySXZRVf9LSeaRPm5cDGFA4t7+aFuA9W9O43a/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/c8oLEB96kGiQyQe8p7JPMgQIz5cmNIalVz0AhaNlg=;
 b=DZm9tmKVpsTqBuN2haoroqOlCRjuTHL/JzzcBmFWsPTehMxqcKEzjQpKP6Izrcl/SsFnl6CR1+hSxESng1L1u/HqNPNief34VXmUhthTFnch5I+KJ2ya9Ecs6fo4oYi7VwAaanOBx+N8sjnQas/umu/OloAowFuF8osnju86h3tud4QwDRdK3jIhs7QHjypLQvDQA1wTjYylVJOpTOV0spThQs7WikmXjja8CtzAHqP+vlLnd2AM+HdYfTRqwKECQTD/Yn6Q16WuNRhMBe6jQQVNLzambvq1s80WQVKtIVEckLWp1fuGoBdsGsbpVPcKgCM/xey5kRrLXZhM9U87TA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA1PR12MB6353.namprd12.prod.outlook.com
 (2603:10b6:208:3e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 14:34:19 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 14:34:19 +0000
Date: Fri, 6 Nov 2026 10:34:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 4/5] efi/arm64: Expose struct efi_image_info via the
 image header
Message-ID: <20261106143418.GC770409@nvidia.com>
References: <20261106141936.2744481-7-ardb+git@google.com>
 <20261106141936.2744481-11-ardb+git@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106141936.2744481-11-ardb+git@google.com>
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 44756851-9a08-48d1-c6f5-08df3c130b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|5023799004|11063799006|261022105027099003|56012099006|261022115727099003|261021121427099003|261022075727099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 80EadhGH98TKp3sJ1SbNT+T/BJSkqpIibbLHMPeGZW33Db4Pz3iqgxZpaX809iQuQhH4JnwSVbgQLHe9H10ABWfrg5ffMR7VL2LhFfpz1QPrYpJwOJEYbeUHLL7AYQFAaJkw7ya9JVDYNO7+UUhBKfS9C1v6e2jlubGPA0PRCxJLXCOEEbOBG8RPl50MjFqrpYKx+PPFwXqubv2Hu6T9y8kXujbj2PrBnpBwGpdDYY1jC0vhegj4v2f21hFZk0kNRPCbi09xiNLff4aPjd32xtIlYnNGvbmi0/aDYeNSBBH9How1TZHFBQ0VXwNk6QpswT5VwpwKAgIyx4k2M98W7XnSnG8NwPqjwdJccvYvfsvTnE6T4QK/92eMIb/5pKQuMlmsmoC9mzmgEskcdLe6+GNiSHQp5JN8FC15T1BHx9aRo2H9z2jCADp1YFop9q/YtGCvzxmFcugKcm/JjhEbAcMxinpFMaXRugvuB/+wOW03L+GWz5Q3qDZMwZoZefg5QOWuUrE/QtO20nmFMUnRq4PusxvsncwQZkF8xtjxblvrcW83CaZZ+znqdzK8DtaYP6xVbhy2W8QBcapOjDPe7+vJ7pFNjW9dhNCKvUzApjZhgqtVGbqyjv9iB6NHhh4ujhXcXCMAh7F0RrhyVWLHog/l2JKW+OB+UeknXZPGQQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(5023799004)(11063799006)(261022105027099003)(56012099006)(261022115727099003)(261021121427099003)(261022075727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yN2QikCjk+88YMunwCQSdIL+3IQFpNqgIPiNFBLmiyubE2eQx0sARNLzztjp?=
 =?us-ascii?Q?URwxJ0mVrdKP7aswKguCQ9BDC9evpdzFsQnKzTqhqk22NXexPEIPvpq9TZi3?=
 =?us-ascii?Q?JozpCAQJVxyoyPsgReuilo/X1DNkoUNcH36Zzv2C+3ZM5H9Z8ckyzmVtgWv7?=
 =?us-ascii?Q?l0ttnRnNqkqtjp+sX1hmAJh64W1lJbdwv/OrCan4xWNXuvE2DgdiQbotigwe?=
 =?us-ascii?Q?Nz1r2+jENJXGcPbA+TtGnk6DByjhUVfy5xfrQ0Osh8F6VaDtVv0NaBHCawUC?=
 =?us-ascii?Q?nX81z/+yCQY6c4kxXl0wkyJAQI4GsrVBMLzOt8fiX+yVCtTNqytLqCYzCnz9?=
 =?us-ascii?Q?FuQolsyZTfM9rm60lzrYB/8+ZIvaRzCGJQMnPiEMz5DYopdtahm9Z1tXbVCr?=
 =?us-ascii?Q?srsHrS9j6deqfm3PrfQUsKXf1XybycQoz8/BI6FOeNe5UdtBekJBqVn/fPfY?=
 =?us-ascii?Q?8JYXmTKtJz0NM6rQmwAW0nPLkqlgPwynVM5DsGqnLktkiMylsRGACVkZ3L/j?=
 =?us-ascii?Q?jK2PRtUoC0ajcfOIIdpRyZKNEyrWKXOiXTUJn8cKANKbixqfbI0eHXok/4JC?=
 =?us-ascii?Q?aZL/4MQjH4MowzbyvtLCsGfTzjwzwxIiuZvBJXGmd6twypvvjSsJq+hxVxrk?=
 =?us-ascii?Q?oyWu3egLKa2U1G+IupXpny9Yg5fTwmlaioCKHqoKcRIM6jR82EM53wICZTol?=
 =?us-ascii?Q?694kv7wmjiBuGdCNdWef/ICAzmsEytjv0vksaIjoQtjD/81usjaHfFAoJQtI?=
 =?us-ascii?Q?FRxGdfa11lJjSfbJXE5AI1L68mS/DTUTcO23XWLGD/hxMvuRBeVemHIHbk4m?=
 =?us-ascii?Q?sQ8p5MYno2V/hKUiseTaFHV5XJ14n67BTQaSpNSohQHrAeA/J27Q2IiW6Q0f?=
 =?us-ascii?Q?+7JkqdWSlxNcYvvSSjo59iMJ0xNylRYRRHcnVo5CYn2WLhjR8coKLKhxs/Ie?=
 =?us-ascii?Q?m6rewpY33QAPArYiMQ/2UitCOO7PeEANK9TaatpDC7HvVer3891/Uw17NHVN?=
 =?us-ascii?Q?Pt6AMuojmHcv91r53UfT8/PdUp/0xe21O7cds4KDs4+H8NPuA32EPQ/WxHyu?=
 =?us-ascii?Q?S6OwzbyKHZJCajX/szwI5tplLznltEoSk0QRVSkn0Pp566iKG9Esm/VvHzOV?=
 =?us-ascii?Q?TpBoh+3q4PuE9t1ErZJBfI7K+N1KPTp/2/QjhQw9pvrPVOuTEHO6fKXIZnT7?=
 =?us-ascii?Q?JcePbZFdNqHoFkX4gce9NjCJIFf17ob2WfQ6T43sS5FYYix+gIXloqN7/8kw?=
 =?us-ascii?Q?A7LR7HhG1bHkfIMy/659QaahmmNaNQbJRQN67DnkGuWzl9Ym66tK5VBdhNqT?=
 =?us-ascii?Q?srD32gmUK7A9G/p03J1EWiOYsl9KqZr741aaQv7jb3dFEURS/38MCeShv6CG?=
 =?us-ascii?Q?Z6GjhB9oQV3Su/0Nuo3QSkahaHLJS45CgRzQ+0FrQJiiAj7RjFbDfd9PgFFK?=
 =?us-ascii?Q?P4MtEVDsCYNv4neQa0lI8T8ByfSnVP+GK8g/SOmabfQIOISy/lctwfeRBAnX?=
 =?us-ascii?Q?TVqRFCKNxAWqjHa7YE8vDVROQp2S14w4ZF13bEgK4pyoG793aBBxOohotQWT?=
 =?us-ascii?Q?7ID6mYuiKHMS6feXIuANvG4xv5aS9XhpQPGDWtQhheq7AGvlyaS4cs+307I+?=
 =?us-ascii?Q?Y97xEWvwlKcnWqs7QvlClrZIy/rWqHvm/MoFqUmHYKBeqOpZcUSy4oR2p+oL?=
 =?us-ascii?Q?jtSxnbKsTer/6cdMRbU7JelbQWAwNSLaAoG936v4U8nGcy7F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44756851-9a08-48d1-c6f5-08df3c130b07
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 14:34:19.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xroN+SeeSzNsfKOioaigYyrWgq4W15oaXdDVwn7asc71Zh/jh6TYytX4X+QWJEZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063427_458688_4F5E7154 
X-CRM114-Status: GOOD (  15.56  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:19:41PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The zboot compressed kernel and the uncompressed Image both contain a
> copy of the EFI stub, and both are tightly coupled to the kernel image.
> 
> However, the zboot stub is not linked into vmlinux like the ordinary EFI
> stub is, and so it does not have direct access to its symbols. This is
> needed today for things like image size and code size, but there are
> more cases coming (DRTM) where both stubs need to have a consistent view
> of these things.
> 
> So add a struct efi_image_info that is built into vmlinux and exposed
> via the image header, so that zboot can access it easily.

I tried hard to avoid doing this because I didn't want to make the
struct layout ABI. I really see only negatives to that.

Putting it here and documenting it in the rst is going to encourage
other bootloaders to look inside it and try to read the contents. :(

The linker trick to inject the offset into zboot seemed better because
it completely prevents it from being ABI as nothing but the EFI stubs
can ever locate it.

Also, I wanted it to eventually be cross arch and I don't know if
other arches have any spare space like this.

Jason

