Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB46082BF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNcA6gqu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iB/j23z3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=; b=hNcA6gqugLs3CQ77sSj551oYvX
	XjNctS4kN8IPDORaUrazjLrERzLL5lkXA7ZbCscsJvvTCEMJJelLb4apRg6021014K1IB4sDoZQMd
	BAhl1Bdryq9xmCTJC0nLl5FmBx+dy96RpsYpglopu4n4LtuNejFaNe8f0405ZZOOtevJ0J9NrUQtX
	P45paePjoRuujO+vgdqnbFiREqxZF9YSocsZHvehqa5rivD/ra8vYwv530MGyZRAC5uPDp4EtYj5j
	hJuoQcMR7/vfF+++34RaQlQlvb1g1X/pShTqO3M1wu0OnE4C1SL8D05LDYrTjEV9Ah8fLYbrJjGSV
	zcv0mHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg4D-00000006Ruo-400y;
	Wed, 04 Nov 2026 18:50:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg4B-00000006Ru1-0y1A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:50:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48fd2e38825so749677f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818233; x=1794423033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=iB/j23z3EGNx9nxo+1j7JzG95yH0bJt0U1k0IlvdRk8+lHprgXgsj2FTsVIOAdnCvI
         lBPGjfuimB1FLF9IkDGDItc8HkSvE6vZv2GHSmLGZpE32a3A9bv2V81VFEnQJ49pcx9H
         t2G+Xn9o7tCgxxZpJrPuAe1Qq+hA0+YxhfoJCOzTAUg6TGjjdK6gmlbQ3RQoooQFm9jr
         5oIZS8/vtA7Rt7qzOdVWALa7N/9q2LM/Vx7AbeGYnPANIeV+b1iacAcTGKyt7bYx05Vo
         Tw8Sb9nUpZYlFHq7dAtClCo4Ku6hF5/fWHj+W/RstyGMkVWSG6kyW9UrtSpBhLoRVjVz
         49ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818233; x=1794423033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=H896yU5SHiF67vmp+6FwOjVRZufy6BIy++NKZ0/hhtY5QT+3PnmBWuE86Er/3GwXDx
         RsqNHw44pjZ8uWM6J+LOfBjdys4XDRW3iyEMzy5CidKHuurjv5yj6kh2JVYwIJE/+OZ+
         aAtWreCmAx03wmVO98yYoSZXBWsmBNpOeUyN90R4UFoNvwiw0bq3+H/qcR+WQjqLsJKC
         AR9QhhCH36zIYyYQGNHVKdqkeTVOqwXzh05rWLwT4DbxMnrVsi308yKbjP29ysNK6dle
         fstsckBMKIiFLpvwgc4FTx7JAkO3jFhiuvuIZ8YxSIIeGc4ZKAZ/BIWhg0C8lAUCK9yj
         LPTg==
X-Forwarded-Encrypted: i=1; AKwUvBzCk+PjLpO5FCP/z/y7r4/fcifAN6NWn+/1dJAXLTsMfVQOd7j1pC7C5t8xA5D6RFDlL20NvZiEGD9dIb+nmGcO@lists.infradead.org
X-Gm-Message-State: APuU4Z/EalXmUgBbzsOHmUL2IzG6IoFMhVxWzE81QSiRe80Kp/4L1Eeo
	NytOll8WVd4Syg60ZhnuFlIiMW0+g/HDpsMjD9Yv1GCh5FPhylHB/3ya
X-Gm-Gg: AYBFou2oH1pe7RD0jUNsdkaUWXUoqQrI7MZ+/fujkfLV9R8GqKCTuW4Wg0+xna0qwqd
	yPxbOsQuyWoRSQoNRdfjNAX2WoqhwVLfPPGOwQbhcpEzMICOsWJgkc9yp7QtotZq2E+2N+npvty
	Ky+hA20mIyl9hgUOl+M6SRU3gCdGqSKEtxczE2uowc2f6Sh8vMzFxXwv8inNUJi20Jk47ZD9CKv
	+KnRbm77I5VIHINABiHV3z6xoPuOQxmy0Zuq9YuLKfu7XmFg3SQjn6FW8r8MSwhpXuwKeyAp304
	ZDw+VuTt6hko8DX2YqD+CP3YeM8dAaMWnOV3WbtMM3ER6HyqFH5rxI0cMwsbwym9JXqtthN0Mk7
	AVyP6TiJDiWHD6w5fnXGrfHm9a9oE4MoXlkMsmPWqyA+c+G5sPiAJTbxuziEEbw62CJOg7AHOjy
	fvtQEf7mlV7EG3OmbwRLdUkRFulSYsW5js+f/CTawwaTVhIZStkW+5y3Uzk3BolHLdHX1Yu+Lre
	sNOExurC0jLzRz+T7GHFhZnOm7BOLSmR2O2ft8cFrAygFToesaWNq6Fhs7OjdiDaGlLFq811Jll
	F8HSBSFqFPAB6bcd+ACTGC4QLV/b+uWD9VSX2xyFq7gCZclsai1stDEbuWFd7MROCNrWKx5muJ1
	t8rIrF9TuP+VWrEavGKjj/xjANy5RAw4qARgrj5NjlRIwyktknGjZ0nIRDa0LhCGt00aTP9gtZT
	eHEtszr6Mf7m/vSz+CUrV1Ns79MkhQVixyWykcEJJxoogx6ca+16ERB/sl4C48bJJJ3cEQwu2t5
	4MZpqzaQIhdohjUPy2lK0LH3ka7IcDR/a2EF1jJxTtCZaIXWgRvy+eHU/3B3/6hyI4=
X-Received: by 2002:a05:6000:15d3:b0:490:9fe2:6a3a with SMTP id ffacd0b85a97d-4909fe26b79mr2502099f8f.15.1793818233140;
        Wed, 04 Nov 2026 10:50:33 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm5399898f8f.3.2026.11.04.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:50:32 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Let the SPDIF clock set the audio PLL rate
Date: Wed,  4 Nov 2026 19:50:27 +0100
Message-ID: <20261104185027.883011-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105035_284034_EC67643C 
X-CRM114-Status: GOOD (  14.64  )
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

Unlike the I2S clocks, the SPDIF clock can't change the audio PLL rate,
so it can only divide down the rate the PLL already runs at. That covers
only one of the 44.1 kHz and 48 kHz sample rate families, and the other
one is sent at the wrong rate.

Propagate rate changes to the parent, like the I2S clocks do.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..3e8e79871eb4 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -571,7 +571,7 @@ static struct ccu_div spdif_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("spdif",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


