Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BEECD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW3QyLAroMbA1DKyMpTY9HlU1YYW78GL50jPWg3Tu54=; b=thDjkm5PDx71sL4ZExFEii10N5
	j9a+jVFifx62XJXwsnp+e+FAMMTsguWPc/8PFetAcLe0JOvcZVeyYwZ5R0VxZiCt8cyNLTmux1TMj
	4DVLNAeYIyDdSkh0Hu4JgYnDwbJ4vZjDfBxUpNixlI9cf4ZHJdL0Ss//kGBCgrkNImjRDVPbujL7p
	Bf9HsO1TLEw+6nFDY8SNwP8RueGDr7iWwzpiIrkJLiO77av6CzVxc/pPTMgzGQbErzd9YiLGGCF0T
	p+dGa5HsiHm/PZ99VtA47HTvuZnwcutvjHp8i8eMfq/MjhlHASAExpZn2xfWY53hlVIFrMbRvBK8U
	lUm5aqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn2L-0000000GzLo-1TsC;
	Wed, 17 Jun 2026 09:58:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn2K-0000000GzLi-3FL6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:58:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D90D4600AB;
	Wed, 17 Jun 2026 09:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952DA1F000E9;
	Wed, 17 Jun 2026 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690299;
	bh=gW3QyLAroMbA1DKyMpTY9HlU1YYW78GL50jPWg3Tu54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jxiyCdpL1HTwvLnSLKW1WWsIoioRWPMRXkFlzBDQPKCrSz0If233ABjtCTtqSKGAc
	 WtsEP/k9hvSVI8mf4D/aXGq2bI726yavwjotWIKzlArQoXMaKtT/7+th+n8Cqo8ndJ
	 oQ9gnsWo3wxPmvj9yvFlHulm/kImjISlyil6KLt7SXq2KHL3l/gKXHZoP25OzJ0Cm1
	 hO1l4OR8zjjQJmrg2QLJgZf6PhzCNuuLpr2RttvIMrADKrIwXxM2tnZWwhgcwheKGc
	 xr3PEvgHDebC3v1gE5Z4tE527fPfN5ZXerLrcu0fbEIWODgV5dpPJMNWJUWKRnOhVF
	 pHPfmOVqCrERw==
Date: Wed, 17 Jun 2026 11:58:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 resend 3/5] dt-bindings: clock: cix,sky1-audss-clock:
 add audss clock controller
Message-ID: <20260617-delicate-comical-chihuahua-68eadf@quoll>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
 <20260617064100.1504617-4-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617064100.1504617-4-joakim.zhang@cixtech.com>
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

On Wed, Jun 17, 2026 at 02:40:58PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The AUDSS CRU contains an internal clock tree of muxes, dividers and
> gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider is
> a child node of the cix,sky1-audss-system-control syscon and accesses
> registers through the parent MMIO region.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


