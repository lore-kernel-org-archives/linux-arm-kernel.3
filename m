Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A3CCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1gIffdK9o3coHibHNHj3tZa0EFqFikCeK79HR+JBPM=; b=MsmiI+cpDohpflml8uNDimsXL0
	5Q1mTFPg/I/89s7bWxoHpTYNBpj5LSA3ZA3MUey9wH/MO6vvzfYgrY9PKakw1FufMA44VE/zqhZLc
	QNO+NLPl46MXTxPoTg1TUemye89ugjiP3V8ZILJrZS8LbokmMwhj1/YOsCies02XJ4+ia9Ur5zpyY
	qCetPPE51vX6P0jt3K9tKgAjeuSgQ/tnEijaIYniG9b38O9ogX1w2IxEebgr8FpeSCWTIJ2hQFWCn
	YfYCvIKFHYD+Lt8R9PKQlQ3/ygI5gZriSU29QT/5BFtJp703twfnZ+rUOtvW3fYBrctcvJ66IbGKZ
	gNDhGEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkSX-00000003OUB-0dbg;
	Fri, 16 Oct 2026 16:07:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkSV-00000003OTD-2Xwf;
	Fri, 16 Oct 2026 16:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O1gIffdK9o3coHibHNHj3tZa0EFqFikCeK79HR+JBPM=; b=UetgYUYguZwqL6y5lVO9FfoZ31
	qlC4QYwXUoqRFCsZabvNaKEUW3zQ6FPuJarI8s+AMxQKdljTieivb3e/QJjClWAVRYkBKztzaewEQ
	KmrNPZ6dh0HBoEQLrfzDUIbMzngGj6V2dhEObSIvYUI6PIBYTxXtkCwpuzxWxtaMfzS66+KINyaBz
	+f9BiT7WsOwyfnmts7qD4Vo07A16L/BDHr0hRRJsvaLBopF6viZtU4MMACQZdnO3lKsM0W5hJE1zD
	l009ndg2L/zm9m/GoFPCBVOGNomgqAO4Qua1uNjIJdJCMUQbdwDVO5QcuEpMoQG7/d3lmsV05cgZg
	Xka87f9w==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHkST-00000001iBM-0BEm;
	Fri, 16 Oct 2026 16:07:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkSL-0000000086k-1X6n;
	Fri, 16 Oct 2026 16:06:53 +0000
Date: Fri, 16 Oct 2026 17:06:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: add ISP nodes to rk3588
Message-ID: <atJLmq50uRVfeuyX@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_170701_130269_9515A628 
X-CRM114-Status: GOOD (  12.21  )
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

On Thu, Aug 27, 2026 at 07:48:34PM +0900, Paul Elder wrote:
> From: Xu Hongfei <xuhf@rock-chips.com>
>
> Add device tree nodes for the ISP and their iommus on the RK3588.
[...]
> +	isp0: isp@fdcb0000 {
> +		compatible = "rockchip,rk3588-isp";
> +		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
> +		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp_irq", "mi_irq";

Three interrupts with two names, while the binding in patch 4 has
maxItems: 2 and isp1 below lists two, so dtbs_check rejects isp0. If
134 is the MIPI line it needs a name and an entry in the binding (the
RV1126 has that third line and the driver can use it for the CSI-2
receiver errors); otherwise drop it.

Best regards,
Daniel

