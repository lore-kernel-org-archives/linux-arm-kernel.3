Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDXSdMmL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6RBl++n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=; b=WDXSdMmL4CZL4e4oSFF+Hy0sDj
	hN2D/effs4SW1aKLn2dGoR+aWtRtXmHE3TQSUzZBv78le+eMctU6KtlUo33/eSo5GuWxs9MZ4fNWP
	O69TYNQC6Fn7K9+btWesK1MJpa1Uje02MfhFNHgrQkPaRUTjM+9DpaT0z2pqA6VqUeh8vTWn/azn0
	eNLTfxp65QPq6od3SB82ZHnwpCUdSV1EXGJ5yuLFduZ0vEBpgtqeRdxcSEn/MsicMURiO+Phdpvuk
	lQY6tXkZPrkf2yG5OM4sc0r/zurg7B9bV3GvsCxg+/YqPg0rpixXnpJ4ZUnaexqLtm/eCgwv16ve4
	dYMQJBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1hV-0000000A29V-2mt1;
	Thu, 05 Nov 2026 17:56:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1hM-0000000A26S-0O3F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:56:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso15246555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901386; x=1794506186; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=X6RBl++n9ACdJ3dofyTVfZpoOoEFWnecPg7TZwpkHfMg09LeWqmHP5w2vNKRK6fQY2
         TogpPvrlo4Sn6cgc+jvEWjU66+30Rph2NB15gWuE2Sp6w1aO0km8CZNEc+AKNejXOJiC
         5scCVPWxKy8mba5ZUmuG4Dnk4eFMlyerGuNDprPYTlOh2oFR0VOP2Nrg2nMF8S7kx6Bu
         nyjwpkVvXOwPnKQM/a3TbhLlhw638b8RM5iLMRt9sTfU+5igSrm2xtnvqc17jKZLh33A
         yQOGm66t81cBfpfWh+hY3ZJ9BBOpuL+Bqk9iL4iMMcL9CK8nF/QSAfjjOv6UcW2lb6As
         +ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901386; x=1794506186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=tDW2CMWYwJm8C35GmJxSQVfEWStPQLNjBqHu3r8vZ3nABCXFH5agCM+SPRwmijSzjy
         lzzCBRlG9vgIAgm2xfQIvgKe16T4vKis1z3B2JGEsGDSQbg/CTObf5UzVEojcbMaMOhE
         glbPDFWz1wrz8M19QuxCe5Fz7/CZvjl6cvZH6hdkYbgBSo3+6ap/pybc+7LzvfyQaO97
         LWj2HDs//DUK0BLgpE/mtiiHrF1D2r0l0iPQv52fiSIuR/2oy7EzjencMYJ2c/aFy8tv
         v5bjlIy7gp62YSDRexuDIaopcj2VnLcTmkmHaZeGdufWPEqH8EDjzlD8yS2vY53qJNEo
         B1gA==
X-Forwarded-Encrypted: i=1; AKwUvByaH0U2W427LVqrX3A7FMSt89qiFVktQlMxUx7xyY/yBWsxFSFFe2bnrGRhPS+DQu671jPFXDwdhPqHZIDN/mM8@lists.infradead.org
X-Gm-Message-State: APuU4Z/r5PMdpizpyJlbvo46xhPj5a5JR73sjbAS5J3eL1Ou6SyoPyGq
	yTnA6zUjGm45iCdyDXuvw0PJ+QVBGN3pkOL1R5V9nt3U1Yg1aWUVxTojfeN71Q==
X-Gm-Gg: AYBFou2E8rJ6VSbrbm1YKuNHHA4cu+qkt/hXtl2nNbTEjc61RT6C10yyAvVgXzdlAxW
	Bq7jdn9WUP2Ozy7XK0pyifGPrs7Zl0AO2kC31VsFKkL8UDvw5QJxJdVVpNyn6CLNzHumDuihFc4
	D7nvCVxEVGR/OBl/ED14IgJ4LhXN+lsuQ3YPAikRi10/YV4TWhA/LzNL6xUj0WpJJ8OOdRcqTC+
	wuGsai5N3hC4X5CckLNyI+fZ0obYDYlviq0SwlBusHDdD11TgObJgTvY60K0C5JZEcPU0AgfLLE
	hqC56h0rWt2DW4O/3zrNx8sirJWf8yHiA/nAbh8VNLFpUg1TwCC7NHIJ6EPBKOXerrE097T1xPu
	j8/HpKHrJe6XLj1ramPh/X1uzh5poJImdOvPUS5Hc1P9YAZ+ZzRbKFNzCM6Kl742/rhD3RnwkyV
	IS6c6OfctqE8NVM9Wb/btc+Qz8KOqsRwTsojhBzuRjJvDoOOMXzcry65/3U8bGSJQwSK8sP5RXQ
	EqHtXckk/x3R5Q8S0P7T1gPYnO/mp74O3CBkPWkX+HXyYm2EPu2RvfSVEs8wYk1GPqt7oPKtxX0
	omGRIxsUW1erHcRSfTjznN6EBpgKaQUq0bAKUquLdda1XxmkX8eVTOuSAtISjq693J/ciuY89Cm
	4n09s06xq5Oh8BY2+sHpRTwJToLYHymsSgHaBQDyG/8rEsBu0Wz74uv54eBIObq82w6e+Adn6YY
	IWavDT
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr456154495e9.20.1793901386029;
        Thu, 05 Nov 2026 09:56:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm77678635e9.1.2026.11.05.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:56:25 -0800 (PST)
Date: Thu, 5 Nov 2026 18:56:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzDR5B5k5GR9SRc@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <auzCs1MXC8gWXtu8@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzCs1MXC8gWXtu8@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_095628_244042_EDF6A84C 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:53:55AM -0600, Frank Li wrote:
> 
> If not impact for current user, needn't fix tags to back port it.
> 
> Frank
> 

Understood. Would you prefer a v2 without the Fixes tags, or can you drop
them when applying the patch?

Best Regards,
Stefano

