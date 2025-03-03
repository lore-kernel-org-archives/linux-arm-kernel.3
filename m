Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2043EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40IljttzQ4D51zd6+tKieDE6wTjSWdKsG254DqLzf6A=; b=19cvPmpV7zDgH6MT1lIg9SfmFl
	OEdQbvwyUXwR0PDRFWkF9LxIWMySgr4RMgWoXs1CSELAB+CBrPvjs/5sEW5ag1WC+gFsum5MMKo5V
	l6EJnz+3faT/RuCY6lxuUlG6QIaRIrLiHmiSKb4Ff9ZWJddMKrgD3iZy0bvqhdz4OCQolL0z0g77W
	WlAea8emAyrhaMkoPctUjA+uBYyHuk4xh01SuLd6jTwqPlBoWdkTh6SZLpA+oOfNbKZBv0EVc8yDe
	ju/tpfoMkNwjyJV9I8uXJSimAHHeixAxVRBmS429VfvIQNKtu4XmWPZb9LckTsp5wM4S8Ec77ttPl
	Yxl8x5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2Ih-00000000Asx-0bhJ;
	Mon, 03 Mar 2025 09:41:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp28V-0000000091W-3rjB;
	Mon, 03 Mar 2025 09:30:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394a823036so39904255e9.0;
        Mon, 03 Mar 2025 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740994254; x=1741599054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=40IljttzQ4D51zd6+tKieDE6wTjSWdKsG254DqLzf6A=;
        b=VFbhoSHzJDGFOAG/vxFwk57fbWbshWcnek0Dc15URXXZZbmhduFydfOTSRqAhQJcJH
         M+ep8W7C7apMhZr8sAXdHGOyoPTrMGXmgw2AVQKe76W38iZt2MkcYfoJtvI5Z43XLchy
         WSzSfDWtepBu7l1hqhe08CKc/uQMKnvNv9p9rpClIy+3ATm6SXLgjBTcSNPf+jvLSzLq
         qocHbbbHyhr97kiNkvpCaVi8Svql26yUcwKwS1gMzbxnkUmQtZuFX/uOxoFMfaC///Cv
         T+N8PGBB+sfaQSD1cxGjSI5/4BqRQMSJdWUaxv5r5nO98+3o4MvSYjjE+evzHbaG7rha
         fFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994254; x=1741599054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40IljttzQ4D51zd6+tKieDE6wTjSWdKsG254DqLzf6A=;
        b=H3dS1m4VdxpKEU2fBm3PrBdweWarCAontmgBXii3uPOWm/ujtDyGPIvRiUp3i6OhYc
         rj5dItjaxVEc7Xs/egyb6hrT3bEntt+iio5f7Lvp8e9u36Zci+LZaey4Y8j0+a9U/Gwg
         l0f8J58GsESyHy43k0QUj76vPiFpUrhc+btM5As7ytaF/i1wOXBCq/I+XKpyZPW8/UMH
         i1aKnS5U0JyVFLByoAMKI3HDIiFjbqHoDYlqezYiAvrfqeOyRPcavJqCzdj7aFxb7k1J
         hUgSh/aZavNtF1tCIeqtRezMmM2YSN1UwtndRYUVaP1/96ML9c5XJiBqctgJrrN9muV1
         WwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDLJqV7xebWl1icyNMO+CDL3oEAQJ0S/jVTq22h+zJJjZUFIZstoSddq6fdO2goCjcRpCRNSOiv9E3@lists.infradead.org, AJvYcCWHoMGPsnxakozTwUQE3JGwgI9smcf2YHzp3b/lNKpT2r0oM1y8Zv/A0YibsTWHKHopnRtTrJqa6sKIuThiYmeh@lists.infradead.org
X-Gm-Message-State: AOJu0YzvwabdZHMqXtWCYATX/wScxQscwmP4g3nd7MksQNdFA4sZ9+Gd
	RN/KHvXDe2NIU86ohG74sHTRNtgwePaAGj8RULl8hGhY38Z0KaJM
X-Gm-Gg: ASbGncupZXS+bNPdDbfvCugM3fDYwz+ElCDXpN5a1sgwtvUtLzzhANKVwJu15Hni2J/
	g1VYvGYthCaDzmuTVz62kswnOXV1ctpMqzb6IZclpARxGy8Gjqlwp1dMx3eny+EQOozStFiptFE
	6QV/ieQMa1Cv5zp6oW1U03gAYCD3ksUqnFoF1mEuHf+2cPIMh8OGI2Sg0835Ylrhq6duVUjlFs1
	B7n4TdqV13Z/+D61/p58Y9DttjbGK4PLFHWbnHsVSwP/uEKKcQxjqob3URj9JxCWN5tK2yNz7Ge
	8GPO4f5I2dlJEIXAh2Q4lrMwAxslxFPc8SBoFuz+/I5f
X-Google-Smtp-Source: AGHT+IE593cTzA3Ll5VUo6n9spv8sl0rB5EmPJ7Oo0urGlRI3JU+kEeG6M0t/EplWSVuxhmvW3R3dg==
X-Received: by 2002:a05:600c:4444:b0:439:92ca:f01b with SMTP id 5b1f17b1804b1-43ba6708bd2mr103876125e9.13.1740994253402;
        Mon, 03 Mar 2025 01:30:53 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:4dab:10cc:7f02:7565])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710c2sm179671575e9.32.2025.03.03.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:30:52 -0800 (PST)
Date: Mon, 3 Mar 2025 10:30:51 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: vkoul@kernel.org, kishon@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	tharvey@gateworks.com, hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Message-ID: <Z8V2yzfYGirBFi1u@eichest-laptop>
References: <20250228103959.47419-1-eichest@gmail.com>
 <20250228103959.47419-2-eichest@gmail.com>
 <c965906ea8797385399534e974cabdba5564ae0f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c965906ea8797385399534e974cabdba5564ae0f.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_013055_961112_75527496 
X-CRM114-Status: GOOD (  21.71  )
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

Hi Philipp,

On Fri, Feb 28, 2025 at 01:38:11PM +0100, Philipp Zabel wrote:
> On Fr, 2025-02-28 at 11:38 +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Remove the switch statement and base perst release on whether it is
> > found in the device tree. The probe function fails without the reset
> > property, making it mandatory. Therefore, always release reset
> > independent of the variant.
> > 
> > This does not change the behavior of the driver but reduces driver
> > complexity and allows for easier future modifications.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > index e98361dcdeadf..00f957a42d9dc 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > @@ -141,15 +141,11 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
> >  			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
> >  	usleep_range(100, 200);
> >  
> > -	switch (imx8_phy->drvdata->variant) {
> > -	case IMX8MP:
> > +	if (imx8_phy->perst)
> 
> This check is not necessary, reset_control_deassert(NULL) is a no-op:
> 

Thanks for the feedback, I will remove the check in the next version.

Regards,
Stefan

