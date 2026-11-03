Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F396606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HojHSrdP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlvZnhnR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7H1RDtJDysjjwJhjmvJC02gigYRM/VOFCjnNa1uDYbQ=; b=HojHSrdPy3x1px
	aDCjhMYnaDIIyd5ItgI3qOYy3Shs9g0DsYbFuFu8lapYviyMXmdQWTZyHzvB+CaQul3wCgYKEBvkJ
	+z07TX8Unj899qM/N20zjf0UwlOo8aHitGE62Yvgav879nGfooQO2VTWDJOVBqsz6rlaUvF7V1ppj
	Ii5wOGYAevOcorac3nIceuo6sX4OXR3rTZZgB+5lEvQkpZXer8jt2V/0PnjdQ7Ud25Sl+i95o+3xz
	bpQf6QGPOZTxFcBsiX5SL1+PiEX9aIh0GWRm+UA+/dRBj/lYFEE9SbOBXkH2+8JECACU2LyahfdDM
	VfgFEhbmGTrmFaohfbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKhT-00000003asP-0P5z;
	Tue, 03 Nov 2026 20:01:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKhR-00000003asD-1tqG;
	Tue, 03 Nov 2026 20:01:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7E84601EF;
	Tue,  3 Nov 2026 20:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81CF1F000C1;
	Tue,  3 Nov 2026 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736100;
	bh=7H1RDtJDysjjwJhjmvJC02gigYRM/VOFCjnNa1uDYbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZlvZnhnRmewFgvwIRJro08JNu0WSP6OzJkDcGl3OzqTNu5KNxytSxbN9oDpjfiZe5
	 /NNxGXtgpOOX1tt2yLiI7Ixx2n1yVsiOHZY+Kgiplx97WvnrCBQiPrSoueOnqD8NiO
	 pVYXFOiOD0s7RkRg64ebbKucvcXB1MThbX5vnwtSd+eAy1gPkz79BC9Hw2LTJ+avcH
	 biDxQgSuLFMdxXFQ0iWWv2ZyloixiIZ0IEtF/6Xs0mV8TOK3F4Bjm6ensswYNztnYf
	 FFbbv9jheckLXMD1xwof6CwCWkM38zlJKXO/8DT6oDJabdv0PIWKryqhIoRT10NSVN
	 EAHeoLZ26BCKw==
Message-ID: <1583a8a1-c039-4c8d-8607-7bff0b284048@kernel.org>
Date: Wed, 4 Nov 2026 05:01:35 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] reset: k210: Use regmap_test_bits in k210_rst_status
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
 <20261103-reset-regmap-test-bits-v1-3-1b33607a76b0@pengutronix.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20261103-reset-regmap-test-bits-v1-3-1b33607a76b0@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 23:51, Philipp Zabel wrote:
> Simplify k210_rst_status() by using regmap_test_bits().
> Now returns 1 if asserted for all bits.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

