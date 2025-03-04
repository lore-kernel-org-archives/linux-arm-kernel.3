Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F0DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FW8q3gAeA6YqeY6JEo6iuIalJT6QhcV1WCPpcIYkE4=; b=aVaDYiSBw23fauPPKNXw/qP5+n
	7VYJlnJI5U+dajlu4jR5yBuymTLrLigFFc8G4L+l6FWlkuCjJ1zMQTUtbE9oOktAmn0OlMB5BoRVd
	uiMZBQ7qVHA3f74wTqiGHPKfhR+kqh6LSQjiAgyMCMKDZ+WIyiqKgE4eaOeayKq+hetBszGL3DKLZ
	vj4rLE5aZHmstqPdstr0dkiQNKMT8HLJ2HccBmihkXhEz/fZcDTRZkwljU3+2KwoIVp0HatmZS87b
	MYnXgVTY9oLt5jUhm0khiMsm+m4xNZqjJ15DOoA22EK8VvkQtTiGGDMXHoyq/+bHRmC4tydlLJTV0
	sS18ymmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXj4-00000005ycD-3Ds3;
	Tue, 04 Mar 2025 19:14:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVCx-00000005RVi-0weD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 16:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5FW8q3gAeA6YqeY6JEo6iuIalJT6QhcV1WCPpcIYkE4=; b=MlEhFjKluoyHopFpsw5aOe58kq
	I9R8gt9fBn/7YCwBMEPCF5yCfdv3e7ROX2soQH/+a1su2hZu69B6Q+VqkA4v4cen+EyAHTu6fELA9
	EGlY+n/b0oloDLZMeSvY+tK7DhqqVNNQ0OysMs3N5d3kenB98B2267Zx4CURjYrfl6wqM+uf06Led
	t/+fvYCgjwBXVlEWjrCvBUZsUEY29JQZQBY9NFpxHQvf+1nNMDs92OEGmZLXJi5Gv7KTWiOOUj2jF
	MNC2ymMsFYmAEH5DbGizioe37PWrQ//gV+EGn+hLIVUC0Mx+dfo9Knog1j1j91dRigSlRq/9PlBZq
	wHaSQVPQ==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVCq-0000000067G-0M8v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvjeE/4z4cM8zPVRTxHvHV0QEvdAlTyIeZ8Mv1d+ZYUUaDtRv5o+gTSTYHgaHJ2tORFr+jLahSH6JpGT+dJG9BmJCZOom292mm9YCXzNXm+maM2hvEROKHB7zyPn/E/K5x+S8cKa8hWfqRUNOZDQn8VSPDpstHbj7IKpkor4zAPYAIN9LeS2z4f6PT0Bejhzx4RwM5x7nE0TxYclqdG/kTV+Yk9TAINQu8fjb8SQwFdUiPPSYO/AWAJXzG0JCQ7i4FgqWUqKh5CxVQdZ50gkODlUZBKDPEMo7CaRbaw1CcvCuTJPAsr+XbB+CFMSP9TNpPXZZMPZiWhj1cGswqZQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FW8q3gAeA6YqeY6JEo6iuIalJT6QhcV1WCPpcIYkE4=;
 b=xKSH7ya6Jh/CL3oYD1y2dylL4Q0Y1dslXOEeep+DiZnUMxDAV77S5Yr8u8Dpl8MOxMRIHQdtZZZly/tT/v47QKZcFVkgctxe4JK4UnEDl+Wo9GMG6M+4KJHdGxcgOpkCKzAiYis97dxIfyOQxM1wM5CduLV04vMbPTKmekrn5oajNNSWf1wrUKCnKbJ9fgb/35H/85DWuEnqTqdKy5kJz43gEeJQxEzuOzpueFLuluEEDYF/hgrl0E8DP+LhSnE34X2y/jaCE1PJSvESl4IjmDxG9kst2ig81cscUqW1roZ/teyccPfXirgx+ng4FM/9tImTErTm+D8zN159VGLURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FW8q3gAeA6YqeY6JEo6iuIalJT6QhcV1WCPpcIYkE4=;
 b=KVxYYXkYzg7UTQumM3eFzyJl0X49W34j3bNsBFw/WfevPQcGCRdvTS7l3o5vWgPsQwlKek+I+tQ5x4i0yRPn/4ge0pC11vS07eA7UqF0gBYfjkKQpK1mOTL9SlAV0YwfpwD2d/aR8Po+EJbj+Z22TcGyW4+4/HdtIo2VzYKKDQ3fd6RjkvtkxqWbYdtnHzzkC6HLbmQZoB4Mj46VbcGgnfbLDq7S3V9gVIOpDe+9ra0g90aJOye2b35hvEK3TfjFse57D9IuIalFLrBFqlxXd9wF2CKXP6SVq0mh1KOAXGw6fTcZdz7Y8Vd5TIUPb1M1PjsT0R9WYl0ScQIMnB2SSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7218.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 16:33:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:33:16 +0000
