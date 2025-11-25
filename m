Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E057CFD377
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 03:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZdY3WSRToEhlT2BgiAC8oPOGaj+fwERD49X+efytnPo=; b=LawIEqn8Z83bQHBk4JE6FCcAnt
	9wWgleJuAg9w5nMc/GI2dts97KuAyLGXDOQditEMdPJMEJ9yAS/c96EBiLZc7KnJ/lpkWx/2lF3+W
	NWUWHX437COIT58cUbqJ1PkghkZVct6tZugs8qvdrg5WC//kvAAHhXHda6HBXZW24Zb1OCFIUsNoB
	oGZ+v1p0z+HWyhBZFQM1XLUcxFpP/GzBHPwCGqhGRySX2vDlRznqP2jCs77/kSQ7R9qZv/bxqH4or
	5/DBpiZXaNYAICuYEXpyeh3FYYMNcJCgSt5mYeb1+ddI0eWxSi17fS/gLEsmWs9NZz8cQC1V1zYBe
	NmEYdWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1G-0000000ChGT-3ILt;
	Tue, 25 Nov 2025 03:47:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk18-0000000ChC7-2iqd;
	Tue, 25 Nov 2025 03:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 682EB40A89;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 395CFC4CEF1;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=JdG4DaI/Qc50V4Qsb7hZVw07NZj9J6447kSQIzMX7LQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WgYIdVszWFydSTrJDHB1qSrFtPaXPxGQHKZ3Wkm3dLWJbnKxU1irJR03TBNJSgOoL
	 DX9D7rOM8BCzAbGvK8ATOf2l4tHg4E+gWdEN/NGrSFYmGrfvqJP0arUHjJGw9Cml/h
	 18TqXDMyUu+cMUQmYv89e0I9O4f0XmyFkEAE8cqVf1d23FHZTgQ7eEmg7XXMdVoRWp
	 jXJKduD7mEZqwYkqoE6NhKSA060ibpydC89mVQ5MmwGjmIQEzDPgeRF5TGqvIRNqaO
	 vnJ4k7P2UNR1KvuBKJhASvAVvQlX05Sc+ZsvVowF4o0XFXN2E+pLtIhHnMUwyjuYPK
	 skswhxMop1r6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCCFCFD370;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v5 0/4] Upstreaming Pinephone Pro Patches
Date: Mon, 24 Nov 2025 19:46:59 -0800
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMmJWkC/5XOTW6DMBCG4atEXtcVNv4jq9yjipAZj8ESYASRm
 yri7jWsULNIunxn8XzzIAvOARdyPj3IjCksIY455MeJQGfHFmlwuQkvuCwqXtBpmuo+tN2ttgD
 Y14Nt6xR76uL3SA3TYIR3Fo0jmZhm9OG+81/X3F1YbnH+2dcS265vwonRgoJpGnAlcqzEpR1s6
 D8hDmSDEz9i7AXGM4aqAVBgtbD4Fyv/g5UZ09YrJZnXGp8+E0eseoGJjClZGc+5K4VkR2xd11+
 3DErTrwEAAA==
X-Change-ID: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Pavel Machek <pavel@ucw.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=2902;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=JdG4DaI/Qc50V4Qsb7hZVw07NZj9J6447kSQIzMX7LQ=;
 b=ZVOBijytHHRZBAkav8KWxiESEsv4+3UqIouLDZVFE2LIPpDfdAhc9Gqwbh7exYG6mEgs3D4Zr
 9z0WFy8uQt0AFRgQKfktoGJInOqrXCWooH5fYvL9K3zLa6DJYldPJB2
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_194702_736492_133EA576 
X-CRM114-Status: GOOD (  10.33  )
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

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v5:
- use monitor-sensor to verify accelerometer's mount-matrix, lux, proximity
- use Leonardo's compass add to verify the compass's mount matrix
- Link to v4: https://lore.kernel.org/r/20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com

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
      arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro
      arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 41 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



