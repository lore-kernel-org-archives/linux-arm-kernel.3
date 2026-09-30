Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC12CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBwNF67IVGVLonh6bLp06bYjXyfvFFbgj27kTxohZtg=; b=zWbAExpNamQw46LUrKGcxNbRY4
	OCoqfp5xtaulCGSO40LhXsEP3pqcHzxtvdsfvY1f2M29uI78chFK5JQCwT3/gnvOzX0a13uOl3HKN
	kabnQ36w863nwNiRa61PA5gebbLl5bNNvu6pZwi2LDwPvJLjnXHrfpSqW7RRF1ua9dpaAZKrKoW+i
	bOdj+2BGSrh7rmGa93h/hlqyVcuUUTQSk6UPp8vHSwlW8or77wIhWgjhrSLz/z1wOcue3MEpYaY9C
	xsIKfSRP4OAncg20GmcOcZNhWyhe13Qy0mP9iF431NYb6RxwfKHfY7J2t09QDGTUMQVoEfTmKliCY
	48roRVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrFC-00000005gCZ-43hf;
	Wed, 30 Sep 2026 10:08:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrFC-00000005gCB-2NmH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:08:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E95C600D4;
	Wed, 30 Sep 2026 10:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741F51F000FF;
	Wed, 30 Sep 2026 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762937;
	bh=pBwNF67IVGVLonh6bLp06bYjXyfvFFbgj27kTxohZtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hZxfu/o6KtJngutnETKwZaEKPZvZmscsFdJ0RqI679tuJ3B3JqqutWA4FvU2opCri
	 ZeSGAuIgyYddWDwHdsD3E727rSlm5ZZ5rbzhUN70iDvNT387n+gi6hsSVvmmUy1fCM
	 fVUg9Fv+acBsdK5TWlZTJ5Lx4thvPUA5gKLSoLgce6XbhCff2y9LSnXiDBo/8RoMnD
	 07rlqnYShBDGMS1nIsyqnES7HC6WPp1MeE528xYhlsMPKofGxH3Obr0/2vc35Vgvjg
	 TovKlNY7qT/bVUXZE+Zv/l6qzmtHs5ahAIsBONBgPK1DYFR47ftKfexxIcTemWOqMM
	 Jp9sHmwHhEW2A==
Date: Wed, 30 Sep 2026 12:08:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: sun4i-a10-ccu: add
 Allwinner B288
Message-ID: <20260930-controversial-pastoral-raven-dd05fc@quoll>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-2-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151016.186493-2-pmazzini@gmail.com>
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

On Sun, Sep 27, 2026 at 04:10:06PM +0100, Pablo Mazzini wrote:
> The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
> Its CCU needs only the two oscillator inputs, so it fits the existing
> schema without changes.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


