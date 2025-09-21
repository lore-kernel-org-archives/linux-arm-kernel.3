Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSxhnBSPaZ0/8aur0qK5lkNp8fXyB7uF7jqiDRpCT3g=; b=h/8etPlAy9Xk1jHh7O2WL8qTXB
	u2esxlIbHncBBaCiEPVRizjo04XkebQQP9Galuvn/I/lSSSKUFGdqRGXrbueX4Uhij03Rnq9/dmSG
	T99hMN49HOn4jOiLhDKz0xDLosebfH4FqDijbWRUd3e2S5Oj1ScC4uIkFS7HBpAqnEYYZX63lbG6y
	m2p9/in+yW3wBXUGRIt60boPL6odF+P0hO8IyNGnIckcOKVO0NFCtk5heCHdb+rPT5WlOawzbeI4A
	F+Euu1hB6hrNycYKo+MNrUWIdZr14E2PmWA9gBEtwQnzPcAiajIEFGcPUSCrr9V4sePAzqAX7xwfZ
	cDS7Raqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Dky-00000006pgc-1qZr;
	Sun, 21 Sep 2025 06:41:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Dkw-00000006pfT-1P3A;
	Sun, 21 Sep 2025 06:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A3CF600B0;
	Sun, 21 Sep 2025 06:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27C9BC4CEE7;
	Sun, 21 Sep 2025 06:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758436864;
	bh=Gpfoi+txALgRhI206tlvm8/xAq4M/UZUJ6YgK5XGaYc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Tsqd3dN7ILapalT1LHywkpPUGmv7qOvHPzboPVLNsogQmRQ46vQKG8Fv9B6asVeF9
	 hiDs3fHM0UCASnmfg8thmOAjFj5c5iILU60lUvY0qOlh5O6C62/cmo4jExOFFyt5Vv
	 +OKMPVV5l8GG+bFeqGZSOCwpyen/2i6P2tBYkuMYbmukMWbVg+btm+PbQ74J9lkew+
	 fP25EwzFPpk0qabokQvi+bQm1dDYDCs1n03XeSTydw8kH92EzhLaGyXfMy7FBPHokw
	 rZXQhsNapSmMQToYy6HrgLh5wg/sdhopLuwJv6oQ5GKgFb1qqgGsMpQjfZmP1TzKWq
	 umMqWCEjhi0oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D653CAC5A0;
	Sun, 21 Sep 2025 06:41:04 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH 0/5] Upstreaming Pinephone Pro Patches
Date: Sat, 20 Sep 2025 23:41:02 -0700
Message-Id: <20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6dz2gC/x3MQQqEIBQA0KvEXyeYTOR0lQgR/eoHR0WHZiC6e
 9Lybd4JDSthg3U4oeJBjXLqmMYBTNDJIyPbDYKLmb8FZ6UUFcmHr9LGYFQf7dWRI7P5l5icFiN
 fzmqUFnpRKjr6P/22X9cNCKWy5m4AAAA=
X-Change-ID: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758436863; l=1279;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=Gpfoi+txALgRhI206tlvm8/xAq4M/UZUJ6YgK5XGaYc=;
 b=H+bXwIwkxn8Ao42UiF3krOmUE1zTnaFt42PKrB9qR1FNOkjde318DvAeJAsg1ROzBO3ok981k
 JzlX1V3OaJIAeP1gpeKsQlucOP8fuBuWbeECsRzKcrj+WllofRT7NOY
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

Throughout the years, many have contributed to the Pinephone Pro (pro)
development. Unfortunately, these patches are scattered around various
repositories in different states.

I will be attempting to upstream these patches. I will start off with the
following small series:
- Add light/proximity sensor support
- Add accelerometer sensor support
- Add magnetometer sensor support
- Add mount-matrix for magnetometer
- Fix voltage threshold for volume down key

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Leonardo G. Trombetta (1):
      arm64: dts: rk3399-pinephone-pro: Add mount-matrix for magnetometer

Ondrej Jirman (4):
      arm64: dts: rk3399-pinephone-pro: Add light/proximity sensor support
      arm64: dts: rk3399-pinephone-pro: Add accelerometer sensor support
      arm64: dts: rk3399-pinephone-pro: Add magnetometer sensor support
      arm64: dts: rk3399-pinephone-pro: Fix voltage threshold for volume down key

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



