Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA15606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0gmS5+N8;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B1k/VJ9H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=; b=0gmS5+N8BSdFH4
	2Pincflo/5VjXmkGpdpRbbAmxq/wviz6UAz+5d7WdKpphlP9xp/jP01cS1mNiOpEZb6d2lYNqA1ZQ
	eRXaldEVFVmGOUuKJm3PYu9x/E+830AwzUJGvFOLpfbeABidunqg3jpEKxxusz+n7d3WG1A7nGGCm
	lnKFW1qfsFkiYk47cVVAlmCV+FPbzmLELtUObhl4D6EDJOUCsaF+INzWhmJ5OkbSTevNfYignb/QB
	5lhmH/MqPAKdYQzuDirf6lAPWKCKXog7oLjS98OkZJGWzvRHbFxz+MfWTAZfL27oL0vLaYzpWr+Tz
	1lO40srZc9NbPfBF3NQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0l-0000000A7pP-0g4X;
	Thu, 29 Oct 2026 18:38:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0c-0000000A7jZ-1CzO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so29858415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299072; x=1793903872; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=B1k/VJ9H5N5QQzeIkBKyuV61DAvpXsdXfpiaRTPZxiBt4QC1oqOumM7CupVDHBjHiM
         78OHhHk9/vniQ53lxbD5M9btKGbh0DikU7qHgu8qmQu7hgq6RC+S88GmsK2PJQfAefW8
         8oVuieoJ/6pQ5Adq/Ah3ca/SgFBEuhP991zjGEeu9A6Fy6IE7DEiFfBUpb6z8Hmi/sa2
         wF2W3mxn0Xtz8oeMfCHJsCiQ2ag3HnHYuej/NN2gBPINIOGWKeiiTW+BhMwlF8LtdjGW
         cMF4FTQrMaNMwPFOiF9XJtAv7v+ecnP//1rLtZu9F32nF0yxvNMKGYBFPqXITnPK+Lsb
         XbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299072; x=1793903872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=VHt/E60Wue+jHJXx8i9qwkP1SBXCzwIFEjbT4L1WvJhee+XQGBgCx8Bro5+FBppgkR
         hZsFey8O+3tqxt2rFbtsPKWzyARN9DF3EBuGICBlc9TvfcqWhw99GDijBeVIdBQN77+q
         X09se+LfQbWLhsmBH9d0ihDuUJnmmW+ghM4Vz9Fc9OGSCjUi/CQS8BBClTfIYtOJgKlK
         pDZ8ZSTXefiWet2XG9KMtu5gtq7L+ConTjBGwpL+hLmCV+la1dgXCIZlksdaPxCUi6eM
         fiH62ujg7+NdarW6gRNJu67M1zYe4wYQm/oQlWU/O8k9PjfLDIP25IJ1xlU3/QwdtNRl
         1k0g==
X-Forwarded-Encrypted: i=1; AKwUvBw7CpvQhqHIjFL9IXUi+egcoZZgwsFg5xX2XnbiDeKufs1Wt2518GXwxzzW6G8m9Z+YX5/W4zTDO4An6D1qQEo4@lists.infradead.org
X-Gm-Message-State: AFq9FYKtZcsT7k9O3YfkBlpnnCmWckm787euVOQcpds4ZiFXni/cjE9N
	ytLZQl8KtMitza7n13RcT81MaApzqAzxfDcay29OnGXOrhq36p6P64TCgTrrgi65ZeA=
X-Gm-Gg: AYBFou2SdGjaRcsDSQeb5vSpKpNtVs3ozf3aC14rLtVkEuQi2tslUoR3w6gvRRvxP3K
	ToPMOqMmO1I2rILtNWjl06NGkCYBZ/bf9Tp5Kkj3yQlxq6TXWgOIP7URzmTsKVkaUjtGbLQtiSX
	ez44iVDLvsMp+ES2mnILYrASzwqO2+bLCIEvSyf6icR86elCKmgH6sBLfyMzMTWoTTdXftJNqTF
	pPilGViz6myRsloG/1Y08WVBfva1n1DLMqC2ZzhxM4OXGZhE0wFoconVog9YTQlkzyQX9IE/5BJ
	15MJSzklAIg2NPjObg5pUltm3Kz2iSlpFDwEGxhBSvQeKj3Xe/uMqh2NZOH413Vl1n5A9xYeYNN
	RIHabAPWO7iSpr3DXU+H3pNXARzr8KEY5IcIogepV73cZOtySVhIhdxUU3nMAQWk6eG1cmHfwK3
	Kp3zv1Q2Thw4mPulftkDnD0645j/iVOWe5RxFc6Ri/WsnWEM3OV+rk2ED0icFat9v0zs/OBXsga
	+fgriyWLGUXlhTtJopYYwBFMWC5DYNnVoP6SldscBsD6Rqo6k8/8Ys5DFVB5V/yARadcsrJo6Jv
	Cr6Ri1aVeXikknmLkMS91FkDlOgmX85c9Fq8gxj1vXXMGNC/OX+FOr7GPuXBvZY0rppzwUPQGs1
	MJcKOQcU+UWhIadP2+g==
X-Received: by 2002:a05:600c:4705:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a966587157mr144058185e9.16.1793299072008;
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:34 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-1-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113754_341924_DCD8F97A 
X-CRM114-Status: GOOD (  11.16  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905X datasheet revision 0.2, page 70.

Fixes: a8080f247bcd ("clk: meson-gxbb: Add video clocks")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..b483164955b9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2370,7 +2370,7 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


