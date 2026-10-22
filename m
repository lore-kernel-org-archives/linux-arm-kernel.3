Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=in6dOyPY;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IEsGBBWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=; b=in6dOyPY8fEhGG
	Ep0ytLJqITheVdnAXxcaVoBRmnWM7s+B+ZeYfVbRbePAIfIImu8ZUwNh1JVQHXIL3wcMrI6XNcvle
	JtASbA0ryUkVIXSO1yUSkQUdEwhaSb7nQq8J9cM0P4thlnt8t3P53Kc6lUyLz8LphNLi10PCEHheY
	b3eE+zedfm4BKqZFWSANqOEiLsMo4VeCjMqmjpkwqRNOyy0w4QMSTdwNjk5LGwLXUYzL8RAWdGwPf
	kVbMV4Sj5J5Vxi4ddHWhOSmmVSZ04879zFfa4I7OsHQ3JIXS/wvgDS6ZsAxVkq/9AD0LJLAnhm2Ak
	MG6xEsYzKiVWz7AWG6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9k-0000000EuPB-2QKR;
	Thu, 22 Oct 2026 20:12:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9d-0000000EuKS-1obp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1874065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699967; x=1793304767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=IEsGBBWobD2vl81B2XeJ59yUS5y5pS2Ww9n+QFOhYXy/zRdFTJy0tBWJkU3yRx3qz8
         FfJ6WmOF131MFbQ6A5cj5t9//G7ZmIML4l6iIl8UTRAtnPItunszc3EY+BEKJnC94mg4
         ooZaqFSJ3/DwangrAJxLGq0hUEDRKU26FSp3cjrq0xgeTd+NBXqUwSjtrsFe89x4476g
         nfID+vN6pRem/rxrWE3X08PmGYc4Y7zbRoIytW+Me+RgClfxkvHCrWxnuzxXHZThxQ84
         Ah1wG4ifznxmZhAAQvtQT8BpU1Zm/Kaz4pDHnGSLk6lsLXeSu5kxaRkh0DY9HmDkQ4AT
         Dfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699967; x=1793304767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=E3C7uuT3Y3s0Bd0x+qP9n2BMdXXWv72WLz1Wm5aBE3J2CvLM+087g/aGDd+tB11qA5
         PznG2OQE7QNj9EECZkUDhWx8xGPxP2CFrKK0jlZy7O3Tz+9An8LHZzLoCj8y3gmWezGV
         N1R4exvPYhOClIbrTp5cr3mZjrj8N3FBKV6Ljr2ZA5FH2ozU8JVWetPHJSpqnVdM+ob7
         50xLpl9yiwk0+09zMNzMOzN1E1SPkF9WdNpH2PbY57IyeYIpNMrBQPemwcC9nDs1+inS
         ksmjQvH/nMDjMGgqBQ8vzNq9Bi4vAAwkm1PLarK3oGO3G1u8mB0NOqQM9ggsglO+/2DH
         WCrg==
X-Forwarded-Encrypted: i=1; AKwUvBw22w/QXmj51V72TDGA1UQD+AJHRhATXeWJ23wKfZ62Oszgo4ol8RymfBtKbZlFh9L7z8ROcv+zgvSeXNjNusAJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKmnkJs4dsvnbrkNlAIJdqJYHyKLztc5fmWJuFSLJqMlA+xXTB3
	q4PTbkYRnNpwdIvvDq4CSt1rDqiXAa2DNxoipZsMF9sv1xuHe3sW4GqtuEdErbdiSnY=
X-Gm-Gg: AYBFou05Ugj0URJsIJC+iIbju8D208xDqwZvNWvu8WBMwqCm+KY7WDd3FOxIyEFbdnl
	rASnRuhwhFbkyE7kHA8tUVkZHg13CnLwsqFIDseAeFpaZu6E1FVlQwDp5EWcdEUcwBgWElDK90l
	byIJhc3SkCvooIZ0G8Ofe9cUDFy293592nrY/P3cPd1p4J7TywEVAKmqo6AZVs+4wrqjPwv5VMd
	bSNZEVKd0IPpAw7jwfNETz+r7ipfl7FHiUV3oa4CFKZMFEliBnVLi+DAcGc8dWKovVzwsWRWVGQ
	zj1i/oDLkMGJlVXDIphzLf0eiSO2G/6GlaoVJ5dPrz+9miURew81zGJSxKlRsb9Uu1+tzBSjSst
	3w5lB7sJWSaf4f/qdQxNvV3jgqVOTLJJiYKpI7L71xZhsdBdmITsN/cjQ0uhW63SjQnKM/jT2TT
	wIt54cNPRxzg16TuN/TLR16I2xGL+yHnffoY+vRzTSiKLiYcWgWyF3z6uNI6mXcGpO05Y16huE4
	8hpqy4jKRfdkPSRFMcs3eicHXjd3W78dO28P66MiSFZz5r6+P2+dYPiYXtWQBzoGO8f7+8gkqEE
	HHbGsi9sjSyVwpKoouY7hY5HqwM0xkIq2aWQ8gYxqgCOshn93SWPzVYUTKWoXeM=
X-Received: by 2002:a05:6000:230e:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e2649fb43mr12340934f8f.40.1792699967520;
        Thu, 22 Oct 2026 13:12:47 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:32 +0200
Subject: [PATCH 1/3] clk: meson: gxbb: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-1-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
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
X-CRM114-CacheID: sfid-20261022_131249_615817_7F0B9359 
X-CRM114-Status: GOOD (  11.32  )
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


