Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19804606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qpe/D+Co;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4mBNX2b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6mn1Ww0z7f0hBkiKdxCSd+R1mw+SIqi/8v/FSNDtdzA=; b=qpe/D+CoX8OnII
	dV51fT0GmKsShxgU2DZSG0JvQGdzIoDR+xWuAAfQShSuRUwtFHJrGMGgoz8cRuER+CoJRjUAr7AuH
	xR9opTZrifo2CC/1XLYsXzNvu/Ah5cxv3PpjYCOtO3aoSztS8d+swaVFIjljl9nvN+YeL16kU3Hbi
	eXJCi1qnrsXUTd2/xpthycI1O1qkShrEwzwOzK7Nu8ufRfVNRPnUTqfKwIBkJ+IrVkafrg9/a22VG
	Ma7DAcvN24hqbOmwoMjWFm5BaWCnmj9Zxs72vCaGRSsDSDa/gcbb8M9gWt4J+Eh4WCS59e1nFLqB9
	YeU0lyoSPcHpZYvBcdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKxW-0000000Gr9x-0k2G;
	Fri, 23 Oct 2026 19:29:46 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKxL-0000000Gr9V-4AHr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 19:29:44 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3282db206d3so1235297eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783775; x=1793388575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mn1Ww0z7f0hBkiKdxCSd+R1mw+SIqi/8v/FSNDtdzA=;
        b=V4mBNX2b6slgRxHt7NFo0io5HRg943jXPukHqSKoeIW8/DyPCjT6tAt6O18ONQoi3g
         218yZV9DAcsmrcTIqFFkhLDif16JlQCNz/+3oJlJWIdVZfz/urmpqOUqTpBPpPwbknqt
         zOQoC5/teiPtDzXvTQFYkI+mAFcTF47G6O/1/soJEcOZRP62+Y2npuylUTGuDBjd6yN1
         SZPkwxv2aT/E/ggJc/hNDw2W0ubFDN9fMD73t51hEbl25vAH1uvdbhm1dTaRkwe2j4oO
         9IpHdKSjPyTkxXL25789rG2uE+kuzbqIJ/cM3Q/P8ZL1qHZXiv2VfYcnFlv9PyFQcRaa
         vGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783775; x=1793388575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mn1Ww0z7f0hBkiKdxCSd+R1mw+SIqi/8v/FSNDtdzA=;
        b=pdlb+qcJpjLQBy7rXrFC5uWysvX7vAEYL2WedcUy10WTQbQ4BQuxAVc/1xuZNdjKnr
         ppFAtTzgs4AgZLF9rTndazmmn19BVgFJjkvN6Nes3Fgjza5X/tI/g5ZQpsWAc6sh5S4F
         y9aA9D4LoViyoGomq0jHOJuKGfJfRS0Tl+mbPaa9KJBLkWHpT6CR8yQE7bpRQwfpAha/
         LL5q2eyJk4T36yxQ13lfobm/KqrrVN8buRTgKTFiBnEZBXztJih6NauVKFPU0FQkmybe
         couLWryaohUbRg/XBcUgRKo1WdVslT20rgwirWzLYA3OZ6ufzlKoVUu5z9LW655Rl1Xk
         CN1w==
X-Forwarded-Encrypted: i=1; AKwUvBzmNIxNAIOe4obyGEKy5RKAZEpWS6HZwhvX26X+oq1yC+XTSo2NrhFtQg+iB7kfXFk9VTGbkhziF2rO2iKDAVaS@lists.infradead.org
X-Gm-Message-State: AFq9FYKC/LNLCZwwqsd3P3syBH8iNmIzeEW1VUF6OgsP7mIFERZS5UEg
	+MDYLeYfy/kJp/6voVZT+GbYts9zCT7UyHnnFIVd+7/VswesNBYk/g4D
X-Gm-Gg: AYBFou0HKzCcblx+O+LzVskluSHE3JOZ3jUHm4rmBqZvRL8edqOO4Ue/GLw3VL6mYz/
	xlsTwpeQ04R1iAE8qBe0sIO/Zq8t2IaStnsXaHgucZMPQsURP1uVy6/n3bcnl+sxmxCM8VI+bOI
	lWmgtUDfRN4B05TKiPYFiC8rCAXIxZqqUIMeMRjs9ubpVMfXQpYpitjP2NioctFnXsQribXYhiX
	AtisahZDbIeDs+erW0a3+Vi6bddkgflF0eYoHEqYKkA54D9beeaC1NIO1ulTW4XMt33wKRPozOd
	d+ulIYXSdbGiFJa9eSa5douo7XvWI6bDGyFfV6DljVEXRH+o26Wlxt6MrmbynTpCIdZzgtKOa+f
	94s7mabOy99CILE+7h8tBcxxKVLaYZoJpsSKza2oDSMUsQxG05m/CcalSFoJISPmdV49gZsjxpC
	17mySGCGu1WcEuxg77E7cuKwTejF7ZRM/r+LrjpikH2N6rlO7TDPuA/aJKCRULjrgsKPnISqMEz
	hjMewt76NIUGOqLbTZIGSOik/tMqKC4E/D4RRgEE9nw/U6lxMEUAEwLdN1hPNx9Gyt2lx8lLVJs
	y0W8DBEperf7FIjd35JvgAMdfrpB/lNRx365RDinkTv/2c3eH4caCzMA9g2MSSDwa6f2hCITIDb
	W8fJRSePsfjI=
X-Received: by 2002:a05:693c:69db:b0:369:8d31:a902 with SMTP id 5a478bee46e88-369e836af38mr406889eec.2.1792783774526;
        Fri, 23 Oct 2026 12:29:34 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm381308eec.25.2026.10.23.12.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:29:33 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Sat, 24 Oct 2026 00:59:26 +0530
Message-ID: <20261023192926.228467-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022140615.30710-1-kapoorarnav43@gmail.com>
References: <20261022140615.30710-1-kapoorarnav43@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_122936_037955_B623F777 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 07:36:13PM +0530, Arnav Kapoor wrote:
> ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
> ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
> channel specs and lets ams_init_module() fill them for the AMS node and
> each of its children, without telling it how much room is left.

Please discard this posting. I sent v2 again on Oct 23, please review
that one instead:

https://lore.kernel.org/all/20261023185652.195025-1-kapoorarnav43@gmail.com/

Sorry for the noise.

--
Arnav

