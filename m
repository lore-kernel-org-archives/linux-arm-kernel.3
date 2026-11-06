Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GjnxExq1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcTzmklI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+AElvHQZoFGP9DlewYqnVP0xXdCddfuFHZpt/5Au+oI=; b=GjnxExq1FA4eEmpvFq9Oqdw3yK
	UdlUXm3K2puHQzzG7xpqiAlAUhvuFfpEY0Ngi78UwcHOjvVoRpTUMbd84alz34lmHJg1HfBmd+UPW
	z3TYpl2rxoaoBZ1bnb3/syk/FPnGtaaKy41aCOACQk1seF7RtE7xC7TT7aaTMZkqbFmXWfRtkQ9/1
	ndpLJZRtVjb20rzHup6tzLdiS+etlVrtaXv5uPjbjQ9RQYpnoc2OU6Vd9PeKMVxtnPHMlE94YTEFV
	a9UfJJAq9Tqx7R/Hq4t975vXCRJY5Jir3BmYveJwaOeV8WaYfbEeaccpP5foJzd93oRAjhx/OrF1m
	2fL5ignA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHj0-0000000C5EC-3y8P;
	Fri, 06 Nov 2026 11:03:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHiz-0000000C5Dl-1OKh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:03:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5D05601E3;
	Fri,  6 Nov 2026 11:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8140E1F0089F;
	Fri,  6 Nov 2026 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962992;
	bh=+AElvHQZoFGP9DlewYqnVP0xXdCddfuFHZpt/5Au+oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RcTzmklIohIPhAtS55i7sWu8AM7F+O/qnYiKepi2J0WX8e/jteStCrqykHDiFmrLW
	 ETw48LnQ4rv44dWuMvepFvpMME3YRe2lCfSfNvJRJhL3P2JFAXK9Hqu0QdLKkxjEU7
	 mzm+1GHgSzYR8TcbW/lb4gxWfHV8OrX3nLIQT4V+eHJAJLuheREebDSnZBRiBeOH8Q
	 phOAdDk20dLqAAgwUbd6Ej4d3sdkivQinhuZ/HXulqfry/jJF8pyFaAfrpqHWeMwCc
	 3zjOSmtM6TZZhT+tkfcUEgLJHFAjqrgBSqjUH2YRfsNj1jr61cptGqKRTVywh6a3Ur
	 91cXI9Rls0hCw==
Date: Fri, 6 Nov 2026 11:03:08 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Message-ID: <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:34:13PM -0600, Rob Herring (Arm) wrote:
> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd 
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is 
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch 

We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated and
relies on an FPGA tile setup. Replicating this environment is likely
impossible since the original bitmap files may no longer be available
easily.

> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For 
> 32-bit boards, this cuts the remaining warnings in ~half.
> 
> I verified the config-bus devices still probe after moving 'mcc' node 
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (7):
>       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node

I assume you will take the DT bindings via your tree.

>       ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus" node into sysreg node
>       ARM: dts: arm/vexpress-v2m: Move regulator and led nodes out of bus
>       ARM: dts: arm: Use standard node names
>       ARM: dts: arm: Add missing "#dma-cells"
>       ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
>       ARM: dts: arm-realview-eb-mp: Move "pmu" node to top-level
> 
>  .../devicetree/bindings/arm/vexpress-sysreg.yaml   |   8 +
>  arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi      |  20 +-
>  arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |   8 +-
>  arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |   8 +-
>  arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |   6 +-
>  arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |  10 +-

Linus,

Do you want to take this series via your tree or prefer me to take it ?

>  arch/arm/boot/dts/arm/integrator.dtsi              |   2 +-
>  arch/arm/boot/dts/arm/integratorap-im-pd1.dts      |   2 +-
>  arch/arm/boot/dts/arm/integratorap.dts             |   2 +-
>  arch/arm/boot/dts/arm/integratorcp.dts             |   4 +-
>  arch/arm/boot/dts/arm/mps2-an385.dts               |   2 +-
>  arch/arm/boot/dts/arm/mps2-an399.dts               |   2 +-
>  arch/arm/boot/dts/arm/mps2.dtsi                    |   4 +-

These MPS2 files may get deleted soon, but shouldn't be a problem.

>  arch/arm/boot/dts/arm/versatile-ab.dts             |  11 +-
>  arch/arm/boot/dts/arm/versatile-pb.dts             |   4 +-
>  arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi        | 146 +++++-----
>  arch/arm/boot/dts/arm/vexpress-v2m.dtsi            | 322 ++++++++++-----------
>  arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts    |   9 +-
>  arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |   9 +-
>  arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts        |   4 +-
>  arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts         |   2 +-
>  21 files changed, 298 insertions(+), 287 deletions(-)

In case, Linus W prefers to it, for the whole series:

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

