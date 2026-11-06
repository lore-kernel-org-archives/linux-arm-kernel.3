Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EC7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=39tVE4ws;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9L+w4Jw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HCgag2Z7bBQB20jwuxyYaKHOlG23BLLiKfiDNoXW0NU=; b=39tVE4wsQs8+c16XtimrAiW0aM
	MIjAqGojZHYfdcABXd/T4oJpVz42ZLaq6gNbykNPuIrayixKI7bLveSPjAYYOU1F7lBy0gxc+RmqH
	OCo4RkEp5pmiycY2GnBrMTVN0GBUkDgOP8xL4yqKrPa+1HSB0qXTXt0s97l6ToHii5CC6GWrL48DT
	7qxwWQ9H3vYkyv6t1yxG2RVeGropxRsWbZ3uSQmjChzmIGzPqXY+T7pNcgoivSvwc1WbE8xAaeOuy
	+ogw55i0NpqS2Glydy2/Aw+Qti8ZqNk7Imnye5NwlcIDuSCQMFKl/SjVt6pnrupE9IgkEce/k5FeU
	dnKSZhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFAP-0000000BXGh-1LBD;
	Fri, 06 Nov 2026 08:19:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFAN-0000000BXGX-24SU;
	Fri, 06 Nov 2026 08:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E87BC4142F;
	Fri,  6 Nov 2026 08:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295561F0089F;
	Fri,  6 Nov 2026 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793953158;
	bh=HCgag2Z7bBQB20jwuxyYaKHOlG23BLLiKfiDNoXW0NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9L+w4JwTo3DlQ/DiUpLeG/F+/3PMGfxKf+cVssmryL365e3yme/kMXMH1gtSJzgH
	 Z8ieCyRotm3HSx5uje7KDgs2Zq9BOwXLae51mimR7Gi94aZtVXQA9QFdXeP9QbhXib
	 6FJ6WAhWhayBN0WlNrWNNctuhfXGhEeriw/IooSXw5hGN2UiQWyYjyZp0B1vn4zt5t
	 Pq+Q/0qqsXeonXj2ehTWPs25HSEsWromhWWlkTdgTwqbarNzMhUS2MH5trgGnHJ3dT
	 Jt5tWJZWpVX08rBuvF89JYrH0i4yqjnr7VZLnrlC66NU3aHtX9b07y3eId5w5uasP3
	 ks0atxnzcHevQ==
Date: Fri, 6 Nov 2026 09:19:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
Message-ID: <20261106-crystal-flat-caracara-ac1b3c@quoll>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:55:36AM -0700, James Hilliard wrote:
> The H616 NAND controller needs its AHB reset to stop internal DMA and

So was the device working or not? Be explicit, because this is an ABI
break.

Best regards,
Krzysztof


