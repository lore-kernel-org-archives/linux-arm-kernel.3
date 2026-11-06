Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1A2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QZKc7G/j;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LOEgPVMb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=; b=QZKc7G/jvGwLu1Nlj1YJlPfi9Q
	gZHKKvOX/dzsLW44vQLfhVoVq2b50LDPX+SlGJQAXz5Nfrq0Ie2hD6uxgrjrExIRGNRS2rnL0NHxV
	Cwphm8/q+3kWA1saCkZqD0ftkguaJsAAiBpcAYH0uaSo8YuEdWEv//FjgPHagQmGpn5yltWY+tPjJ
	BPbQaEjLwFOQitmgXnR9KQDcbyl9TimROh/2Arde4Dszs0GlOA3wnNg81lyIS6o3qcbcbxqQ4jhqv
	HSVAMhogItsK3lnv31yPY6A0L0d8BoHD7lON71DdapxllFxvRyJG9ROgQzyZArGPDywEAJKVIwunZ
	gu/BvvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8mG-0000000Ayj2-32ZK;
	Fri, 06 Nov 2026 01:30:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8mD-0000000AyiB-17M8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793928588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=LOEgPVMbqX25LdkCBhr8DH1UbhxPQAT0J7ihQqd8Bdg3NhkL320l834RpVO9qCHtCikyDJ
	KuqlZJXrWetbBS1RsaMatxZinGC/QlICVjGhfgyGt2PrNgkqoRG0z0EVeVUfCWfiEVNFyj
	LUJqU349jjKk/enXqDO6+50qRCThXmI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-K-KkjmFDPs-1BAYwSQwDQQ-1; Thu, 05 Nov 2026 20:29:47 -0500
X-MC-Unique: K-KkjmFDPs-1BAYwSQwDQQ-1
X-Mimecast-MFC-AGG-ID: K-KkjmFDPs-1BAYwSQwDQQ_1793928584
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so1813441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 17:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928584; x=1794533384;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=wHHD7iIB9vY4Iq1cBk3sibrfoQ5o7Ps1xmxNuQumQ5aEXBepYBQtWPaUf3y4AjfwJS
         cX/zhgDVszbcGr1gQyieseZRDNHo1waDUjvPAjMCm3eOlGRGCxEjHooCje36iNnkTzpR
         paVAIMFt6sL1D2tymwKNPnAn2A8V1V7hauPNx/gjzrP8UsFQil3hOuGwe1Q9e8LZ2r4u
         hu+yXcFxosMEPGE6V3iwgcSf/Ubbqvd/08lKFnqgaKYhUHxHvmnPXB0G1v7gEmqP6lFC
         /R9k60TtLhQPpwcr6ZSXojIiLFeR4H5lJy9U2tsiMGwi8ySS8xx6eGCEE9d/qOxoJ07g
         GTyw==
X-Forwarded-Encrypted: i=1; AKwUvBz2DugZwEHYRvGk2seQJW3lqEpSClZiKtgtyWmsjAUXlqi5f30rNuqjNIDrRAt4IWE8eV8aiojXl7WATMMga+A/@lists.infradead.org
X-Gm-Message-State: APuU4Z9I7J6wmeYnXZOBZ+JNcGnCMS8m1Xjn8za8Wb8KJKWtd4dSV5ex
	Xz9fpUr49Qk7JAMM22OSMlGobdT+zXv7VdFN8MIPrW4yn+KkIcjUVwGmzRLS5VnScFNmRlY6Y8G
	LGqJnphLnfsDG8jHW1FO4mZVHOyC8Mde0nop4G6dym9ydg7cneSSLImPuWKyRkF3vqH4MQG3EMV
	dA
X-Gm-Gg: AYBFou01qCcvSSIz4/5yRdg7n6NTyy+8Lg7uZtZ+SELLDb83vRgExSQIyUlE81B2z5m
	K0SfTXuzpvPwTq9JkjhwNN8yo5oLRTMUkTvm1WrwkKPNGMpG7qkdkmIXXYKi12ZhaVQMUHXyfKI
	Id7S2OzTjb9eAsA5jJ2jgCsvGq9l6t81+/R694SmoR8UR2Z2gHKQP2qYzXCXLXDoRcuP7QkM/eD
	Fdw5F9ICdPSSeCb/6Ve4NZGawaqzW+mIlcse8CCxjlkZVdRVEUs5nUWq5I4uQhHBkSlhjNsRn7g
	pGM3FXUvQO9viTttq5JyKWE7Jizi1gl8Ygl6FwuUZhJKZMqsT2ylll+K+VE4jzJ9247c2ccX5jh
	F1oablMF4wmQgny1Ez7rxSWsCGLJ9Lfb9WmNbnbiyRP+kfW5JkG23MGIqcHmDi1mxIJswuizUwl
	/nWPFuttZjDhfyul8X
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17839081cf.60.1793928584396;
        Thu, 05 Nov 2026 17:29:44 -0800 (PST)
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17838791cf.60.1793928583742;
        Thu, 05 Nov 2026 17:29:43 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26f1bd64sm7404091cf.23.2026.11.05.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:29:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 05 Nov 2026 20:29:27 -0500
Subject: [PATCH] clk: samsung: exynos3250: convert to
 subsys_platform_driver_probe()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDXRCsFVxKLawSBIByHi7orll
 7z3X8DoCBmK4AKHOzHNk4cMAzCdnloUZL1BRSqVMkqEGQfBW80nC6tsbrM4zoxW4A+Lw4aOL1Z
 Wv/2yR7O+BbjvB+zBcuhuAAAA
X-Change-ID: 20261105-clk-subsys-d2d9d8338ca2
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7ycUhYaTHTijLETgf34xYgBmPS7y03e26r0FoL8ptEI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe6jZ+3Syw76dB9vH8aLXHwRdfqzR/tl6m6Wv57V/1l
 RJ3E63fHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEbhLD/8o5AYtijIRnM2W+
 PCXU0K3huJuJv/u/k9WpNfMleSa9lWD4X3E+quGxUEJjlMKOTBshycnPN5t21InbX/0a7XMrtPY
 aHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9isHHgtDupC7VVW3BEO9rDo1XeKqPFOzNjp0Fq70vvQ_1793928584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_172957_391745_3583B973 
X-CRM114-Status: GOOD (  12.01  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 32d12658e1a9..bf36d2f2a3f8 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -1093,10 +1093,6 @@ static struct platform_driver exynos3250_cmu_isp_driver __initdata = {
 	},
 };
 
-static int __init exynos3250_cmu_platform_init(void)
-{
-	return platform_driver_probe(&exynos3250_cmu_isp_driver,
-					exynos3250_cmu_isp_probe);
-}
-subsys_initcall(exynos3250_cmu_platform_init);
+subsys_platform_driver_probe(exynos3250_cmu_isp_driver,
+			     exynos3250_cmu_isp_probe);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-clk-subsys-d2d9d8338ca2

Best regards,
--  
Brian Masney <bmasney@redhat.com>


