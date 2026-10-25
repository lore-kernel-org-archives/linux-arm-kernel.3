Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6176E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXEKTIht;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dv3D1aZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=; b=LXEKTIhtXvCCvf1pzd1QGAr9cS
	Z8qjPw0HBtxQGKO/4UsnRLEUsysQsNct9WizB4w3JvnVirFkmyPDGDkwJCefMiIxiZ4rx/zp1ma9s
	TjqRAdxTaVkeO3w/XEDV8X9np1ffvUaYhNeqq6mfdvJ0RTzJAUhbso8VQwBKbZodOto5ABFnaihoL
	A1AeiJxhf2jJc33s6OkJkWxhbK2w3MP5fih6UhK6mhi8q4CCFbF/eecheuYkHiDgH8fPgOUwS75WN
	1DNPq63OcYIav8MFpHuxSAEF8yh3KFtOgOq2feDlKXXbO4maBWCCvrTC47q2KAl+tyjOo/FvyO6Iy
	bGQ2sj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz96-0000000170H-1zqT;
	Sun, 25 Oct 2026 14:24:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz94-000000016zt-1enE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 14:24:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14798145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938260; x=1793543060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=Dv3D1aZUkG8XfA6TtSYz9EEZyTUkHx8cZ0ctFC+a0XfA+0F+RWVwqdlUOcT4J5+2VW
         w76jQPw8DhRQf568Ymmgd8SsxUhTSAAVowyqaFWvXrw+OY6tmXhsCDZISDpbkm9nsl8P
         6xGR6V0+P/SWv8V8wHS5uGHMgYwazUPOfD9XYYLEhLRTZg/8H9IY5ypcdM1pANwzW3wa
         WiKpWVPNPQ4Xr38LSwZkz9eLuDQYigeOIVexDd5keEyED0Ze2Hs5eWLBImPfyXdkE486
         wdYLRcFSjwRPkPKydw63sKpI3SkegAcrtPahGfJSYWNtTU7ePGxOhmmWdQvkcj1vtkHE
         J0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938260; x=1793543060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=LwOKpid/QvfdUimBwxh6AaWGU7UnRdL0o9Z6w6nCsSbmQAKhvMfRgcGPWSilSrbNgY
         ycNrb20OxtdzK19Y3WgGVK8KZvayEGAEAjYLho6RkMm+eRuxxopcsVK2LYrVj5w41bsy
         K456o1tOhOfgbILr+DEQ6dYV6vyWoyJLsdaAc/Gc4n/QGBL+F/DLGcPFDbBBY3yc//lq
         4jXOzUnZKAIwlWOz1Y3QeqGgnJ4L1biwj9mta1rRDcPeQAI+e4TdtEW7xFCu72XFNH35
         t2TXe5KHqYRsJIyLaD2qYXqL+W3wq8oPy552/zCk7GA4zgHWdyLhbBYq32ZYSnAxD0D7
         v+VQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/NDOtYCrpdfz94NUuwl/BaM1WltHla6ec95LQSj1JAN+9RARzJDs63XceIy+BfILjBp7pAB0+eJZoBlatkAdd@lists.infradead.org
X-Gm-Message-State: AFq9FYLKIMRJ09M7sASjmX9jKonjP3fsj5dTJ/Umbdrq1WFMyZyb2/FE
	0H/5mDwnUUq6o2p9vFqz5v/+DldhsByKu3WsX8xAIOryInEipuXOeWmm8me0NP3A5Rky8Q==
X-Gm-Gg: AYBFou2pmp7ohZGFApLTuoHPUnBlYLEjW74/0s1fsUF3TAN6S2eiEm1gxKb1/WuF7d1
	hgjTXExO/NXCuaIlaDKhvdMt4tDFpQnWFhwKDS74/qYuABz7WrUen5b7xCLPrU1qYeO9onmVozI
	gzUdKDV0ZiyRN0coAJsZH4od4yDs/v9JuCKULU72NVJHyN54x+P2IyviqJ/xDpi2gL0vh3Z6yKo
	4hhlAserfJtHvMp0lytZw2xWfRYhXFTU1QzUSdh1ZuQWWsnHvCvN+i8+D3w380zZhG5cUl9vvE9
	QD2ztW4piODNotIsh9lgitCMXUdUlJtVraoWAjKuP7D40us136fecQ2l6B/fqoSPzdlGegX33l+
	mloyuYjDUeT7xFim6UeYoKzQzcd+V3CDFCfWqJly1l+ypk0mxGsEDIjDmVn/6bKWMT8nI31/vBy
	4Gxk1359EetE0hmR34pOheo64MpYzjEHZz6N4WWQLf6F9JowYJPz5J3nANL9WsXgmzb5YmN0pUJ
	l29R6AmeotbyyJtEX+yoHhqy/0HWJK1ze/bKd7nt9RS4vooJ9kHhqyUzaeNOdas8FryPceeGNbp
	hTba4C1Hz8y1Vg==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:148b:c890 with SMTP id 5b1f17b1804b1-4a35ac45770mr72563585e9.1.1792938260396;
        Sun, 25 Oct 2026 07:24:20 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:19 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:09 +0000
Message-ID: <20261025142412.112216-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_072422_453646_D32094E7 
X-CRM114-Status: GOOD (  10.67  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0


