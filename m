Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sDwBolMF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKL+QrqV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=; b=sDwBolMFhKJ8UEWf4EWftwpIZY
	VaotBtI8UnyAH2Vj2AKYZlabh0O8JRbnJtDiFyDeLjFz1dmaIowsL7rPV95yWBzn4p5cjdjXTsKqF
	nm0Kbp8edFCw2OPhhCw6t36ToZbQ8IFCqkKZ1mzy2ii3R/fieDHPp0RFQ+IrZHBXHJzioQk0dQRS4
	XrMj8Ny2uW41mTY7DeGB2Uq4fkDPH95PqB5/+vAw/ZY0QPSC2nMP8j43569uXjohz1YSDw5wxvMMj
	9nQBLwF+zzPEtOHzeI13/6qmhBhmENdaXY3EsQSNlZY80JAzdgUkHBFSvn8wlnLGpd6z5QwNvruck
	tO9EdavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxMh-0000000Co3t-0zte;
	Sat, 31 Oct 2026 00:54:35 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxMe-0000000Co3U-1sYg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:54:33 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1167734c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408071; x=1794012871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
        b=aKL+QrqVnljTWp+P7Hd8TO3qypD0r6Wfg8xKeDI/Bq8tbHJagjBq5gL1g64+InqI9f
         6B1GWhdW2f1uPDBMW9oxB5LtOFZWcDUTzz6SD2pRIfyPvWS8fuITXwTCfKPCXWUUVmb8
         6IDCnMpY73PEU9mSsfwpDj2VC3uXqMEe9rt6osw7BGKF6XWDKbSlaMp6rdpXyhKkok3A
         tsOIIMHEPNj774fNqPeuKEgh/H6+To1xviJF8jiR+9MBc4skL9lenss4FTYIeSDrVrFT
         F6mYQBMJMek+fi7qSVG/WUd9K4dtpDni4+ZmN9NmiiZ3NROAcjXMJLQTPh51p2a3QEFB
         LBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408071; x=1794012871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
        b=DyCzCV8hbN8ox12ZNVKnx6RPPPGExQS/ZbF6TBh/gANL4/4l1oMBtQwhjgaBCSEOYC
         fY7FV/1nc1M7t360cJc0w5CKtGrR4cNozCKzBroMawiZvCNjyfJSkspvVUlHbs+wJ75t
         QtlNjwj/lk/2fCuyXe9Zre8EPiK0PWFOraI/a9uHlNQ81ktELD2Y2gs3xtzxjfXKC7yO
         jtt95ZcSacMdm7mLNUwY4XPtsy8i9af7dCtTHs6ghlu31IWcXc7/+gpW9Ve7g1p39LD7
         BcBeL7eaypLu9aq/4tauy542W/1UWJJxIFZ3yLDlPdR+/nrSWJkYGmDM8eZ6NIIy+TyL
         NsdA==
X-Forwarded-Encrypted: i=1; AKwUvByDWEc+v+9aQKF2EQCM2j49gNn4aSGFbXwEZQQaLW67CgvE23MvGQrgqfC8GgDoXZScCz/q3kXfXAKzYgWskrL5@lists.infradead.org
X-Gm-Message-State: AFq9FYLX9uKMqNYIRhwWBYQF9gYTpXua/64u75tL18gtQptONtUDYtdb
	yYc7poelWIhXcPMIQrYr8TsqImqpIHfQ+d/MHiMucnM9MLbX5fZ9G+gD
X-Gm-Gg: AYBFou2Q5Sx7tYCrxDa33KoT5ichw4ULH/A9E4c25pTbigktkKi9vdJ6zJMNWEnBrSN
	m8bk3L312n439Jv/vFHfoiiD4ywsITrSMreXkk4euBQ954IEx1FZJVz9aZMhbZIv7q2wD2rAoAJ
	UcMW3nJIiICUv/q/AdtjtZ9BtiFyFjqX7rvQ9HCJZ/B4erxPLYnX+qMKfzIzJqdURfNC90hOVZF
	eOWFZBeX6d+CoKO9RTaJOAl7r9aKClatAPjpP1L4Ya16GRDOthlsrdmDH5agUk4CN5MvApHkiEP
	RjRlmpuq3/m+/Q9wceh85Yz+vwd5bJOfCDgpdLBgRPyrzJ10QKPzf6zcnUBZ4rcYU1GnwZC4Ztl
	/XLeKCHXBDdePJd4ba1svChEgX5AcWFNgaGyCSTSxk2CW+XWGNF3r+RxsIRK13ZMavxrL9YqP5Y
	MR2Cz2j9FVSCAZWjgmkw7WJ+FukBuOV00gAkVUkbRuXlpP6kXc0dzzFzjfB2otBr+Vsv6druqgw
	Kn9cx5qHquVH2wU86ZKKZyPjwLQCvTnQxVlrjGZz1/h6qQDYE7EmvcobLEEZg81q22fTZrQkLRA
	7Dd02kkzJd1ivkxuX/sXWO8YRBFX3UtsGi0tHXRGO0wJRlr5UdcRbJWQ4jL7VhKFY8ylAs4pn1H
	v3gjbEgIkd8H/PlzRhf1HIBTcMNMufdUTEEWDoZiaqkCEkWefTZdtDgqJWeOmqv1FunutDYGIBX
	2iOe1SJDynmo6hgooB41Gjjh4NYwELHFbGA9o=
