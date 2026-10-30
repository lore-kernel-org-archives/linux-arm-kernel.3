Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzGN8xOu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TiCAbv/l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=; b=IzGN8xOuiDuFmwQcN8H5K8MvXn
	4TjcopBWhoCXcHFFn2XuCyWqXylaGylL/JDhy6kJK5bs+9oZbWJA5V5mz00smHNihW8Z8x75kyfAt
	8xElBOhDoRsWm2SlNg+rP9gxHSPqAsV7dLJl2+cMfa9OodP+zdJcvpjM2HmeXZDC5m2yoXnlsnKL2
	Fj/argC5ANfS2viMtMTwaxhU9Di8ujbMBgWg2EcLWQMntSe20WmqiUCYUvTDldfg8/sejdjzuaCow
	tu2f1GGr0xn5EXrwTvW2blazQhDTC4fDW1cfqiXdsMBi2MO++PcCpT0RI6HielDXaEBFEPf7eBpVo
	YIbNLJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpOK-0000000C7gk-2hlS;
	Fri, 30 Oct 2026 16:23:44 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpOI-0000000C7gO-0Haj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:23:43 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36a1947498bso183681eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377420; x=1793982220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
        b=TiCAbv/lK10fTO0pWu/7KFPqj3xYlOqXL+4mjfvcgZiLsEt5oqNdtXpIesMJ56lJAt
         jHQy11NGJ2eJWSFInSosWN2wTSDn+zcvGk8roWuGh1QVDy+9KKIDz2O9nizMJBl5Ki/f
         Ey4WAlfwOcpctdZqBqiDRyKzvd/C2PKRWHRLKdWkO+Xmx5c2Agxux9fngYB8LCyCgXZ9
         03DWEYYpH5epYUunHyj/j/zGBQT1NuqDSf8aTtl/1QwhZ5oyVnOqXTwHU/1XomEHW5Rg
         6KnhxBL0b/gp+DvmdeI64jLzJogtUQPEGm6WSnx5sCNzkO3ImYIgRtZbwOvMeXhh0y1y
         kADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377420; x=1793982220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
        b=Nv52HhgJe3glgkGFJQUAZ06uSD9ouz9AWSLVpDk5WCwa5KMCLx+q9K7uFPpLdOngYL
         icC5BBgw/AjMQLnNXbq1Rh6XoKPJNAu5TkYN+RctJoRghEit4PNpiZcX/cCnWhmNjmat
         ScWUDEua4TMEMFJQ35oUnJzgSNaLagNDOpYBG9EVB0tEmV2k0AJg5SrH2YSXRn/0xG+b
         vpeMoNxjvyPMfRNyVfBM4tvQnHOR+tvhmtbiXcBBWQNVSmxXBNI8/vZOIA6+6V0vbe1c
         8J20LwhtJmR7JLpU/ho3NWu64r8VelVU1eGbZr2/DvOOSbD7oHrKiFwZYVoyYF9BT/wb
         z7Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwTOEch8/D+9hPHRBNapZeG6uXpe5TM15FVUEmpfjP2pL8tNrtnRoGi/wHB9v4PC8evNrELeUloH58SVm4UOPSn@lists.infradead.org
X-Gm-Message-State: AFq9FYJv5+jgohMc8hUIqxti9nQcIeiZBYqCj2TR42/QOKZLCIujDdL5
	eVNdopzF7VXmm2/08WPo9A8oS0LyaQvqMSMkapUcTSgNGbiGxul/UQ8f
