Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FDDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QR9RBoB1Xmuk4gv9Ndt2VcbKJ9ZdwkH84K6Kq+4ROVI=; b=eeqKtfbCDGkANGw2itRrD1OOQf
	Nz2DT8YUAdHx532wiqg/ZMbrb0H8ZENg1ugVvOiZ6hQIM4LQB2MdUXpOnFaTGqknYJNBKyeAwcf/j
	GVXA7KQIzBwx8GeajDqrbupDEJKp5lLHlOVTutOvUHF6nTwAk+WaAOvuqtOK3XXMuWuIxL+2b+4zt
	/hHJwDyYllVgch5dwuDuArxdNmb8vL8lynXmk3Q5GRzqsrWa+26xB/xsJtdiwI2EJ8yipXBRSgZbd
	+M5hjQAvJbGcc53h/I63Ub0LJLf+2S+hdHr/UOT8Xd/naaIfA8vO1E+FouvAbUWMLleR4mEsYwOTB
	R/N1Hd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoxN-00000000r3N-0ORW;
	Wed, 01 Jul 2026 07:02:01 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoxI-00000000r2O-3nYt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782889313; bh=QR9RBoB1Xmuk4gv9Ndt2VcbKJ9ZdwkH84K6Kq+4ROVI=;
	h=From:To:Cc:Subject:Date;
	b=FxeBYoB6puju4Hin+GuVVFvY0evwWhdzBR3P/8SBqH/gxVmwmgcia7CXogCppqSi9
	 4KjUue0uxR+TXGl7ZFGShRAX2lKJQG4RRSnKYrHkiISO7b3tY4+3a0DhJEm5DXCaio
	 aW4PMbsRBhBUqfq9/ojnUAuJxybx60Mp/esYVKxQ=
Received: from localhost.localdomain ([2409:8d20:2a:1b57:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 71832C3; Wed, 01 Jul 2026 15:01:49 +0800
X-QQ-mid: xmsmtpt1782889309t62leqei9
Message-ID: <tencent_1A4614039A100DFD8A9AE2692865FE126009@qq.com>
X-QQ-XMAILINFO: MQAOa38Yz/8/h5mNRBixUf9sGBvjbDPTpGQYlPe1/W7Je2YVdByg9DNAmYCwnu
	 z1/Zxh4RpOppC3m6mSnmBWZc5sgV5oqdxMUxPWGscfEQ9nWr3S4nvGUI/24nXv0hzAJ/531B9K36
	 roUixxW5N3vrXCTqW9TW9rJcH2kHkw8gGJBS03gtvLir0ls9hs0J/mL4GJaaAw92TqLYW1OYXX3Y
	 IG3DMEhfjE/vikZrt6sxYSDKQVZ1I2aVKsgKZgePGAdhdUWP9/7A4UgiiEA4k8dJWKPmuRx3Ce+J
	 V+1vH4tlPCcVMuJ1uuXOC75eMduywjiZ9nYvu6hXorjieuM+5p7jrhkEP7bIW62yx4jX30ROQkbG
	 RlNqz9OFSbpaiVenuZEVaumQwB+L0SjhIiu7Mi+4Q8IRh4LHg0w/sSv+rADFVQi5Xp3ZG6My0gJE
	 1TSd14IW/YQgnDqtwweogZWZNssn1LSzHofdhC6ZqRz3Y/9foxitDdJNxayK5yRe4pRxPfhA/lAE
	 +rg70fBZcBIIlKX76DfekzDNZVN+wyQV56t3JrfRuoQQGjynJqmCnhlguDScea/eqmEzW7ki0n40
	 OBdGTsZCAmVHIahs9pP5Yegx9xs54xY/oPF4YTzhTdYgc8s8uoYfTAWHtUpXqZKzvUMGFfwjCjLv
	 NCI3RrU4obRgkZGqp57FVB6Vbp6UbmQpR7KQCVntf5PQgvEhA0DW5RTyfcMdv5BPAhhT59fR81oJ
	 snOCZPlvw1dF38VRZ1/YyJBgBXMpC+pta5I3yBtYpuYeJjH+WWBv1juRNAGsb7AXVV7W1BnJ20zh
	 Ws2GbDnx+dUzu+8My8RkkH9cZEdM/jXsmhUofoqO16AUf0xXLCZCr2isoJTfLALYeR5aWYyGqjU0
	 xRC7J9FRtapIgEAwfY+XzyPYVZPzc5NSCYEBGO2TM0Z3siwt+s3hrVFwAydsQsd598WeclGD0E2h
	 VVj5D3OEa4AKo+PUXD27ZM6daxN0kzD+iqb6+pO4BRCy9TQ2RF14VKZUh1bxSlP9lzdxG/W2xUkm
	 AuPA31ZcCycKTHttoYgvyoB+Abtsj66Z+zOpDm7KO/5Oiiy/7cxIlB9pClCEG+QDML8aUpeEaPht
	 HGMt4b
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org
Cc: Vincent Mailhol <mailhol@kernel.org>,
	kernel@pengutronix.de,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luch00 <1579567540@qq.com>
Subject: [PATCH 0/3] can: rockchip: add RK3588 CAN-FD support
Date: Wed,  1 Jul 2026 15:01:25 +0800
X-OQ-MSGID: <20260701070128.2096267-1-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_000157_265266_9F799216 
X-CRM114-Status: GOOD (  11.72  )
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

From: luch00 <1579567540@qq.com>

Add initial support for the RK3588v2 CAN-FD controller.

RK3588 integrates three CAN-FD controllers that are closely related to
the existing Rockchip CAN-FD IP already supported in the kernel, but
they cannot reuse the rk3568v2 description unchanged.

This series therefore:

- extends the existing Rockchip CAN-FD binding with the
  rockchip,rk3588v2-canfd compatible
- adds a dedicated RK3588v2 match entry and devtype in the driver
- describes the three CAN-FD controller nodes in rk3588-base.dtsi

The dedicated driver data is needed because RK3588v2 encodes
RX_FIFO_CNT in bits 7:5 instead of 6:4. Runtime validation on RK3588v2
also showed that its observed errata profile differs from rk3568v2 and
rk3568v3, so using a fallback compatible would be misleading.

Tested on an embedfire,rk3588-lubancat-5io board with can0/can1
directly connected. Runtime testing used a 198 MHz CAN clock, nominal
bitrate 500 kbit/s, data bitrate 1 Mbit/s, and included stress and
error-path coverage for the existing Rockchip errata handling.

luch00 (3):
  dt-bindings: can: rockchip: add rk3588v2 CAN-FD compatible
  can: rockchip: add RK3588 CAN-FD support
  arm64: dts: rockchip: add CAN-FD nodes for RK3588

 .../net/can/rockchip,rk3568v2-canfd.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 39 +++++++++++++++++++
 .../net/can/rockchip/rockchip_canfd-core.c    | 14 +++++++
 drivers/net/can/rockchip/rockchip_canfd-rx.c  |  5 ++-
 drivers/net/can/rockchip/rockchip_canfd.h     | 12 +++++-
 5 files changed, 69 insertions(+), 2 deletions(-)

-- 
2.34.1


