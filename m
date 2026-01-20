Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085AED2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=; b=IlgMKAClelbD+4RBon8pl4cvIY
	OlDrQfmTr4jHcdX8GVhbluKfI9oTCYSEkWHkB7If5qBon5lR396fMLe5tTTSXSegcxnU4ZL1oQ8sZ
	lhSOHzevlvJPfWKYaKlJuY3XkJtLCSMAWmxqMySytNsAMwOCgRu37UrleAJzexalK6a6lIjwvOGci
	6XanX7C1RK+xD8n9zu9Aa48Cd08y9CUiP+6MPG8IlWTMopJbudMUPb1rlBDeJna9+Ips1692T8jnx
	xwrJgrNZ0QS8yLHed6EiImPRV87m3BozaLOYTKvWM5ay/7e+Rrlga++mrKT7FPOLNi7RFtS6nSa8J
	Zc50ya9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Jv-00000003Tfl-1Rdl;
	Tue, 20 Jan 2026 08:42:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Jt-00000003TfC-1pi8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 08:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=; b=GdOGvrQoz+T4RQ4tpUK9JUXMuC
	n0cYtVP3WBfnO25zPUi/+Ooa+q2NlJ8eJ0kSkYQrfWV1in+vdzsxP0pIjBHdX1fqABlbTg67EaNhf
	Lhq+xeskrs9ZiNt9HLAxvYbrrvi0z/m6IWUzzAGoRJ5lpLxclfhjEW2cJr+OdUUL9WEatQFPQnFVt
	9/jlpbYU1DRnOgRx9RFfIATwfMT045kE8sHLIqKdXlTLmQ1E0hWFPJW9iBVVgBAjuK3A4cLVc5fyU
	67cVU95C7Z08Ndzmnee4GkzWAPBOpcVf0xmIND63XkoDfBG4LRNYK/wcdlPMOqnDga0iUHDbsn3hd
	/Vj9Af/g==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Jp-0000000DcJS-0hMh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:42:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b7d213fd6so938715a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768898551; x=1769503351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=;
        b=d2mkjZMPLWwDJQLYujUkqUcyKGQOsDUHMNbLa4L35EmM77gymR5SddbRoOvUL+Moi5
         sScMjtHKYmhIaHdHvaiCqKPf44myrzg64w3W8XJL9URcYdGjsSp83kq+HB5h0Xr3XI2A
         78RV5WmK5c1yLt0T5DgFA0FcZQD0zEl30EJfu/RICKFJn3UzxE4AqVBVY15Lisq8odQl
         mlMOMxBFcSZeA8j8mmFtn79QU2avXvtxEcZKSh2FOfdh+ifXsug3UiSjVoWV01bLNVI9
         MLB77eDgMaf6IZMfTQoNlYhB8QU/fvpCdy0/OGaHHd/FEpbne4DF/w/UbXkfEOkVgigl
         pkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898551; x=1769503351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=;
        b=phRHaluGnJKgsWreckxUR9Y1p38Z02Q1yRbuN5t8lIjANBsJeH8oTasNhErJ+AVy/q
         uPKr7LKhdrREUS/kFgSjFwi+qe2sBPqHPlJSmZBuTm1WBHzKL1Gm4wc5+/zVlBlwSasT
         Oit4UQyTTIBnFJqB/ekKpkgSWjHxMpz2aaU327NjxANC5mUDoZ5TMFUMTv6tbryTJEQ2
         EpuULKkCFUdcHCcr2vxZp4UglfkIlYS5MIXa6CxnRoZE//w2JbVpxCmjZSUGjgRijl/Z
         mS4lEu4rD9yA0yZEoKTU8Vo2bOm2ncHnpj2yD3aLA13slZi5xMO5TA0xt2/SDSV+33Fr
         nfvA==
X-Forwarded-Encrypted: i=1; AJvYcCXtl15lLARgl+KBQaazWCZGhMiIC3/JBCv+nXSa6RcYtTQwyPEgM1rFtwlSu0CqGLVa8YEUKlx0NwYBsdU4OGiU@lists.infradead.org
X-Gm-Message-State: AOJu0YzQKTVF9bq6nCIy1P24rDreobRmdhce/PAt2ed19xzidBEqhO4q
	EV2UI8s9/H5eOUjXt1W47GYg7f6EZRNw4iH/fNYciOTdscv0GKR4MjxV
X-Gm-Gg: AZuq6aKvWIhMgvHiytkPws5oPEOa6ZFqMERlDwWg3jziKA3u91ZBlTa7pqZhZsinCrH
	T83EkZE1ayQzZ1+ET9r3+wymuoU/MiL2DL/Baaw8kFi3NCZSeJpF5adqIG80qafF1eFWThGDWJt
	d2nTjEBqe3IdfQTesJygDoeAN1eDdShzLYB8hwrpfHfX1avjW5T02zPTyOqep3JZFPmeKcchDpy
	Sc0lnY27uf8dJTAMatYgiFPkYLktYWEs1Z5JGUfPzXFftPTw3NhT5dQSEM71OVIQt1jTHYUhRLJ
	jXEmrd0AUuorHJeXTmXkPQMHx87Y4xQ97kZf9WJWzVwEH0QbzCj4X4HnkFVw9yV/i64zttSNRQ6
	I5TBZEjnNT/gquLxfGxEi9hSsVN1BZf/4JUYZ6UdSQmNBi/ZAoMZRnssz5bAkOm0r6eCrWiwU66
	c/3ZY=
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id 4fb4d7f45d1cf-654523cc85bmr6267784a12.1.1768898550768;
        Tue, 20 Jan 2026 00:42:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e72asm1348612966b.11.2026.01.20.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:42:30 -0800 (PST)
Date: Tue, 20 Jan 2026 10:42:27 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120084227.j2wgbmjsrpmycpgn@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_084233_297891_9ABF6C30 
X-CRM114-Status: GOOD (  34.48  )
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

On Tue, Jan 20, 2026 at 05:04:53AM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 19, 2026 at 11:21:25AM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> > net: stmmac: add stmmac core serdes support
> > 
> > This commit adds SerDes PHY support to the stmmac core driver, moving it
> > from platform glue into the integrated PCS driver. The SerDes is managed
> > through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
> > for the power state.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > index 2f826fe7229b..4d1902f3a58f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > 
> > [ ... ]
> > 
> > > static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> > > {
> > > 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> > > +	struct stmmac_priv *priv = spcs->priv;
> > > +	int ret;
> > >
> > > -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> > > +	ret = dwmac_serdes_power_on(priv);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> > > +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> > > +		if (ret)
> > > +			return ret;
> >                         ^^^^^^^^^^
> > 
> > If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
> > a powered-on state? dwmac_serdes_power_on() succeeded at this point but
> > there's no corresponding dwmac_serdes_power_off() call before returning
> > the error.
> > 
> > Looking at phylink_major_config(), it appears to discard the return
> > value from phylink_pcs_enable(), so the caller won't know to call
> > pcs_disable() to clean up the power state.
> 
> This AI analysis is incorrect.
> 
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

More to the point, if dwmac_integrated_pcs_enable() fails at
dwmac_serdes_power_on() (thus, the SerDes is _not_ powered on), by your
own admission of this PCS calling convention, sooner or later
dwmac_integrated_pcs_disable() -> dwmac_serdes_power_off() will still be
called, leading to a negative phy->power_count.

That is to say, if the model is "irrespective of whether pcs_enable()
succeeds or fails mid way, pcs_disable is called anyway()", then these
methods are not prepared to handle that reliably.

