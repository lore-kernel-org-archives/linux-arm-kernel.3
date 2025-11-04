Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A9ACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S0lPTaiokTIDex0YQdV84MWa/Pp9/fCnl+VVzwlQui4=; b=fEmHzJBnPubUjziltXlEekx4ia
	suEoJPlVASKdCkUHLL79+ik8xCfSJcA5yvaOnh+i9L+J/q9H8TEC5qoqma0iM8Gcpnoic6QWASVNF
	wIWNX6POotyWLaGXqFIXEXynPetLye6ZvTU8LAEeNw0P/3coUiK8au2LBUJn3V49sWMGGRBMp3H4E
	3GqDCqGkBwCtGaovLoAz2T/uUahJnBrI7BfvdlRaPsLPux/rZVscQHbITP8ny85A8u/Y8aHoiBpcw
	SWUUUc/Xci+U4TP4obkIgJhoiuruhF5bAbPK2i/7eHRl1WhZs93N5bPKAD0U4hKYh4tKJrkqXHskI
	khBzahcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHHw-0000000BtjN-458e;
	Tue, 04 Nov 2025 13:41:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHHu-0000000Btim-1nDU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:41:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29498a10972so6958595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 05:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762263689; x=1762868489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0lPTaiokTIDex0YQdV84MWa/Pp9/fCnl+VVzwlQui4=;
        b=RbNX7857p5ZWJF9RkliTmhVHLQmbzL2/IRpJSlrRIp75YNQS+78ENPuky7pw6EtTOh
         PYwIMrk/ewpncgrt3LuWiKA8H97kT6gqu7SyvBwKULNh8weY2ZbqBigkvP7n5Tlq+6b3
         HPGbwoes0sVxtbNrVsuuALKU1ddhm6F3QXQ08cGIrrbfqCvNj/kxzpSCzyMVHs+Wocz7
         g7atpzZ8a+U/OeJKrqaTMBAO4x2/msODlwgbSuCvUz3IluofoynqfSrKYJyi9yVEFAMK
         L6+lx2SgUhxio7aA6frMmQmnhGdlbsCoKDBYst638alLTegKslKUMQGUk1DTsfXiV4Al
         Ucbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762263689; x=1762868489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0lPTaiokTIDex0YQdV84MWa/Pp9/fCnl+VVzwlQui4=;
        b=e53Vo0aXW+dpCsfEyKWakvrOCDGhdszKVk6ojZI6MD5IwOD65w9Y5MsTpdsN45fGFP
         wJ10aizv93BTwViaByyFLom9PRHMJALp9kQ/I6y+umzLWLd6W16/NJl03uvK4NtNvQhM
         1OaiLOxjPqUBC2Hn6BKjqE091FWbUsQU58cbWRFT0/QyEO+e7G/unLynJ6WcOyiWNMa0
         yQgcwv3eplB9+sCdXxcIQMdSoIemeRDkMNbFW1FDruFxi162XMVv0P0K1bFbh6EORkV3
         zcZnKe/XNhWIgNi/XdAXWNeSVmz8IwadJ42dvUNwDKVQnboRaDi752hr9FrRYYj3zHgs
         /6RA==
X-Forwarded-Encrypted: i=1; AJvYcCVW/IZ1vyqbZ/KXvWysO83ehq1FnAkG15kzMbG+hM/8ZuNTJKkCL5XsErhF/bRQw3Xe7dUKITKoWjetJCeKtEmo@lists.infradead.org
X-Gm-Message-State: AOJu0YzB9blsutObAQ32i0v82lQyYmN4fgiDK0loc1S41bOefKPKaseo
	FuO9MyjjeeoFmyOhaa/AbWH0YP6NHpCFwpzA1dGqrC+iZBtSg6CL2Ye5ElHb7cPh
X-Gm-Gg: ASbGncs27ek21TnM26Iocp5RYjaHLW0GyU4keIB4OEwGhydy+gwexpHBHfkXEhx8NI7
	rXadCdDRuH/FXZnxQGv34dOfG0o9FWW9/RTt3hNfVuolKo+dmJln8NSy1g6LcEHvr2bErfhhgV+
	9uufxGsdxHIlj8248g8G0jU8uwC88b5vY0s8fPuCY7FrI0f6AD6O/DfmazspUFDYqCRPSnf6Std
	aFRY37Mw0yn/XHrZ72gKVaYmM1bWTZGnQfPELTq5XAYm0MLHZm8u6ySvtaxWF/eqWQttiB1ixIS
	6hNFlaLll9jT76Dn0eP4E+qx32d/ICFXh8qKla5CA9z67U4m39uwQkVLk/NR7wyHV1KJMqLrrcV
	laxf+1/HfH20NOFWdb1LiQsQA1UzGyFcVQkehZDnvJdX+RAcupjk9
X-Google-Smtp-Source: AGHT+IGQWh4i0Wd5Pr3y29q6cgl2fFPM1q2MKqYieCGfSBP3NIuAhUh7gGpVV4NeeEtlfEcWIEvu6Q==
X-Received: by 2002:a17:902:f690:b0:295:2cab:dbc2 with SMTP id d9443c01a7336-2952cac1c3dmr99611415ad.6.1762263689413;
        Tue, 04 Nov 2025 05:41:29 -0800 (PST)
Received: from localhost.localdomain ([163.125.164.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7a8a9sm27483595ad.107.2025.11.04.05.41.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Nov 2025 05:41:29 -0800 (PST)
From: Yicong Yang <yangyccccc@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: yangyccccc@gmail.com
Subject: [PATCH -next] perf: arm_pmu: Fix build on arm if !CONFIG_GENERIC_ARCH_TOPOLOGY
Date: Tue,  4 Nov 2025 21:40:04 +0800
Message-ID: <20251104134004.6964-1-yangyccccc@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054130_478262_C315DDF9 
X-CRM114-Status: GOOD (  11.21  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The SMT implementation is retrieved by topology_core_has_smt() which
depends on CONFIG_GENERIC_ARCH_TOPOLOGY. The config is optional on
arm platforms so protect the usage with CONFIG_GENERIC_ARCH_TOPOLOGY.

Fixes: c3d78c34ad00 ("perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511041757.vuCGOmFc-lkp@intel.com/
Signed-off-by: Yicong Yang <yangyccccc@gmail.com>
---
 drivers/perf/arm_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index ae437791b5f8..f38bdeb906f0 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -925,11 +925,13 @@ int armpmu_register(struct arm_pmu *pmu)
 	if (ret)
 		return ret;
 
+#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
 	/*
 	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
 	 * detect the SMT implementation.
 	 */
 	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
+#endif
 
 	if (!pmu->set_event_filter)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
-- 
2.50.1 (Apple Git-155)


