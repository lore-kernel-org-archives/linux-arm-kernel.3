Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aOiM57CA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RG6S/Lf1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=; b=aOiM57CAZPAuR6
	zTE3bZAWFGuiEX6shnsNWX7LFedBdbOy4TUDAJwFhBYznP7m61FCB1zXnXjxW2kPalQBxeKu4zMH2
	yGSE1kc4CVsaG7toYZBCQTF2VI7x38qJd2PlRd+JUuvcU7qF62mfCNBDGXwmdK6MC3RoJHNEZM7+v
	LAQEbo4aMZZHNQaIDE38IzloPKs5T3iO7gXyVGr9rRajkcz3wf6hZ/fVuQU/ueN8US7vXU/8yURQH
	+1rytS7wqypDUi1CrozPtLkHON9/8c+ul5ovhwverYLPXJXvJWGWuu/kV2cJv6Y5q+8eHFK8IdUjb
	4WVKAJC4rhm1RclITZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMK39-00000008Vij-3TwY;
	Thu, 29 Oct 2026 06:55:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMK37-00000008Vi7-12Ub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 06:55:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12534885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256943; x=1793861743; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=RG6S/Lf1zP01+hDikpYARh61aDh+w0Qh3dyksFVj2ZZ+T7K57qhZX5RrHrN9Nmbcy2
         uQGpIrrkjKy16Zlncblr+kM5rSVp2yow6HwJM/6uI+b3+RsM/T53jtJ4XXFwynC6p0Xy
         4Z9qhbeC2sguVB+XhPgmzvUPqdfprkWNhxbT2HH11DwDLMn5Upxw7csk5cGaJxTlAEvO
         YjvvWheXiFbdN3WvM+UoBJK8XZuRHoezIurGn9p7emCJFUxi4AE6B6obb/1nBCwXVjLi
         SUnO2GxBb53YBqzw3uXshVCGcsPD2vURlcikToWDJUava2ERALB/8x8aGOZVEt94+Uo1
         4H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256943; x=1793861743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=PEc+OjaTJB9v9oOmgW7arV/p1CWH54ZUeyrE+1uoaGto312Na+aZspdUhLdg5NjitO
         F6IY7ioUVM8wWTR1VSmIMG+EhNB5NVlBbyP/FCIoePlz16NOrvLHojVuZRpA4x8ld77y
         lVSJSMtbCdrS2gWHEWRcDpX8pGMruloxaxY1woXcNbmxbKE/ZUk/3hwXy1oNGWVyRiQH
         gcaQrmhLE+rI+W25bwmorscLr3VZ+4tKRQck4YjtFB029KETY/2yR3LbG8Vc3JL0Grkl
         nm3yUc+FpuwpL7TR8sK+WaP0qwGj1vaT7hLZjUxTGI/XuDu4HJ+3bxzE5QZegqsJxy2A
         +gVg==
X-Forwarded-Encrypted: i=1; AKwUvBxxqjEksH8K+Wa8TWaiUAx3FWi2RwPk9AeSjnGp8Xb0nzk80BUTjYfW1fPjBxfWNCxDOl+RsqkRPkiya652hZiu@lists.infradead.org
X-Gm-Message-State: AFq9FYKk7Vl5tHv3WzElalBgpb1Ff+DkzUwlu8xi9dVKY0cfgbSQX1/E
	i4LJGFYjhnsNJpEyr7SH7Cw7WYL15g8dGeUDtWs5rw9krlEnP+pAjv+Q
X-Gm-Gg: AYBFou23dabL0Qg8twXt6YvbCAWi2N9WOxWtOyXJDCfQpvZblKdqp7OjgomuOhNysUD
	XNm8dg51IWPPjt4wZAtEU/6UsZdEr6yQ0MgHRm1xXvM5M1ZUEHPKvcaqJ80vVqubsnnewRAm0eT
	L5kcDouRM7zflbjEsB9KYh6+SGSmrdafpCUR+E/kLSkkFkX5Fx6vCrTI7NbOyeTeBPXV9qVPLTn
	kZloR7qU+3CKAVrkoLmKh7hcTqL+HPaPF1+eZHHGB7LKbbOvBtfJtMg0HmN3JAbhjRDr3fz1gkv
	jlc/YbTIuQWasWraB179hj4tKK9AdpWbfBxQnfRlOW7sbujyyE0CZxgtyw3piTzvdJHqUo1v0MU
	XshaBA0HIuNvLOekM0uftEtqKUHBusFJkhs/skErBZ2p4hf307RNcE0vqjL5pu2DVZ3fgOqP3sp
	2zP15UWsjf5fRSotVmkl+7wR8syIilCTkWtZ6Sw3zeMJep2j68ejsELsXbQI9FuVx3ZLxP/qTKx
	jUoeSq0Oj+fDxkD75PlYPnQ3YpSPcwi+q7M1NWcKbTVUpRxPRUu9sqnrdDJ7wSM6PGz7NvLPY4E
	o2TyIEn03EjBS1k3o6mgEJx7gxMhAUwDU1jqxyZl0DaiFhqQcA9SQTtzpDePdDVqmeFX84X2oLb
	LpWAaUqxB3w==
X-Received: by 2002:a05:600c:34d6:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a9660b54e8mr101112445e9.6.1793256942680;
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm87590825e9.1.2026.10.28.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Message-ID: <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
Date: Thu, 29 Oct 2026 07:55:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_235545_305586_55D0A085 
X-CRM114-Status: GOOD (  10.32  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/26 22:05, Frank Li wrote:
> Does it only impact superspeed? High speed work?

No, it's not even enumerated, on the Dev board.

> 
> Thank you report this problem. Suppose below patch should fix this problem.
> 
> I have not time to test it today.
> 
> 
> Frank

Tested, it doesn't help.

xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
of_dma_configure() and the new code in of_iommu_configure() is never
reached.

Emanuele

