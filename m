Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE3CC282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Th479rg4/p6lYI0fcfsZCI9pjnoJmWZYrz3pDfs2iEA=; b=KomaG2busBQ6XQx3MQ0TvO+LZu
	hRUxJAQ4nlaOOypjiVkQD/+ZrtHNA6MdonZsNbRaaII0lfdgcHF5KiXCoO1xBpAfOBUkLrxgTLrz+
	B0YGBVXJCLc5BUw1zzbUXUhXOTy7OdXo4on0PYRop0n7jFXt2ivcTrCLDbBBtmEH4vnY0dFXUWKY+
	5cyO1j4K2peiIRAV3i+/TvdBoXz6/+f0Hyen/5U/SXw/dQCRR6B9VjMuxTlnQulZdFkrV1egeUBGE
	nofAUr47y8pb1d0togablanMRgwuS8bzYsnUe8i0T1VpOhdhFh5Lj/bRIjS2FOwv6Rad+S4cmFy6Z
	0x38RALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWJw-00000005gs0-2ziU;
	Tue, 04 Mar 2025 17:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUBU-00000005D7E-0a99
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 15:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Th479rg4/p6lYI0fcfsZCI9pjnoJmWZYrz3pDfs2iEA=; b=PIcPcSlrHq0sopZqBirAe5sBYF
	Eef6uyG52ESG33J892FsxEry2Z2SXLQ//xZi+QC3yCm5imfzIiKVaStmSPtj+VsAv1rICM0gI5Cv/
	l4IGGq9dGXg+MThgKL7zL8oZXzQkDfXQNfbpra2yiudvzboFMs6k8rnS146FEe8qNZCD2NX27M7Ah
	7ZnRQncKk/RSZ4pJ5Xf6FL/LNuM5lGIV6NNtkFsrBSuQZDSD1tLUuW9XlhaKwtv+h+Hkkku/Ofpgr
	dyPOKJEKVNe30ajV3sJSsnHmCd6+A7fvg0OhR/xVCRYbpGQqdjPB5eJsS7cQlgEpkR3X2ggaPVsu1
	fLl2p+cg==;
