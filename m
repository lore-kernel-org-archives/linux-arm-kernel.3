Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305D8CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJhw0qxM/LAU71EEZ5AbPC52nLOGrUVertbown/9J5I=; b=Loq2R/rGlJFBZFQn3BfAouBT2D
	v+aDw6c5HAbOYYeF+OFIGkkQYIU/HY4o5vRt40c8oGiNoz2FBd0wE9s9YInugIOBhFTXL9KvWG+ts
	ak9USNuyiSOi2jSuyB7pIdsxOdga8g/+vPKxVwENSvRT6G0zshORYt08C6jW20EoJ4A0cBVA6pjh6
	xLnoWnoGYxfqntiEmvIpAPUiPI42uOjO9w/I1LeZfU582XnLhWFQWNe4BW80IDYq6Sj4TN6UsRsHk
	8agNJNVhwd2LZf2TN0qcNKSsUJIJibGgj1JTIbNURP5qMhRYJN2zgHHH7ugPywxgsX3QedKsCbF1A
	a0SUUXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urT3j-0000000070p-1ovr;
	Thu, 28 Aug 2025 03:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urT10-000000006iV-2jnH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 03:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hJhw0qxM/LAU71EEZ5AbPC52nLOGrUVertbown/9J5I=; b=fwM1iODOKOnZUgEb+1WS679DvS
	cPHzNaBhnUsdqGkSOoDhPv3WPGaNz9iPE0ZLKDtfVJBNnf57tVWU6nsMLhouPRBJ3pYaCdY8OiYc4
	Us6UPST9iq9GhHiUf6TPoP8gHz1RnEfa6vhEdsx5gppOf9f06t2na56sx9xRkrCgU5GOLX5j9IQZK
	2jXW4FveFPb8l0iUUMLGvsu/rKgBRSwMpa1XPJwg8wEgW8kuiJQWqBjKbYGDdyYPfIivsh+ENQZxh
	YdbejTKIbus7CKfRyaud34IHloGVJQ6hLUDKJGobSnfwuUrsU0mduLyGExYbz+AgqKTjpySyr+o20
	uD5aZpcA==;
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urT0q-00000002ckl-2Uki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 03:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxdLbAkPZwddjuAAJwahlHl80X8Jvks9wNdKbI9KtaB9Pa85HJ4obFd7tes4udiSAzm31YsNwTH8FMeZkIjzo6jun93SFgARC8MrV3+DvdFMYK2VJVIvuS6ln4e04aGQQ7x2hXxOY1cMjQ1rduggloURViRLm6Ybl/qrqd3stYYXILirMkfEkMTt3jczOQkWpd1cfp0oWR/Bk0XbY/TKzWuwMb+MXlyXhUZaRuMbY4Su51TNhWgsf+SK7XXfcv24OWGDz4w43XrcWKnH1c1a7bJtz95D88Szr/qKX4wD99lBS0TXpCjVzVR8EfrKqqkoVCmm3EhFX2oF1EcTa0LIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJhw0qxM/LAU71EEZ5AbPC52nLOGrUVertbown/9J5I=;
 b=rNhMlb+aqG5+95vX4jyE8IkvtJTnFc4JLx1g2i2YPg1aJHutaPaIOmRMb1PHzVfp/1H9PK6FABeg73GU0K8EDqWf6U50VqKsomUERZLyocZD32GWHiyiHtNYg+67qLOU9quIhvWD3VarZcmDqIwMQ3JiqS/vlQI8ZSzcy7pOZFpeOwwP5ne+cPtToDdS+jBfp8obvOsr4OKKGDE8318EqlYh7mHM5aZ+wrAHrknqPo7P7zMh6AjaXp5lFZ6hCmiE77ob1JvMvYncQ7y7PGRno23+P8qBkASQB92AoCDD39X22HJtDS6qQK7A5h/2Z0AD6lioP8A3E3ku0/DgNpREFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJhw0qxM/LAU71EEZ5AbPC52nLOGrUVertbown/9J5I=;
 b=kuwESRfF7OKrmZxYRNKzpALhBS/ZzwXtsMpqqhgmIYuQSQgIWCybnXGKjImpVGMXT6vOJi5qb0CMLCcI+Q6Io3oL4ucVXVx+7awWqDbTLZRPFi/KHMHNXlLthdlU1tUkPlu0xILb2JOErqYFBDytz7EOuJFpBFOPsgypFXr9JCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OSZP286MB0982.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:fe::6) by
 OS3P286MB3212.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:20c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Thu, 28 Aug 2025 03:09:05 +0000
