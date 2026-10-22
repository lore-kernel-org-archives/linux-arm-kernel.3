Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF526606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2v7zrTr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0ThdBVk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VMwAi1eN8x7Ostj9pYIqVLUHvczC37pf1z6i56KRaM8=; b=U2v7zrTrgWJIqyLXlPFiqqcxSm
	/IovisFmlQyyK52ocdHlwXgKBbsfxc8ZEV1YJn1DnDdmsCGt9Yae/YD9ly+x0XvyYHHhNiq2VzPIj
	9SypZYpTbI1YlNqtGI98723IofVsTw8zfvvr7lhmJghM+eJY/EQgo5dq/T1/GotMBHFa7l4ZyDld8
	mBMgVnWkZBxvFg8Xh4TS000Rqp2sOIxqBCGYpaFe1otQ5VmUpsLUn/P1krTs+E91zjPyY0yU4+DU5
	vb+l0HyoXIDaMR58dnLbg3cctyF3gSkZZe9goVpj0HSvol49rNSDqeQ/EgGDucFZJpAvqtyUFd5Sh
	8mOACU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtpN-0000000EIht-0Fig;
	Thu, 22 Oct 2026 14:31:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtpK-0000000EIgn-0l4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:31:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso6058365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679488; x=1793284288; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VMwAi1eN8x7Ostj9pYIqVLUHvczC37pf1z6i56KRaM8=;
        b=g0ThdBVksWUSGGkaoPQbvtqd8a+/5pWLVRWtviGsEMfaABYkorlniwhA6zskzv2W3v
         3mkvHvivYK8TH3fGClVeAkZzDZwr/YoLGYMA/Nx3S31IR9Mqysyn3c3SBtCtAhLhgFFJ
         SHyvHuElKtwm8JGwrfAZU+p6qD+tSyjc2x/Dpic8/2H1rmxfURrUfkb5fWW+cJvx3O9G
         zwNAXWy0Cvx/Gsg6b/YHK8KCnqR7I5hGeBMuNJs1I9AvSyeC5e8U1wvBj/ZrLaO3xQry
         y9xegpNiQGZIPNMB4srDKHAJrdBESpNXEJPMXiW3RDpFdCHfGXvD292tHd7EC065c2ep
         wUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679488; x=1793284288;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VMwAi1eN8x7Ostj9pYIqVLUHvczC37pf1z6i56KRaM8=;
        b=zJRdsEs3etWpTzQmg0NZX9hR+RgXlKhRkPty6k5MMRdKE8RWsiV4e7rjmG4wwHHVzd
         BKapmPOwzOnv1hIjoTKJuKJFwFSLhgskOAsY03o3RcfO65wYwfnqq8i8Q0O+4m4MlNyd
         xXdrRD96caxq6GTpOLWr5vJnHyfFoaekDC78/V02KiXx2vq3pZ8waMGJxcPA4MjgeCeJ
         UgUFe7WXRUkglc4LceEhH1ay/l4rmXL/E5jF60W73QSztxnX5gd8H7Fncr523Q0oegX+
         OUpnD/AD7XcZCAp07kUmA4FK3CEz+V21vnZrQOEjxB86Y3RoRejdUzvSruJHJ5DDujUs
         f3RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzir511Wr6k7NYDH2xrtFzb/Rx5fuPBhZDcEmtiZea6J3PuGomTh57p0l+vZ1wd/ENZISA19gFEn0Q9THIADyHF@lists.infradead.org
X-Gm-Message-State: AFq9FYJD4chvuYBwIbAMkdYFN0YQn2Nsq4ZeEuUSf69KZb4N9zlPt41U
	12xyAHo9RzakoZrWUKd3UznqarNPfQfz7T5py0FgotZDkp2MALAavkl8
X-Gm-Gg: AYBFou1Xl6COsefnVCNxT3VJSlcF5r9TBqKQKGQ9P9mwXVgoaEYQ1twQnjbyS/apa6B
	+2yCKrKym8Xk73pfZgWPGHBD/2V2W0d4Kia0SVeTKo07VBGd73DPOaPyMx2bx/k1R7BsN1hdmkN
	LSPNfGYtozEF5pazfh4Ovs+tH1l/HlrjzBHDgaeUSczuSsoDan574KOy9DhI8l9/3ibUiklKzZG
	GgfcVRYmgWwhJcEaNXZZiKIziNsJLXfg2Hz/yOYcOwXCpgvvqhrpq13GZVUmHMJecBw9DZq8rS6
	+tdw1uAp0hyykYsVKw7SjDZrO7e/KXRl4XLd+IPZNrrCuAnf4+8xswaAS7QR8JuWAS80icMXSaB
	KoOajva19zSgPMlD9HrsPeA7CThAlmXxZxxdEm8sbnUzeGUfWivTTSBMEGhzA/nHbkKSCP9F6k9
	4vkuUOjrRYOSvBEs7Os1Ph59mpExR2Qp/wfuw4DeVgEoAVnfwRnWa5CxvuSgVN+nZzY0/l1sj12
	fD4nnm1TTt8IslC88on/cBEJTxcPSaAyETV7Si50Vy9eniWQ7t0fhs4KQMzzJWXjhvrWTo2nOiU
	iaN2TpyRaW0Iqe9YWgDoSl792nUwbtOwFNliRfx7dIe+g5RIr9uTOKk=
