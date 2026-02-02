Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10FCE7DEFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDIwIvjoA0KVZj8266aGVsS4EvreJW/WICQfNeIuAso=; b=2QGOfvVNNGzDK4cH28PTzPtUcr
	QoGo5JQjiuCgVT86AWCGM3xpKOjwM5X5y2Mnr82Zmgu304jP2WZ8vOGyBw1x3x6+DHDwXgN0t2NST
	KkIQAtZDwUU7aTMmpZB/h8LkVHfaGBaoyrVlEWx0NVsIpdkV12Wjd9SnkjAUTc2lzJt2hwDA1vMER
	vGx+XsDjIFKQePNL/6hGm3GgOZ8BSIKpJId4fqTdahSAkIkj/6RUXTtSEquciJnoDAf8ZO4mQFM6u
	MYw/bQwQ/QWb8L7cWKwpHUSct4yiQJ+mJWCjMJzPSleErjyq027brYoIZyLD7jFFNY61HhXLXqWmR
	Q+ENplKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwbc-00000005HNg-3V9Z;
	Mon, 02 Feb 2026 16:16:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwbb-00000005HNY-03gG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yDIwIvjoA0KVZj8266aGVsS4EvreJW/WICQfNeIuAso=; b=BZXVzu72Mi+mFaLCW9GV7PnHDX
	CNF1Js5zUOf3hXYmGZaHR/DDTN8FjoYd73/zmSny3pywa8w1MYJd+FNLtWQJf2GuRNlrrmXhJWieg
	A82TXCUz+PS6m4pT50SUL8L1Wd/DKMlWjj894U7LtbxNIP8QJ9f3j4ll6cTU06WSTeCKxFuwVKEWC
	ooXXJvwf0vnquoFBEMc4OfPsz4hfAjYKOFf7MtjEDPegOO4Z+h8nmZZnjiz9pVq5Qo79rvhXLQi6O
	8n1q6yCLdq+BfBp0FdQiRO5gH3AOGekG/7LVOmd7MTseatGziAMLW8Z/LUr0H9uDStCUmOGbGRSc0
	8IOnWwQg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwbX-0000000Eoye-33ow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 16:16:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a7b47a5460so25388635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770049005; x=1770653805; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDIwIvjoA0KVZj8266aGVsS4EvreJW/WICQfNeIuAso=;
        b=m6TMSqjGpOGHP3LIR4a+azWjeIYpkEq8EiEhdGtfsbwCowuMEuHV3kmLMq4D6QYfvR
         YcBkxtRCe5o1fuHhiD0+vd+GrtiGHZNKlOG70IBPda1iRqJ1g/HxNknR5xFVruUPmAQR
         FKGim5e2H5vkdVjiq9513j1lQg8xt1wmhmc3UApRaUM5Sk0HH29tC28D55Y/o0gVICGx
         3ezgL9Bee0dOhG7Tt8mXss4iHjQob8w4ElVeK7W+5Mw+ehyYx9DB2mWQHU3NESHiBDK8
         X6BIzpAvCNDzxVphpUoRTF2pnxjuwajTVDAbh+pzm+XpMw9+nJsqs+ijHA2HBw4uPC5f
         YqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049005; x=1770653805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDIwIvjoA0KVZj8266aGVsS4EvreJW/WICQfNeIuAso=;
        b=QHD/5iC+0X5vhnZc3LVStN/HiQmcDLi39MVd2Kw9VSEWlpoP5mGg0NVwBihWaVkWaT
         XH915jky59Lh7wBujpPrFlZogdHLokD6mLxqgaNbZx662NSUZJLRF72zdicUxDYgUs2K
         jtaUAMaHBJRkmSMr2hbS0Wqp7GfRyubFmZjwWgMGjOsOR4IFPPuZZo8TppGxBXkNGlOV
         7Fz8NleIFl9DIjht5+KsGOvOuHsvijt2h89Q8VtEyYDUAuiK6u/P6gDK5smD6k+5CM96
         1VAxIlsvRFNHj2gj/SnIzedZjdGtKVgVvL6PxHUEXCke3I0cplZOXUHO6ELIOQ4qa1Dg
         3yOA==
