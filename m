Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E684B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jH7odUp;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OtUX5Ebt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=; b=1jH7odUpxuiXVR
	7AwUrBe5ArM+/CesE6T0+iL6ShT2ua6XUGLqvqOlHUJxoG72OGgV4emcAwd6sxfmiAz3HtZIqLIpN
	OADJ+lkLU2hwp+dtYzhw7WU+4zpf4eG0NnCFjNTIBvevp5QTDtat1HD9yuxFOCMq0NopwTV5tDHXi
	9oFWQG5yp3Bc5e+5LBrHJKXoI5u7H/Dn1QyVpjGlIDh1oe/1w+7SgUnYM/30mxItGFzXGcrgh2c0z
	FnJSnAI8XP0M24Ve7U6esnOr8VC5jh06hvqvZNSFevpi4A0QN+OiZS+ncCdU5DOy6rqmuAHcxz5qD
	I4BtC/VnF027EKTrb3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVp-00000003JzE-3PXk;
	Mon, 26 Oct 2026 21:45:49 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVW-00000003Jjm-3yPD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:45:33 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-369f33df08eso3921604eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051130; x=1793655930; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=OtUX5EbtRUzgsBuZrSXDPr1GW8sOunbOFB+Ia61uxjk3dVoOJYZj0Y1lXXOYsXMAR/
         nzM7cDXgHH15wRlKyJmdgEqEcy1EYu56g3xvwsNO2ErsHHkLPglF4PTcYe0ymfHICMwn
         R5SvxzVGmPp1SbIzGUNdu27PyxqLr4KgZvAys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051130; x=1793655930;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=Ry9BkxQ+bBIeXB3UeZAHWMIIOEts9Lij/hjJt0aYXnNEU8MY9LGV0B+/mJd40Fmod6
         TGEJJC3FnjCctVjOgFNGFhRG2Isgyo84DeIaIpFZ+BXt0Nwj3c8/sNrfbo/2/gvuL0Ka
         C9IhFPPWAoZ68nSS0Ici+LuO/YwkQ17DXpo1J0auZyRt2auIhtlT8Y1z1ZFx9QKt12CO
         Tf3JKXqSG2XdZwE7Kuwit8FKZEHJksjHc9BIqpAEDrCcWPG3VtQwnes3uXyhKp/l58o4
         3JhLtoF/JAosBO7O/jj8Tqox2SKZMxaMGYKE0Ezw5Ww+z+Y8v4cKps53FSNfMwULcWLn
         G0yg==
X-Forwarded-Encrypted: i=1; AKwUvBxlwB9CZrHjbR5bGhkVrkHPo0PZ7Cni1/purKVq9zugRSpkShvot5S54i01hdFZtVscgzo4SR0woepwPIouuygF@lists.infradead.org
X-Gm-Message-State: AFq9FYK59/kgHaA+1TetI9KJ2ZmyO5/Aihl4kirdLOHvqCpcK50GuDFF
	jeR5KkH7p6hZv8SakLJwMY/MOMKWCVjRouoVw6ipXn1BXAgulyVF+HrQdq+xNLrkGg==
X-Gm-Gg: AYBFou1fhHlnTNaK69ZYPEETvhDpGwcnNJRy4rvqvhh3C1dvJ+QC7jr+tbNTP9tzywi
	VpTaTKuC+TN4JoVR4c6MyJLnutIC+nSuBee4394Psn16r5SFJcHDCXt34PlIOn8HTTvXSLbE4oQ
	x6JQwRr2mxRK+0LtcWGiOkGGATDNymux/a5Z4G+V83d6Z80+oowLKnZjyrM5YhDoeCytNmWUgN0
	9kMsvfnZ6Z5XZ//i1019E5MXA3ImCngnAmXttHTeagUr1fEIrZt399MyIvUGw6HAax1kiVbfuo/
	Sm0RF0B+ILD/hfi/a0LffkZdzHnhWQBdNOPJmeR5ifAaZ+UVJ+2gRMZG3ytCR6uAVeUKHrLN1zW
	EJZERWYA7b1yTPH/CoESAYYNcism9S+hjkKi9IrvSwwnLsGZrJUAE6kzbSN6Shq+1uJbLrK1Bn9
	qm+0JQMmvjnIrgV7lmdqOI8dFRTKcukl0R1EnZghDtvrpwlsBzMMb7TYz9d/qY8SW9CyFt2hjM+
	JUa6DT7A00q+gW9LUGEKldFZLsUDs1hG1XXmStJ4zczgSiibZTahs2OhWzS7mRYwPNbCUBIKH5r
	UNuhKTWfMjKxuNXokHc=
X-Received: by 2002:a05:7022:eb57:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-199377d8c73mr12569336c88.46.1793051129456;
        Mon, 26 Oct 2026 14:45:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-198a0f81ea9sm32064575c88.11.2026.10.26.14.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:28 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Mon, 26 Oct 2026 14:43:47 -0700
Message-ID: <20261026144346.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144531_020254_2EAB6FAA 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -2.4 (--)
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

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 MAINTAINERS | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd4e03bb54..c997d23e377d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11424,18 +11424,28 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+F:	Documentation/devicetree/bindings/soc/google/
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/interrupt-controller/irq-cpm-google.h
+F:	include/dt-bindings/power/google,*
+F:	include/dt-bindings/reset/google,*
+F:	include/dt-bindings/soc/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.0.307.g5fe7bd680c-goog


