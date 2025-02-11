Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRoPmiNI7Pb54rXqijfY98TRaVtQUO61L2fZrzsuppg=; b=leXnBcoDnLNB57K4zT7MT8eNNg
	vbv7kjp+Ld8UQJDedGzR5u78jO4D7m+DiYEXkgjx+5XvJY8IBIuwECxj5iWQ2eh9XrvfLOs6aezo9
	TUNbELgpBJn9ejO2sFUdVVyMjPvysHZYg6LLzldlnjxvU5FPZQM2GeTjCsdJbuFEo/FT+Zo0sI9lb
	Y1No0/yhlEC+yEPjEsmwIpemEIqL21osLqXN027PS6rzxcelrtcKsh8XKQ0n+7KZfXKJaBrIA31/e
	dnkZxzNX806dJ6EYzCRUTZQe7sIT1Ny0zwG3TZ0wfpcSOLMYtlAd/WGnM34JGNFhOHT99bQ9b+oMj
	zcbSWv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlPQ-00000002xNB-0E7U;
	Tue, 11 Feb 2025 08:14:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlNx-00000002x5y-2aur
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64D825C041E;
	Tue, 11 Feb 2025 08:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2383EC4CEDD;
	Tue, 11 Feb 2025 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261568;
	bh=BnklPy0jBwIcPPG0sfRjtHiMoI+AINPFQwQR4mm4XlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYRi6IPUcjP10cTFZ3JnXr6ZE2UChBLEn+nMJE3VvaCYbQmqo4hYQfj/GlHbDcbTo
	 bDdvAfGvM76dcFahRq4LANPLe7jgrG3KiRZddZ1SWCZ8M9jNqfe9CcVATpb/BBMorq
	 pIxuZzg9fa2jb3UhLNX4EdCT3G9sE55zQpsV6SyQZq7hVP5fBJa7iaqmYeSJgeEiLb
	 OqspoFUWG2j6ZFih8kukG5bDISXmlXIw7IdEVnhQcM4LLrFXw63ZbMpcHPYgNlQ45W
	 01MSNTnfclflNUGViKchq8sl248/zRw4s+qGxRY9KUMxCk9kFeFqvo5UTDVeR6H5Jx
	 YqQiWrOlZvWdg==
Date: Tue, 11 Feb 2025 09:12:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v2 01/15] dt-bindings: mfd: syscon: add
 microchip,sama7d65-ddr3phy
Message-ID: <20250211-logical-ingenious-slug-9b648a@krzk-bin>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <7e2c590467171cb3a942692aef5a679f127e567e.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e2c590467171cb3a942692aef5a679f127e567e.1739221064.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001249_699537_3D7BFEAA 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org, sre@kernel.org, claudiu.beznea@tuxon.dev, p.zabel@pengutronix.de, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 02:13:01PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 DDR3phy compatible to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


