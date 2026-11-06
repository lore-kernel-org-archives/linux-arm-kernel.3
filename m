Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74931606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 04:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RUYG6h8e;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=feFfhBfl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gkkse3cHzLqkAewg9gHiiK9N9CEab9zV0jXPIj/3blo=; b=RUYG6h8e/Lpp8JWP2EbeIWUTmp
	7x2/g5R3JJRaHHFC2lAmjWTqzKmZCxNxgWSs1uGkWU4ysj8kPLFjBN7tzf/blRRxflBk+Rb2M6w1D
	OamBV56i5UEeU+DcR7MVeJjIdWPVxg3D8aDNgNssZYIOZFjo0f/owYfx/gFMpELTCtzBfIvWHCxad
	HthhBNnb0ClgzMroXxJLjopkTLe/2E+TfQsTvN5CAxCjhBEBOiSTTAddrI5PWQSvlAw+liwdyuPle
	d2VClWSt5QcN9J4wYFTYEVAyqqJnKsPsVR9+JyXuZUpJ2g5UW5gFXCmlb51qdoVfXQCCY07f+xk/X
	JCro6EtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBgZ-0000000BDcc-2CkG;
	Fri, 06 Nov 2026 04:36:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBgX-0000000BDcK-038A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 04:36:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso1132815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 20:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939776; x=1794544576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkkse3cHzLqkAewg9gHiiK9N9CEab9zV0jXPIj/3blo=;
        b=feFfhBfl4mLXaKuzQ2h2UtW9LxScYJ1TxOXxgt2FhtE3GQCkCcoRtA7Fa+Ah/XctTm
         MMjb5jZy4L4R9eMW6udPuzk4w6IpYDlXiGfxcgZhT7eHpEZ/bAm7v60KEggnIjd0ARur
         0MQ07C5pZfVqanaZCOzzFq1y7e2S+fc5eQnnVaJUYUy8yfal5YvQ4fEJkOGTs1Z0ESC9
         V0C0o498913tSpOHVBVJDFWcSZ+qyM8deoHUa9rOdd2jRyIzkoecJwuQBoUPycsRBask
         YTyXqslMdCWwX51fQ0wzMosBIdYLsVa+il3THFTzB61fuvQpgx0JyMH67lwhxgJf2rn9
         JZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939776; x=1794544576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkkse3cHzLqkAewg9gHiiK9N9CEab9zV0jXPIj/3blo=;
        b=F04OUtuInWvKpToOtAsaQg4Gea2g6ituDecebAutpr4GTcNuXj41vpXrGt02pp1Lgg
         47xmZn06I9K00Knw9XmLarL+tLklagJ787quYQTgnR8ysiWWg81r9sdE5jiyUqhYGiFd
         xqJ0IlI7zNbgZ/HStkdOMnlyq/B8YR2zRzlvJJgf56IG9G5tMbaXzDpT3hcwbhRTiEk7
         Y1PpX4We9JX5HbUbxK9MoergHkvC5tv28sI7A0GOwLND5bCOT8IvzCN1LhboYRgMzZ4R
         0djsrVYLPfOGFrmDpmfEsxVXXNQO8PLBJXQitm84Ql9uoRki1AuBFormqIUpskB6mIIg
         3/Jg==
X-Forwarded-Encrypted: i=1; AL+hErHPRSLXxYRtzStG0hy6UXwMDXqVnEM+s12XKO72QVUUkgHgaxdw54fmAr8LMtopfJEkMNXO02Fq4q8+xoFTm9eb@lists.infradead.org
X-Gm-Message-State: APuU4Z8nKMGLA+J/nXhN9AM3wZWGtWyPSEOGuwo6oOhn3wALBiphfQFD
	IDDrSVQe+kC6AdmUSYVfABNQSb1lCOohKxof1SJjbIczRQ80ulA9tppI
X-Gm-Gg: AYBFou1Ih+YuAxaBLjepOIbP4VCbUfwh8+tHFyUpVbFcJUzTUJHpWQCFMJJ05PJlKeT
	VLu3pM5Ey7XR7msf3PXFCvT5F48aTEzmqsymvl/FpLndnZ1M6Cu9T6YEwFcFJiaYnBDBw1o5Hau
	tFsiCAM3t3EbFjgfLiXE7hRImj4ow66IIRxBY8vStzoyrds3jhFmPO6rLEY72T/XIFKSrCcZ1Vr
	lGLV6HmnseJnzeE1723j3jpsAh3GovlafCN9hoehrm/r2d7XEw4XB2KQVC0Eir/S/bIVWSKGAvJ
	ulhXsYlyBoMD2bp4x/h4xV6wme7TzFdbHkcq7yNJeqqutJuNaMdmekNM9cDYhnWcmqLCh5iJky1
	5xVAVxK8gLk1Xih4w2yfw/Iwc4oTqz8MGVpf4iK5IBjSEMC5K3z5OFW+oMJpTVT9jJyPMSjdW2f
	aUJyrbbZmS2tvnlh3b5g/Vy/Mh121vJaQkXT8SyVrvH0QmKkIkMl3PVH+5RYbN66MWziUpmsSbj
	OivbV/BLS0haWOsV/7HNpI5F9V2TS5qqdLu4t+r3Vw0PF9ttnSxCcE+RuiB8ISuMlIjffFouk5L
	Ey0ISWsx4rf4MIXJTx5SFgwT39ZgOYTum8VX1HSdPBNVDeXvLSNZENI=
X-Received: by 2002:a17:902:cccd:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2ed40deb075mr21202945ad.44.1793939775647;
        Thu, 05 Nov 2026 20:36:15 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a97bcsm1385255ad.13.2026.11.05.20.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:36:15 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: arm_mpam: selecting hard or soft MBW_MAX limits
Date: Fri,  6 Nov 2026 12:36:11 +0800
Message-Id: <20261106043611.790930-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_203617_051179_06110C27 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

mbw_max support in the driver always programs MPAMCFG_MBW_MAX without
setting MPAMCFG_MBW_MAX.HARDLIM, so the limit is always soft: a
PARTID above its MAX contends with low priority for bandwidth beyond
the limit, but is not prevented from exceeding it. On our platform we
would like to be able to select the hard limit, where a PARTID above
its MAX is throttled even when the system is otherwise idle - soft
limits let a noisy task exceed its limit and disturb higher-priority
work when bandwidth contention appears.

MPAMF_MBW_IDR.MAXLIM reports whether the MSC implements a hard limit,
a soft limit, or both, but the driver does not read it today.

Is there a preferred way to expose this choice? The options we see:

  - a mount option or info flag, if the choice must be global
  - a per-resource or per-group resctrl knob
  - selecting hard limits by default whenever MAXLIM reports the MSC
    supports them

Thanks,
Ping

