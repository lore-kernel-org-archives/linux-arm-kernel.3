Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536FCC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs9PflGi/Ubz7dmV9v89iDcbyzTmgAVgqYdP1EZ4A1U=; b=jXDEiao5a5OOYmrdmr1mPu01WB
	hu6xHNUDzWj5UbsVLes7Mgx3DCocd2Z+hxkVSZrK2FalgDcxlpyoqdXYnkQ0kDpbM8utBNkv89FxP
	s2xVtUUYScQQHYK+nbu//wPFsdTEdfeuC3+pV9e9zToXeGRzBEuo8kf/pY4PvKc6EnfEVQgjlyugC
	topA3oo5ZqN+qb+OmpKMxLftumQrmojP9QQhm3eao0OrSub+A+i1Mr+Pnh4jDCH8SKRzu6iL2lmXU
	vVnukaNgmoiQcQ+iZ7oYuBm+4DTCClRlZUHApftP4WvnjoJh7BsrvbPS1JwLnpNdcU0APbMTuBWoz
	OAxV3E0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvDH-0000000HWjm-3Urk;
	Thu, 08 May 2025 06:58:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv7K-0000000HW49-1NaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86CEBA4D9E4;
	Thu,  8 May 2025 06:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBE6C4CEEB;
	Thu,  8 May 2025 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746687145;
	bh=tecbk3ac3kzS2flvcrppX2MqqPsn+j7M/ac16YLakR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTV1rZSuPPwkbhR8m+X3vtJqwr+OJ2p8ManFhj0/2KhA9YwFLEyv6kqG60V75Sptm
	 WbcUr0Cv7XZvDOQqHl0O7vh8/Vx4uFqjWDfMZQszNF4w6MIY9pBOydIbKz6M38lH+I
	 uUYeKba8PCDkW+wmSfgqQxVq/YG5EBHPaZPnJ1++m1mjdzxvKFRcnRAc4a6d5w6rEH
	 K8Gw2XR+rw169Wqvj3xXNhZgS867Ayom+YElg7bskbT7nmiVfvD7m1A5psQ081xL9R
	 eHZQjba1O8+7zNpvBfc2putL22EbnKmx6y2oBCo/bhcP/YpC5SPvHodNVGI/xTjxLT
	 kTz58a4DeVyOg==
Date: Thu, 8 May 2025 08:52:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250508-illegal-caracara-from-hyperborea-b77eda@kuoka>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_235226_432700_4AA9BDD1 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 07, 2025 at 10:09:20PM GMT, Bryan Brattlof wrote:
> +
> +	uart6: serial@2860000 {
> +		compatible = "ti,am64-uart", "ti,am654-uart";
> +		reg = <0x00 0x02860000 0x00 0x100>;
> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&scmi_pds 82>;
> +		clocks = <&scmi_clk 322>;
> +		clock-names = "fclk";
> +		status = "disabled";
> +	};
> +
> +	conf: syscon@9000000 {
> +		compatible = "syscon", "simple-mfd";

Not much improved here. You cannot have such compatibles alone and the
bindings test this.

Are you sure you tested this?

Best regards,
Krzysztof


