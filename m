Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB89C98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zmL50e1570AozJUJI4tJM1sQ+A41ismnbTdm3fKsoqg=; b=g7K6FQx6himlcwM6n9ge0D8kym
	BsPy5ekO2kQJeMlXoqklsN21oaTiLIxUAYRQw/Ce2KmAtE7oEhFifdYBulibq28jTPrcotbk0n45u
	CV1Yf68ZRkpjqu62Jq2evHOWmUOuXwfDrWcSlEonV3j0Hh+OX65DVnkYmmTs+Kr+u6uQUe8C1u1Yw
	Kx1h111R7muDILt40KJtxYQrb8eck3ZFRaTjJFdvFq3M5CLJH4ghxM9YrOUyT8da9v7J64Q+86FcZ
	NLhfyuFwf9gHdtPJviHOBejSA88GCV8ygc1TTEGQ2Dm1v6KjiGe8NNCd6ljraxMsuGusDqarIRYOA
	iGwogkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aFT-00000009x35-2poP;
	Thu, 24 Sep 2026 03:35:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aFS-00000009x2s-02F4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 03:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zmL50e1570AozJUJI4tJM1sQ+A41ismnbTdm3fKsoqg=; b=SsuZllYcMbYHtbY2T+//CmqDSZ
	E4xWW1TZ1AOfKWlrvMwzWhry+kbSkoNR7sOelBLs++NpQdgELShz+VBnM7afybYaom27X0+UmLHln
	HeeWgRjqmstXACNhsP6gDyAln+uuC+w0YgRipw6hhhIxp6j/lntdwR6ex8fBj9GqvRgy2ctwTsCoL
	eBLsYViVXlgLkqWJODLvgIrj8z8iJXHHvHX7pMoHCC0+cvafToo88b3s/0M7vji0Wjl0BABmrFcIO
	8XIpuu0dqMq92kPRlI69EX7TQbNfHq0PWYS0X1UNRZWmd+vujdGEsiFY8H2MQrAITSM3TY8pTkkwV
	2dbIgCOA==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9aFN-0000000FVJt-2bhd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 03:35:48 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso533090a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790220941; x=1790825741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmL50e1570AozJUJI4tJM1sQ+A41ismnbTdm3fKsoqg=;
        b=bYR2hpFqcOqzyVmFTZlSiGkGE8N9BE3zEw0j3oNfRGNarlBbice8eUEKUw4SxYmPOh
         3GcziGK7+xfhDLHBVGJx0FXMxMvH+FZPt1D4ccHk8bT8KI5HRdwQ9H5ps7nQALpRaKEj
         FwuIgJU2SLGo4SN8ILuv60td2ddZTbT79As0sTxXAnLfSQAGaixh9UAp5iYQoyJnkxRv
         JTIftTJ19SDes6W2WvWG/zARFwtxAQgZ/+Ff0cCKXHL/hXpYITGGzIGIdhVcN1dZdOwk
         qCdaT+VvwYCg6AHVlkwsifgWRjasAiP+E2MWBg5et/NTyZTFZdABf3OeF8HBU5D2vG8L
         iG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220941; x=1790825741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmL50e1570AozJUJI4tJM1sQ+A41ismnbTdm3fKsoqg=;
        b=2c+Nq/V9jHBQ7J3ak5eBnO9LVUlihSLS9L4lL7N6hF72FhTn02lg3nW+fbcXJAZJ0s
         B5jhOp4p9zlrUbeihN9qzaAxCfOwLUpb+YNmi9ZALRBygtAaXLjtpof3tNe9i8S0VVyr
         c/rprBUtCbPBlvWWT4DUbd6/lxmhzKVQPq6uYLyiH7TIUaWGQaXKJRadQbvxpDnIbpl1
         ZCumazLF5pXLXKsQ6ocP5wD8Z8LaqEOajeVn8jpimiyreoP3EUPOyGsikzSy21ywRyIQ
         Sp/p+cU3Pa4VoDnalbqrK8UEN4eQx1hSX/ehSwBu7adJMGr9+f3GIlAuwP1T/CpWP80O
         5OPA==
