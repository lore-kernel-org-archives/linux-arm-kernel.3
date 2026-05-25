Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09806CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=; b=U16+ggjCt8smo+
	YN32DBR9hIGOkr/NdYiLTMKRvR42Jg6tu9IzpGj5raZGzHL8DcHYRi0WxL0uqELJU/MTRJPrvkaey
	hT14M+JLXoWwnwYwezGzo8G8k2n58taJoUGbRlwUyLg/N55tUkXxoimiGeVuNY3H79bjz6KAGsABm
	g75cmxrABSIi2iVe+yyR+9LClXgtoP7eiy4jFrBsz5rxTyX3pALiKukJLYTd8nBkMPsXhLPLEmmAL
	IsDKzQWwOj7yckyk3tvR5yX4UiLBXPaeKaMVIN0NuwoHlc/8jfIRkkeK9+pzZuh6uF7tGqbzGo1aQ
	weLZxZxpfcgZntzAdcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzU-0000000GsOG-43MH;
	Mon, 25 May 2026 09:52:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzR-0000000GsLZ-2c6h
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 09:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=; b=qjr68SQV5s7AcB4/kHF8TBpEpb
	etSWZXU6DjHWv1TR0Pdy+IAyNSJ34/Ik4YPM9AoNCtgYq6lHPcKA2frsI+wJ0T8oqrRK/HC6Xwmrs
	p8WPmtU3HhtYhaGI/l7OGfImlN+j1NuLcntk5xep4KdRjIzFY3IBptwijblkBkMue8is1lJavYsYc
	Z0MDlrGjxFsR+8XDldZ1NRWnZ1XXgW7ME7fNjBFLPS7mkjPGwsPFbm5YXJe/GnJY+/DTPjnYzX2OZ
	wACCidUn2LDUqxlgvxlGS4odu+se3qOAjjZVteRNsvgofNKbhspPgGhFdoO+07UFIL7uI0a0B3wyG
	4Arjgv7g==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzO-00000008wZ3-08cD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:52:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bccb978bd9so59972475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702768; x=1780307568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=;
        b=Wpj7iHnVxLhiIMfBPVsFF0S/60HM3YDEKo/kF/YhX5wlc4IePbUSQUc6wOJPpMW7xq
         VPHN4Dm5OIjekpSsXJeJbKX4T9d+F5+WlIRGiKAlAWV8EgL1bWdxKzdALLkC9QaBlNGW
         Nvogg8j0KdzRcx2Yo/8uWQ09bDI3yG7bYFiMJi4nuaN7CHAS3MBozzshQ1ZXgspMl9sz
         OtvFCIbuLQULyk/xB0Zi4VctuIZ4FvJbJyRrGpK9ePJeK/ovwRFVlx5N17lf2SSwQmrz
         LnGts+HRsdMfL+iQo6p1Si8efJCTDXZHSY3UmwVCmOnfIcPNjYaozsesd9fYtSgwW8Vd
         389g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702768; x=1780307568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=;
        b=s7VbpxN3/3fL8+3JRcbEoM4MPTqpA+ffKvWmvRTLyLNqh7j68A4tYUvP/2JfDbgQah
         Im7DdM9HR2DYWz9dzDYHfZsBH4o+H5xirKuPzb85YxDvALubwDuisVbItrA0A0lGYMMS
         xvALxaKUNJYUiJ5AO+Z3yNtJCYSUDLScuiyxLRzdTz9xRSVyQZWkBObJnbjlsBPTsMC1
         EmEtJ6y///kKlSeqlXExmr8WkNoUv53HJeqJ5LhnaZUUvlAun9M5pGDkw9ttHfsHq3A8
         4Xjt12DFEhYNSJbCUTI1yNOf4mMz6rEXkEqMA4hMPlR2vstBLC1I49mwPL/ofVrlJhl6
         vQFg==
X-Forwarded-Encrypted: i=1; AFNElJ9sfl+pVknr/lmuCF64SQxj2yA4Mikdy43ooHyFt4NKb+nB4yz+X+r76si1kYH7yaYN1B+1UY4NocB2zW1c2+Wl@lists.infradead.org
X-Gm-Message-State: AOJu0YyPlVFn0JVVTGjSQGX1Mti4sFFuaLEj0LrJGLiPCdNRl+KA250K
	15TFMSIILkUzHawL1TuHTUm44/HxRRivgKZfYekCiZWYnEbXVl6wy3vH
X-Gm-Gg: Acq92OEjSfDczpXMsp5vDDOodTmWmiyt0HtimiRcvOPdj1761AGucB88yLnbSxuJcqA
	J/2b8SS9jTVp02dcO7q74lVlTkyUK20dw8xg6RDf3p7VcnXm/RkFv/8E7js3q+5In/Iul6nLYQ3
	/V7lyks9C1hBNRhjFd5xO88kHmErmnW+YAh0e8jIFsPag/oYcSDPG6Wy1JLVVcKutSuVbH7wlra
	Yo1XP+RJzbgKSDiIGp66h7GSi5O7Jk3WYO0fs3Y43l3O7ihsddMFDCcDY058wTfkbL0yLz/mHSK
	sf2NKLDWduP5vYCdCcXjJ6jRpJhuAtJTPHBB5vp442RiJxFHHYx2zdVTsAXBXO6yUR1T3d1r7wV
	exUD460zwbmFn9dx3revRQZ4oWsfodLxQkPE44GwgtbnKot+2yvCXVQZa0fI/ftXww8iQQZmTgu
	pO61hSRyZTxQKPFS4AOAbT
X-Received: by 2002:a17:902:f546:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bea23e2057mr157194235ad.27.1779702767866;
        Mon, 25 May 2026 02:52:47 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:47 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 2/6] media: meson: vdec: Protect session exclusivity check with lock
Date: Mon, 25 May 2026 15:21:50 +0530
Message-ID: <20260525095216.12078-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_105250_709968_411E7925 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the check for an active hardware session is performed without holding
the core->lock mutex. In multi-threaded environments, two concurrent
STREAMON ioctls on different file descriptors can simultaneously find
core->cur_sess to be NULL, bypass the check, and concurrently call
vdec_poweron(), corrupting hardware state.

Fix this by wrapping the session exclusivity check inside core->lock.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: New patch.
[High] Concurrent sessions can bypass the hardware exclusivity check,
leading to simultaneous hardware programming.
---
 drivers/staging/media/meson/vdec/vdec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 18a22b79e835..e72f54af026e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -286,10 +286,13 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
+	mutex_lock(&core->lock);
 	if (core->cur_sess && core->cur_sess != sess) {
+		mutex_unlock(&core->lock);
 		ret = -EBUSY;
 		goto bufs_done;
 	}
+	mutex_unlock(&core->lock);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
-- 
2.50.1


