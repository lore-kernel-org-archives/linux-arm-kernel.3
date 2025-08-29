Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99760CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=; b=Uh/zgo9ijzF9yaf6r5PqHpQejo
	C3Okd++Su+ISFJnTG6UOvF7UsiDu+x5elExCVs7yGa/h0zB8dlfqOoj2xC05/b84bYt6gT6oiRaX/
	3G4HJ417NFLoa9YeAaURyIsmcvpEaHZYsl2P8eEaQFlWgVJKRkd+oOFHo+JnQSBRu68HSQeb9Sq5r
	4jawuZkGfWPWhDxblcBPfOl2ImeVP+FtXJU45FzwWgZYg/gkmNTqNZmsrXEO3gR13r5fhHVA1YS+Z
	5Si8I0qrp5LfXvqfAZZdGc5Y4zGrGHjXfGuylaoZ+KSf3/6cTRjnf7kwzy38wtAOQyZ5rqyGNinIc
	PveqXQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpx6-00000004Erh-48Pq;
	Fri, 29 Aug 2025 03:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8v-00000003tjf-2jHN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 00:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=; b=XQH7iv7HFitLqB6TarkMFnPgpl
	dq+QmAY7NyRAAPfDMpfcBVoUEfpboCGDVUmquntPA+hw4JrRTmTg3gu2NH+c+rfSXKmOBqJzaUZIv
	7ELmIQqeds74EL/yXJVahA0cK+tU1Kxyv4mVX5vkNYrZa8yrWMFgMvXzczRegLuxaKijexvElgElc
	YVUoNpughtk6h0jiA/AnN6IEGdOgKM99KYd+zW6oj8kq+U5UftK0AXjpyCdsqsNBIDfN9NXJ3aIxs
	h+liUdSFIKB+9Nha2DWsqY9LYDkFEb02TV5wgXThu+44zJC5pHH6khIILQuIGb4i0hxTRRObBMWbg
	oN8KVGKg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8s-000000030LU-0GJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
	b=HAhqeQma+mJ9lqpXLlLqSukJObo3038yN8uti7KmSmRV9jibT8juAU/muxgZKqLlfDQq4U
	6YgmSYHzxqYbluAzqgi9ZQVs9iTrVWwaWwsNzg285X3WhGJur+mhau4+8PUKGp5xeDgXzd
	Xh0lF07PRKkSdK4rL5j+e92XG19xPSM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
	b=KAut4dIsJZ+L8rjcjn91zhxYgeEUBOYlBhmkMyuF/NWwuppZ8Pq5L36CGO9YcZXX6NFZs7
	Ty5oFmgfsJc36g+uh1Y05okrbegLgNKmMnP/tuApBRJ+3ouXeCaSeUliCgefudAzrpV/z1
	wbMMnIYFtnywwpKvMVY0LJ9/rhkKIsw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-VFqlDsxgPY6CKF87uiVwfg-1; Thu, 28 Aug 2025 20:38:55 -0400
X-MC-Unique: VFqlDsxgPY6CKF87uiVwfg-1
X-Mimecast-MFC-AGG-ID: VFqlDsxgPY6CKF87uiVwfg_1756427934
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70f9ef271a4so833826d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427934; x=1757032734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
        b=fC/oftb93VGMMI8eqSI8H3zka8wTspI0Ma37PKq4KhlHMywORXT94dTsjDAu8aEzLV
         GGGz94dQmfm8XJyDlu9O1TUIpo2P/Qa+aqv40iRrW/57dKOOSug0o4r5zQtmd37XeTOA
         uW/BOzlaXcSYKE8CaP8uHN4DYjVBVghC5JxegG/Sfk640mzlBY2JWuJMd4JP3cQUlN2M
         gDzVkjZ3fam58ThEWCpml+nyxyvXjVQdoRfiMtjkcnNiHr2pBVTY2blPIlbDSsI5UMxV
         jm04nuy6AoCXEjPU4jJe6Q1+T3zslTyA1SB7aFHwZ+CLkw9P+Bf3xkmIQxdqozDI58UB
         FiZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHtqMJwF4ohXY4vuQLs4gi0q82F7JpmQkxOqwMFAaMjS/drXQRKUkCd/CQcabVBMfwRHSXYh/HAaCxzxHUuOIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyCjaRbKD8/NkziWqNWrNlz/XU+qksg5CdKlgybM73xR/x8N1W+
	lUht1CI9kOe3wuaTAohg76gw//73IRXVgqBXujSGFfUX1CEaadG2/57KlqvhvDwViGIDpKIJfIT
	2j2/7OJvkxDeeR5XhiTPHPvW0tE/QBWGP3U3HcqRob9iv3Tag5uPxnGnKHQk2TKh3Ir2Ym2Vo5a
	Uy
