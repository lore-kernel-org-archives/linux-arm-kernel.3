Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EE4CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=; b=E2IuReu9Ak0hE6ugxOyNIPuIHU
	jiV5B8MvGPW5yMo6ZbBhn7nxVWxotT/aVR4avypDSd5258yLuN0FKde9rdy6yDsZCz2xlCwkMLTL9
	H60bjD6n+JQox5rgPQzlSHdTi7l5jtvCDBeZbm+jSSNPK/UFhsKB0HltIzszDSZfUex+amruzn1Kv
	WVCvi56rQwKutn7+AeGs17ZSWS+NSGnlT65m7MguZZfjiSAlgOlE4MymTzATnteSCrPbex9e2NvOl
	XvDfaE28XeZ0zs3jwGD7/h+kpcTZxc2gBCQKRvLem2msESxr0+mxtSHX+jxMCwrQh+Q467ojVrgHL
	mFlQepuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpx7-00000004EsR-3iD0;
	Fri, 29 Aug 2025 03:39:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8y-00000003tl1-2f4s
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 00:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=; b=MAhqO6vBGtlJNYUKojfr3zb1Ts
	Tb9Jh2WXB6YpiV+sqp9n24kYwJlv0YKrsdU71lLPpK9X6OwJdlgkIwjqIhcIboWx0YD3ki/rHAKdQ
	NNZWD+KQJQOqQFamXAEsyMdymsDcXFaBSlcR8F5EvyKFiLW6pKgEw1loBpRBqhMQiMoYrHn+8Gjn0
	j1oCl7LS3WbSyFaMmZZhiAjQri3WWGg85/jKqhwvrPDcinA2GIXGetiz4CLiJ2M10EDFg4V03esTg
	xlDgVXt/KtWLDWmTD2o4DLaDcu0d/p5nSj4OQp2c6g/4vgM/6sWhuO7MPitwca+7BP44Nx9NLit3d
	Fbefb9Jg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8v-000000030MD-33Lx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
	b=iTsfHydObZ1TrKcIrcmuKpxAyI9rsrD9M7j5jcZQkzBbvpoco9oMHP2pcwlFugTUtINW/8
	5Z/dbXNxDjYv0C/6HCzzMPyqr/++cmeacl4fzgXmxEU+bC1VZ925R+9VeCw0A/eNwWnBka
	WMUgcNyT2coHDKyk89dS3tCum/oQiPM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
	b=iTsfHydObZ1TrKcIrcmuKpxAyI9rsrD9M7j5jcZQkzBbvpoco9oMHP2pcwlFugTUtINW/8
	5Z/dbXNxDjYv0C/6HCzzMPyqr/++cmeacl4fzgXmxEU+bC1VZ925R+9VeCw0A/eNwWnBka
	WMUgcNyT2coHDKyk89dS3tCum/oQiPM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-fJyr8mnFPMiVZQi_QVXunw-1; Thu, 28 Aug 2025 20:38:59 -0400
X-MC-Unique: fJyr8mnFPMiVZQi_QVXunw-1
X-Mimecast-MFC-AGG-ID: fJyr8mnFPMiVZQi_QVXunw_1756427938
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de1a3cec7so30783056d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427938; x=1757032738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
        b=QbwWsnzp+HEhO/WkB2S2PTReZUjwVRuitKv+X6MMCxWk6kn6KZVvI+CkJOsD5zKwzy
         63tb8Grte6+cfYYTC4XIkVZgRQP+AUx7/rzB5PIo5+N6rFfPN3AWUm2lphfDsD7mZyqS
         2wzjlZSc5moP32lJljCoDC3Y++BfHr9kT4SN8Ms8L6jkswlcibcTzgKN4lfcofGaEIwQ
         nk0NUBKFBsKPh6NEmEcnCnd3Zc23xDECkU94UqTuA5bTTX0G5zqnsyCYemva6S+ozfZ9
         7cOx7klzogPZF3xopzLLzEr+jXuGwklcT0pM0J2kGFP8qDrGG1kLt+5zS9E51VZXsP3h
         xUjA==
