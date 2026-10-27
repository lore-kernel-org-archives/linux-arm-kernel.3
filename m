Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GDpYqqow;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=cuBwKMs9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2AhgxjpsSrdIp3v7Vm9/tI7GXfZBUU0A8emiVMRDe1Y=; b=GDpYqqowtl/Ac7
	++LyKRytxuJ3g3nlk9vhMXy6x7iNgeRfR6WNj4RbfnSWe1TPwGpBoj3lT3qgmbC8vtOaWU/Uz/l/u
	dtaoGGFEXbDO6O1FBjvPNw5nzxifWgVDatsEjOMcc9HE8mGOxtJjipl0uc0jCdFX7vKnjRTFmh5xs
	R/Gx1wCaXRBlwaM6vH9qkaUE/dxGFdA4B5SaWytVNQXqL8ZELK9kuNuiJeE19PYOQdTfhecElxDpw
	WJ04X91hXE+fAUT76fDmpFVa6r31Eq4eny6BDY/8Lw59OsJh7qKZn8QQvMbdkifmVMWQB3rajnnwn
	ScxicXdJ6SOGFu58TXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkoS-00000005RyX-2WM9;
	Tue, 27 Oct 2026 17:18:16 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkoP-00000005Ry6-2bJJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:18:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04D35108D58;
	Tue, 27 Oct 2026 18:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793121487;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2AhgxjpsSrdIp3v7Vm9/tI7GXfZBUU0A8emiVMRDe1Y=;
	b=cuBwKMs9MSlJwuxyuBzukuPRq4nyr+PD2+XAG+5Mrfpivg6CkaDvPJUaTlihGzEBVqPNPg
	vp/Oef/DMqwsmFyYU6aHqdiJZx1f0Nc1FfJiBZjWTCo0aWhl9ukoNcs7O0h/aWzlO4yU4Q
	SZwOhx58k3ejTwG9KwmU3rJ5rDgT3TD3pp3z0dLyVUieJv2gOL5b9BB7Qw5F8H4VK7MJGp
	LRbL52txxSsxbZXYQgORwx4VIeVgWDCy0cTZysihyBMZDL55k115D0G4kAFJagj4K2EMLz
	/llBrGMjsh5UBjbE50L8yvAm2mG7xRAnqp6GQh2dQjCol4QHB6msL4yN2cAP9g==
Message-ID: <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
Date: Tue, 27 Oct 2026 18:18:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
To: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260930214729.809649-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_101813_887892_5969CAB6 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/30/26 11:46 PM, Marek Vasut wrote:
> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
> It is pin-compatible with TI TCAN1042 and has a compatible programming
> model, therefore use ti,tcan1042 as fallback compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Aswath Govindraju <a-govindraju@ti.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-can@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> V3: No change
> V4: No change
> V5: Add RB from Krzysztof
> V6: No change
> ---
>   Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 0cf5fa21106b6..e97b1bc0a2e45 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -18,6 +18,7 @@ properties:
>         - items:
>             - enum:
>                 - microchip,ata6561
> +              - microchip,ata6563
>                 - ti,tcan1051
>             - const: ti,tcan1042
>         - items:

+CC Vinod, is this patch OK with you ?

Thank you.

