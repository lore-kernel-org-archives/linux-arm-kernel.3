Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8068606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 03:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uofgkCix;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrZVU+VR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rbia2ZdVtMV6lCwGNxC4eIg9zkBp56JlTOTvsadIUzQ=; b=uofgkCixMgG93Z
	MyfYn+RqilKukG4YPfM18IH7/XYRIs0Dv3QP6mXyqReDMo119v4IG3rEwXGz5RIso61ZiODC0o6l5
	xLKiCv3B+y5EVYhXo3GKPCljEEWPXsZLTQcCB2XzYMouPcR7GqeHiutPi+RVa33UmE/9hpkqz4tmF
	Q/PwcZiShzRQR0lefPzOZOrorLqLZ0xAYQOj2dUz8A8JBDIXjBhJK+dd5mscXgudKoYks1EycPAqX
	KcV81ckluTTQ8LAIOij+1JvJw+y0dBG1kq23P2VukCIoURXBxtiP9gdkP2C+Url0/ufMeBUlFbgaq
	FW3WzaDHs8XzKhIZhBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNLjn-0000000DpVx-0PLP;
	Sun, 01 Nov 2026 02:56:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNLjk-0000000DpVY-1OpM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 02:56:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso784528a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 19:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793501755; x=1794106555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbia2ZdVtMV6lCwGNxC4eIg9zkBp56JlTOTvsadIUzQ=;
        b=yrZVU+VRDYmeM4MXdvRMyFSlsPcwMDpo7AzP3pyRGZ3u5a2kPFWRfCsZFtt9CI5F2K
         aZHz0VqfMuyAEx5z3aCMm8/H7Mnrr+PYGcdZkJG2i8Q4FRldRnXBNxW1km9eHeyxfRD3
         QB17tmHYEuGcur28WGPejyxNBfMOuEPugaTmrWp0VQi/gCWyXRMbxFOJOnqKH4hx9asq
         /JdbLwDeSYnhwdR1YiIypjD08qlAdGcO5+b639UCBrQvxAmQJlPd6d7kA7HYA4K0UFZE
         wqkktU/XLCjBpcT7dDto2sk6Ws4B4CSJMHKy08g0P0mNcVEyNB7LiVXFZAdcszQnbcIy
         kYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793501755; x=1794106555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbia2ZdVtMV6lCwGNxC4eIg9zkBp56JlTOTvsadIUzQ=;
        b=ApA3JIZGwVQbZikNy/eATkybSE/SqiQ/AO4pbAFeX/KFG6mz+3TwBnsfVBnq8YhGyj
         7IadCRhTLawCdGG5WJxZxexM06Mky4E0wyj4cFb3ljMVtdiJFsTqZY8/3Vfrx2UljW/M
         i+jGspNCjoO49ctIesS+XKhPKNEMkNq3kfHw8NUY8ZHDKjIya/CebVZYAJLpZSrT3hI2
         GySUp9b7VWjMZEfBGXIBqp1DSDZhRm132iV+Amf6WHvf6sN28+5niZTE6ZPeIPCNlhU/
         MNDVdTZwMRC9AuMso/Lf6/jDzAZkDXGfRf7vjcNwnl+cj2KKS4hXx6CGlzSy1tcGr49T
         nA+A==
X-Forwarded-Encrypted: i=1; AKwUvByVkV0WiQTxmBfABjQ9yUOzWR+2M1sZQykyi0+Q4xR2BI+TWcFBgcYHutcVAr0t3KV4fOV+OUpfUFabAvVhwhzr@lists.infradead.org
X-Gm-Message-State: APuU4Z8z7UL217uUC8hhoaXqu49ezXSQ/iOic6MgKbGdqsSjsDFkx8Ll
	lf1yHiEbP3GcpbFDnu9I5+RQ6Qtxf7CXdYAv4MW7n7YqrPXMRsXUAYyR
X-Gm-Gg: AYBFou1xLRY+HNCInrA09ibsrXruQlMM9CuaBZ3k3dikNU6we3gnE90+JTeXeA1ywub
	tV0Szpub17VWJ60iWvTZ33ByOKWGNJ1SrX4r9QjoXIDhI4XwEl/c7WlyBq3khbF/X6KFrCCvyeL
	qzv6qZfnJPNvMT3Mtqwo7YNDWf01LwTpyP8HPVGagmKk+9aIlWnZQyWxU39fbW81jz+hKsvsqQS
	apHyROxyv6/CVhHr2ls+nxkwJeYStAClWlanP2B+6ylxTvCzwFWT9au885oYOwhI7+sQSWFCmjS
	YmgHNrC/mYQ1sbmZw8aXKLJInPL/1PWZpm7wFtwE+3nd0FFLNdfKUEIBUqIkGuGtW0B15QG6EgM
	uV6UkST8aw1heC++DObw29FoFGTrwMNg/8hMmES2qa8CN942agbMR0tee6b3oezHOiTD93uqU/f
	bZGrjh5JqL8dagCv7XVcUgTifPzOn3ztfS5NRziv3WJGyM0lmik5vFgkAUFm3cGGqwPMGFCO0Wv
	jE1zux1Fmruas8NsQJ/uIEwM2wngAjzhR+kXrpSCfAwf/DcIqc0+hupMKYDtorxr4Twl1yEjWg3
	rfwj/xkuBJBLWqDEeh2wHZ4IDD+NxWjVCA==
X-Received: by 2002:a17:90b:4b8a:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3ae89771679mr5168991a91.44.1793501755440;
        Sat, 31 Oct 2026 19:55:55 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm8980297a91.4.2026.10.31.19.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:55:54 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
Date: Sun,  1 Nov 2026 10:55:50 +0800
Message-Id: <20261101025550.1633447-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
References: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_195600_380799_76BE8C82 
X-CRM114-Status: GOOD (  10.23  )
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

Thanks for sharing the direction. I asked our hardware team why they
implemented HAS_ENDIS: the motivation is power. Enabling PARTIDs that
are never used does not affect performance, but costs leakage in the
registers and combinational logic behind them - with e.g. 32 PARTIDs
implemented and only a handful ever used, the unused portion is pure
waste. Their expectation was that software would enable only the
PARTIDs it needs at initialization time.

For a general-purpose driver that cannot predict how many PARTIDs
userspace will actually use, that is not something we can do. So what
I plan to do is either enable all the PARTIDs from the driver, or ask
the hardware team to drop the HAS_ENDIS feature.

I am happy to drop this warning patch in favour of your driver-side
enabling patch.

Thanks,
Ping

