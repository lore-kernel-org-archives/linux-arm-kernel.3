Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC537C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GquEjNpz7LLp5fa0G7ONBtCOsxLa8pv39v8AkakdZAk=; b=tTiNj+tbv5Pt+b
	5jvloPenm3jpeuHhqUgDzFXGaEjpOTQcng7OcgUyLW5nvltzCt0oaJokGjzq+ufgFod4jkBQa8qeo
	+W/x5l3pAg/kaxRvpB3ux0cDcCMytK2z9qnT1hYU/ZpxG7ddNLUdX72/GlzyWNrdM+3W0mnfgjVms
	MpODSeGSa92j5akO9b5ZcF8LOy1gBHBYcs9Ze3qaNBwh1FEXVEeothEZznr3IPB32VjdIROa+GkHZ
	EouxWLb72Zrlg2p5o2TyXW4Kf2mTx4V3jbvrM3O8/oSMnb/Rs98QnC1FcjymMK7twXNvi2jc1+WtG
	iVs8Tbm3Ngn7D8FkFcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYqL-00000006JyV-3KZR;
	Fri, 03 Jul 2026 08:01:49 +0000
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYqI-00000006Jvw-167b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783065701; bh=GquEjNpz7LLp5fa0G7ONBtCOsxLa8pv39v8AkakdZAk=;
	h=From:Subject:Date:To:Cc;
	b=Roe86d270+YLZGJmFvhfkgsPZJCbabRJkZkREyJBSmSJoHNhRqq3GIq8uz+Ggy/b6
	 O2BnzB1oKCMCBM/5Dac/iPd8Z8hd9b1Kl90+xD2otb6yXVo5xBdhb4ZgLQ8UCTHou8
	 51SZYRaiEYfwefl+aYzssZ0p+SADCAjguQXaTiq8=
Received: from ubuntu2204.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6622C6D; Fri, 03 Jul 2026 16:01:38 +0800
X-QQ-mid: xmsmtpt1783065698tdnsng46b
Message-ID: <tencent_42B49B0E68A8659A13EC46A402E41133FC09@qq.com>
X-QQ-XMAILINFO: M07Ulnfy3VHK8G1moattDV+yMJgDKhR+EsB7PDHBWj61nfSZpJDu2TmnHt/tVC
	 vqlkQC4qsgCpv13Ww85I55Xo9QcvcJTNxsy4YDjLwjUHzQNndYG8/EPaqRh2GBxwwOLVwGZOiiLb
	 BRjJy2WjIld1cI5kJlGXwTXd3Gkmy0xAV9TyMt99dP/7ITUcXLgDtFAIkdqr/6J2fbt1YuLcpIy3
	 gsZLLZVmKPgpR5zP3Uao4XyqoA2WIdnjhtioLPyY/jLW7fzw9vyonmfAlM7CQyrG6u/j6/SO8kWp
	 IqkR7SBx3vqZegHm4Y46U6Y2l4IoZUUjsHHxd+2UrhPVvF6Wejtw2MHJviHSsobOke1D8qbP40zc
	 uniLUchfifVT53hTPHH7etZlntIAf5m3r2jlHFRYUswSWnwIED91LHwXD/U7xGzzWgfNZgRIAspJ
	 fWrxMwt5TdhErbiE1oExCVzl2w6iMxR+5ejSMn6wKp1w5IPNc0uGdclrvHlvAWGrizIprAVjPJ7z
	 3idxPcv89jseOswZsskDVVr9ZFG/t+tdqETDRSwY6okh1S0Lp5/zg8acTsIsdNYvsQbhxQpeSPMF
	 +bcSr08ZsmiuLvfUeEDpy0WnEcUSnna9wDKGBngMTKB7cxDHZZO4Ags9aGf/VDbEIY1Pxe6C5Q6a
	 i41vu2+mi1zRrk50FatWa9RicUn0hK44S7GIFk9BxhUhLsuljT1gzuleO+aZaK2FkX1OSiEfzIXs
	 GvN4U6WbXVQ8ny9QF+ZUxfYMILoZDyTJqo8NqGJTVPvAJhy7E5XgTT8ZyzGX1EIGV/gxHWVgdj6F
	 edZzf7hebwJkccNDGQfUnX4QrdCvPCzPLOWrgiS68gx0DW6F524p97KW/jmh5pdTE9UtKr4LrmQ2
	 qpZenaa514WXSEyU8WSKc1wkQM8H5gh3Icwb/1tUPKoZkyvF3sB1AsfnoB+0fQ3kkNnC7Yl5DyWP
	 2l8uQAS2sdfKnTD7/WdwgQd9+/yHfjJOWdQ3QMwbdhKhELqPgc/xNH3j3+KAuLUVZEUTgCO7Bd+H
	 tTp9G+i/nJy37AiD6t0n7IDPi4h4VL3av6D3HUq6bAMxMEuwGb+ULdrmLioBg1uK4LnWYhijNgED
	 uQ3br8IoViGvWyS2b5OOBeVSQQcbB8e7l6u+lECVubIDBCoewlth/jFdTbVw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v4 0/4] can: rockchip: add RK3588 CAN support