Date: Tue, 4 Mar 2025 11:33:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v3 3/3] hwmon: emc2305: Use
 devm_thermal_of_cooling_device_register
Message-ID: <Z8crKuVIF07oxsl+@lizhi-Precision-Tower-5810>
References: <20250304162136.1963384-1-florin.leotescu@oss.nxp.com>
 <20250304162136.1963384-4-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304162136.1963384-4-florin.leotescu@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: abbb3e57-2704-40da-038e-08dd5b3a43b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RO9Nj8vOpQQTQVkPjRFIXTkCIGLSE44ECM+3fqvYEznfML9v64bRp2ekrjVt?=
 =?us-ascii?Q?vmYiHKk3KbcR2HLVlRpwyjsClySJK9O59WzmYZBXW6xse2PNwfwd7K4lPU05?=
 =?us-ascii?Q?ZMQ7wJ8PqbvTgsfaJJTQpLCevYSSdNDl8gDzYbagipWgbmlpSEz80aiwKeQe?=
 =?us-ascii?Q?TW/N8Q9p+efO7OHQh8tZyR90+dnnOvBs62fIGCfvayQFG9JOovHZh5masuyA?=
 =?us-ascii?Q?9X1i9c2itcPnXKwLwHzzb8ptK+AFqJFiWbT03dBoZWxFmQpKPvaPxSAil2cN?=
 =?us-ascii?Q?pkwBT9Lehx5HxJvHmJHksbr7nRISuH1qORSxtKlRd4hqPbQnuDoaHSS5VMcf?=
 =?us-ascii?Q?GmG0/D5kKZCXzY9LgvRRkiXpYtaROlH0oHeL7Q7Ae/jy/hgRnn/IiltH2Vr/?=
 =?us-ascii?Q?pjiczt4E0Bt8waOWTX1gQehh8q1y6tm9lxRmkCRnMMfdYwaZizpVDQ6MBh8h?=
 =?us-ascii?Q?iTvj4v3BEpSWVzyoJhop6dUQZAGNR5vC5AWjumPiwNIBa8eUHliMnQqefOpQ?=
 =?us-ascii?Q?RFYgC5q5B8R7w8nTHjohcWxiyK6Jrb90gpv6FbyXnl7qUb8slk1bt1FpV+Lo?=
 =?us-ascii?Q?4+njzyDZpkxOhSH1f61IfH+wqGHWIb4NlvkM03vFa9xInlh2vYBRm+N1804K?=
 =?us-ascii?Q?TAdSy24hHBlR41oHJ9jlAAIKAB6vl1LdJkS5f0kmNqjC7b78XU4PriC1UGw/?=
 =?us-ascii?Q?raLXT/v8iLhMOxaYSh90mbFCIuocO17w9WIaCrGgJUDIfd0J7NR3PovDgAE+?=
 =?us-ascii?Q?swqxpxPDqvqB8U27gkbc11opuiv6icdULmw91ITfsRGLEfIF0HiPLKoTSuzu?=
 =?us-ascii?Q?Sq7M88HIzqt6ppyj/hT0pnJEO9k/HWO/b2feH173NYng9ZZDbinGcgZm1MDs?=
 =?us-ascii?Q?SGUHFcmr+K9zTxWwPhcuz3z9G4tBzGQZcCR2xNWp/PRPUnmC32wZBpZF3c+3?=
 =?us-ascii?Q?QWXdP8rjATuY9iNM6nnfFLOx0/LT49j1+LxJWmQzeSqirp+ejmjWtAxTgsTH?=
 =?us-ascii?Q?8rzbEd+MIAtSDEH7DhGTQwRdLaprPXdmr9G0deF+JXa7eFvPOewzmtQgyuxc?=
 =?us-ascii?Q?Y19cJ/e7D4PMp00H+C2r1KDKqlhE9tkrnvJsv1/t2/aQFLYwMhWCcexpauAB?=
 =?us-ascii?Q?gSku+U7+vEy5gWLDcdNkSp2ewVu9m393WMehawkNK+gqJ8GUBgCpkQ1g5PmO?=
 =?us-ascii?Q?128KoLkkWH43DKo13g9lY7HYlExBUGT0Y+SkxUcJ7LKXYqLbT6PhZ15bWMjE?=
 =?us-ascii?Q?ZteR/GoU5e3i9CBh0CgVEnWhGGEPUbAwneCINLlUaXU8+MiI+WSFKhZpm8hY?=
 =?us-ascii?Q?m1wnoxjzPncFYd1E/BiyV5PezQClg2p7wZua5u25y2Ps4qfFmEE3KdMl1PwV?=
 =?us-ascii?Q?mDuV/bA3Mw3ZZw0O61QeOlBn2KZ88axo+thhAV6cnGvzGFjDJ42CQ+N3UPFy?=
 =?us-ascii?Q?rGpUdGShppZpTTB7j/+4vrosnyTsTOrN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NSFhaMp2Iros/mVJ5I7E0VQSoq7Kkh7LAYsZUbihcMlEG5xh0yIGjPJHePuE?=
 =?us-ascii?Q?HZ8JVCsglBmOsiTuMNa+Aswg1jgmRVh5mdqjFu7wSIOYIuhH4trH34JSDP2U?=
 =?us-ascii?Q?7hRez1PwaZzEbxoyPYK7X58gte1FPUukT3Ku2rbpdC4DZTkkZAQQ0Jv0SvP5?=
 =?us-ascii?Q?u4A55JPiam6fKRAqpu3HhNJU3IWzj67+ZZPlrLZJg5KOMVoXu0UpJVZxU/Gt?=
 =?us-ascii?Q?zHIVTvNImLAnD+sW4qJniSsZZ8FBDBe1EMAsjYPxZvkuxHudl0hpoFWUe16A?=
 =?us-ascii?Q?o0Emk3ft6FmlYcU/Czc27vBWvtEXOOkeoBh6DOfJGn+kNVa1nh9ibyx9V5R7?=
 =?us-ascii?Q?TwLcwqj2ErNr689M7KiFfzH1ZSrlOVBYOXH6jV2JmXS5+SZTYIxylp2vHjgW?=
 =?us-ascii?Q?tUYk7s+z+hB72Q5KlbFycPoP2YsBEvCNoC9qeoX74AMi0tSZ16tmBeLC2Ie+?=
 =?us-ascii?Q?AuKvECEauXqyLLuMpxTeYxlcPXH9O1lZJvXUCqs1Vo7W8XgeDLDlEQNaGYA3?=
 =?us-ascii?Q?OMms1Ni7Er3cxSJ/LRCkLkzWF3QfgqwrwVIs0Xicx1NZtV+Nopt7XUBgw8eQ?=
 =?us-ascii?Q?J/n1ulcgZJqRAOPrK8gWIOJBg7QhDwiNrCJKZ22eYDfVHKnDfTdfeJ8RoSjK?=
 =?us-ascii?Q?jLyCT879F+ZYGDQHHagqfEVo3e7ZjteQi3nCJuiuVs9ISnIM34jtkGZHlhax?=
 =?us-ascii?Q?vMEVoOBOAtSmcKB3J8/Eb3W/XUE1l+6kji6KwVSdSnkQFpXLtytu7MFKcSVH?=
 =?us-ascii?Q?EAjmMVe4wBhM7hU/JAjZRH1E7i5XVaL3Pm+2U8XXBaowVj57wKVzBInzVAeN?=
 =?us-ascii?Q?x1MAAYrVqww60m65umqg9qMOiCvNfiLFTM4gGw5rvEziOcB67iUOV7rlY9qZ?=
 =?us-ascii?Q?+kJT+2o0W7DN3lg5jhWZ4Ms9+TG8QCf39UgbWqt/eVGCvZZZEQ/F0FKIqwrz?=
 =?us-ascii?Q?44AkOWndKpUuFJXC2Aixd9aCTGIGoaRQj5mQeFQKoABMxvcHEAKl8QlOCgNM?=
 =?us-ascii?Q?0AYen74mNcDizPCbMpCihIB2C+4ruSA/75czvPa3Dfkjl7G2+iGsNzONg03N?=
 =?us-ascii?Q?ooetlzfLujrzaVCAGOhEVuo3HhAA1LCnictyNTm5jcYS6qEGcOwItnM7mSEw?=
 =?us-ascii?Q?tMS+0jB/5almNdA8rMVv9BLgydnUkqngpXOnB9xHtn8C632BBVZuM5096eW+?=
 =?us-ascii?Q?YLENUeqHEdBLIy+Ob5tyu5YMmdUs0PK+bxDyIl1bMyJsQellPjTiqUQf9T53?=
 =?us-ascii?Q?QAnwk2ogAbFXD8LMKRbqQNagIjfo0dU7ookXBQvJFyIsRKJtkRTwonwKmBFO?=
 =?us-ascii?Q?jwZcF69p79ssXDX+9rK/HhZtvv5s97n6qZwBgR1fAfpj1yizujGLVX3vKlsD?=
 =?us-ascii?Q?vW0gAiYVvAqbv5nKt5NzqVX9sGFrfH41+9DtgL9YdcnRpy1/DiDUlzL5D/gA?=
 =?us-ascii?Q?LQvTgNwF8cXDEi/haRP9323O8k2S5e1YXvSbseeWe/m/DW15asTHA2OPguIb?=
 =?us-ascii?Q?pb/zzwB3cytTSgDvGx5uYIkX08EY0Smopi6608GscBPNKtaR2roMxkKIDy6R?=
 =?us-ascii?Q?LdwT1jBcuRKbv3wyCkg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbb3e57-2704-40da-038e-08dd5b3a43b9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:33:16.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XO5+a95aOourWYtB9Ef61iMJJplzSLTgpDq7xvSbcDXbFZNDqoy38RIWjdFEzw/ehvH4yhpbLMglOfQzUuTkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_163323_194223_1AF35AE0 
