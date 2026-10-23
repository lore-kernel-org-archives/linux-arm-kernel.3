Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA180606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ympHR9Ej;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d/639LHk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=; b=ympHR9Ej+evTPg
	TP975AUTBVMdQKYzVbNSfWIz1K6IiHm+K2dsAiW/cLJG3+whXZSSTRml0+FreUFbPVcTD1qcXaj60
	yGqQ5MVevH9qS6xWZ8qa/zJUI10XRLkw5Swr7luaIiXT+NhSZqLpqkLUpYRhouK9OGrMTE/O0R16k
	m8MLWY6s/q4eR3HBFOnTZQYueZolm4OI4Emo2p6Nd7S00JBE+T59LzGvrE21MRLzKh6ox73Mi2QPw
	IJ4P6A8e0VagtSgcN3d0grXu8UBvVaN1MmazeMSZJQvUr4ofquC5SqFWDVzM8m6bZyIDJ0HXFrjdI
	0rUGCIHD0mMxc4zlCZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKECS-0000000GHZr-2UCf;
	Fri, 23 Oct 2026 12:16:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKECO-0000000GHYo-0oOK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:16:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c34bff61551so108699366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792757798; x=1793362598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
        b=d/639LHknM9Sy2cwPPPUknSFeZI0n7vuWAUVblOyf2SxNqIs74Z0v+wPk/s3oOUQ/Z
         sBs+UHk++HhTQcSXCCy4roIdTn66814YTI60xJ0DqQw1maD2bbGDf12zm7bG8iJyLtKi
         xj+QfuTdHA6dISUKWNRDPt1bJ4GSghO8oFBJeyJSOQ0hYNJll/HsCoj1aQUuq2H4wz6S
         sv0EYJ9AqiQvYX4BPoZCFSwyzz7KT/ZdTLlUip72HwsnIHT2inwP9emgxPyaNRCQpR/H
         PlR2mmA6oOF/Yf8FJAG/femBNVWuTC5ixLW0B7sQPbza3iGR60rvMEsdV/rx32U6Q8i1
         PU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757798; x=1793362598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
        b=LTvraqBF9YqpUNlUvSdIc5VM1EIp429ANYiu9XdeTWxXa0/fYgYpoSdbSkyTjCtPX3
         eozAEn0s4uL830ZmVOBtILXCzurZ5kvqOcWV0n3/nv7qjvwjWKFSq2l+CWyi5SS9H8UF
         2LmQbJXEzkVSc3rfP2VtW8peDazqgaZqEwlrClnMyTv1A/DVizkU6beAyo4hJr+RjK2o
         4ugYclsF7ZLw4YREgX+O//tUI2uZut3q7GwFyOTfyzzQh0hZWGjRrKW17Qu7nRVGzpVq
         cDGaHqMkPT57RwW+IQBrP6NY2LP6UJm5O+miel1EU3KJJgDSjX7gno/NaGciLNzy/zLJ
         wG0A==
X-Forwarded-Encrypted: i=1; AKwUvBw+dIbiqLZ4ubVJn1zp1LxTq61oWHunXQgluf/EAsEhcT+GsRJ+tf0i0TfqDvBoHO7r+EYwgkTDmvtjkMIOIb67@lists.infradead.org
X-Gm-Message-State: AFq9FYL6BOJdy2/cMVBYBoaLUq5jFglRbp5rMb81/HsanJEhGoYMBJdl
	LLXRn+GQHev10KV2fcs/Yr39YJK/38UCbZiz7ruHCsskZQVaqFC35K25
X-Gm-Gg: AYBFou1sKX5FVk3IR+Uy1fxp+fGOWJVsRZilm1fvIFUpTtmNeOX2y30qYtN0+CXVV5g
	Hgs3RM3wgHZGKmJN6Z7VXaG+bSRROrETEt+XzT6DouUBnMh8Y3ZzHSry8KJeAfcFEheFSjJ6nQP
	VPvgolNOpm+yhnPS3g+XGNce8UiwlHBtKNWuIpjyM3n8ILKB6oH6aeeu4bVw7Kotf/b6fKhN4h6
	V0FHr075WDIIMbISxhhPkQyM5M9f7WgzfOKM3pwPTCiq2w0whzYByU3bphIHX6oz5jfagP5ny31
	bxSXkDTSxO4n1myB1SvgJpqKK/D6pw7jBxa27W4DST/D6cT8t/m33mNhrTk7EoJgtulGW/H42p0
	zDLwDulrCVVJzO051ZNrXwPrKAvvYCIJ1pRD4+mafQeU7wBszFG8B3M54ax6xdzGBLQygmb+fgH
	zaBz5LFvSaMLMMNa/BZcCUDqRsbN8alopU2hu5wtZ/ddnqPzDWekWzK27+sckW8lv8tMqmPpOLg
	DAAsagJzeWvfs5S7vlwGhAREsj9lvDNqBUDllHJi4gTV9aMPg==
X-Received: by 2002:a17:907:9309:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c46a92d5849mr287640866b.48.1792757797774;
        Fri, 23 Oct 2026 05:16:37 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4f::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf5540sm95824066b.78.2026.10.23.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:16:37 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Jinqian Yang <yangjinqian1@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Andrew Preece <apreece@meta.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Enable dynamic MSI-X allocation
Date: Fri, 23 Oct 2026 05:16:35 -0700
Message-ID: <20261023121635.2190639-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022193620.2152038-1-vlad.wing@gmail.com>
References: <20261022193620.2152038-1-vlad.wing@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_051642_574154_9C1D2D35 
X-CRM114-Status: GOOD (  10.82  )
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

Two updates on this report.

First, a correction: it is not specific to our debug config. Our
production config hits it as well, on every Grace + BCM57508 machine
we tried, at the same point in boot.

Second, the root cause is in bnxt_en, and this commit only exposes it.
When the channel count is raised, bnxt_check_rings() allocates the
extra MSI-X vectors before firmware has reserved them for the
function. On BCM57508, writes to MSI-X table entries beyond the
reserved IRQs don't stick, so the message written when the vectors
are activated is lost, and the entries stay zero after the
reservation.
x86 never notices because GENERIC_IRQ_RESERVATION_MODE makes the PCI
MSI domains MSI_FLAG_MUST_REACTIVATE and the message is written again
at request_irq() time. With this commit, arm64 GICv3 takes the same
dynamic path but writes the message only once, at allocation.

Instrumenting the driver showed it directly. After the channel count
went from 18 to 32, MSI-X entries 18-31 read back as all zero, while
the cached msi_msg and the ITS LPI mapping were correct. Exactly the
14 rings on those vectors lost their completions.

The fix is posted to netdev:

  https://lore.kernel.org/all/20261023121321.2127263-1-vlad.wing@gmail.com/

With it, the same machine runs cleanly through the channel change and
the ring resize. I don't think the ITS change needs to be reverted.

#regzbot monitor: https://lore.kernel.org/all/20261023121321.2127263-1-vlad.wing@gmail.com/

Thanks,
Vlad

