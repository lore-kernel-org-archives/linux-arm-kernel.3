Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D29606A914
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YbjxoY1v;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4OJZXIW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=krSjybW9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QQb80D+r6JfVtoptDfuVmhrS3wB+UmuBb1MfOz4BLGY=; b=YbjxoY1vsPvC/rWAcgHcKMkT0h
	M/AJ9ufRmi36ndYN+a3e2+lc8TXl/db5YQo+9nFHbtiK6J9RtHSvd7t/OJ9zUSQHak2jhlXOjAGM3
	B5pn7vEgysNu/ms2hx9DUK9X9yIRK75aSTY1AMYzQrhTHTXcNozAcXo80qclvDmv9TIMoqFKHQCkV
	WitX1B9U4jfHw8pXbmfHkDc5yoMXWVeuY/b1ZuM3I1WwXARzEfgV3L710ahiApi4Mu5fyKZpw5rbv
	W2BQ9V88cyhmDsEwGUEr2J5dD0WBZas7SfLSXA8phPyEHPRxw/SP6d+LixDNEUiYauW5ctQAMu2s8
	uh5NAXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvz3-0000000HUBM-17VM;
	Mon, 02 Nov 2026 17:38:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvz1-0000000HUB0-2uIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:38:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HOteV1332713
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 17:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QQb80D+r6JfVtoptDfuVmh
	rS3wB+UmuBb1MfOz4BLGY=; b=Y4OJZXIW8FpWB4DnmBXq4AN3OSebEVwtFzeaow
	NOofCoU47R16luZzgkAyfq1If07+2c6tZgbBpbdAsm7mpy0iXzAYCuR1f7W1BSjq
	YMrZqhVyg9Wj4Hcj0R4oBRLiWpfd6w2ddc456HZbW41ju1hJWfFS84F6ReteDjtM
	KqYqyK0QPC3wOAZrgUWwqpxFpSZCygtw26KHSu2NmPWFPQWfLrS721W21L7dnUZ3
	dvlKXU5aNRAJLZk75LTE0l7WDnidZvgmxDML058LG1P5oZOqKDgc3XOxjsvXecT4
	r9N7Dlyn2622O6Zhjr3BOyaA/80urhl6sEh6i/g83nilJ8RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1ty5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 17:38:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso547085585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793641090; x=1794245890; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQb80D+r6JfVtoptDfuVmhrS3wB+UmuBb1MfOz4BLGY=;
        b=krSjybW9bbqZ4ocAKuH7rXlwrEzkJzCaUYxx5Y3QjL1+b0WfL/whPy90t9SQabt7fW
         DnvHk+pPdTE5L14A3/jCXD7mf9LtUrtc9y5vedTjxWVT9HWq1srPANzzfC5iY2G25dV5
         gl7JfSePHUK8Jh/YMwMtesyfS5GA1uOhMO1Ye8BsD6P5ZHuXIhUvyfXf+zRNFO+XXwsL
         SaerWvPk00/cDPC07Ltl2BgMNgg6Nh/1Es5CQIUFw6rFQ7MlnubkYr42Yz46wGzY5iIP
         HKCcrn22owF9AztdqyunJq8AJxcaXW/tw77h2JpJYPJHEY7wHjwJPZOv0rtuGBkrEMq8
         +peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641090; x=1794245890;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QQb80D+r6JfVtoptDfuVmhrS3wB+UmuBb1MfOz4BLGY=;
        b=ubfXWDBMTYmNs5sY3jdZA+HKi3yITUKpRgumD28Zjiv91cyx2/FJa6F/bPxyCoU8Ec
         mvYAa/yAf6ODVKnOdUYw8kZFJ2kG+dm9pNhklZWE8CYNlanT5Od8Is9Axw2Pte0FfOmK
         PanSrYEqUgiXeir7lfJAnb+YyoUXXdo6+aoDPiV/f0/l+48fCDKZt1TU3+NcELie/xfS
         X4N/wL0BF9uaXmsIUSdPlRuZzqVQ85YPpqxKasY+CW4eWQw4glr8oliRu04gQEBtK17d
         XkY/0JL8xsPmoHkHQK9xYn5LupkOM2HN3t7JRYw5KTwlmERCjNmxP4q3qzEISB5Eamu7
         bN3w==
X-Forwarded-Encrypted: i=1; AKwUvBxAQmWligpsjxkbC1OykaYqPWOMlPrWVzhCjgR29veG3d6n8E5G8SwYEHHWuqzLwXUM1flL4JA6ThppEfJKA6Vn@lists.infradead.org
X-Gm-Message-State: AFq9FYI1AgdWcwCrSuw8DCabOWrMljQoZuHCvpb9QB7KnEiA1DQ3srUe
	NnxLHAKe8YOyqf9/E0l97pCxTdtQx2c3flaqRWNHFJIK5Dvf/D4pRo8xKY5neKBSz8FxMtL59RW
	7/pY3/hTrst7445SbnCh8kj3XAEcycD5B3futhOPw5BOW4lV45+KywFKPFI7nLsFgRjD0x2xi5x
	8Cyw==