X-Gm-Gg: ASbGncvX6Wyn0Zzx7ZfA8YTRoKFpH368r2BCdFR9aSs8lH52ZMJIxZtjI+6B+j3iI2F
	UoSZmeOXZ1Q2TJ29MrNHjlVGkwDpHJGU/0bDQeViTpq7Ru12tm4a320zWXR0q6YFkTG/FdA+4Zx
	pjgOLEMBU5x6VclXaUaEHe9iyfNNaSRj7t9eqGot9BltHFK+TI5tiDbTcwJQ1MjwtpUx8+EWaS+
	fWn6Pc/CBoGbXcQN1C1qCc9Q1m5j3xpffbcT06+fXysRhu5mAYSJ73s5NTSRumx1JPWX/NxyuRj
	lC0Uhjmmw+n+PYoazaxcXt5DPBgrZ0B7USt/0024WLOtX5pY9D9qL/PPKNYQ5Q6ySioYBpiaUg+
	4cZXaWE2VazBCeYs6gCX6XODAyMbzdP0SZw==
X-Received: by 2002:a05:6214:48f:b0:70d:fd53:7256 with SMTP id 6a1803df08f44-70dfd53763bmr29827686d6.3.1756427934555;
        Thu, 28 Aug 2025 17:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEijYzk7GkyvAnuURsnBocI4vkkc9uguNYcxLJSHaK49JimJzbCk2zB1vtZtqve+KQwqSmw3A==
X-Received: by 2002:a05:6214:48f:b0:70d:fd53:7256 with SMTP id 6a1803df08f44-70dfd53763bmr29827556d6.3.1756427934193;
        Thu, 28 Aug 2025 17:38:54 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:26 -0400
Subject: [PATCH 7/8] clk: x86: cgu: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-7-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=3470;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WJxAzEZ/y8gMiDjK9rGa4K/3JOojl4uHZ0X5uecFxfU=;
 b=FRh6Dtp6Qu3xMrqG77h69FKmubrcLmD1DaQdhlvkUw0E6UlxV5Rv3RQ4Eg7iODuTrLGqcr72p
 gQO+ywq9rn/BM+b5lX8Ga2Eu2EAvxju51YKn1XwPasJWhPgQyJz0Qba
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z9QJaMygIfyJ4jBK6JJYBapw7pAvFbBvcZvXfJFxwQY_1756427934
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_013858_352985_836B9872 
X-CRM114-Status: GOOD (  14.74  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/x86/clk-cgu.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index 89b53f280aee03b7838e4656eae3571f00eaa263..d099667355f8d80785b0f43097ad10c274dd61ea 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -132,14 +132,15 @@ lgm_clk_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 				   divider->flags, divider->width);
 }
 
-static long
-lgm_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-			   unsigned long *prate)
+static int lgm_clk_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct lgm_clk_divider *divider = to_lgm_clk_divider(hw);
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, divider->table,
+				       divider->width, divider->flags);
+
+	return 0;
 }
 
 static int
@@ -182,7 +183,7 @@ static void lgm_clk_divider_disable(struct clk_hw *hw)
 
 static const struct clk_ops lgm_clk_divider_ops = {
 	.recalc_rate = lgm_clk_divider_recalc_rate,
-	.round_rate = lgm_clk_divider_round_rate,
+	.determine_rate = lgm_clk_divider_determine_rate,
 	.set_rate = lgm_clk_divider_set_rate,
 	.enable = lgm_clk_divider_enable,
 	.disable = lgm_clk_divider_disable,
@@ -487,15 +488,14 @@ lgm_clk_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long
-lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int lgm_clk_ddiv_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct lgm_clk_ddiv *ddiv = to_lgm_clk_ddiv(hw);
 	u32 div, ddiv1, ddiv2;
 	u64 rate64;
 
-	div = DIV_ROUND_CLOSEST_ULL((u64)*prate, rate);
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, req->rate);
 
 	/* if predivide bit is enabled, modify div by factor of 2.5 */
 	if (lgm_get_clk_val(ddiv->membase, ddiv->reg, ddiv->shift2, 1)) {
@@ -503,14 +503,17 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 		div = DIV_ROUND_CLOSEST_ULL((u64)div, 5);
 	}
 
-	if (div <= 0)
-		return *prate;
+	if (div <= 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	if (lgm_clk_get_ddiv_val(div, &ddiv1, &ddiv2) != 0)
 		if (lgm_clk_get_ddiv_val(div + 1, &ddiv1, &ddiv2) != 0)
 			return -EINVAL;
 
-	rate64 = *prate;
+	rate64 = req->best_parent_rate;
 	do_div(rate64, ddiv1);
 	do_div(rate64, ddiv2);
 
@@ -520,7 +523,9 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 		rate64 = DIV_ROUND_CLOSEST_ULL(rate64, 5);
 	}
 
-	return rate64;
+	req->rate = rate64;
+
+	return 0;
 }
 
 static const struct clk_ops lgm_clk_ddiv_ops = {
@@ -528,7 +533,7 @@ static const struct clk_ops lgm_clk_ddiv_ops = {
 	.enable	= lgm_clk_ddiv_enable,
 	.disable = lgm_clk_ddiv_disable,
 	.set_rate = lgm_clk_ddiv_set_rate,
-	.round_rate = lgm_clk_ddiv_round_rate,
+	.determine_rate = lgm_clk_ddiv_determine_rate,
 };
 
 int lgm_clk_register_ddiv(struct lgm_clk_provider *ctx,

-- 
2.50.1


