Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EC5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cl5Lwe0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsGPO7la
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DomZxbCEHeOiVNl5LrqiWWL35PejuwJXF1iKcbILqa8=; b=1cl5Lwe0dOwHWxKA9iIW/iP5ub
	C3jSC7PjXikdLNskxyvd/NZPkHyVYEy8Tw77kbBseURX/+migugUo0+isUVtRQ513F9Rlsx1p5fPu
	6SF2pfcxeOhPfpY/Goc7Or0+BhczIe7WT0i5HXljYbGrRdUKl8WsF+RyzDlLisA0HVyIsLM6EdDZD
	EifgZqw3/uxejy3m9eKSQxB9nGbNi0kFzsA3su0Mc5GGdK88ggCbP/G0qoC1stSXMQQ591dIdbUhE
	ONNiD2uu3EIkOwjlI2jisnzAol2GMLAyMUAPl5Ex+NNp96ZMPjhD9fMqKwzp1CRVX5zMhGMAPM5/5
	H964lsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMZv-00000008sCe-0ZLh;
	Thu, 29 Oct 2026 09:37:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMZt-00000008sCQ-2Av6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:37:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 676FD600D1;
	Thu, 29 Oct 2026 09:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB1F1F031E0;
	Thu, 29 Oct 2026 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266664;
	bh=DomZxbCEHeOiVNl5LrqiWWL35PejuwJXF1iKcbILqa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gsGPO7lacEUX5MrFqCCdGn6Q0ZLq5nBJWrRj3NLuUwNtIaruBtP5RmGgt0I8Vwy44
	 QFsCRnAtc85jPBzU6zInE8bW3LkkvCQmHqiNlk9EzzbrCfBOXF1TYToyjX7WePM9Oc
	 jACl4vKXITNhQLcWqTDCuZNKRVGgp1tg1D/8YmbktS6kY9yP3dPtELeEymKaYT/TWv
	 cmB2/CE5hdb2+lMWdw55GcPNy7HgF5/DROCwbNIkMdYOHZlz7uZnXDydutl+a6PhcA
	 C1RFWofQ7pbJKSsHDsRgbem6h09orRz+TiefxubDjpTiDM8x2kRip4vFBL9m/zCxjG
	 dPul5RwaR2MCQ==
Date: Thu, 29 Oct 2026 10:37:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 t8142 compatible
Message-ID: <20261029-advanced-legendary-rat-f13ac0@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-2-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-2-1356181bc50d@cyberchaos.dev>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:03:22AM +0100, Yureka Lilian wrote:
> The Apple t8142 (M5) SoC uses an AIC3 as interrupt controller, same as
> the M3-M4 SoCs.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


