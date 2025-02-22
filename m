Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7CDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPcfkurtbMpldzDsTGUmb4ViHTY8bVGf8RoBJkJSMuc=; b=OSGZh1GHLZ90wnAzmMA681lD1d
	C2Gi8nnnDt7ettLnDkWlS7YxQwriuKrld0AGglZGRnpY1hHWyTqEkqXS8t/77nydMeEZJxSzNH6YI
	+2sv0bNlDmyXf1RhJd5aKMr71T/MA0gca1CWGp+k7HQdSGWmb7XFOlDx5Vnj2No9z9PBC7BsSICMO
	hvpo4yapHQtICNhIyFlzU1fjNxPqxt7X+CoKcu1NA6n06iRh8uKJ4pMt0Xl/3r8mFOcMV0whs5BcL
	xFrxBUT7riDhCJtsfhm7GIa7NV6wLNZoAqWcGswTmfZroF2KvStHrsEJ95v1j5KWDubwwzT6fxdKz
	oCW7224A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvKj-00000008csN-31KR;
	Sat, 22 Feb 2025 19:38:41 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvGQ-00000008cVG-2drn;
	Sat, 22 Feb 2025 19:34:15 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3f417de5e25so1481870b6e.3;
        Sat, 22 Feb 2025 11:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252853; x=1740857653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPcfkurtbMpldzDsTGUmb4ViHTY8bVGf8RoBJkJSMuc=;
        b=X624eKu+36mqvwT+1IA/IeLrLgdKBHGbOS6E4XgieDfIyLwiXPjr8OsfxJxhuPBJUk
         MZPdDPW9b72Pzna5ohHglvfb4q9INZEymv0+cCQ3+TOeyS/LGe7W/ugaY8E+tsfXewlO
         Ni+5pz9uZuSk0pSmtzdofKqTYAejqQQOfVic1PRRGSdk61AOw/wSffe34xOV46o1WySV
         HGEgcLqT+GqWOZDwz9cdwUyxkkh741NtlsV/O3ZL/uZgqOOs7mrWkrFSc8KYQmwr8/rI
         C/7Nb2hAPiQNh5TrRh/jh1gfRZemd3PK9vLvjqGPD0emFwKKDyE5LIxxQx5kNQHeTFdV
         Y1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252853; x=1740857653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPcfkurtbMpldzDsTGUmb4ViHTY8bVGf8RoBJkJSMuc=;
        b=IyHg/WCecEonLxvSDAZ+2toUVU4lNIoMQuOsIbwRiBEexOU+ITV+CWk9YPrrP0Vefx
         6UFFAh4+kNqmFZWpNUL93SsRF6F0lxn+frVdj2cnue4opL6Xqw1usAQeRMmvrDHxAeot
         06Qyq6rjpQMIuYIw0HzNIp6kzacBpEkZzhAkeX9zG/k/Wfi3F3sx8m0OJY056+3UvvVR
         fwHqn3VRSAfy65ZeWN3Cayes1UQoq8qzUw8hFbsv0Cq9hhbywtohoEK+U8OZkdCAHgbZ
         XR6wzUFlRTCJj1fUsnutbjEx9QQVlbOMJO05jhvHEPyQJq8WqXfPasiOx0zD9BCjPjEK
         e1qw==
X-Forwarded-Encrypted: i=1; AJvYcCUjVXWAOctvdse9mBFKW07G8Q3VLI48reS5x8bJJhNtjKLJL/OfX5o+iARHHPs7TZ6WMgukMx3YWHTyFMMt4JQ=@lists.infradead.org, AJvYcCVb9CMlQ+c9jtHNhtKsWjsa/8TEIxo9rmWbAcGm4my4rLX31aFqpDqdr8jgha5AJgXKzNxTNlLtfCMUs98csUAs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6kUn2gsmaTcHC/UFsS5I2zZ2cpmFoJkRCaC/uqd9skXRK50+a
	6btzsaFvrjr5+BIu3+IhiVr2Aa2bhJxOQ7oGEwHj85RaS/myh3sx5msPLdrb
X-Gm-Gg: ASbGncu3v1l+QjVj2PiQGFxly4pUi8kbilwqSiAM3vffqTel+OhrQkh+qXLQD5WOYOU
	be1Tu7IwvU6+urXJ7JdtB/hPkhrd/6m4Jv1Nk5RIigIQVeV5bOCy5QbzHhMoeiVwmh/cP6UsRKi
	RPqExGH0MQqlaNo87ehSlGwaVzZhJfYcK+UbXtPszeP5JO8Ffi2bXXN5FXik9Dkijqs0FASLr2J
	ZXMNWcMRQKbCmC7qZYgtNOVj/KalQ+miQ5schR0s8JeYLnkWK0qskwAcgcFpeTpMyxWkLY7XaR3
	2SEh1YHwPFcxKWOrveoJUFwUJ4duLsxGUQ==
X-Google-Smtp-Source: AGHT+IET6d/sWjLDjT9VEx0tIX/4VD8IoFUnsGN8UFD2USvFTiuHEvg9/taRe2SGLH4jcRNjtc0Kpg==
X-Received: by 2002:a05:6808:f8e:b0:3f4:600:7f73 with SMTP id 5614622812f47-3f4247a0099mr5578656b6e.33.1740252853486;
        Sat, 22 Feb 2025 11:34:13 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b69:ffa3:9d4e:2cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce7afabd8sm2724012eaf.34.2025.02.22.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:34:13 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 2/5] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 13:33:29 -0600
Message-ID: <20250222193332.1761-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222193332.1761-1-honyuenkwun@gmail.com>
References: <20250222193332.1761-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_113414_662421_A633DFF0 
X-CRM114-Status: UNSURE (   9.18  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.

The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
for HDMI IN.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 23293344d8eb..c9914725264a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1141,11 +1141,12 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Max/Plus
+      - description: Xunlong Orange Pi 5 Max/Plus/Ultra
         items:
           - enum:
               - xunlong,orangepi-5-max
               - xunlong,orangepi-5-plus
+              - xunlong,orangepi-5-ultra
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.48.1


