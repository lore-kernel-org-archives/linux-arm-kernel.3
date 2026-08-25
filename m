Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502B9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu2NX5WQU7lXnOIBq1D5RPPESP5Qndpwyx9mUpie3Rk=; b=ZBkz7wPk+0cC1iVDTx8s1mcD9O
	KW/fYo+FHX/gPohUd1wVf66g3fcYb3q5TBnuUgpWsGsan17y5+BS2YDMmgNo5ET9bxsNof6MqFBxt
	phkigquT/2k0Q76LM1sPT0aQY0MiAYK8EyCSJo90sf0/WV/Yzo2ab+t6n5oFHhVzrE/CVq/POHfWX
	nocUu5Ib2q124If2iPnNHdfk4id5hfrwR7OgoI/3r/ZYJ6fsc2llty5nK/cgKjqkoilJgXNKiJreX
	Kkn4h3oP78KYvNLZDVeGcKjJ/LtztCfBccRrcvDSIzDp4w934i3NIf01bXAjlZrQqqmbYaHZUmNUR
	5CLW2B5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyp5w-00000000fQA-35uK;
	Tue, 25 Aug 2026 11:13:32 +0000
Received: from mail-m16023653196.xmail.ntesmail.com ([160.236.53.196])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyp5s-00000000fPd-0TiV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:13:30 +0000
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b42473f7;
	Tue, 25 Aug 2026 19:13:14 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: Frank.Li@nxp.com,
	andersson@kernel.org,
	bryan.odonoghue@linaro.org,
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
Date: Tue, 25 Aug 2026 19:13:00 +0800
Message-ID: <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
References: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0389fd69e09d5kunmfc72ad39516699
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQksdVkhNSkJKTklNT0MeSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=g6sSXvDmyQWkNKsuejnsoucOf08FtjSwsRNkWjRVUoH/E29b1E0J9z8qeSrVwN809tPpS8Ilc0BD+F/R7/QBNEetBJKtHhWfzAyZyZSq2UVy8DqjM5ZjQyY7oJMoNXKLyV9aXvejDAWSEkdToPQ2lF1y4Bqdk+hw7aVITxyVexs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=vu2NX5WQU7lXnOIBq1D5RPPESP5Qndpwyx9mUpie3Rk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_041328_820113_2F322E57 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Konrad,

Thanks for the review.

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> > RUBIK Pi 3 ships without camera sensors, and its two connectors support
> > multiple modules. Keep module-specific nodes out of the base board DTS
> > and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> > sensors.
> > 
> > CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> > overlay describes the 24 MHz sensor input clock and models the module
> > power domain controlled through the connector PWR_EN signal. The
> > baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
> > regulator.
> > 
> > Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> > and associate it with the corresponding sensor. This lets the V4L2 core
> > control the LED while the sensor is streaming.
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> 
> [...]
> 
> > +	camera@10 {
> > +		compatible = "sony,imx219";
> > +		reg = <0x10>;
> > +
> > +		clocks = <&cam1_imx219_clk>;
> > +
> > +		VANA-supply = <&vreg_cam1_pwr>;
> > +		VDIG-supply = <&vreg_cam1_pwr>;
> > +		VDDL-supply = <&vreg_cam1_pwr>;
> > +
> > +		leds = <&cam1_privacy_led>;
> > +		led-names = "privacy";
> 
> No reset GPIOs?

Yes. The RubikPi camera connector does not route a dedicated sensor reset
signal. It exposes PWR_EN and CAMERA_GPIO, but neither is connected
directly to the IMX219 reset input when using the official Raspberry Pi
Camera Module 2.

PWR_EN is connected to the module's ENABLE signal and controls the
module-local power supplies. CAMERA_GPIO corresponds to a pin that is
not connected on Camera Module 2. The IMX219 /PWDN signal remains local
to the camera module and is tied to its 1.8 V rail.

Therefore, there is no board-controllable reset GPIO to describe for
this camera configuration.

> 
> You should also have a reference to the mclk pin state to make sure
> the correct pin function kicks in

The Camera Module 2 provides its own 24 MHz oscillator, which is
connected to the IMX219 MCLK input on the module. RubikPi does not route
a SoC CAM_MCLK signal to this connector. The fixed-clock node represents
that module-local oscillator, so there is no corresponding TLMM MCLK
pin state.

The Camera Module 2 schematic shows both connections:
https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf

RUBIK Pi 3 schematic (CSI connector, page 13):
https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Best regards,
Hongyang