Received: from OSZP286MB0982.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fb9b:13f3:8329:52e3]) by OSZP286MB0982.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fb9b:13f3:8329:52e3%5]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 03:09:02 +0000
Date: Thu, 28 Aug 2025 12:09:00 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/gic-v3-its: Fix invalid wait context lockdep
 report
Message-ID: <pkfekcmetqyoj7rwvr77kisu7ok7bc6srq5maoydisnsk4bnyy@wimnw744lp5t>
References: <20250827073848.1410315-1-den@valinux.co.jp>
 <86h5xtdj6m.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86h5xtdj6m.wl-maz@kernel.org>
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To OSZP286MB0982.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:fe::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZP286MB0982:EE_|OS3P286MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5faffa-096c-4b06-080f-08dde5e03d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rb1lfzZunrRLlmseeSYB2HC4tukgLJMyHuibOgwU4e4Gq8IWldQdd9qcYwx8?=
 =?us-ascii?Q?VCmvG7WwgiMUG4MECDVlY0q8U8TiVF/2tFwpz+hUpQYiInMbnYt5hn3UgcI2?=
 =?us-ascii?Q?qhOFJOOgSQ/qXue1EWBdGox6UbsjMLAC8pVh8I5TBsuDaAb9L74iMbtgIR9z?=
 =?us-ascii?Q?Uu9n2PuwGZJQheI8kziBlUWCK4H5kYWJgsvwxl80tXEJC+xHJHtt+db0LNhv?=
 =?us-ascii?Q?u/bAG0qrwvc2J8SDqPz5Mqts96TbRlFRPgAWUHl5ov0u+loXWuYP8zfbU0AU?=
 =?us-ascii?Q?BgfAxte8MtZb93aaxgnsxtB7Comedy7Bdg+Dr/wX0ic3cc2Kh+H/7YwIzsWR?=
 =?us-ascii?Q?9V2r9vKYjIfqeuplyr8Nd13eWBc6RvxJ/ipFVu8Z5PnpuvQGfyIO4t0rWgz5?=
 =?us-ascii?Q?MgHzhrYzUDjvFrbEeJYErAwazmUIgTNmMEgnmwYAIuji0ViH+JODbLIOP30M?=
 =?us-ascii?Q?7IZHxVlGA+tdw/074BJVH8G4YBum1x1VNT0nQ/Vj6JIrOlwvY21782a4xO3o?=
 =?us-ascii?Q?XrintdEyQBg1bRTcKxRURUzNr7y1Ey0M64/3GaXDjlUIzNPkSi8h837CpVWF?=
 =?us-ascii?Q?NqKVlzuVL9H64abTOT4Z0iuVpJrKG8mgzzZEcZYqSKVkYfjyAV+gJGWxwcoq?=
 =?us-ascii?Q?fzihj4k0Y5b6kHzOwVYhSji5m0mJJT18My/NcIpIARzQ/orvbqPAGBQOfaiB?=
 =?us-ascii?Q?rd5X8r1/nh9wy+okcaLIsbELD/xbLDTeJhXk6zDzoIfpCUTuH/8HygFdNZPg?=
 =?us-ascii?Q?UJ53Lie55lVDmweIXxQOFp1ZedP66CaIvIFEMYhZC+35a8xN6XghhVMCiOW2?=
 =?us-ascii?Q?44STkELjVqRp/86SutrsobJEbjx0cHiuUfS6K0ng8rcZL5baAZGAYlGpri6b?=
 =?us-ascii?Q?rBRzfRMrYr2l/bev/F+bvcgT9ZFpHEDz/NOEQvPkuCOY5xSa0stjXqJ4+R7K?=
 =?us-ascii?Q?hByE4HQtfVmCV6URr7e2sL1DS9qCDN0dVPsn+oxxkboGjdJuqnoFBKroahp9?=
 =?us-ascii?Q?nJCMjpTAuoxutGdBEv1cqBNhJoDcaub524Hgpy3oRdbrfLKlB1df4QCve6yb?=
 =?us-ascii?Q?AcQBUsNX82U+LWWw0fvHWO6vwWLN4PP/hOoKbHGXWjU2uZe3b2/7HMbMcDOQ?=
 =?us-ascii?Q?uE9cI9Dl2YLUcyvf/RQm/QoiDMsYlzAeAd9NbAu2m/1gWqoprYzZ3g1zMkq2?=
 =?us-ascii?Q?hQdl3Renp7iJSoXeyb8jY5ieacYdM0TpmniYKFvIPR9CYlQF1A9GpybAU43O?=
 =?us-ascii?Q?mmDZYszbSuQPtSBM+FLEsqwpPvRZXIK9fJF+CGBwbTSXFWBTIOHjn0W9B70c?=
 =?us-ascii?Q?Y2fE6g29L+dD2pSnLdKP/AoK28Lhh+4CQJTImBFerR8POeb+tlFvbnImbLW5?=
 =?us-ascii?Q?eKPysJIBoZptotfreNXV8hXi8WTE7I1Mpo9zkFn80r04xZTSxL1BUROl4sWa?=
 =?us-ascii?Q?H8rV1/k6ocQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZP286MB0982.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bPeYSZUv7f/sl9BBArtC9yra85Zz+ay3EqPJKWXE4VfmXTywMnoTGYmIS7Tp?=
 =?us-ascii?Q?aSqC+rCtW/blrp4vq4RJ1aGROEkfcoyBXzgLgesDnXsNEG1ywUMEdr9Ckq33?=
 =?us-ascii?Q?mb14XSKmbAo0fY/Z7Wyf+gtZ69FSBuQuj43BiDRxc5Bk9mI1eihDucmh8xDU?=
 =?us-ascii?Q?bAPdsRaSbkzjBB4Ge86JqXQFF9Kt08ronoDTUF6gpDNeP+T6++hyzGz2cUTJ?=
 =?us-ascii?Q?Vr8UtqnwSyNrV63eLrocialf264I7y+aEna07Bp4QX9XVSqWz/+4srHbZCFq?=
 =?us-ascii?Q?exNAaD+h1/yqoCDILsSM8UMvdiJoNfM2gydS2+JdxmVZD8IWilInHnZj2t3H?=
 =?us-ascii?Q?Wf+15QvcYzf40TJGjjqMuE57fcTnDxyU9LIqoyYk8SMht6zvVw57JMfH9SHP?=
 =?us-ascii?Q?iQYfyklEYxrkxsfI0wjjWZAQa+sED5bk/7HruZwOrHPrXwNfYZLS3faveDGF?=
 =?us-ascii?Q?xV4AD6ADrID4iXwYgRiVKDZJnJpZUqrSM833/XgAH2QKB24bekV/fOKfwxXj?=
 =?us-ascii?Q?Xc87Ev8JTUT8l7viK85I96J4Fl1TxckRCgBqZSjUiAipj+EmGDOi026lCY8N?=
 =?us-ascii?Q?hSIgNWScuVHehNXdJdKWasucUy3PDTruJzDRKrg/y9LiQZcbr2WelXwaD3dl?=
 =?us-ascii?Q?UAKjmCu4NXD/DB6K+pQsvhN1ZxBPW0FiNjoQhgg2fLwdDECI//v1xbQwOc8K?=
 =?us-ascii?Q?MmXV9dyavjJPRS2Sg+1j4EmD5hC4lzD9YJHOShG28a7pmWIBGmw0rAfThC4A?=
 =?us-ascii?Q?e1EDPx7rwhMh9f54sE98Bfkir0YSOgprnCfRHxhmhbxgbfdbgip3XbmXQTLp?=
 =?us-ascii?Q?fSbZ8UT7kklylrLVkPXOjeQOAfeMt3nFQGKKBuhkW0ZBVz18N4UozepLHWgR?=
 =?us-ascii?Q?GKPni9H3AicugfTKktSpsIKpQtcYwT5gw1zH0AGDD/ZBsaEXnkqwiUkt0RGR?=
 =?us-ascii?Q?0BbzvEDVIXcOAQ9RDyCNAKtKrTMSdIavJXWWstj/IFIa/r3Ab9ssm9YbWF1R?=
 =?us-ascii?Q?BEOGitj8ypyfpl/RhH0mPfCCfcK4y7ag6HYgHClQ5wWUaaAvBsyaw9RqJVT4?=
 =?us-ascii?Q?X2mfyUmlKWnutK0vnEl5YN/KieO3d3jSn8JDgliK2NcitRXHAqn7e4CWeFQ0?=
 =?us-ascii?Q?HT8Qhph1ITstB+cAIIRq7zG94G5WwjSWKG1vZ5bKa7HYCU0oqgCKsI6zlkeC?=
 =?us-ascii?Q?CrjafZNlx9YTZukuIJDx94YtZfUoODEJwPmnYyBPicH0LSvmlDEz0rZq5kuh?=
 =?us-ascii?Q?NC68FhNzfn5Hp4IXLdkBRooijfvwjTSZSedTxVijuR9BN+cfD86xxVnjktoK?=
 =?us-ascii?Q?qTFdX0+6AV55gG9jFEr2Uc8/EQdGU64FBDYaTIGfKRdWF7TK+Ex43Zxwd6iY?=
 =?us-ascii?Q?daMtg3/+xuoyCN6z1h1Nb7q6Z5W4Yca4Apf/pkXOGNUJrFgmV9t++6ScKeKs?=
 =?us-ascii?Q?OL4bohs3gBZY1oTJSw6LI4M1xIwGBm+5i+2iTZMN3IvFqYm0BHQ8lwffdUYG?=
 =?us-ascii?Q?BQQyes2N9kh6oH7ygUGxfrl6H7PQe3PD4Y4IEycOFzw6ve5LU4FKIb6lIrcK?=
 =?us-ascii?Q?Yg3pSHhKKNogWdEObAeu2buKLH/losya2pjVqqnMSqTerk3aCJjUkv8lukkf?=
 =?us-ascii?Q?ZjXHjLyO7XfMkiU7fc+PKyA=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5faffa-096c-4b06-080f-08dde5e03d67
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0982.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 03:09:02.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RDNklZ51zztAfHLfFnxTWsuH8ql9PVZR21Opfpke2wpKKwXvK/WKX+xs8Yd6X5zzMer3GZsHmqanJnimSYdqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_040922_894354_B559C656 
X-CRM114-Status: GOOD (  42.83  )
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

