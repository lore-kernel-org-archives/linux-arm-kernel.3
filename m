Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDVsdEm3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzui3q6k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=; b=iDVsdEm3gRXPBqz253t24SeyNq
	jfpvc3mXCXMPLhautN6lo8hJ+oR9GHWHlQd0kl8gT/ENceOlm3u8qOEoRv98RH0F5wrw7aM9NZ+cf
	t9isvWjhT23D+Gvs9B8WPkDNXf2hMg1uqbJZf/88ejT/VOoEOlmNB0/n+0/Kri4PgsJdtJ0vnmkNf
	FCMdQLsi7fWKhki5wLuUIpz9gA+OUKWfs70JE7iOaXL+8HHZo2TmwMbUFhn+Zv2HvAT8S02ivnMPk
	mExhSKU+ioGgrfji0mHBdXfxgC+SMDQyjH/SjqC99T2pEU3fsEhTc5E55Mefd2kBEqlUYvthogqHO
	rZBscWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6pN-00000007aNh-2BRD;
	Wed, 28 Oct 2026 16:48:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6pL-00000007aMT-2MdM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:48:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a215e64962so13500985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206117; x=1793810917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=uzui3q6ke6A2/HaDDFB4kN2kEWQDVJmNQ9TxKz5eLNR4VLpKsdayBl08XXfp8fQRnO
         B0pONyHvVjTJWlsYhY6TESyboSPRXEZWQjDH9Sbr/EuFkKFwEUhUHY9cVQOn45jxFHXu
         +JToV1Qy7+OZorakVVGLAcOUk7RqctAo3rhmpkrdBHByfI/4+di99b/bO6IHLBOXe48H
         lT1kZilPDvuwkcyyIXZZwxLLLIaKjycrFaXxXEi9ZLvp4amK+KsY8I7ZNw7cBdt0x2nR
         Alg7gCDZJIb7iKXIMngO9k9n71hjsSu0c6EQw7oZjwXIx0DfPE/lyccEvduGplnFuZTB
         uxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206117; x=1793810917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=y94gxGjr9s8UZvuF1rV6YuczZMUia4EmbjRgPt6hwNvVn5bPXFZbtMGWUgX37ulAzk
         upYm3JH4XCG9iQk5JjOrLBgTO3S81MiT5vYfcW2w42mLd4Vg1FnDy6YpuTVkX9nUoWJW
         ZhOLYoviQ5MQyc/f5cFLtrPZxn7VfE3pwLK9sRUNQNJc8aUJGlQ4BW9Jf4pD7JF7HzTe
         NgGPsiV+lZva0hO5D8fyVq7vqbozfvtmhaQMLPz+sGYY7fn5fBw9x+oV3cvEivdqhkgK
         QRX4o5uTOLE1VUZUC446TLQBju0cQM3ofD0FvKhUxRrEI8ztQuyKgc6EFNjX1PdmsEUX
         n+Wg==
X-Forwarded-Encrypted: i=1; AKwUvBy/UBqv2BNwsI9f0WFAkOwr78dv13AaIxPvcmOhuBx5a3cc7ytblt1/F9zwqKz8LqnMpE32DogPFCmsi+fnXtQc@lists.infradead.org
X-Gm-Message-State: AFq9FYI2HrKPdIIZHbQ/bohF0qQzQ3SXLsM5BOwQuGWU7OqHBep4Z8zb
	D1bQByQwUCvuwWwi26c9MKFc70pqRL/E2IH1DQfwiSCMU2ai62uHMofn
X-Gm-Gg: AYBFou2RcjNfsWXL5tZERPkZHSK/4DwxaBpu0ZKAQEVyRMCjn6I7xCEg4iVkAwHTbiP
	EcvHdJYXsaejtbPYtf+U3eR0RTQe1gAsT566Rv0IILuUKa4owEK8oX0/yzHgT2jsObW4aZxWhYz
	ibVXgZkR/JBY5UHHKOeHcoXEpCEehXSPQ+WMBzYwt2vHhAsLpGbDGsiLaNnvPdgt7/ViY7JsymC
	Hvdp9MsuOMBO/ucuYyCvz/G2yJ4BQejMSqQKSJnyb06Md7DjSo9ANSyr2LSxZ94FUC81k0Jtg8E
	7+sX3Ge5Uatk6ggg7KSqxobnDIDoAswuHm6lHlkf9f+iVgNtkSrpStl4XqUIt1oYHTheY4GY4Lb
	eWevMHISIGJ2FfoWynPIsnzvrj/4WDGFd5jGBn/ZAG9sbN2p7At6cS0pC7M3JGb/xix4WQIwpZ7
	cv/l+dd29z6qfBzMTPADCrnfZXkfu6nbrP8jtLUiO1/JA+jxz3Vbo/yXXv+RCsW60sjF1yGytG4
	6yHr+w5HuyGKwXclE1uSthkTxQA4Lv/q1AWqWKiTJZz3EDYCMehE+seZWqku99Mw6atUcyaREst
	kU/FoWJufIXVaTJ9uEroK4pAucJ73ajSETYkxNmmguIuItdXQ327h8f83r0sRqFX9cROj7N4bBR
	Ko4hpdlwXveJpPf4YI3u/VqYtaYDbXayx8Kfpcg==
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr22034485e9.28.1793206116486;
        Wed, 28 Oct 2026 09:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm4600155e9.2.2026.10.28.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:48:35 -0700 (PDT)
Message-ID: <6ae22763.2bb6edcb.3bc160.a0e2@mx.google.com>
X-Google-Original-Message-ID: <auInYOnHl6n-3ggU@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:48:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
 <20261028-academic-blue-earwig-72d3d1@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-academic-blue-earwig-72d3d1@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_094839_610629_1A2B0C44 
X-CRM114-Status: GOOD (  21.80  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:51:16PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 03:40:00PM +0100, Christian Marangi wrote:
> > Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> > The MMC controller is based on the MT7988 with the difference that it does
> > have a single clock controlling it.
> > 
> > Add the dedicated compatible to describe the 2 register requirement and
> > permit to define only 2 clock (the main one and a fixed clock for HS)
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Also add compatible to restrict clock-names for source and hclk
> >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> Your driver part suggests it's fully compatible with other variant. Why
> not expressing it with fallback?
> 

You mean something like 

   compatible = "airoha,an7581-mmc", "mediatek,mt7988-mmc";

? (my concern is if this would be problematic with the current if
conditions in the schema)

The driver is very liberal for the clock configuration as it does use lots
of _optional... But it's not possible to reuse one of the current
compatible as they all require additional property that Airoha SoC doesn't
have (either additional clocks or single register)

-- 
	Ansuel