X-Gm-Gg: AYBFou2OUO0YERZnGyqJSdbxN22Iaiwn5LYA8jc15HVV6srtASr4zO3ofdTRtoYh4P9
	bzF5xfCZAjVzlfngvPMu5PmXLiQ1Vh1tC6NfOY4eIqpctRZKskIwZwzTBeucilLy1015KXVHa8/
	seag72NVVoMCiLmUMhS4aT4ATkSaNb8r7xRWZ7aNB6JqVx0oCSclCwrOQdHNUHeBy1sH2nMEvoq
	wR2GKKgJqo5Kb5Ek0hyagXDTtYnO6UNpsmbzrG88ZAgmooTtA6AxGh4BFONSdzeL2h8Z+Q7xUMq
	hsxP+6cIob76+yNH5vcniFdoc9QOSw8NVvmStjQTbXYLhj+ZOQcSWNH77eUy5Q2wIvEjN42RbSa
	x/slLWMQe/qRhYQ5l6tQ2xk7/X8yLEmMpjBIL03bQbELfccBQPWjhaYECrHlHiXU=
X-Received: by 2002:a05:620a:19a7:b0:944:110b:d824 with SMTP id af79cd13be357-94421581772mr1756141185a.5.1793641089819;
        Mon, 02 Nov 2026 09:38:09 -0800 (PST)
X-Received: by 2002:a05:620a:19a7:b0:944:110b:d824 with SMTP id af79cd13be357-94421581772mr1756133785a.5.1793641089016;
        Mon, 02 Nov 2026 09:38:09 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm198764435e9.2.2026.11.02.09.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:38:06 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 18:37:56 +0100
Subject: [PATCH net] net: stmmac: keep est_lock across PTP clock adjustment
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrDIBBA0auEWXcgDqQJuUroQszYDo1GHCkF8
 e6RLN/i/wrKWVhhHSpk/onKGTvMYwD3sfHNKHs30EhPY0ZCLSFYh6kkZC14nO6LM01+cTN5byz
 0MmX28r+vG0Qu8GrtAv6/ui5qAAAA
X-Change-ID: 20261102-stmmac-ptp-est-lock-725f8c72ff1a
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 5_cFng3vrilKhendNAFNeMT_wdCwOGOt
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8ca83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2V3RxEKsxQ3JlP20WKEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3MCBTYWx0ZWRfX5PBbOjEZBIdr
 uZCunEGjybQ75GzGIULfqSb86IypU6qY8eD123It97dFUyklZiy2kSK36PfZA+ijm8Zv9rOrjKc
 kBj99Bun+difRt5wAwDyYt9GErPnB2Ol8Bm2qjn9CvFiClzLCmivN80Jka6UbOr93D+PDxgMuWE
 35qdAZz2Z8Mo9vWDpWuIruwhAYRGhioWnvru0WGpowW077Gfz6swTEamk2sChiIdAPPCu8yrTVi
 agy9lAK85AWNUQXWb3e9fsSuzgRdMLxh6GYgPmY10mBOmDlgOvN1TB9HA4QHw9TTm7X2cwS745u
 mZY5D4Vt9l4QmfQB9kqishxstmyRo3o6QntyaDDw6DyziJCdKrvk7+SQ5QB2P/tlPDwUPrjnMlM
 hieiw/nYLISIC9QDLtuuDTh2tXDGeSShtyqErI0rc/iBOZroZaVv972MVX4OMLh2FcLqGvogpnK
 WIwHUwz6FZ5MxjIHm8A==
X-Proofpoint-GUID: 5_cFng3vrilKhendNAFNeMT_wdCwOGOt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3MCBTYWx0ZWRfXwZm3Uj7RV6Ha
 D3WQtr8uWELXDwpiKYmhfA/KsQYJnnSzTKs+FFg3rJAhPL4vIig+telBHpZcBKoHqdhr8XaeHkF
 9GN5zKuJaa/j64YHdAvhLvrZMhmkD8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_093811_759657_534143CB 
X-CRM114-Status: GOOD (  15.04  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmmac_adjust_time() disables EST, drops est_lock to step the PTP clock,
and then reacquires the lock to reprogram EST using a base time computed
from the new clock value.

That leaves a window where a concurrent tc_taprio_configure() can program
EST enabled with a base time derived from the pre-step clock.  The gate
schedule then runs across the PTP step with a stale base time until
stmmac_adjust_time() reprograms it.

Keep est_lock held for the whole disable/step/reprogram sequence so no
other EST user can program the block while the clock is being stepped.

This does not introduce a new lock ordering: __stmmac_setup_est() already
takes ptp_lock through gettimex64() while holding est_lock, and
stmmac_adjust_systime() uses readl_poll_timeout_atomic(), so it does not
sleep under ptp_lock.

Fixes: 23d96de472f7 ("net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume()")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index a37405534beb..6ad6c2f52a0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -73,14 +73,12 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	if (priv->est && priv->est->enable)
 		stmmac_est_configure(priv, priv, priv->est,
 				     priv->plat->clk_ptp_rate, false);
-	mutex_unlock(&priv->est_lock);
 
 	write_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
 	write_unlock_irqrestore(&priv->ptp_lock, flags);
 
 	/* Calculate new basetime and re-configured EST after PTP time adjust. */
-	mutex_lock(&priv->est_lock);
 	if (priv->est && priv->est->enable)
 		__stmmac_setup_est(priv);
 	mutex_unlock(&priv->est_lock);

---
base-commit: 7308ef8b4a6779a39f68d053c19b53a5c584a663
change-id: 20261102-stmmac-ptp-est-lock-725f8c72ff1a

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


