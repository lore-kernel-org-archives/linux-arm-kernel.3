Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CFBC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 23:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7u5tOwELlIMPfVVHAV+QU27fl4XVUJkgaxfyoSmFW0=; b=Qn4BqbkblxsgtEo3GraciXDJwV
	ZAcWmCvzApG9PEQaL9AtwAScxYldTl2Zljkz+tE3arhFm1y/+8jsKUrke1AGL1+wJLfAOZm4D0l+d
	hTCOU3haVrSiXHeZuT1Wp9b9TFtZ4x/VFZuU3Ujn4GaI6ewnxIrvE1Ne3HEtG9ikqtqgp/yHEpEKO
	5OS8TodSKbvAHw+HMAdyGmh+zUj7GicmO/clf7K2oPBCiHS8xA5Sk5Vsu5VCXXxpaIxfNrAC2xWMv
	oV9KJmUo4E9nvvPKKdaiucK5gDH9GP01iCIj5Xn92Nx3BY61BYIglH0GhJJRp5nzmdCMUzbqSg3gn
	tvn6hQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Vyr-00000009gwA-1MVT;
	Wed, 23 Sep 2026 23:02:25 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Vyo-00000009gvS-2oNW;
	Wed, 23 Sep 2026 23:02:24 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id EF3A01300061;
	Wed, 23 Sep 2026 19:02:15 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 23 Sep 2026 19:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790204535;
	 x=1790211735; bh=j7u5tOwELlIMPfVVHAV+QU27fl4XVUJkgaxfyoSmFW0=; b=
	D00YtSQcfkwYLg7smsLbBZtdZkZ1CYMeeNEMOYM2pxmNaG/vP0Xm5TgrL0hfLGYq
	Sgj0eWd0dzijyk8lO66N/wmliLYC5JM9Ec/q4urlezxSVGnjKmSYJD+4SIZxAvak
	VqBtlhvgQyr37vwsupp2o0Y7GZxK61aGNfLecrKMcxk+3FAVs1eX9wHXKXTNDJ6f
	RdlkHBdw+CwJClYLLfqOSJrviqrBN2MOdc+ZkxVHkDeyA9iXXJejklJVLrJBsNCz
	WVnxMR9uV7vjVZyGrz0DkWfWv0zqFlv120GLsbBRoPTI+hNKiGsKaxIJpM2kyl58
	00TaQvZ4+Kkz1TQwGhS8XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790204535; x=
	1790211735; bh=j7u5tOwELlIMPfVVHAV+QU27fl4XVUJkgaxfyoSmFW0=; b=Y
	eVLzyteJc5tMldl8xML6NOqBdv5rbTfLP4bVabHLIRuZnRgenwZjpY8ytnO609iR
	pNNpkxpOwTpv7zBFsE8Y3TtpgLMK3joR2UnJQO4mdtSK0Ahxk+wbJQrDolwkAKBo
	9BbHjY2UYLUO0Xe6XijrqURK7JpWyVqB3SvEjqwP4itUaZBRmr8Q4jmY96zTtLNf
	W3eocUkBdf3fT1DxDpa2fE6Q06/B5QZmnWZiJamYq7+CqIuMY6GD+BuTf6g1P6Ca
	TcS5nP4+K6lKm6GNwZO+RnL4Hpqlo1ZNXjoIFvzXXrGvK4Bx9Yr5H9e/P8s5R1vs
	mbrh02Mzh1qPYUyppwxcA==
X-ME-Sender: <xms:ZFq0arhH_lToFXDi_IRFMERM21IBzm7q2mhZaS6hATYp-mdh0N6TNg>
    <xme:ZFq0ai2t4i2fIPkxethDjnw-vViZcn11tOGFWzW9PgX6hIKslpReBibKgK1Z10SDE
    qSX-WnHXJ4hmYOJisHkUmL1bVQ4eU-12k4r_A99LPXJmImhifVQNtsE>
