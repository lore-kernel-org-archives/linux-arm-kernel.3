Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V6bRjMpD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rxTEJ7qu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yTRHCeu3BKYroz2AU7wSXWEvSolHHGJHDuQoOz2ibCI=; b=V6bRjMpDvyas1KA5hbo92zp442
	tP0S1IyFWk4VIXxv/v9E7FWcOCatq1FVzk1OnRh1drA/LCb69EvxCi9WJKihBSunX0x2Cpdgiungm
	ElQhGDX/NP9IN/IC9ib9r0KyjqKZtv03nxUj/W2UI11RWEWy+A94AN7Qz+K/svrRdQTcIZBZyirAx
	vjDCgOjoLO/ZID4lW05/Rc7TN/lEio/BPdXhC8/R00C15SK44ll8ApF21fWQGzMV5SYuo5F74MhMC
	gHKkYcb3E6dEmUMxHoYp8GIjRZ8wVbtnjBpj0OuRzUJvglrZlMKIwoaGgDjpdQjTZ70CAAZjiTPz/
	sFoHHXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfDC-00000004T9N-19DZ;
	Tue, 27 Oct 2026 11:19:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfDA-00000004T8u-23DS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:19:25 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso3129969a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793099963; x=1793704763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTRHCeu3BKYroz2AU7wSXWEvSolHHGJHDuQoOz2ibCI=;
        b=rxTEJ7qu98REBR9MXKK9vPLtA4DJAh0im3wIXb6+h7AlpKML6BHOBIDkhTWABv/RQW
         GoQxN4rLpcA64g+cMWM60YftZeWHBxUpOAHfmYRe3Zw9Cd/jMFL8+oBfZdGaGUBtY0Dn
         51J3c9pdT4IcAPoyuG/BbLMA/5jtRmqJLm7xlAYO6ZjAlcVNWMXwEswYtMCzKwL8IEce
         WpT31GqRhy+Ie0tUj3lsfN/Eg+camG68niAKEi0VaFnfgsMA7G170BgZn/smmWWPCdNR
         fKSCPes3CTPGjPwhd7Y8szjWCd4I6z9kpMGhFtS/aX7ZRQGmsldoOafmjDOk07s65XZW
         yRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099963; x=1793704763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTRHCeu3BKYroz2AU7wSXWEvSolHHGJHDuQoOz2ibCI=;
        b=1+Kz5XZytg7o3vnsdmeWipxIvkp/RH+15T9VDaw5UOiQUf8AYxm+fXZ0JWLntSnb6G
         xlwdAFoKQW9YkVT3uTI1kEpRb/ay268D1wUxnXLuVFRF9d6/asThzX+xWNtb/TcAWRrj
         Si5G3leh13JPHBUyaG9mY6yUwLlfh5f3+wGcUevT6dGU3KQKwGLIsLX7ou7iImgzuHK6
         KkzAQYNz+x0j5GKzp59YqIrehLTPBBYkFEXsJNbhPC3BARQ/Y/1MzP3hCDtEfJLlFP6q
         Npl3qYMYYXcu6cfbqJrfG4So35kFy4B1aGgot7HPgTVDLBODKnRRc5JVZcdWT1CKvS/k
         OKOw==
X-Forwarded-Encrypted: i=1; AKwUvBwwb4TMgWv1Cyha1P6JdOfqLY1eatgb++ja3DTa6wDmXrrEAksvFFCaBtE11Eg+Fs+G3P2MX3esTaXMbiHRwH3Z@lists.infradead.org
X-Gm-Message-State: AFq9FYIycd6eqbzjipNebI4Uu9Hl81CNl7aNSfPh8WZVB+2F31v9qbdB
	9xa6WLo/GCENHulG+3AcRd1eAqoyLl43vWeUoKD8E7MiSYx1lefMS5fA
X-Gm-Gg: AYBFou0fMeaCFNH70SfZcXksUgkhMKQvkshZpOLxkw0ivGrHtnvs/9gEqrJaV6cIvy2
	8W4vXwRHunsAmgedCxakw9t4JhRNE3UgF6nnlw1Je8gQCnGyr3ccxgjQZAeYWpjLWUJXobOGunz
	d4e5nr9F1s/Dtp0+T077cT57p2W+fem0zfRS7PBovlIb1eazIH0umkI3YM78sw+gUR+gS2SElmw
	FnvZHu6lThlsb6ArW3BrXIufOYzOpcXCyfsTaRxRRf4QQiKDhtLXJuVgb+gJvR8f/LZv8nYs2JB
	PwgUSA195mptL/UuQ8rpyfpGs8vu7XygcNQV/t2iG+T3Wk5jMi8/arVF1wcKH1DJgNcn6LYKTt5
	PSKsUrC0JG5TYs8mibW4q5UuF+fcheby3GV3POgiVXhSQc/VpEYSvkuSiY5F1w6v9Bl6MpzxWO0
	dkinb95muxNlftX4kaah88qCUkTM5qcHmHZ0JBTt4pL/LBP6ckhVo36Npue2cSvmS3BkYbPdKC+
	FQK7tmNY7tNlxikppXHtAfEEf41RfkeUZ8e9cPEr3Ws6yv0gX/Kte/4Z2jd
X-Received: by 2002:a17:90b:5744:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3adead577e9mr8214590a91.28.1793099963392;
        Tue, 27 Oct 2026 04:19:23 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406519fesm3435051a91.12.2026.10.27.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:19:22 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Free error_dev_id when destroying an MSC
Date: Tue, 27 Oct 2026 19:19:14 +0800
Message-Id: <20261027111914.850854-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_041924_562357_89C15192 
X-CRM114-Status: UNSURE (   9.20  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

error_dev_id is allocated with alloc_percpu() when the MSC has a
per-CPU error interrupt, but is never freed. free_percpu_irq() only
releases the irqaction, not the percpu allocation. The msc structure
itself is devm managed, so the leak survives its devm_kfree().

free_percpu() accepts NULL, so MSCs without a PPI error interrupt
are unaffected.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..bff0b5da0fe6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2423,6 +2423,7 @@ static void mpam_msc_destroy(struct mpam_msc *msc)
 	list_del_rcu(&msc->all_msc_list);
 	synchronize_srcu(&mpam_srcu);
 	mpam_pcc_chan_put(msc->pcc_chan);
+	free_percpu(msc->error_dev_id);
 	platform_set_drvdata(pdev, NULL);
 
 	add_to_garbage(msc);
-- 
2.34.1


