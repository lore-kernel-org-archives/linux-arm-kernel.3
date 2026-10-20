Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61729606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TKduuW/s;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=quJ3E+9M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=; b=TKduuW/spG85KOlVgyZyvhDlJI
	dsV3bAg6eNVVohmKr6+F/aC8JHMrDOg8091MAJKhlVsg3JMUbuyF+e7EdXD5/Wjet1jHdaNSCgACk
	jd8i/MRYV+i+P0pJr927OdUTyJwgtdP0KDnZSN16bW6S1yLk4fsfEhUiPEdAvV6MsffzlXA2wKkOF
	c7ndXnjYrtmKyspmAhkGqWKb56i6PwNA7chzPuL+dU42nHW4rtPgDjlnLEofX557DnmCUO1WoWbn6
	A0zlIZcMF9Oz7CQexkySap1NmUjwOI/ESpLjTy+9cNoEs2TUttybKJQVLGYbvmoV3fNYAbBergOE3
	XX1bvakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJANn-00000009rMu-2NpV;
	Tue, 20 Oct 2026 14:00:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJANl-00000009rKo-1BVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:00:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a01933b584so23393405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504798; x=1793109598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=quJ3E+9MUJO//67PUYPijgl5TdahVdftNHLhtmXmgJbAHMVu6aRKNNroyf2sEEChBc
         m3G2sxrYi0A7FerM279NCWsJyqW7chpKbeEahSD8C9Kz7JUxIVqPJfLiXfcD4oo1joPi
         tKxm7oXOyIY7MYmBLfy6eY6mMMGMFU0Hr2SMR1WJQF4Mcpf52ITEN3vy+B0tbTzA3X4w
         oKuUne5hoogxsz5E8qxTyPD1WGvb8KDSxJLIV9el1qTn2N2KBdrQhJn5eBGZAlcR9+6P
         6ZVqypSCTObgyv7ouGPAu40xdX2NMFaslucsa76yuicCR9p0tms5aoUooQLmkkZJ7OI8
         oljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504798; x=1793109598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=YJlmkfw+LWeKkaBMI/qOvYfVpG/s4l2oRdLM6nQdWpIltZNkJKNWbdIlDnoajVu0Tw
         01S6JAmYCU7fp246KGuBO2jq2lwG+IYQZsOEDdWuP16rI31P8j7qyArvI3H+M3NYVXUr
         b2QyNcP4J1LzK6zeSwiW0VkPz4U81DtT3jruO7eM16PM8WMkwWMNb6DWqAQbnidACF6/
         qgGyNqPnjK/XxFfl6E05AwbIn3jOKRxT2+Pe+opRdsT65y2iAk0gFbCHG5syMd1eKjv+
         AjToEoj/gC++TxWIOVlGqQfGjmTTutp2riGIREYrzQUCZByYnWL5AFro9JgaNflsHSVm
         6hhw==
X-Forwarded-Encrypted: i=1; AKwUvBwNi7ZrbawPzM0k33Ry6wkqWmrL2NngKCMwFBpi+GwLrue0vSYYgAEhUcHqAHa4qqretHLSjvEic3C0UHLNCt0+@lists.infradead.org
X-Gm-Message-State: AFq9FYLPu1Xv87t7NkKNWc7z/Ud8t8c1nabttkA2p7jg7G1LQGaaXSsH
	15dxkCQgDgGsHcjX7gVeQ3HtxhJjkZg641kyVhF9bmCDthYRlCfitMaX
X-Gm-Gg: AYBFou1qrwYYu6hVKNTnGKXv3UOAhZAuWfO25KT8pRje2xL/rxl+hsoBNDopGdcnX26
	crvSk5EyUHgQZDOfyVs2JHZJx3L7jQ26Ujl6LCdfZLBfQYkjVSitw7Y35CvTZOitd6n4G3l56q6
	fFpH1rLcU55T+dijMa3mVhhYAz2rFRfo2FgPatk8tALnSnxHaIeA9zGTuhpaCTJAM3jjf5VveyP
	ZEwD61mrT6peQID9SlMrFNH1fZ2D3aaJl4nOSJXcU6gx2jznqhlMnumX2ryq+YWob5DvKfjRjtL
	0jreF+D1+i2CO/MZLBVPlmZir1SoS3k+mra+HKcBj1uIrXTVXA7w37RwLbGnlmrlFtVyFTCBRb5
	IuWoq6rbCRNGQURXD3zowmvnGrbxLUg7rOzZf4LPfHVIG5pLFuRzvDyZJBs0uKGpMvo7F8Tlxom
	hADGIPuK/0Kj/4nTBgmw63RtyJ6+hYiAJuPsduWra2lonDlxrqW9vy1tb8ZPVvt12rkF8SoGO/G
	aCwOXJeS5ymCqUohP7ZgK9G639SQ2dIsmOrCBudx98tl+hdHQfWn351Z4u0OJOBcOXJtRnlXO0T
	mR/Adlub9YBFlVVgi+pfAgxhGgfr
X-Received: by 2002:a05:600c:c082:b0:4a1:f377:5c6b with SMTP id 5b1f17b1804b1-4a1f3775fa9mr44357515e9.7.1792504797648;
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214e1sm6231804f8f.37.2026.10.20.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:59:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:59:53 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery
 GPIOs as open drain
Message-ID: <atdz2TonrGyL9Ox4@Lord-Beerus.station>
References: <cover.1792326585.git.stefano.r@variscite.com>
 <20261020064106.197223-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020064106.197223-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_070001_335826_B6ADD09C 
X-CRM114-Status: GOOD (  16.49  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:41:04PM +0800, Peng Fan (OSS) wrote:
> On Sun, 18 Oct 2026 14:32:23 +0200 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
> > The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
> > Symphony carrier boards, are missing the open-drain flag.
> > 
> > This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
> > match the I2C bus requirements and avoid the warning emitted when the
> > I2C core enforces open-drain operation on SCL.
> > 
> > Stefano Radaelli (4):
> >   arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> >   arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> > 
> >  arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
> >  arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> > 
> 
> LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> BTW: Do you need fixes tag?

Hi Peng,

Thanks for the review!
I treated this as a DT cleanup since the core already enforces
open-drain operation on SCL, so I think it is fine to keep the series
without Fixes tags.

Thanks,
Best Regards,
Stefano

