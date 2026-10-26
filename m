Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D398606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nPWuieCl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q8Spiyvb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=; b=nPWuieClxXA8Ez
	hBBfo7E3Y7/3Ui50sJ1zGJ8Mzwk2QdZzlFiYvdD5Qrdam75RZTvH2SXlv8GG1Nvh8GfdxlvmQHTY+
	oZZH+tJhjsLKGCzMMB6meic64t2xT0qWjVT5sKxKD8s/2mfLyqrVZXT8T1HiHgD0ErgKaPqvpVM7a
	AE5OGqhLC7WJy45pfQUFB2oXrw9LjLEDlAANoFzS7/VaaC/9KvFCDz2EFjug1d0A4lkxKmVSGfiRa
	Jue2x4uaYLLoITQQQoxWKqtktehNfygOcYQPONQxaTsOZj5zmTG+jBAUXqb+xckYEJCUjWxMpc73w
	ihnRYFr4zj5wqmrsB7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL8mn-00000001Xm1-1Q5L;
	Mon, 26 Oct 2026 00:42:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL8mk-00000001Xlh-4AE9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 00:42:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2813725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975317; x=1793580117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=Q8SpiyvbJdyEMXqSb2aS2orMpx9vjs293hT7wLSBC8ENkWrAEW1qOREcN97Jh75mL0
         8VBJJJLsAl2F+qU5DIyJQmhulxpIlXBktl3BatWb+m5UWcQwMBt5jj+X8ezL27h5F0Xh
         Vl6J3lQ3B79KcD0IQTQWdbS1CZosBLUG7t3CSP+Vn1nR0ErGaXNRnRfAnnWWfKbKuPd6
         cv/c73ZRoPcjz4U9vNB+xW/9W5djAwgSWJQ2VqWTRs1vlFmIkk3RYVQ68C+6ZKkyue9u
         9osbJtSEQn8EQL3eQKIJO5Ikfo77NUHT43M1mgtW3mhyIK3zGakQyTxHWNyS/LuQ09LJ
         2ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975317; x=1793580117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=n+Jv3jduyQw2V4XI4DGHwE5Z6IDilLU4iVJqRNs/zdFZMKPX+oRJunCkrTt06QMjGG
         ZfwzIN1uN5rpl/y7EW0dv9ADAbv0VXHb42jAvTyJuhEqrPEKJI9hqHyB8d1wjSEScYA9
         T83fETqUAo9IFhhbJl67Yctk3gL2njoMk7yXJh4rZd7fXaPWtXMBO08dQqhu3IGz14yz
         fQACaYnaZEnJDTmXtlkH7Xvo2Pa7z7fK7cOAzVDwvTeVxFJZvk3wM4jyCqIui7xjddnF
         iKi2sg5vYX28vjmxaYWp1fx2h5oPoFA9sUbcKXfqer7TJ5qbOPW6uQ9qdMBsAy+es/g1
         DphQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRLIB3OqR2b5ZHVvwqD0xAo5BAeM6mSqFx8dsomgilcxnoy54kKuJ9/CUvoVYYhTTfhnYydQbLp2TC2rAu8AJL@lists.infradead.org
X-Gm-Message-State: AFq9FYIWX0BUbWC9krYdHzUzVgr6cu0doWb4nHmKeIXM+1GE3VAnZFXK
	aNVBw/+IY+plvl9VTO/uKejV6u2fiFcyS6ncgvF7x0ho2WEZdtH84tQE
X-Gm-Gg: AYBFou1ngDnqWOuvGuxsk1BilPGzapE/wl4SKV0tm1AU4zp37GiqL+bRtN6f1tsB1Gv
	6+4jYKlxm/DEp6pRCQYBEarTHXsmfvXnMlYVo4ZozmS34YAK6GzAzv3jSJfYBcF1H7hUFmcDw5q
	VmSqG+zWkMxAdzGwsfjD7wr9NTQEj72Jcd+eNqX2j2pICzz48AmRPg9GZ56YpJEE1gWTussAAu+
	n5OEHUS5rS1vDjk49sez4RVZ75hfeE1OMo9w1zpveSfdiA41iFv5loe29WVasH48ofUq3clJyPE
	doXGF5XHaixzjafW6eNC2GGDXZQwQrJbHi9TYGL/b0NMMqBnOSZP+Zs9d1WmXNFL6dSp05iW5Dn
	C7Dx9vaerQLllU9wWLCOAZaScrL8zUZr6TbdJbQy2pLQsOiGXm+Lw7TBr04qPFUi1casgHgA37u
	5tDmqBsZlGyA/dMR5fJSm4rpm08rLKbxwh0m0KjAvv/hUJAmKdMSpXp5HJ/RJw/9dVaw9/4OPjL
	LdZ84ARH5LzuaM0Q7ZWmpN9Skxxa+ebaTrGUfYviKtVjFeRbibHBEXFWPiJsvF7jco4OPjwRnMR
	iwK5+SeYamhoMA==
X-Received: by 2002:a05:600c:4688:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a35ae71750mr96046025e9.3.1792975317060;
        Sun, 25 Oct 2026 17:41:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:55 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Date: Mon, 26 Oct 2026 00:39:12 +0000
Message-ID: <20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_174159_043399_DD4D00A4 
X-CRM114-Status: GOOD (  11.02  )
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

The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
always-on before the driver stops doing it.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dc7ff108aa85..bd9c6c6fa117 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -154,6 +154,7 @@ sy7636: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index ff9d50942884..6cf5603c0752 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -327,6 +327,7 @@ sy7636a: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 				regulator-boot-on;
 			};
 		};
-- 
2.52.0