On Wed, Aug 27, 2025 at 01:48:33PM +0100, Marc Zyngier wrote:
> On Wed, 27 Aug 2025 08:38:48 +0100,
> Koichiro Den <den@valinux.co.jp> wrote:
> > 
> > its_irq_set_vcpu_affinity() always runs under a raw_spin_lock wait
> > context, so calling kcalloc there is not permitted and RT-unsafe since
> > ___slab_alloc() may acquire a local lock. The below is the actual
> > lockdep report observed:
> > 
> >   =============================
> >   [ BUG: Invalid wait context ]
> >   6.16.0-rc3-irqchip-next-7e28bba92c5c+ #1 Tainted: G S
> >   -----------------------------
> >   qemu-system-aar/2129 is trying to lock:
> >   ffff0085b74f2178 (batched_entropy_u32.lock){..-.}-{3:3}, at: get_random_u32+0x9c/0x708
> >   other info that might help us debug this:
> >   context-{5:5}
> >   6 locks held by qemu-system-aar/2129:
> >    #0: ffff0000b84a0738 (&vdev->igate){+.+.}-{4:4}, at: vfio_pci_core_ioctl+0x40c/0x748 [vfio_pci_core]
> >    #1: ffff8000883cef68 (lock#6){+.+.}-{4:4}, at: irq_bypass_register_producer+0x64/0x2f0
> >    #2: ffff0000ac0df960 (&its->its_lock){+.+.}-{4:4}, at: kvm_vgic_v4_set_forwarding+0x224/0x6f0
> >    #3: ffff000086dc4718 (&irq->irq_lock#3){....}-{2:2}, at: kvm_vgic_v4_set_forwarding+0x288/0x6f0
> >    #4: ffff0001356200c8 (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0xc8/0x158
> >    #5: ffff00009eae4850 (&dev->event_map.vlpi_lock){....}-{2:2}, at: its_irq_set_vcpu_affinity+0x8c/0x528
> >   ...
> >   Call trace:
> >    show_stack+0x30/0x98 (C)
> >    dump_stack_lvl+0x9c/0xd0
> >    dump_stack+0x1c/0x34
> >    __lock_acquire+0x814/0xb40
> >    lock_acquire.part.0+0x16c/0x2a8
> >    lock_acquire+0x8c/0x178
> >    get_random_u32+0xd4/0x708
> >    __get_random_u32_below+0x20/0x80
> >    shuffle_freelist+0x5c/0x1b0
> >    allocate_slab+0x15c/0x348
> >    new_slab+0x48/0x80
> >    ___slab_alloc+0x590/0x8b8
> >    __slab_alloc.isra.0+0x3c/0x80
> >    __kmalloc_noprof+0x174/0x520
> >    its_vlpi_map+0x834/0xce0
> >    its_irq_set_vcpu_affinity+0x21c/0x528
> >    irq_set_vcpu_affinity+0x160/0x1b0
> >    its_map_vlpi+0x90/0x100
> >    kvm_vgic_v4_set_forwarding+0x3c4/0x6f0
> >    kvm_arch_irq_bypass_add_producer+0xac/0x108
> >    __connect+0x138/0x1b0
> >    irq_bypass_register_producer+0x16c/0x2f0
> >    vfio_msi_set_vector_signal+0x2c0/0x5a8 [vfio_pci_core]
> >    vfio_msi_set_block+0x8c/0x120 [vfio_pci_core]
> >    vfio_pci_set_msi_trigger+0x120/0x3d8 [vfio_pci_core]
> 
> Huh. I guess this is due to RT not being completely compatible with
> GFP_ATOMIC...  Why you'd want RT and KVM at the same time is beyond
> me, but hey.

