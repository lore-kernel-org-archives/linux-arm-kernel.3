Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF2CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o+wETYksP8ccjEosz8Cbz5sDcAm+lKn1MXus85N6hk=; b=AWLuvXdaDC/PyUsGSREdUBE+AB
	1GEThpBAVJobpiNVzTya+7/mtFXnNp6xhF52v+LBpOk0fIbcmXZaLVi4yRK3iSWs/5XhsinRlgbYi
	6yscKTcsdjLDnEI45N10KL8+LIgYyN0Bql2T8cZhKMX4Qj//Ng51lZqmHE9tp60FjMtK8fEDc1kfq
	25wvosZEh9lNh6V9Kow4+Z2SBQsQ0SPNtDiojmnd0GVVuahoCcKD8Xzajx+DYP7eTYBf3gwWcQdMz
	Jr3bfZEeLSYsrMwOq4kXs8l2OQg9/stbjxzvrpQbmhY4IFKKNKyVAs1aqq6wPMpCSc/l2ny3L5E7J
	WMxjjH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8lI-0000000GSuq-0LqP;
	Tue, 21 Oct 2025 09:34:36 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8lE-0000000GSs0-2Xnj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:34:34 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id EB6942125B;
	Tue, 21 Oct 2025 11:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1761039265;
	bh=8o+wETYksP8ccjEosz8Cbz5sDcAm+lKn1MXus85N6hk=; h=From:To:Subject;
	b=YfPu/PPlq2HCEYCkZ6DMBbfM0yvF6ZC7n12d9hkKdj1MW9iFrUpGbN65nH0cIiBv5
	 7g9HNVFSTM6pKIk+d95YldohlYU6EfMAPBOgbGMVJRp7T0C86mFnTpfUDxI0VJIT5h
	 yTQD8LLRTku7cjc8PtWy0zOQum5BXOFH5Y+Z6zrXwcOy2wWPGksj8QCK/ZIAK4x9si
	 c/2knDKelHt2/GZva+si3bcwSwa4sjZflo1rrU6vuGbV7rZoCJYN2D/wS/kKb3tjHY
	 NSdliuWB8h9HyN7JwSfMiQ8sYo9r4hkLvNhB4zAN8cwQ4vj1oz3Eo6cHiKWw6MaNZm
	 7KZrWVWc24MRA==
Date: Tue, 21 Oct 2025 11:34:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
	jm@ti.com, d-gole@ti.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Robert Nelson <robertcnelson@gmail.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Logan Bristol <logan.bristol@utexas.edu>,
	Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>,
	Nathan Morrisson <nmorrisson@phytec.com>,
	Garrett Giordano <ggiordano@phytec.com>,
	Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Li Hua Qian <huaqian.li@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Baocheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
Message-ID: <20251021093420.GA28462@francesco-nb>
References: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
 <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_023433_672625_85FB8940 
X-CRM114-Status: GOOD (  18.17  )
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

On Tue, Oct 21, 2025 at 02:33:10PM +0530, Beleswar Prasad Padhi wrote:
> On 20/10/25 19:47, Hiago De Franco wrote:
> > DM R5 sends a message that is never consumed, since no firmware is
> > running on the M4 (the core is offline).
> 
> 
> May I know why you are not running any firmware on the M4
> rproc? If the intention is just to run the DM R5 core on the SoC,
> you can disable the IPC by NOT including the
> "k3-am62-ti-ipc-firmware.dtsi". That was the motivation for the
> refactoring.

Verdin AM62 and AM62P are generic SoMs, that can be used for a multitude
of different use cases. And not having anything running on the M4 is the
default use case.

I think having the node in the DT is the correct way forward, if you
want to start the M4 firmware you need such a node, so this is enabling
a valid and useful use case.

> List of suggestions/solutions in order of preference:
> 1. If no intention to enable IPC on rprocs:
>       Do _not_ include k3-am62-ti-ipc-firmware.dtsi
> 2. If intention is to enable IPC on rprocs:
>       Make sure rproc firmware is available in rootfs.
>       rproc would boot up and consume the mbox
>       msg, suspend would be successful. Tested this
>       on TI AM62x-sk with commit 1d6161617c, works
> 3. Add support in mbox driver to flush the pending
>     queues.

2 is not applicable here, and 1 to me is not a good solution. So this
means that we need #3.

> > #regzbot introduced: 1d6161617c
> 
> Would not see this as a regression, but rather a new
> bug for the omap-mailbox driver...

As a user this is just a regression. It worked fine before, it's not
working anymore now.

The fact that the solution might not be in the same file that introduced
the issue is not a reason for this not being considered a regression.

Francesco


