Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EFhkGUS/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M4bBO2aI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/xGQrCG52awzzQvRBpYcgebHANhUAFtZZDu5vnu6LgM=; b=EFhkGUS/38yl+H
	4UZlfsbuSglOEqjaZA4yWQgSgUuezpyD+RJqi476WuzrLQOuDNZCohpW5yif8K0AhLjIXjHT80hUF
	5QIDgOXRAIQd4FS9YijMtWNQ1dVrFUvOc5BKvjRqxuuYPOPf+RI/zEyfw06jy04WkcDjmnNdGU25m
	mmll9IGVLV8apFjRMT7pB200JuadBess+bWOMTG+9FksFnR960oJRf2gFE+FM5nN0zhio3Ydac2o+
	q2viufDSbyDrgvKNoE2F74hDKzrgOQq1V9GWNBJtdbDr5zSTy0EOAtKQlR1Jfnd9IciJ9taNpb6yQ
	WkWewyIbSaPdt8W9+hPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWCc-00000004gRf-3mrZ;
	Wed, 04 Nov 2026 08:18:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWCb-00000004gRM-0uKu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:18:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ed08b07213so1532205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793780316; x=1794385116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xGQrCG52awzzQvRBpYcgebHANhUAFtZZDu5vnu6LgM=;
        b=M4bBO2aIKWRR24an4i2tL7NAUI2MUyS7SyNWx9cvItX9HXL6cY7LS+DI+5VUnOHqE1
         sX+oXYYNTr8GbDu3RwxcME+ossG8ta20OlAlUxxJJMstes4JcGAMExgBvk8QmiCHYvTy
         C3RZA4CUgLjG/8MpDCk1Mg7H3/7PBIoNoZfTWL6zq8FV6tJJdpHnVl0GwFW5Uw900aLU
         sh9Y9fJusAncJD0TcorKc9Hw7s58FUL/y1/XVVxdaAQlDMB/4rO35/fZiISGg9snajQT
         L9qDmfQKkcqc7AhN4vuRujh1EXpx72i4qIRrDsDr9K/Ou+HM4K+ektwfnCAHEkt+yN2X
         wN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780316; x=1794385116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xGQrCG52awzzQvRBpYcgebHANhUAFtZZDu5vnu6LgM=;
        b=Z0vlHmX90bhlPR/YZOWlEWDvj/K/voPI/B4Yy+NNNQDvjtHM9orV9VqXSMVi6PH5Ye
         iICTZELEvj0+tjcFL5PpMT3l/6F7LQ2UZ5ydteb3CxANF+OUQtEnk16CE0UQqlbd5SwN
         7sGvU6eGqQJ5K2xV1hai/h2Su8ra7IJWFK3+ClkUKO6xjCjuYQ8yPZ4zAoFlZuSgWJAM
         RM4AtZLuiqA0SZ60gpG9GjlahnmWxYvjjJHtJrElhqSgjofZhYdLCw3cmYbNEpYMY6TG
         xaAU7i86JPq+f7UaVxuiD5N7gqrp3kqihz86kF0nCfqtOB6Z3LXlJT2DzuJ9gQ4PVuAF
         wcuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzErCjo0c8ZYx5+Yd5FelzYiZlZ3wi2wf3DbsM+C7dSjBlnMNM4VkmapAP+gYgp0/uUvl15HtiWC/1POTsZtNDW@lists.infradead.org
X-Gm-Message-State: APuU4Z8VY+lMsLvMhMhds6P++v6EyPtg7dR6DTPuu+oGpmS06lSGq8c2
	gCw0G80cxSiwASHyLiXolqzjyL6oKtKCaVl3cqsuikxLqz+o7ZnWojlWkhS66r7A
X-Gm-Gg: AYBFou3KGD8XPyt0NgMu0ymNbjjuO3qLbGJYM64volsDmHfvGV7JGJSksrZ2lz65C7J
	1VLtxg0pCFslvixJrzCo3zNRJolRO7WRKQ9gdQfSiGOd6aGbi/tKLL2UI8qm3oExgFMYGdPgkPc
	TPC/6Z2Rnita3Z5zu9r4ZERNlOnImeoi31MNVmRiIy0cBV53fcma/rz+QYJhxx6Kp2kypopLftR
	HLl25x90ZnwIaovFwiE1MehlL6xrZ5YKf/MVUb65i1FS7l/1YSZ0g1O6c4WuHv5sjY1u2M91Z19
	GgrfQLuaHzwT2z6wgAMDZKpbnjGtX2F1Nhp9bkx/BjVd7XUFWtXhbxAEeIII9kVEzLnjO87sRIC
	snSUop0W/OQ9d9ywjPNQyyenNB4xp9DDVZ8bW3aAdCcjosOLPppA4slLUdstE+TeQ6bMI216v9c
	gZ6+Q8ESGCjnq4fCKk/b228bSTAFHf28Pj9yhAHmFQ2EAW7tVciXr/emqiiBgnD9FY6/qUjHWc3
	ItItv390oTPLpk93aSFJQyWpmIOZ5IFgKD0THYl8xv5mFt/d/mmsJnu2EVqMitIPZmxBAjvK1N6
	k8ZXzVFbIpFG07E2d6jXktw9iIQ/l7vp1g==
X-Received: by 2002:a17:903:4410:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2eb364e0848mr143879485ad.51.1793780316075;
        Wed, 04 Nov 2026 00:18:36 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091f35cesm4521185ad.71.2026.11.04.00.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:18:35 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: arm_mpam: plans for the SMMU integration series?
Date: Wed,  4 Nov 2026 16:18:31 +0800
Message-Id: <20261104081831.312940-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6fd6dee4-7bf9-4fd1-9ad5-43e262dc6f32@arm.com>
References: <6fd6dee4-7bf9-4fd1-9ad5-43e262dc6f32@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001837_261197_427C3F9A 
X-CRM114-Status: UNSURE (   6.86  )
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

Thanks for the pointer - I will follow that thread.

Ping

