Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z/UU93q+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHnvxEtM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=; b=z/UU93q+biRX29nrSvS58RCSCA
	B+VUtcl7tz/b0ea4UR+yJijmewcedY+ZGytxqbWxkERnogz0hpi3R5M9jx8epTeKdDgIpvOxNGBDx
	1l8XHhB2qs7/44NETM4ZPCiPoneV74IPc33x8Ya+fCkUdc10zcdcIRoWBwJQ1bbIeiTmO8v3Z3dNr
	MM6uk/sR6FhA/o9Fpd7rsK9bxBkmofPe0utKCEITfVjVBOWcNHeQA1ysRzofCOF2QQ+q+314eLtSO
	RUQcYn9hL/6G9CWBQIm8icOTm0XuYPgTNSmAKiFWyfwmeqDWrMuuQAfadZATpmY7RvnBtFewmy3cW
	kyMXR+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFfL-0000000Df9D-1z4x;
	Sat, 31 Oct 2026 20:27:03 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFfI-0000000Df8b-1NFp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:27:01 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1099675c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793478419; x=1794083219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
        b=JHnvxEtMUmzcHrKGtpoOpzIKoRm1KKQB9IDZ4Q1FQA6saD9jzZAEmAX+4/LLhiNg2H
         8HoJdH6c9nIiehnUJlLCqQ7HLmyxwn74BIUf8tGuAJQ+t71yhCEf7P4bA0NZkm5LrAgJ
         Sx2Fl+9zB9qT1/ixtqh9k37BcDK0H7iFkoR7PBfuVOgYuHhgbKdYtQAoc282Ilu6gge2
         HE08iyhm1Butf4pyjXoNw6x7rOzltHoAywaXkFfIqUGzXUPe7NGuVf8nwAZXd/v80xw8
         GsiosBnrzkQFMPXnutFaQE0ramQssGRk7z6vTsmONSUH0GOlvgwhjvo5BqbMjXg6wW5B
         Fkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478419; x=1794083219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
        b=zq2Dsf93wg/RWxV2HJAkLou2AFL7t+0dZ1HVhDqs3OLJsahoUpgoy0NFPhccZvZvcF
         oVaecQxyJuAAUgolvVC6iSdtGPNaRvw+wqihW2WDZB8UssLLDS+cFb2mbysq670g/0L/
         SKcTcmvahNJVetfpMvN9XeVtS03XHto6wbfA1g4trfCaslmTlfh/zTE6IXa/0FpKEbm4
         +p5tzlMVsyyz8D+YFC48fA+mRT3VrV619F+AG1QqkQYUUSX+zsr3MJrHVMLxiSI7S5de
         ZTQjzTKEM78cxxVG/gCWiO7gsawdjN6j74nv8aXa2iHsuBuYU28yl2KfilW1AiApD8Gw
         Zbyw==
X-Forwarded-Encrypted: i=1; AKwUvBxEVxwwYLIhTEpIpp3h8yWKrYr86xl9wvcMCnf6cWn56CC2RKDVan1LE53dZJ5qK4mzV6sPR//H5aMcu4ohYv7z@lists.infradead.org
X-Gm-Message-State: AFq9FYKeBD/GwwOkonKUME+04PWDut4hwolL1o9XOfUDFmogBJ/ZXXEB
	15TUPJ96lebncln57Sa0qJZLlzcC3kMos4ZsVjRSJ/1bbCKxff/5ryQj
X-Gm-Gg: AYBFou0p3fBwt/B/Enw26KPmvMNnu42AcadhezcepsPk3p5nNbjzmnFR8CbC9kYLSkO
	7jRwBLDx7GJnDmNKux2v6gEgZOopP5JOtUYz7xCJcgY1NkcytU6xSm/NvPoWTxXSPMR5EOI/YC0
	v9mCLQj80bSFYbJAfloPrrJ2GVWhOWj6ORpoxl9Q481uEi5tkiXpRtSMwtR26BthQWBykS6dxX9
	pgRB4pmwIYIeWCn/clLWVHFyYTnT4P7tD4fs3vyi8MDKyNH6/Vhx2s/dI+kUAFQo0yekV3mG9Hg
	LBYC87HIcdVy9W1Vq3BP44u9bJojzy2wnRJx80YtJrbQUCmuOzNbGMNJTzLHEocAYqWsWsiTIPx
	O1oahLbiyOdH0+Dm2k1k8V7nh7pUvghqYvBczQFuvNtDjShG0VRsjteeNdqNr4hPq9uBa5JpsN8
	l8qdPtcALrM3yezU8A/YeG3RxSfHVlNiKdbHDQ9CScK+r+D2qFfwAFl4frLMYKlbyvbUJfM+l7D
	cdG/1MZmbLAJ7f0cEcMQ0bc7srM/ZHm6fyNDZ0ObNsx78Xoa+/uyBwxFN3ZCvV6IR01gqUdLbcZ
	xdGLTaxRObj3zcdjyYmLtaKkjE98HPGAhxPCJmdlOuni/aZMzKBWyINJr/pI7iEC9mxwI9pkrmS
	z+MOyUUmECRZdclGcr4j5MPx8SQtHQBO0NSBz1i/OvAK1GKkYq1IRzWOaz8HWLWmtn7M69it9Kh
	q+oqMywTiuxtEKFcI=
