Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kcwSLHMy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OFlmgkr4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=; b=kcwSLHMyJ9UbtEZAo5yUh+UMji
	yRXbRKX64AJtAKdsG4Kd5CExdC7ZP3DCw/P5qzN35VIAAodBixeYUCyfN5KPBIrlpPO3hWvhK4hST
	3sTU6x3lNGg0FDqJOizSt8ptttBLASUelokTswiquBcrFn5kE2jMFQGR28OzfVxqDX4+JelcElfsS
	OpUAriBXH/Ag+DQs/stb006PrrQQ6zdDriQFZKytzOO3QRjEXS8QkMqKN/4utZl8GkM0CK3B3r7Qu
	iFswo/oA65jEwC/SJr8YQAP4RAzCg1J/X6FziVAqCcmZHN9EbwsZ2sG5XEQbyLE9pXgn8tb7WKKIf
	s/KMz3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObxO-00000005dbQ-1mTb;
	Wed, 04 Nov 2026 14:27:18 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObxM-00000005dar-1RAu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:27:17 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso531000a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802435; x=1794407235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=OFlmgkr4w04/cXO7IiR5CKOjtIUqZpy0WapDLayRVnaTlzmi3g62BoTtdQ5ZmcmuHP
         kNs6eEyjyKF+7w+2PXzppLbccw9I7aZckqWm8EF/wgKZOZRk6Ux3ebvSXSeReonLBolq
         pml81hEvfQje1+BrXpUYlWeiqQqxXwiVS+3jwAha8rir1KyJxpYWU7bncFDTy811f65M
         zqALEJxIhyKYqq1yJ4gDUtRbdzMBHxToTCLIgn9M5et/bDE8DAHSXj1wCoRk0nSwLLry
         z6QZe7kMOMF1Yilkg/Ne8imyLgns2VoO3odIGRYZahcfpPX4NL3oYeJ4+Nw6avomvLwS
         7+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802435; x=1794407235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=oiQPdRGy+JZA1X2Aq4v7cyebdqWeqTHPSv4zXZsKb8GsEur/5y7mzvN4vX6uu6TyY4
         3nAYAVScnKdDrGDSH2nWk7OyqhCbLu58DcTOuBzgGa58flMkFIdGAEkqbhlhOGJXsLlx
         VzX02mAfdJ8wH8N7sMY7/kDk8DseTFX60dA5ZPuFSy8I003z72svbrCeYRWtBqXVss5P
         C6cHFUfjSmlkixzJA4c0Wg5S8FoRrjDHZDzz7/vUcD15seg6oVsQRQ0NyTVkmO4xOPF7
         v6kZPdL4jiKv91fQObcr4DdXOQEGHV6w4RsdIYQZ6wDNFpmUy7e9nIzTbQ0mfDXRhFd5
         56KQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3j2N8VKRWiSZmqjZNlNXfG8z4PkzXu6xSo0qJ3OuxO+kgQAWavoAtE6lVAjPyduR7zYiMnlXjeyVS5YLPeHr4@lists.infradead.org
X-Gm-Message-State: APuU4Z8UN4NKsRqAFe/zzmuaUJ43dUTgCXgiih26lURtEKnUjV3Ln7qP
	8g9v1Dd7rwnKuCRrVI5YElc+3UTR02Yns70WDcJ++LNSvgZEExC37MIG
X-Gm-Gg: AYBFou0LkhO27wSbFWJ8WX3FVHy6yDhk1owJ93q9d6gq9fY9FVde6T0KXPnRZmIcsFH
	VysoxHdn3CeVT0BbsPiR4x7W/eAayME4r/R86M1/uiQmejckMQblwbEwiiltEpSi+UT0zrypkfT
	J0G7xgQZOHwSvj5SjRcEW5MqkAxkqlTZZO/Z1biE1lYnQht5/DgXAHD3ArWRjZeoCgmdOrOHJDL
	kidaVeFV4l0rPRNkczJJMelI18pH9UIElB+RpJYKotRDMFtvCyXPeGxgyrkVA6OtuxzPUql2B/M
	3LzXV4bqFF3fpOoXaelUPF8ZUlmV57ZYIh8b6Ly3I8SytFLax8NBjnjux6DQNxJjOETXzE8SiSi
	rT5GO259JHGL0livOWNK5JyOh/wUfA8vxQHh/HZuMMQu6NF6Wi+ikXdu85zwgSRIfTzajfVxmAi
	Veq307rkRGJN0oCLRZTBed7/lZylLQlnWrl7YFMmpxvuXnyL6wxBkz6H+EdoIXf0F544nt9sGvO
	vuUEK0ZN8WJvEnq+JrCXiJn5gEc6fQApZLJii4hUbTZQjG2XLA2IWqCr0AYHgYIyg40pUCfG1uk
	rbB4TX0f8qlF1lQMIQY4DZ8lVN/8wt8HdILmOXV5Nn43J2zTZLR9cgw=
X-Received: by 2002:a17:90b:5686:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ae89724af0mr13599917a91.15.1793802435021;
        Wed, 04 Nov 2026 06:27:15 -0800 (PST)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5aa69fsm9656842a91.2.2026.11.04.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:27:14 -0800 (PST)
Date: Wed, 4 Nov 2026 11:27:04 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, francesco.dolcini@toradex.com, leonardo.costa@toradex.com, 
	hvilleneuve@dimonoff.com, marex@nabladev.com, stefano.r@variscite.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI
 Cameras
Message-ID: <5tszst7u72cqju6uk2yxtrdexgmpmqf7bkihnno2753xqgbdb7@modjp5vm3wlh>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-8-leoreis.costa@gmail.com>
 <ar6Ij7KJEPbIa2uT@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar6Ij7KJEPbIa2uT@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_062716_383525_ABF780D6 
X-CRM114-Status: GOOD (  19.31  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On Thu, Oct 01, 2026 at 11:21:35AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 12:52:57PM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
> > iMX6 CSI.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with
> > a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
> > legacy camera module.
> >
> > Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
> > external component that does not exist at the SoM level. The camera
> > modules have their own on-board oscillator, so the sensor xclk is now
> > described as a fixed clock instead of the SoC CLKO2 output.
> >
> > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > Board V1.2 device tree to provide a ready-to-use DTB.
> >
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
> >  .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
> 
> Please use nexus connector to share one ov5460 for all boards.
> 
> https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/
> 
> Frank

Hi Frank,

At the moment we don't have plans to add other overlays for this camera
on Apalis iMX6, so there's no need for nexus connectors in this case.

Leonardo

