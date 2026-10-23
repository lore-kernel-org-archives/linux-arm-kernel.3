Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEE6606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KNKBIy5y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hfKwdDyR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=; b=KNKBIy5yBv5D+W
	xgj766lLSzYHHKmPAFGZQ8oegwV6rGDGU0DciuRGtdVNZVtJ56QGGYUy9JcrMwnZ5GMzhalBn8Ztm
	Uoz8S5JHe+JWb/l0CRCMRXEJ/bVVODuX0uHZcQoUwD6kT3ctKLxRhdnhR+HEMLLCWT9P78a+mxUfD
	5UZESsgcnTHBes77jqYD7KMrNgt2LeAuHFiHFEPxE2XmnAqiyPcqU7kBWSey1z38F51Z5Io/UglgC
	eRsylaxz3mobRkAxHqEcZS/uOKCUDvxkMYPHELcjS6CcN4fztRtXrXnUkZoW6a1pdS0Et5WAkuPVC
	KorJGMkQlon8YWobG9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wn-0000000FWlp-0J9Z;
	Fri, 23 Oct 2026 05:36:09 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wk-0000000FWjt-3LOd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:36:07 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-35adc681e1aso509480eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 22:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733766; x=1793338566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=hfKwdDyR6aermqhs/s5W0UL/Os4PdM68KWJHl238HifiGqYu33H1VN0Y+qXGivyfWG
         i6/IIGsCNkaw8Q1oveWmYWHrR2M61ryB7bz2jYH+/birXoBLwGBigNcftzYzhsrkt02G
         ndMUqNFij2rguyaNVCq0yftegYwVyD8Fk8j60/72paRs0oP4wCfN9V3ncIKZryQhNe2R
         NdiFshq5n/ZLkVhCZl9TQ17EBiNLgMhK2+grUwocMZSMDyNJtOUmkSgHTGaRwj1d87n4
         4B72jCflrRvNo8UN7g020bRUJCM1RSCoZoBtJz+n50RdiLKuORIZxZBQxsRuYWwGhNJK
         TXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733766; x=1793338566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=XoQ09htRDctmyYIrKvIp206atbDxVgXAW9o0Miz617dsCOWrfUeYAJIHkujsPT8l1I
         /iqQ2D5U8GfRmjqFOPhJv3Ka8OlBqEta1WKmHL0cgr0+QNHJK7J2WNKsFJYmZtdldniW
         TrNCSxYt/Y/qKPEANOKfnEmByOhjCFq5lfhnayfDB+3wNsLzwYdjdOKYTKy0kSUX3Ux1
         cQQupOLMN0WV3XWcjfNgyTKIyJPHMUjuBX8rHd5Gpm84IKPHU+jxsPGH9VY8b4ofsY52
         xIXMvpVBY9dkUinhbept9Xb5vEwacg68S/5JYlvPrbjL6mzVWrB+khG2M/xDN+yu4sGZ
         5UCg==
X-Forwarded-Encrypted: i=1; AKwUvBxVomuHrmCXWDlfadDAsPbC5CoyWk59heRK15KkhOa+Vx/olfIuVWsb5WfSKkto/5xZiQefEP5lSyHWYUS+aXBP@lists.infradead.org
X-Gm-Message-State: AFq9FYLsZAHJHegQy5NaZKaBv4dS8Hw7QjFQY8kwl/NLisqMALg/pVf8
	tscwrYBCrzfVjHyeBpBakD7XU0txC2CtU8XV7wg61Ha6P2IVpHIm8uPB
X-Gm-Gg: AYBFou0b6BeOlawCv23wMoHU5jMLv5cLhHyQUx/0Cy2rOc2wwPzGIhRH8DNKBvrEgru
	IPuplPyEf8/8fkwz6Pp9qHlu4wy2QOrNGusQBXo1PpQ6Eg1sIbpv7HVNJvBSJQ0i+TjGuL9joS7
	iIjARq0taqU806jKBmGbA4fS3jYntg6bynx1RHn+vWXgc15btTz69EQKjG/U+Y125j5m7WGUoOp
	DTVZdl4asiCA0lCwDGYAwUNGRI0/lICMMvude4CLNgOR7Cai1JqLbOqXXnmG22A5SlmuvQDPAcb
	lIK72ZltHL4mFf775tKrnBef72c97Gwo72VJvRnsBqP5IaqIAq0z+tI7v8RPabrxasGjIbl5fm8
	iWCp3T4KK42/hl4K+3uP5YWF0vlP7Q888t9e1HrzfNAhVGD/Eyba88dprPY/BWLLDfML8wiEgEV
	Gi5NbysQKi3yzlzN4u2pA3hRnfH7ICGRqOqY6aSuLB9iemBeyZLU51aS5HIQfCs9aLs0lCjFHEu
	ZzjqOw1TOwzWMutu0rCFzy6e18DaLzcRYuSed2yL2W4F+JXXlEzVQ==
X-Received: by 2002:a05:7022:b043:10b0:16e:6e3:9a9f with SMTP id a92af1059eb24-195a065903bmr2116014c88.34.1792733766053;
        Thu, 22 Oct 2026 22:36:06 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:05 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Fri, 23 Oct 2026 13:35:47 +0800
Message-ID: <20261023053548.1595033-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_223606_851027_8BD5CC71 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Motorcomm YT8521SC RGMII PHY on the Ariaboard Photonicat has two
front-panel LEDs wired to it. Describe them in the device tree so that
userspace can control and monitor them through the LED class.

Both LEDs use the "keep" default state, so the PHY's built-in LED
behaviour is preserved until userspace overrides the trigger.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..12ae9159bea87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -350,6 +351,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.47.3


