Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB42C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 18:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4FkQOjW0dEQldWqVQqpMRcOS3E+ncteqKD5m7Do0e/E=; b=wwgTxWdpz5rNOU6TTyXkqRu6bK
	6fUK/dUzuyyc1NqQw2WtxuH4dViWuL/DctlsrYLoC63OqMuGEkv+B2kHrIj1+nqtvMrPIip6UBGmA
	CUR42ECdYKnSwybm1pNnU1Iu/QPAbehnGG317GBuC2enbcVYo70WZUaMg9I3q69MzQmB0f8RRtyCa
	PNEi3CeIEu4WvWswrvgqRciqp827IIEPi6G3aDCfzBYVoANerKCzvN3bmUW93HhOUysI5uEE+IptT
	PzbZuMFX9n8+0F6fc2gj1fMxlSrsznuOHpJX37h35U3g3QdsQ0lvlhcefTkaj8RWxrRCV+Q5F6S7B
	vO2+o/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOL8m-00000002sMs-3bFE;
	Sun, 08 Jun 2025 18:53:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOL6f-00000002sDw-0Wl8;
	Sun, 08 Jun 2025 18:50:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2772832b3a.2;
        Sun, 08 Jun 2025 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749408656; x=1750013456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FkQOjW0dEQldWqVQqpMRcOS3E+ncteqKD5m7Do0e/E=;
        b=ngRSNVkzdhun7ICD7Bn0UHWtxzR0ba+TjQjJa56POQiQp8XjjYsKGkMKLYbdOiUt5+
         2DwYhIYTiTuR9zJqBragQ6ukPTiEON0UT2VPVBo9ofRw36DkR2azvEyzcOqtvgh28OaT
         np4oGDCtcMQWjoreKoQawZ2b6aLYWxWBbf19AqsZ9rUbDdtqTRriOWJs4bAZE0gy5Eg/
         jpht0H73YjJFe1WRclstVPThkGkD6MZyc53R5B2WE1Kyd5YER/I+2irJiAuaqOZn7vy/
         fOEOd5+35zC0arSlNAL+VL3qCwPeL9SSBbYXBIZzikFjife5Wa+9O2WXf/k1i1n19Uc5
         +qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749408656; x=1750013456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FkQOjW0dEQldWqVQqpMRcOS3E+ncteqKD5m7Do0e/E=;
        b=QdfT8qv49oiHlUhwdE+JIYNeK8DUZidlH98WZqoHjQGyC3AxSuX6SzpRTJVfQXznqj
         ixlxUcpJzPwy8zG5uUXsNj/n1aYrcfiAelp6/p51SIIt7wgfkkDb3lxPJ9PKTeBUNiUU
         z6+1cVLIdLEQqH2icMJ0okub9x2L6N9ZuggQL04tCBjhN5Wlb1UB4AthqX/jfUdUTWn0
         aKe+WfT2wyYHpaF6IRFojKofCfoQlUd2hjSGEFmqr4rdGO1f0YTMjBk93pp04Kp0mFs6
         hpTXs3aMdNBadzXmYfDYLnM8c5xdaVHXN7nuBOyfWhSqCf0D+X6AgVOsq2CJDfOCyQMy
         QVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaMzHAY+lJHFySSfiLc9aRGIgDC7DxJL0/tz6UwF6CGnCM3jhlbo7j2Ft7agcRkVBdP91KjJ87pFyqKUaQQN9k@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7sKQgYJmiadh++AZBvGxJeV2pVIif3FOVfSaTmxdT/Ku4778A
	ibb5DuhMB2D0eeUNYD3EJlFidPAVfA7SuxYQQONy+8gNljhc4t6d9Abm
X-Gm-Gg: ASbGncvHDxTZMiP47Ihr3z7Jhy+3V+EMU8hIJ9HSv4/oebMVhAfJIhUuvGs/jZeRN+p
	Khju8c1fsoOEfGObEQxvU6EG9CakaPxPLBK0vg0B6cb0zkdDv8skQF+27Z5WxuKtU/4wU6yVknH
	AyLOjbtp36yOyJ7Q9Yn7t0neIU57M53EY9fSxAn2+ka0XHTpO/HY/7hHPD2crnXeY8IwKSq13qZ
	SstBvBK8mUBI3kdC5n8z88/O5jxwaitl2ei+CEUfr4+odUR3h+vDy3bgReAz96i856+wuoQodpe
	kGWc+BTrStbTI3WazcJ8vv5I5DXsfqCaSwCH8VPdK0qJF647uDzI30VzdRutp38=
X-Google-Smtp-Source: AGHT+IFmkmDN5HJMtOVAkQ+D2VV/D9Hx1lj1672INza519ZQEJaZQhN5dtNTS2zy37PO0ZFmNvX1dw==
X-Received: by 2002:a05:6a00:22c7:b0:748:3485:b99d with SMTP id d2e1a72fcca58-7483485d9d4mr10823644b3a.18.1749408655711;
        Sun, 08 Jun 2025 11:50:55 -0700 (PDT)
Received: from celestia.turtle.lan ([2601:1c2:c184:dc00:21ba:8ec7:ee03:e8ae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3824fsm4493278b3a.19.2025.06.08.11.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 11:50:55 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	=?UTF-8?q?Adri=C3=A1n=20Mart=C3=ADnez=20Larumbe?= <adrian.larumbe@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH] arm64: dts: rockchip: Remove workaround that prevented Turing RK1 GPU power regulator control
Date: Sun,  8 Jun 2025 11:48:55 -0700
Message-ID: <20250608184855.130206-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_115057_168835_24F9AE73 
X-CRM114-Status: GOOD (  15.57  )
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

The RK3588 GPU power domain cannot be activated unless the external
power regulator is already on. When GPU support was added to this DT,
we had no way to represent this requirement, so `regulator-always-on`
was added to the `vdd_gpu_s0` regulator in order to ensure stability.
A later patch series (see "Fixes:" commit) resolved this shortcoming,
but that commit left the workaround -- and rendered the comment above
it no longer correct.

Remove the workaround to allow the GPU power regulator to power off, now
that the DT includes the necessary information to power it back on
correctly.

Fixes: f94500eb7328b ("arm64: dts: rockchip: Add GPU power domain regulator dependency for RK3588")
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
Cc: <stable@vger.kernel.org>
---

Hi friends,

This is a patch from about two weeks ago that I failed to address to all
relevant recipients, so I'm resending it with the recipients of the "Fixes:"
commit included, as I should have done originally.

The original thread had no discussion.

Well wishes,
Sam

---
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 60ad272982ad..6daea8961fdd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -398,17 +398,6 @@ rk806_dvs3_null: dvs3-null-pins {
 
 		regulators {
 			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
-				/*
-				 * RK3588's GPU power domain cannot be enabled
-				 * without this regulator active, but it
-				 * doesn't have to be on when the GPU PD is
-				 * disabled.  Because the PD binding does not
-				 * currently allow us to express this
-				 * relationship, we have no choice but to do
-				 * this instead:
-				 */
-				regulator-always-on;
-
 				regulator-boot-on;
 				regulator-min-microvolt = <550000>;
 				regulator-max-microvolt = <950000>;
-- 
2.48.1


