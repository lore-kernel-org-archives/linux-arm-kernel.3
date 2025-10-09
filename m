Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C94CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhCgwgYoP5nG+eUGg9pcsQuCDZDgiBr7kJ4KDHN0k90=; b=06xRoVZbMaeocnjopREID11a6v
	KfI3qcUxxEHgvnVTKkCzl/tvETqSi6Blei4G+K6URk5sMmzh4kPEge5TVR0xNtSJIvKprvVIKb67M
	wtupuIAL9kPRzm63tNRDtO1bJ4J9IjsbaoGfMkIFATB6Ma4zeaROjePBNh2HVSq0dKXuMWJ5QQyW+
	4RzKfjfi2j3v58cnLWfET1suq2xKNSMXTPC6hvi9g8NDz8krukk4W9OUpF0qt9b6Ypr3p3mA5hiQq
	cVz+ykXs/0l6gnqN8bfIeDgH+T/TltFrKGqK+Ish5gJbXGDJyDY3yhAOTWz7S7mt3bKkSOhB74xrd
	0NegGKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v02-00000006sEa-1BKk;
	Thu, 09 Oct 2025 18:04:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v00-00000006sDZ-0zED;
	Thu, 09 Oct 2025 18:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 641C740170;
	Thu,  9 Oct 2025 18:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2540C4CEE7;
	Thu,  9 Oct 2025 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033059;
	bh=K+hPseUknflSy4hygWFCRuB5yq+mdBnazdt9i44bmg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owltrz/GJxZu1UAvwCW/COWHnZAzwxKes5ADduozJqQwtIWbQfzeUUSGQNBY9PTvv
	 D3t23hfmu6nKLeOFLzmiJ1ep4DmWqsT0wAKZk7BwCGttUtZ9RVy8cUvORNrDzbUQAQ
	 kbu0IEyrSU2iaf8cvC41vbL1sJt2zYesbuG+qN4Ye7few39gDSPE98XjjliI7Lt6Gp
	 CSlAZpLhBa1P89chi91jqDURIv8fOpIyOgELRoKRlVNjB0jCC2P/FPSsJVaiX5DK/t
	 0gPtRS4FxCMopn472srDZBzg4vQaf1nMMAQpZe1wP80U8vHhchM5WxKMXaeCsQL4an
	 wbfCcpPQD4yTw==
Date: Thu, 9 Oct 2025 13:04:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/19] dt-bindings: clock: Add Amlogic A4 peripherals
 clock controller
Message-ID: <176003305705.2941216.8177451888000768294.robh@kernel.org>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
 <20250930-a4_a5_add_clock_driver-v1-3-a9acf7951589@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-3-a9acf7951589@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_110420_292796_A200FC7F 
X-CRM114-Status: UNSURE (   8.00  )
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


On Tue, 30 Sep 2025 17:37:16 +0800, Chuan Liu wrote:
> Add the peripherals clock controller dt-bindings for the Amlogic A4
> SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../clock/amlogic,a4-peripherals-clkc.yaml         | 122 +++++++++++++++++++
>  .../clock/amlogic,a4-peripherals-clkc.h            | 129 +++++++++++++++++++++
>  2 files changed, 251 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


