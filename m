Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E48606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Opgmt8F7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dqib0iBT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=; b=Opgmt8F7EC7ahX
	IXTA017fYplXtUtWuT/uWcrpZgg6DK5XmPt3DJGg5T5YmO85XeZAEWdgnMnkxkOfA1spUO2urTOLQ
	OyUv7Gf4Dp4Boi2fRZI94rt2LiFFJ6iORIn5KUxv/h1A72cNyJc5dd+/N8IqUzppP43ZNdHu56xrn
	v+Vim953KLBUQyyZjIIntG/zPIOK8B3FZ4AUHnTzjgYUKgagsTSjk0b/Z2ppbbxitt2iVO/wQ2ySQ
	BgwcC6FtNNiB5MNUU9TW/B8ENczVkL9171VKZtc2S0gkXX6+MWJ0DWZ69qotTbusU1JixHJtgWSlN
	loQPwWskHqZ1YxBhU+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpyX-0000000CBII-3M9z;
	Fri, 30 Oct 2026 17:01:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpyV-0000000CBHy-0j5r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:01:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48df8fe8513so874664f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379665; x=1793984465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
        b=Dqib0iBTUsbzPwdHlCUn6LFb7SZ9yX7BVWc51d6mt0quZ1E8kCvVrJLreaM5wKzidE
         AIQ5Pb2vApJ7IAoMzr4k1fE8MgEQT7kLpziswzsbAsbYn6zGR6KcAsxnj93ZazQ5X6bV
         W3ENVQDwBRhjGn4rvtpqmss+/A3jhx3ApiTUSTvO5ptEY6Cdpc7185c3ZOiyR/nmj0Jh
         GUPC2Kzy75YcHmmkoQS9iHLG7fyfABWqLDF0wZGEJuFgCg/ePWnPjuFhx5R1cATeJCaM
         WsE0o0hTy2BP8NxwC5TJ4BXm9OxMf74+3s7HRMdk0r1V9C8kOMIkpGiRc8LtJxBByuOl
         4V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379665; x=1793984465;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
        b=oAXW56Lc+rqcuszwIvbOpFY94RkpzyTStNvqEGlV/tBhZH5rc+bu/40EFyQ5YDhHzu
         tZFTGKuGDkSRMbw0EXA88UOFKxK21AiRXeoxN3YV7L4W/1zdxsPmOV0HFaZWASRUq6MJ
         apHMw2dzaPMNsR0EIFd/0XmzauFzSFrPcE4gmbyFv+3bYki8pytM1x5IRC7p9me+wI8e
         TYzw4/+t9XSzYblpQ3tbL2jKOZ52mIEpj1aIUlpNwk2W4grFxSMN7VaNX+dFcPYmuEjd
         zpl71+a2u5MgOmFtYlItz81l4MnctdwArh8gN0jhNDmSGHQ2r4+NgxFCs9vnHkrVmwIn
         1KdQ==
X-Forwarded-Encrypted: i=1; AKwUvByckz3taQT8SAFUyfXSvcxtx1grSJXh04U7R+8kT5vNpCJlOVaC9AZC03cot7cQiWFNhJRUmDGHlcbmks20Wf8k@lists.infradead.org
X-Gm-Message-State: AFq9FYJRjKDtmbe0Wof4SMlU5I2OtzsBXRX/9lsxp/2FqF1Q+7P8iQLt
	GRmk7kjzo2EoYtWBke02QMYmzYL/qqa9lp4aZ0KMYE/IFNJdfAbhaB6Thvxvp6ecmIEFYA==
X-Gm-Gg: AYBFou3OTIaZleeZoD6Wonv1vjrg/VSG0cL8okMrhuar600Gm+VeR+AAa4gZLe159r+
	ISG7aiqZ8YFds0voqVWuYk9WmVhB+U+/myNXDdZaf9eva6diETQraSrBc0WjAVibwkZSzeCMBeS
	xHsbSG6RK78hiWl9DVTVLmmkaBi6fHmMClUKGC45/A7qvZJyqEB3Dbw+XsLGjRJb2gujsBM9U5I
	1UsE/cLmbsZ0ioquQXszG+zYsHK6CS+f8mbML9ODlO6QocPYwOApmRfDIiIWtKGX+rdPPF6pa2o
	o3hRJ8mNbouJ87+O6sqvsYFXhXk2Yrlbuoge/idD1+D+LhY9E6J9UGkja5I4TgnnoHBLAoKyh7F
	r1jUIb8HHqy+hGSuIv5Rny1NXKREE6sD0meJpafcaeVaQss79tMmafgo18P+CLGHJs4bcJAkqOf
	7sK5A/nD1GTymqg+S6rLlBceCHVZnqIT/jXqVxJ6HyUh1Qirk8YcvV4HMM8sQv9Y6r4QgiDTTB1
	t9ESj3I0qVFe8uz69VnldIE/I3xJVyfDgljfQdWVNFIxyORe2DKQJYme99ZNKAYyVaBbXJ23wAh
	UfwrG0Guu0+h36PfZ2N80BYJgYj9ucc3ZzguTq9hNUd4HISA+VCm+ClGEds2VEoH0A==
X-Received: by 2002:a05:600c:468b:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4ac182dcb7amr64266985e9.14.1793379664392;
        Fri, 30 Oct 2026 10:01:04 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm41126555e9.3.2026.10.30.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:01:03 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] selftests/arm64: GCS must survive io_uring SQPOLL worker exit
Date: Fri, 30 Oct 2026 14:00:45 -0300
Message-ID: <20261030170046.439736-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179330742036.2531571.12603232226357262067.b4-ty@b4>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_100107_251121_E7EEFA98 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As suggested, a separate kselftest for the io_uring/SQPOLL worker
path that gcs_reset_thread() also covers.

SQPOLL is create_io_thread() (args->fn + CLONE_VM). Without the reset,
worker exit unmaps the parent's GCS. The test waits for iou-sqp-* to
leave /proc/self/task after close (teardown is async), then checks the
parent ss VMA count.

QEMU virt/max: pass with the reset; SIGSEGV on an unpatched kernel.

Iván Ezequiel Rodriguez (1):
  selftests/arm64: GCS must survive io_uring SQPOLL worker exit

 tools/testing/selftests/arm64/gcs/Makefile    |   2 +-
 .../selftests/arm64/gcs/gcs-uring-worker.c    | 254 ++++++++++++++++++
 2 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-uring-worker.c

-- 
2.43.0