X-Forwarded-Encrypted: i=1; AKwUvBwOkoWdh5tu3mHkJGRN9c2LNV/eopELYnnNem4pXA4nt6moosFYUnFQZCc8BKSgxVcpUmiqX6TgWNdXNF63WsZD@lists.infradead.org
X-Gm-Message-State: AFuF++lQRl1RH1/HgU95zBaxOdi34Uu61CEtIzjfM7phqaLgaj18OHEP
	duHvgA2FE73jQvvdNkrTFuDWb81N0wb2wG0olHQFbw/SLsPce5cZ2Gnc
X-Gm-Gg: AYBFou2pMQm+lVptBRnNA8/QfpbF83LSaszjAvdJDfbOF6sjL5lURGl9R0cZCpTQCGw
	otUmoeLegbthtj3PWa2OP3jNm4KIjTS7O09B3RQcHl5y2U73BOpU1AjE6uK7PriG/8uyS34HTlE
	MStXCDTE30dTe1xQosE1hTB13Ouzs/ftAHik6rK2eQ/87Q0M4pKvXBBY+vHn8KA5bGtIrEPqJPC
	6Ew68eKHKw12jv/J7N/AnfHBaZwYXX3n/TpHWtsFMLL/75/1TgmVFhWL5WtsZPPp3XSgDexplxi
	kAJbs6Z4U+biS8FLVNpu3alOaKNQGUXTqK7cQAwGC0Hrt6MXqaMPrWUcPmhg0uYKeW70N0bm2ZS
	z1fND6FGyodNl0DNu4GRhGoiZJ1/g/cx7XZA+7FHoqFMrM3R4YpZ6/6d0a65K+BnVlvEXp3oFS1
	cTY0Su6380udZZeyzMR4IfuF7HuTCpk9Q8FoYZxTD8Md7z8fbkMbrTes30pa9K4FR5JZg1Tw3BW
	YjJ1tO7jGQgJRGFQAOIwgCSXtW+aKsLMaFNC2sHJ01dFq6r/C1DM+MIm35xkmG/Bzt2WxSiF80G
	tUdHks69rTjl3JKz/OdW3fB5dkqn352tJ99MHXILvTw5AEOF9x3aIAyxZs0=
X-Received: by 2002:a05:6a21:820c:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3de0e6783b6mr1486724637.7.1790220941322;
        Wed, 23 Sep 2026 20:35:41 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2251f5sm1896780a12.1.2026.09.23.20.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:35:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH] MAINTAINERS: name the kvmarm/kvmarm next branch
Date: Thu, 24 Sep 2026 11:35:36 +0800
Message-ID: <20260924033536.3624334-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_043546_678888_BB1F6998 
X-CRM114-Status: GOOD (  13.25  )
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

The T: entry for KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64) names
kvmarm/kvmarm without a branch.  The repository's HEAD (master,
0225fd5e0a6a) is a commit from 2020-05-01 that mainline already
contains.  linux-next pulls next from this repository (Next/Trees,
next-20260923), and on 2026-09-24 that branch carried work not yet in
mainline.  Name the branch so the entry identifies where development
happens.

Documentation/process/submitting-patches.rst sends contributors to the
T: entry to find the tree to prepare patches against, so a branch-less
entry whose HEAD is already in mainline points them at the wrong tree.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..8394e0a1c149 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14301,7 +14301,7 @@ R:	Zenghui Yu <yuzenghui@huawei.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	kvmarm@lists.linux.dev
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
 F:	Documentation/virt/kvm/arm/
 F:	Documentation/virt/kvm/devices/arm*
 F:	arch/arm64/include/asm/kvm*

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0


