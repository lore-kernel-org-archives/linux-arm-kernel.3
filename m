Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653D1C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FitaPU7xxm51lVtdh8ABlftRiy+/s0hAsRKVPTqrv4=; b=2W5djRKYxhWa9OD5wiSQqmLAYl
	HNc/bKcwAYISVcXSfiBJcXDlbxw7jh4LMu6e1C3Cvv1NQINF7Mtvb/kzvBFz5PLReAhlvilHSNErU
	dtER48xZ93eMqS9Z+PkjFzQtagTbN5viFen2By7IfQgzEA93wvJT1D61sC6B70VRzV6jPfja9EBBZ
	5KA7Byt0wSVP8biEY/yq/rxBojh/8wcDCebAmK56sRw+Kv/7QxDUpGZjwIw5VJ85fkzQbJe5DdWZ4
	bj8CzX96UM6HatLTsHNHHGsHpipcfM92AsHsNDtEhfGTss6RXW0VpWj+Mjknq6ohi1bmkLk/rEagM
	dNK7ePlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7nYG-0000000Fxbn-1YRb;
	Sat, 19 Sep 2026 05:23:52 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7nYE-0000000FxbQ-0EO6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 05:23:51 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso14775325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795428; x=1790400228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+FitaPU7xxm51lVtdh8ABlftRiy+/s0hAsRKVPTqrv4=;
        b=VeoqmfSqkAOJoGfTtFdypVXjkDnNt5b7sc6RGgn+Ng6YVGrc3/TrlDxEQdZkjECgKL
         mObX94YdmTve+XjdeEzX0tPeDBifLaRFLyXiFnLqLWANko1C/Utuy6MbcAUUgbZ2QbT8
         Hrn2nN8ozQ2xMUxu1JTJ08rsuyUxlTkiIwoiwXENf8yv1oeu2q49HqnpsLkOvftPAMen
         Y++zK32/mYp+xNIS+O7ES50k3DvpGBjTr8xuFbGEkl5UYaBmrtNZtxqjdvQ9vigwpD4n
         t6BMzifD4J612oRIGssylqdgnd4/a3XJMAfU2fU2+AE/iJDmPpnpdvG21ES+r/7Za8zb
         0x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795428; x=1790400228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FitaPU7xxm51lVtdh8ABlftRiy+/s0hAsRKVPTqrv4=;
        b=VTB2zthfgsi2Dc18hDcb1nuBD/ZkjmrlGib6nc1VQtBGeltFr1ZBuTGqsPTAXyEJfz
         4s4oMKF2wTavCM/v/KGt1mb2PS1R6r0HvjssCiIrsy6KnMUdT0HspmoSEVa2w6BkXgN5
         VQjcNLonwCf5x1L8Zdk+JZ3iBdDuUn+ndllR0u8v4IHO2QIwy+qGxd/Hx+BluUopG+wv
         7WeA9SJO8sHKjcvGGiAM6cEBW73rxPH9S0ZOW39aF3F+mWe9P78FXICHXKE+pV+eDMdX
         vtSDU/ojrhSZpS7RFudpT3lMaWlA+8naTY28UQZ2xTeLufTCkCKS2JnvDN9NU9IMxCTs
         EXUA==
X-Forwarded-Encrypted: i=1; AKwUvBztLKuPM1PrlY+J+v734CHv2VYVnJHfGHe5ay+lcXS0TRM0KXyuyTIsdoeJ/fmx159bvR9hBCFBRB6PQEerh4aY@lists.infradead.org
X-Gm-Message-State: AFuF++lZ3APi/yC1QDpMPDQdhamUo2D3o6KE1jC1hmjKbLBjt2v08n0v
	xz40BQwqpj5SMDDNXGjLmmOB8UrqvxxTLUYxv0fSzFtjcyWJxnAvuUq3
X-Gm-Gg: AYBFou3i0mwkJRxBSluiUfnvKdfM70YRHOIbSX5Ae4vxSilxf6gjL8YihH49tGmWsXZ
	4YXaxftOsPcgORFQ/LYFGOaDB7Hhe6n6hlqqFXVTOu76hCpjp3p/ZObCXv1eUpyYqFKCQ3RFhW7
	gq3MHco1cATnphthf2XnewIMUGNVvzzBLhKV2AVMk7Thxhm1dxnyvN3udExpwjyzVUfIp20kP2U
	6BZ+Dt3WqGCYuYGHork5fUaWBnCPryFUZ7d6ods+vyh1qT2D0C5XGJiVKc4VuX7VwE/l8ADrMzu
	BL2gc7w9zGJ5/glCPSZGaYroaRDV4AGzvxYMeLgQ/jddSX/TYuQF+TeFJfjfd+Mwk2MaV00noWH
	toZr+kjNGRf04CeFmAKuWkiwlJaJbhD8Se8b9iaVHLXSQGSv6BOb/SO3cW86rJ1BxipHFqVJuGx
	sclVduPQWp+MCdYC9HfKWej9edfrnplgj2dLyJ//vowdtfV5GEQaVc8AW5M0soRtjIbTGxxm4xo
	v0b8WNPytjGmaLnkM8mybHCHGF5a6Hmcg4c096eYLzqz0mi3sgsiH9sERhWTNi/kM5T1EFs72Mn
	KsKwjth+a9u1czDwkwRbeMbUjsuAKOzoTIXjN4uQ//zGpIuYM7w3Xf42XITNSNkdjYtN1+uWY6T
	E953J1afnzwYch74=
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr69948685e9.31.1789795427940;
        Fri, 18 Sep 2026 22:23:47 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm109505565e9.0.2026.09.18.22.23.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:23:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] ARM: mm: LPAE: Change THP helpers to comply with generic MM semantics
Date: Sat, 19 Sep 2026 07:23:44 +0200
Message-Id: <20260919052344.23653-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260824055938.27594-1-kmehltretter@gmail.com>
References: <20260824055938.27594-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_222350_121300_F0BBBB4E 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

On Mon, 24 Aug 2026 07:59:38 +0200, I wrote:
> pmd_mkinvalid() clears L_PMD_SECT_VALID from a huge PMD. A PROT_NONE
> huge mapping also lacks that bit. On LPAE, pmd_present() therefore
> reports both entries as non-present even though they still describe a
> huge page.

Friendly ping on this patch.

Adding Anshuman Khandual, David Hildenbrand, Ryan Roberts and Andrew Morton
to Cc for review of the THP helper semantics.

Thanks,
Karl

