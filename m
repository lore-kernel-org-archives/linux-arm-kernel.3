Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4723606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0yohOCHP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBOR7s2X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=; b=0yohOCHPthOapqAvAeH1gqVK/H
	2K+yEUZApFojyXtzNnmfhIkp7EVICw4RQRe9JerOtej3CtbMmmip/UvmKeP/CqQMGKoj8tDpIdfTO
	ldneikas0ErilRWUWIff7RsS6CWiNTU35MFkg6MiVU4syEN6rE2Opd4JNomVbGLLHIx+JSUAotudl
	DQABnyD7UGxmM3UWRRr7Nl50ksPvhIRhmPnNd6n/ldze9OkZNw5XuSpIcrOKkHJxwx7Re2SfQaCYA
	KQBuj/yptU6xNbolKjFjlS9zmS1yLUSBgMXgVnB9pNdYRQZsQC/EMNitcwSmcYOh9pFiiTWj1F+vx
	qdKZ+0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxG5-0000000Cngw-2FvW;
	Sat, 31 Oct 2026 00:47:45 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxG2-0000000CneT-1lvi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:47:43 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2195555eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407662; x=1794012462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=BBOR7s2XkiZCqp6hsqe4N79DC64TH3HaeYTSqUyqm6F22MBftgI3Sc3n3DPsJBRy/8
         GAddarDAImd4OF1KhvqKVEGjEVpOgJ6BYZJPZNuEIk2RfF8moZGDyZAPNbpMM0k/eqqC
         D+PGEnZijq27S1G2FAEzCnktmGVLQZ6URktSwINraOd5CaykqCUl9r5XxW8Lu9/BbF5Z
         vcIcgRYQrT+0CSVAy7vRjrz5e/29gJ5DpyhlBjETzmjyU1OMXliOqgyXbWn2+2pT3LCU
         BEV80UdTsYPoTyDPOZUR6oAwdUaGDi+GIPjnNrorgf8RCQghlB2u+GjNwNMfT/YHhiza
         mVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407662; x=1794012462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=EgcwrmnX6RdTtQFdSErxmPiNlplBx+usPN5N/SMKoYe7HfRFKEy8dPyQnwsaJA5tat
         g5U71k16/9kAaO8YsT1jkNV95cSXvPizaMfgiA5ozvLWSJkfjTBY1UtjbzC82r4wFSOE
         VNDdk8IqSseA6W28sQZKHtgbfBK5XAiXp06ljfVRZsSCad8JRoLY1MrTU0HTK2itE23R
         hRntyGos9JzEdsx5aD5iSN50WUn15eAhYBZSHnQAAnOhArZBpwbRdQkPJCE8/rCRW8yv
         L157AMFfG0Z7/ENC7I+xE62CBvtUPZVXYbtE33e/etwdIt60FGRymw4jM7Y3nAly/5nS
         omag==
X-Forwarded-Encrypted: i=1; AKwUvByBxWA3W/CX3Il1ZmM4KOoeIQqVZnU2k1Kt8ESIreT+TyjXaWyzgetPwwJK1pFEirgBZVtfHGtKRVFO1t2ma87l@lists.infradead.org
X-Gm-Message-State: AFq9FYLA68uz5KBstPh30aHPSm5xvQLdLtBUJ2tvKgGGhsFei5wtO1eC
	lHxY/8IkX7FuvIMuGZ0eVoujO1tbTNiIzOoOE1BK7RkZuM22xGvnRLPt
