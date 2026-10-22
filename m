Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9314606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 23:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWapRRQ2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TGSmj45o;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dwq9ZrOa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=; b=zWapRRQ2hjB14l
	KoAKQbdKt5kS2npJk+OhYu43wHPKqyb0aTlqcLNPhlOlE6PeF2NhTJxOqqQ0EkxrNGxva5MTQnx7j
	opD47SxUu8rH7ZAyL62+h7pvjhJAJXeHqf8eaM1/UXslbKrIVd9ETQj30QUifKYE2k2sBN5HGL6lt
	+j5nOy9aWVzZLgswsynPYCzn1lTWxu3GloHGQ6CDXqyeGoflv26Tg8Ef8qfqxiC6wfskWQLDWCyxE
	37UQJujHB0CCEqqriq8J2S4eGp7fDXIXo+BWLitT+lPOCB66G5N1kY2LdG1ZjCC72EvZSIslxwv61
	vgCs12TsO9QBw1Yer9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1mb-0000000F7xn-1A6l;
	Thu, 22 Oct 2026 23:01:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1ma-0000000F7wP-3Y8e
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 23:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=; b=TGSmj45oeNEIkKl6lc0/Caga50
	8OEjPLsZ1r0gfpx5gUbLBSMtFkk5Q2GXZgy4hH0z8x2/6A65wUSxOlQOvgJ8DqlLw4kT2LuxQiW/t
	212U/6AGpczttwlhJpRcoe8y31VfIkzQvuHsXbgi4khrJzNKm+JaI9QY/oSzjp9gFWt1YrPM/Is1V
	ExdR76uUAUnWvyKGllJcBTtO6CmjQ5BK//yXWqxR01VUm8AnX8jF/aM5guZo8+tiK762+PkIV2VES
	0YHb94vNg+8QmmKJeaVi6/F3snqIE1J3Oy5IheMX2ByIl2PrMSUzNuhIsBIYejP2Dl0XsZv2y8B83
	jQkvFzQA==;
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1mX-00000005JA0-3HrK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 23:01:11 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-99075306daaso199259241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792710066; x=1793314866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=;
        b=dwq9ZrOaIqtp/Sm8PvC+uVDeoF3ZbLyMKtPcIJ+W8UkYWe2aS5sz2b1u7hif0k7HJa
         /BpIqByaPALUvTzewenoIgkJUVdTZ8d3QOOUIYOrYYsYU3i0lE4smxDyBIVH/lZGFh4X
         u9Tvr/bsVGZ8lHp59Wild8xem/28F7ghBlXhFVNj8J9eG5C7M41tGRZJLrrRD7DZdR05
         wXBdp1vn7r7s0GyrG+L52sziDzDXZm0YygUKmb+Ej/A/jgYy21/nL9MnK0PxCTHxanWt
         kuHnb/AhImuT/N1i02JFEXGFfJ2X8knKOP+5Go9YoCr70IrOjSu7/DEg1QnkqWyHmZnT
         J8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792710066; x=1793314866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=;
        b=HhV5jT7PGry1WKdnnlR+q05qDUEMIe8OVTwb/tErMoJxmz5Y8qw4ztX4f4dis4K+IU
         xdSolzTS4xncMFoKBGbgtf6BKYHPIOY+Z31Xu4+5d4E6EgRhJZvWxf37nKAXYtMWa0uc
         WFMamlgyf9xs5aR1CSlkFx7KwSLX4JFUX8GKLuJEeYnWisrg7ZWOC9aG9wtbp/PBpMWR
         D/ScQybQvqzxhWNxsgvndqnKCpjxlx9py7zoV9e+XvJ/jdrChlSAVD+9ZCBMSDxkJAFH
         MDmDcykWQ5oGwE2ESJvF21LLffXrNJETi2nC8XQcESERD4xuWVfV6s0lG9fsgqwE7J30
         pEGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDcoApHPGAO5u6wmskHm4YpaN+OhPwW4jakDPF2jSXA00dv2by/R+V6eqR7gN42t+Lw6kFNO9a2yN4kaNIj/xG@lists.infradead.org
X-Gm-Message-State: AFq9FYLtQeyfDYEtr6jVjRSnXLcO2lRQ5Q3L7/gNgCf6/RDltSeFLskC
	QGT91w307nt3rQeJW/+VJWTCvRQRL+wEPLpAVM+Y5bDvw6p4eJ5LeoMs
X-Gm-Gg: AYBFou134N3L3KUileVX0fIOQow69rEqUSXg2pGye90JT0MHBKimCytt6yzNjWbbG2u
	xFiRbWdMefzbFVnkFQ7xW9a3gAn8nmaKKKXfR5Ij6Q0HWmLxXef1T3RhP5TRbLQ438ikJkMFz6e
	stzM5BrQ0mYuIxzoz9CuN2iLMq/QwfiDldzJwmMhWUeQLH6U3KIheMkmgj6ASGKJfrp+2z8xhzr
	e1BUV17vhQbLIHopSF3y+UM3BXXBd+hEohBKUFIWX/nfybOYXtjSIkJhStLHppLi23JxwkZtR/S
	rqEOnkuAO3cvhqzA4WNujsalRQPUYd2vbNpnVZ80gOv9iBjb2AKJOzMvbXjwPyfkwZ/0cNMKAHS
	HylT/fdiaHi2bBvlLjdHSu9fWwo4mGRU9AnHeDtm4DP1w0wdndS8+SyesCucPX+tQiyEoZBCNmx
	mw6LYdxGSQLbalsycgfcHC5vvAufjiYHmWuUCcNWhCiuQIT9D0XQc3huZsg37yNtAaBwQB5hFv0
	fMUMu/Xyv4/nK7bjplnM9PGgDT91hjLbAHdZ6YnuVgrM6NP39ncCekogHq4QPDgzei+l+3ChUXv
	57kOxwZl6x2UQrVotFhn
X-Received: by 2002:a05:6102:26d3:b0:7c3:7286:c291 with SMTP id ada2fe7eead31-7ccc329bc4emr420829137.19.1792710066358;
        Thu, 22 Oct 2026 16:01:06 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc1e7ce72sm1245236137.2.2026.10.22.16.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:01:05 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk,
	Bart Van Assche <bvanassche@acm.org>,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 20:00:49 -0300
Message-ID: <20261022230049.95290-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87o6clz749.fsf@trenco.lwn.net>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <871p9h1kc7.fsf@trenco.lwn.net> <87wlr9z8iq.fsf@trenco.lwn.net> <87o6clz749.fsf@trenco.lwn.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000109_898104_6986DF75 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan,

Understood, and thanks for the clarification.  The maintenance angle is
a better justification than the one I gave - "this file has accumulated
no changes since the Git era, so there is no maintenance burden to
relieve" is a concrete argument, and I accept it.

I will leave the decision to Bart and the SCSI tree.  If they decide
the churn is not worth it, I will not resend.

Thanks again for taking the time - both the technical points and the
process correction are appreciated.

Breno

