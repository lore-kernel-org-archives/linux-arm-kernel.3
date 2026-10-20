Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2360A2601
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BqLRI4Le;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rWZRj2sF;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=M8V5ZhLd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28+LnlCRAvjMNnWFEtfBXa2DgYOE3LxqM/Us2XEafcE=; b=BqLRI4LeHoTTBHy3nz/IqiDvTN
	4SWq1pXo2eH5XyETR55nAz70XbGFpXf6TiFQS/Vweb08/zjIiZDTqujwFF+NBGUMlgeuOBNd+Xz2+
	ArcjViSlJS8rvW6SqK6//oqM1fToASSVO8dR38/OsYlAFXVgfvCgbv9X0vZn2tQljrU0XszdIVIjW
	repQ2OWztcKUjk70ONfAtcFFfq+kP/MwQ5gJZQ31zDQVqNO0siKIzwdNhJ9l+r2eiQeat6ZSgFdB4
	03rpMah1B18f9pFAivUTC4N1DmafsSvf2UOBWW/coeaqTTGo3D8/q6vG/IALW0tbNy2CBa03egirU
	4ZWIPUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIY-0000000A0kX-1czh;
	Tue, 20 Oct 2026 14:58:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIP-0000000A0el-2Eqf;
	Tue, 20 Oct 2026 14:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=28+LnlCRAvjMNnWFEtfBXa2DgYOE3LxqM/Us2XEafcE=; b=rWZRj2sFv+p4KkG6D/zx2WhDgn
	k2Vj/eWAZb61TE20Hixsf3BsZ7D2iorzf0IHyy3V1rlc40I4QaZykuVTLZlVJmXjlGsxr/j0/btS1
	PUgdSko7OEwJQk4/dDkEA086NXBYxNzg5Ozgfpe38k/xsHI5iTEZbF2jqJZ2CFoQTVh5Ypl/0al5q
	Na3HEIbmqfQ2+CZXN4dJr3M7zV9YgtOuSlg2ofKSxpNi13dX24HnRQWjOpQFiYv1ZbpSlcs4l0utL
	Vca2AXsOo0G/8WLhYMjTIwsolf11bF8y305sM2Fev/9lLYCo65EJpb8e9Fr3bCUUiXa2bzg92oRLE
	W5j9Qh5w==;
Received: from mail.tipi-net.de ([194.13.80.246])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJBIM-00000004qgF-2E1G;
	Tue, 20 Oct 2026 14:58:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BC16A1628;
	Tue, 20 Oct 2026 16:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792508303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=28+LnlCRAvjMNnWFEtfBXa2DgYOE3LxqM/Us2XEafcE=;
	b=M8V5ZhLdLP3LvMwiq4WLC8waJafgH/ggE9IV/fUO9k72p7paoT7bTW8OLj17qkl/LXO2RP
	17J+nJu+eccJY9EvE1yZfYHNQUtSEApxWrv7fUhmTfHef+iNHGnqDahBTAYv7cts7Gy/XW
	EPiTa680zH0/pHpnif0QtJSlO+yEQG/SrZat5kXyieek22X2PdI0H/EqJyJ+DM4iuIKTKw
	uRpySKyZWbR4d09zbWBOFXYemrdDoEmeqFdf5JGdlOaR2GM8PRWF0/aVPd45P5od+9oFts
	Vw6I2JZj/Zp/Dp6nbabbMLssI+ztUdpfbkJPtExxVDOxak4uzyYj/+8eCP6fYA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Tue, 20 Oct 2026 16:58:11 +0200
Subject: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_155830_918483_B38AA33F 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MDC of the GENET MDIO controller comes from the GISB clock.
Describe it, so mdio-bcm-unimac can get the real 200 MHz from
clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
can put bounds on when an MDIO write completes for PTP.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb393967..82b38551d55cf 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -597,6 +597,7 @@ genet_mdio: mdio@e14 {
 				compatible = "brcm,genet-mdio-v5";
 				reg = <0xe14 0x8>;
 				reg-names = "mdio";
+				clocks = <&clocks BCM2711_CLOCK_GISB>;
 				#address-cells = <0x1>;
 				#size-cells = <0x0>;
 			};

-- 
2.53.0


