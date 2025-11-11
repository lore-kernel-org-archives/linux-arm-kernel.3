Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403FCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhDPWcHQwhbMDsBD0V/t6hKlH/MXgCs801GiP87Z/q0=; b=DykkymbvZuCe6x/x26hcipGe15
	l66fSYdS26d7bGpO4/6tqmEdQgoAwLAgpKzovpvQueHX20QnXXmj30b6rFMC7ULS1/e0kjDcueqLZ
	qKVtVfXRfa+vL1gaZDbact9g+IX+geCM381WSvW4NW0p0PDu6/XuKys5yb8zVzpUMxWO7Yx1Q/vFj
	+J4+j4vy/lfVOJfZWNmYn6tANGlKIJ0CEQW6gtzGeD3b4HuZzKtbyXVDW0CznEzhJnYeIYdFENbVS
	iNDTR8Pn7wvPeC00rATKI+L5H5R97teEA2JdNj19VVQ+MYzFdr3gawzDLiO/vNSeDb3er2w1kcuZs
	NuDmBQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiXS-00000006f6V-16wh;
	Tue, 11 Nov 2025 07:11:38 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiXP-00000006f63-11PS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=nhDPWcHQwhbMDsBD0V/t6hKlH/MXgCs801GiP87Z/q0=;
	b=ODO/kGMqFbRqTC0v8r+qERLvSla7r6KNWJ77O80rPbP6codeYkA5nzwEg4h+O4
	gh5LhHWzo8deItXNDdhj4Nqr62RI+0yVSQEb/y1Hm34fRiLb0kURqkYZZC+BKkYR
	FcWKgs7vfgrFpVkC2XwQHSgRdbNtUezUJ3sSaFHwsJHxg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXvWOT4RJpfZLkAA--.5262S3;
	Tue, 11 Nov 2025 15:11:17 +0800 (CST)
Date: Tue, 11 Nov 2025 15:11:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add
 supports-clkreq property to PCIe M.2 port
Message-ID: <aRLhko0h1OZgvo2o@dragon>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015030428.2980427-2-hongxing.zhu@nxp.com>
X-CM-TRANSID: Mc8vCgBXvWOT4RJpfZLkAA--.5262S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wr1kCFy3ur1DXFy8Cr4kWFg_yoW8Jr4rpa
	y8CFZ7Jr1xGF4fGanFqFyrKr98ta93JF4Uur1jgryUKrW5CF97tr48Crs3Wr4Y9w4fCw4f
	ZF10vwnaqrWYvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3EfrUUUUU=
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOBV84WkS4ZUOIwAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_231135_676171_BCEDBA35 
X-CRM114-Status: GOOD (  14.89  )
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

On Wed, Oct 15, 2025 at 11:04:18AM +0800, Richard Zhu wrote:
> According to PCIe r6.1, sec 5.5.1.
> 
> The following rules define how the L1.1 and L1.2 substates are entered:
> Both the Upstream and Downstream Ports must monitor the logical state of
> the CLKREQ# signal.
> 
> Typical implement is using open drain, which connect RC's clkreq# to
> EP's clkreq# together and pull up clkreq#.
> 
> imx95-15x15-evk matches this requirement, so add supports-clkreq to
> allow PCIe device enter ASPM L1 Sub-State.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 148243470dd4a..3ee032c154fa3 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -556,6 +556,7 @@ &pcie0 {
>  	pinctrl-names = "default";
>  	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
>  	vpcie-supply = <&reg_m2_pwr>;
> +	supports-clkreq;

Is binding updated for this property?

Shawn

>  	status = "okay";
>  };
>  
> -- 
> 2.37.1
> 


