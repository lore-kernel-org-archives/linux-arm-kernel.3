Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5297BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+VB197PtIxFgnkx8AnZlu6I8mbLOZPVuJL3KVpfT9U=; b=z3Yepfb/nKQQ/DR0BD48FjKm1u
	+AcWwl1MN0GPeS2Tr5E8VXjEtLvnjTZn6e0ccJL3cSoXt6OZCzU5ICAnfeTNRQZoFfE4eHZz4CskO
	j9HvfYca/X5Mzg7oxFjcAFfm368ar4Nlnqp757QvGzFeSoO9O/p5NR1/E5cOoL1+amwhixurA1Vut
	u+UD1FTlvKyWQrVBL9TaHGlt9TUdZMXVNwmZ0aYkpMS/l8JUaE48YgofDnPjcEQ5eaZr7Nt0jPYQh
	c9lQJgxzVVzO0PVjI5m/hLA8BLomiZbi3sln5w95M8o1XoiayCh3oiIlDSjJ1mnbU5UFjMlv0MDz2
	QVYz8zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVA1-0000000ANgD-3mAR;
	Thu, 13 Feb 2025 09:05:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV4V-0000000AMYZ-1KQz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F7F45C4B09;
	Thu, 13 Feb 2025 08:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6283C4CEE2;
	Thu, 13 Feb 2025 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739437186;
	bh=HtS9SMt+0MPO7eISiOD7sGZONSitaIQg3tVcG7gVoH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzxvSXAg1ue2/+iuo1Xs+759D/A1NmSuaCCLotOOa0xh+7UJLGIK5PPKCIzQII+ra
	 4LyExYHm5c+g9+m6KROUOfXV+sw7wx57EfU3LaMHQXXxi8nqbPeZF695e4nqmIaDEk
	 fu8JL/euV8YMuISDiPJ4FfLrmmBrg7l79NkTTt5VsSh51QkP4yr18JUDvHsQZEs7uH
	 ADit+sj+ZFG+0EgHURmu5oDswtIesoDUaTdDZn0U+xQNYQFrfVx0F3V+k0s50erb6X
	 sorUyCpNHL6Bm/009CD/98x9VfWWlWZ1D0eZjUUbo46MHeQBfkARhikgREn56FLl6X
	 v0V/xK6SZrgRQ==
Date: Thu, 13 Feb 2025 09:59:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 10/10] arm64: dts: st: add stm32mp215f-dk board support
Message-ID: <20250213-unyielding-accelerated-moose-9faba6@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-10-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-10-e8ef1e666c5e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_005947_405895_27D80AF9 
X-CRM114-Status: UNSURE (   8.40  )
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

On Mon, Feb 10, 2025 at 04:21:04PM +0100, Amelie Delaunay wrote:
> Add STM32MP215F Discovery Kit board support. It embeds a STM32MP235FAN SoC,
> with 2GB of LPDDR4, 1*USB2 peripheral bus powered typeC, 1*ETH, wifi/BT
> combo, LCD 18bit connector, CSI camera connector, ...
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/Makefile           |  1 +
>  arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 49 +++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


