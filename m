Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D7DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKWRECmREI+SdvyLdZ4qQ8yMF8XhlV4A7gQQvx8+P/M=; b=PpBFOUoTQJeod4UhPdpmj/23aC
	fIuQX3YiBq+b1pu1p8k9hx0tnTUIsOfC08GsmiOCob8QJBSX0/OWXCzqY+CkrrJG6Gh7ibOuDlpEd
	JquUHxumnLyOW17ERktT8/C+o5Z/x6LTRTRQBExAcm3ZezP03YjaXJYxUtcBZ8S4NSn08zEpqFlNr
	kaf0u96tUYUOkO1oozBVrBGL8y2/8VwbTKf7qu8G1+pDZbr4k2j5vBjdGydyf+rHrGKwVQi10mtOD
	rlfBJlu5wAaowMXRis6qiky0Kz2dgtZ7GLWerlO1NsgvecB0yTxS3/LGfHhuv8IGmc6cNzVgpKU9J
	hNL58jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGKY-0000000Fp7C-0DEY;
	Fri, 27 Jun 2025 21:09:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGIE-0000000FoxT-1J3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6A625C5BFB;
	Fri, 27 Jun 2025 21:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEA0C4CEE3;
	Fri, 27 Jun 2025 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751058449;
	bh=HoAKHVnVB3TJzjVLPcNtHz4b5bTjyeWIfqzTIsuT44c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lv0HznvV+eTyOUirCFk2xwJYwCCGDB+GLUnfF/Z6DyyQheCpor//kTA5vQYBlGGKQ
	 PlJnL/UH+RLwVFeq02Kd3ywr/U+dGpLt1M2IKhRmvF2w7Q/7XCOkmdBj9LUtfasdV3
	 qggy2QQ9+J81KdZ88zRSmYClCFP8Ix2Db/7PAbsWQ6kX+7LRi1pVHsrHU7pJBDI8FF
	 vzLcGqOPD9El6+behuhnvWMmxw0r3VubfnJmJ7Tc+/lE3KcpOWQ10A1+0kIhT+Qiru
	 4PNqvzjI3S2TAR5GBEF14REjZhA5nqjPmKB4Kq1ehzPlKSPQA+CQ9U4imzK+kTXzVj
	 cxdcQtj67xQPw==
Date: Fri, 27 Jun 2025 16:07:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
Message-ID: <175105844804.146874.1572190783775455795.robh@kernel.org>
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_140730_391264_E4D83315 
X-CRM114-Status: GOOD (  11.08  )
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


On Wed, 25 Jun 2025 12:34:28 -0400, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> ---
>  .../input/touchscreen/lpc32xx-tsc.txt         | 16 -------
>  .../input/touchscreen/nxp,lpc3220-tsc.yaml    | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


