Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2D8C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcOf/+mAe7HjVKdjr7yO9VSKEbj6DVv1uV/KGTc/++g=; b=eUeL9tuvQIXu4nY9gggpyVi4H1
	ZRMpM7B+TS9oEWrvgvbzR1rUWoF+rcivThCStS9yV7JEMPR6xuT0tIV3lbOpzw0YBw+y9nLC6Pkg3
	OgSItXod3iPVJt/PE/PKftJ5GK8icQz1KgETh5cchJFYlMmZ1Ex1E8CbHhFIZ8tBBePbNae6Je1f8
	FBseZZtL19qsLO/5UHu60T6NkaNiFXiBQZDrgbTHS7Ms80PGiNgFCHxSfZTK/lc4ihWVNvPKeFx7M
	4AWHnv+5FrGbUBK67yhWQlXw2a9nXlfBa1n7MJoOClsBQDnHH8ySRARWgnv44XHauUTDCH6T6gfqn
	Ill5zv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMit-000000089Bj-3SWg;
	Tue, 18 Feb 2025 12:29:11 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMYh-000000087LY-2G7J;
	Tue, 18 Feb 2025 12:18:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fc8482c62dso392886a91.3;
        Tue, 18 Feb 2025 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739881119; x=1740485919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcOf/+mAe7HjVKdjr7yO9VSKEbj6DVv1uV/KGTc/++g=;
        b=kvootxZ214JhbdRwCeq6w1pAB1ECyQBDD6kJgosuSsDettGWueZJGl+F1WbMrvV0cR
         zGrDmeq6fJ3P4t2CBmjo539p0yR1bCGdJIk21heJevYGGhLfL7wpJbKcvQK4Fb9T7fVa
         YPUHwMXqVrBJy3eWtuUYuI1iHjKaGfiyO0ZHDk/51uqk7r7cGNZ3KXfDPgxNQn1YPXPQ
         PpWdDGk1N/dnM70OdcoMff5u+xMdR7Z8DHxf6v72fsqvNP6XgTdeaQdvJQyGHH0I+8rH
         dW0+NnjpMp2QuZv660lVLNnG8clYVzCso4Zwig0wO5wz0bvi6hZvqL+Uu/eaqKt+SMlG
         eKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739881119; x=1740485919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcOf/+mAe7HjVKdjr7yO9VSKEbj6DVv1uV/KGTc/++g=;
        b=AaWsSdjIGCzOR7BP/DLD6415VUNDHGYkL8bBVdK+yyzDvKVQ4WAGn50OvPYnE+xP2t
         cl5VqnhH0L5iSJP3PKLrlFAFC4vdsNDBDYIIGeUI3QnaYnhY5UcwaXfMeMZR5WpPax+P
         XsscIoOrlTzI3BhV99BSZ5MlQPMTpa0TvLXfZ90nG3TKeuhsevNUnbCxEzYNpZAQxRMt
         Sj4fzq5l7ulOqZ5Ny3H9oJ7wmwSuRDJYoOZlKy6pThlWLOULVtn1H5sRecorQ7wUoAwS
         6x35gETN/Zu72bDRmR2qvnMu5H0kTLqGJ6L1xc9adtviiQZWZwd30/CpzFrEZ84jX2Ya
         Xy/A==
X-Forwarded-Encrypted: i=1; AJvYcCUGKuxUlcwHnwL1EkueZkUx0xrlUf0fdH+56Y9o2TlgLq/AcODC3VFKU9fJ5C6mVTlFLxY48WfyFZo79o1gX/k=@lists.infradead.org, AJvYcCVB3bCkE1Ul/eIN8CxCB5F8Qg0kNNpgSG6tMQGSxQfYao8GckrDW+f+jYSVBCJ5JE+HvlusJ7Jsc6NjW+RgHdXe@lists.infradead.org
X-Gm-Message-State: AOJu0Yztv56wMfiruqzRltRjPQA6p6k8upkCOXafKjm8FxuL9TPoU+HU
	hMaoTJQd+cnXAaodWmf8aSZC1vB3jMP6dGal5WCLtF8f2zyVV65o
X-Gm-Gg: ASbGncuPXe24qcTZBpPoqYlP7z3F9hm5SnioEJOprbq+lo8InTXubVncTpetrpdyfnu
	66/ijsncGaeACmaoBjVXPlBDjGUwukFKrgu6Kpl4c5az1zwrsthumZqr0G6ouysT8aw5/i2AROx
	o2Gr0Bosm47utRt6GdpMx9v0gyHe4z84JSAlUmn7nIhd9qemJr1p60loU7z9WQ08ceacM/a1xMN
	LS+r3y+XvF6vdLn0YQIP5gIvZ3UadylqDOkR/M4Qi+DqTHvaXfvI6fW17FIeR1t9ecMTZkyS0CZ
	Pj5pJxUmyl4eOM+KJziZ
X-Google-Smtp-Source: AGHT+IHPsPfeZPNuDFA8wzs+mlVOqsQ83YHZnd3qlJa4+vQqXKKzygw1wD0+aOsxjfqbOZCURGWEyg==
X-Received: by 2002:a17:90b:2250:b0:2fc:1370:9c2f with SMTP id 98e67ed59e1d1-2fc4103cd0dmr8326098a91.4.1739881118858;
        Tue, 18 Feb 2025 04:18:38 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ac19aesm9896535a91.17.2025.02.18.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:18:38 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: heiko@sntech.de
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	hjc@rock-chips.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
Date: Tue, 18 Feb 2025 20:17:46 +0800
Message-ID: <20250218121749.1382322-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1919367.CQOukoFCf9@diego>
References: <1919367.CQOukoFCf9@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_041839_574088_BF0A1C17 
X-CRM114-Status: GOOD (  13.69  )
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

Hi Heiko,

On Tue, 18 Feb 2025 11:00:57 +0100, Heiko Stübnerwrote:
>So I guess step1, check what error is actually returned.

I have checked that the return value is -517:

rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy1 with -517

>Step2 check if clk_get_optional need to be adapted or alternatively
>catch the error in the vop2 and set the clock to NULL ourself in that case.

I tried the following patch to set the clock to NULL when clk_get_optional
failed with value -517, and hdmi0 is working now. There are also some
boards like rock 5 itx which only use hdmi1, I think we should also add
this logic to vop2->pll_hdmiphy0.

@@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(vop2->pll_hdmiphy0);
 	}
 
+	vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
+	if (IS_ERR(vop2->pll_hdmiphy1)) {
+		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->pll_hdmiphy1);
+		if (vop2->pll_hdmiphy1 == -EPROBE_DEFER)
+			vop2->pll_hdmiphy1 = NULL;
+		else
+			return PTR_ERR(vop2->pll_hdmiphy1);
+	}
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0) {
 		drm_err(vop2->drm, "cannot find irq for vop2\n");

Best regards,
Jianfeng