Date: Fri, 03 Jul 2026 16:01:25 +0800
X-OQ-MSGID: <20260703-master-v4-0-47d40bbf5fda@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVsR2oC/zWNQQ7CIBQFr9L8tRgCFqsr72G6oPCxmLRYQKJpu
 LtQ0+Uk8+atENBbDHBtVvCYbLBuLnA6NKBGOT+QWF0YGGWCnikjkwwRPelUywbsLkxyA0V+eTT
 2s4Xu/Z/De3iiinVdjdGG6Px3e0q8enuU79HECSVCt0KjMJoZfluWo3IT9DnnH/9V6iSrAAAA
X-Change-ID: 20260702-master-8c52be892a3f
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cunhao Lu <1579567540@qq.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_010147_822539_4A995A20 
X-CRM114-Status: GOOD (  14.06  )
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

Add support for the RK3588 CAN controller.

RK3588 integrates three CAN-FD controllers that are closely related to
the existing Rockchip CAN-FD IP already supported in the kernel. The
RK3588 variant is not fully compatible with RK3568v2 because the RX
FIFO count register field has a different layout.

This series therefore:

- extends the existing Rockchip CAN-FD binding with the
  rockchip,rk3588-canfd compatible
- adds a dedicated RK3588 match entry and devtype in the driver
- describes the three CAN controller nodes in rk3588-base.dtsi
- enables CAN on the RK3588 Tiger Haikou board

RK3588 encodes RX_FIFO_CNT in bits 7:5 instead of 6:4. This
difference was found by comparing Rockchip's vendor kernel 6.1 CAN
support for RK3568 and RK3588, and was also confirmed by runtime
testing.

RK3588 uses the existing erratum 5 empty-FIFO workaround. Based on
Heiko's testing, v2 also enables the erratum 6 workaround for extended
frames being transmitted as standard frames.

CAN-FD is enabled for RK3588. The BRS bus-off issue seen in earlier
testing was caused by the transmit delay compensation setting. With
RKCANFD_REG_TRANSMIT_DELAY_COMPENSATION programmed to 0 on RK3588,
CAN-FD with BRS works in local testing.

Tested on an embedfire,rk3588-lubancat-5io board with can0/can1
directly connected, no other device on the bus, 60 Ohm bus
termination, and a 300 MHz CAN clock. The test used 500 kbit/s
arbitration bitrate and 1, 3 and 5 Mbit/s data bitrates. The 5 Mbit/s
data phase test ran for 15 minutes with:

  ip link set can0 type can bitrate 500000 sample-point 0.8 dbitrate 5000000 dsample-point 0.8 fd on berr-reporting on
  ip link set can1 type can bitrate 500000 sample-point 0.8 dbitrate 5000000 dsample-point 0.8 fd on berr-reporting on
  cangen can0 -I 2 -Li -Di -p 10 -f -g 1 -c32 -b
  cansequence -rv can1 -f

The receiver reported continuous sequence wrap-around messages up to
sequence wrap around (37219). Both interfaces reported 9528377 packets
and 150667356 bytes, with 0 bus-errors, 0 error-warn, 0 error-pass and
0 bus-off events.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
v3 -> v4:
- disable TDC on RK3588 by programming
  RKCANFD_REG_TRANSMIT_DELAY_COMPENSATION to 0
- drop RKCANFD_QUIRK_CANFD_BROKEN for RK3588 and enable CAN-FD support
- document successful RK3588 CAN-FD/BRS testing at 500 kbit/s
  arbitration bitrate and 1, 3 and 5 Mbit/s data bitrates
- collect Krzysztof's Acked-by tag for the binding patch
- Link to v3: https://patch.msgid.link/20260703-master-v3-0-6d56de6fd2f3@qq.com
v2 -> v3:
- Move the Changelog below ---
- Collect Heiko's Reviewed-by and the driver patch Tested-by tag
- Use Co-developed-by for Heiko's RK3588 contributions and add his
  Signed-off-by
v1 -> v2:
- use real author name
- fold the single-compatible entries into an enum, as suggested by Krzysztof
- enable the erratum 6 workaround for RK3588 based on Heiko's testing
- add Heiko's RK3588 Tiger Haikou CAN enablement patch
- keep RKCANFD_QUIRK_CANFD_BROKEN enabled for RK3588 so CAN-FD stays disabled
- document the RK3588 CAN-FD/BRS bus-off failure mode

---
Cunhao Lu (3):
      dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
      can: rockchip: add RK3588 CAN support
      arm64: dts: rockchip: add CAN-FD nodes for RK3588

Heiko Stuebner (1):
      arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou

 .../bindings/net/can/rockchip,rk3568v2-canfd.yaml  |  4 ++-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 39 ++++++++++++++++++++++
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |  6 ++++
 drivers/net/can/rockchip/rockchip_canfd-core.c     | 17 ++++++++++
 drivers/net/can/rockchip/rockchip_canfd-rx.c       |  5 ++-
 drivers/net/can/rockchip/rockchip_canfd.h          | 14 +++++++-
 6 files changed, 82 insertions(+), 3 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260702-master-8c52be892a3f

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


