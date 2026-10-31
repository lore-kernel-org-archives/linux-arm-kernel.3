Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32819606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uoo3zHAh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6vRtJnM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=; b=Uoo3zHAh+Jyjfu
	qFeoaWxYoYmh6K+wAxiW0UEiWEKLe7xSBP7l3HFTo1SNO7OpAzbJnl1V/JabADxlwYP9+CRmXb0dH
	UD5M4HNdcYea0RNjR9bCSEBFs+q5DXp2Z1kd9STTtsXS1Dua36oqX/2uwA1gk47NAxC4dj3X73mK7
	OR1QpIwS1NcfCpHhZsRkqDp0RVzX/RiQVXenvlr1dNHCV7pkR42+AEgPJFK/5Hr+cwBEDMS3pFV3p
	m7GO7rAcvmJWYZBVm+9yEGwaxoS/ol3/NNLJ1XeIgq7KsAtoM3TKmvCwoYsJE2oLsS9pO9isc/t0j
	0sVNjhxIdFhZ0I/2S+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8My-0000000DJuG-0GXa;
	Sat, 31 Oct 2026 12:39:36 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Mu-0000000DJsZ-38VS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:39:33 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1aefd1bf74aso374174c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450372; x=1794055172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=f6vRtJnMZEMF5+CCAGOU1IXQZv6iYJvPnjYHYrtNzS3+NXuvGNb3uz8D5IX6aSSA5R
         A8SGxnemBdZjqLEkWDZ/cOmDIJhmbimFkT5bz6nlnyzQzq9aGwA73zFCBEVho42dzt/O
         2irtNU97ql+YqIk+uAhHEgpShMB1hRWjH6Hr+C5Ll+5SmM6TTmPjWYDcTBpRFbpvzpNF
         hsjXJBF4+IPcIPIYq5kSydCPd/Q5sMBdIKq06n9alF/xPf0heDoLetlWGjSQIcDwIHDp
         BI39/nw+6jmn3Esr6/5IcERpVEuIvxSPhM+uYK5yrm2xnGrj4yDR3Sz5hkjMc/KhafCq
         SO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450372; x=1794055172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=sZP/BXVLSV7t9SYSFnAGR/dezfVjfn7QUXchiXBiWuLir08N8DgK0gpKjBeU7Q+jwQ
         WqgwrPLwVl/LIESXFx9kPRD8wB5XgBhK0jfzIAAfDINhKnUbNvb5Dng8O2e5to6/zKgN
         tvBEf4k38xiYwrcS8khPBGFl7R8TdMcnoKs2cD40hJdXGVF+QoE7/60lS4JNOjvFta7L
         ghRhywy6PsOcYoNrFZP6C/GWm1klls4osDgAeC7C/9/Yn4/GcHtVAybOE54Ycvvn/+CW
         QPmeWqt5dHaGEnBiyye9l6e+G1d8kDhH43l1xRRjweCB3ELagEssfkHNJpYaNt6d65aE
         LoyQ==
X-Forwarded-Encrypted: i=1; AKwUvByue1IgOpo845EbcUF2KarZlu1V7H270E8yHu0WHVmSg+9iqjAOI6e6Ni/nw98hC/ArUqMyLcEbVDee6WN8kn/x@lists.infradead.org
X-Gm-Message-State: AFq9FYJuJ9mvFYU24yv5I5tqQLbxGcUcAFOXyLkjk2IOAxG7R/4+rw7E
	V6GrZCbsq6kacMjX76hiGgSaDxV0L9Zueiw11PXd6O3iJF3WB8ODBhzl