X-Received: by 2002:a05:600c:4f91:b0:4a1:e0e3:7fe0 with SMTP id 5b1f17b1804b1-4a1fdd0fb13mr106097695e9.12.1792679487933;
        Thu, 22 Oct 2026 07:31:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:27 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640
 camera overlays
Date: Thu, 22 Oct 2026 16:31:24 +0200
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0e2moC/4XNwQ6CMBAE0F8hPbtm2xIET/6H8VDbRXookNY0E
 MK/uxBj4onDHGYObxaRKHpK4losIlL2yQ89F30qhO1M/yLwjrtQqCpssIZM0fkefJjqMELHsSZ
 QNBDJuBkqdFVtVIuqVIKRMVLrp/3g/uDe+fQe4rz/ZbmtX1riEZ0lIGjb6LIh655Ne2PJOJrOd
 ghiw7P6gRJRHoKKwYuTutQMcv7BdV0/H/Z5uB8BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_073130_272051_73EBFF17 
X-CRM114-Status: GOOD (  17.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add shared OV5640 camera overlays for Verdin iMX8M Mini and Verdin
iMX8M Plus, and support a second camera through the Verdin iMX8M Plus
Mezzanine.

These patches are the follow-up promised when the OV5640 patches
were removed from v2 of the Verdin iMX8M Mini overlay series:
https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

Verdin iMX8M Mini and Verdin iMX8M Plus can use the same 24-pin camera
connector on the Verdin Development Board, Dahlia and Mallow carrier
boards. The connector's sideband signals are routed to different GPIO
controllers, however, and the two SoCs use different capture pipelines.
Describing these details directly in an accessory overlay would require
a separate camera overlay for each SoM and carrier combination.

Following feedback on the Verdin iMX8M Mini series, introduce a binding
for the connector's sideband GPIO nexus. Add connector mappings to the
carrier descriptions and stable labels for the SoM-specific CSI media
nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
and all three carrier boards.

The binding intentionally covers only the connector's GPIO signals.
MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
existing bindings and are connected through stable labels in the Verdin
device trees.

The unsuffixed camera overlay describes the current camera module with
its 27 MHz oscillator. A separate overlay supports the legacy module
with its 24 MHz oscillator.

The Verdin iMX8M Plus Mezzanine exposes the SoC's second MIPI CSI-2
interface through another 24-pin camera connector. Its camera control
signals can be routed through either the default or alternate GPIO
jumper positions. Reuse the connector nexus for both configurations so
that they share one camera and media-pipeline description. Provide 27
MHz and 24 MHz variants for each jumper configuration.

The default GPIO routing is intended for a single camera because it
shares control signals with the native CSI_1 connector. The alternate
routing permits native and mezzanine cameras to be used together, but
conflicts with the Atmel MXT touchscreen GPIO.

The shared 27 MHz overlay was run-tested on Verdin iMX8M Mini and Verdin
iMX8M Plus. Both shared camera overlays were compiled, applied and
schema-validated with the WiFi and non-WiFi variants of all three
supported carrier boards on both SoCs. All mezzanine overlays were also
tested both standalone and in the dual camera use case on the iMX8MP.

When fw_devlink is enforcing probe ordering, camera probing depends on
the GPIO nexus support from [1]. Without it, fw_devlink can treat the
connector nexus itself as the supplier of the camera regulator instead
of following gpio-map to the underlying GPIO controller. This can leave
the regulator and camera waiting, for example:

  i2c 2-003c: deferred probe pending: i2c: supplier regulator-camera not ready

[1] https://lore.kernel.org/all/20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v3:
- Drop the Cortex-M7 remoteproc and UART_4 overlay patches, which are
  now sent separately (Frank)
- Collect Frank's R-b on the dt-bindings patch
- dt-bindings: Keep the all-ones gpio-map-mask and gpio-map-pass-thru,
  as discussed on v2:
  https://lore.kernel.org/r/20261021-huddling-fabulous-75f0298c2fad@spud
- Point to v3 of the fw_devlink nexus series
- Rebase onto imx/dt64; drop the dependency on the Verdin iMX8M Plus
  display overlay series, which is deferred
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- dt-bindings: Drop the unrelated GPIO controller node from the example
- dt-bindings: Describe the physical connector (24-pin, 0.5 mm pitch
  FFC/FPC) shared by Toradex carrier boards, following the discussion
  on the compatible name
- Keep the toradex,camera-connector compatible, the all-ones
  gpio-map-mask and the absence of gpio-controller
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com

---
Ernest Van Hoecke (4):
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 30 ++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 +++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 ++-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  7 +-
 18 files changed, 534 insertions(+), 2 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


