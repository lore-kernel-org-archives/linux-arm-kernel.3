Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C82CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rxc0HKwniZoNXTbokuWZAAnDMw+7tt8FqJWimchShr4=; b=oJHmWU3iVQO4JnElEHhaCgpjhA
	VdiPWZjHl4sFNNIHV1j8tSWaCQhPuB/phU1o3j4NrH1lg4Ojeue3bkSJsheuYRQIiZczQ7ETerQzz
	7tLETACNUltRNCAnYurKvJwiOTwgxfGLW3+ZX7CHXn0MbAXN03c/iT9sjiM01HDMnLlBQaxM5iS3D
	952AtFqe2VBZXs2RNFAFm9Qs9ajd1C5FMB0VL6l9POUyiMzclcqTDRHGxUDcx3DFzToPSAria/OSP
	+caPqUJFnpL60J3TZ2yH0gDb451im4ygPliAAZXDJZ9Uz2b7ICObMx3DPujRk6952lweReDWATXuK
	nbxJbLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jnN-0000000B27M-3kfD;
	Mon, 22 Sep 2025 16:53:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jnM-0000000B27D-32bi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1118601ED;
	Mon, 22 Sep 2025 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB29C4CEF0;
	Mon, 22 Sep 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758560023;
	bh=66YVdEIz0WO5xOUAZXPuRtDVfvF4ZqtngHDQvIbb4OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haa/u39eq5BLyx3UoZBQ1gg9wuP69x6DUj/rxEJE/qhGf9Fd0u5Te+KW89NvfVKBm
	 7xfdjvF2tQCp+A3hO+2oeuDpGnIsney4VEfDVvrSa2vy31p4IX9TzZnbXuTV1LMwU8
	 BeB7Eui+Noq6w7m/Qe1QZ1So3r3Tq+uGNJeMxhonPX7gduqIJRicoArwpC5BMarFk8
	 20D+1Xfc30GxQ62VETnvK4LqIUJHYja/WxJ6u7Px4dEEmrEjM+PAN9ghH0UrzdMFYs
	 YBUWsacp8SM86DyL5V89hpaoBGl8k9lmxjpu7vY3nWcJD2CwporgGCX+IRe0PkPxf4
	 k5WmcfOv5NrnQ==
Date: Mon, 22 Sep 2025 11:53:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, jesper.nilsson@axis.com,
	s.nawrocki@samsung.com, hgkim05@coasia.com, krzk+dt@kernel.org,
	bread@coasia.com, shradha.t@samsung.com, mingyoungbo@coasia.com,
	cw00.choi@samsung.com, krzk@kernel.org,
	linux-kernel@vger.kernel.org, jspark@coasia.com,
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
	limjh0823@coasia.com, smn1196@coasia.com, lightwise@coasia.com,
	devicetree@vger.kernel.org, gwk1013@coasia.com, pjsin865@coasia.com,
	lars.persson@axis.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, swathi.ks@samsung.com,
	conor+dt@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add ARTPEC-9 clock controller
Message-ID: <175856002216.463169.9530978340977850859.robh@kernel.org>
References: <20250917085005.89819-1-ravi.patel@samsung.com>
 <CGME20250917085025epcas5p229b9eba48bd93a1f059b3cc4656145bc@epcas5p2.samsung.com>
 <20250917085005.89819-2-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-2-ravi.patel@samsung.com>
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


On Wed, 17 Sep 2025 14:19:58 +0530, Ravi Patel wrote:
> From: GyoungBo Min <mingyoungbo@coasia.com>
> 
> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS0
> - CMU_FSYS1
> - CMU_IMEM
> - CMU_PERI
> 
> Signed-off-by: GyoungBo Min <mingyoungbo@coasia.com>
> Reviewed-by: Kyunghwan Kim <kenkim@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  .../bindings/clock/axis,artpec9-clock.yaml    | 232 ++++++++++++++++++
>  include/dt-bindings/clock/axis,artpec9-clk.h  | 195 +++++++++++++++
>  2 files changed, 427 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
>  create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