X-Received: by 2002:a05:7022:3f0a:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1ac56c9fffamr9537679c88.6.1793478419246;
        Sat, 31 Oct 2026 13:26:59 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm1639998c88.9.2026.10.31.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:26:58 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] media: xilinx: dma - stop_streaming does not wait for a running DMA completion callback
Date: Sat, 31 Oct 2026 20:26:53 +0000
Message-Id: <20261031202653.4110846-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_132700_478965_77249B66 
X-CRM114-Status: GOOD (  20.34  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I think xvip_dma_stop_streaming() can race with an in-progress DMA
completion callback, potentially causing a buffer to be returned twice
or accessed after it has been released. The line numbers below refer to
mainline at 36aad21d50d1.

In drivers/media/platform/xilinx/xilinx-dma.c, xvip_dma_stop_streaming()
calls dmaengine_terminate_all() (line 442) before taking queued_lock and
returning the buffers on queued_bufs with VB2_BUF_STATE_ERROR (lines
449-454). Meanwhile, xvip_dma_complete() takes the same lock, removes
the completed buffer from the list, and then calls vb2_buffer_done()
with VB2_BUF_STATE_DONE after releasing the lock (lines 283-296).

The Xilinx DMA provider invokes completion callbacks from a tasklet
after releasing the channel lock. Although xilinx_dma_terminate_all()
halts the channel and frees its descriptor lists, it does not wait for
a callback that is already running. That synchronization is handled by
xilinx_dma_synchronize(), which calls tasklet_kill()
(drivers/dma/xilinx/xilinx_dma.c, lines 2739-2743), but is not invoked
by dmaengine_terminate_all().

If a completion callback is already running when streaming is stopped,
the two paths can race over the same buffer. If stop_streaming()
acquires queued_lock first, it may remove the buffer and return it with
VB2_BUF_STATE_ERROR before the callback attempts to remove the same list
entry and return it again with VB2_BUF_STATE_DONE. Even when the
callback removes the entry first, it may still be using the buffer after
stop_streaming() returns, at which point videobuf2 may release it. This
is a callback synchronization issue rather than an outstanding hardware
DMA transfer, since the engine itself has already been halted.

Since stop_streaming() can sleep, I believe dmaengine_terminate_sync()
would address the race, following the approach used for stm32-dcmi in
ab32b2c3636b ("media: stm32-dcmi: remove deprecated
dmaengine_terminate_all()"):

--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -439,7 +439,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *vq)
 	xvip_pipeline_set_stream(pipe, false);
 
 	/* Stop and reset the DMA engine. */
-	dmaengine_terminate_all(dma->dma);
+	dmaengine_terminate_sync(dma->dma);
 
 	/* Cleanup the pipeline and mark it as being stopped. */
 	xvip_pipeline_cleanup(pipe);

There is also a related question about the error path in
xvip_dma_start_streaming() (lines 422-427), which returns previously
queued buffers with VB2_BUF_STATE_QUEUED without terminating the DMA
channel. As far as I can tell, their descriptors remain pending and
could be issued by a subsequent dma_async_issue_pending(). Is that the
intended behavior?

This issue was identified by a research static analyzer for DMA
lifecycle ordering and subsequently checked against the client and
provider implementations. I have not reproduced it on hardware, as I do
not have access to a Xilinx video pipeline and QEMU does not emulate the
relevant VDMA or video IP. The proposed change has been compile-tested
on arm64 with W=1.

If someone with suitable hardware can confirm the race or test the
change, I would be happy to submit it as a proper patch.

Thanks,
Samarth

