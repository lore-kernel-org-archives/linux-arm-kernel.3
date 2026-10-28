Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601D606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qECOzMv9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJrWKxP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=; b=qECOzMv9KGKTH59M6JePMhOqIs
	bIy7pGSU8q7md+8SryIqXUOrrVAt4C79oF6zfvCpMqWUNLFSIKJGZDKQ1MNPvCslvSO45UDF44MkX
	PJUgOLF+pO87ts91vKa3p9ecL7YDPFJ+Z+J3DROBieYzH9ry/pgQVc0cGEzNNZMNa8mAIPni1aWM4
	I/w/8Ge8MozfDllAgrUhBZWquggIpAIgz7a5CUZx2DEJFo0i16S4NatipLpGwuWEfF0pAUPfBhCPF
	G+zlqBfZAuRA9NcXgB10q1lxfrT4FbCNxm0uzTMNZP5w92cZrNyQINf+4eX2bFSAxbgeq1vUnVfg7
	d5PcODjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5oc-00000007R3N-0Db0;
	Wed, 28 Oct 2026 15:43:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5oa-00000007R1z-1IDS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:43:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e0d885929so873417f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202225; x=1793807025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=tJrWKxP07sKx1n4GrrWD6Ab01hTm22c7oOCXQTAkBW7X9mgGFqc0Cp4WmZDfAyTs2H
         HO86GNKR3zzp8ypZs6TO5hdUabwKfk7q11wcgVu3FsrDk9FNwRdrDstUWkYBJY6xyVyP
         L2RV89tZcIJiK/X0IOP9JV44sT9zCEGdkiJaavV23gjmaCp6bzCmHCvu/K/h9W+K9ucJ
         2Unv8YPbBDU6AKUK2kJJPoYoPMkQpCjHf55RXlAJKbGOCrtFDinZgSxDat7dTU+oRPYe
         0vaFd2QXJq8HBsNEjivtGsjc7EpHYVcLq3fMXo0nXBZRkjE/MaOOwcn6VSDO0D/+TAJV
         thzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202225; x=1793807025;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=WGgwR9XhTz75SBdg5Fge/6Pgv1ohDYGwdQv4bzn7rGLjzm3bkcvNNWFoxmFKOPivoZ
         jxxpEViK1WGAJpCBLSJGE1gPvKof1d0geZ0lQJ+zxgeyk/3P6B+ETi3k3XxHq43FLnaH
         qOWiX4MbcIYJI4udAwEyu98hPxw1+HftgWPpKTH8tiNhuk5G2sDtj07Y7UyvrijTowBj
         Iz2I6CnIKHOzV+O+NmpuO9TfcTIhoYfM6mie9S99WIvKPnqFt/SCvYc9hLecONIWW+Pb
         3bJH75HSfXy4umV5RmwVtEJMc+4GD0as/8cPixzA+xLKhEJXxr9+n+JXEB+lqa1mDMr/
         RdYw==
X-Forwarded-Encrypted: i=1; AKwUvBw2ZP37HO7dHal3tf6HKPFSntE+Xo9tOnX6Gl+ynCSuNDmKQ2Uvf8c7CFPhYdGaHMJtLwOR602J1ulXHaYADDyo@lists.infradead.org
X-Gm-Message-State: AFq9FYL302n4g5AGodJv8sNjWB3+ANjDbUAvmK29EHAyPJEs934Ogyk0
	ik8nNGX+fRR7QlrEzP+qRxKLcME7nPk/mSN2feLu7qJSJesmFr+agkWw
X-Gm-Gg: AYBFou26NkxmZ1wM+c4ixEASiH9RDOJp3vMMUjRDxEs3aFTOQ23PLqE/LWp+omJP2rw
	SNJi9Zo51PdnEC+5HDson5UIpdheXMgHi9PLDNlASGSECLgLjvldQ0mnV/AP5hY+U/fBWj52b40
	y1m5kRXVaYhOGbeLj0+pejW4VFQShabJswpHQxv9HPXJl1FGLya+UPDcvvdS747HcLfiYtvRuh3
	LGk0quc1A2dd6vRiCJgQbeI5NK6tSZgPQ617g9UBKp85aALkPfkmKGiA8loHiKR4hKEZV2QiveY
	QFWDMFiCIGqe/ZSD5nqmVDVrRGDIlfwVDE50s9whfPeak0X3GQ9YN5fE3YHe95EGnUN5i8ijlKQ
	g+cA2Jnsx0WfHy9n4eig+w2C2rDV7uGXGPZtVA0ALuj8pghCd18O7IHleK1hsu7jMnbMSI48TAp
	qgl7sRTeCKp+XbT6ASvGnQHqTBUpaDFbC7CBqYQ2uy8kR/TyCrer2/xzNLkKHMHTFnxaxxCoYGP
	08wgrRkYHyVjVJ7UOox3fHZjHHCjqNu6X9dDeTo+/dYQJ+F6bACbsSVKM5uHsmq8gt4PWTWYm65
	5LC+tu1K0q7RhpjPECQg4tRAlSPCMENrQBo0l86vwBG2fAlj0g4LMWnoKtZj9plWcw==
X-Received: by 2002:a05:6000:61b:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e5d2e4a4amr7127543f8f.18.1793202225120;
        Wed, 28 Oct 2026 08:43:45 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:43:42 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Wed, 28 Oct 2026 12:43:11 -0300
Message-ID: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084348_359732_A5E7A119 
X-CRM114-Status: GOOD (  11.05  )
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

clone3(CLONE_VM|CLONE_PIDFD) can fail in put_user() after copy_thread()
has mapped a shadow stack into the shared mm. copy_process() then calls
exit_thread(). arm64 and riscv did not implement it, so the VMA leaked.

x86 already frees via exit_thread() -> shstk_free(). Its separate TLS
leak is when copy_thread() fails after the alloc and skips exit_thread().

Changes since v2:
- Move gcs_reset_thread() into process.c (Mark Brown).
- Spell out the x86 vs arm64/riscv difference above.

v2: https://lore.kernel.org/all/cover.1792519121.git.ivanrwcm25@gmail.com/

Assisted-by: LLM


Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/kernel/process.c                   |  16 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |   9 +
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 +++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 --
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 --
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 11 files changed, 398 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

-- 
2.43.0