X-Gm-Gg: AYBFou1PKEO2K8C60PJZ175M9jTuCepM8EwCOy/NuBPs914jYZOxiWdTAz/ZV3r8yJ8
	x+YHHigubirhsNXKMySFgUGvlntppSdtuG8Aek2ARMPEIQIrtOAmjgBx4uweMJ0IDcpSiJAjNPe
	wu4Oh9cYqzzAxLxs7VQm9qezFcbH1ToqHUn7Ut3qJCGD2cXV1+jKwbE874qexzH4VJLGSy1yTun
	GWfM/PeeIdXbEzIi8Tk0LMM59MuMGklM/B0o3QRf5UxqqEXJ3VOxe+b7Zaoz9ELXQrGN754rXlQ
	TL93uywqaidP/YIoCt0RetxK6p8kxv/hBBTzsWlqDCCduLUUtqsUMxThU1TpYq63Fsf5i9JtY8x
	DYiYkUXUUeRa/Uxxuw2937+JDpQvyRqFp+DnPkQ9YJ33DLXQSqNBU8OHRn4U2mN2sEioKjj2dmC
	UgXS9ltyLei3mTlD4zXkEO/lRqiIwjQUvqxmwAKLwoTdN1yW88D3/IxKwK1VFDGi0qHDmkaWRs/
	CmY52eu11dmjwnVzdKE/OOCLM3yqHzndxQ+uUoZIQrIzn0VXenm57otCVevzfbJ82ijLNTlpPNP
	In0LtvFxK91Zn7ai2Dkit5yKV7j4rx4xTSDcULwKlWDWvJenU3bt88ir7tJHtjujrskKm9bVrXy
	TMAT+PkGzL8U6v2UskN4YEtza/hpQy1XO6/mz54JxqSi7Tdp71X/igiHj13tXGm0wkWJRdvcTLP
	dQsQcqKbNHBUnoew==
X-Received: by 2002:a05:7022:294:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1ac5bda4837mr6575924c88.18.1793450371863;
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] serial: tegra: don't advance the TX kfifo for a flushed transfer
Date: Sat, 31 Oct 2026 12:39:08 +0000
Message-Id: <20261031123911.3784690-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053932_792960_F858BFF7 
X-CRM114-Status: GOOD (  13.80  )
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

tegra_uart_flush_buffer() terminates the TX DMA transfer after the
serial core has reset the transmit kfifo, but leaves tx_in_progress set.
A completion callback that was already running may have calculated its
byte count from tx_bytes_requested before acquiring the port lock,
allowing it to call uart_xmit_advance() on the reset kfifo after the
flush. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same race was fixed in qcom-geni by commit 452d6fa37ae9 ("serial:
qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ").

Clear tx_in_progress in the flush hook and have the completion callback
skip the kfifo update if the transfer has already been retired by either
the flush or tegra_uart_stop_tx(), which also advances the kfifo itself.

Fixes: e9ea096dd225 ("serial: tegra: add serial driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/serial-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index b0fc4ae3686f..8b712a9bc293 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -537,6 +537,11 @@ static void tegra_uart_tx_dma_complete(void *args)
 	count = tup->tx_bytes_requested - state.residue;
 	async_tx_ack(tup->tx_dma_desc);
 	uart_port_lock_irqsave(&tup->uport, &flags);
+	/* Already retired by stop_tx or flush_buffer */
+	if (tup->tx_in_progress != TEGRA_UART_TX_DMA) {
+		uart_port_unlock_irqrestore(&tup->uport, flags);
+		return;
+	}
 	uart_xmit_advance(&tup->uport, count);
 	tup->tx_in_progress = 0;
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
@@ -1276,6 +1281,9 @@ static void tegra_uart_flush_buffer(struct uart_port *u)
 	tup->tx_bytes = 0;
 	if (tup->tx_dma_chan)
 		dmaengine_terminate_all(tup->tx_dma_chan);
+	/* The kfifo has been reset: the completion must not advance it */
+	if (tup->tx_in_progress == TEGRA_UART_TX_DMA)
+		tup->tx_in_progress = 0;
 }
 
 static void tegra_uart_shutdown(struct uart_port *u)
-- 
2.34.1


