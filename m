Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37173606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w74ZuS+Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GIsMc5I5;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kUmatMKE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hOD5mLcBK7GdDzc+hP/nBfTeNhiJpFKyDAI5dsuQmz0=; b=w74ZuS+ZuqVhGj
	qTrxG8o4TFJiSRxrXfs2BMR+iA55ljxJKFFXMyR3+kkVxkamzWa1q194QTsTEEg25I8Mf37bbagKS
	v96NdZYg1/HJUfsfY7iqJYH9o18xPn/7LkwNZEMA/0TJkS456rOx7RCr6VC0xsiNp1od19Wf5kFhu
	lNM7YCTpjpICmzsrFouTzadi+63+QuMHHPFqVx27Uy9EgLaz+Nbal2kEzoi0eI4SZBW/WnSNIaj33
	MPH7Ca6PgwPZ6muBcQIiQwxj8utfhP3fyHkgscHOVoT1fOT/ZKE26dUNIMDRP9jPfHwQq64Kl4ieS
	WmuxItE70AcToXohyFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahU-0000000CcGA-2Zbi;
	Wed, 21 Oct 2026 18:06:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahF-0000000Cc4z-0WoQ;
	Wed, 21 Oct 2026 18:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hOD5mLcBK7GdDzc+hP/nBfTeNhiJpFKyDAI5dsuQmz0=; b=GIsMc5I5AiBEmtzkakH2pvFS5V
	G+CcIkIlRQd3k8dYe4Yk3gQAYY45Zjkh52vBjojwlKeDJYEHXwo+ab0GczhrLPrbOmE3V3fRNV4xZ
	arxUOc70kjKmhF3o3IQtbMB5gETqY9cvMXcETLxfkNg19TYZbTFyor/x5jCZr2tdCCcr4S3HB9wOi
	/f80/PDDEADQrOvVV1MsXT2whSaBtWh9h2k3WWXKCyxWzR4uP2AxgZAFbwISxvXxR8tB9VstUEEwp
	rXz1J+XGYe2IXK3WjSKW/8iqQ1m8M3xV9PMd1neQP9tEMP1zhHtOtpjt1/xh49lzRTeYJ8tXpCe8I
	tffT1+9g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJahB-000000066hI-3T5K;
	Wed, 21 Oct 2026 18:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=GBz8KxB0mYTo8vmR2wcwHafVwvgU21md1OrcI7l2HBc=;
	h=From:Subject:Date:To:Cc:From;
	b=kUmatMKErNeM9ljzSWIMX+UQfYouqzl3ucc7gFAwICBSvYokGLFupD/ydnSGdfnhF
	 lAa+5EeOTkuACfy0hVyAbMqPFyEtqTa9iIjPfnXKqBo9NW02XW3LHuyRPUNo6Dalye
	 PqIMadd48zR/igZuF4++hx+9Ai8FGce2XyjuRYTyeYS61T7Xg7k2dwxkJzuLO/xQ2f
	 iLklXjn3QYVvoIJb2tBT4NCOGiKYgER0ue3DGDX3rVSezsdM4UcyrrasbRACIdp0Gp
	 6T0VUgEZUe5s0DqASTHGXt+NfsdEDZP3ORtMu+IRAjmxoQvKe+xEeqsPYt7/5GECFT
	 ABOuFIaTyHi0A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ECB017E07EC;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 60A3D48002B; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Date: Wed, 21 Oct 2026 20:05:25 +0200
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOy07DMBAF0F+JvMYofsSPrvofiIUf48aQ1sVOA
 qjKv+OmFSCElOUdzZy5F1QgRyho11xQhjmWmE41EPXQINeb0wFw9HWAaEtFqwnHluOc3Kvr4xn
 7d8d+0mGYAGupwTDJOs8Zqsg5Q4gf64en51suk30BN17V+0aGt6m+Hm9ryJoC2KXjMY67RoVOB
 B+YV86iq9DHMqb8uVaeyXpwL9dtlZsJbrEUzNqOC0U57F0aBmNTNo/138rPRPwyKd82RUUJFYa
 CJow59i8qv1HS1otNVFZUSRG0UJoBDX/RZVm+AGE++sC9AQAA
X-Change-ID: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5152;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GBz8KxB0mYTo8vmR2wcwHafVwvgU21md1OrcI7l2HBc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vfbPeL02jCoNIekbPtoQlNPY+XtBmtvX
 cWUYUEIHQl93okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qa8b4P+wYNFLYmfkpGcFycLnG2Zl0B1mN+MmmzH3Y5PVp9rjv7vePW9Ie0U5yb3GUtbB3Cq/o
 nfNuINH27ifU6aPxRVG45ylk0SPJM08wzwoY3gBPKo9tbgZlcxODxrzFggr5tqKjlccqzXb83Aw
 IyaC/JQS0XcNRt6DxK22rCxYLyLKu+O2ueEVX4CDhER8AHCzgtsv9Nt3ORxhztldk0IxfIo6Xl7
 kHGaIw6olCK3Q2W1Auahkc832leCOlqRde2p8DQd3GcDLz/amq7+8yRvZ4px1+0it/2b8kOmM7a
 QGW+QQj2RN9avpWfZ2KbJGYtUm7aS8PnbAFmnlsNZuEAsuc8hNscZlKFIcaSH/qm3rIJxihfpM/
 9wV71i21sj5BMubWZrQU/AuoPEm8sp69RLnG5gp9ofRhh6O7hVMq9P+wZAnsaatTFw6id96/ddE
 rksO6eOFzTPvRdiqH7Zkx7kAmFcYQq4jJQ0UBLxZbo3A/YlgcPWM+j9duFR7CSAWByFgITLo9Ys
 MgjRz9JetqE1L5S19rLtJtc+wYFqHxF05x6UB49fJXw6n5oYOL+A9Xy8l6+4DeRqLEFiWgxsxlI
 Z2Psj+1qW5cUu6c7tPYPEw3iYVZD9u05mB2vU6+QUlImDqBHW+2Ko666m7L6RGC3DKUgACf7foZ
 fbGs+L7TCFIPO1NUX6Kg1Cw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_190549_990332_7DDCC929 
