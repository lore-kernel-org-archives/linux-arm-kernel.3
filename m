Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564A7D3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVAJxTqpNuloUULjNA1PR3lFJMzzq7VCJx05EUHHtR4=; b=1JGY1FQsr2Y2D+BEBSpKAud73x
	lNslAKCpkHFN4jXqCvDlpY37FlFqrl7g6L55XF56tlBlf9a6qhakG42MtyybeCk3EGvoShS0kSCp/
	C1o07kof47OfPMgitb+OkY8VF4Gr4wpI8F6s+ZCDwqmo6cOMwKG6/Y3NJkfp5sXlmwpyzk6kJREt1
	y5+xFk66QyxCPg5Yrx4NJ7Z3gi4tCwhslVnyUBMm10tAaJfHsJ2eCMtdlN/3ScdoMXqvdm7JRAPa0
	kN9b7E1PV4s9HCBZWSMaEqf38MvPCX+2HWGQl7fUZjKO9p5NHK9Gd9N19jtiNuTDhNFy+X+sw7QL5
	RgiDMVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixqV-00000007TI8-16Ie;
	Thu, 22 Jan 2026 16:47:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixqS-00000007THg-1iYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83545435D4;
	Thu, 22 Jan 2026 16:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B92DC116C6;
	Thu, 22 Jan 2026 16:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769100463;
	bh=zcHw/TaRrxQh9eXMsWaG6RiuL1KfhRy0hxOrWx1EQMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EaCLPUB5VgPg9SMsF6yGmJDYBCSWS9ojx9wg3XfN96JGkXOJgZuHYul9tmtsFppLi
	 9rwSlHSQ/lu+GcwlbHGD2vvl5NCl5QyOn3XJUHcwiF7q7KjE11iHwmkv1tVZfZ7ghm
	 +7SgA4iI42qBatV7mR0xycth2R+Eb6TbXh3LKkO4hRovKDwSKhGk3gs1YlcZlUDUzz
	 3ku8r4UOnhyNW0MzL59GkGdH3P1PAy+A0OQkvGDtQhzn180QV7xED2BuBMQpUjJIg1
	 bv5BobUCsHW8h8ktbTF4oiqHFGjes83HG9KWbQMB54ne1LFKD48rmKQfpnmexZoEuA
	 k8TilJnIv1OiA==
Date: Thu, 22 Jan 2026 10:47:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 19/19] dt-bindings: clock: at91: Remove old PMC
 definitions
Message-ID: <176910046191.2558971.11925829281212477545.robh@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-13-ada@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120154502.1280938-13-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_084744_489622_02E046D8 
X-CRM114-Status: UNSURE (   9.39  )
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


On Tue, 20 Jan 2026 16:44:53 +0100, Alexander Dahl wrote:
> Those were split up per SoC and are not used anymore.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v3:
>     - new patch, not present in v2
> 
>  include/dt-bindings/clock/at91.h | 32 --------------------------------
>  1 file changed, 32 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


