Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFCBCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WIvcYfmGz43UyS9mZdtzauZkaqPW2hApKKl9BJ2aQ4g=; b=op0lZC9X+zXSpA/O18xNT2xdm1
	WuIK2bc3dpBctrp2nBctareMKs30tmkUGqzIMA4y2J9Du2+n/KzLyGC1Am9A+9C3KdfkCsRg95MdM
	A2hKKlWd+wMyY01+37HH3ppRo4xY+k3TqFvt1+aChvtYhLiPieIaUhfgvEX4lAmZzDfIKtOz1WEzZ
	Xj5C1W0kSXMFuAaocUDMmkoF1wTy1CvLfbiP1FrXF5y+MptxhTmOvZVLuNuwxKxL9KvSGQYOUfMO2
	Z4X/JSWP3Z5/sR/RDYnkYdiO8i5zYby1iDvfUJW9mrJsETn46EH/ydocopFh/4yfRpQ3+oIo1kTR7
	XTSvNw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Ps-00000001ccd-0AyK;
	Mon, 29 Sep 2025 07:35:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Pn-00000001cah-1106;
	Mon, 29 Sep 2025 07:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1245601EE;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A362C4CEF4;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759131313;
	bh=8kU9JJJKoTLv1+7TVZKBw078/6dDLnwJPZ/41pQAOlg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BG4WBHTkVVM3Yu3QLTM6fO7WFiKCgveG2HPH66NKi2Rcy4diRsrjmmkKcUz3ujrRx
	 ky8VDcghJ5CZfOOpQBo3Klxr61CqvoRf6tdam8rDnNW2l8if1gaTtPKRG9785QLHJt
	 INSXDz1suo1d8WDnTvPpy45Y1SaalRSZ7OiTbmFfJuNDhRGeN6jT+tWPySem5u8I4D
	 9W6csaeZPARYU7EjITQrT4x0ETQoxFbBXI4d9KwOwdEMyhXVOVu4Y8W8zFuV9pI2At
	 5wW5P6bMAcP8Gr6cIhKWPl28cojK1sQxBw9XzeyGtza0iwcMINmZl1M9WkpkwiuhFa
	 7L0Z7sE5jZvbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CBECAC5B9;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v4 0/4] Upstreaming Pinephone Pro Patches
Date: Mon, 29 Sep 2025 00:35:11 -0700
Message-Id: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK822mgC/5XOTQ6CMBCG4auQrq1py0/BlfcwhpTpUJoAJUCqh
 nB3Cyt1oy7fWTzfLGTC0eJETtFCRvR2sq4PkRwiAo3qDVKrQxPBRMoKwegwDGVrTTOXCgDbslO
 m9K6l2t16mnMJeVJrhbkmgRhGrO195y/X0I2dZjc+9jXPt+uPsOeUUcirCnSMAovkbDpl2yO4j
 mywF68Y/4KJgGFWAWSgZKLwE4v/weKASVVnWcprKfHts3Vdny14ueliAQAA
X-Change-ID: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759131312; l=3407;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=8kU9JJJKoTLv1+7TVZKBw078/6dDLnwJPZ/41pQAOlg=;
 b=DEXytXMmYJpHUBmD2X0aRp/a4VJrnruRIRvdqaJ3L96bCk32GzCYVYfgEX7BS4M6DwheccOe7
 IMid102DQ4iA2pcqT/v/O5TBdAWBqtnyM33GFw/lnQeEpX4f0JW5iYG
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Throughout the years, many have contributed to the Pinephone Pro (ppp)
development. Unfortunately, these patches are scattered around various
repositories in different states.

I will be attempting to upstream these patches. I will start off with the
following small series:
- Add light/proximity sensor support
  - Link: https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
- Add accelerometer sensor support
  - Link: https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
- Add magnetometer sensor support
  - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
- Add mount-matrix for magnetometer
  - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
- Fix voltage threshold for volume down key
  - Link: https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54

Unfortunately, because most of userspace (plasma, phosh, kompass,
hwtest, etc.) use the ppp's downstream kernel as a reference, the
incorrect mount matrix for accelerometer and magnetometer have
propogated to userspace, and therefore we can't use them for testing as
they will give the wrong result. Instead, we have to read the raw values
from the device and compare it to
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/mount-matrix.txt#L80-L90
as that will lead to the correct result

I would request reviewers to look at the mount-matrix tests and help me
see if they make sense. I've read the mount-matrix documentation, but it
isn't really clear to me if the values in the tests are the values I
should be getting

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v4:
- remove leda-supply and vdd-supply from dts to suppress warning
- credit Martijn and Kamil for the light sensor and accelerometer patches
  - Link: https://fosstodon.org/@martijnbraam/115272859701389599
  - Link: https://codeberg.org/megi/linux/commit/fc5660685ebe4ecf60226bfa27a1ce47c1c1d020
- combine the magnetometer related patches
- corrected accelerometer's mount matrix to Documentation/devicetree/bindings/iio/mount-matrix.txt
- filled out commit messages
- rebased onto v6.17
- Link to v3: https://lore.kernel.org/r/20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com

Changes in v3:
- change magnetometer mount matrix
- update volume button threshold
- Link to v2: https://lore.kernel.org/r/20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com

Changes in v2:
- remove usb-typec node in dts from light/proximity sensor patch
- Link to v1: https://lore.kernel.org/r/20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com

---
Ondrej Jirman (4):
      arm64: dts: rk3399-pinephone-pro: Add light/proximity sensor support
      arm64: dts: rk3399-pinephone-pro: Add accelerometer sensor support
      arm64: dts: rk3399-pinephone-pro: Add magnetometer sensor support
      arm64: dts: rk3399-pinephone-pro: Fix voltage threshold for volume keys

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 40 ++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