Received: from mail-dbaeur03on20602.outbound.protection.outlook.com ([2a01:111:f403:260d::602] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUBR-0000000046c-0HlS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyaYLqhmCGgwObSX0U/qDEs/bGVT7lQmnwjLYG58+dugMi0/KZluLLmrL7+j8M8axaUHXKBhgnRg32c1rCHG8/h1d2WVLX6T6ZaZoLyJ7aBHSt69JaloQGvaAIVY+stgznEd3rVXtkmbzrin8AP+69PFKsAluxbTiR6MNRMhVogrspaCOrfbRnIGJcNyCk8TZyrvTG3s8iqyZpAHJGZFsxIbBwWllHmrkvzTd4XqfsDtXFVJQF+pzlPp2bba2rrnNboWZz15X6UAzR7fP/HG2kw5i/fn1kuTgHkBu7gnEO/Y9anDcBCycFX27fhogwfupfh/jMGUIWhQ82uqvCj8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th479rg4/p6lYI0fcfsZCI9pjnoJmWZYrz3pDfs2iEA=;
 b=o//09TIBbf8J9KrUakc0PYx4mgxUIZI0EEFAMyfyiUOnjCVDlQWZc+TfELtY6wncPGgv3me9OmAFTAfaeq6Eefr1c4y6whxnOSGGOU+TBvxN3+nKXlEDHsq+THX5WwPU209HxUDjJxjFyosWrInrxQxNPZ0At7LxlO8KHaBxva+cfi5funxPu4iGV96GOEEa3yz5pbwWNkLvh9yuoV2rEDSfckj5jOqfxq2WuwtkpoK1ffI+Eoqlqsr153JqDVCGGQXJ4gUlyim7ifpuQolMidjI52J/xMLe7PpHiU6XWn+gUTgW411dhyWuIWCa1yVU4lMfGA5fTh0+WrMpXLGEwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th479rg4/p6lYI0fcfsZCI9pjnoJmWZYrz3pDfs2iEA=;
 b=VT/iVaE9NFvc/xxc6/xZ5dumHBMnEfz8CETdmQqO7i64ijVZAg+9NRxnFdtQ2BI7HwEiMWL9zO4L1odcTzYwhfItWgkbAdnLIOJwgF6MLzzHieJ3DJGJzQp2SBxBJ9rftJw2n70pcdAeDP7cAvo6fuPWpySnAcHnqqXe+l2TYpsWewSj8AmhFmv7vicQRwlO/9By6rEzXS+NZ4h+tL8Ze7Zg+n6cfiOD0Uo60IuiOLgyQLU2NZmVt9d5mTMHJO2cVMwZ+CQip4eIPsRX/Xi3vCWUSh5MdqgTRnFDNCXaQrA4RUj81TrnKcz0jkzp4NZpJjVcsaRDjXI242CoJ+Zk2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 15:27:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Tue, 4 Mar 2025
 15:27:44 +0000
Date: Tue, 4 Mar 2025 10:27:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com
Subject: Re: [PATCH v2 4/4] arm64: dts: freescale: Add minimal dts support
 for imx943 evk
Message-ID: <Z8cb6MhDrbJvBI3h@lizhi-Precision-Tower-5810>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-5-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304093127.1954549-5-ping.bai@nxp.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 56437722-1c1d-4eb0-772f-08dd5b311c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PdkppnJAXAo5yj243XT/qb+meuzfK28pRzVzNa4703bFW5/XZllX3ZwkUqms?=
 =?us-ascii?Q?VKTt24G7FbBOpM+u+qfhN//EzMFI/IuKGypAEsGnzW381+jwGbwqSxdv7Jod?=
 =?us-ascii?Q?Dk8IbXFey6sp18YMsLLGWChqzToYYhNktQJ/f30qmDm4J2vD5fmIgcF5Yw+5?=
 =?us-ascii?Q?w2bsIy0b+EmLnvUMHwQdc/Gwv4zy/WsDTEOBwN2sSZEBwpOWg0FT1PrmTyqv?=
 =?us-ascii?Q?KjF1UdgSniqIjKZGqt9KOvsoHVLNA3f4yE4YtQahk1wr89dXuTG9B3JfuLuU?=
 =?us-ascii?Q?BhcXV+HIzZSxlO6gkFXyKO8F3WQl2fQhV671XySZ18zZLcM7NVX8+PDoJ7fW?=
 =?us-ascii?Q?Ch6/05RrjobIrne6JSLKIjO3YduDtQ8CojgHiR5GcWLie0Z4YuZk1DzPYWet?=
 =?us-ascii?Q?JE5ZzRWzDRQhXxMtBgUWSwAi/Qd5x1Z+t+6wDqUv/2f1PMnHE7FJ6WkPD1L7?=
 =?us-ascii?Q?bpnz7LpA/RXzwcFJJE+iB8h0nZO3iGR4zXrlUwS7h/C4P5nkIhtdY3AadYDb?=
 =?us-ascii?Q?66ETHY6Ym7G5WtcM8zafokvx/+BcOgvJRJZcdagdkQiTzsUADMQrf/JfW+p8?=
 =?us-ascii?Q?CwcZ8IZMibqeMQqn3K/ap/wS6HKM7GipgCwSlZZvrVisyh3/u91wqoU78wrZ?=
 =?us-ascii?Q?iDo7D7nmImR7o03tiyL0VS17U9fZBl0GYQtAy/SS85Vs/FEHrjJ6Fi/aXSCE?=
 =?us-ascii?Q?0fgrc0BlDEI2wHiFrpG7CSPiQqx/S019Nyc40dshkzn/WnHfr1Uo1aC08tjz?=
 =?us-ascii?Q?tToxzy7Vh8myHLJklIEp48ksgj/1cbi4EDYDQyEdSW9oLepj8ig6BsLUhPzi?=
 =?us-ascii?Q?8KM33fe6+bZjZOoN6SLlkaHwG1+q7MEmS46/aDygzM57t+G/Yi1s7dkfi02j?=
 =?us-ascii?Q?Csr3+MxJgIkMkGOv1U8ECdwy9vjzW/YVUS4FASL27InQZ6U9z/DjICBclJZG?=
 =?us-ascii?Q?8pu7cWC21x66apDpcNBjwDqnEUEdnf/RG0UQ2sz90JIK0xlQ5GWes++S1a21?=
 =?us-ascii?Q?ZmvIiVD43TfbCbkSQmuVOGvQEpb5nKGw7CXIeXUzyRrh42OG6WeVFmYBDsAr?=
 =?us-ascii?Q?gXM6Q+bUV+h98iHNPWLsoCvGputjp0MRlXpkGiWcSYLC80ITViep2yF8bQ3I?=
 =?us-ascii?Q?1JvmyiKOc4VQkeiKJHcXhMnkETdVXJlU9wn1M+VqRSt3jfjwm8xOMFLiTGoH?=
 =?us-ascii?Q?N/gQx3qVHwSLru9/60bNAyHNQOmbYXe5WfAnaAS0wY+96vXEXh7ekpIcsrt6?=
 =?us-ascii?Q?s3n5FhlxAfihmxGm2QqyNiKztUUiWiZO7C2ZlqhHZQ4ZKFqjEte16Ikx7kku?=
 =?us-ascii?Q?f0HhhGF+fEps4Gk5jPvv8odqD5NSeLRAFEwWTjm4NP2qhpX6WmnbFHmpb8Hm?=
 =?us-ascii?Q?ER/7FX9BGmL9F/KYZ52o7jWGYnc8kRRISvTnzavBB6sf20kwmSQkghqN2+Uf?=
 =?us-ascii?Q?oVnOtjyR6JsyBpOych+Lo1JgtUbC0OSh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyBXMJjKLlthbebdJvo5SfkuWFUaOu+PI2ZUT9olahG3/Rz/tuDwypa8Lxe4?=
 =?us-ascii?Q?AN+Nw63KDmi8bWs1F9hQySXAPtRl/ibx8bKyYCAeDXALOwE6/XWzfIm6oLkW?=
 =?us-ascii?Q?xnz//R5UnIIqs6ANgFy0OQeZR8J7CB++eC3q0QlfSZ5KBrg+AKRK7AUOjbeI?=
 =?us-ascii?Q?PtOFzSnwCxKL4shmXuwwhxk9y+yScjsfTW7Uybg7yKVVFA4o2R6v+BU+WQ8n?=
 =?us-ascii?Q?Dgj8QTKrmExntfFP0Hln6UgwwUMEC0WOViW+9VcOUd6eUQZL/k65d99tgrXg?=
 =?us-ascii?Q?s5nvzjR5jFoIz0VHeq5l81qHxolPKmewOk8yoyz/pm0vlE5djr+aXkssB2Le?=
 =?us-ascii?Q?GX6jfmOUN94LSbwi/4FD3MIt7cUyN5MjHFbrUz/Wmy5SD3G38IwL/jZwxUoA?=
 =?us-ascii?Q?RzRZ6bhVbSgLntQNb+t3gaCO3y9LtNaXP34ELhnvFX9s3prsAJAGLGs/Qxx2?=
 =?us-ascii?Q?PHWutaSwJKqdUTuYoD1IekqYzdsiCObWn0Fs3Uex+e/VzGjCM38h+VbUZoz9?=
 =?us-ascii?Q?xBvhcdIvYVpIJCzXXjme8x+CukTc6JNM+1SfDaQ31YG5kFv8gBtuYKHbuaf8?=
 =?us-ascii?Q?v63GreYEqT/PClJFob3o1rfF+Fi8DGzw7cyY+bGC/oJCrGnRzGcH2XFZ48NH?=
 =?us-ascii?Q?tYB4najHF1so7Cy0CXBufuIkRphDG64bsOTxH0Ed0XvrSpUVaTtBJfHKFR6D?=
 =?us-ascii?Q?kB1wdHZqABTawDCISJSuJ8HuKozuiNN3sl49osWaJjjNFvCpTK/Iuye3lK3N?=
 =?us-ascii?Q?WIcTvA4SmsMvqN9arbS0KlM5TSwNyCIzVJfBqzPJFqaJxRILDfqpBfd8p1ly?=
 =?us-ascii?Q?W7Np84IoQEB1vAgLRiB+Stm42svp/DK12NVX7VTX5s7WxS07QGFuL9hGXAvH?=
 =?us-ascii?Q?e3+X06GlX37dUrYp/vZq97/8hOWjzK/vHehChIr7w5J3fOnya8n4LyVUNW6J?=
 =?us-ascii?Q?r+g8rFPVw0/zkwhU+YzUVC7H9E5p2U4bn7WVeKaVsdg/oCUqYt0b07FaxYRz?=
 =?us-ascii?Q?oyqTQ2Dwx+jW6cpQDXaO94z2xeUNzL4vVHuDe6RpEJNOjQyB6Zh/VikeRmUC?=
 =?us-ascii?Q?1kjKFi6V1GX/s3CX4E9RF5NLqMUMcRCopOBzZAFFyorithOcPpCxav18C3hC?=
 =?us-ascii?Q?HJL0n8nV1/mWAANc8q2KLUyFNR6QicoCczxJdUnlgyenlus1ThTbidcjhlB6?=
 =?us-ascii?Q?WamKXIjU7zT5RxWUDG82KjkaOpsbjhoujGmgLHwVgW1koFaYUxYKFnmDXWHJ?=
 =?us-ascii?Q?kdJhZrfvVTQF5zSmbKpIAgXWb8AUYtFubHsn04aKnMnbRhCKa42ENr5E5gPx?=
 =?us-ascii?Q?rcvfrP4nxKJYEPHew32na8+Cwf/wQWz3xT/Nr20bBcm+1kKU5sag51KOWZqD?=
 =?us-ascii?Q?CYn8Km1ys8OdiRWJY471WwEriksDsRpIXZ91WzTYj4cDttkm/bgcK42D44SY?=
 =?us-ascii?Q?johYCFw1u78dnESV3IirMaZpvzPTDIoze/Ult5DR/f2e2SrjU95bXm/3GI5R?=
 =?us-ascii?Q?15R6sQNaOUvYPfgcMzfajEvi6J+xHu3ThYCPIFMF0Rl/YMmt0XwSXGAf58p+?=
 =?us-ascii?Q?qEvt2IKaJPV7W0LJkvLPdBPMMPkTgwMWtaFsuXBd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56437722-1c1d-4eb0-772f-08dd5b311c3b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:27:44.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVAWeA518kVosISTC+yxyr6dCZAC/XYzhSCK8kytGEskPDLyiwN6BX4nYu6mvIHOQ5ugnMcvjSsf3kD8q800BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_152749_247939_A038240E 
X-CRM114-Status: GOOD (  16.94  )
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

On Tue, Mar 04, 2025 at 05:31:27PM +0800, Jacky Bai wrote:
> Add the minimal board dts support for i.MX943 EVK. Only the
> console uart, SD & eMMC are enabled for linux basic boot.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  - v2 changes:
>   - newly added for board dts
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |   1 +
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 196 +++++++++++++++++++
>  2 files changed, 197 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 839432153cc7..02863c09bb8b 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
>
>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> new file mode 100644
> index 000000000000..d4a204eaf5e5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024-2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx943.dtsi"
> +
> +/ {
> +	compatible = "fsl,imx943-evk", "fsl,imx94";
> +	model = "NXP i.MX943 EVK board";
> +
> +	aliases {
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		serial0 = &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		off-on-delay-us = <12000>;
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VDD_SD2_3V3";
> +		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x7f000000>;
> +			reusable;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x0 0x80000000 0x0 0x80000000>;
> +		device_type = "memory";
> +	};
> +};
> +
> +&lpuart1 {
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> +			IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
> +			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> +			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
> +			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> +			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
> +			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
> +			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
> +			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
> +			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
> +			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> +			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x13fe
> +			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
> +			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
> +			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
> +			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
> +			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
> +			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
> +			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
> +			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
> +			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
> +			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> +			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
> +			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> +			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
> +			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
> +			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
> +			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
> +			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
> +			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
> +			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> +			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> +			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> +			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
> +			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> +			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x13fe
> +			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
> +			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
> +			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
> +			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
> +			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			IMX94_PAD_SD2_CD_B__GPIO4_IO20		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
> +			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> +			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> +			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> +			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
> +			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
> +		fsl,pins = <
> +			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
> +		>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc1>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	bus-width = <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	bus-width = <4>;
> +	cd-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	fsl,cd-gpio-wakeup-disable;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> --
> 2.34.1
>

