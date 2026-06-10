Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27EDCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 02:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dywY+EaNVUUmyes0LNSn8JSMxfnYFXFyYF6vzqLn8Ec=; b=nR+wiwEJ9GSHUcy1tibKMNr+fa
	zicjHrma7NDvUBCmt5s58q+f3tLzN6Pj4ImVJ4nDBaQCLxRB9aHbkkYbRbP5TRvwPlTlfx44SDleB
	mHPxmMEaqigPhVYlVqfaIETJNYbk6fhNDdnn7iYE8cqHKg2cf9Y6TOJBN20cKgwk/SFQUfKrAEWxc
	G+tqkp0inmPV0yzZv56no4/TD7SR3i8Yy3UeVQGOjDs2jpwTN1AMtjxx+c3IlucEt2aTx7Trh5nHm
	l84qIxp3QPHMAlKj12quITbaXwewkijlVrzKFOgQLyUsoRT8dXfOLXBWnTtZr+K4FCrNrIma/GPuB
	cpMif2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8xf-00000006hky-46s7;
	Wed, 10 Jun 2026 02:46:36 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8xd-00000006hkc-42du
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 02:46:35 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-1382533d428so2634953c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 19:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781059593; x=1781664393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dywY+EaNVUUmyes0LNSn8JSMxfnYFXFyYF6vzqLn8Ec=;
        b=Ooh10hrb5jDbYmT/MlYuVSyXo4poqqAOfWL1TjolMjI+jqjG338dsk35b/ivMSls1l
         NbFWt3beEx36N9N2O4TjZti7PAESPT3rQSj10PvUwruB7lpNzUxBkHYdGzuPbJe1WjEt
         F/yo01FkYD+xiQuNcrM3bN4lYoQeWJsEEAe4ZryIbGepeLZZG/a/ztva5vsxY+v7x6Jf
         0j+ESwgpZQIDXp/Rf/RlcMnRXtXaTFcijSnaCPNboj9QgyKoG1paKFQBZaBeE1hPSCoE
         4yc+O56bgIcZbyFT1vnaVobCE2nTkHA6T+MB1BFLQKRvoYpfoRuqF9JfLJynZzAh4BWk
         a18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781059593; x=1781664393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dywY+EaNVUUmyes0LNSn8JSMxfnYFXFyYF6vzqLn8Ec=;
        b=o7RORBvhAeySbtRKdubKj8qMmAlLWsN8J4JCSMpdczOZh2A4cRuE1pR8ogOASyzUeF
         7+NpRqwSkZNScyYhfukNSawQSUknB1VuXATV8a3VYPkTuoNRwNeIHrvIDI+puCwCfAwy
         JquwfFx0Degv3mDbGN421G6JhuWipSvaxpf2NU9IYe5S/UpHniRbifs9OpxrjHbdnnNu
         gZ04MfYswly1jHwZzRXmJ+X4+z2g+xRLfmgaaW++E8iCaemDimTIY2p0KYK07YRd4CBX
         /UQe4WoA/oEkceyeu7JDQNJi34QCCpN1UK/X2uqvFso3FBXWlOdxWbN2QAAIEq53XLD+
         RajA==
X-Gm-Message-State: AOJu0YwY8VG+JbKArhIpLOgEVfbTUkAPU+pTrnx9HdglTs9n6KsTch8B
	TlQhX8epkSn0ePVX3T2giin7Sf3WMhDndjZ73dbQjQS8AqbqalefML1XcfY+cODu
X-Gm-Gg: Acq92OFcvTCW2zxoYwLWyvyFSwHPB7pbFxHy2QqMjU18+tfJyDiaE2WHUeGpfRxuwLN
	Ov1u19BrtT8Z+RtgHBw8tYAfgNuYYrynQUB4H/AILq9o2GCEVe+DhqJDrMmu9RBfRm9ju0CAmMQ
	LFmOPO/46+rYL4AsslbpcP5U3tB0tI9gckyXpr1nwrkZOhTTJ68QGoxSGBVIylIVpt19QKnwZiK
	1cNM6eM5EU3WtXJPK86oTTMu9PJRo+/MPoW5hkbmwjH7pG7c2eYafS9I/4H604S/Zrf/tNvcqYY
	3OthwFQOnuZFLw9ZYqo1PkbGTG3lrcWUZgH2A+7jrStBvSnJKZ/4gBgK3a+lqOdnU8ZzhRHchdF
	wN14TOkd2sAVox777T1+ZRJAa1enRta7h+RIzt45caRL4CgIaeRew4BV/Eh2dfQZoSKUOn5wlJy
	rd7t5trSrMR4UvfBIpHGURdIzoowMFo/PsrDzfKnqKWbwfqjH2mzJmgM8/E88mZp3c6HhuPV3EC
	Sg6J1v42ZiOwuxUnDawsdcDn+o2fiZMB7yMvbKFVXBRzxHoNSrjFuSc0sjbyUd2x+fV0Rh2sGEL
	VmO5HUvMbpJVyOiGzrPD3Yln87RY
X-Received: by 2002:a05:7022:ef18:b0:137:6781:7dd7 with SMTP id a92af1059eb24-1380670b7aamr12076752c88.20.1781059592912;
        Tue, 09 Jun 2026 19:46:32 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm17792453c88.14.2026.06.09.19.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 19:46:31 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Peilin Ye <yepeilin.cs@gmail.com>
Subject: [PATCH] ARM: boot/compressed: adjust Acorn font display code for added header
Date: Tue,  9 Jun 2026 19:46:17 -0700
Message-ID: <20260610024619.129261-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_194634_000588_3B89FC66 
X-CRM114-Status: GOOD (  13.19  )
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

Commit 6735b4632def ("Fonts: Support FONT_EXTRA_WORDS macros for
built-in fonts") added a header to the data for built-in fonts.
However, the Acorn font display code in the ARM decompressor was never
adjusted to account for the added offset to the raw data, causing the
font to display incorrectly. Resolve this issue by adding the
appropriate offset when referring to the font data variable.

Fixes: 6735b4632def ("Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts")
Reported-by: Russell King <linux@armlinux.org.uk>
Closes: https://lore.kernel.org/all/aifhAn2RMdxQ2p86@shell.armlinux.org.uk/
Cc: stable@vger.kernel.org # 5.10+
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/boot/compressed/ll_char_wr.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/ll_char_wr.S b/arch/arm/boot/compressed/ll_char_wr.S
index 1ec8cb2898b1..7f218e938865 100644
--- a/arch/arm/boot/compressed/ll_char_wr.S
+++ b/arch/arm/boot/compressed/ll_char_wr.S
@@ -21,7 +21,8 @@
 LC0:	.word	LC0
 	.word	bytes_per_char_h
 	.word	video_size_row
-	.word	acorndata_8x8
+	@ The offset ensures that the header is skipped
+	.word	acorndata_8x8 + 4 /* FONT_EXTRA_WORDS */ * 4 /* sizeof(int) */
 	.word	con_charconvtable
 
 /*
-- 
2.43.0


