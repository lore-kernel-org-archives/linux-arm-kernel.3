Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB4ECA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+vJmKQWtl6J7yVeYEb7WsF4szveHuDGwgxqszhsgVgg=; b=ei2VPLYXO37ksndhnwpVBIj+fW
	K0eeEgjarpMv+Iet4dNW4W3rsfO/ksJEhmVqBsS5ii2HfTlKog74AT39FUKz5BpXb9jnI8/GC7jvr
	o8qnn9KOPCkpDbTLAifUpwvxhIU591l7AxYBm58GKjY8P746fazcpY6v09z22yHAnpWz5Regu/cf7
	vm0Dy+d9dKEj63YR4R1W65TSyOo8X9iBtEMIuzVbvpl/VhQwQdq/TwiHFNGzJhtevQWr+aNTRkFlP
	HLH4+/pUuOfKYJ27h5hbcob1DWdO/V6zeN36GRlUCQYoWIh3fdiNNOllw8c+tk+bNUA5rMC99S82i
	+zs02JxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoELd-00000009OiR-37EM;
	Tue, 19 Aug 2025 04:53:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEJ2-00000009ObZ-2UHo;
	Tue, 19 Aug 2025 04:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+vJmKQWtl6J7yVeYEb7WsF4szveHuDGwgxqszhsgVgg=; b=JMim4CIkd4W/TR1onqluXR8aSu
	UdxO4Xb7EG6kX4k5B1LKV9LgwVB7JsToilHiSC5Ql1UT9GzHZ8/INIl6xB6TZofnQboo0mJQtC9et
	WS8X3dpObUgjsBAyT3R204RqGGMLP3xtPvm+/Y1IRzpswTm8pVuuJlB/iWherANNSlwS9oR7LxyZj
	tLTwSwULIuuqqHKogpN6dL7r4iJoqHPkbRpBZPG16R1oawpL8UvS+xHRvcDMYBvu3uIR+60Fsyn3f
	Z7MfVf4ROwiNlU4VgNl+4wftP0WJuuvMYUxl6lMHc7emL9O4MnNHGyNQy9YbioCGH1T9s281t5djb
	qwHbjdhg==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEIm-0000000HZNT-1JuG;
	Tue, 19 Aug 2025 04:50:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4717543ed9so3316394a12.3;
        Mon, 18 Aug 2025 21:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755579024; x=1756183824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vJmKQWtl6J7yVeYEb7WsF4szveHuDGwgxqszhsgVgg=;
        b=l77k+T+adrohVWuKQsMRnJJaKqYosOlL7p9hhwju/chvpxeyPfrMiRwihC0TleGRGp
         RPRZqDq5C703EWj6Yz8MwDkKOYSsmdrBkPMGX2ZkU21J9EkLYl1qQcKzu8lJ4r4JS/sC
         J0Wt5UkGZ0JfcXMc+lrWJGyzEEu33h9i4DmgxNH0fI7WIQMJrpFWbtRqvCrhSbu/6SjT
         eqPD6p6L7UDUOwpMd6HRCf2ARTFu7upR17kl44CgFBIDzJQz2IyZ8uVwnAyTLLkFIqpr
         POkTdbFRl3K/AXdR+3CxLqI7xBkNatTkb3f6tgx+qqATXL5Q8qlvJmbPr4l4B6SlXZi0
         HvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755579024; x=1756183824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vJmKQWtl6J7yVeYEb7WsF4szveHuDGwgxqszhsgVgg=;
        b=GEpmktVZBBVlI/mxJFXlLKa/Uc8JopBf0GqUZLUHOXPfDUoDk9ROYYzVJaHmBN3mWZ
         XcECL/8ZE23uTLaeYV8w+MOUk8JDiOFqwQboquOwWVGbnsQgQ8JuUa2GlO85e/C44nhc
         55R/aUsxPlTAIaFIx0HPNCiyyvct/0S+73uKhpmkQWS12u4Jw4+6bgTFQ35QNaMOSt2c
         F1pkv0SX3pEcdw14HRfj0Twczod+3rbuUen2ED7MML9XRcls3a1BDbswhSNQzCOZG/te
         VOEg2TZiGci6ZUYR6QkTDyBXl5cPMAD1UqrtpLdVXLAQz23YoN2rxsQAmJMxEiJE1dMc
         wdfg==
X-Forwarded-Encrypted: i=1; AJvYcCWMSZHTlwEsaR/C0qLeOFoFUOWAoY8wqayiD3BCqReAMQupieRXJg7q4sEIrzMpiUpdxarobSrgnL32NlBBGjXx@lists.infradead.org, AJvYcCX7hgLvrwt+2Nxg7sn7TDlHNE+hrceZvuGHUL5oAkCpv+PFXkLVdFZT+Z+h2sspbVaSiEn1qoZvnzRTA93zOlo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdjuuOWcUbKr1ZgHy94dlbHBrM2mIcSXhwOGJmeECf+BpbVyfv
	OLi1ys6DxiZckRDQwzoxENpMqJCaS5euzXBLu10dPmEBh6NgJrXiALDLQ/MK613Z
X-Gm-Gg: ASbGnctOSlqXcC8x000t2WKHJ9coZktmeaFkuqRN7trQ0cUhP7uNhsbUfEpoqi1Wsif
	4bdOLjRZylPHcUB7qVOJDnzAw8y+zhCkbLpvBUJh3m8y0YeWAhGV4V08iawanZa4oK2csmZbZBx
	GzoKGu6tWI4nQULCkrW3KdqJz1OL16m2ALAaZq3p/8vRd7bJPvXpsN3zCqDUPx2BlftyvMHJLRH
	qW24pTkzS6bwWA1g+oCUIrgkfVfNgJSH1d9SaO+hGIFmYtngkJnNt3Xe6Ov/eRc+UcoWBYA+CCY
	O3jP9Z8FOdBwiJXiX19DnhM1eKjYLTVdITRBQ1njCkpn11nabtVxRzfdsiyvr3Wbe7mMnQfckPg
	b59kojgR/nKWyMaN1eA==
X-Google-Smtp-Source: AGHT+IE+vvFkCAMYWcasDYcaMWmjMZUKz3Kfg4C6k3T20iFxSNENGqz3MfkDySluEL6Scuwb+o/WUQ==
X-Received: by 2002:a17:902:e94e:b0:235:e942:cb9e with SMTP id d9443c01a7336-245e043538cmr13109365ad.9.1755579023656;
        Mon, 18 Aug 2025 21:50:23 -0700 (PDT)
Received: from anyang.. ([106.250.177.234])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2446ca9d02csm96119415ad.7.2025.08.18.21.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 21:50:23 -0700 (PDT)
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Change ethernet TXD timing delay value
Date: Tue, 19 Aug 2025 13:50:17 +0900
Message-Id: <20250819045018.2094282-1-tobetter@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_055035_072978_262EF3A8 
X-CRM114-Status: GOOD (  11.66  )
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

Very poor network performance is observed on the ODROID-M1 Board
(REV 1.0 20220613) when running iperf3 (under 200Mbits/sec), and
this problem can be resolved after changing the value of TXD
timing to 0x35 from 0x4f.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Change-Id: Idecd246e3fe93447b6e3e9b165d077d2050bbd75
---
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 0f844806ec542..e1a550a04498e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -210,7 +210,7 @@ &gmac0_rgmii_clk
 		     &gmac0_rgmii_bus>;
 	status = "okay";
 
-	tx_delay = <0x4f>;
+	tx_delay = <0x35>;
 	rx_delay = <0x2d>;
 };
 
-- 
2.34.1