X-CRM114-Status: GOOD (  24.93  )
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

On Tue, Mar 04, 2025 at 06:21:36PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>
> This prepares emc2305 driver to use configuration from Device Tree nodes.
> Using devm_thermal_of_cooling_device_register also simplifies cleanup
> procedure, so we are able to remove the emc2305_unset_tz and emc2305_remove
> functions which are no longer used.

Kernel doc suggest use imperative mode:

Prepare the emc2305 driver to use configuration from Device Tree nodes.
Switch to devm_thermal_of_cooling_device_register to simplify the cleanup
procedure, allowing the removal of emc2305_unset_tz and emc2305_remove, which
are no longer needed.

nice cleanup

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  drivers/hwmon/emc2305.c | 28 +++-------------------------
>  1 file changed, 3 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index a236f27c75bc..5f3f06308826 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -112,8 +112,6 @@ static char *emc2305_fan_name[] = {
>  	"emc2305_fan5",
>  };
>
> -static void emc2305_unset_tz(struct device *dev);
> -
>  static int emc2305_get_max_channel(const struct emc2305_data *data)
>  {
>  	return data->pwm_num;
> @@ -293,8 +291,9 @@ static int emc2305_set_single_tz(struct device *dev, int idx)
>  	pwm = data->pwm_min[cdev_idx];
>
>  	data->cdev_data[cdev_idx].cdev =
> -		thermal_cooling_device_register(emc2305_fan_name[idx], data,
> -						&emc2305_cooling_ops);
> +		devm_thermal_of_cooling_device_register(dev, dev->of_node,
> +							emc2305_fan_name[idx], data,
> +							&emc2305_cooling_ops);
>
>  	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
>  		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
> @@ -337,21 +336,9 @@ static int emc2305_set_tz(struct device *dev)
>  	return 0;
>
>  thermal_cooling_device_register_fail:
> -	emc2305_unset_tz(dev);
>  	return ret;
>  }
>
> -static void emc2305_unset_tz(struct device *dev)
> -{
> -	struct emc2305_data *data = dev_get_drvdata(dev);
> -	int i;
> -
> -	/* Unregister cooling device. */
> -	for (i = 0; i < EMC2305_PWM_MAX; i++)
> -		if (data->cdev_data[i].cdev)
> -			thermal_cooling_device_unregister(data->cdev_data[i].cdev);
> -}
> -
>  static umode_t
>  emc2305_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr, int channel)
>  {
> @@ -599,14 +586,6 @@ static int emc2305_probe(struct i2c_client *client)
>  	return 0;
>  }
>
> -static void emc2305_remove(struct i2c_client *client)
> -{
> -	struct device *dev = &client->dev;
> -
> -	if (IS_REACHABLE(CONFIG_THERMAL))
> -		emc2305_unset_tz(dev);
> -}
> -
>  static const struct of_device_id of_emc2305_match_table[] = {
>  	{ .compatible = "microchip,emc2301", },
>  	{ .compatible = "microchip,emc2302", },
> @@ -622,7 +601,6 @@ static struct i2c_driver emc2305_driver = {
>  		.of_match_table = of_emc2305_match_table,
>  	},
>  	.probe = emc2305_probe,
> -	.remove	  = emc2305_remove,
>  	.id_table = emc2305_ids,
>  };
>
> --
> 2.34.1
>

