Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07A7C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKukvJB2eBCO+qqOidiBEIYr2+eN8PlVoI4XV7IFQ6Q=; b=5AHtu7FvRivJqW2Ty1RA2tBeNU
	HeZI6WpFhrZBbfhKoZBXK6o05JHwNV3edoBB5X40W1AyXyeCjTIY7Qskm+7R1GZ/6z3AGz2bkl5O2
	GLcs5Z09DRGXJfusBY6zprqvnyQgxSrsN0LNZEUI/ehcxpYgOmPjNxgYNdG5tIa+xVibDw9zEF+5r
	ijjYB8efxjackzSm662Jn+mg2moO+lLbJ5gq/Jkr0httybkJ+YGqPhIO5T6Ih9wV9lB6Iy9aWHOcY
	czxFIsRH1Xh9s7Q6Y/ZXHht325rf8IaTRuD4OSsOddaIpVI/bgH/mqKVenvRwMkJkTEWsxabTmQ3L
	QyBzLhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkbb-00000007R9n-0Wtf;
	Wed, 05 Mar 2025 08:59:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjNj-00000007GP2-0NtH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F09365C4D9B;
	Wed,  5 Mar 2025 07:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996FFC4CEE2;
	Wed,  5 Mar 2025 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741160488;
	bh=UuyCdAeL82f1TOp2yggcFOeln/rSj3JTG5r77qmxK/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeInuU8ERkePr17howrYPFxignmA/MsTwZ4u8d9jO1tVpwezDDFSoQZpIOA/TgDgk
	 P+9yMOtNFsBwaqdPYdHA40mfnQnjnKTyeWyIS9bj+prPV2FNUkzV+3mT0bVEk64rHK
	 uaRo8YUBglpG2OgVqzUvRI4Hvto8dpVi9qZMs643jj2Nea56dwhBh+F4kq+fo4u/k1
	 ZAiyYYuwHNk2nw5hZUxIFDWNSP2HrjIfLGzmqt5o/mNBJF8U/QGTbO40M8/MiBVcJU
	 +beHC6obrfIQlYHfbIM+dKzKR0SMiyXWM9kD6o+V9muHhkLOHPjZlYMbXABIi2aHcJ
	 1nwB7/ID7D3LQ==
Date: Wed, 5 Mar 2025 08:41:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/15] dt-bindings: arm: sunxi: Add new board names
 for A523 generation
Message-ID: <20250305-gigantic-dinosaur-of-perspective-c3acad@krzk-bin>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304222309.29385-11-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_234131_182722_7DE79DA7 
X-CRM114-Status: GOOD (  10.81  )
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

On Tue, Mar 04, 2025 at 10:23:04PM +0000, Andre Przywara wrote:
> The new Allwinner A523 SoC family comes in different packages, though
> they all share the same die, and so the devicetree bindings.
> 
> Add three board names that use a version from this SoC family:
> - The Avaota A1: an Open Source hardware router board.
> - The Radxa Cubie A5E: a typical development board
> - The X96QPro+: a TV box
> 
> Add their compatible name to the list.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


