Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA558606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NkpGjEKL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nc7O6FDW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsKRQWMb9f1R7UT3c8SQO2ZrHywocd6wp/QGBNy9ddU=; b=NkpGjEKLUwHE2sMl6KSI78/Ik9
	3/e2mTr0WA/JqjEqzbSfq+EkEd58vsu2T+dthHgc98+cOWoUSltQHc+gfuBrFK0RDbVjbgXW1USwL
	M3BxXs2xRbGqu985f8BZBguisv7QZpXCo8/Dwz9Gk3Ash7KebOH4kKUP4KbxWl71TcqvDbYg9ezXM
	Eps6yoAgdPNetB9KbODLlVuZvbXDJ0IuGTgKpohmST7zjo+mDVaqf7+w6AYGzZQVQzV0lW3KpzAp3
	xJaqmBwSKWmpvqsJQzBiiFADM1f/JrwiTVAaN91gICgij1EUUVq/oTHONO/gMOE85ySCRtB55LZZZ
	IpO57+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ02K-00000008kg4-2CIl;
	Tue, 20 Oct 2026 02:57:12 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ02I-00000008kfj-3MXS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 02:57:11 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso818230a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 19:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465030; x=1793069830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsKRQWMb9f1R7UT3c8SQO2ZrHywocd6wp/QGBNy9ddU=;
        b=Nc7O6FDW3ohXgXY91QiPzhRl2OoWqxBE4T8zT5eYGw7VEbE3/Em3+KdJDA/Bx+zg8q
         Z21Ku7qHUeZf6QGp8UNDcsuUv5WHE36SOnnZeLswjDorSknd8vSI6sjbKZxMP1mDcaoq
         uNvDJhOSETRgsEz5P364me98+P85cb49DX3Bpz7yMxDpf01uNgP1iVVG/NpHDpkurNQB
         j5ajTOH2jT6mYucHnn3vh+XO38BKniNA/tnehc9UKrJaAgidvU6EQ+ogcsddeg5l1LCV
         8Atslz/c6sPND/HAd6IT5tX+2rGYzNoVIFx7XUtbH+dN4ti7ytixbwWHrn1JC4JkJmxU
         QPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465030; x=1793069830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsKRQWMb9f1R7UT3c8SQO2ZrHywocd6wp/QGBNy9ddU=;
        b=G2wbPXxxN154amRITOUlYtmXgz/mGZIx8hHaXQ8xLUbNVFZB+3lCjsZ01DFvCGeJy1
         O5Y9AXgP6k1xGBsBwmD49XGGGMS1lE/XyP9L4JadOi4j3svSBNAQIdbHdumNbJvQjymC
         NDSMHX+dubQ/vQqBB0GTO4qhQ47LqVFi92BmhPMgEUMNpfhDXuQQI7sFTQIldFLJlahI
         K2VY0RZD9fFPrd36PtqU0S4Yk3OB/N1bZletyMYP7E68v02PinSSZMYPQhBnssYJNEOU
         G81b0mTetukTfdtYNrVJV/QoBjBq1xRy6vGgbL6UOI/I1270fcLQuKx51ujChDWlKvka
         zdug==
X-Forwarded-Encrypted: i=1; AKwUvBxHU6RDRKj2auAvBOigq48HPi4jznpkp1Ixk1n8dLql/K2HFkin23v22PPJn7lV3/Jv8ZNaWNChPxf/9M9eLTUD@lists.infradead.org
X-Gm-Message-State: AFq9FYLAdhqmmQ6z2s3pVXvalKNY45RG7vK7qvPpOZqjwOL6bpvq2M2u
	dwRzrTYjghU/kRBWOaTkv2bb0WHW+x9AjS5ZExLRZ8tbE7Cl70vqp6Ys
X-Gm-Gg: AYBFou1vwh6VlUI/EeyCz1efnO2L+f6JS9C8SajtLJ+Str9e58lteba05tWYKas1E76
	JNDDdYc9A+3cT7Yd7i+/wOk8eGtcFtJuLNuIjyXiP+okWic9FDIYeP2v9tnRZfN7diqMMeyeFYP
	FC1x+IGnEmpoFMEgyLqLvIJ7/0tYY4WGzCEAshKvenXWbolL6YL97l1nMGBjtT0WlAiewpe27m5
	dp2k1916qQDRlRJAnv7/mj9ji23Co4HJ91kK8wJpstHDqx335yhAsR0VXSaC1dna0C6znlwehfY
	7sCem3r6uwtLEiiJhOYJBu7KqeppdlFq6DlRvvELp1elUcIRKkTuO0olCF0jaeCAcyrsH3S94/2
	zJfjB2nUddSq9Bm1wZWebNkMA0+bY8rx5z1hkXGv8hLqn1cb5wyRw7jljTxIdEPMpGIW206YhiA
	yCtUNh5Y8nNw5NwfUnbw+3eM4zr17ZGa9eAtdfR5/Ztb6kGg5k1PO+rjbuKfPHz2br7Q4n88LO1
	MU=
X-Received: by 2002:a17:90b:44:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3aceefc61f5mr8258808a91.14.1792465029791;
        Mon, 19 Oct 2026 19:57:09 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad64273f6csm1479185a91.15.2026.10.19.19.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:57:08 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Do not access MPAMF_ESR on MSCs that do not have it
Date: Tue, 20 Oct 2026 10:57:04 +0800
Message-Id: <20261020025704.1516317-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4bf21ff8-7e4b-4afe-b3e9-9ee85fcd1c84@arm.com>
References: <4bf21ff8-7e4b-4afe-b3e9-9ee85fcd1c84@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_195710_862545_DD9385E0 
X-CRM114-Status: GOOD (  10.29  )
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

Hi Ben,

You are right, thanks for the pointers to the spec.

Our MSC is an MPAM v1.0 implementation without MPAMF_ESR, and the RTL
responds to accesses of unimplemented registers with a bus error
instead of RAZ/WI - which is what motivated the patch. Reading
MPAMF_ESR from the CPU therefore raises an external abort rather than
reading as zero.

Per RLNXX this implementation is not compliant, so the fix belongs in
hardware: the MSC design team will change accesses to unimplemented
registers to be RAZ/WI, as the specification requires.

With that in place the existing driver code is safe, so I am
withdrawing this patch.

Thanks,
Ping