X-Gm-Gg: AYBFou1Mhc+kBapAz2b0nh3Icq2zOmT5KjPqng1SUdPvHZmDVCqq996TUhIcCItncmY
	L8RXOty1MP7hgFe8YqlugQurKWHbwO7C5CRU8sH1nD4p4FHukEJzADsZ40n6zCw9EJs7s7q8NzJ
	7BVhLbTc1g4ojzRGfm/0okEZjVf4qAdP3ZwxnCDqa1eNgJ4i53z3r/hqOcyIHXGzxg2uSfPzzFS
	LPCOl9W6EydkbEjswWbGAkXsbfZtPB5kVwsF/TIHYdWtJ+7As7/zqp4ud/LpRPHVitfhgD3CuKh
	j2trIvEoV5ekPVwS52AyG8HpG/GU9myGuxZU3scwgq3G9Aq4w11WMLQbIMEzoqK4FqZ0rsbhP/t
	dOfD7xqpWXorXWkq/E5RNduGoyY9tbQCWsOOVMge6WRwe0RL5t7x0ANhtjYDytDhD7bB+tWyer7
	5/TEMHXF2nUFKoqNRWND7unSQRivyBDf74eKObONFTjoDk+SRFZaH0mcFKza54cHH9YVg/NafeC
	UEgg/WL32R+YChEYHxU3+qMG9fuIe9fOE1Mr8bzbe+lUu89DX+OFhmPfE7X7nxs4mqyv4jWHB6T
	x05Cp82QBJ8ULcYSz9zDN31J7PD1gS/4S3gOE+/r+YITo1BrLXH10Xb3jub/fpIgj0FzPLOQWct
	blln+rRi3rKxTOHQOd9x3lBgxT30huqdcGj3xYUSfttRNFXKYMsNDMTT5q0HLrkjGF1Qmaemkxp
	xjzM1af18q+aXc1g==
X-Received: by 2002:a05:701b:4281:20b0:158:1ed2:cb58 with SMTP id a92af1059eb24-1ac5e6f5362mr3896872c88.39.1793377420369;
        Fri, 30 Oct 2026 09:23:40 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm7689041c88.3.2026.10.30.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:23:39 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] tty: serial: samsung: use dmaengine_terminate_sync() in release_dma
Date: Fri, 30 Oct 2026 16:23:34 +0000
Message-Id: <20261030162334.3000737-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092342_194644_C94AB1E1 
X-CRM114-Status: GOOD (  16.82  )
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

s3c24xx_serial_release_dma() stops the RX and TX DMA channels using the
deprecated dmaengine_terminate_all() before unmapping their buffers and
freeing the RX buffer. Since this does not guarantee that DMA transfers
or their completion callbacks have finished, the controller may continue
accessing memory after it has been unmapped or returned to the
allocator, particularly when the port is shut down while RX DMA is
active.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that outstanding DMA activity is terminated before the buffers
are released. Both callers of s3c24xx_serial_release_dma() run in
process context, where synchronous termination is permitted.

Fixes: 62c37eedb74c ("serial: samsung: add dma reqest/release functions")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

On Exynos systems, the UART uses PL330, which does not implement a
device_synchronize callback, so this change follows the DMAengine API
contract without independently establishing that all hardware activity
has stopped. The PL330 termination behavior is being raised separately
with the DMAengine maintainers.

Two related questions outside the scope of this patch:

- s3c24xx_serial_rx_dma_complete() unconditionally re-arms RX DMA,
  potentially racing with release_dma() and submitting another
  descriptor after termination. Should shutdown prevent further
  submissions before terminating the channel?
- s3c24xx_serial_stop_rx() calls dmaengine_pause(dma->tx_chan) before
  checking the RX channel's residue. Should this instead use
  dma->rx_chan?

 drivers/tty/serial/samsung_tty.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d..4eeef149b 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1145,7 +1145,7 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	struct s3c24xx_uart_dma	*dma = p->dma;
 
 	if (dma->rx_chan) {
-		dmaengine_terminate_all(dma->rx_chan);
+		dmaengine_terminate_sync(dma->rx_chan);
 		dma_unmap_single(dmaengine_get_dma_device(dma->rx_chan), dma->rx_addr,
 				 dma->rx_size, DMA_FROM_DEVICE);
 		kfree(dma->rx_buf);
@@ -1154,7 +1154,7 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	}
 
 	if (dma->tx_chan) {
-		dmaengine_terminate_all(dma->tx_chan);
+		dmaengine_terminate_sync(dma->tx_chan);
 		dma_unmap_single(dmaengine_get_dma_device(dma->tx_chan), dma->tx_addr,
 				 UART_XMIT_SIZE, DMA_TO_DEVICE);
 		dma_release_channel(dma->tx_chan);

base-commit: 83f32c773255720a661aa45d83e36278135f23f5

