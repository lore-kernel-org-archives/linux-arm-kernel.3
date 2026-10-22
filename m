Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118A3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YW3pRMOF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bt86Iw38
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=; b=YW3pRMOFnTvS0ThyG7lb1/u0lJ
	BxdJN0HRGOF5IHlTAQEDK+3LUXlU1Qad3j4SV0cPQFqg0V3erM9aDdNS4FBB0BMj+PcLyOidCfY7C
	FmKTVoSP8ZmCtZGO5/oZB6814tHYRowism/A9UXzceCw16j0k8Y1BQCBWSVTkRLgalMVE12WjsPTO
	ChZPq4QIMuYoEXGilUwo9nhgrXQ65lgovnPnQpJ+gpZmzdSlRUC9mO/OHQkCLOfRi4u00hZiMbyuU
	4ccwYK72SOrTyXeBl0ZOKNFMKDWjJqBg7LsEWzUAbEgGDQefjL8IGORHD+keAzZPv9Op6iHxRIhkb
	jj6qTJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgMj-0000000D5A8-3m7X;
	Thu, 22 Oct 2026 00:09:05 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgMg-0000000D58e-0aRi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:09:03 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-704597ef1d8so581064eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627741; x=1793232541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=bt86Iw38DGb0aSYXPwRbSQUcv8qkwAig2eoo2zAb5Z29Y2LhtTBvntxVAdG8EUFwpi
         /hj7pGlmmDff6m9YG1V5GBN1f+npG6gjzhzBvGXAtyolulmUI0dlIkSNChPABGrHP6sP
         gygrR3tignMoejPxotw/7PJqccXhdMvZZYnx/wtp4+BP6Yc6ShrCQn246TfVREDrI9ls
         mN2wGTdtTxmmEAgrH8q6Pe1Z2uXM4xoqjiq10X5oZ7zjVT03+LW/MVwmydzRK5zYQUVt
         5QRtjHcVtpukyZpFHioCfj18txJNTeIUHgfCJvQ6/FKgotEa1ewfW6YfNL7lAw1RtzdN
         6V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627741; x=1793232541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=mj1n/AGMHQvGdQ64omADrtJRz0HZHN2hNW/3OHo2854/oFWUXP48Rds/MOC7yKkPsR
         SqPPliU1KOkUVqsHjuu0iO3I4DfVNa1wtcvJ0YnMZoEjHiIU5wawOj64SiQWkUD92i3U
         8eSwnVV+nvBxh9YuIVAM+VUhOvFbYJiHgiXm4mRK/D6QHxZbX9Dz2Tv55MO204GvgvkR
         pAYqBfW5zYgs/MHQJVgd9bjN2zYNDrR5DklnMO61+SGZo73zhvlqGoHMNiHjOAM1YVoH
         13mnbA2lOYsPucO+LBImlQhro8R/Oc7215NHWzomOqzYGeDFBPfx5bpmloI66gkNpMQG
         4QEw==
X-Forwarded-Encrypted: i=1; AKwUvBy+bOjPxUdZzZg9vD57aArVM7k60hKp2/lEgRtO+1agFPUZ+oVL5StDWpGpLGiP4H0vQWomGJh/oSygMljGZ6Kk@lists.infradead.org
X-Gm-Message-State: AFq9FYIlw3zyY1yUQ1XIXFXxAegcNajZ6rLd/o7h62MzG2lEWcGSy7wF
	UYZKKdzlc92dIKZMWir+jbmIa15L1IpRuXwfdQONlWasnqjNwcVS33XI
X-Gm-Gg: AYBFou1IMRkDnQEeUsORV1BosEkqI9zkY9FUlbIqGhmIoWsYoyyS/Hox6E7+B8eKjoM
	V2KxtUX1ls9t5pddLImXbnM3X437z74pHBNJ5jPM8Ry2Fpb5Sb2sFIqy464DV0mOak7d3+kshOV
	UeA1kc6rFKXiMyFIQ4/tIU7utvyK5yZGTMSXgFMhFZEWTqlaZOdKpxsAXuSOUfOusu2ci9OTmky
	cLcMRlmYDiNvrOzMJ7yJ1SRqWJpI2jRBASEXIxWrpY+F8Nh2sEvGxI1nzP3WqJaoec1heEVSh8s
	o67jZ8vSKfqVLZA81BwABKC+sIG6Y2pEURVp7w6mQIy0zPKb3YRvT0A/f4i0sG7CV/NEn8z+AMU
	c8K88wGBqiNMDARN6YjHfTKPi4+sWonkkBznQ8VCmkHXA3zGS8dUuJEDjL7dXRwGPWGecVUJj7i
	4mR393QU+A1wMv/D/vW2jQbxSHvQf/j9f4ipXe+u+0uUrFNA7+rifjWORTG84up8VaiyFUEH9Ta
	hs7e9vYNkquNJg6OaHBPlza7WVFYGj21IwRrMaT+SSM3UOnV7aXqClJSbZjwkFjoMYThQi5qWHE
	/tdXWeUlctY8a/0s2CsYo7nbxoGLRuqUfhWnUXzfuZNQjWfqclsHlu5OJ0CkD8yuvYYW76KtH2+
	uym6GgIYEoy5V8qO7Z9z/hGFa8+eiVK617m5n6nuGO8Lv9UFMrospd1EDM/NzLaFTDsNb3y/EzB
	+twBc=
X-Received: by 2002:a05:6820:1889:b0:6de:aeea:5c90 with SMTP id 006d021491bc7-70940d7dd7bmr2299772eaf.26.1792627740866;
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:56 -0600
Subject: [PATCH 2/2] clk: sunxi-ng: h616: drop the private APB2 clock
 definition
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-2-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_170902_186985_A3EC29EC 
X-CRM114-Status: GOOD (  11.55  )
X-Spam-Score: -1.9 (-)
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

CLK_APB2 is now defined in dt-bindings/clock/sun50i-h616-ccu.h, which the
private CCU header already includes. Remove the duplicate definition and
update the comment describing the exported APB clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index 7056f293a8e0..8a07c27c77d5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -40,9 +40,8 @@
 #define CLK_PSI_AHB1_AHB2	24
 #define CLK_AHB3		25
 
-/* APB1 clock exported for PIO */
+/* APB1 and APB2 clocks exported for PIO and UART baud clocks */
 
-#define CLK_APB2		27
 #define CLK_MBUS		28
 
 /* All module clocks and bus gates are exported except DRAM */

-- 
2.53.0