For the record, I didn't run KVM on RT, though I still believe it's better
to conform to the wait context rule and avoid triggering the lockdep splat.

I don't know if there are any plans which make kmalloc with GFP_ATOMIC
workable under a stricter wait context (getting rid of the local lock
in some way?), but I think it would be nicer.

> 
> >   ...
> > 
> > To avoid this, simply pre-allocate vlpi_maps when creating an ITS v4
> > device with LPIs allcation. The trade-off is some wasted memory
> > depending on nr_lpis, if none of those LPIs are never upgraded to VLPIs.
> >
> > An alternative would be to move the vlpi_maps allocation out of
> > its_map_vlpi() and introduce a two-stage prepare/commit flow, allowing a
> > caller (KVM in the lockdep splat shown above) to do the allocation
> > outside irq_set_vcpu_affinity(). However, this would unnecessarily add
> > complexity.
> 
> That's debatable. It is probably fine for now, but if this was to
> grow, we'd need to revisit this.

Just curious but do you have any plans to replace the current
irq_set_vcpu_affinity() approach with something else?

> 
> > Fixes: d011e4e654d7 ("irqchip/gic-v3-its: Add VLPI map/unmap operations")
> 
> No. This code predates RT being merged, and this problem cannot occur
> before RT.

I'll drop this in v2.

