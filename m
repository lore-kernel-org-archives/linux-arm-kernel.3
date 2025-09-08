Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF536CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9rZ3d8EMRlGLHfWRe9wMpV16pDXMhWX5ESo3BO7/WA=; b=ziX2sUfn0VCPx07O0G69mCxESu
	jJSSBDokzyUgpSeSABNjmqwGFpls7M12jOJ4shYRK9oyJBX2/Aqkt06xy0ybhLu4/7omQVFOAW0bW
	/y9PRWAaI5bud6lpeqH20VcVfdN1q2npjHnOELc9E6gVvW5gkZPHThyRT5wvyYd+s5Evn5QOiCgoJ
	VYSWYYwpb1Hbm5QCq5XnSuusxoxy8fdD+MVdu6use7O8cYGKYWAD4w7QOOFQwwyD1PrhYv5uX5gln
	fplyWvFhN0T563DIyjROiV7lmZC3LLoWLKUhJ/7NkzAgLoLs3Kk1xJwpont2J0dKfB76WDoo7YUcC
	KfL6LdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbdZ-0000000HHO6-2cFu;
	Mon, 08 Sep 2025 13:10:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvadM-0000000Gsvj-2o31;
	Mon, 08 Sep 2025 12:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=I9rZ3d8EMRlGLHfWRe9wMpV16pDXMhWX5ESo3BO7/WA=; b=aV/IGQwoS/ShpVMNbduRv0E4RZ
	Knqto7kfHTdbLfvJYV8DZTmic7WbkO/naocLblBkkpDRifO+ODhLnIRjoMG2MFBdrkFfHKlA/iRJi
	GYoot5Srho8NjrM/ywSUrq8o7SLLcZki0AWuOGsd3eUcy5M5GTD6aUCMa6LXeHQC7RY+Bz79fzrrS
	r+LWJAEmyp9sHrbUumIHd2hJq3qqt8nSZQ9yEI2rqmxDzUfn0aiOngdHGwjhFcbmZf9irtZaZVZ7E
	ZG8+9Dw0SUxt4VZb2ODNwF4Nh5G8vTt+4ysj51knkM15MtGm25cdjDOgQFDYIUUeuMstteat+0Uew
	g44iYrYA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvadA-00000006tNs-0qz9;
	Mon, 08 Sep 2025 12:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757333114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fwi8FJOl6mvelR+XqWpeg0MkcWyKjt9sal7ACIe4cUfDfR0xjaWqAwhNsyPa+9hf4Y8CghW1tV5Et2Rm0ZpwEZ++juzARRJw5ohVeHcdjMnOVdbQhN6mIOf9yKgKeO9WmYqXkB+0Z1AXPuM1OF6H0YYSQtVrxGDEG/wvnYYCajI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757333114; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I9rZ3d8EMRlGLHfWRe9wMpV16pDXMhWX5ESo3BO7/WA=; 
	b=WnXggBoOh0ucK1WGPTro59OrVuZ1/qvF3oGDjLmTp2x6wA36/fDCUgisKK/53HB4SB7Z1gQ8gO3h5UGHYVPGT+uXRBRPjM7ii5prDJ7bdTP5lv1VCZsQsymxxhEavmGrv27w/16JJIE3I+Uc1lVBjff7wJTdasqIfcPi0+LlxYE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757333114;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=I9rZ3d8EMRlGLHfWRe9wMpV16pDXMhWX5ESo3BO7/WA=;
	b=enOSjJUicizZ4eADZz53gBldVW80SHGJER79glDLzB0j4qALuUS6nrUge64Wk1LM
	AihHTD1HaAHt7sAhTG4UKcDXDICMq3Ze2goYEIXgvfZc+P9LLIp988DQ2620fFg13lO
	SbYM3SG8vCnkLF4VKrBdBSiq0dTPiYcsYWSThr08=
Received: by mx.zohomail.com with SMTPS id 1757333112565883.1464946521103;
	Mon, 8 Sep 2025 05:05:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 05/10] mailbox: add MediaTek GPUEB IPI mailbox
Date: Mon, 08 Sep 2025 14:05:05 +0200
Message-ID: <7865698.EvYhyI6sBW@workhorse>
In-Reply-To: <27159dc0-96f1-4d99-bf5e-cda0f9c7d307@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
 <27159dc0-96f1-4d99-bf5e-cda0f9c7d307@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_130556_630576_DC7FB3CE 
X-CRM114-Status: GOOD (  27.35  )
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

On Monday, 8 September 2025 12:06:01 Central European Summer Time AngeloGioacchino Del Regno wrote:
> Il 05/09/25 12:23, Nicolas Frattaroli ha scritto:
> > The MT8196 SoC uses an embedded MCU to control frequencies and power of
> > the GPU. This controller is referred to as "GPUEB".
> > 
> > It communicates to the application processor, among other ways, through
> > a mailbox.
> > 
> > The mailbox exposes one interrupt, which appears to only be fired when a
> > response is received, rather than a transaction is completed. For us,
> > this means we unfortunately need to poll for txdone.
> > 
> > The mailbox also requires the EB clock to be on when touching any of the
> > mailbox registers.
> > 
> > Add a simple driver for it based on the common mailbox framework.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Only a few nits in this, check below.
> 
> [...]
> > +
> > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
> > +	unsigned int *num = chan->con_priv;
> > +	int i;
> 
> int i, j;
> 
> > +	u32 *values = data;
> > +
> > +	if (*num >= ebm->v->num_channels)
> > +		return -ECHRNG;
> > +
> > +	if (!ebm->v->channels[*num].no_response &&
> > +	    atomic_read(&ebm->rx_status[*num]))
> > +		return -EBUSY;
> > +
> > +	writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > +
> > +	/*
> > +	 * We don't want any fancy nonsense, just write the 32-bit values in
> > +	 * order. memcpy_toio/__iowrite32_copy don't work here, because fancy.
> > +	 */
> > +	for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
> 
> Just use an additional `j` index, so that you can avoid division.

The `/ 4` division here is equivalent to a `>> 2` which comes free with
almost every instruction on arm64, I don't think having two separate
indices makes the code any clearer? Unless I misunderstand how you'd
want me to use j here.

Like this?

  j = 0;
  for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
    writel(values[j++], ebm->mbox_mmio + ebm->v->channels[*num].tx_offset + i);
  }

This makes the relationship between the values index and i less clear. (And
in my rendition, assumes the reader knows how postincrement works, but I
think assuming people know C is fine.)

> [...]
>
> > +
> > +	ebm->clk = devm_clk_get_enabled(ebm->dev, NULL);
> > +	if (IS_ERR(ebm->clk))
> > +		return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
> > +				     "Failed to get 'eb' clock\n");
> > +
> > +	ebm->mbox_mmio = devm_platform_ioremap_resource_byname(pdev, "mbox");
> 
> I'd say that "chan" and "ctl" are more descriptive as resource names, but then,
> do we really need to search by name?

In the binding, it was proposed to change "mbox" to something like "data",
which is fine by me, and to drop the "mbox" prefix of "ctl".

> 
> Doing that by index is also an option, as you can write the MMIO names and their
> full description in the bindings instead.

Yeah in the driver I think I'll switch to doing indices until some second
compatible forces us to actually rely on names because it adds a bunch of
other ranges.

> [...]

thanks for the feedback, assume that anything I didn't directly respond
to will be fixed in the next revision.

Kind regards,
Nicolas Frattaroli



