Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6708FC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXzrYbgAwF1eZ3UDTqcFJFnPegp1hD5ro+HaykmfZxM=; b=gxsDG93n18fyIDP0p9Pc7AJl1z
	X2vnGLmmvZkDvWeWZ0Maz9/ol1qoJGwv3wMWC0wrYIDifpZZbNg3hCydZfPAMOFPsdaaspE00VhvG
	nnx4jbOuT/l31lEb7KeFP/XD3JISqPuM5tmM1xMK4QN8QszkNexfH88vxVE+zTmATntcIenntar6D
	L4jYPi7pM58HKRoO7i0DnRV5B1Rlce8sZ4WubiTX1ZwI4iuZLhF/3afHwI3BFXWwxbvsI8Ie7Oyej
	uPYkSG43Vo1CpyPXWqCgMhIzk56wb9me8YvCXM2j6l8F0E+Ex+QCqQkv1AwlcLh08KBxI6ECTVDe8
	AW4uP/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qH-00000006Mpa-18mk;
	Thu, 06 Aug 2026 17:25:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qB-00000006MlA-3dSO;
	Thu, 06 Aug 2026 17:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786037110;
	bh=Ta0X0yCgJMGWBZiZBca3qxuBmoz/VEqxNUDEti0lFwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fOoyc5KFi+LAQx8fsvbyIaoC6+mntHYsVvnIJqPEY5dSaZe3n1IosImzUTbvZUgIT
	 JFQUyFL9Fsf2Vx4dywJVpL7zwPheGD//mrFr1+T3AK49IgsL4/IzfYKMQkF6nFYd/a
	 xeBAQb5Z6rPoDV/uZ2a1I6NTv2ycmP/yS67dKkMYjQZvQJctYrG8E2qkIIs44sOSfY
	 9nMY3KQBILf6AxPkXvtXMztm0uZlmMEnebWYD/As7D6hp8KzX1gTpCLdWALCSAVa+1
	 ONECOPuOhVTPtvvYCJwk8WjpjoseJhr3L8RQByXxqYTngvfOqqBVLukLNvDqIotJYk
	 3eiUnO6VdJyqg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C93F717E0F83;
	Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 81AAC480030; Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:24:59 +0200
Subject: [PATCH 4/4] arm64: defconfig: enable Rockchip NPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-rockchip-defconfig-additions-v1-4-6b1d8baa0bf5@collabora.com>
References: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
In-Reply-To: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Ta0X0yCgJMGWBZiZBca3qxuBmoz/VEqxNUDEti0lFwo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0w3XgitMp952VZ1C06ZUZHgqggxpmhCVcR
 wAYGpTjavb3Y4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdMN1AAoJENju1/PI
 O/qaaq4QAKVCLKw6XzBgN3Ay5X0u16g4O/GRYIgdOOA7e+hv51U4EJSn96S1LNNA3TxwFgQ6Vln
 5mW3keqwnQSwBMCKTJ1kipGjUq127E5NDq9isDkRdR8o/eGWI1CvZA8btrDzZfLZI7hj/jNWIDb
 608br6kBbBTH8P2BGCEBnUMN0FtkRAcxzWDpglI+6mpvMyUUPZU9QDHSX0NGHgnb1iWQ/1Af3Fp
 MJiz7ehIgt8fjKLjVDnN+thEwV8JzV2lyoryJwOjLJNMEOLCH4IESzA545gyv9rVsLlOqX1BoiX
 kga8nDN0Xmx/YHnNJXJGLXyHy/k9NbGzyvN2gi4BUyNNlT8YjrH3rTJm2ql4FQh+iqZEX4uMvat
 agQMMd42S8AbKehVrzHK+fMEn4xY/ABxT7d99G8J6tosLOwkEKUBOBZLkCHqmdQFSA7J0Q8EEKG
 3JypS18SSF2gn1/VCZsXc8n46lCkiIVvUnmY287yXnZFuMQfilb2j9WyX/oJJnnOz94Nxisxouy
 fno7o0SELRj51KRj92pdnFzaT48RCopCflTCndYcqs0xT2Kdg2BNZ/TJVLxqDHcfeONDAihZTSD
 mYJ/9Oe47q2f9FbjQhqDbwK0TPbrbgAmssYp1gTHslL/ibEskS+JcnMwcvpTNo2vdTTWeae4ofP
 cLBjkyQHgE7OHPqH1n7Mjug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_102512_065426_3747FF87 
X-CRM114-Status: GOOD (  10.79  )
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

Enable support for the Rockchip NPU, which can be used with upstream
mesa on many RK3588 boards, such as the Radxa Rock 5 family or the
Orange Pis.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 648010c26edb..5faccf00b897 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1065,6 +1065,8 @@ CONFIG_BACKLIGHT_GPIO=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_DRM_ACCEL=y
+CONFIG_DRM_ACCEL_ROCKET=m
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_ALOOP=m

-- 
2.53.0


