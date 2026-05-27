Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D8BCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mcKQrxcFfi15uuUNbZ/u4DCMN1Yr7VUlXj81ENyrxo=; b=D0kcdfmxJyl43PeYjg7GNUlIgw
	/JtgtOXKHXg5r5WfwgkVNPY5iHmCSkhN3IjRZQkId2Aj3aqnNhdGa5kp9wsbLSeHDtqN3VyAl7O8w
	P117tf+ODt2o+Z+/psiuLW5mGN4RGC7yr1ER/ZD7B9j5qexcBvlgXWUPgIkGPaGLfFRMP7/QkWoi6
	kgtAWFSFQf5huyVy9ypPLvUZxtNcp75IIc+xa0C0Njj7A6WdJrkANapqDEGI+L7zrcX8TkhcGNQyh
	4h+AKvW0xYRbUp69HRjrHfKuaz8+EaCWr0pYEqrGOCHJYXgo0JbHyuxAczEmXWMRFi9vLipX5SXXZ
	Ne7Kmk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7qP-00000003PJd-0tCd;
	Wed, 27 May 2026 06:34:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7qN-00000003PJV-3Uja
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 06:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5mcKQrxcFfi15uuUNbZ/u4DCMN1Yr7VUlXj81ENyrxo=; b=h49Q15sKNHDykznklcW1Mn3NxY
	34VhqCBv+F2mYAd7BrPEQhiL0KivCb9nLkrJEJv+GigIDVJ5/DbFClCRgpCKYuGCq05Gz0HcEJxCr
	Zzb8YbwbEz3hssZENq/PJJtweGCYGsfZSwc4RZxrjNnbApdvEAKoxQY1fcVoUo6iCUjc8hsN2DNej
	bVY6ZJlh54Sc7v9g0LM0OwMZVkz/02BGNvQm4wiO9BnW55ZDxmz4v9pgdais97reMEAw3VcX7R+rZ
	DOYaZU/XIqLfjoiPkcNT0FZexfEieZ4qWwlD/ZbpBBBGbyief5A/B0YC5WJQB2PQcQi+Ohh9u6A8Y
	rOOjsXyw==;
