Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF837CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=; b=31rvkABzDmDzP9mVDsqq1+zbS/
	Oion0ydqalNXI2VN19FdjnpbirxBJtopYNVkWIb7xgEoZwQLRbjwFfgbMCCKKyMs1C8payDv90WDY
	XB+UVP4Mlb0wG3/S+PFInmt5NfxsC6XjuTVrofwHWq1WfBRZTH2c6w9vCqxCSxsoJ54V3lcX7xSER
	NfXj1Rc2RZZ1rizzTEXYuC2djFzS6/xcHF6VAeF2a1skfAWLxAzM/SztrlVUPMVqdf/Zt/Tb5NXf/
	AzFz1weGmNnUmeXfLTDE4YvBLSpIVfdg062XCTOHuUhKqrtbtMnvgfokXgge6RNh24EMe+qY1HJXj
	KfAY5s5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzcC-000000084k0-0B92;
	Fri, 12 Sep 2025 08:58:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzc9-000000084ic-32jK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:58:42 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso1408402a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757667521; x=1758272321; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
        b=QM3hMFXh6PUYPZI7FpKigpEy+DdqfRxTEVTsBjNaCaOy6KKmiVpihxfym1VGERiz70
         H0UlmcSO6/oUbrLuXXi+YqZ98Hd3Jh4sG/eg+ILCO1kde5infapOFbbb8//zOcEvNtUa
         0ayrzrdESh9nZnm1loL0853GR7B6TQ63NdQfLbvQe5VkuL8gpIuJ7s++yieCE2hWgRFY
         nikJlYEPQ9vlgf88qCS5gK4dCLWrB35grBbg4mNhowZFSxCY48dKdlth+d0JpBqVXjrp
         K2uPyfnB+kgosG+VBveBnT+adRpiBdR4/tkCXapx4dTUkFA8kaPNp2LOWsIam6tdzFin
         NLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667521; x=1758272321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
        b=rhOG8yvFT4xc3iu69AysgFBlrc+ivMV8xfzfNwuLvH70X8N+MUOa0KqWNVs9zzX56S
         4bOZUe9sGzeBYPxsFGjZUblvtvbBbKv1OmXLgaHDUaIE+ACkQk8DLO7jyJwtW01r8umo
         nfeAiC0bAfc4QhQIgE99829cu9GsbobZSk+72NN9/BZLPwMYpXW8JT3nrngbagbsdanm
         /wYKuu3UlxV3OHPtxWJiR1/rXVvEMUVA0DFBxziEpRelKbQfATBbnPtopcsl6w7s9XTV
         jlPZE+GU3YRIdnwmqr7ztoaBGw7F1O8M1WMeRTGzMC+msUzUYwRRI+7WFSQifEbZsi0q
         WC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0empM8ffJbM3lhEU1vNmtc8uhWjAttKQOYqc92P1Y3EB6Va1iPdARNhaV2LoavqassC9wxfui1qg+xV82ibS@lists.infradead.org
X-Gm-Message-State: AOJu0YygfVhr0llfEmpf3N/mcdmqa4L3bCdYtWqwM+bFzgarlbfQgnXA
	fjAxGdxV3TaSRjmivBq370/gXzYhlXEFgRQNVgveQWHTy/KJboVIdzSIxkT6MzTvui/7l1/NMWF
	7FdMhd/iSowxupP7I3Hz7gC0g0R/IFfQ=
X-Gm-Gg: ASbGncuBYszGn1irgQjC4rhZEea/+jFIoi9rQmz/ap/e+PcsTyuNKhczmlXU77bdk4+
	pgSP0zTVqMLr2CYiisvyQkZNbCuFevmV9YC+LjOdkS9pKe//rvPs2uT9FP9dN2AH+mhDWudKF09
	HKVvTYBT01mQHdip7UIVptNhkw0RlmptnBLD4cymVrDpKK62iwr4qlaYdGZdmBnxgXB5g9c3tOA
	a8a5Cf1jgtd0reoo9QQH1yi35GMD2snA0Z4IKhUfIjX8KIJuVhGwxEFyn4=
X-Google-Smtp-Source: AGHT+IFQRimSGNTZUF8rsCECFnkgLkqZ++YXJEJA7EhcHsbtO0t6DFoZ5dfeGu/99EC1Bwvu0xIa9exB4T1QYyticTg=
X-Received: by 2002:a17:903:3888:b0:248:9e56:e806 with SMTP id
 d9443c01a7336-25d24100ebemr28596975ad.12.1757667520671; Fri, 12 Sep 2025
 01:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com> <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Sep 2025 11:58:23 +0300
X-Gm-Features: Ac12FXwYlGvGgqyGXugiWWObiJmtXxlEmnlZ40W_NSnxtz2WGuiuVYkoCU-Wo6s
Message-ID: <CAEnQRZB-yoV+BYsM-9CvmuSZw_8EF3ijtZhqtBoJOoyUc+-pSw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops introduction
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015841_789504_1AE22710 
X-CRM114-Status: GOOD (  16.25  )
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

<snip>

> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
>
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.
>
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
>
> Mathieu,
>
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?

I would go with this as it is now. It is easy and clean. Lets always
go into small increments, test them across all the hardware we have.

Then we could come with the next patch series.

