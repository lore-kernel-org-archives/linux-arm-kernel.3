Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEEFCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lesD8z2wx+O5N2t/cx0KspHB4Kx1rcrZq7Ll6eX71O8=; b=oyctAVeTBG4kNjnPEIoerf7rws
	NPnhEovlnTt8ZBpS7gYAoUxjEisTtDK5HgMGLrUqUG0ND8M2nku+nxqPTUsICbf9hV6lLJOZu4Jgh
	Q0X4/Rp1vYosvihm20N+jL8oFlP3ZVaDZRrHCUZSc61rIRj2e/lIY3sz0OEcAGJLTyXDHdHKH71n2
	HenuyUZ/sxwS+N7G9Z6jm26m41HRXvhdEQfUG3zhaB927h2LK9l0UcIuYxeIDqkVXt8jrzRlxcjza
	8Lu4KV8XYnH1sUjYO5l29a7M/odEjjL0fkDWCYqTNCdGip/C1zArEej4ydOUY026Rlf3eHlAWX+tC
	T9ch6I9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZhr-000000017KM-3wxO;
	Thu, 28 Aug 2025 10:18:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYq7-00000000wl3-1uAF;
	Thu, 28 Aug 2025 09:22:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-244582738b5so6539295ad.3;
        Thu, 28 Aug 2025 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756372958; x=1756977758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lesD8z2wx+O5N2t/cx0KspHB4Kx1rcrZq7Ll6eX71O8=;
        b=Bfx35idEf/LEOmIVkff4rImleIMDllgJOqF7XPJ4MJGXQ4OnfeTxARwO0BAV7t4OkH
         wEHYBUdW/L99A2MOrSKsWx+DFsHnTRwHaDHyCWW5BC5W8Gxh2JZUXOmCFbn+3SJBld+c
         9ireekqZr8lO70+TiKu4mOTa/rSFmvCh+bXourjlm7jUMYI10M57mlLuup9TtqwB0J7X
         LndAwoIfjISNV74lL4HdPba6UMOS80VnF2F7Fmv8Aq542pVmng3fwwQ+bSHPbGccU1zm
         geYilZ1vZv1QOOam4g2RHoz3Cmss6AyqJFSpq8kIrVa/4s3OjuySbhWFH3jUsvQSm8Np
         yz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756372958; x=1756977758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lesD8z2wx+O5N2t/cx0KspHB4Kx1rcrZq7Ll6eX71O8=;
        b=jnW8FG5mdFIWB0kfjAJd4E1x4AZVfMOLZXFHEyYZ6wMeN5ENduHNMSDL0IiLKXgSrR
         W8GkUPl5UvhyhMjWFEL70ruDgo0Tlmpqtbvh4nEXU6lnaS+RXrmmBYo6SgMZGT9gc5QT
         PUwfzGo58f8oCEAWjvd8m6m8m6fNS7EnlZTbu/hjeziqb4edv4dERjzTnIquyZOeNUM6
         AG64PLIlBNfMqo5aIhYXjV3Jj4Y1rnOaw+7XlWJjGYfKihfFpBWfXD3KvnaDB1CJeYg3
         RmyL0pgcFBcZjAR+Vi6fpIK/eRKxSfoMKkvqz7FE+50KnrJLqVLGwBv3ixdobR9hTssG
         VKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl17X/5GJSv1XEeh6vjg8hz6BJS/2zCsGiE29qoPFjySFKnNLZ021n5xEDGFUJv8G+bA6+BB6FkQH+B3hlkVUD@lists.infradead.org, AJvYcCWaTLSO0zH8sd/kr9HrKTlvAaAVbiWwe4zIE3SEg0QSBqJypXZR+l2sV8Ai7NOWVooJVw4tD0Csz3aEDniypYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLBowXD5yyb/1b2a1p3BbBO7RAZX1mlOEF4AQIsfO5qSdO34Ys
	FFUItmQnJVBVx/DVv+uY/LHRcLoLyYcAa/Kv0DtRYb1LJEYbEJtfxLQd
X-Gm-Gg: ASbGncuVQz2USujNguWBR2hcI2W2igzqb1w0P8QsOTG6UN5p73upKG0WI7EEQCQokfL
	9D762SR4QifoupBfm3GXTiLFxhN5SGMdRhpUvxcG3dvrRgwftKGuLsYrdWxCOpGrEVmRzsE+o2D
	KUV6qrC8zzFuYRFhCvZSP6P73+FkM54aBpVFAOuq1JA7L6kr9iwxtQt62/Hd0Cav2/zIO5YnL71
	rlp3alNWE967hZeUI94vj/JJx01onEilHl+vsKRQ9joHBkzzTn0kxoA/yMiqbPk5903oBqJk42a
	zXiodeUoqCd1TxzNV3jU432pmZEfKzG8ZCj16p6fleNMrmAyn5nTgNDOUKrnotYT+Us5rVHhYU/
	kATmfGpI/vqcsmwI9mnpe+mb5YW5lP8Evo16P0O2WQ3wU+4YgC+60JJoK0voHuyds5kyGobVN9+
	d0Ev3RDd0W3wg=
X-Google-Smtp-Source: AGHT+IHOlatVraMZlLSeU9m3dgM6j9SgQZIUB1pAgZjmoAUeuMyaQSxAzVBiLcT3hSudMG1208JTHA==
X-Received: by 2002:a17:903:2287:b0:246:f14b:31d1 with SMTP id d9443c01a7336-246f14b3365mr158181605ad.32.1756372958246;
        Thu, 28 Aug 2025 02:22:38 -0700 (PDT)
Received: from localhost.localdomain ([112.97.57.188])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-246688801casm144390505ad.126.2025.08.28.02.22.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 28 Aug 2025 02:22:37 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: linmq006@gmail.com
Subject: [PATCH] net: ethernet: ti: Prevent divide-by-zero in cpts_calc_mult_shift()
Date: Thu, 28 Aug 2025 17:22:23 +0800
Message-Id: <20250828092224.46761-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022239_507687_BFCAC710 
X-CRM114-Status: GOOD (  10.97  )
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

cpts_calc_mult_shift() has a potential divide-by-zero in this line:

        do_div(maxsec, freq);

due to the fact that clk_get_rate() can return zero in certain error
conditions.
Add an explicit check to fix this.

Fixes: 88f0f0b0bebf ("net: ethernet: ti: cpts: calc mult and shift from refclk freq")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
This follows the same pattern as the fix in commit 7ca59947b5fc
("pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()").
---
 drivers/net/ethernet/ti/cpts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpts.c b/drivers/net/ethernet/ti/cpts.c
index 2ba4c8795d60..e4e3409e7648 100644
--- a/drivers/net/ethernet/ti/cpts.c
+++ b/drivers/net/ethernet/ti/cpts.c
@@ -607,6 +607,8 @@ static void cpts_calc_mult_shift(struct cpts *cpts)
 	u32 freq;
 
 	freq = clk_get_rate(cpts->refclk);
+	if (!freq)
+		return;
 
 	/* Calc the maximum number of seconds which we can run before
 	 * wrapping around.
-- 
2.39.5 (Apple Git-154)


