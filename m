Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D1C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkDwtO+8ysrel5k+/9Uyj+6KcXgV9vYlda/uGjhnKGw=; b=jU0c5Z3znCcbyfpI/TAYZ4zylM
	2fpNvDTXvvjCHJQcIpFq4OVziaYGVFUhoStXKJGUf0jlvWw2Wb9I/MvOWds9nOGLgTdgucGrEj7fM
	6JDMgj+h3tLZNzY+JqrbPY8eWV9cc/D3gm1lFoXUJv7NWjDdbikkOJBj/UJs+dSWvu5cDBguh5La1
	Bf4kdpy2Q2vn14T5WJ/xoLIL51uqdpPr3B4grk8l/uBQX6hEx41EXI3TQnlUgMNtgQh2zXt8ggfGV
	O00gnic5h+29YNUxvkVk4Wr1obyBFgMt2gvgPvk3c3EDANil5FfuwzSudTYnw4yZ9+jBteTTmths7
	W0aIEEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEwH-0000000EDsP-41Lb;
	Fri, 24 Jan 2025 08:21:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEuw-0000000EDhH-0qRA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 283D65C48D5;
	Fri, 24 Jan 2025 08:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA8FC4CEDD;
	Fri, 24 Jan 2025 08:19:51 +0000 (UTC)
Date: Fri, 24 Jan 2025 09:19:49 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
Message-ID: <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_001954_283216_510D9316 
X-CRM114-Status: GOOD (  10.12  )
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

On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
> register in the wkup-conf register space of am62a and am62p. This
> register controls DDR power management.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


