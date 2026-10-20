Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wP6zz8+r;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gzLhMIRm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=; b=wP6zz8+rqJZgyxXSKX6nNF4BNs
	FQCiUxJRQAktdE/rfYOGahHrxgvWbG40qdvXkoPzXaeEUei4c57eESHcOf6LGkdOqcawTK8gcnYR8
	VZ5bWEfwlWdvarmxg2TYGGU8HsGpWB2A/Zkxa3yYW4ihfn8IsdOFT86sC657JrfMMmM/hd14b5Los
	YFQW04kJBLPb9aPAGCedTBVmdm4qcdmWQehj1wPcKUCgQuvNRZ1VuIOEHVMekZLzyUIwNNnrtDmDh
	7KCO5+GX/QOjQNGvfzguW/ZuozGjVJarMehh1quHJhcE6LYZlR/M8dqlj0BcteBwjhjP3f9C6OyPF
	RhJjcp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4In-000000092dF-2oIP;
	Tue, 20 Oct 2026 07:30:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4Ik-000000092YV-0XRX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:30:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so330425f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481422; x=1793086222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
        b=gzLhMIRmtJ0KCUf8rLjy0vatnwn8bdoMkeFJ4anJEwNS/4pD98GpF+aaUdy0sMn10z
         nSdPo71elfHHoh3c91m+mHf/CQxMSd2TYim9jtQPxCcSOMPfznCvQ5L1TYbcFTbhddbz
         U9jQ2bsxY2vWK8YM4G/Fm91tKvba81BDxOiljdT3qFWKOSkrb1MoEtCzC9bpVd97C0ob
         +xaFmkKUURf1McD3+KoBgjw0PglDb/nvXdCZAXbvrJ1LQboAARZmHjYgNp9RAVdrJ51p
         iOgbrlsozejZyF0kaX09ruy0xgNBl6A2eHirlsyZ1aPesANBDQZCjD4aode5naSxS0q4
         W9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481422; x=1793086222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
        b=ATb8jJ5ebeV2xvCqZ0HLNkfgmpTMtUtlA8Vji9T8yQC/fGt+W0ZqKaS7iRSqW77Fwx
         9ChRfGBmoC4Njf9a8ZOEFxoMFFOsOtb29lYneUce7/N/Qb91dYHvkC1z/RxemRlFyHHf
         ZEuWf/T3yYWbQaBDOtVg2HMgZfmWNwyjP0QfDZm+9vw7TzaneK6Nlu7Mn2CzhExfU5+0
         bak9RDxQqqvC/rCX0FWM261esXG1YnWzUrr5Hyigh8/QYDkdlN285ZjAdnVtaXux4f3b
         PoNPW7AILVduqN/NtHUd4ewK6uv4/D0Tnz0dLxHVS5CioDgz0jWjjAEypLzEJlAi0WLs
         Jd6w==
X-Forwarded-Encrypted: i=1; AKwUvBzhGKqCUz+0VWdSZN58uN898AR8Vr+0OsLwDPv/HgpPn+9Zn9gYwfL7hjFzoJ/Fz9RdeWiUsECgMvDx4KRKfyw2@lists.infradead.org
X-Gm-Message-State: AFq9FYKS8zuuPSGPOWOfTS1GMhjynp+o+/cQ5TDom5LclCzNLEZbVluR
	l3v6WrdbUnsVbeIx57eH39rmpYoutoQMS/qdJAlw15A0xgYRWd8luX7u
X-Gm-Gg: AYBFou38yYK9KqhwMKocowbHZa8PU0V3HK6q5bXGHCDfGX6Q7HZKXVlbjMips8CBcEF
	cccfLDQ4VKWP8XWn1WNiFFgfVYR55NEazFV4xxm/JvETC64DK0o/Md670jvXDF/+HiordACfscI
	xacSmTQFUMB9q4Mk0Rf3W8oJJanst2nun+vq5t1P8vEtvPPxa/6K+f2zixcKnMei30KmayO0Now
	arMMrFvUY3v/atTfh0A3x085Q/m3I6Hf/lfHqDAng5L7FXMuRZhct+2m/ikpTe7m9kYq5MdepgT
	FUUv1k6c12YPiceYY1vx9PNzs9TlKcgwzzUGKhZN3VI32/ybKfkyX1o0fB4FNFI6OMODixIGm51
	88SbJayGF1XKcWP7b0B1Z60J7j56T6EZUlJ1Mtftcm8wM4mz4SwxExCV4KqkRrHLHAzAsTqSJvX
	oae/HjouBE3Glw7RYmN5UAcGW/RkV2aEHjtfGUFRx5kX1nmGzBjvRC5CFMwQ0JIrWYUe1V/EPBa
	UeLGnEhLfjwe+bjvA0U0I4=
X-Received: by 2002:a05:6000:617:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e1e9f12c3mr3046877f8f.30.1792481421580;
        Tue, 20 Oct 2026 00:30:21 -0700 (PDT)
Received: from kali ([102.209.31.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d75sm4747712f8f.25.2026.10.20.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:30:21 -0700 (PDT)
From: Bashirah Lawal <bashirahlawal017@gmail.com>
To: outreachy@lists.linux.dev
Cc: Bashirah Lawal <bashirahlawal017@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt7601u: remove unused ee_read tracepoint
Date: Tue, 20 Oct 2026 03:29:46 -0400
Message-ID: <20261020072947.124586-1-bashirahlawal017@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_003026_184455_E3F5E155 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.5 (+)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ee_read trace event was added with the driver in commit
c869f77d6abb ("add mt7601u driver"), but no call to
trace_ee_read() has ever existed in the tree. Building with
UT=1 reports the tracepoint as unused.

Each unused trace event wastes several KB of kernel memory.
Remove it to avoid that waste.

Signed-off-by: Bashirah Lawal <bashirahlawal017@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/trace.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/trace.h b/drivers/net/wireless/mediatek/mt7601u/trace.h
index 07696b672161..208ab8b0117a 100644
--- a/drivers/net/wireless/mediatek/mt7601u/trace.h
+++ b/drivers/net/wireless/mediatek/mt7601u/trace.h
@@ -123,21 +123,6 @@ TRACE_EVENT(mt_vend_req,
 		  !!__entry->buf, __entry->buflen)
 );
 
-TRACE_EVENT(ee_read,
-	TP_PROTO(struct mt7601u_dev *dev, int offset, u16 val),
-	TP_ARGS(dev, offset, val),
-	TP_STRUCT__entry(
-		DEV_ENTRY
-		__field(int, o) __field(u16, v)
-	),
-	TP_fast_assign(
-		DEV_ASSIGN;
-		__entry->o = offset;
-		__entry->v = val;
-	),
-	TP_printk(DEV_PR_FMT "%04x=%04x", DEV_PR_ARG, __entry->o, __entry->v)
-);
-
 DECLARE_EVENT_CLASS(dev_rf_reg_evt,
 	TP_PROTO(struct mt7601u_dev *dev, u8 bank, u8 reg, u8 val),
 	TP_ARGS(dev, bank, reg, val),
-- 
2.53.0


