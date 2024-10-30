Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3494D6B6B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUlA7jDKdfC5i6uEDKRAlPhIhDLXh36NwtEOyLI9Ijs=; b=Z/dpq5EmphwiosLw+WkzB6g7cl
	O+QxW5EPjc62ksklpT9Q3xv5qnGkRmWfD94i9umoH5DKhE+oKOXj3nG60X0FhcxAlSF4F7tRgzvn0
	QPOtrsT05d8LldRugrCctIbrxtnVG+cqAnqn/EC4AkyQq6HtrIcI1ES0p3Nmdp1pgefKxibdt/vbv
	DS5dXBO69p83xomuyGeG5GG92903yL9M/90tDU6Bf5u9Yomn7fjVgkm+vqPLEXDo4oemlR1kjIYjQ
	2tSgIM03b+gLw1QuQkWNi62iIMz23HUOWLzhpPgAWg+86YUXkdVySV/EKrzZRCtMXIe0OSlKIqw36
	OtwA9iKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Cym-00000001LwG-3KFG;
	Wed, 30 Oct 2024 17:59:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Cvn-00000001LYy-3caT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Oct 2024 17:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gUlA7jDKdfC5i6uEDKRAlPhIhDLXh36NwtEOyLI9Ijs=; b=VD5w9wrIzY+AvSEILh9KNLsGQy
	slICrI24gbdMRjKLaLn3KK6sMvlSXc5BOY3lJAwL3Zgr0kZTCHC6SrajF8lmE4TLN0rpVjtCcFcml
	ONnUV6ObKeJsO6ofXw19bZB1bwZLPjYenlhkt2F5Bh2pkc7CC7UFsLqcXz9zQoVNXaPBJRObcBu4l
	o9fZtKVHhUH7ADRUys3xRSv7Oa/Tq9WFGaSevKxzv5av54tzmLzGetF96zJrIbw+rsPi2EdT5iRaV
	ZaKOnPIqsforwpQFBju+QMZao8rWmOfxXDSRykFylm3GK0sU70YmoUeQi+H2V1Rh2riT/+A/aJjKf
	0Dg1gX7w==;
Received: from mail-dm6nam11on20630.outbound.protection.outlook.com ([2a01:111:f403:2415::630] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Cvk-0000000AJqT-26Pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIfK4HP6wIwlItScgYEKqgfwyjRT1pU1DvVLkZrlT3vKpgPBek30AJhUAWvYVsV1Op2ez5mCavPLFnMaVqw4OMdVuROCDf2h7ib/jzTOq0rFFdnEz6Ah4EMNaQ29D8lbZaRlu+BzHoefrMN8ulRbRWnz0EQo8Ct9uokLb1FbbeHnshCX9OS7PHGdn5/fJ2fhY7syrOZ1Xb4g2EajTGeZgUSUbz0QJM7pgHdG9aVc03SriZ/sMqOzt78/aBpPiw9zye5wSm5PHODlKFDxlqK8gwRW33MY29cdQihfq++a1tyk7IZvKtXJH/iR/a/Vu5V6dOiy6YXoPdfVD+naRat37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUlA7jDKdfC5i6uEDKRAlPhIhDLXh36NwtEOyLI9Ijs=;
 b=XdnWA0r3KWqm3k0mtzpueyUyI7owJOIN9f/MHR7MLVvRo6+8WwjdcFVGzDlQbG+M5ZhKDBRszqTTmyINoGank5uZbU4G9p33wnkKEKqx5mDJru8UZCP9RE9qiJLMNZSv49prXGfc0wyP0xLjG7HN5hAL6A0ldZ9UVD69CGW9PusmGwscQrNrUjGnOg3g9lMwg2YwyWLkvA4z3hMtE+NPz2x5ALMbHadTQidYe7EosjkkdOdpQva52B7hyQEFueCYZkfcWEtz0aVHNsCA/9EYvcOWGtIOHnO3+keB2dbRaFsK/W2cPxuVMRr8IzzUulvWG1E/JdmZdq0+Ka8Xhzpr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUlA7jDKdfC5i6uEDKRAlPhIhDLXh36NwtEOyLI9Ijs=;
 b=NUjObsQHjsLk1QGYzvdwlwhAAG9rSEDKyGhpdX1IN15SoIb9Z6mQSybvPBdLgYu8hqFTYtvZdX+xdTaBngueavfqeDD6/e6WXOFzZJpNQ4JS7J0ejYlEyQN7p8eA+qju/0in8tsMurPRhYWpKt/SMspVXKoR9F5eaQdbQVr4IjEj2IXr8qmTnYAoT9EuMPW5B4T7+k+UaG5xJodwhqgrhsxOE3olzBx4Ki4UBJxArOSIWmwNbwP5NTk9w7tLIxFYUub+atnxl+WR9bIZvYyKx7IVbpr5sFPclG2awtVq1PVgMKzQCuULLJFCrLEauyzxgtomePBKY/tli4QijchMsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 17:56:17 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Wed, 30 Oct 2024
 17:56:16 +0000
Date: Wed, 30 Oct 2024 14:56:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: acpica-devel@lists.linux.dev, Hanjun Guo <guohanjun@huawei.com>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 5/9] iommu/arm-smmu-v3: Support IOMMU_GET_HW_INFO via
 struct arm_smmu_hw_info
