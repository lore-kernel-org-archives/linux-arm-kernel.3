Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3A4C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpM9Y/DW/rPww6MoRecMawp94vW2lyXOoX1QBOllpIk=; b=Fy+kXqeAUmTD9pC/N6Y+PNmXAQ
	qydZdloDFx42MqiGmtg8xsLyj5/awAqsPBvP2XYfE72rAuie7Ppt4hUbKsKZtR3G9iWbS6JsN/OS2
	e+g2UbbLFODqpA5e+eF8l9uCuB0z0z+bM6WSJUSDM1uXihSMUvmKJoFV3efAWD5liAwaXoyl5tK8J
	UwBHmHS/p2QL/jqBiiC3hSIWiuS/NaeyX4oadH1QknbDHovTwedH4hgJAAcSBCOc1v+WpaWcrDghL
	phr5O6MSbvzvbO714VwLQb4gyJSIGWnkhEtgONqRohlnulYedUfHSzVUrGETJnIIKNBByC1OUUcVO
	Fy9w28QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHUx-00000009RKU-1qSz;
	Thu, 30 Jul 2026 03:31:55 +0000
Received: from mail-m158240.netease.com ([47.251.158.240])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHUu-00000009RJP-0RGe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 03:31:54 +0000
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481c9b915;
	Thu, 30 Jul 2026 11:31:42 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: Frank.Li@nxp.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hongyang.zhao@thundersoft.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	rosh@debian.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
Date: Thu, 30 Jul 2026 11:31:33 +0800
Message-ID: <20260730033133.63823-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
References: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb113f1b109d5kunmc26dca11408bbf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEtCVkhJQkNJHUhIH0hMTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=LxfXREz7/oJn1rTqqBe7zYYcNmwJmZHwqlClRstYIi0c3doYORY0AN+nEIVzvOmwe/lEL4jYoNjnkQcxgXUnsF4PaEtQ2wUicCjH2B11+UdzUArtRtdOseABWpfboUwCdVcLKmnoxSVnBzi0B9DlCj9yaPtYfmn3ZSrWy0FovIQ=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=CpM9Y/DW/rPww6MoRecMawp94vW2lyXOoX1QBOllpIk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_203152_802634_96CA6362 
X-CRM114-Status: GOOD (  14.29  )
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

Thanks for the review!

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> > Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> > supplies the two camera connectors and the 40-pin expansion header.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > index d8a9a7e47bdc..45514918562b 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > @@ -214,6 +214,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
> >  		regulator-boot-on;
> >  	};
> >
> > +	vreg_vcc3v3_output: regulator-vcc3v3-output {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vcc3v3_output";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&vcc3v3_output_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
>
> Is it really on by default at boot?

Before submitting the patch, I measured GPIO14 and found that it was
already high before the kernel started, so I described the regulator
as regulator-boot-on.

I have now checked the bootloader code and confirmed that it does not
drive GPIO14 high. According to the schematic, GPIO14 is actually pulled
high by VREG_L18B_1P8.

Therefore, I will remove regulator-boot-on in the next revision of the
patch series while retaining Bryan's Reviewed-by tag.

Thanks,
Hongyang

