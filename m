Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FA2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pwT3xzgq;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=b9SUelzg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=; b=pwT3xzgqXVGTfT463wVlvtuIyn
	YFtz0ewkCmDKCN8owAfNlsyJ37I3EzNCCtDkkMGbuEPTACPfEU3ZrI+33kuZ08+CCLoEYW8F5GYz6
	fKI7kbBOh/xGeP50tmUsVRPZyZ020ljxPNknG5PDeDEZ+HoawLmod4DlLpjlZoY2cYTaV0eydQhyF
	SaJQ7GFPEccSb4NFlKU3GR2V4IszEoI1wLucag02WiX0E6dQZWBn58N9JAqBCOr/id7QqJH+23FvN
	WUOeRarPigP5dHP8gdZdp7pnEkipN/mW7LidV1tufakYcLgb+DVR+4gyQaaoFGnJmBUU9OHcvSlnu
	H8vlHxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLan4-00000003qH2-0kWx;
	Tue, 27 Oct 2026 06:36:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLan1-00000003qGF-1hKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1284920b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082966; x=1793687766; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=b9SUelzgjQWuZJVdlz65m99Dc1D91+73Vy2fNKng3ycbZRZ/VJqxRHyUGZC7RD2JXZ
         TxXN7Cvr1BjCxSdB9BCSb2cQbaxP2mH3QmCRTK0c0QLTst1gCIRh16ramN7DVWyG4dha
         SjVvxg9ZJOqQft7nMOEPSWDdwZzvUExAyMR+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082966; x=1793687766;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=EnTAwYPQLwqhIKu59F5A6xqv7DYQuoc0h+DPOLT6fv9BP4AMyABOIdG3kToAPxWd8Y
         BAGHaYxwH6UmTWKleZJtJDEaYh1+xgTF6t1hbR8gVUGVRKt/Y+rks/ZQvpxOlqeKdYb1
         oAqkPuNrmFyp//spdHRCi1n8lPXObMldKCqhmlGnygXzdU/SB7ySrTo0IqPwyapcsqSs
         a5Dyz9qOeuybDWeKxCvfKIbFLtI4YvRqMgV1dCRZhpXRJbEpmaIjqTsDDsxQVpO/8g9u
         OTldGyFeKbpbqoa6SD9l7x2QuYcZfhMx5vBBhEA0pvZh09VWgDWxM3RqADn3AJUQ24iH
         tV+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJjg6ftd7TZ3SGK+qrv/K9gGawIye7AQ1Lw+CozO5g6x0pphCv5xdnfiN5nFWubNZDn0YVfTDk+fWh1odTGB6X@lists.infradead.org
X-Gm-Message-State: AFq9FYI5Xle39un+6QfF3jWnjeo0005io3YJCjS/k8rDmV7Jx8KNN7bA
	oaQMg0yTRqkakuUMwX9VxEH7gz9cjlvVRmT1OZk7YabCL3GnsEDh8ViP7c4INNxC1FY=
X-Gm-Gg: AYBFou0jyU91L0MqJ5itZqmV61DRBJkYfElvxT+Oh3PHR8/+CE37MS/OdCrGx7zd0EP
	CHwgGDfWYmyDgwD9gE8ZSo91fP+gHgqe1tMf4CgIPv3QMvDAQ7ZG+Vb68fZyNnNYugAooKa6NlE
	wrmEuPHoFyuTE2V5KLD4SxkeqsFUmPVBIxeaKWjX+Iftunm7uARUChmUgIINr6BYeH6e6pr+ErP
	T15L6tqwPiVTTzhvNRSPMtz6gALazQdpk77Bp3JTriOcPy5TrotaT1YTQgQUbtG0ct+EAdprGPO
	gnQ+wMl3X+BxAJVCQdO48dnnvIKvxUN8Uh31pLC+m9lXiyux/N5/0eesg2vLkzueu55FaxZklgC
	KgGuobA40bbc0BR9Y0YhImY5Z7ZgrUiA+F3mMVPbvUn7EePoRMsc0TPRBppb5JCmoErNfZprKCr
	kRG7ci+KtvvAW42gkrVdwTbHSvBUlgopbFEwpCk4R8IgS+vqEfBX6xKlm23QgQWNkf1/6shhi0R
	rrOLrCyOmyF8FUsfvprMtW65B1kPSNSLdkYCLgncjv1fLVL9JVExH/Ax577XD/oyieb06CoqV3z
	SpAqSIgKGUIoO8tx09M6nbHMNkn2l8M2GNYkOfX1M6+DWXf4zVo1+bWSErdS+ZsOCvMgTb1vEDH
	EF0PpWQkLCPaxKEEYq7dHMUo=
X-Received: by 2002:a05:6a00:21d5:b0:899:e80c:1ec1 with SMTP id d2e1a72fcca58-8a367a39106mr7234616b3a.18.1793082966170;
        Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2004475b3a.7.2026.10.26.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] Make the scheduler stack end check selectable at boot
Message-ID: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233607_459900_1ACA81CA 
X-CRM114-Status: GOOD (  13.09  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

Chris Down (3):
  sched/core: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 4 files changed, 57 insertions(+), 6 deletions(-)


base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.54.0


