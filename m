Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13526606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ssNfZz6W;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDLgu3tp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=; b=ssNfZz6WZQyAbd
	T3T+9kYoKhKA/z4H5dK5jejALyqqSS+zPp3UOKdd6heRl5IrtgUyml0yCr+/ui68xjFPRGHxccm0j
	pS4OyxhuB4S7+bki2IpHKihuzB8TCd/0eJBW2fqRoNDzoU+Hu/9r90F3e6vtyjY36Us9CB69TIYkh
	i6YYnKhgFlrBzbkqURd7qET+RXD/Xs+WgOtbNmuATKG4He6LtQ5MyGlhnbTJjPkjNmokxlYAsm9zk
	A8X2TWiNSpC9BGxOn2NtihItkgxM84Ukjm1kX3juzW2sVSVH+iHThbHp3Mhu2wkT6Midj7CziA3Zl
	m7SA+8XOaFN42uU2/+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHh-00000003QzH-1Paf;
	Tue, 03 Nov 2026 18:31:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHd-00000003Qv2-39Lg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:30:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so38597775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730656; x=1794335456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
        b=TDLgu3tpqIJiAHui+Ok134MOL6rKHi6GrSBtYPdDK6yCwT+YWqWMU83J8IGsATtyj/
         hPYnw8amMOvTbA60ETH/32jPAw6m6BU1V63IwaVQ46wfbivhn76EeW4KwKSTyfjhG53h
         VPMO2sFGgmk0yQofJQYOYhpzJSXvYF/7aBkX9YDV5tKUhePacNh7KdrY5KFvZjKxjMXj
         52notL/sr28yeob7UiEfLe+fuHszjWIO2PY5RCtvydavNdX5q+dRCwjtA9vCptWbjTuJ
         ZM75TW3rXZTRS9AGd3wOpFlvJEcALiaquplHatU+kL06ti7giFKigTehCC1wMKH5UZ/K
         h4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730656; x=1794335456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
        b=V7ldHwUdYtfH5KHXjGlRi0/ubhrxJ0Ym9/Zf+Dkks7E+eMSgb0HJv/Ubmad7qvXC0E
         4YxNk49E9Bwq/HbdiXncwaJXaaVkyr/SyxjkgeIO5GLuz8Ga7D6BCacV9IFzd9OgjibO
         Y9cB+vH3rpwu41Vv8xuoJizpx85viwtgCLHytuE2g5f/cfiIa74dQaSqw4GhZ++eBOG/
         iFLlHfnfBAXEqXIf9WJ+7Krc6qg+Bs2IBkmEm8CojvzXkEsMz7sSTly5aPDUD/cbfpOh
         OjVD44/PQcfzm0qwGfhdY8YJBotIgAiiVkMTyDPk9f+2AU5kG6R0TwHUy/OWBhBvulan
         T+ag==
X-Forwarded-Encrypted: i=1; AKwUvBy/AXGiUK9P1E35xY2/2U10+tSwMh4qb+a6TvkqxE8AluSMZmLYZ/VXMm6Ih15h0Txh1W1+A/7oqbXppQcDJ8w2@lists.infradead.org
X-Gm-Message-State: APuU4Z/ilWcATiII767qVqfHK5USCiTHU0fsGgQZxcpbumRuh8z8ArmQ
	abfF+DcjquxW6I0BoZDayNqL8taRNXoORU2vq3kfCvxMCPzdFehbSact
X-Gm-Gg: AYBFou1va9UHJ6ze2Q8PZCKDt8J/0yIElOMWrBTLriIGyZEQavS/X2SdWw4AMpsIgMg
	YqsOvrML+2X4g+L40ahxEf96N80yOURaewJ6UMq04K1OMRyZ3c5/hmNbnvwZFUagZXCLE5I481m
	dUsy+KWpspTmPD1g2q1yBlIt2389b9lZvc9LQGUB0KQjpfl0IKFZ8sL+WBmUVLjgxHSAT0XpzMY
	yQGpfbIotMKHToRUKQmbqe63iP0/W0VbUMXLpoC0eirD4MfQDxk32SNguczHeUjBxAEyOnJYLPW
	rid5OleN+/+//vTi5McNWLDOwpWzzL8q7psBgVC0EKfD3ms20nzxIPkZxJ1NoMewClIccaX2LUc
	vJsdUAOF1WscAouegMwYf38aY/TZSv77mYScrPN4R1VJU1K8LTRxf4/kcgq2liqgBLZbumzA8SO
	/+3MaAlwwvwVoEC66MItKMmIh8rVezFSexkLjHc25qKrzR8jgLq0t+2xIjg0CrINM4hLMRU3Gu0
	OV5KVagDB1lUTBFKVQ82eqVZ53Dwyp1c3QZv5qEr+kMJD4vzb3bqmQjrlGw+NRWT1ilVnU4BcRb
	eUATF07tEpW35XZJ5s2NOPQgKrNahap3gceNaZL9gGcmY+Ho1qdN4p2ps9K3F5WI16DfE/SL3VU
	a9IirJfFzYq7Yr7LIBUd2fbw7yrbqfhWXhMWFSw44n2/vcUbOFmF9mo+pnSz+C+1CsoCyK5V4gw
	8em1QUqaptnvJkdQSz7VSurAoPh38gsAT4SK9aVoqsTnqH/lWWjIomTF9NukvwrkVnUrpQJCiaz
	y7dXAP+6GlT//eeam3kX5ydT9s3pmDFxRhqdeZXnnoUdvgsmw==
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr329609245e9.30.1793730655752;
        Tue, 03 Nov 2026 10:30:55 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:55 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/4] mmc: sunxi: Distinguish CRC and timeout errors
Date: Tue,  3 Nov 2026 19:30:30 +0100
Message-ID: <20261103183030.81078-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_103057_804736_F7EDB0EC 
X-CRM114-Status: GOOD (  17.12  )
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

The driver reports every command and data error as -ETIMEDOUT. The MMC
core however relies on -EILSEQ to recognize CRC errors, which mean
that the sampling point drifted, and flags the host for retuning when
it sees one. With every error reported as a timeout, retuning is never
triggered.

Report response and data CRC, start bit and end bit errors as -EILSEQ
and keep reporting timeouts as -ETIMEDOUT, attributed to the command or
data phase that actually failed. Report any other error as -EIO.

Currently supported SoCs don't implement tuning, so this doesn't change
much for them, but it is needed for the upcoming A523 delay-chain
tuning support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b875ef4c2b79..eb1b7883a715 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struct sunxi_mmc_host *host)
 
 	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
 		sunxi_mmc_dump_errinfo(host);
-		mrq->cmd->error = -ETIMEDOUT;
+
+		if (host->int_sum &
+		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
+			mrq->cmd->error = -EILSEQ;
+		else if (host->int_sum & SDXC_RESP_TIMEOUT)
+			mrq->cmd->error = -ETIMEDOUT;
 
 		if (data) {
-			data->error = -ETIMEDOUT;
+			if (host->int_sum &
+			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
+			     SDXC_END_BIT_ERROR))
+				data->error = -EILSEQ;
+			else if (host->int_sum &
+				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
+				  SDXC_HARD_WARE_LOCKED))
+				data->error = -ETIMEDOUT;
+
 			host->manual_stop_mrq = mrq;
 		}
 
+		if (!mrq->cmd->error && (!data || !data->error))
+			mrq->cmd->error = -EIO;
+
 		if (mrq->stop)
 			mrq->stop->error = -ETIMEDOUT;
 	} else {
-- 
2.43.0