X-CRM114-Status: GOOD (  25.00  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The recent Rockchip platform have a combined PHY, which does USB3 and
DisplayPort as well as muxing the lines in arbitrary order. Changing its
enabled functionality requires a PHY reset and as the PHY provides a
clock to the DWC3 controller, this can result in an SError. Apart from
that the PHY might not start up correctly when the DWC3 PIPE interface
is running. This series prepares a Rockchip specific DWC3 glue driver to
help out with these problems. To become useful more patches are needed
on the Rockchip USBDP PHY side, which are send separately.

This was split from the USBDP cleanup series. v17 has a dependency on
the patches that have been merged to phy's for-next branch. There are
some additional Rockchip USBDP phy fixes, which depend on this series
(which is effectively also a fix).

Changes in v18:
- Link to v17: https://patch.msgid.link/20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com
- Always clear UDPHY_MODE_USB in rk_udphy_usb3_phy_exit (Sashiko)
- Add reset quirk stub functions for CONFIG_PHY_ROCKCHIP_USBDP=n (Sashiko)
- Add NULL check in phy for loop, possibly needed on older Rockchip platforms (Sashiko)
- Hold DWC3 lock in dwc3_rockchip_vbus_handler (Sashiko)
- Drop 'struct dwc3_rk_phy_nb' left over from prev. versions (Sashiko)
- Rework the runtime PM code to rely on PHY side serializing it for us,
  which simplifies things (Sashiko, myself)
- Skip reset in high-speed only mode, as the USB3 PHY is unused and
  it does not matter that it wouldn't work. (myself)
- Due to the rework, make the reset callback return void (myself)
- Replace useless cleanup from unregister function with WARN_ON; unregister is
  only called after phy_exit and afterwards reset function can no longer
  be called (myself)
- Use modern guard helpers for the spin locks (myself)

Changes in v17:
- Link to v16: https://patch.msgid.link/20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com
- Add new patch adding just sw_mode, which was part of the "phy:
  rockchip: usbdp: Fix power state handling" patch in USBDP cleanup
  part 3 series; sw_mode will be used by the dwc3/usbdp reset quirk now
- drop generic PHY reset notifier API; I discussed this series at Linux
  Plumbers Conference with Vinod Koul and he prefers a local driver
  hack/quirk instead
- rework USBDP and DWC3 rockchip glue for the local driver quirk
  using direct function calls
- Ensure that the reset handler in DWC3 is only called when the PHY is
  initialized (and thus DWC3 is running)
- Also set vbus in the last patch when dwc3 is configured to device only
  mode (in contrast to dual-role mode being in device mode).

Changes in v16:
- Link to v15 (sorry, I missed force setting the revision for this
  part in the series split, so the series says v1 in the patch subject):
  https://patch.msgid.link/20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com
- Update first patch to also build the PM functions even when
  PM is disabled
- Add new patch for defining an empty usb_udc_vbus_handler stub
  when USB_GADGET is disabled
- Add dependency to Rockchip DWC3 glue, which disallows the
  configuration with USB_DWC3_ROCKCHIP=y and USB_GADGET=m
- Collect tags

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
 - Do not add #if IS_ENABLED around the DT compatible blacklist in the
   generic driver, using the glue driver should be mandatory as the
   generic driver results in arbitrary system hangs. Thinh Nguyen suggested
   updating Kconfig for this, but did not clarify what that means.
   Current Kconfig works the same way as the other mandatory glue
   drivers.
 - Split series to simplify review

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Track PHY power state
      phy: rockchip: usbdp: Add reset hook support for dwc3
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: rockchip: add USBDP PHY reset quirk
      usb: gadget: define stub for usb_udc_vbus_handler
      usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

 drivers/phy/rockchip/phy-rockchip-usbdp.c |  82 ++++++++++-
 drivers/usb/dwc3/Kconfig                  |  13 ++
 drivers/usb/dwc3/Makefile                 |   1 +
 drivers/usb/dwc3/core.c                   |  17 ++-
 drivers/usb/dwc3/core.h                   |   9 ++
 drivers/usb/dwc3/dwc3-rockchip.c          | 227 ++++++++++++++++++++++++++++++
 drivers/usb/dwc3/trace.c                  |   3 +
 include/linux/phy/rockchip-usbdp.h        |  31 ++++
 include/linux/usb/gadget.h                |   5 +
 9 files changed, 383 insertions(+), 5 deletions(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


