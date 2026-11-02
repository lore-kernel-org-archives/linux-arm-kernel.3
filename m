Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8C609D829
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ve6WCE7g;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jKPf3Exi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=; b=Ve6WCE7gESLzFW
	zlsA0qSksCueiuW0ZNAY2XTkGlXiEOpBxUq9bRsF+X6kkYY0knkjLQIjgD0asw3P443V9PT4aNy5I
	aN2BscjWErF8TLhca6z0fHY0h6yGzsAZptB2Hyj4iVNDEOLMUmraTKLYSV8kFgnFIGQtnZmr5bSia
	dBoNiRyLJ+5d1lQrFawd9oiPm2AI6lPZb5+XoCCausXvNwuua4ars+fPJtZZkiB+4ccmLDfAM/oQ4
	MgpDAhHXCYS4e+e3s5+Ez/qWtZnM/uNMJr2nGibdA5Xqgw4I7pRz+MO/WsXUEWkjkarV4p7xNyzkc
	vPvuWf7RYYG6niUe9gcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNty5-0000000H6Lz-3RKQ;
	Mon, 02 Nov 2026 15:29:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNty0-0000000H6J6-43vo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:29:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so19258185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793633339; x=1794238139; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=jKPf3ExigBBb/F5bcZV1g+xbBuzXset8pgPVcBXkdaggDzvE1Wj5jyruqDPNUwD7x9
         SklfBlKpTWtg6t51R9tEq84w/y4LtpRja0xtU0IzcZ2n4UP4MufxQF/uzf3o+oeLDUzi
         oJCwoH1Oskfj0rmkpDnJ+n3lj7I1WS5qi2UYyXVZeGVKY7Ob5hCE2hQFWh3dG3JRh3NP
         8iZj3wWwAA7dAMkA24LjC7lQ1hh00W0zW15SezVVwqN7FRVI5XxfO/FG4HJK857vr+QN
         ahxKq+6PfzZgPKGZLKcZDWDavcS4eC9l3F7knuuWupq+eHPizjleni3gYdThEI1WL3/a
         c7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633339; x=1794238139;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=bAJULNBq9yzsAK5FCLGTF0xYBDjatrQnb0dtoJ8e3I8N9ykMNdLAcwqQ/yjZTLVFeh
         dg2Cq6v9chcSxU+iiTKMTxjU/3NhiC1BXy/9eOJfpjERayb4ZouyjLncdTjgUSXqJInr
         UNbsoX5ie956zlbuHgKsTFZhq2wrxMON+aS5R/obBuLx1cw7pjGJjlHPtt6RICt9uXMj
         j1xc//aCOd14/S4yHxWSD/stVuD+DehocFnCPUSpF7+b5TxI8kYDgpBZYUy/gNLcGTTl
         gBsgAtCNXG5C9Ss4miZx5Vu9ibo089B3q+aPv9CnGjbFShSLIGwI6ufvo9pRZoGM88xH
         vI+g==
X-Forwarded-Encrypted: i=1; AKwUvBxoTV25OWssLmO337sAGwwlaHD8xuqjZe+ZVY381DV1WRM0IBdhybA/YXHFQja8VQE3NptFajopZcsBt7aFg9Dc@lists.infradead.org
X-Gm-Message-State: AFq9FYLx/oKC7+vUiHjXeC5E93YvySTWazQ3HunuI6Ke2VBnhMAu+yon
	GCaONWvKhWf2Y06GfTSPre0moAzTgxoHY/xUzgH4nmtSpguJqglOpBU0XLIfTAlSMlPdbpmQqQm
	r4DUMeIo=
X-Gm-Gg: AYBFou0uAz4J3WXXRScPFDsukTLRxptXHXoQFNypryMwZAObFjkteUpHeuoi8mIybZH
	LUhK1i8HEfh6KKFOzGph/SnKxecuBiVNQJLVEbq1oUCz/FcxJHQx9zkolitYqgHd1iqz5J77npD
	BzNdz48mloLyIda2HH6tmxvsUarfcDcA2RW1LF+mBMf1W7tyOcEG5t+XGjyPGtzo5FyOMIy0/JC
	Z3DPPII3QYnwkD/1zenm+YCevrJ2Z6vGr4DzhzjST+rOkJL6k9UMYC1OcagmJRo9wo1GxIhhwn9
	lQS8DnfeVRLWu3zhr9p11FxS/vKWGchlm5Lb9izHYTCblad39kryuHeIwq23fiWO12a+VXAzV0Z
	pa2hpriyIwgO+2WRjiAgKDUrvcgBn9ZLqSfvF9uy/ZiPrB7ViSWHSY43XZebO/FfVidzrtVjuUR
	BJ346xz5Csh7MhxkWbl4bW4zLMCWMDNZSCLpS+AxoqAFlk3eXDvBFfqHCZeYkWdTqO9dmhzsXhx
	yHb2RZ4trx6RSj13MN1Z+TI1EAmz2E30iPEq6hy5XICh0P0PlvTDkZsZetH1CvutyM1nFVOZeoT
	M3DDEx8L1Ayxt6Tgxsuxi35O2fOOElHMmf4DwzSoKl2e6ysj
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr225316555e9.32.1793633338944;
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm21907349f8f.34.2026.11.02.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
Subject: Re: [PATCH v2 0/3] clk: meson: g12a: fix a few clock definition
 errors
Message-Id: <179363333450.2870673.5521256341441057002.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:28:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=475; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UHmtYAda0lGZObY89vb/eGPORt1iA91FW+pe6vRHRPY=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrorDmjByjJBe5tD6E7zTW8n2IfF2kAowjccC0RauvXZtFJ9
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrorDkACgkQrRk/eyua5RdrYgD+LgqT
 qJyhqFLLMsiGPmZJS71z+tbVLAhGGnJjxQ01/0MBANcj2HeO4569Ea1fKVqMVdwkzp6fy5qRmfB
 qRRwtdUYI
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_072901_022686_46D4F61D 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      https://git.kernel.org/clk/linux/c/9458f994b92f
[2/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      https://git.kernel.org/clk/linux/c/c56b8550e390
[3/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1
      https://git.kernel.org/clk/linux/c/5ca65bc758dd

Best regards,
--
Jerome


