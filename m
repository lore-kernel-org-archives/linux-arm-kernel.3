Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C78105F7A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3KwBp4mLjHSqaiLdffaj0I15a/SJoRKUcPcUUzGq6k=; b=B0xt2sopOEoZBq0KjJK+7wWhfW
	fSmrXRBkffnsORNwzsQmgpHl8j+X40OtStn+E/AvfWe8nmQ8MXO9COhfJ82QyetgTCXUJIIVF4dQ4
	QEHFZNlKtyswiQ94igEcwCNZCI9HUDqCJgnIZCmJ+0Qq/vijPApA0ZTBs/JXv1gnklqJE1t5jJKzp
	5tQtH8Xl1OO+VWj25fwnnlwb5Gwv7lSfRC429LmUuXdVpNT9pS46RADVF+LeN2at/LSkwGgqiaIMM
	a+so2UHeO1QxlrDNGD3O9RCZTLSIVmh2gtllVQ0N+OmK46fM1TRFB4wuJA5pcYAbeSs15oYrM8yYT
	QWxvxraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12KP-00000000Bzp-2VBq;
	Fri, 13 Mar 2026 13:13:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12KM-00000000Bz3-1MBD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C038E40A3F;
	Fri, 13 Mar 2026 13:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191D8C19421;
	Fri, 13 Mar 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773407596;
	bh=xPo27vZQHa0VeHvoMBo74iwsNctKnm9rabgW9XwYVLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACiGhfKv9t/rD8sS2RO+9g8GTBcDunz8x0Ns2ztzualQDiIVtrVeqf23WQWpP4ggC
	 HXiXRJ+ANzqK7n56ITmhjWoL9qAFW/4hdJqfXgENa37HtazsFyefWxQw20rgpXRw/A
	 6kmj2h9WDLC5V07NYTY3xxFvCaQU94OWfzEcDlecSJr5DaTKDulVp+3o9eWtuOuTZ2
	 btcq+PUzoDu4I6b94Z4Lu8WMYe9b0XOx58/nTxGfrQ3hu7eus5BtZRwh1sVNSzr9CA
	 C7CjYSmF18DkzgbvZ3mp3HFniDEWIFEOX59ggtBwaSDtZG0fp0MjIYu1Lu+0MXrq3c
	 NLbOmxTnCAfKw==
Date: Fri, 13 Mar 2026 14:13:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
Message-ID: <20260313-quantum-modest-prawn-896bde@quoll>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061318_378932_974F6BDA 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (TI) wrote:
> If memory-region is used, require memory-region-names.

Why?

I don't understand also why this is a separate change, but maybe answer
to "Why are you doing it" would cover it as well.

> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Best regards,
Krzysztof


