Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F9EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVx+TY9BCk0ixjsFvhvKmsCWnJJ+1rxeCnOag5mM3OM=; b=vy5Jb0DAhGeo5DHFagdbedDxpU
	puPciKTKNJBwIZXL8ekhEay3P73HLwZn8kynZ0gxtj+eP7T+GkavDXlTOt3r3g9VG0o1+NmWTP8Ec
	asIti0+THAwhOpsoHgnX1dt7rL9izALN/wj0Cb/dlYIhGMQDrArlhI4Zw6Dgf8yVjyQA7HPaR30F8
	TImUueY07qnAOrFlMlRRmAJS9xC2ZZfTPHAaS2eraXwAZma/kNtorrcCvL3AnoARftXYWO/5rm1p2
	7UdQP6qWCoJ3HB4TYJer/m/98mnZrm3FF4ZvDOZry0ly6/JBabCGbOvGDY1fmWeGj7DjkJ5NSp3v6
	LbhQeSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiQG-0000000AQii-2oZS;
	Thu, 27 Mar 2025 08:17:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiKe-0000000APus-2X2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07FDC5C6893;
	Thu, 27 Mar 2025 08:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE544C4CEDD;
	Thu, 27 Mar 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743063079;
	bh=bmXqFqU22qluSfxAA/IxXQn2uRD9aGuQ4sNUF6q33mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQitGDUyAlG1CIo/auYlxpRBRrN95Gymr8nzmSj2Bn7K8PkVAvTCgSFJDhY/nVWs1
	 yWlVnM9QbuxeYrNtbL+kLC0j9R1bhISfo1VVxfGZtmOO4U3UqG+lEODshvmvzc3xGi
	 GWBjUxVZwdeG59X+9ZY9FU7w3j0NZBlzXlPD3UikmIHyc1uyBC/6k4NQRoE6/HtoCl
	 ONEpliDvX6/jIddCO2AUdsR1E+lZTOLoWwii+++23Ceezs8IGTdvazTujhORk6Yh7f
	 ZprQka3sxc4n1k/olZnuIBeD6LTx6lfwUpJFi97h8wl/DLsX3Cup/reseKhJHIsrlL
	 cn57K0VDwuogA==
Date: Thu, 27 Mar 2025 09:11:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 08/11] dt-bindings: mfd: syscon: add
 microchip,sama7d65-secumod
Message-ID: <20250327-nocturnal-fulmar-of-holiness-6b6ac5@krzk-bin>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
 <7248bb9d4ed491b178072b09830d6d68fde7b872.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7248bb9d4ed491b178072b09830d6d68fde7b872.1742936082.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_011120_685570_093D284E 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed, Mar 26, 2025 at 08:35:41AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 SECUMOD compatible string to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


