Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D29CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9vfcZBRKtQRpQuYrUPdfeJs4pzREIHpGS3gzjBiKfQ=; b=t4XNzvUIX45S+yX4ksPJAQfXyL
	2nJijamOxUj+V9AszAbuEZbW7ngQuOWc6hPSPZE55AXXD4rodCSehgOQVnRvGTocX8u7hyolsT/0m
	nn0FCOqAtOW3JPTtgJOUHhCDCdwvwUBvi/JpuCxRrnb8zgK5XRdU2cZ5Iph6nDrJdhNurJJlt4MZU
	PIKzgWSYGo9Zs2XoHUbHKkZEuNSCVJn+3wAI2TP8R9UrCqSyTzJq+BX86QlKhABfw1uFpBVpceG/9
	7fORJgG7duq1ZgynfcmsfyZHAVwFCrh62KOOujcUKU9PbsJoGnkmOt9NhXCrF6xHdXAdwUbyxvieP
	PTwc01wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1G9-00000007CIg-451E;
	Wed, 30 Sep 2026 20:50:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1G8-00000007CIZ-3q69
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 20:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I9vfcZBRKtQRpQuYrUPdfeJs4pzREIHpGS3gzjBiKfQ=; b=kbP5YmaoUIRLiLNryIH6SBN6Sy
	hstiAw5AbiOhTO7AXWUBQmWwAzlckCvBIhVqzynRZRodFRToC0BLNeJzJp31hV0Vc2Ip5iBIh9eAz
	3YvzLlzEimrj/2xdwBeVXGOVnDUbCJz6prCJHudYLvJ13QYqvmshZ2IwhBW7F6rMjq+TZJakzvuCt
	oAxOBT+xcUSUltK7DCIb15PmoMf29zC6XFKB9s8vbclWjD3EBn7lA3ogzdT+YAFqnMf/NuWaSEX+Y
	3f3pqsuyW/GoyB2jVhsyzTbVvju9H3oyBsG3ID+EhvJa3hiPOgJvaK3hiBt91K4izjZjYf8JMhnbk
	Wz7L4Tyg==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC1G4-00000004Icj-0Mi4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TppEca7Du3QgsGN1XY/NRAHhdKfxrh0ITP2eTQNfRMZCFkLBY017HXSAe5jHuodYgu8AGXL48L6g+EgtTd2zlP1T4UroVfWl9WtFoSs2A8BaH++7Nbc/WMzXR8mpOqSMA8N10uEobt/CbutaylTzHfphPLX6YKRFMSoRrSEamApUbbt/TStTBGQCzlaPuXe2KtdZtj8Eyv0yVNcJ5JznyYyulFhC3iyl0Fg6cSG4VBnZ4zD1ByCAxOfQx618Fx8rcCw2eOZ13Lo4z2vqgbLhFeMcOSdS4881dE5FNTrmTt9EFpoAmwpEN06+DywiRcAeFInIYkp3LAgyOO6oIFr/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9vfcZBRKtQRpQuYrUPdfeJs4pzREIHpGS3gzjBiKfQ=;
 b=zWmul02nPQtuMQvFFxaDqFSs44WQuhDPIIAh8t+Z5Z9hqCs5yrSftteVTpiSI5cTNC5N0AIaCy7tqmKbyNR1d2VLzDWILlbiTvCdq5vjzNoeiTrpScBL2QaFdPr8mSBXgW76+c1v/ER2ydl84XwEuNuAcNEvYVkiHR5OPaW2SIGqWOtfSay2gTI7UA64u6EiC02W5K/KBURlmTpij/2f7DDpElNCJmzSyWZ81ldfzX+nNSgHNvjl7HjWQeZkpFIpNKyACYBg3p2WmRC6Xo/U97O2k1AESgdX8nhwF1wgyBstdEdu4b6ZQwMlOkyM9vxD3cO95FfNT2zhFlAgrPJAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9vfcZBRKtQRpQuYrUPdfeJs4pzREIHpGS3gzjBiKfQ=;
 b=XcB+wcP9rDJaKKJvQaQJl+EmkQGtuOd5PxaClWLqquFYRXj09RTstbHuhKfe+4wu2yzMmYnzn+Es29OGZy0fGfyXrYwPto3KhoMn7NQjnsKnFUXPv5eMMF6PZg+26/KdyqdAAHV99/OFA8YXhRKBETF1eogmbgWs7JFPgJiJHK4ZoA+MyzHu3wnDuD1F3jO/HsYXzX0ZOvtiHawVuBYaGoDA+6SnVewUrRr7WT1zDtvf4q97fUhz3oda8DSQbTStN89POki5zKdko6kLbQn78lT2xFbyGhCdNS49+TZG261Uy4+B6kU9zuhLgXPOn6DRkxftUUpwvGMjHxmx0BrAYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR2PR04MB737718.eurprd04.prod.outlook.com (2603:10a6:2c8:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 20:50:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 20:50:26 +0000
Date: Wed, 30 Sep 2026 16:50:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: Re: [PATCH v24 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Message-ID: <ar12B9MDu4BfOrDP@lizhi-Precision-Tower-5810>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
X-ClientProxiedBy: PH0PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:5::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR2PR04MB737718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d52a79e-29de-4c7d-5d5c-08df1f347499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|7416014|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HVBuEtDCNfbCgFFM3gLrDl3h95aFIwBfw9a25TOIFy3n7qsrT5LlCle5fxKslw6GF8o9ZIM6HL6DmP03YR3ImFQ3gZD1OALnP595PsoCUzt5NE6sqdAWx10Pb6iEVzB9WHaVkV4Vy3b6O35nl80mla82SFPACs8Y8JkkJOU/D3Tw2uvE9HeUjbVjrHPo4BOCPcb52w9DyVA1tMzg2mCBkGt5i+LVwbQjZAT4Q0Lnz5T41CWg207cKVTQrwhoXifkDWcA64tGfAdmPfKTldlozqaOL3tBnSgahooC39QlTxDKvY/s+uJZuDXWbLnTUdh7DV8+iG59emqw+JCxnldf2Q8bPDBz6fNJfEH6PHyzDWFo0X7MaZdO3V1AhzqlY63vZH0KjUnygaIcHFiNYqS9iYiz4FofB/iASrHU4+2N1+C7tqmdxBdXLn2y1SSOYfzlXh3a+w1Ey5rlL6e8TkzVoAUyrgfn/ZQEIiob1p40wd+kph+Vfw+4DaxRZZ+vFbO9rt698ChXUdRD2NOqn7aVn2NswbBm2puLAZZXFxoJdHsWDKnhs+y3DEYhPkbRq45aulb0T0VN1XLIp4Wb7e1cmBL/v0OA+6VH68MQRx+M4Wy8OzvC8fJqE7PUw4+Se1zWx1zC0lbHuo9JC8vqrS09+tl3Ki+U5Dyd37Juch4tp6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(7416014)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mPPtQq66kJa47i1A4/RaDyRdxcYAbq53T1re8TpoI3YnB9gAgl04x7T2xW6h?=
 =?us-ascii?Q?5iRqvGl4y3jY06ERQp6eVHCLvXqe6MTBT2oMfJ5peWpbMvUF1VzrbeMbWrkY?=
 =?us-ascii?Q?KTb/1Uca90X5SCJogQrUvjWq7+KwJUwnOqYMA9xQn/vb9+RjpMLvhv8wXbXd?=
 =?us-ascii?Q?DgnI1Tj6AYpctozC+dx74cy+YsYjm378sm262aJ3OsLWxqeK/V2UfuotB5qv?=
 =?us-ascii?Q?bFLlhH9zGKquAkZqgH73e11NIZ9Wm7h4WndKd+WrpcF6xc5DNHXu984wzc81?=
 =?us-ascii?Q?KfzVVjHo+NVA58vGud84NOTiiurrtirIfPHxCW3kdjJAnK6RaVLfD7UoLEwv?=
 =?us-ascii?Q?jBKWqex6rRh6r9T0IYlc7k131XN+IK0QLbzZhGgo4z03sckGcB1VN98YKrok?=
 =?us-ascii?Q?oYlGttisc/72amnijnVYGg6Bcl6sOnYfQgJoJev3DW848b4q8IRGw1IADHuu?=
 =?us-ascii?Q?sH3pRHpJn2EEgFpxDtPN227pdnssHd8kMo5Zvo+LGWOV/TF5wee/mrkSJp9R?=
 =?us-ascii?Q?BwZ0W6Fq2NGLLT/N4HiLgo2SGRgPCov7CSeyXaQQj6Y1rFTqn0pedQtapCk0?=
 =?us-ascii?Q?HOSw1KIYN2q9pa7fz8vkzdYR6YARmVuHYltZFHeNxu6rhPUhxHS28PXXlE1C?=
 =?us-ascii?Q?rNHxt9WLtuqridytjL1j32XKux3gxhHGYblAHvXfO2HJkY5MCBmJGq4+NMuM?=
 =?us-ascii?Q?BuQArehlMd7N+Sgqw2Si7GF0crCEEsP5DY4/+M4HhxI0MAUtVv2X0T9kXsh5?=
 =?us-ascii?Q?5aR8JGyfNfl3+fy1hs/p4PbilURz6z5CUp/8MdymGA73tqZa/LxQ29o7Kkcq?=
 =?us-ascii?Q?MFLbxuhLo/SYfJof15NYAfxhc54Z/DbOFj4Gcax0RLs7bRxmQni6mQKhSyBB?=
 =?us-ascii?Q?1Iwk88nqnCJ+cXU10LbirdJTH6gC3MYK1/zAnRCX1vf/vdMYcO7rsMrmblyl?=
 =?us-ascii?Q?xe1x4AFf6xF44LrFECECvey2/kpZoPe9WIvnaBrN3egk2w3VljngzET2r66C?=
 =?us-ascii?Q?GhfYMPZQnEXsCfpaYTEkWhowYjvB2AEVzHQDUhcWO+HL0s3AwP5+9mpcO/N2?=
 =?us-ascii?Q?n+Afwa9y5kGuCNAA9dM6a95PhF+PazqDvPvDbBEv1rjjUp+F/3mLsXOu00hu?=
 =?us-ascii?Q?O9jNiau2TaYS5aG9g8GxRYCrMO0/Tg0qncxvWr6oYssErpb5mS8asS/jGAR9?=
 =?us-ascii?Q?Osskhc9rwSC0AjQ4ntqZeyhOc0Zq9l9H2GJbgir3DnceqxoEEnWzvWJbHwv5?=
 =?us-ascii?Q?Y+iCdwdP7Df5IE6EZr/H1mGJcDpfaKdyTzbvRCIedPw1RlR+bVnHVGk59g92?=
 =?us-ascii?Q?9ltEScnYZEL4LsWp7uGQg8uO4QTkhpuxKZlU8eVPaTn5jzX4UKQlkJp0LNYh?=
 =?us-ascii?Q?xcyCmzuogSRaKUJ6GKXTvHDa5nd5IH5hS7t0KwPZwBR995vY5ok2NEKL5Gjx?=
 =?us-ascii?Q?KtuqFn8XrD5NJaDsCaA07RUDOFEykVjVTADj1CSt8IM8unSqk/jGB+QlT3c3?=
 =?us-ascii?Q?kXjiH4VHDjVZ1paEbc4nxHdTUa1buxMM8mkeGU9hzzwqhmZqTZi3sdpMBuPw?=
 =?us-ascii?Q?A6YZEb55Su5s/OQ24JCqa5Qe5UJMZVnC/kTL9lgLOw226q81Uch5P58aI4Sm?=
 =?us-ascii?Q?WhqGBOVmwy1KoUGMTpeu/zrlWUoEWT5tkJyPoaNsghZH1XJFBuvwuByOnBuw?=
 =?us-ascii?Q?IFRj9qIbmh3gVg+zA4GB/bxSXmjXJEN4bVrpiwy6ZCqXvYuJaDNBi3GGEhJB?=
 =?us-ascii?Q?rsu/vd2jkTEQhj0Jyi3NZ9nMBFpNIU45DPfP0WbyYKTLYlskW42H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d52a79e-29de-4c7d-5d5c-08df1f347499
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:50:26.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlPG5AnsVZ4luzC6YgeV3hvVpdvzR3TvU/CuQwGGciO60n58Y45al7JIX5z8pfzvHRVQj2UMWYaAonMwXbS3Al1r6lMO1NDchPqnxyKfxhaNiU1zBQOXg71oovYUnHSL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB737718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_215033_403229_1918F3BD 
X-CRM114-Status: GOOD (  19.43  )
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

On Thu, Jul 23, 2026 at 07:09:07PM +0200, Bartosz Golaszewski wrote:
> There's no reason for the instances of this struct to be modifiable.
> Constify the pointer in struct dma_async_tx_descriptor and all drivers
> currently using it.
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ti/k3-udma.c        | 2 +-
>  drivers/dma/xilinx/xilinx_dma.c | 2 +-
>  include/linux/dmaengine.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
>  	return 0;
>  }
>
> -static struct dma_descriptor_metadata_ops metadata_ops = {
> +static const struct dma_descriptor_metadata_ops metadata_ops = {
>  	.attach = udma_attach_metadata,
>  	.get_ptr = udma_get_metadata_ptr,
>  	.set_len = udma_set_metadata_len,
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>  	return seg->hw.app;
>  }
>
> -static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
> +static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
>  	.get_ptr = xilinx_dma_get_metadata_ptr,
>  };
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
>  	void *callback_param;
>  	struct dmaengine_unmap_data *unmap;
>  	enum dma_desc_metadata_mode desc_metadata_mode;
> -	struct dma_descriptor_metadata_ops *metadata_ops;
> +	const struct dma_descriptor_metadata_ops *metadata_ops;
>  #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
>  	struct dma_async_tx_descriptor *next;
>  	struct dma_async_tx_descriptor *parent;
>
> --
> 2.47.3
>

