Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E786070D8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NfNQrYuN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXVNPUje
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=; b=NfNQrYuNGmUCJl
	DdA4c2qqOG0yzZZJ7HLEoNZjnX3B1W/W0D7QsQ0avFc8GPBiUBi92D/kP1ygiCRr5rGDUbEQHHJ/4
	47YOOmhKpWiXqRITuLgZvEhn9oE8RvuL7X3x3NGCGSPjCqFEiujfW7qMisInhBqbG/Fz4u0lmtf4F
	T+AiYd2hjG2moCmWjxz6m6JJ2OGJmGmyWKazCgd7VtT7voUpLvVklUbX7BRhDgcXemW0da3K4ocuE
	eQCJVs2r/CYvlKptYHkbRLNc4T8cpRDOWAtN7hQSniQFUgvJ/MV31tAXd/EzvOs6qOBc+Owoog1N1
	bgoDl8MVzGH70glvwXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRZ-0000000HOTQ-33lX;
	Mon, 02 Nov 2026 17:03:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRU-0000000HOIp-08cO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3347108f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639010; x=1794243810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=MXVNPUjenkNZuDHF8+VsORU8tUwCzGxJuLqUMXdo8D/4mcfvzlh4az/JCEg957OFXW
         tOdrnBJH6Rh4EUXDARW5AJXrW4E0ArRACHR8JJV1+9gDN9o2/ChxhclJ3uO4oBuENI84
         QYSYNwW8OVNtqIxk3IfKyho5FfIv5D5yChfF0uut6kb03TLpJD5KDiqJTRQnwlnmTkhw
         3dXrzw+muTyp371gYewSghOzF8xn+2Y7K7hp2fXf1IXtqbU9vwLPu1KZHV89VbyIHp9P
         cGz66t3KT+mChpBQz/IbgbsnQJKT/oW8buNbP0pCYh+d+QI+fTkfK2HynRpyel+Q7JU+
         l6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639010; x=1794243810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=cNI+pPNS/eO9uElHwRMvRALmYHBCk1FXKQc9WIkQCtg7rnVnQ2eFPH3P7E5SjLX57E
         +rWYyXuITrtHipa3qqA49nJleDX3tsPWWLNSjKsyKKBKdBWwG5O54vlrSHZ5ubOnLDLH
         1NH7CWwhF8Ec8s+374SgeBL2Yaj/6Zak+przypkgNQyLPWWmK0QGde2JFjVdFnwQXj+3
         f2h7Hcy5OZusZwrO8luKeyZsiTaJ5rmZhvYu+hPDdjqYbTVhLbqfqkZTiKw5gr9Q+vDa
         jvAQ7XpEnzIcJFCPZQ64k6nTlKdNadO2YIdpqZxyzdSvvrorqOhw+33bFcxrbEYIrbLd
         YyEg==
X-Forwarded-Encrypted: i=1; AKwUvBxZsRy1rjw/QES67yvbYNG5e7lrhbYXzMhAtR9FcEJvfK+jWQfz3Q0hBM6Ra58npv+n7fjeMyVmsv1kN/Z6tn59@lists.infradead.org
X-Gm-Message-State: APuU4Z8lh4suod0ybkv85iX1jmIcfvL9o2/q0jQnOFwI2xZA7lg1E/wK
	lpPLTJ/zrJCVrVynNiCylJ1FRUTatU4pxRoRdC7FGP0L22i5lZEtFZM5
X-Gm-Gg: AYBFou1CD8YLpNgQkAbwITvYUNFYDS5P791fQVwrIH9PrdA8PRSGuFVOschmu1OcUDm
	fZUBZniTAsQKdt3ARv/CrLh7QldyO89HfMgS6RQkUL8UC2pVMGgZoXAziwe6GZ54pdU+Se/rGCO
	4Q8qpEXU3sxIO+6P2Y+229H+s+fzxStsTwOj2Cv6er6dEDauj9AygBmFelIclnznKzoMRdtsKzS
	K9XTBfajim6BLWkJM/tg0GQc39pBLEjHTmkxFozKtVi2TvnTNv8XoO46uMkjkeWat/tIhXU81qZ
	QUjncIYLmtIYFOTSrsTcpjhiz9dBCeOR4qkjLzR8teq3lIlh82UTSe8EWw7P0TWVvS+uzID47tn
	HTzdakSWaiDMq70/YBB7pCywXiQVoy8qM81Bq/44ldMjZphnnyuZH6cxMIwuTHjofI6wXu4zJrm
	qhHQ4Hkkq2mJwsc//7F5/DkEb1C7t2P2aMImfrM12p30S5F+sWq8cErYlvdUewgGpkv+dT6qGvt
	b2E2jCg+WJOQfu0vqKTWM2zWTt5Afs9nkRstqefuQjnQRBKRujhH01PUpYwuus8ucQ4KXtrYv07
	LKDnHmmI1kxsVE1rlMQuu/qkqKDPodvAgH+H3PjZQ9TmPBuXSbcGh+06oYqTAfGE1KneG2kuQvb
	ThMwghBLZvQaJXr1AcLlBrJXD55lGsj5fKid3k9m8pI9YXvVPfpWulXh8JTNq1fSFXLhrz2LmQt
	lF6Cq7/EzrdubW4rhU5BoMERQ6H0X0Y4h/L7T0BTX6b/ulTZI0ntiQjH09TMN+0KAGOTnfZ5njQ
	+/L/w+u877VTrC89iTdJVfsB9SXuowGBti0AvzozxMKbYU+5A==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr18919618f8f.2.1793639009894;
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  2 Nov 2026 18:03:01 +0100
Message-ID: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090332_519038_383D4863 
X-CRM114-Status: GOOD (  14.98  )
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

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..6b00efa77c22 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -25,7 +25,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
+#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
 #define VP8_PROB_HALF 128
 #define QUANT_DELTA_COUNT 5
 
-- 
2.43.0


