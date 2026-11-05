Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q2k0X0Aa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zib6nuYW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=; b=Q2k0X0AazX+i/u
	nbF9GnIbrWJbdz00XO9vJg/geKyrhh4Bx+FIDQoKjMtJNsB0U/q59xH+uyqQ5J+2wSSaLs4UMOpe1
	a66erHBY7g+knsS7QJhVWwzTS23wEb6QdvqOGIG5k57+c0Cgr8wdpaBF/4eP3LH9uZ4Nmri6wJRKd
	K7Qh8NQ4Nuoc1mi4f4T64QX15FNO2WmJKPLWuNopGGuWerFlLX2T+t+TaR3jEHT1KgHEdFBTceLWm
	GqtFvwTxf1C3l7XqLLVbxYJ5d5R33VLPtJT55i2+pgkio3AnaeVi/9+MPRgrj9wZ69zPS1akV1hrT
	anajEgH5wrZciKo+pPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6o1-0000000ArUZ-2PqG;
	Thu, 05 Nov 2026 23:23:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6ny-0000000ArRr-3edD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:23:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e93e0d86a0so78265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 15:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921018; x=1794525818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
        b=zib6nuYWV3AV8MPhKuQPiwiDDZi8F7i5KVS5af6ALrvqndxLXD5TF7X+IonIT2HIv0
         j/Wlxa7idHr1xE1jD8tgoJMy+sT7FiaDD0bWWD9E9sa8Fr34bS8tABfiKJ3hKih0H/bE
         n+HVtlT0Qhy1Wxh6D6jBuZSun1OHP1k4cgcohnRXUd5mtno7bJhwdeMlChvEsM76mwdY
         cv85+3ZDL3OOBy5hzfy55ZpEgzaDt8U249te1H6SBkzJ3AL7Llwy/rfzkLe+16nX++Eb
         V/KPxLxokBTFRO+b17pBds4J/BoKgoZE8Imzhwi5LWXUutUpZOZPiymmL/bvVJLS4H7o
         qchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921018; x=1794525818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
        b=A1AthmnLjpJ/v1JZuMVE6SYnF1iBroeR4Hfg68NOMG0lYWH9jhBTivFatB6fSvl8Xj
         ylQSLDmhasq+CTZDwgFGoER9C2CYpNfVdbswPQIG1K9vUDTYyt8jmXYOeY8URqCYyE5J
         oV/uizYTh6gLulImJn3zM4CPXxmgD/f7FTIADC7HoHLkNVaYXBhRGNhAqM4ZJNIea1a8
         mm/LDbYVD2zrN3LDG439P6rOeOqKNAJ4UqeMQzeiAs0ngWG7NE0nJ0PyP3+im7igoXwa
         O3SSKB+L4/3hcgSlPA3P8kmXVd+yERQZ+6Tllj1tPULhlU/2p1EKA+E1nT3mSKim5VVs
         KVmw==
X-Forwarded-Encrypted: i=1; AKwUvBzf09xP5bBS8/7XGVTmQZoVNVLDTFHpyZPQwDm4SvFDLu+dD1voGaXvkO7r2LLJVSHFKtTeJC6ZTuuQJbkJz8g1@lists.infradead.org
X-Gm-Message-State: APuU4Z+I0/rrvJtxLGK2rRDwUDH0LUIjRB5tXzMaG+A0OorVsqpm5gLa
	DJMmLzVol4YTQLG6Ju2EA1nODbjYzp5eZHb8Ti7AHVApZf4rpOzUTx2S
X-Gm-Gg: AYBFou1gilrJ8UHg9ZzpJtpS/vmWvnUsjZBfcR2QJrVmkoqEbYXLo3s9mq3aA8fYIt3
	7U8+8LAV4vQQ3biS2hB7H2JLU+Lz5hnhG98YyFQtKDot+I/aYTin/KxZH5/7DMQtqaEk6Vcgv+e
	wjaQgau6IGy9lAAEMjs8v2uBoF0vOFIuyEr7E/JmaJI1dKMxXiPN8e5PqGMNiqzcsjhEnqU2ZoW
	0toXpDv1Ds0bZoQjqB1cnsopu01WdHKXchU5OOV3fj8a2TrbshAJVr1sFTXGZimoDfCQDSxmC5b
	xPqPzXNVPvE8tZRiecZH3nhV2Z6SBZZDngl1emaVHrKXbevBtyq0NMRULo4MOfPHTHsZ4f5dPXV
	WJo2IuvFuj+3yYLi28TO9hVVdvDutQb4Ay5MPOdeDFE2sHrllwQA0kZVyOds50hAbdlJIl5zCqk
	t2dTTevvQuXmKHql32XqyE6U5vDeQk/MiEQmklp3HgU7O0GCIZOmv4HmNbEsf2RiVAX+wfa4CxL
	+hT061CQyeK/TtnT1W8gOsfNP6tWB+zcbtrrHCN11kQ9kSApmNtRPqLK2qMJz5TFuZI24nYFSSJ
	RZPEw++xjahLI6W4xmTfAUE/xl5DkLQT6p77Gts9zrlVq7If6nNrcGusaYg0Ivg=
X-Received: by 2002:a17:90b:518c:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b0db6e1fafmr885341a91.3.1793921017864;
        Thu, 05 Nov 2026 15:23:37 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:37 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by media bus code
Date: Thu,  5 Nov 2026 16:23:09 -0700
Message-ID: <20261105232310.385463-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105232310.385463-1-faizel.kb@gmail.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_152338_908620_DF391142 
X-CRM114-Status: GOOD (  15.81  )
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

VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
although the video devices set V4L2_CAP_IO_MC. Return only the formats
that match the requested media bus code.

Otherwise userspace can pick a pixel format that doesn't match the
media bus format, and then interprets the captured data in the wrong
format.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../media/platform/rockchip/rkcif/rkcif-stream.c  | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..f2a24832a8cf 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
 	struct rkcif_stream *stream = video_drvdata(file);
+	unsigned int i, n = 0;
 
-	if (f->index >= stream->out_fmts_num)
-		return -EINVAL;
+	for (i = 0; i < stream->out_fmts_num; i++) {
+		if (f->mbus_code &&
+		    stream->out_fmts[i].mbus_code != f->mbus_code)
+			continue;
 
-	f->pixelformat = stream->out_fmts[f->index].fourcc;
+		if (n++ == f->index) {
+			f->pixelformat = stream->out_fmts[i].fourcc;
+			return 0;
+		}
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
-- 
2.43.0


