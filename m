Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A3E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgBwNLmrIki/SK8WVAvQt3v0t3CnW+2Cc51W3lptYuE=; b=i+Xv8Y2jqcse2W0xPDmP8KQxIc
	t0Zv8I4AldAppE+fkgEwFeyrXA3tPDOkoSyy84nRFKt250B6BiKQKM80+U7J9UNgzfJfmbOY5rS3T
	ae6ClSa+hBxIv5ENLG7mov6sXneDC7qPRJMnqi5FmTtbfLqR9B80oCVsrMIlak9QRuX5vDfEd0aVF
	yt0dnmO4cr/5V4vXfW6/Uh1jYGA5UEdBoFuseUJifH6WowIk1/KbChlk2YVEbVv7Um44hp/Xj8ZEn
	uGbE72IAfSjFMRDfRpAq49SfJiHmIUMl0IHw3/JrwktHljsXfnCxvFaErBplXk9Wh7nVX78+gephc
	uSnpZE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6vj-0000000BdXm-0E4T;
	Thu, 19 Feb 2026 16:31:07 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6vc-0000000BdX3-4Bcv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 16:31:06 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DC3DD1FC8B;
	Thu, 19 Feb 2026 17:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1771518654;
	bh=LgBwNLmrIki/SK8WVAvQt3v0t3CnW+2Cc51W3lptYuE=; h=From:To:Subject;
	b=X23sGSAWt2EKgPi26CvX/nfnR5KTeIuJZ2ZPzg30iqU0ZwE2qV0PFo1WVYGM/JVJu
	 +Rc46kzbtvHjhgd99Bb+VTxvQ6GFozf0Q/9BP3qYV9aTx3CYPXwyswK40fo7wfrwRk
	 cIaSFgVamNmv+gzsv1BViRmA9kwuk+q+4HfOkhmFRYirqSHTd/YqcRwsL3tuWsvm6N
	 CD2qI6rZSODERTNHBYM4lemEzlRJBWpyZTJkrcUp+BenuIrX5Z/SOdDL7RyZzSnsIA
	 uhqfWl09O02rXsjo7alV4P2qOM7n4BfiU0Zt2QNW+l/BrmOV/auex275ifwolr3zTa
	 a2h3at6TJox0A==
Date: Thu, 19 Feb 2026 17:30:50 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: max.oss.09@gmail.com, Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <20260219163050.GA194254@francesco-nb>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_083101_922251_58409158 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> >
> > The change introduced a regression: at least Colibri iMX6ULL and
> > Colibri iMX7 no longer boot with that commit applied, while they boot
> > again after reverting it.
> >
> > Although this has only been verified on these two modules, the issue
> > is expected to affect all device trees using the gpmi-nand driver.
> >
> > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > ...
> > [    0.960443] ubi0: default fastmap pool size: 200
> > [    0.960476] ubi0: default fastmap WL pool size: 100
> > [    0.960500] ubi0: attaching mtd4
> > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > ...
> > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > [    1.650029] UBI error: cannot attach mtd4
> > ...
> > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> 
> Can you help found the real reason why not boot?
> nand@0 is preferred format for MTD raw nand.

I already raised the issue when you sent this patch series, we need to
consider the other users of this DT blob, for example U-Boot.

Please see my comments and Krzysztof one here [1]

I agree on investigating this, but I see no other option than reverting
for now.

[1] https://lore.kernel.org/all/20251105115538.GA17091@francesco-nb/

Francesco