X-Gm-Gg: AYBFou1rXN8CU/833PP2rrC6JNfVTr4TgdOsYzU/cNp4jz33IMmj1WMJ85TJ1U57g6P
	bVJKTvZbTTW04k/8z4sNCK4lSHbSPVAvy5/DuDHLPa60e/FndXPRWFtiRnDm5OM0bA0mJQtmz5p
	p/FQgqAJDWDvs7oNb07hUPbS8NtZ5vrC/1//W2Se6pq6+aJZ6QEhmzUnYKk4clL3EOVrmDDo5dz
	kZRN/nEG0EwErx66BbljFzxM8pIvQnuPjTMuNhI0JFLv1ZrraKmpE8ECwYkZ+oTdbq4Squw7iLF
	eM/NK5hqpWKW41pxR678UOqpSOVZs2a6TSx325rWDr7ZXWZNjM/71cjzorNXb6IVU5fFKqeJgiO
	moqArZfhHaPoBVoA/TQClycw3eOOUQKDTqZUSXJtZ6C45sknnqJw906PX6IpGPqS/hIghmjEwKf
	tMWO/U0QAM2VY6dgck09nZab45pn3d1VcKyAG9y43NblrlxL8nDlwZQCSQfrttyGZG7zqhaMInE
	+UiVXmWy1qAf2StBIXcwUBQCeeYtp7sZbtnDY7WbrqZxPX0fFbs9udCpcrJ3rbh8fi7dPRvdhWm
	O2aPvjZwU6JbW4xgEw8oNM2JZ11Eol3J5k4gWEFtxJANFI9ITL4ZLN/asRLrfXkBVTXldVg50vK
	n8L5X5T4qxsDQl1z0eKo34QAPMWJCbeFeeUa8B9scL0eNinlIb0ETZvLr8/pA7omh0Q7iToBy6s
	52TP58KGKi0KQGb8U=
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr5374853eec.13.1793407661421;
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm12703100eec.26.2026.10.30.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: TX kfifo underflow when TCOFLUSH races with TX DMA (samsung, sprd, msm, pch_uart, tegra)
Date: Sat, 31 Oct 2026 00:47:33 +0000
Message-Id: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_174742_483870_0C730859 
X-CRM114-Status: GOOD (  15.08  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The TX FIFO underflow previously fixed in 8250 by 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush") and in qcom-geni by 452d6fa37ae9,
7ea38c49e717, and e3c04834ae1a appears to affect five other serial
drivers. The line numbers below refer to mainline at 83f32c773255.

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() callback. If a TX DMA transfer is
still active and the driver does not account for it during the flush,
its completion callback may subsequently call uart_xmit_advance() using
the byte count from the old transfer. This can advance kfifo->out past
kfifo->in, causing kfifo_len() to wrap and the driver to transmit stale
buffer contents. As shown in the 8250 fix, a subsequent close can then
wait in tty_wait_until_sent() until it times out. The issue may arise
when a large write is followed by TCFLSH(TCOFLUSH), or when the port is
closed while TX DMA is active.

Four drivers have no flush_buffer() callback and therefore do not stop
or account for outstanding TX DMA when the kfifo is reset:

1. samsung_tty: Neither s3c64xx_serial_ops (line 1679) nor
   apple_s5l_serial_ops (line 1700) implements flush_buffer(), while
   s3c24xx_serial_tx_dma_complete() advances the kfifo by
   tx_bytes_requested - residue (line 342) without checking whether a
   flush occurred.

2. sprd_serial: serial_sprd_ops (line 944) has no flush_buffer()
   callback, and sprd_complete_tx_dma() advances the kfifo by
   tx_dma.trans_len (line 276).

3. msm_serial: msm_uart_pops (line 1547) does not implement
   flush_buffer(), while msm_complete_tx_dma() advances by
   sg_dma_len(&dma->tx_sg) - residue (line 482). Its check for an
   already stopped transfer relies on tx_sg, which is not cleared by a
   flush.

4. pch_uart: pch_uart_ops (line 1518) has no flush_buffer() callback,
   and pch_dma_tx_complete() advances the kfifo using each scatterlist
   entry's sg_dma_len() (line 756) without holding the port lock.

The fifth driver, serial-tegra, implements tegra_uart_flush_buffer()
(lines 1272-1279), but only clears tx_bytes and calls
dmaengine_terminate_all(). Its completion callback calculates the
transferred byte count from tx_bytes_requested - residue (line 537)
before acquiring the port lock and advances the kfifo afterward (line
540), while tx_bytes_requested is left unchanged by the flush. Although
terminated descriptors do not invoke their callbacks, a completion
already running when the flush occurs, particularly one waiting to
acquire the port lock held by uart_flush_buffer(), may still advance the
reset kfifo. This is the same race addressed by 452d6fa37ae9.

The existing 8250 and qcom-geni fixes provide possible approaches, with
the former clearing the outstanding DMA byte count under the port lock
and the latter marking completions as stale during a flush. As discussed
in 7ea38c49e717, comparing the completion count against kfifo_len()
alone is insufficient.

These findings came from a research static analyzer that checks whether
uart_ops implementations using TX DMA provide flush handling that
accounts for outstanding transfers, followed by manual inspection of the
reported paths. None has been reproduced on hardware. The same analysis
found flush handling in the 8250 core, atmel, fsl_lpuart, imx, sh-sci,
and qcom-geni, while amba-pl011 is not affected because it advances the
kfifo when preparing a transfer rather than on completion.

I would be happy to prepare separate patches for the affected drivers if
the maintainers agree with the analysis.

Thanks,
Samarth