X-ME-Proxy-Cause: dmFkZTEkKM4ETCxSerEyDHeVt40vy9DtePqrvMOPsb0ZZk+82eF5HeEURM+7fpRUtYqXv4
    8NtvKSdyqnluNU/39Ouji4Iiwoo6OfRFvDjGW2pNLygO40R8oZQf0C71d+mps2BY2GtPxG
    DzrsERYcSMvKR72+F+OYjJ96KPPUqAoi0SpTVfeBPjczHROOvfziEplohX389sf+01ChRD
    K6bMZgHuf3Xu8WU7rjgxiTUsuuWF4e2Cecj7AwODXlOoh43GdODI2dqSpU22RJEcF4N4aS
    kCHlZEUDbAwW8hPar5VBkxiQq+sp3ePCgAHzX3jWcVkZStVeYgKIHHiKR2Osib42UBvuZP
    oXZhfzJH/iuOskrvAlHvSnBzl7uRsasPaJuF2bGDWu1C7oHdlzK+lGYgdNdYk9SshId/yP
    2t3E+lUnC9FojivDTPhHQSNc8DCcuu+KQ08Qjemi8oKLJtPv4seXMMyq+58nNmkuqJUeYa
    I4BhI1IpATtt9Mf4+a033zhZsWqvoTfWh2OmAlxcJi+oZOrDDNax9uHfmhsn27V1B3jznk
    16ViRtovpCfbd3bvcbl/Bf7bP0iA4fygFs89MS+/SqML0jQM1SCVvJe21Gl8pjHcREa7t2
    aW52nvviTQFZHJs8AMGVSxK8v1z/TFPVmzZBFgzK9TM1zVwxxBR0m9rMt/mw
X-ME-Proxy: <xmx:bFq0ao4tR8DZwxiYCJJsI2Bs2W3sKLsCIbHjvSCZIUFe6SN_YRHx8g>
    <xmx:bFq0akyuXqZMNAkEtrdT_YHOy_KJW0I_DSCLn8fR-MrvBaqjU7ye5Q>
    <xmx:bFq0aqWa3J5IqC6sruiXSk01XNyfZYw0pEQi_oN_orbDd8jjVwCE-A>
    <xmx:bFq0am3Lm0ejSmkrPPAfUu3v_l7vM8L0g6A15Gd5CWIEL86QMMvJQw>
    <xmx:d1q0aveAcJg0t45_AVTbsPTxC7wj2Qywc52rkYQCCQ2cJ0jGOuMF1uQc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CD07532A008A; Wed, 23 Sep 2026 19:01:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARoswzXc42gB
Date: Thu, 24 Sep 2026 01:01:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frank Li" <Frank.li@oss.nxp.com>
Cc: "Ulf Hansson" <ulfh@kernel.org>,
 "Aubin Constans" <aubin.constans@microchip.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Cercueil" <paul@crapouillou.net>,
 "Russell King" <linux@armlinux.org.uk>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Jesper Nilsson" <jesper.nilsson@axis.com>,
 "Lars Persson" <lars.persson@axis.com>,
 "Johan Hovold" <johan@kernel.org>, "gordon.ge" <gordon.ge@bst.ai>,
 "Vinod Koul" <vkoul@kernel.org>,
 "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 "Jared Kangas" <jkangas@redhat.com>, "Brian Masney" <bmasney@redhat.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Linus Walleij" <linusw@kernel.org>, "Fan Wu" <fanwu01@zju.edu.cn>,
 "Rosen Penev" <rosenp@gmail.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "Marco Crivellari" <marco.crivellari@suse.com>,
 "Pedro Demarchi Gomes" <pedrodemargomes@gmail.com>,
 "Zhan Xusheng" <zhanxusheng1024@gmail.com>,
 "Pan Chuang" <panchuang@vivo.com>, "Khalid Aziz" <khalid@kernel.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Rakuram Eswaran" <rakuram.e96@gmail.com>,
 "Takashi Sakamoto" <o-takashi@sakamocchi.jp>,
 "Runyu Xiao" <runyu.xiao@seu.edu.cn>,
 "Matthew Wilcox" <willy@infradead.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..."
 <imx@lists.linux.dev>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
Message-Id: <67966b47-22cb-4b07-80c7-2044f557dbcb@app.fastmail.com>
In-Reply-To: <arRHOJXxexYgKbPQ@lizhi-Precision-Tower-5810>
References: <20260923184612.3583132-1-Frank.Li@oss.nxp.com>
 <eebb66fa-12e2-4553-8edf-d131b84a8aba@app.fastmail.com>
 <arQpj-pn15NRgSh8@SMW015318> <arRHOJXxexYgKbPQ@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v4 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_160223_133185_41A171BD 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 23, 2026, at 23:40, Frank Li wrote:
> On Wed, Sep 23, 2026 at 02:33:35PM -0500, Frank Li wrote:
>> On Wed, Sep 23, 2026 at 08:57:04PM +0200, Arnd Bergmann wrote:

> after enhancement
> 	consumer just need call
>
> 	dmaengine_prep_slave_sg(chan, data->sg, data->sg_len, slave_dirn,
> 			        DMA_PREP_INTERRUPT | DMA_CTRL_ACK |
> 				DMA_PREP_MAP)

If that works, I think that would be perfect, good idea!

       Arnd

