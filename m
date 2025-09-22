Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82ECCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ7aOz13Ko41PPly9ykFXA8DWGiUHYAJ9XPaPWVJD8Q=; b=fFUIfu7vrOYkSBgo5GOKtscFPT
	Y4LkNWcz3VBhrA+WsoX1yFZg519L/hlCRD/wkI3JAdeB9ZCMx/DFF/GWuNKzAJSb6xlSCGGuPhOBp
	bRdDKBihgujF4ALz3SlKvTnHYAIT7pA7FsSL2mgsWIg6yXrsvPrJzEDGtonzhvgGTxSWMo89Bx4gX
	ZyUNlr50/s29RLe/zsUobgEiAbTMQ814NU/0vQIi6gzgbYREUTakbZXigPnlp0W11n3zX8OKMrOk3
	kNltH4ekn1qbsDZ6cLdj2CNjMiC/Y0eMBgx4e+ktGoz5gtrrRGyTIT8O1H3tiGwBWS5YcRIX6jMmY
	XRPWlBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k8l-0000000B5J0-3jAR;
	Mon, 22 Sep 2025 17:15:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k8k-0000000B5IR-3uUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E99CA601ED;
	Mon, 22 Sep 2025 17:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58690C4CEF0;
	Mon, 22 Sep 2025 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758561349;
	bh=mi0cY+Nvy3Qqsit422rWrrAWc80S+JmM8GQj6PeSV2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvfpwM20kmi/LgRVzKQciG+YKjCg0Mx1FzurfkQzFI3ACRPTweEOfg/DxNcvwLtZQ
	 iR5+FuScP004ixrWCtOX2ZTFZTIwtltSLvhSpGl0BjwX0XQxhU3YzGiF9Uiqf1cH0W
	 M8LMfyXpmSCosMi5Hh85MmFVG2gy8pF8uzQ/9DgPKtTSDqeZlD6jTsShE0IcUpoeY3
	 ulHY+lQil5ATUZUwTdPSRdCAFJejFPD8rN7ItMIWcj4/C4Sh8Z+5KM+Sw4GyU9YUhM
	 9QzQu95/8uJclYKbA1eczKjiqBB+i/PoA0VjY2JWJ+WZ/+ksJ3TYhiiI3++cpaRwgn
	 Pzlotp4RgnngQ==
Date: Mon, 22 Sep 2025 12:15:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
Message-ID: <175856134761.488862.14515741406588517513.robh@kernel.org>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-3-a3629e4666ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-perics-add-usinodes-v3-3-a3629e4666ef@gmail.com>
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


On Wed, 17 Sep 2025 21:04:23 +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-usi compatible string to the
> Universal Serial Interface (USI) bindings.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