X-Forwarded-Encrypted: i=1; AJvYcCUWK0teUdPSnQAvFqm1EAExXez+VewspIPEofKZKa6RHLMvqG1js/uoFYG3ZHUvR/SQsotRBfxKpeEGQ6pZtD6f@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJxtcUUMNyfW7q3kDNgxxqhz1IQ/YuQGMgX2MVd1+Nhu2k9T7
	q5sEGs1TwXr+H2BO4OGuhSApF+cLFGhobmQKpoWqRnZ7HbVqWuiteM65uHCutEmV43h8lAEWtHW
	M+G3brp7Aj48+LqcOWEX04tpk5y0Hc+7ebRuWd99vI8cHmh9WVrqPSiqDvWkKXRtcfpMkQbQcI0
	G8
X-Gm-Gg: ASbGncuha8PHLmE2Cq7VBBTFuaCe7QN6OtY8GH7xMfyxe+ILGNLInPE8dCze7rdkRBy
	7yImMx5APyk1bGDhWr1/YpQ0R55uGOootyWtulMRWpvjSNFwbHFrajYyzV1JQdfQvT3bofW1ijU
	y5xwgjtEQceXd9Cx8cpAg5HaHhl3qF15ZxXMjdhjchsQhtXibtCNohkYKVuPhFzoxHlZiumsust
	XgFanBlfWsUK6EfizrbR8pwrAesYekZfBYY+xrx4h/pcv2bvebA2HMX+q9r4Wls7vqin6htamS1
	vxqVEQFJL2LFUblxAScbrNQyqYTmWiftY4l8xY6VjtYY7iS5MpKFj1TQtxdTol0JpxbIqeHUgjk
	hYZLHe1zfU6hOaVdU9ndEsAHz15erop/ZMQ==
X-Received: by 2002:ad4:5d6d:0:b0:70f:5a6d:a24c with SMTP id 6a1803df08f44-70f5a6da382mr3848676d6.3.1756427938578;
        Thu, 28 Aug 2025 17:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNGUlyT+ctgue+dRAvvl/QvlMdyIOiL7k4jZZ7Wud+MSEXYojVVEBluU8riRrhIojKE6e3Kw==
X-Received: by 2002:ad4:5d6d:0:b0:70f:5a6d:a24c with SMTP id 6a1803df08f44-70f5a6da382mr3848306d6.3.1756427938041;
        Thu, 28 Aug 2025 17:38:58 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:27 -0400
Subject: [PATCH 8/8] clk: zynqmp: divider: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-8-b97ec8ba6cc4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2556;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=58n95bQC3o+Nb/L33jeFcmWnqEOz/8LpB+ZJ4315jbA=;
 b=uy+XUWiCv9yIjSAyrE0/4I1CLGHob+UIZ+EQxuc1qyVM5xq9Nhgg1+JCuBhoLqxMKDOrEirQl
 MnnF6BAHL2DDr0riIPtjEh4AcWFPyXh0pP1ewj5MPPjAgu3gyCxOVpL
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VC1rJd0J8XXLbIV94HtbtRf_sUZC5JIB50-HIF-F4JE_1756427938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_013901_953786_D65C31F4 
X-CRM114-Status: GOOD (  12.93  )
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
 drivers/clk/zynqmp/divider.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 5a00487ae408be4ffd586704859b232e934c1f6e..c824eeacd8ebd4d670d78f1af2186e61008bdae2 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -118,9 +118,8 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
  *
  * Return: 0 on success else error+reason
  */
-static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct zynqmp_clk_divider *divider = to_zynqmp_clk_divider(hw);
 	const char *clk_name = clk_hw_get_name(hw);
@@ -145,17 +144,21 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 		if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
 			bestdiv = 1 << bestdiv;
 
-		return DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
+
+		return 0;
 	}
 
 	width = fls(divider->max_div);
 
-	rate = divider_round_rate(hw, rate, prate, NULL, width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL, width, divider->flags);
 
-	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && (rate % *prate))
-		*prate = rate;
+	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
+	    (req->rate % req->best_parent_rate))
+		req->best_parent_rate = req->rate;
 
-	return rate;
+	return 0;
 }
 
 /**
@@ -199,13 +202,13 @@ static int zynqmp_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops zynqmp_clk_divider_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 	.set_rate = zynqmp_clk_divider_set_rate,
 };
 
 static const struct clk_ops zynqmp_clk_divider_ro_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 };
 
 /**

-- 
2.50.1


