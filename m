Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C1C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeZJfMeEBUKgq5/BN6M8K1O5LEECpi0aBZRRrkDbOj0=; b=vABCE5KkMrJDM561AuequQ8cwc
	+AIJw9KNhhQiq03aZKcwc1obFZc7eLrAqXRtaYy/WXVacXW06Vjn1PzwlRKyg3lGFTC4SOuixPiWM
	S51wuCz759tcJazxsJ1ZHqUMoQdCB5/gCp3CDDmrk4OuRqcy6ctsqayuSVUp/nK3K1sBjjrqErR8Y
	ESKSpb9sXuM1S1NPW7SyNSnbM92dqePGWNqX/qlphMMz4DzS2RPqvoolr2e2dob+KtvlU0l1ot150
	gc2eoZpjCpKtLYCqgaR+VYNba8jBOW1RyqnuE6pQ4Su5E5Miybm60kFwIxaSy/I5fa7xhipPT2ntD
	inSykGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKK7-00000009cds-3b7a;
	Thu, 30 Jul 2026 06:32:55 +0000
Received: from mail-m93181.xmail.ntesmail.com ([103.126.93.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKJh-00000009cXl-2ucb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:32:32 +0000
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48229bf3b;
	Thu, 30 Jul 2026 14:32:22 +0800 (GMT+08:00)
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
	rosh@debian.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
Date: Thu, 30 Jul 2026 14:32:09 +0800
Message-ID: <20260730063209.101985-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
References: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb1b95bc609d5kunm33851e72421b63
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU5PVh0YHk1KSBlMTBpOSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=lUVes6gpRtPahu70dav9JcaPDiXD8qCqZEDGGd7mIF6iazNQSF2SLuWFhbFiC5Qm0Ryx+45wRAaCgxbLQeOjxf0u/LIB/JhU7IB3+PQfWNBoW7W8c4w9AIa51hpdJaGWdMNlkKAFgjbdY69mrPNJCOvIuUwizcDTV59s0mrNGPk=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=TeZJfMeEBUKgq5/BN6M8K1O5LEECpi0aBZRRrkDbOj0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_233230_287814_0432F9B1 
X-CRM114-Status: GOOD (  14.52  )
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
> > RUBIK Pi 3 ships without camera sensors, and its two connectors support
> > multiple modules. Keep module-specific nodes out of the base board DTS
> > and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> > sensors.
> >
> > CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> > overlay describes the 24 MHz sensor input clock and the three sensor
> > rails derived from the switched 3.3 V connector supply.
> >
> > Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> > and associate it with the corresponding sensor. This lets the V4L2 core
> > control the LED while the sensor is streaming.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
>
> [...]
>
> > +	/* The module enables its three sensor rails together through PWR_EN. */
> > +	vreg_cam2_pwr: regulator-camera2-pwr {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_camera2_pwr";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
>
> Is this (and the other) regulator on the SBC, or on the module (with
> the PWR_EN pin just being an output to the module connector)?

The per-camera power regulation is located on the camera module, not on
the baseboard. The board-level VCC3V3_OUTPUT rail supplies both the
40-pin header and the two camera connectors. On the baseboard, U1500
only level-shifts the PWR_EN signals before routing them to the camera
connectors; there is no dedicated per-camera regulator.

The fixed-regulator node in the module-specific Device Tree overlay
models the camera module's power domain controlled through the
connector's PWR_EN signal.

Hardware Schematic:
https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Thanks,
Hongyang

