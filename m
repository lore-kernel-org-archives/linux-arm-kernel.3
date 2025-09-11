Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038D3CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZafrnNnDKJ160LOPQFJ9xF6eobBS3Hu2Wi+AoCGeUIc=; b=Ns8jy/2X7bix+/YwpB7mGxydEm
	sZEkr4MUtgnrwsC5SmjaAvZmWTFQVcXU1C5mm4yiJN+YMM0J/AioMcwIReY9DtlkInF7HQ07MRsGe
	u15VPpJAOQ3RGfNU7KAwlqk8riClKFTrYNtjDMfEMrFdjfPhMeS3HDsHtB1AASu+vtO0GD7uZiBi0
	/0yYwCp7/6YzINysljL3lqUHGB6XBKeHGktJ7B/p8spg3y9HBheLaGZbia5zeeikb/pea8v8Ytou8
	bAiBsqBVAslRWt7YrGERCoK+fwdVbsGI6+jAD0Z9yCG1WZe3hNVdidXZqXZJoWPtOer3EPXc5zR80
	LhTro9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXsY-00000000ZWM-0WB0;
	Thu, 11 Sep 2025 03:21:46 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXsV-00000000ZVF-18lQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZafrnNnDKJ160LOPQFJ9xF6eobBS3Hu2Wi+AoCGeUIc=;
	b=TEm9BVS6kxFJ1+fIAzNB6mb0OUFFX6gvB8pZqZ2MKL3mXTDiDoyWCUJScCH+/u
	RN9TinW1LIKg5bxEMtGIo187hpczUT+A2T3mf3PZJb0gLDnQTqO9FoSMFBPDcx4B
	5gD4jxBVFlCr30Sd+4AlONq0VeJHRKXziwJ50DH/4lZSw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Fx4yQMJohYVgBA--.16969S3;
	Thu, 11 Sep 2025 11:21:24 +0800 (CST)
Date: Thu, 11 Sep 2025 11:21:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] ARM: dts: imx6: clean up some dtb check warnings
Message-ID: <aMJAMimvJ_eIzr9F@dragon>
References: <20250903-imx6_dts_warning-v1-0-1e883d72e790@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-imx6_dts_warning-v1-0-1e883d72e790@nxp.com>
X-CM-TRANSID: Ms8vCgD3Fx4yQMJohYVgBA--.16969S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryDuF18Aw4ruw1fZry5Arb_yoWDZrX_Xw
	13Ga12ya13Gr47Aw1aqr1q9F98Kr1Utr48Wry0gr1Yq3ZxC3ZxGFWrta4UWr17CrW3tw1q
	gr47XwnrX34xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1sNVDUUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhTnTWjCQDTSswAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_202143_624158_99D58687 
X-CRM114-Status: UNSURE (   7.93  )
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

On Wed, Sep 03, 2025 at 04:19:53PM -0400, Frank Li wrote:
> Frank Li (16):
>       ARM: dts: imx6: add #address-cells for gsc@20
>       ARM: dts: imx6: add key- prefix for gpio-keys
>       ARM: dts: imx6: align rtc chip node name to 'rtc'
>       ARM: dts: imx6: add interrupt-cells for dlg,da9063 pmic
>       ARM: dts: imx6qdl-aristainetos2: rename ethernet-phy to ethernet-phy@0
>       ARM: dts: imx6: remove redundant pinctrl-names
>       ARM: dts: imx6: rename touch screen's node name to touchscreen
>       ARM: dts: imx6: rename node i2c-gpio to i2c.
>       ARM: dts: imx6: rename node name flash to eeprom
>       ARM: dts: imx6: rename i2c<n>mux i2c-mux-<n>
>       ARM: dts: imx6: replace gpio-key with gpio-keys compatible string
>       ARM: dts: imx6: replace isl,isl12022 with isil,isl12022 for RTC
>       ARM: dts: imx6ul-14x14-evk: add regulator for ov5640
>       ARM: dts: imx6ul-pico: add power-supply for vxt,vl050-8048nt-c01
>       ARM: dts: imx6: remove undefined linux,default-trigger source
>       ARM: dts: imx6: change rtc compatible string to st,m41t00 from m41t00

Applied all, thanks!