X-Received: by 2002:a05:701b:4187:10b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1ac5e322fb7mr5663288c88.20.1793408071289;
        Fri, 30 Oct 2026 17:54:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm1419862c88.12.2026.10.30.17.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:54:30 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: amba-pl011, imx, fsl_lpuart: ->flush_buffer() unmaps the TX DMA buffer before the transfer has stopped
Date: Sat, 31 Oct 2026 00:54:25 +0000
Message-Id: <20261031005425.3351240-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_175432_523084_552C0939 
X-CRM114-Status: GOOD (  15.87  )
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

I found three serial drivers that unmap their TX DMA buffers in
->flush_buffer() without first ensuring that the outstanding DMA
transfer has stopped. Line numbers refer to mainline at 83f32c773255.

uart_flush_buffer() invokes ->flush_buffer() under the port lock.
The path is reachable through TCFLSH(TCOFLUSH), hangup, and close, so a
userspace process with access to the port can trigger it while TX DMA
is active.

Because the port lock is held, the flush hook cannot use
dmaengine_terminate_sync(). However, dmaengine_terminate_async() only
requests termination; it does not guarantee that DMA has stopped or
that its completion callback has finished. The DMAengine API requires
synchronization before memory still accessible to the descriptor is
released (include/linux/dmaengine.h and
Documentation/driver-api/dmaengine/client.rst).

I found the following cases:

1. amba-pl011

pl011_dma_flush_buffer() (lines 858-877) calls
dmaengine_terminate_async() and immediately unmaps dmatx.buf.

The unmap can therefore occur before the DMA transfer and its callback
have finished.

2. imx

imx_uart_flush_buffer() (lines 1716-1739) calls the deprecated
dmaengine_terminate_all() and, when dma_is_txing is set, immediately
unmaps tx_sgl at line 1729.

The imx-sdma termination path disables the channel but defers descriptor
cleanup to a worker that sleeps for 1-2 ms because the SDMA core may
still be running. Consequently, termination does not establish that
the controller has stopped accessing the mapping when the unmap occurs.

There is also a separate callback race. imx_uart_dma_tx_callback()
unconditionally unmaps tx_sgl at line 595. If the callback is already
running when the flush begins, for example while waiting to acquire
the port lock, it can subsequently unmap the same scatterlist again
and may attempt to start another transfer.

3. fsl_lpuart

lpuart_flush_buffer() (lines 601-614) unmaps tx_sgl at line 609
before calling dmaengine_terminate_async() at line 613.

In this case, the mapping is released before termination has even
been requested, while eDMA may still be reading the buffer.

Potential consequences

These paths can release a DMA mapping while the previous transfer
may still retain read access to its backing storage.

Without an IOMMU or SWIOTLB, a late read can race with subsequent
modification or reuse of the buffer. With an IOMMU, an unmapped IOVA
may subsequently be reassigned. With SWIOTLB bouncing, a released
bounce slot may be reused by another mapping. If the old transfer
continues reading after such reuse, data belonging to a different
operation could be transmitted over the serial interface.

LS1028A is one configuration worth examining for the SWIOTLB case:
fsl-edma uses a 32-bit DMA mask without FSL_EDMA_DRV_TCD64, while
supported systems may have RAM above 4 GiB. Whether the affected TX
buffers actually use bouncing, and whether a late read occurs after
slot reuse, still needs to be established.

A related issue in qcom-geni was fixed by e3c04834ae1a
("serial: qcom-geni: fix TX DMA buffer flush"), associated with
CVE-2026-74655.

Possible fix

Since ->flush_buffer() runs under the port lock and cannot sleep,
one approach would be to:

- request asynchronous termination and mark the current TX operation
  as flushing, without immediately unmapping its buffer;
- defer synchronization and mapping teardown to a sleepable context;
- ensure that a completion callback for the flushed operation cannot
  unmap the buffer again, advance stale TX state, or restart DMA; and
- ensure that shutdown, and suspend where applicable, drain the deferred
  cleanup before releasing the associated resources.

The callback and worker would need to coordinate ownership of the
mapping, and any work draining would need to occur outside locks
required by the callback.

I have compile-tested candidate patches for amba-pl011 and
fsl_lpuart using this general approach. I can send them for review,
or adapt them if the maintainers prefer a different synchronization
strategy.

These cases were identified using a research static analyzer for DMA
lifecycle ordering and subsequently reviewed against the driver
source. They are source-level lifetime concerns, not demonstrated
hardware exploits.

Regards,
Samarth Narang

