Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46939CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=; b=IeVg/O0AQP8lsJfqJZiTBdtEvn
	S1Wujx3/w4EjiOzfsPzoMXc6NPHEJhUh2tdVuO6K9rwEMX59k551mlFxWgtdegt/X9HSEUBk+pudn
	x7HXrWuZuDQT4up56szG7qKnXMWvpZ+A1OOSCCdE88MweMro1+1D9QBgybKLjkOTRlH3nA+xKihfC
	ivuFz9eUx+kqu9V4W+E0z5SB2PXwJzGF+7S3+tJmUjVTwhKEX0ZggN4srpfR36iu2myXG6fhdQJTR
	UXaMsDjxH6q4bJP6IL/+p8rstPW99mi8TCQ71+JxjxrOJgaNs00L1u1UKrS4QsqxviY4tl+KJCgZr
	IKshdphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqCS-0000000BTl1-1GUV;
	Tue, 26 Aug 2025 09:42:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq0z-0000000BPFS-2ZQg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 26 Aug 2025 09:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=; b=mkpTO76eYbkhyACliy9Kl37dTS
	ABDHE4jr9A7wdrysWlNCy6pJdHSc9KFnQooWjs8BcYuyCVViAp+EKIFKzEAJAsLvxNG+8QnXuCGDZ
	PepSlH/A+Uylc7wObLNy4/5z60l0b8Yz4oj8B19HEXgWi7zCn5lYBr8AWNX707MBUdcDj9Uo7pOrt
	P/nPKx8cCLX9tszS/JwIFCIYXCu3muNq/jrD/sf+xxWjWg8dTpRsydCht3FcGPcVvFEW468HrTdcj
	QUgy0OwAQUBLNQnJEG/MKqjQT4ld/PkF+edY3EiDN0dRA3Hl6QbVrznOPTRVdRo17woQyNwrG6son
	HUVDFuMA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq0w-00000002BbP-0ZMf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756200639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
	b=L/qxDlLnX01FksgwJsEj0cGh0uxaxm/xN6D+rG5fVpkXw+fajtudzVQYhxgCH6E6W6z+Iy
	sz5w2DgSu3cGDdkYgPiuWsFefpYuJVccF2oHmmN2+NluUqZhL/fB+cJXU27jQWn7n355Bt
	gKegJCAXIYO6XxiCjIacMjwiAx4AGyQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756200647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
	b=KKr9yxWGhUDnf3ZJ4DJsBOZxBiEt+sGpGb4o0SKN3u5ucUvUWlkTDcIOtDtt7GhfQVj/wZ
	KEnWyEvHk8JlSHrQ0OQWtqsWUq0EHvlTWLrh4NwRToNbfd25ALFLZRz0Q2Aft3m9rck/lg
	Lv+0BvvVnDdxDdj34KgxhO0brCdpXSE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-_TGaNIykNSSA9cFul2hy0A-1; Tue, 26 Aug 2025 05:29:08 -0400
X-MC-Unique: _TGaNIykNSSA9cFul2hy0A-1
X-Mimecast-MFC-AGG-ID: _TGaNIykNSSA9cFul2hy0A_1756200548
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7f2942a1aa1so355290785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200548; x=1756805348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
        b=MbS+0TWgGHurMF6yZ+Y3bjEi+Q4lcpeHT6xVeRATiy/89R/9/io8598L3SAIReYu6H
         4OeD6j6Ev73E2ow+ZTSJByqTgI2ITHTyn0RM8D0tUGA7tvftV78PFVHdpfBUr22wvYOF
         hgEZW0WaFTb66wtGH+IMjtJbq/2CJSv+3iFdGvoNm/tkoGDt7OxJaOn1ugWRqzObs0xs
         98K7tsOPH3CmLRYVAb95D9HbNnEVXDF7Hru9JXrE+myxS5iSblXFIkJclHDq4MCdLRFx
         xNG44DuTvJ5IKcjKf/u62L3Ah+CkPQcSijsK0o8piHQPLR82ysLmng7m+J5URtJuH4wG
         PvYw==
X-Forwarded-Encrypted: i=1; AJvYcCUNA3vz/kNpragRk37C/4JNeHh8YPNvXvyjYdzkh9GzA+vGH/7QtyyFqOXCdc05J/dUU6mMK6sOoVVmx03aAr+r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3OXDxiBY/HtQaBuVtLqEbxMPR63gtt/otR27GvIE18gR02gi5
	TDsg9+pQfioGXNG63M2hsbRwSEJ1LmuBJRPzi8YG4w1JIN7Ul8pJg3sbqd+QRLA+DAlbqyOVeI5
	U1YtBoGWswNK2qrB4TXH9cYs+SmGicEru74SDvKc8wXJm+Kvobsp6c9E3d3+5xDCJfKJI31Y+76
	OG
X-Gm-Gg: ASbGncsen1NkxnsRTVnqkJ7Ym3dgbVhF2HZjm+g2Gs83pV7Sm8ZvmWkL0XbsXDcMxhs
	4hmYsE25APuPHT6PuKoJv6weAKPq9vmnfSD0teCnAmNu+2vR71Zg/AkstQrAvBH/Jit2C1xrOTA
	/9zcjqG457YejrFHYqFXRBbNFHy4iolQh6yPeKEliZaC5uS1sttc1iu4UTRt2HazZUIgVBnJtFU
	g9fJdnp/88ZLEzVxnPdRVOgrlG5cpVFEwAmcv0zUHxO//3f/Qq7CUbFOslLypciRgUyiaJq8SKa
	v69kqJjmjsy+KtNfn0yMCOoUqxbNFGz0UMBCeUVFluG5Y0rA5jmvsUQ1biPTGu0i3VIC7MqU8Hd
	hS3eetPwUyg==
X-Received: by 2002:a05:620a:471e:b0:7e7:f2a2:251 with SMTP id af79cd13be357-7f58d942015mr57565385a.27.1756200548189;
        Tue, 26 Aug 2025 02:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpr7ArFXT7ZO1WWZDThLtmtRC02lQO9+8IZq21Q57x0kWr/JgXF3wJtr0chhDvtcW8744jFg==
X-Received: by 2002:a05:620a:471e:b0:7e7:f2a2:251 with SMTP id af79cd13be357-7f58d942015mr57563285a.27.1756200547767;
        Tue, 26 Aug 2025 02:29:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e3csm660193285a.4.2025.08.26.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:29:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] ARM: imx: Kconfig: Adjust select after renamed config option
Date: Tue, 26 Aug 2025 11:29:01 +0200
Message-ID: <20250826092901.43141-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mhh6n1pn8967KYvsMqIkfogEu2tJNndd3Mejo4VG9ps_1756200548
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_103050_426043_39904E04 
X-CRM114-Status: GOOD (  12.98  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP
PIT") renames the config VF_PIT_TIMER to NXP_PIT_TIMER, but it misses
adjusting a reference to VF_PIT_TIMER in arch/arm/mach-imx/Kconfig.

Adjust the config reference to the new name.

Fixes: 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP PIT")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arm/mach-imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index dc47b2312127..6ea1bd55acf8 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -242,7 +242,7 @@ choice
 
 	config VF_USE_PIT_TIMER
 		bool "Use PIT timer"
-		select VF_PIT_TIMER
+		select NXP_PIT_TIMER
 		help
 		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
 
-- 
2.50.1


