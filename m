Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E005C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 01:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaG1ejkjjP44pGEgXrg6pmu19/GDuXtS2tYJ56ktCw0=; b=NDFGbU0ZbNy3GFb26+FLlJvDbJ
	xT+zrnv/DncNqIzGXU12vdgiPqOO8v7OnEkbkHWOEdBmrmfIdnIf5wOKxv9dLyGucitjQIDzGAm96
	SYTfAepscZy4KQe4JrVDlVNSPPVUUUZde5q6l13225tn0eEdAEI9NFu5X/makztNq07uj0NaGjuJg
	K6SqL2StCPMhS5zVhvTImrnvU6BM6k8rlfM/ZenbIIJ9aic9X695Yfq+FUYfF38I0tdtdX2n7cSrz
	V0nJ7OgFZb5LSn5ruzy9TY/+duanGX0uTQ9zXwK+wUyEh/KP8+2iBQ98YmdcX6PKnfHXyYMczvtcE
	2cQsBY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjTAP-0000000109P-0jJm;
	Sun, 16 Feb 2025 01:09:53 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjT8w-0000000102p-1OYq;
	Sun, 16 Feb 2025 01:08:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fbfe16cbf5so716116a91.0;
        Sat, 15 Feb 2025 17:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739668101; x=1740272901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaG1ejkjjP44pGEgXrg6pmu19/GDuXtS2tYJ56ktCw0=;
        b=fj+E0mLUKjBlTwwKRjxxilwL22seerrsntDiDbJ+7+hpHDqPT7lbVkyl60goU4QMpY
         ARwJTowct6Y3NWjG6GE9pKGgr1xqgr8ZDHXEokp8I4dNkTg+JQanoaGBKMlPNMNGCHaF
         zY+82GSif2rshU9TIXw/NmOdtdjH1fGTpyEbLSwAznxlF6YcPnS/tMhgmPMOYNtNksiB
         AaRs2IHA8NV5sEZfVOb1fWdPITEJOobJIczMVh/XFQtUOi777YH0BjDaaktbHICH2GBX
         BNA83PGw1H1K0A3tFmEAwxH61yDS21/ssg7ob/CKpLKTknpm3gPLy2GaXlVD6vK0wowd
         a3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739668101; x=1740272901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaG1ejkjjP44pGEgXrg6pmu19/GDuXtS2tYJ56ktCw0=;
        b=sJupa7yh/keVc7GHor+kUCvGjDE8nVAmVIi2EQE4dodaBxBJlTW7/34fDVZS9ggNow
         jvNfzfQ1qviQK5MLQpj+iq2ZiA/99aDje0+w6CJSLEFVLCOLwQo8KUEZi4wKekSiantq
         WnFdO2jQld1PCx+7j4JvUwa9SQ9fRsnBhNyXoFHniRSnmx9s47c0B0rCJN1bLUWn9D0O
         bHIahBAMUVOH9+1DZJbaPhE6P/ExobPRB8bfQMIUzOO9kW8fS7vZSZ+P8Lwg/hZpt+4d
         PI+9pUTYG4vfpRgsPcTe5gw82g4U0rplygSMbGFqqEJGAOb/09y6++SVuI6RvtL4p0TV
         /8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZtxqSAfuP+c/ImW5iZiSBYJ7n8+kYqcJus15l7GcnZXK/FU9loxxkn4uIPniNxr4g2GKcxzfvsEpSCJDxT8=@lists.infradead.org, AJvYcCWDysS06a4Z9B81plLMuKgUI9HLPrKLbYiWmSxDqemG3KmVsiYByc2FOdY8rUsFAf33cUPc1Ytu/FGRxnVvvGYw@lists.infradead.org
X-Gm-Message-State: AOJu0YwXlWoDgkOHtWPDSl3jP+jyR+ntfoPp/wCQ3nlZxhqqkD4vuxY3
	UP9I0s42O3rYzSqXwl4pgqOaKaYuNlapm8qZLU4b29yUYjLsR4mf
X-Gm-Gg: ASbGncvof4QDVdzql51sF83HJNeDXML6WuNZXVeg/bIwvHi3A0ZRT7znWl4JJOswfgR
	OEruNJPvuvTi3rv5TGpae8ExxPb/6RntMFWyiKpcePfNnbueOmQDRAnfgXPOCjBJJBF5DNNh9S3
	w6HNugzaxCdz0nlgo5U5/npveoroLM5WJHQ4BkFBgTHsIQlh5pFMB0SMcGwVNGdralzieA0xzop
	XcGvpEL8BQuoKKBTeuA+uzDspugcxYfcWmk8iP04STxr+ZJDH74EJCRAPjgqt12hj/78wcGSNNg
	fI1wdRhRQmrymlbAJzC+
X-Google-Smtp-Source: AGHT+IH/+mxdcBT6whVFWrHxgZ6a5u1nwOwVnd7fAtlQA3wZRira0RXbOVdfvGoGi405l24/1SuaIw==
X-Received: by 2002:a17:903:2f88:b0:21b:b115:1dd9 with SMTP id d9443c01a7336-22103f0b0b3mr28232985ad.5.1739668101056;
        Sat, 15 Feb 2025 17:08:21 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536455esm49672045ad.74.2025.02.15.17.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 17:08:20 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: sebastian.reichel@collabora.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	piotr.oniszczuk@gmail.com,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Date: Sun, 16 Feb 2025 09:08:14 +0800
Message-ID: <20250216010814.375313-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ltuyyul4vqyavsqvaue25tdbtjzpwkmq2smtsedidgyomu7d4w@rxsxbdgzheba>
References: <ltuyyul4vqyavsqvaue25tdbtjzpwkmq2smtsedidgyomu7d4w@rxsxbdgzheba>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_170822_483780_4BB3E9DF 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi,

Sat, 15 Feb 2025 23:22:27 +0100, Sebastian Reichel wrote:
>&hdptxphy_hdmi0? That looks like a downstream thing and also for the
>wrong port?

You are right. I was refering to the patch of rock5b from mailing list[1],
in which there is "&hdptxphy_hdmi0" so I assumed this port is merged
upstream.

Although ROCK 5 ITX only uses hdmi1, vop need &hdptxphy0 for pll clk, so
this node is necessary if we don't change the vop clocks at board level
devicetree.

I just notice that there is a new patch series[2] to let phy of hdmi1
provide clk. I have to add both hdptxphy0 and hdptxphy1 based on this
series, or I can only add hdptxphy1 and change the vop clk like:

&vop {
	clocks = <&cru ACLK_VOP>,
		 <&cru HCLK_VOP>,
		 <&cru DCLK_VOP0>,
		 <&cru DCLK_VOP1>,
		 <&cru DCLK_VOP2>,
		 <&cru DCLK_VOP3>,
		 <&cru PCLK_VOP_ROOT>,
		 <&hdptxphy1>;
	clock-names = "aclk",
		      "hclk",
		      "dclk_vp0",
		      "dclk_vp1",
		      "dclk_vp2",
		      "dclk_vp3",
		      "pclk_vop",
		      "pll_hdmiphy1";
};

[1] https://lore.kernel.org/all/20241211-rk3588-hdmi1-v2-4-02cdca22ff68@collabora.com/
[2] https://lore.kernel.org/all/20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com/

Best regards,
Jianfeng

