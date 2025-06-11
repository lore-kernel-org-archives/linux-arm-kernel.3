Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9E9C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=; b=sOOgLkhWNxzzwlnShJbWUhE4kO
	HSnRzWRpSYCP33L6dVOPAX+d956u4YVGa4hrfPD3zJmo2TxyNE6WnAq2SP3GYuD/cPdYi7/HJY45L
	pQTP6Lxmp4ozvsjcyFyVX/FqNS4AiuUD+8QWbHQJ3IlwwIV9TPCaWVO74URYd8NtuXkYIvwduHPeF
	fa/59mQmyUbbLIuWIAbPXhiTMnYH6XijzYiMJuRE+3WESRpkrduIjWHTUMg1U6uti45vzskiTFg/V
	GR7EnHxgYyRFlYOGK+q40n2q3k/N2Zwy7azR5avhP6afIC9VKq3TrWThOFb2lNg0Ki4Km9zVbykFL
	DXFw82Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU6D-0000000BUs6-3tLr;
	Wed, 11 Jun 2025 22:39:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQxW-0000000AwtM-095C
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 19:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=; b=h71diutc0HOWtaLi+JVbnKjw4r
	x5B54R2uQ5eGos0qcBeB+xdgUtGAYIekB8u1qJJEF7BhAY+EqMgjiCez5OE/rVNb7y3VAH+Hcy1MO
	jEohbsFBj6alzNwzoV/lMBgSnguzESxZpF089D7K/k++j9/01ltBciP0HE3u0dWBrTfVBo9UQcWSx
	JGBXdlUBsGiASqV1U5Qx8j3nJw2FM4qvUcmtRtcDxiCyyGpByDnnpQGzeb5swHC4bqTFghWZkP/Pc
	Qt55ecYHHwpdvN4/qrh4b7klQciIs59wIJgKH1u7jSARRrsQ9bbGnTfdJxZlgJyQ1B5pUFYHJ33ph
	p0iUJcZA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQxN-00000002UUY-0rP3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:18:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so712205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749669469; x=1750274269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=bt06Ow3RWr1MDppTEf869G199JaU8SqGtUfcuoVn6ANPzesRp+BNhkF36c+4muZuWH
         jiW2Wzsd89B09+KbN03GXVHDKhPOhpgR5lUr0BEklFRinVtglUBSKluxodInXcFrdQT/
         HNJmUkvZvkoTESx9vlIC+9ouxQfxegYoX3LpWXvHtmsVcRO3pLhnVN1m4M7z1RX6Bjpc
         f3rTo3dwevy4zPiXkC0wVreVZt4/LsykVHyE5+S8/BrKHmgVd7F5MjX9XIjQVYa1qqOO
         tiPpC4xudbHGqvQZelc0NxM0R9B79iZsOQblNs2aShP5tRwzeblgdKrQSxwIpX7FfPGE
         gMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749669469; x=1750274269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=gyTCptoEcm0yZJb56ZsbI4OzmqPiUIr4y8Vhzek7G29G9nZXk39oQ4HCG4j36Sp01M
         tqX/rMTAbEp4jFrSSAiFvpIotekvR6ilP/I+32bxiwcBXT8hV8QgH+BYcHOdxA53ae8W
         vbfRe4cHI+fxqaoFnrK9EovoQyptStjFBykOC3WtaOpAoQHGt/p3yUPexZdlD9Fdax8p
         Bwww/Zx8WMUokZjgd8D6wPLjhI7lYqY5h4mbX/krIsAkUIdFL5LzDhF5PjIp2frKzLNN
         tOFPxWlYPAUBYQCiHoKd2/D5jEo7GaMMf0ZKCQ0c0+RyFFQ7gWLfTi4ZJdA2FjXG66rl
         X+9g==
X-Forwarded-Encrypted: i=1; AJvYcCV0Lsi367Rl+G9BbmFyMeS19eFmCaFPIiQOQDPP8aqAGRQRvMob3fZ/4ribWKnvXP2x9oAK65JyYcIMNFF9Kros@lists.infradead.org
X-Gm-Message-State: AOJu0YzkwLYdCblVNMdxbbDAzg4BkiXwSpW7nKN0psffs5ydWvA2+HBo
	o5wAhxt6+9mFu8oIXWZQsBr+1zrFzYN3CaUdftOYj8R3juiI3oLK4BGu9th79mQGwa4=
X-Gm-Gg: ASbGnctWPxSaxvucY0JjNrfomoDcp2FqBoFFZO4PjyKyIiSTQHcG8mZ6BkWlul0kinD
	PzuZUpYmpSFedcC+QhGxAeVqwOG+shh3m7/C61WyMKL+drJIiEA3d9vhOQgguoS44yFbii3VLVJ
	FaROPY9RSwfuhpF+Z4EfhIlIDkJuNAbK6w95jSPdApDmo9WuA99oh9Vo5Vg39DfrTv8tmhrbf4X
	J6vYjq0KvfGeRJikWcbY4hA+nFwGE3x3+ur0mEiNVodU6SfRS7jVs9dLbrBt6Uhv20xQCOwNfDQ
	m1oie5IyqJGE6aKAW7evCXK7ylFhZ54Bb15V/fazZ9A7V8aYwJ3Ss5Kx4U99qoBMzM0=
X-Google-Smtp-Source: AGHT+IGJ3NQ8AU+WANwLf0nZAuX7XDSfVjhF8GwX89vHnWLiFcZb6a/55FgYJ7VjRdDmwl1wu3ltxw==
X-Received: by 2002:a05:600c:6612:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4532487b346mr48416505e9.14.1749669468976;
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm29370725e9.21.2025.06.11.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:17:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <aEnWWPgXseRGdSz1@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
 <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_201759_173418_42BF8F00 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, May 28, 2025 at 05:40:17PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:39PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > Enable USB driver for the s32g3 USB device.
> >
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
> >  drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index ce207f8566d5..d062399ce15e 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
> >  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
> >  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> >  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
> > +	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
> 
> If it is same, suggest compatible string fallback to nxp,s32g2-usb
> 
> compatible = "nxp,s32g3-usb", "nxp,s32g2-usb".
> 

These are the same, yeah.  I'm not sure I understand.  Did you mean just
add the "nxp,s32g2-usb" string to the driver, and put both the g2 and g3
in the devicetree file?

regards,
dan carpenter


