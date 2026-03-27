Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B710ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xtu2xKU24myRwQOk9cD2GRQKYnMGvF6fQQgu2QdaIVo=; b=IVS0Elmogr7ISE4UQ8fjtIG5bo
	fSSyViGkbLt7+l1jKLD4moZpGAj+rhzkjtGYq6S07nle6UkdBsg6+uqnBDK6rMER02AUajWdQUQpx
	hCikcGiT00LO5WPbm8GU5UbbBjcnZgX0oi+johgKck9QuhCHAP709AP4CgTzybs0VQPAM5BRSZkzH
	m6WXqkcESs2g8v2ZJRgm8+ABgjBCBQetTGFG0UolYOPUkN64/SekgbvdUeL+jWxQPs5VTWPmTXGGW
	kfVh3zLYSbAKzWQ0Vra2eIpQfrJ8q6P6dESmnyqjQtf64bPOW8ve6VybjIijjd9nWMMFhKzJEVmur
	Z4i2lJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67oS-00000007YsC-3yZz;
	Fri, 27 Mar 2026 14:05:24 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67oN-00000007Yna-1n8L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:05:22 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-0-165-nat.elisa-mobile.fi [85.76.0.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fj2Tf2bXjz49PtJ;
	Fri, 27 Mar 2026 16:05:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774620311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xtu2xKU24myRwQOk9cD2GRQKYnMGvF6fQQgu2QdaIVo=;
	b=mza3c35Kmh+arZTcuM8M7dyjpYU+J4QtKVF7egPoeX584oYLBmaVOmJdh9mF7aO76FO522
	DoWBboy3qVOuO8u+vVnt1fgOtZXOizqeJKKxWdUq8b0U1TsGqC7XlinELtBNOraSxk7/kw
	/MNmwdNY6kZpfn64bbVMvS56foElvusEtf5QO7DEpFFM3lgoiyxHOk67ThXGORpJPuY3vR
	HQeYvhGpL+0yIp7h9qcRsGkhON81Zb/E2vdlRE1nOrLCgkB7s7jx+4IvfkhzLPfFhuTCJs
	yihinluu5OSsQk63s9tTEQ6sG7xlePx3hABKOR6hvKB0eg+N6KMo97vs5NGIOg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774620311;
	b=YM9iDk2dbFZCuGBcj10XBwYndUhXYqthGRKA1GZDwgbh7Mij3gYseCYAiwCOV8iWAaL6bd
	CpS77D2MIW0pA4iDtxTtm/C0io0Fy3tKySDftyV2ELZR2hKnpbzN45RBPOM6E0d3jHy1uh
	iGl0eqaVqoNeyS1eMFo+X9tC+NrbvZoRlt4Ik47aG4CKmgZ2VeO4lCOTitGTbx2QeEyUGw
	lKC5z2/1FrP3PuapT5KtVprfW0gB4Z9t2wSgJzg2L7n8f38836XAaLTWVQ2DyJEaeYjLqO
	a5FNafQPCNT+FB2Wgq+CyGBOcP1JnyI8MLEKtICSYglSWOQTtZLIRFAxf+y5Rg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774620311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xtu2xKU24myRwQOk9cD2GRQKYnMGvF6fQQgu2QdaIVo=;
	b=IyWlVDjPWa1NvUpyWqmDQMeZy1hyYx0X8VEU2DGo/x/rdEfM8oyjQgLqlx62LrLnI8gB8t
	dCAIkh0G5B3/JufzHK4G3J6ngmtgNVw95p/gnjI11sMzHbNGtvVVCQUn2OQej5Fax/aW26
	92dHDzMI5w66A0cf7+9QhCcbcdJvOCAUQCxomR4HZVKT/n/bTDTAdSRdMthDoe/atoYSzY
	WMCtzpwyEdOLCi4d/MshN4kEuzDkB10PdM9BBf3ce8UgtGcj/c4Fw6C97vgJ0F5h2kUlP0
	scQSWBDV9aBtd0v08WPJhUjK898QgoxHgJQSW/SmsBbrTX3CVDoz94wiKzuaqg==
Date: Fri, 27 Mar 2026 16:05:08 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com>
 <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070519_687623_92674C56 
X-CRM114-Status: GOOD (  20.53  )
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

Hi,

On Thu, Mar 26, 2026 at 09:57:31AM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 16, 2026 at 9:50 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > On Fri, Mar 6, 2026 at 1:31 AM Kevin Hilman <khilman@kernel.org> wrote:
> > > Bartosz Golaszewski <brgl@kernel.org> writes:
> > > > On Thu, Feb 12, 2026 at 12:46 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > >> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> > > >> > Currently the board file for Nokia 770 creates dummy software nodes not
> > > >> > attached in any way to the actual GPIO controller devices and uses the
> > > >> > fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> > > >> > software node lookup. This behavior is wrong and we want to remove it.
> > > >> > To that end, we need to first convert all existing users to creating
> > > >> > actual fwnode links.
> > > >> >
> > > >> > Create real software nodes for GPIO controllers on OMAP16xx and
> > > >> > reference them from the software nodes in the nokia board file.
> > > >> >
> > > >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > >>
> > > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Aaro, Janusz: Can you please pick it up for v7.1?
> > >
> > > I can take this via the OMAP tree once I have confirmation from
> > > Aaro/Janusz that they've tested.
> 
> Hi again! Any chance we could get this queued? Janusz, Aaro: any objections?

Unfortunately the patch doesn't work - 770 just dies silently. This
means that e.g. CBUS GPIOs are not working as those are needed to keep
the device powered. I'll try to figure out how to debug this...

A.