X-Forwarded-Encrypted: i=1; AJvYcCXElIJL+luc4dRNkzWXsyDw3vtj7ke4Go/kTNrpUJXRMniIVMap0JL57upJEtQ4mM30iQpwc0XC1t7KriUaUW3f@lists.infradead.org
X-Gm-Message-State: AOJu0Yze5v56jjarskMUvRTXPwqogz8voQ4JXXbEWZtzoPE3g1U+qhGK
	AmGk4e89M8TI7RkXBMxmhMVqEyFoLWifdqzsvrdaECRMUrYOUWYz+yiDw60OPQmqpso=
X-Gm-Gg: AZuq6aIUIFFXKwpsmpMVKP3CrOH44hLz4Uje3rAX0s8hoduNUcTVKpOWrrZMx8QTxvq
	v/8ao9aEMkxP23bqiPL8fNvNx2zLtXYnrRIcF8GGQ1/EStRQeWSF8dPGR6n1bWv2PgtYaqy310v
	c/w37syBASZgchkd4rgLtb2lo7UuL+n7SPt/YL0o1hTMMvf8ie2vuBOAsx73NSBgsK9FTpnW1kX
	W9Hqrv9iOdvtBRTXk1LJPsO3mdwOJDm65Gm5tJ8DmkNVC6Ozo3jgGaoiq05vkn/q3GEEPbeUI8r
	c5uwhIok2x/uQpUwr7kiEEaEd+gcGBB9VyAd5hRNVFefTB1VstRD5s2rIjauBLMTecLomkKJo+W
	F5/aqAgz1+OYnlUsOjgdid+nSnas/NceBn6B/Whh969kV6YZ3+2cRquPPtZ+D32+6DyKyjPmP0N
	vNn4riG5p0TF4dUJbK6UjDbuub
X-Received: by 2002:a17:902:e749:b0:2a7:5f26:aaf9 with SMTP id d9443c01a7336-2a8bd4c6f2cmr162675685ad.14.1770049004918;
        Mon, 02 Feb 2026 08:16:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ef20:b488:c934:4d5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4154fcsm147962315ad.36.2026.02.02.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:16:44 -0800 (PST)
Date: Mon, 2 Feb 2026 09:16:41 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table
 detection
Message-ID: <aYDN6X0WVT9nV8fg@p14s>
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
 <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_161648_025971_3FE9EAE6 
X-CRM114-Status: GOOD (  33.66  )
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

On Thu, Jan 29, 2026 at 06:02:21PM +0200, Daniel Baluta wrote:
> On Thu, Jan 29, 2026 at 3:45 AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> > resource table even when the current firmware does not provide one.
> >
> > When the device tree contains a "rsc-table" entry, priv->rsc_table is
> > non-NULL and denotes where a resource table would be located if one is
> > present in memory. However, when the current firmware has no resource
> > table, rproc->table_ptr is NULL. The function still returns
> > priv->rsc_table, and the remoteproc core interprets this as a valid loaded
> > resource table.
> >
> > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> > there is no resource table for the current firmware (i.e. when
> > rproc->table_ptr is NULL). This aligns the function's semantics with the
> > remoteproc core: a loaded resource table is only reported when a valid
> > table_ptr exists.
> >
> > With this change, starting firmware without a resource table no longer
> > triggers a crash.
> >
> > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Changes looks good to  me >
> 
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
> >  {
> >         struct imx_rproc *priv = rproc->priv;
> >
> > +       /* No resource table in the firmware */
> > +       if (!rproc->table_ptr)
> > +               return NULL;
> 
> I wonder if we can make this change generic because it should happen
> on other platforms also.
> 
> Maybe something like this:
> 
> remoteproc: core: Only copy loaded table when valid
> 
> Copy resource table in memory only when:
> * the current loaded firmware provides one
> AND
> * there is an explicit request to have the rsc table copied in memory
> via rsc-table
> 
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
> const struct firmware *fw)
>          * that any subsequent changes will be applied to the loaded version.
>          */
>         loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> -       if (loaded_table) {
> +       if (rproc->cached_table && loaded_table) {

But we would be doing the check for rproc->table_ptr twice (->table_ptr and
->cached_table should be the same).  The way it is currently writting forces
vendor specific implementation of rproc_elf_find_loaded_rsc_table() to do the
right thing.

The merge window has been pushed by a week, giving me an opportunity to merge
this patch.  Should I do that or should we continue discussing the best
approach?

>                 memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>                 rproc->table_ptr = loaded_table;
>         }