> 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  drivers/irqchip/irq-gic-v3-its.c | 36 ++++++++++++++++++--------------
> >  1 file changed, 20 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index 467cb78435a9..b933be8ddc51 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -1923,19 +1923,10 @@ static int its_vlpi_map(struct irq_data *d, struct its_cmd_info *info)
> >  	if (!info->map)
> >  		return -EINVAL;
> >  
> > -	if (!its_dev->event_map.vm) {
> > -		struct its_vlpi_map *maps;
> > -
> > -		maps = kcalloc(its_dev->event_map.nr_lpis, sizeof(*maps),
> > -			       GFP_ATOMIC);
> > -		if (!maps)
> > -			return -ENOMEM;
> > -
> > +	if (!its_dev->event_map.vm)
> >  		its_dev->event_map.vm = info->map->vm;
> > -		its_dev->event_map.vlpi_maps = maps;
> > -	} else if (its_dev->event_map.vm != info->map->vm) {
> > +	else if (its_dev->event_map.vm != info->map->vm)
> >  		return -EINVAL;
> > -	}
> >  
> >  	/* Get our private copy of the mapping information */
> >  	its_dev->event_map.vlpi_maps[event] = *info->map;
> > @@ -2010,10 +2001,8 @@ static int its_vlpi_unmap(struct irq_data *d)
> >  	 * Drop the refcount and make the device available again if
> >  	 * this was the last VLPI.
> >  	 */
> > -	if (!--its_dev->event_map.nr_vlpis) {
> > +	if (!--its_dev->event_map.nr_vlpis)
> >  		its_dev->event_map.vm = NULL;
> > -		kfree(its_dev->event_map.vlpi_maps);
> > -	}
> >  
> >  	return 0;
> >  }
> > @@ -3469,6 +3458,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
> >  {
> >  	struct its_device *dev;
> >  	unsigned long *lpi_map = NULL;
> > +	struct its_vlpi_map *vlpi_maps;
> >  	unsigned long flags;
> >  	u16 *col_map = NULL;
> >  	void *itt;
> > @@ -3497,16 +3487,28 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
> >  
> >  	if (alloc_lpis) {
> >  		lpi_map = its_lpi_alloc(nvecs, &lpi_base, &nr_lpis);
> > -		if (lpi_map)
> > +		if (lpi_map) {
> >  			col_map = kcalloc(nr_lpis, sizeof(*col_map),
> >  					  GFP_KERNEL);
> > +
> > +			/*
> > +			 * Pre-allocate vlpi_maps to avoid slab allocation
> > +			 * under the strict raw spinlock wait context of
> > +			 * irq_set_vcpu_affinity. This could waste memory
> > +			 * if no vlpi map is ever created.
> > +			 */
> > +			if (is_v4(its) && nr_lpis > 0)
> > +				vlpi_maps = kcalloc(nr_lpis, sizeof(*vlpi_maps),
> > +						    GFP_KERNEL);
> > +		}
> >  	} else {
> >  		col_map = kcalloc(nr_ites, sizeof(*col_map), GFP_KERNEL);
> >  		nr_lpis = 0;
> >  		lpi_base = 0;
> >  	}
> >  
> > -	if (!dev || !itt || !col_map || (!lpi_map && alloc_lpis)) {
> > +	if (!dev || !itt || !col_map ||
> > +	    (alloc_lpis && (!lpi_map || (is_v4(its) && !vlpi_maps)))) {
> 
> This needs to be collapsed into a single boolean evaluated with the
> pointer being NULL.

Right, I'll add and use something like:

  bool prealloc_vlpis_maps = alloc_lpis && is_v4(its);

If that's not the intended direction, please let me know.
BTW, I noticed I forgot to initialize vlpi_maps. I'll fix that as well.

> 
> >  		kfree(dev);
> >  		itt_free_pool(itt, sz);
> >  		bitmap_free(lpi_map);
> 
> Where are you freeing vlpi_maps if on the failure path??

Thanks for catching this, I'll fix this in v2.

Thanks for the review!

-Koichiro

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

