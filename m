Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2717C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QYc+icIXC6DdJXTuoudaNeNquIBqTBmXXDcrMcfjKM=; b=V10F9vXjO8XxkvSUQYm69hR5Kf
	OnzP93Oi9cb/VEvkaq4kRWo9Pna8GFZAF9PkLrjwzA70DV9iezfnXUwpws/5phNgXwFAH2mZxFV5H
	nuK0hvUd2ag+ZeOx61rk3Ded/hCDWO0o2mNT28Ysmaa3KAu79OAvStENoNlKTy1jTm/Jd0E+6LL3n
	KADD9xkvsjeQwYwdIK6Db27+3V4QK4mL7MLGIzXDjxdyXyQhGY/BOsQESDHrDHKoa7/7xPeMWxahC
	ph8dHoSLP3UXLJ/HDieHO6OHoduPo9urQp0w7SJAqFM9970OB+G1vFEuvTDTn/mZsHbgSeh2BxDHF
	fTVAeYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LSz-0000000BVqe-28oM;
	Tue, 01 Sep 2026 10:11:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LSy-0000000BVqT-2728
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:11:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3712A41FEC;
	Tue,  1 Sep 2026 10:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61B31F000E9;
	Tue,  1 Sep 2026 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257503;
	bh=8QYc+icIXC6DdJXTuoudaNeNquIBqTBmXXDcrMcfjKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FZ7DKvasLbUvU1k9TAMmcwPqoOjlZ8mzOtdBhQhFzCSgdsZ62kEXd3kCqL4mR1itQ
	 cvahE14ttlv5z/E5LpOyoiXS/U1An3wqM8pyfjUEUnmH+fj3Vh0qYaUxEgus4uftsG
	 xqJDee+SScVBmYNvuBTb/2sb5Ds2vuBAyoZ6Q7KZGQ6UGlYK+CZ12Uf2hqf2X2f9Q7
	 T4TgUnAF4yzOS7leg/eDl5qkMX0sEbISCwhTOORTVm4PUUTSoPyM/vJXMyWbdvbPTT
	 Z6bT7Encsr948r7HNFYb6kxzr6P476RGKmTTFFmbQy87ZvHSmj8e4J1Dst+bwRq43j
	 ka5QyJKmCiwyA==
Date: Tue, 1 Sep 2026 12:11:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: generic-ohci: Document ST
 STM32MP2 SoC compatibles
Message-ID: <20260901-robust-dove-of-enthusiasm-8c3268@quoll>
References: <20260831231814.137120-1-marex@nabladev.com>
 <20260831231814.137120-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831231814.137120-2-marex@nabladev.com>
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

On Tue, Sep 01, 2026 at 01:17:32AM +0200, Marek Vasut wrote:
> Document SoC compatibles for ST STM32MP23xx and STM32MP25xx series of
> SoC, so they can be used as more accurate compatible in SoC DTSI. The
> SoC uses access controllers, therefore document access-controllers DT
> property. For details, see access-controllers/access-controllers.yaml.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V4: New patch
> V5: - Fix typo, clocs -> clocks
>     - List clocks entries as list of description:
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


