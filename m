Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEB4CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9d2WAfWhD+z1t4WxC82EqCrzgASj2EMx0oLCQlcU+xM=; b=xdRxrcENA0ZjW7xSmexNnQ4Z3z
	U0Oc6NcHmyEfkzbK2xgw/8ki7ik+3nN7lFvejpWwRzM+jBZ+VS4y1tmTUZXwxUkGxoaTA4WmKvHYg
	hPrJ7O8AjXgXiIrVrCYOahvK8ub4hKMamPueaKnnV2FqbsuwStJSCpx3xqp9AF/d8ylrxrAa7eG97
	wcwWYUR+BaTCRxeDAiH4wT0W0eLImQi9HBCS/X/c8vxsUn9Wcev+KKwf+1fgafdLQtMIsvvtOGaIs
	cK7x19x3ssfjrDmMM0rzDjJtW+EpO4mHkY65pTscb5LXYmkQ03D0EjQQABWrCLzx4AHv8N9CaLR3F
	GUJGPMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIvT-00000005XOQ-1HWV;
	Sun, 18 Oct 2026 04:55:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIvR-00000005XO7-2V2E;
	Sun, 18 Oct 2026 04:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 076BD40D3F;
	Sun, 18 Oct 2026 04:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D28DCC2BCFD;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792299312;
	bh=fUdq2VvosvV5UWVKEKg821xAaTCVqPc2wV9SA9hzTFA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=F8kp6cvPLCznrDZQRsfWwsbMwi8ryaNHvXrMLCEVa08Wfi/crE7frkp4zq/LIWvKN
	 8snGkDu4d6PluMefPivoYxgwdyC12loGvdTOcyL1bAcKRRk9+2ncvKMfEyvfa8Cr+U
	 1+Ao1VduB4YEgTv1QxigHtWFY7Xd942cFcSHjj9iydth/d+PEAAkHD8evBP26Lp0gI
	 JF6DNQl0MK0wZD00EJLTXYl2BIIVlbpzynBmqBuXBSiRkPMyhhSB6X/SR1ORIKnCS1
	 qaEzP8H4XL8RkJwJIaKq0s6+RE18hylbrWYXoqPDbBiiUnmk2Wmp3ro29+FJJA+8ni
	 vXWO7jPIalrrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD78CCF2C4;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH 0/2] Label the fans on Kobol Helios64
Date: Sun, 18 Oct 2026 07:54:58 +0300
Message-Id: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJR1GoC/x3MQQqEMAxG4atI1gaMDipeRVykM79joFRpQYTi3
 S0uv8V7mRKiIdFUZYo4LdkeCqSu6Ltp+IPtV0xt0/bSyMgbvO2p//Cqgb06eFYZOsUgDg5UwiN
 iteudzst9P0FKSfJkAAAA
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=fUdq2VvosvV5UWVKEKg821xAaTCVqPc2wV9SA9hzTFA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlXAlVnOwqGVKsLxp8pFLmVty+gpnDn3QfGWpO672yNT
 Nv5MPtuRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZjIcSeG/znP3I4tdzJ2dc71
 3fzX/M6ErX+XmzBnMzFNmvo3fOa0nU2MDM8+G82JLt9QcuiksMlzXQGPoD3Kc49b287pUZ18Wmx
 uNCcA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Helios64 has two identical PWM fans, and userspace can tell them apart
only by their platform device names. Patch 1 makes pwm-fan.yaml
reference fan-common.yaml, as Rob suggested, which also allows label;
the hwmon core already exposes it as the label attribute. Patch 2 names
the fans after their headers, P6 and P7.

To: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Igor Velkov (2):
      dt-bindings: hwmon: pwm-fan: Reference the common fan schema
      arm64: dts: rockchip: Label the fans on Kobol Helios64

 .../devicetree/bindings/hwmon/pwm-fan.yaml         | 22 +++++-----------------
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  4 ++--
 2 files changed, 7 insertions(+), 19 deletions(-)
---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261018-helios64-fan-label-a173ae71bebe

Best regards,
-- 
Igor Velkov <iav@iav.lv>



