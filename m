Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C762C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 02:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1WNmyXfiKAM36ME7UbhR9USc1y3foO9e6ZaB6KYxC4=; b=pKtObskGhXronC20NpChjuTxXE
	48qAJoWdMlgsI31O/VgnTIslpbjzoizPxKlVojvqnN4KB0VwAh/GdOe4EqmtIKdTsvODtJ8FFU9X/
	xZ9vnS6LadTCQv3a/gknyoSyNTle+iTrV4ogA/eISAb4Dy8HQkc8g5ieRyDFbhk58wfXDNqiy0JUH
	RFYTkXxBL55lVtXM6TCfmjOTEk8lToMQ365KXV/TlH1SrqfGr33AFF1axOFYi6UDlZu2tKkErTSZi
	APQC6zVAy8Kx0uh9fNqh9kTwj99BErf9nw5p+RyWaA3cdOaO9xQBO55zx3UivERtYFAJCGO2OI46S
	lIeRI0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTmO-00000005tYm-3iGS;
	Fri, 03 Jul 2026 02:37:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTmN-00000005tXo-3HQf;
	Fri, 03 Jul 2026 02:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=W1WNmyXfiKAM36ME7UbhR9USc1y3foO9e6ZaB6KYxC4=; b=ftNlAVBmMeKXMmnj19bQgUwFVk
	EYhcB9soOG6OJhI1zsqv7AhSeeeimQKc8jZyPoE8RGCysTBkP3pKHj7r7UEFi7bcVO0/Xlqns9uwn
	LPCJe2ISOLCfGnIZYdz9pF3CrP6K8xNJP5ck7GYM3SYM58PSEDhClh9YL2P24nY92jfWGfBFpCafb
	HqTH7vZ0Ij7i9FdHne1PFm0+8E4Wpx/r97Cac3uALzpHD2pVB9SYluRIo2yotJe0ee6DQJw5LyMfQ
	iOMQk6ySV0eKk0JTmgtLowUv16icOI7f3lJFUTI2v9fy/vSPP/f+rq0Nz3ZUnrLJod8W3AC3QkoiI
	Y9HUOFwA==;
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfTmJ-00000004PRg-1k3c;
	Fri, 03 Jul 2026 02:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783046235; bh=W1WNmyXfiKAM36ME7UbhR9USc1y3foO9e6ZaB6KYxC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PuL0v0y8o7liRr5TS+dyej9yGUlhqQ+tSbNCJWRVryhY2a9NZXjpAZsAU+YzzsDrd
	 ApOOAvvrRnhoy95r2OsNtPK4zNa48IHagaQWgNbDf4ACeUgWuJDRb2b+FKoGxWN/yk
	 TRvLO4Ymnn94hmdlIENyiiWEKE36cMBjHjULnM18=
Received: from ubuntu2204.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 8F90EEF9; Fri, 03 Jul 2026 10:35:57 +0800
X-QQ-mid: xmsmtpt1783046159thgca6hq9
Message-ID: <tencent_3E31CBEFAE0986665A26322171642BC00B05@qq.com>
X-QQ-XMAILINFO: M2dBUVw0X9hna0qxGzNtZpQZdHEzG6U8CofjXX/U6lyToJIjryaiK8k2rQLlek
	 KTe4kLB0BuX+ZgeiYyTw0voeRkCHy5LNabXYJRSawig4Z31o+wypQpNg+JnH5ot6jGtkcCsf03zH
	 ggLB3+KYKSBIP8QBOwp3tKp5N+BnPedPX9/yqDDNYN+aGrTyFju/H2lCw5Ugl1Nyy+s7YcJYst3w
	 wCdvQ0LdG7TpepiCEmtwVcFL3+Tg0gNwrdzHRunibQYJcG8zmN90ifuhmKPTH4kao7CRlstlriA3
	 DKukeOhEe3UwB/Gp5C/FqR+6oazYA2WNbR8AipLlqkI0mjmhssilswpbWprpV5a7hoCNQni0o8YM
	 isWuEtgZh0EBDHj7wFtoVP8qlp9zthz4+DqrOHGuUxYdPcb6QexjWoxll+FUUTLtBumKmxTt/DhQ
	 Jam2227Ke/QgtRd2CjCG7c6cxTPLWTro2BKx1HTAfrfjHVTPGXWSsqV9HEdFxyk3pmnHH8oQE55s
	 7zFT5qh2ai+4Js6Z+3eESabiT9v41RQEDI0IKh/ql9Me4aOsEFEJ4P9UOymxIpR104nB0jsCwHcW
	 GfwkFTBCsGxSctTPkRSzzwo5Klc63i04GiI+DeLWx9uKS+WY8lJMop3VslYN7jbD0xd/bgQtd1FE
	 mXfDeHhr7/Dv32/0r6z4FuTPutsJ2y6VZ02z3XD1Lrh2+O3rpKB5QifElcyDnirFQajq82qVA1fo
	 7eYlfS2yARaEY0UsfXLL4TOP4jbYFqekfF0k7MtI1ZE9zUe7RdsPzuHTiPSM7XdiRoJTyMnOpaWx
	 cZvxZc6TnXZHtKqBv5qjw82589CdiZO7mlIz/eLrkFTRzDhUfINt+f1j3Ry23rKMdwgd4A2QX13q
	 tsANUn0bsFnxQN8Bgj0afD3J9CunjU5SpgWDNKDgSJNzD6WRUVWSUbn/u4DrO0m8BJdg5BG8Tozs
	 X79kjk9ajtAKxyLXifoYDtUB5KFhsncr0nvosIXT7w9HnXTvetQo0J2NjA7Dz7pxyWH9eCtKRo60
	 nLaExEfOmkEWibiYmqpJTEyIE2itRmIR+3Iw/ViAtQeSW2e9VQmlgqv/Jd/3RpmGpoi3mVz9dG5d
	 AQ/77++x4WoSy0fkbx8atTMFiIyZ49/jNWVtjVgkHwufiMvzc=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Cunhao Lu <1579567540@qq.com>
Date: Fri, 03 Jul 2026 10:35:40 +0800
Subject: [PATCH v3 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260703-master-v3-1-6d56de6fd2f3@qq.com>
References: <20260703-master-v3-0-6d56de6fd2f3@qq.com>
In-Reply-To: <20260703-master-v3-0-6d56de6fd2f3@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_033720_083452_1AC1AC59 
X-CRM114-Status: GOOD (  12.14  )
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

RK3588 integrates a Rockchip CAN-FD controller variant that is not
fully compatible with RK3568v2. The RX FIFO count register field is
encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.

Add a dedicated rockchip,rk3588-canfd compatible to describe this
variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
would describe a register layout that does not match the hardware.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
v2 -> v3:
- Move the Changelog below ---
- Collect Heiko's Reviewed-by tag
v1 -> v2:
- Use enum for the single-compatible entries, as suggested by Krzysztof.
- Reword the commit message to explain the hardware difference instead
  of referring to Linux driver match data.
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
index a077c0330013..81e2b6dfeb02 100644
--- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
@@ -16,7 +16,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: rockchip,rk3568v2-canfd
+      - enum:
+          - rockchip,rk3568v2-canfd
+          - rockchip,rk3588-canfd
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd

-- 
2.34.1


