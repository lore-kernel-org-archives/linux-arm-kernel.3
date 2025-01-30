Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DCAC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjmLr8zR94bEr8igAF3XkUZUxrskGAuNa6AWwxo/V8k=; b=AC+gPtCgpGwLVgeFGRstp0+Xow
	KERGK5hCDFtQbLLkxBqEdZNUDI9Aq0VPs3BMqQkQdLAV9TdbxMjWYoPXYCkDqbIIR3InO3NCpBykw
	NaEeFR70idL/rn4ZXmKPBsG19UsjHFSplCfXx2VwXyPYZz8aQinpmwD5a0xAAYsTpJf0aQbkJAz82
	y9spRbnTENcp/w2WkO5u49lEvpKhJtNtDWM88VjmdjEs3+VllA88xw2OCVEO6E2N7LbSXgjTrn3Pz
	5IoaH5tX2VFppIGuCEF2uHdfuW8LKZnHsxWE7SRDhahDvo+ZncY13/dah2v/0hm4EWPbzejpbqc0q
	j4XJ7hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde89-00000009nvm-18Ab;
	Thu, 30 Jan 2025 23:39:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde4B-00000009nOY-3Zmw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 415C05C6223;
	Thu, 30 Jan 2025 23:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F24C4CED2;
	Thu, 30 Jan 2025 23:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280123;
	bh=3E5QKtM+Za2/lQug8LrWo+EqRDLiLeUrMZcuzmk/oKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtYRywdYWsSNpJXaWTG8mUAvAOiBRUx93VNLI7UhuOEPBzvVZnDMm475DF9mjW3ib
	 PyHWO5ZpDXAI9ahc6UEdd7dKqqXhHENDgJxBrPbdiaBAzijIuj7DRNXlUJZTN52DwQ
	 1vs1L83cmukeS7DePIZjgLWlw0z/uG7tVUWrEu5R01c4+N7Fg2RL/1NIFEkAGVWIW3
	 Ly4okGK74T8CdAZXEoGMGOPLWW1Eyj/ksdGqBdhHm7/Ntg1MYVBpLetqGUC4AWXATW
	 YAlnLvt7m09keEzGJyD9MO19FMV8jJKcbv+ESVnVHo2YZG47IKv++dkMx/xck/t6Ly
	 WZupjL6WsE+vQ==
Date: Thu, 30 Jan 2025 17:35:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 04/16] dt-bindings: power: reset: atmel,sama5d2-shdwc:
 Add microchip,sama7d65-shdwc
Message-ID: <173828012142.1872155.6486603054756934476.robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <1e04bd9b667d2831be3c7f6dc6f3d23f07a7d8e6.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e04bd9b667d2831be3c7f6dc6f3d23f07a7d8e6.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153523_934978_580BC21F 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 30 Jan 2025 10:33:44 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 SHDWC compatible to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


