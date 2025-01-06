Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F6E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=; b=URlm5htoQjxxZRKFZ3p0LFDBh2
	tJcKsN0oQXTKrA0saGGtziWUVC72SDant4xQvWNHeUIcR6f0dtmyRkV60sHGxtyZt17PLbgkOVXyu
	MjTSe7yr155+MMufZ12R6yUtvbmGEGpvYuKZbU/hJ8U3nsOgwDPTkXw7lIALTWDpFPXnhMI1KKRFI
	JYuF+wxhLjZVBZJl9q1CV2trCCGMeaYCqKKg1G2yBge5s8p5FnH0fG7vndRWRhGScghfCM8v2BA8I
	kfQNWggl5YmOonWO3GjhKJgCyInngmMX6L5X8D65xu1mtp4WEFMY6Psj5zZryPwh1ll+gVquySLGp
	jEGTrhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu5D-00000002dye-2kmz;
	Mon, 06 Jan 2025 20:52:19 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu3v-00000002dgR-1LDA;
	Mon, 06 Jan 2025 20:51:00 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso201794901fa.2;
        Mon, 06 Jan 2025 12:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736196657; x=1736801457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=P4KXtzi9UztSvV6LGNSFYaCll63VrAFPfv3vx2J8eoY/AbAH52Sejk6GmqJmidAzmo
         HSJRY3C5x+9z0ZtZibsoFTRmQiDxtxP0ZV8Lp6SHhcLhFEWYSOVZTb4NHkKkmD7J9RRB
         ywiBWwZxOF+VA3PjYcy9xaKDwvNop+gM/4Qb/B1x6SlOfz3KOGAgwNVzG/0FaokHXLmJ
         OXfq4rr1ptNEbeDgW3Ke4fMnQKCL11hvB10zJUtFjeVF+q2Lyat9ReCuCnz4Zlza9Qkz
         lqMAse7Hk5+IT4DKQfsJh0sA6r1lXM99XuS9a9QEk1zNXNR8Esw4WRQJgQ+uREEC5ooi
         g/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196657; x=1736801457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=hOgFEt1Zq0Gwv+Kb0mLkP1TanHF2pgkEA7aw076vA8kpxHNPG+22X49qZiVmRK6g1C
         cItwLQAskA3MkK862VuVbmDPOFqlfitPycH2RlKQ7Cg/Pq1Qf/A9Z2O6t5KN69uLa+9F
         5VzglZoC/CMSg3oNKinCeWdSU5M1k9/dosgWMlH5oRM69pe+TbckuZz39sUdalEdAd5p
         Wq1MyFtvIcE1rqKYxv6W8gzqFrVCQKy4U5rZNhlR2gRx3vbsg7q6TKZRtavhZAqg1Ej6
         +WTGUBAN2lQ8c/5XGULC4pfp8O6LgLc8ZrWoYkrsHwHgUBOAJs/kpybu/N3rf8mvFi+7
         1R8w==
X-Forwarded-Encrypted: i=1; AJvYcCXMAQF1QnZP3gC13FwbuNkwfUWYxzYpmCcSZ2s+C88k4Uuelh5MI3kmxxMchfrc6HZMHznzfJQhHJyftu0nCYw=@lists.infradead.org, AJvYcCXxgh8JbkF9APU8Q0ggKPBa0urYKnDfFEtJIAD7WCBi+pU4XDOXI1+6OcsrOO7DYSbbP76Fbeop4CZh3/Tb0ypu@lists.infradead.org
X-Gm-Message-State: AOJu0YwdOf6pl4Gd6r1gw7QH0+xSzln+g3PBvfGdP0ET8dh64qPV3hh5
	hzjNF4vttgP+bXRp6DF9XNrs3jMoUPc51ySN3BMPKG0BEthOB+8=