Received: from mail-swedencentralazon11013025.outbound.protection.outlook.com ([52.101.83.25] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7qI-0000000D51H-30Q9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 06:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsQkHUJx1PrqhOUijkjwsLn6iT0eBgWRh9o0iSaQuLP6KKk4YpoOnHOCUGyXFR86Vx1SdA13/T3TKL8TigvyvmYdikSMbRTxDTjL3w6HzomqDEZS5/5YY2Q+u/FE0RDmiVbQ/TUTrOZtjlOn/SXLqVdmCpn/0q4GUFuRIUi0gtl5t0jF9ZMllbx4ntxy5iielhB/u8eWBeexA/v2RM1Rrqh6td84o2Z8k5nbMjjEqB9tPzYj4pMq8KY3Dg8HI8bEz8QWExm1AW0QYzBCPoPSMkHsODIAg2T7MvYWNtVc+T3yK/traFm19ksfz9CsrVMqjhoVVzLcXCODYb/Dfj3dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mcKQrxcFfi15uuUNbZ/u4DCMN1Yr7VUlXj81ENyrxo=;
 b=LSWJf2AeuL9oHurnfz+QLpmIXOHpw9YPip6KI0bFjq95Q/l3qrDn7cSbNjvRskDzunqB7ZX6xDJc1bVek3JEHOgSPaxIYDLidUOBH9XCYZMap4hPxQdR4iDCbi5eX47vQpmPvwQvnYuQCQEOiSWpa2PBA6XUJ5lyLNAMjbv2I31uwjQgIhjbL4F4CHHfcPppnKfibEp7+HbIlhGUjENWHzuLfgqq6SPGLc9ZnaLDgDo7ArDo1ywtYSn0lz516xB2BqhO9AgY3MvTkzdE7sBH6sve9g2DuBkjZZ/os5vxpVkknKBMSp2AvxmAmMQ7FohyV2TUZ5tUkU7mFriZ0VWn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mcKQrxcFfi15uuUNbZ/u4DCMN1Yr7VUlXj81ENyrxo=;
 b=Kz1Yr+1YlCpaIfedyR8EklEj/NsJBXpLna9ZNJ9uDD+4sUDL/4uEHPlibe1a+FbFCprdYJ4nS1l6x8XbPU6REJYflvpKAbW4R0W6uwxYtYEHkoMuf9OwJLyosdo7VaYweBf3XPoVAvcqYhxGyAD7AYwborbBQ7ILyqciZXUYeZFJr843KRrnRafFk9I+SSWzvO4KfOn9d43p7lwVVpm19DQ70X+ydZd+DgR4jd4WT49vXNAgODaWaTgajk2iD/peihp1BOZang/Lbe9tUWly4wheex7ZdXrWqrvYwh93/98yC331ihLohT9t4NyySexi9VuDPTrNT9panNW5s8S/rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB11076.eurprd04.prod.outlook.com (2603:10a6:800:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 06:34:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Wed, 27 May 2026
 06:34:07 +0000
Date: Wed, 27 May 2026 14:33:05 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <25fqcu6itk47tvm4qto7zw2r4cno7kryxi7a6lo6ddbxwzbakx@nj3ytoy44ynl>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
 <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
X-ClientProxiedBy: AS4P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB11076:EE_
X-MS-Office365-Filtering-Correlation-Id: 7822d383-69ca-48a1-244c-08debbb9f429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|52116014|38350700014|56012099006|18002099003|22082099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: LtLI1H+kDBUSAcsPbhEO66ZJb+dE/ezh2JT1VQEyyq5S3yjos8NzbeSqvKgBPtl5MFnGtPg0XGMUR0HH0envPUSqrb90+YdCekkDS9xbLZs/QtMmmx7En7v+BePIOAEu6fyMK8bw1fNyg/QTj+7Z3vKAREvGZ+dn9/LLIUM/SDEeOhA/hUlemez/yb7Zxm05hhTk6A3rCpWcJse/Y7ZYGnw3lZ9JK7AL/oY3yU9oCfCx/xzlXn4iP3TnjGt9MR+6k0DiHZIfHNDIPFb2b02E0Owg0KhhX1g8eJ0uXGZKBkNwD3r5GWmtliJDx4yV5acDlqZWWXpUepRT8u5yt2MzdQpjwQ94NsYXAo1GGKy29/oH7NbIkFTQ/EhVAejWMNZNrwxJAdJNNL8yJP7zL8XhqI0P5W29+MbgcAEUFIFMOMxqoeGDqqGD9u1JNyZWmko2+eijDORLOI0jW04b3ERkMqpqqz2Igs5J0Gy9YHUJ37WyYphuFWII+DElEUdLUUq73H3VNyBh5D7pSy6exoQo+LR8I72S078062CMethgiPIcyFwX6I5GDenUVzOhWfd4sW2tJohgREeQwkmXK6xWlvCvUyV+dheqrJ+HJSKZxfWb0HZarupY+eN9RmPJ0KkbcfEocSbVGp/FyvCwMM4/E4WDhTRsX6GbzrhjAg0s5G9eArgWpH+4zxLO8gOYWCP4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3r6PEVxWuFIgkZG1RJmOb4HrcwWqmcR4P55BByekOyEzK+C36mx3/cnCYUcY?=
 =?us-ascii?Q?SNR1flQ2eIn9rVW77e/sk0k4fdeJXud3Dquv5GixwJTgixvkF+Pp6F1cRh03?=
 =?us-ascii?Q?51g1r6mrK8IeuyiLvCCcNXXZsUPuH8xPDAldAN7xJ7vvCwSbV4lHDmE8ICkO?=
 =?us-ascii?Q?wOxHur7YVQQjO3kGuYxpKIWOA/S3EFJrTJUdSS5YHN51oTnBmZBFBEhSQmvp?=
 =?us-ascii?Q?gk8GO6do5grHOnfFsmLEEtZMMY0j777X4f889PBQGwYC4eDG/lgBH7wySzOH?=
 =?us-ascii?Q?Fti+gJUtz4L6kChnJzOJLxrKso5xKkDUX94iRMsQUcJKM8+M9Vkd6L1avjID?=
 =?us-ascii?Q?6wK4CTtr+hbudDe2q4PMFF6l13XBTMyaIfoiIQfF8sKI3nxLr87CwTQ5Fp9w?=
 =?us-ascii?Q?NldHpWSvLxs2Wd2AnAoiJppHw8NnOIW69nPMLprew/s6e/Jf6nIKq6XPazBy?=
 =?us-ascii?Q?xj7uTxO8ds5f6XnyJbhQMY8CaCUgyCdjBXMTGTauhW1+zCGjUYTdUv1VSLAn?=
 =?us-ascii?Q?GGLSyVBuAhTTOJxCN7DzNd7EEnJuRyysWNKtwPkK5cwotXROBdzbraDxSe4I?=
 =?us-ascii?Q?twO9WbtaB4YFXlVTZsO5wwj2jlPqJzq533+8bjeerQJYZtiYw9tdLjuUyMDh?=
 =?us-ascii?Q?WE8E1O6lfUO/jZwI4k2/B6wtMumQiQrVtg1Fx89DdEjms4QMjtXrSrC/tAu6?=
 =?us-ascii?Q?YRbYXFpb+HGwX99zdk+Wn6vZFnDWkhvm5pAw8KS4+rqQ3eIeJBRQsXeisAmT?=
 =?us-ascii?Q?48xUIBXe1aE7G8DOvsjCM97q8lHH10Qu3Ze+wN7U3J0MzMgYcFD6p8iWE72T?=
 =?us-ascii?Q?o1kRwwqxvHsfpgQk/gMr7oGEOkE/qCwodZnCHIdZaGmxorSoAWNcSUK6KYS0?=
 =?us-ascii?Q?Wq5Nwzp1SKr+fDMePLK7aL1t+LotcKnZCM/gHMWweCtVrcrFi+MI6T+MMY9K?=
 =?us-ascii?Q?7jBf5u9WYHh6ah5ZIO2gdMqen3A3FDYCRgR8uN0lGW6l5IcDUlHWS997HNXg?=
 =?us-ascii?Q?S0SXzB4e32fvdisl/VuKLs53A6zG7VjhHPLPhDauAZpwVkg2tTM/0s+qbWTy?=
 =?us-ascii?Q?FUsZz3aBfNiKKsApk2W86Ukuc1HLVjCIqWmi3hICFRLNySiICFeC/SSeF3xv?=
 =?us-ascii?Q?VL6mVtYu6AC5+D6/g9vzkCisQUhWU8J46VDRbAzcfIirmtSiA18ckky62SgQ?=
 =?us-ascii?Q?OFJYD5Qjzg6vgKYK3AG/UvH4CQXkxsl9/qqlq0IVy8WWD6WkSWbTWhYiJPad?=
 =?us-ascii?Q?xglSzJAupfrb0VGHX3wnFmBGicQ4u4vlEnycutDVNWTgG8GU7EPbS4gscgMv?=
 =?us-ascii?Q?CSoTWmIdvd8sYnJgu0uzvCKKZ9VznuGb9AtQfKvN9FWu+rbTfml6pd9kyqZ6?=
 =?us-ascii?Q?pphIy9/VqLAgMi+76J96r4x/aPHV9jp7Q+sCVWjAvJmEXyEAdGS/irVcvkGS?=
 =?us-ascii?Q?nkAYWFhTZWRU07hQ6ge/9SJjJcV11OTUHAryn2sQW3VSqSmJYFCXMc6Drcdx?=
 =?us-ascii?Q?yp6XVnd+PQqGmITnWPJvuT+vcBRK2WHYc6nDpqVErVN8fHbhmDKqUrQDoNGH?=
 =?us-ascii?Q?DsxToesNO8CMn7HQXH+AG/99utzO+yNGAC54i5j7KXyBIB++7egWu/FzhHJ9?=
 =?us-ascii?Q?14EdHSab95l0M3IjWngJpc7KNVOg4ZnFHLE4EM8uRACzZb9pFTSHUmcv3Tr+?=
 =?us-ascii?Q?xXKypAzISvQ2uRGNRVoTNb6r98rp/iUvVPnlwH4gMCbk9FhCnXAoATC9Lr7Q?=
 =?us-ascii?Q?6kFYDMQQeA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7822d383-69ca-48a1-244c-08debbb9f429
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 06:34:07.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45XgOLsfKthuOiJ0ngSbcLcN6V05QcDJRCLwT1kEpse5hABcUwwxjDI1FGKBi73RLcqr9mFYsp3mEXlzaZTskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_073415_772771_4121D6CB 
X-CRM114-Status: GOOD (  17.56  )
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

On Tue, May 19, 2026 at 10:54:58AM +0200, Franz Schnyder wrote:
> Hi Xu
> 
> On Tue, May 12, 2026 at 05:53:57PM +0800, Xu Yang wrote:
> > 
> > OK. I mean, does dwc3_imx8mp_probe() still succeed after the kernel dumps
> > at the end?
> Ah yes, afterwards it still succeeds.
> 
> > 
> > OK. More debug information will be helpful.
> > 
> 
> I've attached the logs below with and without the commit. looking at 
> what happens before the warning I think the problem is that after probe
> deferral the depopulate path races with the device link state changes 
> from the fw_devlink cycle fixup.
> 
> One important thing to mention is, that we build dwc3 and typec as modules.
> If I build them as built-in I can't reproduce the kernel warning so far. 

Thank your for the information.

It's indeed an important finding. I can reproduce the issue when I build the
driver as modules.

But I guess it's a case that the driver core doesn't handle well. I will
seek help from the driver-core community to see how to improve it.

https://lore.kernel.org/driver-core/DU2PR04MB8822AF9D63FDC335D80DABC08C082@DU2PR04MB8822.eurprd04.prod.outlook.com/T/#u

Thanks,
Xu Yang

