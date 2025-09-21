Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103BFCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ov4L6Vqqug2iwgeWVDrbfqQdWpK87VlbgfqG2Dd9R3o=; b=WoToVTHScXlKjBDesTpSFb7h6m
	LIKmKqLBYjInpJ6bQlH4APFA6uZlKhgENDPIf0tVECg8CF0iCNh7KV4UgNeoWAtO2oG5eXK2UoEU+
	kqOhcbqqmy7HMtBm+y9sJ3BgOHvwoTr/0fceske910b2ecJJqXepNAec+rL7vNbHanYVqEGRvSX4E
	c29r0QdlbZ+LxOb3EoKIruRAApZxNzq3NomqlifAqsJ2D5fOW9QPpDudD+KGz2iQx2o/7tGXYuqwy
	MCC8cA/eTa7CcK6+xNYRFUs85qAVLkYBuyTtQv/1PEvzCrcN/WD0QiPGksyDYOvxOVXzQZXgRcIBp
	rkwBUukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RFz-00000008DDH-3uu1;
	Sun, 21 Sep 2025 21:06:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RFy-00000008DC1-3LRl;
	Sun, 21 Sep 2025 21:06:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC92D601D8;
	Sun, 21 Sep 2025 21:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767C2C4CEE7;
	Sun, 21 Sep 2025 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758488761;
	bh=p36wcFyPQqlAAPFV8kif2hBbqmR6V3mP2tc/m/CbJ/4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BFm6zQpP+meGakJqNg2ZDtXbgZR00zlC5XxK3+S/NLiIUjb3J3gzVr9l4GZ+VShHJ
	 VkjuYNZmEiUPELtAZmV9BVufjY2hu3Ku+wnJ2XfaQB577FRzj1sakLGN4PQpurl0l3
	 zZolOgngMgUKfmWNQXsCGZC1sk6xESHdKWpbLLuSWa2vPncgLndhEWmBFsEwfh5Sr2
	 S8gzk1iDYvwXmRBcXTRl3iBhHyF7fTtj8jtLlXkViyg8vlTo2jypxqwFtureDMD8P4
	 qDynJWzIrc6AbdogAvmGwDKCgtO0aGujliDnYbc83Zx/H4m4ZSFP4fIckoJ3K3nDqC
	 Crc4IWKtdPEPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B64CAC5A8;
	Sun, 21 Sep 2025 21:06:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
Date: Sun, 21 Sep 2025 14:05:53 -0700
Message-Id: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFo0GgC/43NQQ6CMBCF4auQrq0pBaG68h7GkDIdyiSFEiBVQ
 7i7hRU7Xf5v8b2FTTgSTuyWLGzEQBP5PkZ2Shi0urfIycRmUsiLuErBh2GoHNl2rjQAuqrTtgr
 eceNfPVdpCSpvjEZlWCSGERt67/zjGbulafbjZ38L6bb+CYeUCw6qrsFkKPGa322nyZ3Bd2yDg
 zxi6Q9MRgyLGqAAXeYaj9i6rl8CYUdAFQEAAA==
X-Change-ID: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758488760; l=2092;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=p36wcFyPQqlAAPFV8kif2hBbqmR6V3mP2tc/m/CbJ/4=;
 b=khC8t4v1Xu2EYfXP+DQY1VBR1+l0j/G7ns8n+3Uvymukxh1d3LQBBOqQmCJhHs7Fu9juXzzqq
 YjcenQ0Ge0WDV1e1PLp2Plg2a/OL903KHrvnQARvu9wQ3uhqCRbw8r8
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
  - https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
- Add accelerometer sensor support
  - https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
- Add magnetometer sensor support
  - https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
- Add mount-matrix for magnetometer
  - https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
- Fix voltage threshold for volume down key
  - https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v3:
- change magnetometer mount matrix
- update volume button threshold
- Link to v2: https://lore.kernel.org/r/20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com

Changes in v2:
- remove usb-typec node in dts from light/proximity sensor patch
- Link to v1: https://lore.kernel.org/r/20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com

---
Leonardo G. Trombetta (1):
      arm64: dts: rk3399-pinephone-pro: Add mount-matrix for magnetometer

Ondrej Jirman (4):
      arm64: dts: rk3399-pinephone-pro: Add light/proximity sensor support
      arm64: dts: rk3399-pinephone-pro: Add accelerometer sensor support
      arm64: dts: rk3399-pinephone-pro: Add magnetometer sensor support
      arm64: dts: rk3399-pinephone-pro: Fix voltage threshold for volume keys

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



