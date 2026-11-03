Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657ED606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7QN4P40;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2UEH7ON
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8wBqdKLHHXSqR7AJ6tuSpjHoQqmJinv7wm2sN1Tdae0=; b=y7QN4P40+2re9yh3M1BFObi145
	nBpIU6htxpCRJ7aQJ/2vk+i9NbU4xYq3xUalaJpDqyFd/5Ty8WB8pPUqF6YkcnnjrcW764JnTAuA4
	12HRWfe7vPzQm13awPT3XKQ2f5z5dvx6w8xhP20W9Zt7VAIQHdRCYX7sbC4taKuEV+IbXVUXYDEkL
	rBvP73W3Fe7zagnuJ2/MNNm/hqKrWmxLUDdKb3ObJnHEHZoNV+GLNH6Wv8D3BUFyFeNuD2pcJQJD5
	9Q951nYSDO/mX/NG1GTbPXPndflMmJFjB6NQfyRlLKe0x2x1MdMT57jbw2dAsYQVipqoan5WvEuD4
	FzYedcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODQW-00000002Lgf-1cpi;
	Tue, 03 Nov 2026 12:15:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODQT-00000002LgK-094q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:15:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e831e86ebfso24951735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793708140; x=1794312940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8wBqdKLHHXSqR7AJ6tuSpjHoQqmJinv7wm2sN1Tdae0=;
        b=K2UEH7ONoXqFxw2vD3aW4wzYWdDL3VZkrbGWSJgr7i5MlP1tWrSdJneSf8t+T/XK4P
         858ZW3YPSSQTa1b9hZbh3mElLg7Eg+25V7zTGSO2G2L6au8hthjV54GOkXt2kiiroWMY
         KZpc4lg0nboaJKSiuLPNJAa6fTXboTcC3lxFihTjCZyBabDQnuoLMnU3FFp61BEEL6EL
         a/5s5EItWFjr3XX4MZ5mhxGTfC08KH0BgqUkcAvcwNR+iT8sd0+HF0CwSkUlEea7DVoz
         ddwDpcku029QIR+Y8PKUI5XFpLBxQ4jlMOiGa0SJzMnGZLNOIrQTq4vv+d6cvL2BXoLQ
         PIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708140; x=1794312940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wBqdKLHHXSqR7AJ6tuSpjHoQqmJinv7wm2sN1Tdae0=;
        b=sasPp2IZUXCBntRRgxfA53+43RSyZ5Nq92KG6YlM2MewP300jgNm2S7AZQtmORWFbg
         uskwih+wlGwTwcZamd2A4uCf+JxSUzqguKV6FLCHd2eweV9Ze3p6t32QCaggHo1fJ6wf
         pMQET8crm09cjYhRSWJf/9oIPhCCXFUlbr4mTF6qGgSYGPdAaCMVKm9pzvOGQTo2e+EJ
         /OIABxAX4fqd4iryxaPVeun7zVUXbDHQFqQtbnKpCxmvAAxoM4nKcPwUHqwawVc/Q9Z5
         ceIqEjOgH0puO95wCgpx6oQKwTC97SJPoYi91Zsm4hjdipscPCAQR5SYGOgvrXKlPG0/
         zl6Q==
X-Forwarded-Encrypted: i=1; AKwUvByBYsF16764EhKkn1zPN1PMF7MbIqXLvnViqgSQRbKBLYvaedcFZF4rR3ZuTmEFu4eOd2L0i0Ee28EAqYfEQdGI@lists.infradead.org
X-Gm-Message-State: APuU4Z9xwsAxg6sEnrMLROO6LScOIjO6xC6VtREjU9zPv+HaR6Swb5je
	POketMp47YNtsrH4hI/jXu4W7c1YcEBi+06TNZia+z/Bo7U8Cxvf1O81
X-Gm-Gg: AYBFou0gDJMABHZqGFXzaDi5VhaNzwNlCByIaVW74qsGTKkdEtVG2VaeiQY5VrLbrls
	rnc1cLCDQGwZD/5uJNX7CUOZ1wf7ALXrIcirCJd11IEOveTFkHb1oY28js/xBmTxRPCXylIkZQT
	3lBx+zTRSUxRo3StFeRe6lupsRSUFxd3pU0dwF3fHYE7LF9EPChU+dL3zqd7U+1iUOr/V5dM/+L
	UJBf8GWLRDmELO8mpeJrZCePPmFOVfKFQUazbsZOeDKHtW7XrLMrtfkyYjzqsdZUJ2WPExQHU4R
	bka5tWmfwsYyuFGA8OJuEmxSFKypCHKcVA63WthRFlp+egJ/n2MPmNXfOL5Zfapq9/cavw1bVB3
	qlyScxs+WISslu0/HVbx3rS1ab+2yu/0xm1GNNt3if/WEtyk5RBYpbm93QBQcjnSSYsDD68k22z
	wTTKv7607O3rTlSn2R4zi5xeBMIrNWxj4uL1GAS+lh9JT52RCh4NrM2VD88OkPiDjQ928CGOOBs
	M4xwJeg/dLVWaUrNNq2WEewjN2aZliuoR3uG2wAaXaMM6kGpju7f3b2ypiiWXnjS7e/WwmLTuu9
	5FhG41Vmoza48XiGm9o+qM99MVJaVLE4yKs2P8EuUU5I9GK7vJpmjf4=
X-Received: by 2002:a17:90b:3d47:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3ae8981280cmr9675823a91.32.1793708140115;
        Tue, 03 Nov 2026 04:15:40 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm4177200a91.16.2026.11.03.04.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:15:39 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: arm_mpam: plans for the SMMU integration series?
Date: Tue,  3 Nov 2026 20:15:34 +0800
Message-Id: <20261103121534.532108-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041541_802500_BAAC456B 
X-CRM114-Status: UNSURE (   6.68  )
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

Hi James, Ben,

I have recently been debugging SMMU MPAM support, and noticed the
series James has on the mpam/snapshot+extras/v6.18-rc1 branch. Is
there a plan to merge it upstream?

Thanks,
Ping

