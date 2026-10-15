Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D8BCC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=; b=5G5O6kQxz4/EfCf9kxYuQoVFRo
	wFbtxqGbcxxlKkS3Na0hensEa9VCKEr+7B3bmXayFsuRezvSioDQ1AzZyRG2SVdpXXI5fXzsoTz0U
	40TZPfz2cg5ANEGyP93etNIK+TGQi5h/hUFbfWC29ObJwjB6FOjDM4mZ3CIXPDL5m8Ri4zxkpjWLn
	4JXetkgBPn33mEHVXG8SD8Yq9wuPzSDpTbEG7CHbrhNb392KdiKFxq2hyMnY8ZnBhIKa9fLqCvxJf
	m0ZxD+dOm/Hpkfg0OYGZj3vQGR9wFfIg+cs0D9yFbtJPO3lCxmo/mXEPMXZNXDHYtlX2/q65jAkgh
	C6A+34RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJOJ-0000000HXmC-1qmy;
	Thu, 15 Oct 2026 11:12:55 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJOF-0000000HXku-3xan
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:12:54 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b042c0759so3805517f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062765; x=1792667565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=Tf+I3+oNlkXGOFXqOeizlJXujtUwzLsLjHeRftcYWnn/1LQ72iuD/83xh0W8XzWqwl
         pg/I7Ntl1Tv4vdXZ9+SLbgDeJ3X01DMn2mVt3sPZEPLeJf7P2Hg6CyTSIfk4ZVJeVEyC
         aY95OZMOxYycGWoo05fEt9Vmyc+OzBPUJXsUoOL+sGgoy9RefRykvem6BzaGIWrcbOCn
         iZj3ZK+OwjrqvbsKzCabzVKmYDV6NBDMDCxOOWJCY2JfGkz9MuRHQYoKZOY9GP+zdAi2
         9ppYPACNhV9TBSV0MGOQpfL2upOiEcBgDx+erdehRXX6rtml8sfxMRCFPGZ+5FjXRMya
         +48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062765; x=1792667565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=atj/vt0gHOdAdhEDh5mXLzc1H7Pe6VLLonRAPkSelKkPkT/Hs38cDfBfqoLhkCiW7w
         2g1Z9O5vOmuwPIo6cR6P6Gb9Lrbc3lV076qsRmfVDvipf/huHRT5/2a5UfO8u3K8qVBQ
         TeXAlfB3A3uHwDPzTviqZwZ1oqGoletv4Yo280io7QCklV+PYaB33QHElenTir6Xh0XM
         6BLZ2KagwUwL6Pze1XXFpR9/PYasqNSm+EaDNLdkxVcgQ5wtTuDGNCZjohTstlUguwOR
         wiyWAGouMQNss17yDfX4kTNVcdANEPCInsPNFsUCbXGSndBvZ28pyfapAGsy9ZY8Wf1z
         HABw==
X-Forwarded-Encrypted: i=1; AKwUvBzAuoXxjjK8hvi1gJ1u6bfANrsxOw2tQfB2Vj0Wbhgz1HQkJ+J+tWkWz9+NHgj8w0LDHD4Q2n/PymhILwlQsbLv@lists.infradead.org
X-Gm-Message-State: AFq9FYLsQBsxw/rtJFr6Q3XYyYdZhEE78QcN+EEZBo+DzeBMKhucjgQX
	EC1ioaQuBDYjYguPOosdyuX1BzkW99Q40ApjiBKNi4yf7wodIQ/Ye/SZ
X-Gm-Gg: AYBFou3HVLPNtuT7ysa4hQyW1W8UnCPO7VYEJLBCxVLVYum27vA3rzEWo4eTMU1vkCc
	l6KhTc1s8efkLmm1nJ0ShBQJ1yHRRGsVuQ+BJkxlC/VpXva4Pep9UuCRCUQD1PDpEBFd9cHYru7
	MrvoB6Ue73AdvecIjUFWy7/jly5s02OpWtyLOk8GOrLYxF3bCXGSjrkH707XhjIg2lnpiVrQp4E
	tj7HrLY0j0OFfeQUDMThlsuCfgE0s0WGlRcLBbMF8RhYqlg+so9/0eY1k3ggqlra4UfQjVKpUq5
	bYQh/4lXh0nh1WC4wcYuru2eMPVE4PvzjasxRMY4kfcJM2F0wwdQds0VwYl7FH4uJrYhugOwjgQ
	jtrZMzLg1cKJkuHAfqHJN1Xwp6Nlwq2MvJ0T4EMxg80pU4GGve0N7kTwWUpB0zxaD1q+DzfBW8E
	dqcsv6fS9Ljr8WiodjvFFqQZAdg++Up96+yrCHPMvjPQVpZFhS3cQLElyMEyTrtqGaXdV4lYoUd
	vmMUcQDcoCkIRFki2x8Wqu4tixTN1T7o5kl/IsTng0pzDgG1loBQmaHe7dkQavCGqAbet7z8Bl4
	qcMx1HDvM0+++ioTFU+VgwCQAj2P
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id ffacd0b85a97d-48df14ed887mr6757337f8f.25.1792062764555;
        Thu, 15 Oct 2026 04:12:44 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm24262249f8f.49.2026.10.15.04.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:43 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:12:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atC1KAbaRwnrn-mR@Lord-Beerus.station>
References: <20261015081149.5919-1-stefano.r@variscite.com>
 <atCy2Li2wrPHhW8K@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCy2Li2wrPHhW8K@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_041253_444793_6F968D1B 
X-CRM114-Status: GOOD (  19.33  )
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

On Thu, Oct 15, 2026 at 07:02:48PM +0800, Peng Fan wrote:
> On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
> >From: Stefano Radaelli <stefano.r@variscite.com>
> >
> >scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
> >following run-time warning is seen:
> >
> >gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> >
> >Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> >---
> > arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >index 3e590afa4fab..036afa0f6990 100644
> >--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >@@ -287,8 +287,8 @@ &i2c3 {
> > 	pinctrl-names = "default", "gpio";
> > 	pinctrl-0 = <&pinctrl_i2c3>;
> > 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> >-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
> >-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
> >+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> I think ODE should be configured for pinctrl_i2c3_gpio.
> 
> Regards
> Peng

Hi Peng,

I followed the same approach used in commit
2b1d5d054d29e08926f05cfa30e34d149644585e, as well as in the other i.MX
DTS files that use GPIO_OPEN_DRAIN for I2C bus recovery.

Even in imx8mn-evk.dtsi itself, I2C2 uses the same configuration,
with GPIO_OPEN_DRAIN specified in the GPIO properties and without
ODE enabled in the pinctrl.

Wouldn't introducing a different configuration for I2C3 create some
inconsistency and potentially cause confusion?

If enabling ODE in the pinctrl is the preferred approach, wouldn't it
make more sense to address this in a separate follow-up patch, updating
the existing I2C recovery pinctrl configurations consistently across the
affected DTS files?

What do you think?

Best Regards,
Stefano

