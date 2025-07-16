Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D16C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOMv9U+gZm7+x1wwzDGRIybFy75nzUPgfcsvemOAtO0=; b=bH1VLR45kvTKYD59s/8gh0Kq+7
	sb1qXgxBSM+gNE3SvULTMumlBboQGBLwf4bsgevjz4Y7iSHI+jUEW0EnVQQpf3p27Si7MS4KrRNG3
	U6EsnqkVxHamc7h3ttZ3xsq8kwxCP/KhMMIafl3Z1YjKQPZoAbhR36JROANmRU8OdEp0CAkWdncni
	W+YX62rbgfmsHrSGXNuMcMiDDRAIOay/DZgiFspbtN9BST7EWqerHqa2HC5FWF+CVuu4N2+lyFQE9
	JK/dJOwO8stBI0QitWiK/QKH806Dym/axkj/XLiK5j0zs8NojQ42zptwxMv5nh00E4ml2IwEEs5Ey
	8+cdYugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxc6-00000007Bda-2Wjd;
	Wed, 16 Jul 2025 08:35:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxOc-000000079bU-3sir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D77945C5658;
	Wed, 16 Jul 2025 08:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0254BC4CEF0;
	Wed, 16 Jul 2025 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654105;
	bh=WFDobUiu1Nd43r6dikjiTbbFv38dHAAytYCHWG5v6TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDcIb0sR0K8DHNBwuF3l6zfjuhEd+srpTrUcNN5vM26ynlP8Rapji7XnX3ituaxfv
	 yhHLARSCd4vO8do4/x/xokvvPcPsagYw8XC8YZMWS86u/kZzf0uL+lS0ldVPJI9pGs
	 BcdTW0baB8Y7WwPzvSqC39dhwz6XGPDWwtwPat0/ZA2I7F6qnDMi6YLXwNp4ENPiGa
	 hzuDBsZLIr2l4AdyYD8CrCiGXzPiUI+M1r/nxsfSpG88+LwyYqN3qrn7J7b2bvBJeH
	 mfMjVJOFMAQlyeMGOHnSb9T/9y2gdK1pLfJ+CI4mc8FQ+zKbaDAdY9CfN+IWEiCBDE
	 HNp8KE63b6YwQ==
Date: Wed, 16 Jul 2025 10:21:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kevin Chen <kevin_chen@aspeedtech.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: aspeed: Add parent
 node compatibles and refine documentation
Message-ID: <20250716-spotted-spirited-axolotl-c94e0b@krzk-bin>
References: <20250715024258.2304665-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715024258.2304665-1-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_012147_001555_831DCE3E 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, Jul 15, 2025 at 10:42:58AM +0800, Ryan Chen wrote:
> - Add 'aspeed,ast2700-intc0' and 'aspeed,ast2700-intc1' compatible
> strings for parent interrupt controller nodes, in addition to the
> existing 'aspeed,ast2700-intc-ic' for child nodes.
> - Clarify the relationship and function of INTC0, INTC1, and the GIC.
> - Update and clarify documentation, block diagram, and examples
> to reflect the hierarchy and compatible usage.
> - Documentation and example refine.

So 7 lines describing obvious - what you did and three lines below
describing non-obvious, why you did it. It should be reversed.

> 
> This change allows the device tree and driver to distinguish between

Why driver needs would matter here?

> parent (top-level) and child (group) interrupt controller nodes,
> enabling more precise driver matching SOC register space allocation.

This just does not make sense. You do not change "precise driver
matching" via bindings. You fix driver. Especially that there is no
driver patch here at all and aspeed,ast2700-intc0 are totally unused!
Don't add ABI which has no users.

Again, you need to start describing the hardware and the REASONS BEHIND
from the hardware point of view. Not drivers.

This change alone based on above explanation makes no sense at all.

Best regards,
Krzysztof


