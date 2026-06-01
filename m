Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D5FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=H1hVXwtOto/IFcO7KNTvhV0DieY8ZM/C1FwXh7ymHAY=; b=x4bbQbKpWnB2Bu
	ttGjy0cXhjbLDhXoQ+tSIl3vGwjr92oaHj+ZI0Qc/qRVRmkbSqynDQ2KUMIjQKTOI8RHZPs3O4i1t
	mn02/YeZSjELxm4uawc1oiIs3LCD+3CpLRmHnuoQNIFuLCKV1/7D7ocypmy8qUpBUcEqlzCodG+Pj
	izUR0XUBjMfPUnIXucx0ovNlnk/wrYbcsEFmOLdTTtgs2wJInXBvbmgoxaUqGorsX1XoyrCoPAI61
	Nrba4NjCXcBhW7Dbel85p/QtRXXqEZQmDTABy8NUMYiRP+vx4smZ0azSCarFr2d4+QKDpzlQ7hwe8
	wVE44vPJ/OhVJqRmOT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1z6-0000000B9ud-3F63;
	Mon, 01 Jun 2026 12:43:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1z3-0000000B9u0-2gBw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:43:11 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id E771A1F95E;
	Mon,  1 Jun 2026 14:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780317783;
	bh=H1hVXwtOto/IFcO7KNTvhV0DieY8ZM/C1FwXh7ymHAY=; h=From:To:Subject;
	b=MutP/+D71iXBmL/0fGOHo9F2u8hZB9UQji9kB639/LAgliscV3Hw7Wt/xH02MwOJk
	 2/oRWDP2SAFd9XJfJQT/fxT/koBEv8ukqJkfSmKnZcx8Cm9+KYoYSaNqw09kgOEQ4D
	 4/TAsw7STe1eCA4Uz+SmNaiT4ajBkAXOEGrbPHdqT90PuwjqF8LJVe7ZgctcbZ8Dy1
	 mBSwyp030QjaCmDhZ4gmtvrMiyVc9UxIqtCSowcBHh9m1qpx6Qm/Btm8xAtRBUqRmR
	 8uLcz9nT39L3GHrPsDsS5ihGALoTOelLv2XVvhHLXzrIYd+4Cv6kyuftY0SU0eE+1i
	 ZufKGOZ+OdGJA==
Date: Mon, 1 Jun 2026 14:42:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 2/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
Message-ID: <20260601124259.GA76338@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601090205.076BC1F00893@smtp.kernel.org>
 <20260601-topic-am62a-ioddr-dt-v6-19-v5-2-3856a023aff2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_054309_859033_23AC2097 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Markus,

On Mon, Jun 01, 2026 at 09:02:04AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Moving `wkup_r5fss0_core0_memory_region` to the shared `k3-am62p-ti-ipc-firmware.dtsi` silently truncates the reserved memory size for Verdin boards from 30MB to 15MB.
> - [Medium] Moving `wkup_r5fss0_core0_memory_region` to the shared `k3-am62p-ti-ipc-firmware.dtsi` causes fatal `dtc` duplicate label errors and overlapping reserved memory regions for Var-SOM boards.
> --
> 
> commit 65cd200377411c4597f1b662700915ea23cfe5f8
> Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 
> arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
> 
> The commit moves the wkup_r5fss0_core0 memory regions to a common
> k3-am62p-ti-ipc-firmware.dtsi file to combine identical definitions
> across boards.
> 
> >     Move the reserved memory regions used for wkup_r5fss0_core0 to the
> >     k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
> >     boards as well, so we can combine them here similar to what is already
> >     done for the mcu_r5fss0_core0 memory regions.
> 
> [Severity: High]
> Are these regions exactly the same for all other boards?
> 
> k3-am62p-verdin.dtsi explicitly defines the wkup_r5fss0_core0_memory_region
> with a size of 30MB (0x01e00000):
> 
> wkup_r5fss0_core0_memory_region: memory@9c900000 {
> 	compatible = "shared-dma-pool";
> 	reg = <0x00 0x9c900000 0x00 0x01e00000>;
> 	no-map;
> };
> 
> Because k3-am62p-verdin.dtsi includes k3-am62p-ti-ipc-firmware.dtsi at the
> very end of the file, dtc cleanly merges the identically-named node paths, and
> the new generic definition silently overrides the board-specific 30MB size
> down to 15MB.
> 
> Does this halving of the available memory for IPC on Verdin boards cause
> firmware load failures or runtime out-of-memory crashes on the R5 core?
> 
> (Note: A subsequent patch in the series 'arm64: dts: ti:
> k3-am62p-ti-ipc-firmware: Split r5f memory region' changes the label and size
> to 1MB, which further truncates the region without fixing the underlying
> overwrite.)

Can you have a look on this?

There is no specific reason for Verdin AM62P deviating from the TI SK
board on this memory size topic, we should avoid duplication and
silently overriding those however.

Francesco