X-Gm-Gg: ASbGncufZAh07AqsII+0oW5CeXmCluK9tDEYLNP7SjqYiOjYezLjaoHQa2p9IDrQ1PC
	+2xHPOHK0rB62EQxXHCNkvF9Y90SXxEYX3Z+H/8SRusXwY07pFrBg/zBak+HcNwASvLgEJliFaY
	eZ+6zor1XUpt5JuncWryADWrV6xI9n3s1ymTVdjAmnlPjO8i+OYBsl3WdQq/KTM/452frwjBmsr
	TzlToFyv/JqddWBy10GJsxtDoDf7MJIhD5VDapJquk8qSpkoj2ioUmU/iE=
X-Google-Smtp-Source: AGHT+IFiuKkIWmpOb/LPWmM3EGUaAKhrbL+KyOsUE8mTsu528hjXe8wlXPuXg1xHgm0pXypRRPbtQA==
X-Received: by 2002:a2e:a991:0:b0:300:33b1:f0e1 with SMTP id 38308e7fff4ca-304684190bemr192377311fa.0.1736196656638;
        Mon, 06 Jan 2025 12:50:56 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad2a0sm57898481fa.62.2025.01.06.12.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:50:56 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Date: Mon, 06 Jan 2025 23:50:54 +0300
Subject: [PATCH v7 1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2 and
 Pi2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-bigtreetech-cb2-v7-1-565567e2c0a4@gmail.com>
References: <20250106-bigtreetech-cb2-v7-0-565567e2c0a4@gmail.com>
In-Reply-To: <20250106-bigtreetech-cb2-v7-0-565567e2c0a4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=p5DkTJDu5QlNVWl35gjaVUthknkZBv6iZeP84hntyqE=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnfEIvhstkhToraQ3pry+X3f18aoGH6gmz3nuoY
 4AnTnC2QbKJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3xCLwAKCRC8310ZUDOW
 /TP4D/4i/ABA+1kdh4uiXsedwzbfwkEz4JomuyCEzy0SfoZa1c5l04ZfsPf13M4W0bSSOSx11A0
 YJPHSlQMLoomoJFmZYIf/b7TzvL26aBe3Qw7b3vSKy3QU2MX1LWhJFywIVZIIHLUkuQ0pQey+kr
 C0TeE/4/PRAqaTgZYRtjb6pY4eq+VRAQOnfHd9iwhGJSgpWqRP3sJXFq2uGlUPmfoeiElMDEXSh
 cBMkzweHKX1wlM/zjzzSgvjlVveTQ4y5cy16DyfXTNahEvUnqz8sO1BQhpNiSq0jy67mG8M+SxN
 F8TUwDcDhm9ApkKrXi/Ip0VrTgetjYbI3j7UOtqbaZFvcSfhBeDRMQTCIsTs7W9f4FFmoGpIH36
 fFCWNR7RptUi5l7JZVUjmcFzcNyZe5cJx0Q2lQTkinXmKmX2fgorfNqFlsotgO11F99RzXe5q7Q
 5qtvQ9EgIylzCfqRRQeCn8UrcFrq836qCq48f4DZwHNWR8/3PlY0r2F/x94b72gnv28kaR3uKZe
 d/YLKTkHEzUGEBT2OZ/fLf3Ki0ApI5ZrN8Kb4uE11IDjP8sKtPJy9CgsrYv1FqcXlU6qKV/nBIR
 zoMONTWl0Jg8RA2q/HhzuqncmKvmIgnX8HdT9EuozI/uezLOqQO+Za2jxp0PRGt1c6Of3Z/79Ix
 pv3vhUiiHFZnEwA==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125059_350932_6D2682EC 
X-CRM114-Status: UNSURE (   7.82  )
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 based boards

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..349453b1676bfac45abf5cd49d6bd9f847281213 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -81,6 +81,17 @@ properties:
           - const: azw,beelink-a1
           - const: rockchip,rk3328
 
+      - description: BigTreeTech CB2 Manta M4/8P
+        items:
+          - const: bigtreetech,cb2-manta
+          - const: bigtreetech,cb2
+          - const: rockchip,rk3566
+
+      - description: BigTreeTech Pi 2
+        items:
+          - const: bigtreetech,pi2
+          - const: rockchip,rk3566
+
       - description: bq Curie 2 tablet
         items:
           - const: mundoreader,bq-curie2

-- 
2.45.2


