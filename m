Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1709FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 20:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ktqAo906g1TKt406wyEYKOmiF5CVJ1rF2+5tYAkr74=; b=qeqzM1OKQ1olS1Vhhqi6aY63Dy
	CicQGGGAwCgEnNdHUyrRmICnuG4ljBuKR/CLnN+QGWFA4haxTV8qdKcs2RQsjAlcJwEeRNVgrvhw5
	UeF/jAYFE+DA1cr7exU3ryU0IAZNM6/PSIYWjOiIeQ7N/HjVkVuTeWRA53OYf/m7QzDa+/ak+DBuP
	D67dnX6VX08lv/2V6c7nvQhDW8rGCZU/HkGHsUsXW7ObYNYxoC5MN9UgVPQCbvVZpg97/uA5vvvHe
	fgFbn36UwpcRo+VpK20ri/EnFjeGVF0UwyJyS+o1NMXxdshPyH3FLXr7iH1NI+ut2TfbNlbzwc2lt
	mqgZQXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1topXc-0000000GcnS-17SW;
	Sun, 02 Mar 2025 20:04:00 +0000
Received: from mail-lj1-x262.google.com ([2a00:1450:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1topW3-0000000Gchc-0fuq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 20:02:24 +0000
Received: by mail-lj1-x262.google.com with SMTP id 38308e7fff4ca-307bc125e2eso41282031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1740945741; x=1741550541; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ktqAo906g1TKt406wyEYKOmiF5CVJ1rF2+5tYAkr74=;
        b=St7g9HJdTw2C15tdFK85LvD9wHkUHG/Y+h7s+0EGNoGIjaHIA3ghDojqgNCQ5KmM4+
         MXfFdK5jRLwYJFb7uhTM4xu7bu4rxsGOvdyelgfjss8ln0c9lL0Smo49WgFiVXD+rj/c
         Ukx1colNFhZNHm72DSgW9w64rR3Hj6IALfqnjXatHHvSq2SO3mrs0QNfXjxTrAkT6K6q
         0/srGTg7eb+1YD8r4zCh8y7naOiCJeXJRITI7PWariQuKRuLzUOzI00xvTYMd1UhqpR6
         ojRITDhrnqTgV8A4wi4oWK58oyJ2gVFAnl+7ntoykqwMWem+LOyOZhPyPszb+ADRKRoh
         B0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945741; x=1741550541;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ktqAo906g1TKt406wyEYKOmiF5CVJ1rF2+5tYAkr74=;
        b=GiJkKV/WOhukoj75j85yTWZ0IHrZKMJKZo1BkwJdZZYGZCzVRrafKCvHuT2KdnYQmH
         gW8fplO0VF82wF9Wycol0YtTgFdMxyetOadEbukOGO4xfJYt5m2fhlDUB4WqIyo14TrA
         gHW+etita56U3iI6W1YrUyLyvOYB58Yj07j3AcUYzVtAyxDB1PEROq8X4e0lZubop8dr
         iYue0NrZYYqW7gwrOtZnELb5wrsyTdOk8obX8Li6ddT9mcJ6WLPtDpeBmvLPz0Cc7ltS
         aQOYY2XsNFglhkIv3J11lvJr6bFfxpfHcTnzhjQNgBZTgxwFnOITkZ8rFQJz43FbSBRq
         8ing==
X-Gm-Message-State: AOJu0Yyb/es9f9IMyT90qJtXWzx1XP1Ni2brCKnec1kGuEY77nO0UkYn
	Po04mRZpX4NT17tWD5S892uiWoukQRuBMTYbOxPnnVKV2y56UnuyC2hRZkWYiBG2IYnwx9nnzn4
	l20pcVQVyCNfJZ/aNsL6Oc1V2lWb5SCUD
X-Gm-Gg: ASbGnctH+1g9varas13eedPG04J19Sy17O6OIBMQzfT4pmNnL52j7roZKMZ+gK9t8de
	y5cgdW3SDde6kOsKrXwxDOC1rVZkrSqI4hcjfNF5oCM5mZ2cTduEsTmURcc8jceCjnET+WUDl7u
	0zy20RzeltTK4lkmBcAeRHgwKjVJ1JuGPfzbrN+aSI+3bzlnEspflnigCPaID5Rkg8q3mdBcMiB
	LgGQZxmbbE0AXvCefnDXQCH/LfFkF6Npb8+Vow2bk2AnGxKat5k+0IxpOyWVwU7sKdrYlCh1NLe
	S2ads9ZDr98aac28kgXG5q1YUzExZDwaaCYal/iFgXo=
X-Google-Smtp-Source: AGHT+IEoW2SHIDDk1aLDFV+GZp9bKgEaP+RRL4SkeATZfvS4Scg3SkpbOr9RjR6zN8pzWGl4nlfKBtFrcL0t
X-Received: by 2002:a05:6512:3f02:b0:545:e2e:8425 with SMTP id 2adb3069b0e04-5494c32f8dcmr4146730e87.39.1740945740250;
        Sun, 02 Mar 2025 12:02:20 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id 2adb3069b0e04-54961daf36csm53433e87.112.2025.03.02.12.02.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Mar 2025 12:02:20 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Sun, 2 Mar 2025 21:02:16 +0100
From: Patrick Wildt <patrick@blueri.se>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
Message-ID: <Z8S5SHqUqKYiT6Wd@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_120223_423555_4F9465A3 
X-CRM114-Status: UNSURE (   8.64  )
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

Document board compatible bindings for the MNT Reform 2 with it's RCORE
SoM, which is based on Firefly's iCore-3588Q.

Signed-off-by: Patrick Wildt <patrick@blueri.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v5:
- No changes
Changes for v4:
- Added acked-by
Changes for v3:
- Split DT as it's based on a Firefly iCore-3588Q SoM
Changes for v2:
- No changes

 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..e21c5c8fc2a3 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -178,6 +178,13 @@ properties:
           - const: engicam,px30-core
           - const: rockchip,px30
 
+      - description: Firefly iCore-3588Q-based boards
+        items:
+          - enum:
+              - mntre,reform2-rcore
+          - const: firefly,icore-3588q
+          - const: rockchip,rk3588
+
       - description: Firefly Core-3588J-based boards
         items:
           - enum:
-- 
2.48.1


