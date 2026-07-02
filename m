Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaEsGQyA9lchO5J2AFHDiPCEx3TudYnthel4tv0857M=; b=J4NHuWE02jYOceVQMttU55T5RF
	d2z7kQjH+QPwbtab+t+ScqapwGV5C1tyQemWoERxxGW0+s5Ts+rJ5J+i/Xbv8MSIpK3sG+rxy/BP1
	dIT2tgM5GvSh8EHPKO3A7Pp3PsTDLB6mVxbbrZXWL3xDgnilBXH/zXl1AUVIjkhlZ0smIyuqERFro
	8eMWi64Q56kjjGmgoF1wTZvM6xn2WnHet+YpFAfZMTKyiNrKgjl2NWVqU1Q2r06fA6Xpl9klZpUVs
	O1fyqoW2s375hA6Hf4uDWNuA801G1jBPUeG3um5KG14OPv3twY2qELy41NiKdLW2JlzwBbnuB6TxF
	cHPXHx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLKB-000000059Mw-1Xl2;
	Thu, 02 Jul 2026 17:35:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLK8-000000059Lp-42Yk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:35:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3BB9E4E409FA;
	Thu,  2 Jul 2026 17:35:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF68B602EE;
	Thu,  2 Jul 2026 17:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 032F3104C9590;
	Thu,  2 Jul 2026 19:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783013737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DaEsGQyA9lchO5J2AFHDiPCEx3TudYnthel4tv0857M=;
	b=uUye/YfpNoN/FMZ4X1Cn5/O4LhI3ptQAjczCfgJX3Bgk4hJuMyoIOcI0vKjJFYSg4hta1o
	NueV4e13bB7rgP9zShZjzGVlRgHXl31jmbYmC490Y5gAkRP2hr+Te8eqPXQrEsPsv0LcOk
	i0wP3lPGzw8jKCoXv99iRmQKTa57dYfQwlxKM5hpRBGwWZe7z+AWr3aE1dxEsB+riUbAOi
	cjEd2M1+miyQmR7++DBBR/jO8ubnNEQVvFGttwGquZNFNlM3CtpTmuCodM/r1++YovdfRz
	kOSQB8asI5ks9XwqQ9/PmKCvMR7wB/YFw4S23LaDauAsQ0sfRIBYg8kIvdWnPw==
Message-ID: <11de0ecc-17af-4f64-884f-e1b146d80aaf@bootlin.com>
Date: Thu, 2 Jul 2026 19:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 08/14] net: enetc: remove invalid code from
 enetc4_pl_mac_link_up()
To: wei.fang@oss.nxp.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-9-wei.fang@oss.nxp.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260702025714.456233-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103541_172385_22542A98 
X-CRM114-Status: GOOD (  10.42  )
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



On 7/2/26 04:57, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> When adding phylink MAC operations support to the NETC switch driver,
> Russell King pointed out several pieces of invalid logic in the
> .mac_link_up() implementation (see [1] and [2]):
> 
> 1) Half-duplex backpressure is not supported by the kernel, Ethernet
>    relies on packet dropping for congestion management.
> 
> 2) phylink_autoneg_inband() is unnecessary, as RGMII in-band status is
>    not supported.
> 
> 3) TX and RX pause are disabled in half-duplex mode, so there is no
>    need to override them in .mac_link_up().
> 
> The same invalid logic is also present in enetc4_pl_mac_link_up(), so
> remove the invalid code from it.
> 
> Link: https://lore.kernel.org/imx/acEIQqI-_oyCym8O@shell.armlinux.org.uk/ # 1
> Link: https://lore.kernel.org/imx/acEFwqmAvWls_9Ef@shell.armlinux.org.uk/ # 2
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

