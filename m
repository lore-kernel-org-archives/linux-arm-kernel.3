Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B8CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lB03SMCSdZOh5MT4mOL5rZAS5N33lA23CFfAIg10g6E=; b=RmONOdwaJPn/NS
	tkT517o/ArPYT0yS6T1Ih3DYC9Oup0La0dE7I7mJhCagYHskjtULDb3oZj1N6vGoQwdb1DTfOR9l3
	UvAzeJSPaSFTc1MXHOQgFnrhqr5woa+ozFTqv36s6pJvxaSAnMATGi1dAOS6rZnG9xHgwjZyN0W+Y
	gydcaNKHYwjU9hcEL1gi4hkG/8FBSuuENRg6Q6uxME8rkkfZTT2UCkdRJ2ue3+JBhEgErZxmZki2I
	EZmqDcp55cB3h6MDimlfldZ29wqrcd0qXTd3khU53OSoCICrd7glZTKAB51qjPKK1GvoxgwZez1f2
	PPMkKc5keQdNFQ6L8zZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJoX-00000007rYP-1O0R;
	Wed, 10 Jun 2026 14:21:53 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJoV-00000007rWS-01s5;
	Wed, 10 Jun 2026 14:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lB03SMCSdZOh5MT4mOL5rZAS5N33lA23CFfAIg10g6E=; b=Aj31QnRvEC5qRKqGy01pEzTR1d
	6lJnoU1BBn/cUVLWqhMzl/irMfHxMqt0vECKM59tPVCKf83A8InpNgE4hhSa8INB5SXxc3tSXj036
	Kw3OFIjf3vRlHEyU5WkZ4qXHg2ZonHtxgChheS2ryuGUnEgRrvbVjdP9FOuDeto5x11J6c2m9CoS4
	B82DYK6ktRVd4YASgJ5hWsD1fMkErvStsgXNKyN90vAFx8dq1k8zPB/xL/qC0619navMtahJzRHEx
	gQNo37C0j59EQtxnBOAyXBcnAcnWLD7JRlmrGmdreVTjHqt2SmcoRetvoOnnanV3S/En7Fv2/+sz0
	sWQR/ZEw==;
Received: from [81.57.40.39] (port=46646 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wXJSN-0000000Clj9-1kvN;
	Wed, 10 Jun 2026 15:58:59 +0200
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add Youyeetoo YY3588
Date: Wed, 10 Jun 2026 15:58:57 +0200
Message-Id: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFtKWoC/yXMQQ5AMBBA0avIrDWpChpXEYsag7EoaRHSuLti+
 Rb/B/DkmDzUSQBHB3tebESWJoCTsSMJ7qNBSVXKMpPiuvJCa9EtxvWCEJXUWqGhCmKyOhr4/HZ
 N+9vv3Uy4vQ+47wdllenEcAAAAA==
X-Change-ID: 20260610-yy3588-board-ecc20882cae7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781099938; l=1051;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=UFDsM7h/vS4lawePqt/EzSEfCqp3t9iFegVYXXU8glg=;
 b=ntTMfCkyCLQPBv8aM0vqS7qCTZVWodTg0TRd/q8rhqaYRsTQIE4bA4XWkzUoetzrYy2ExGGQ3
 x5CZG/v22XbAOOcLb7kFuACMcS/oSP4RDXCu4KLI6cwBIp3jMWXi1dr
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_072151_217027_A40F767D 
X-CRM114-Status: UNSURE (   5.15  )
X-CRM114-Notice: Please train this message.
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

This series adds support for the Youyeetoo YY3588, a single board
computer built around the Rockchip RK3588.

Both Ethernet ports, eMMC, SD card, USB, Type-C, HDMI output, WiFi on
the Mini PCIe slot, audio, the recovery key and the fan have been
tested on the board.

Board documentation: https://wiki.youyeetoo.com/YY3588

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (3):
      dt-bindings: vendor-prefixes: Add youyeetoo
      dt-bindings: arm: rockchip: Add Youyeetoo YY3588
      arm64: dts: rockchip: Add Youyeetoo YY3588

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  | 1190 ++++++++++++++++++++
 4 files changed, 1198 insertions(+)
---
base-commit: 8545eda00fdf3d7e17933ce0f706d005b1bad42d
change-id: 20260610-yy3588-board-ecc20882cae7

Best regards,
--  
Daniele Briguglio <hello@superkali.me>


