Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lpCROu3K;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RO1qPL0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I61vAeBsOWK2N+3xullrZ89EtvrlTdCPGmIPBmyybbM=; b=lpCROu3KoGHjU7O+ckN72Vz3qR
	CU9IHCdmqTF55wwh2EhgCca8zGVBI/9+EUbkMk32KYcSNWg131rS+iFHI4kuHg34rQzh/CzqScu8n
	HJl7aJjOt28EKANg9Q0EYNJnpucePYJOOFIHhLlpyHEg5RNDxyvQsAN2/NAOKWJSF+aJcENFI1erE
	wZDGFv7O7khOJDvv1L30JSbs79hl7rrMEJhjmka3XybBQxlxpGB3iKwFGfq8SM/g/fQg7kiEKYwY0
	bTEzoyaE08VslvwmofoJTi7nX34XcH8z//jsDwGzwALx0SbVVPXZJrp5Ywjh9Tj2BKftyxXUvTahh
	+/JpEgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEb7-0000000ASB6-2EIZ;
	Tue, 20 Oct 2026 18:30:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEb6-0000000ASAm-0XM8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:30:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD33543810;
	Tue, 20 Oct 2026 18:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8401F000C9;
	Tue, 20 Oct 2026 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792521003;
	bh=I61vAeBsOWK2N+3xullrZ89EtvrlTdCPGmIPBmyybbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RO1qPL0za4UmrX0fRGPOOnAzFmWkfjRNmWrT6WsbNOKaEsjvgfZoQRQNUEV71nAIA
	 bZgqCZLg0ZtaYCGBeIphxQ72IxdLqf5pyHPi0w9kECEPjtOyZshV7GFNfknlcRvPjR
	 FHvqS5lTww6et5G1GF+FKQ8ZKHfvOwBMUy3u5Z/8k8dFcBRLGKRhElWSeGvXhb4ocr
	 O+9G6HolFBLMmc2g7+J0Cu2L239YRZnwA5ODmzGP5O5hFh1RKjF3o1qErJ3EjaydUl
	 HMzlOLei7927lLPrFPvdHGIbSzJZkddw6qD2WnZD0BIWGura46fS3DzX3QPs+XYiqw
	 qPOcBVQ9qomfQ==
Date: Tue, 20 Oct 2026 13:30:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 03/11] dt-bindings: gpio: Add Cortina Systems CS7542
 GPIO controller
Message-ID: <179252100225.709291.3157984607951047986.robh@kernel.org>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-3-181bb0d23f4c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-b4-cs75xx-s2-v3-3-181bb0d23f4c@gmail.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 13 Oct 2026 09:07:13 +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function, selected by
> the bank's GPIO_MUX register in the global control block, which is
> described as the second register region of the bank.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/gpio/cortina,cs7542-gpio.yaml         | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


