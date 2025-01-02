Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA724E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR/RpT36Ih+eVrnuPi1KDz+SmK++oF5GXwYcgzPMGpw=; b=2KXOLz1RNP31Pgd85bj7qHqi8y
	lXoBxXsa4TC7TYMbEAm/bSbMjbL+3PG62/bR0zmWoXK1ToqeOtA7V537FG1VxfhPLuNYcbcKz8gKh
	MJvlQIaJ3ZbThuAfPizbJfC913lbB0L/iq4GZxS8qv9zkou6N7edczx+kfsr27nBSTLsZhVn5xMrT
	gb3LkWbn6aU7c/QNOXrHx0pCs5ZeJhp6wglYf1/9OoUXavuDwhuoLazFq155nvSgLLJMv/W7vR+lj
	lj8KnG/Wio8XsIhCV3Nwov52Rzz+AawaYTaDpxtbT162R9upHnIRAASAUVNzGZ0B4pbWQK4sY4YVR
	gR7/PvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGXn-00000009vg4-3lvA;
	Thu, 02 Jan 2025 08:27:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGWb-00000009vXb-1Qkf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 08:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56CF8A40EF1;
	Thu,  2 Jan 2025 08:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A1C4CED0;
	Thu,  2 Jan 2025 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735806348;
	bh=zqtih7F5QTw8cdGtFnNIYjYSoyZ5b/s0GMAq8CTYW9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvdVGpThiWus2lbx6a4iHGNPtvkye3FNK4O2wf3cIB3+QXJUVtpBYAal+9h8CM92K
	 7Y72IjDFsnBJkJ6iArmhdE7TAC/meveP97aIr0BP9T8GPwXmHjOOQKmwNrScHijLWn
	 1H6sDnFQfy3kwNsmUREiSp+Rmd8Cc06pU9/1u0sqooo2yWlb2CqpPJL8A75XY8oIt5
	 oDJW2TE8v9PsDqF3/cJI8CO6HcUNlyndaGLh+4r8B0M10Wn8WK2wo6gHqz6DmA3kmd
	 PkfHPCwZLsMSnuy1+/ebxNxFX164HG3z0jTZfXIfgsBgZ1eH/fSsqRHvMsxIFk/qt1
	 WA6npbXDYN0kg==
Date: Thu, 2 Jan 2025 09:25:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: st,stm32mp1-rcc: fix reference
 paths
Message-ID: <dphltmk47oticmxe6cd2ozcnmhdq6m4mgjybc3dyyqiyiemaxd@q63eeuu7rwnn>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_002549_470898_305AF793 
X-CRM114-Status: GOOD (  12.63  )
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

On Tue, Dec 31, 2024 at 04:01:40PM +0100, Dario Binacchi wrote:
> The path of the two files was wrong even at the time they were added.
> Let's fix them so they can be correctly referenced.
> 
> Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
> Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