Message-ID: <20241030175615.GJ6956@nvidia.com>
References: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
 <5-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
 <ZyJdzBgiP70MOtcP@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyJdzBgiP70MOtcP@google.com>
X-ClientProxiedBy: BN9PR03CA0946.namprd03.prod.outlook.com
 (2603:10b6:408:108::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f0cd48-b908-4159-927e-08dcf90c26cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V0Y+oxFnObQlUUklIdO9h/N6A7tKiTXYEJC/3Bx7rnX5nYZChr6F4uHhlsoP?=
 =?us-ascii?Q?+Z1nr+8m8Sai75a7ITrDDLZAPFpxaIJzw8PFbS0lyOTC01ri8ZLlAMfSAUJP?=
 =?us-ascii?Q?+eF0mm+jkAohTYUnOd97GP5nVcehQPyV+HgbYcGS/OMHS39rpzzhz1frkq2e?=
 =?us-ascii?Q?He7f4U+EPrpShBTm9Bg12cxg2HIxOudUTn+L9V0T8CzyEXdGJQoRtOrgkFmH?=
 =?us-ascii?Q?TpqDqM1CWhrALeyPPS3lWuS8+zzd9yBRqYxR8Zi2MwI/Sd3/fcZ3T5EsRvP2?=
 =?us-ascii?Q?CvEYQhopokDHYVjFEMx6zJ0+Us9fmxPeG+jYcAdnKI/ifw/8hbLCILv+yQ76?=
 =?us-ascii?Q?o9veFelq+LVhmjIEOV+UsiYn6Q3NWvgrCEBYWdvphueqQkkZRMy1OiNAM0fN?=
 =?us-ascii?Q?9J6170nGCu6DOAwnbdI06RWRB9REDSvebFT6lipcgA+Dcbe8ArAITExs49JK?=
 =?us-ascii?Q?VsaG0+B3U160FTL3Pob+CbJnfabF52vG+hqeOrjSdh7hV1/3SN0hAAcEG19u?=
 =?us-ascii?Q?hbAFSSjwq6c78lt8Vc35Rlw1R/9F0wVfmiCHLgJexWah2DXBGo36YB+w/5Yq?=
 =?us-ascii?Q?c9bq2h0YUW7jTuBMLKuz97voA1ZS1is9idUpLu/HpKl0o+IFEZx7aB1vz9ir?=
 =?us-ascii?Q?75Iclz8JQ2TwnnHo5mwjd1KBXPkP1cwq9EIrquuih1knMF2Q/O7TdYJPQYwB?=
 =?us-ascii?Q?WBT4l4Ge+YxGbJUXED9ZMAFvkQAXVRuI+Xbddn3dcLIs1RdUFLjj9jYwmTev?=
 =?us-ascii?Q?EXVBJw8m9zpNyFonxOYPNJN+SWjJiYP9ba0rPuT90iuGL7tSPwnbhEeOepQj?=
 =?us-ascii?Q?Bw23e4VXAernBwfle7e9d99zi7ajSg47at3NrEwkbIQUrC+8V4PwdnugseZE?=
 =?us-ascii?Q?eeKx0+PfL895Yh0j2h9UMM53vXAujISDQ1IF0ncuhkMWhXdq+YiN/2Fs3gMM?=
 =?us-ascii?Q?5zH9uKwelSrH3EWa86PCqZ22sFTI3FEfPSUnvJEwZtcy2JlLXT8XLHunJ4GY?=
 =?us-ascii?Q?jga0OJeR30K7Pn8uvV9psdBYmoX2prAPjJ7+PD12Nb5CvMaQjuYQ2MmOUwSW?=
 =?us-ascii?Q?92VEMCdRaitmdLkU4vH1xritvcGkslpMeJ49+rIBA0VuE5pHcmmXUIYOuyxW?=
 =?us-ascii?Q?VxkWySR+1yA1mnEFKt6fupiaCeRezHIU9fE1MGQ1aPJBGfKvLl1irU2bXkIL?=
 =?us-ascii?Q?xGc2Ib0PU5l3VENwC1n71TUzsY4OsI7IRZV67vH8GkvmCtIJOfCcQ9U8XD98?=
 =?us-ascii?Q?ZmvQGME0bTihBRm0GbyfFICcBFdb4c+MOUqebkeppDA4twAP1ly/c0AVBNQt?=
 =?us-ascii?Q?H/LBvjJVCC97QHBhwDxygdOG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ez3YIP66dEojdObdT8HwlAL/VBevwp2OslIUF40YXePIReGxrfzcw6t2CkBG?=
 =?us-ascii?Q?TcSRTX6ia0NrAYO1ntKG9BQjn1y48xToxRtmMdWu3svTUxMeRA4eJhLLsni7?=
 =?us-ascii?Q?q4baz6BCGG+kyk3u6eEHiTnk+6rc8sWELa1aVKWQqGgIJAB4MEdzariRRkOD?=
 =?us-ascii?Q?Owqp3woflSv5f7Ez51G60E7/ewTnNsDlnFzh2FAWqNuCjXKvP+3Ig2Rw1BHa?=
 =?us-ascii?Q?wUGhWhNLvQAUgk2ezo3ij8bsZIyhuEyK2xAlJvujL2loJMQMPS/xZKNfyh0H?=
 =?us-ascii?Q?F/VpydCSc0hGknHwS87EZxYK6pwuvJ0hl6ikoWMHk468Qn3zlLXpUz67stv7?=
 =?us-ascii?Q?e4gndzB2iGq+ZE4UbjUt5LPFgyoEn6koEKGG7OnLenNu34xsXOly+K0V0oSx?=
 =?us-ascii?Q?BW5+O1MBZFhAX9ZVr+W3M2SS1lV4i3f+8crhLaMeBxkKH7dtHvUjliNmaLDF?=
 =?us-ascii?Q?wSAU1PHXf+SwyGZqx1RWMMlpl7iwRY0lk8FBVx2EjDXfpL33CAPZaTE9+KFh?=
 =?us-ascii?Q?pTw+37W1oeMTYk9fx3QFkn0K+iURvpPRDNPVflWRRfSef1KgtHzpOikuKXvM?=
 =?us-ascii?Q?VehCfEf2uxpIuFzQlDEIrIYaKQ7VpzzfAx+I0Du0/p7S3PXpcWUD/HVYrDKn?=
 =?us-ascii?Q?pIv9BoSUfHJEG/rlJizHBxY/+xbjHCIrg/VNR6vAX9T0+VXFo7PlSP4jIW3Z?=
 =?us-ascii?Q?x3jsMunwVzRNVOSwa/vzRV8UGI1gALfERR3M1e+wJcWh/3RtEMdz4IAqnd8d?=
 =?us-ascii?Q?6NNpqHtUkf8z57wBjDOnpVR/7natacmHrDjk7A3acvtrYQp5QVzjNg69QtQA?=
 =?us-ascii?Q?5V4IM1GQceEzpmUKzMKOOpshtVKpjSk1vkuNVM2h+wC3QNIXOvpUcHhkns9f?=
 =?us-ascii?Q?87An+1NfXufza2RM77dVXHIOJ6teA68lIMnY3a5Hs6P1jmj25HbW+Rk9gWbq?=
 =?us-ascii?Q?CC2YshkuiQTUJKaWUC9BqrziEmTZl0ZKigrFoDVg2SdtoafOhdnj/Hk6Clb2?=
 =?us-ascii?Q?Cs0k0O7urwv/7/ryBaPMLWxcEalObxvCyqIPQ7wHws20ppPq60AuNRezA3Qe?=
 =?us-ascii?Q?PaaHgpilWOLv+EVsSAErpgqlQ/CMg4SWkbrjMkbhv6ovM2x7qzrcfNWcwLhC?=
 =?us-ascii?Q?rCxKqpPs3PRsIdFUFlLBrPpDbUNUNOe01ViVqogt3LVIYjlkYTjkhl3BH0/y?=
 =?us-ascii?Q?EVfOAqwC52EyFT3J7tI14GDT5GkH8GMh/ZRLSHnKRtFzsNeHsbHgPdyVurIq?=
 =?us-ascii?Q?QKDDagHTwz/HGh+iyvZWnO6TL5rFaiy84ghuWogeC5+XP1ZrDogWJVSAvPZp?=
 =?us-ascii?Q?iPR7XHERPuX+OoZnwMUIJHoFTq3enJzOHFu1CvFKsLi3L7SOcOt4stwOrqzx?=
 =?us-ascii?Q?qrjSYH7wJywfb/BVr4PcZHTbJRjOerxvdYdELklGHMHOM4tUcMvkXHJKdXdU?=
 =?us-ascii?Q?uBZSDVRz+tMeARh2lqF+cIce8tJW0BznC38bWhRnqBrISNvYeZkMpWtlMyRS?=
 =?us-ascii?Q?XAE3COn361XpX25mGKeGfp1rXdmQVdz3pHZ8Xeoi7/WY4eeg8pCqsKAsKvj7?=
 =?us-ascii?Q?3/eygEmIexjl6sxdBH4wYDhSNEygwi/aOfOsJJVf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f0cd48-b908-4159-927e-08dcf90c26cb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 17:56:16.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxsaJM/D92PnSERU6VOqfKauGmb8u5G90O2nFbL3ReR8dcDTG+mi9jyFbyiIa3ET
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_175628_660790_43D7976A 
X-CRM114-Status: GOOD (  14.54  )
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

On Wed, Oct 30, 2024 at 04:24:44PM +0000, Mostafa Saleh wrote:
> > +void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
> > +{
> > +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> > +	struct iommu_hw_info_arm_smmuv3 *info;
> > +	u32 __iomem *base_idr;
> > +	unsigned int i;
> > +
> > +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> > +	if (!info)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	base_idr = master->smmu->base + ARM_SMMU_IDR0;
> > +	for (i = 0; i <= 5; i++)
> > +		info->idr[i] = readl_relaxed(base_idr + i);
> > +	info->iidr = readl_relaxed(master->smmu->base + ARM_SMMU_IIDR);
> > +	info->aidr = readl_relaxed(master->smmu->base + ARM_SMMU_AIDR);
> 
> I wonder if passing the IDRs is enough for the VMM, for example in some
> cases, firmware can override the coherency, also the IIDR can override
> some features (as MMU700 and BTM), although, the VMM can deal with.

I'm confident it is not enough

BTM support requires special kernel vBTM support which will need a
dedicated flag someday

ATS is linked to the kernel per-device enable_ats, that will have to
flow to ACPI/etc tables on a per-device basis

PRI is linked to the ability to attach a fault capable domain..

And so on.

Nicolin, what do your qemu patches even use IIDR for today?

It wouldn't surprise me if we end up only using a few bits of the raw
physical information.

> Maybe for those(coherency, ATS, PRI) we would need to keep the VMM view and
> the kernel in sync?

Definately

Jason

