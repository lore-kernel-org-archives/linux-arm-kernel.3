Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B9FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYxTVAjsGxeUmf95RqPAneCR1sWTOQl1lVEKrRFGqUI=; b=m+NgkxpUXsTg4WUy3/HFv/IZjp
	EoXT4RpKk6iQn/56gKbD6Mdl4lssLMkUEdi6mT41QcntGs37Ys1qFA5CsSeStjUo1PK+sFOCsq8hA
	fyPauIlhv3futGZ4O2kGhKMJRtPErTj3ta9ogxtquL0iyWLZMTnsSY+cc//YB3rsg2lpFbNnks/6j
	IMWbmcQtRI+lLOhVdGFoWk3KoHGrEgAppFWf/0D2b9vMfeUuH+rTh4GfudC+IrlUpuLSsnorau7HO
	4dx0901JwwdZl0SoTkj1swFQ/c6tg/kmKE/zybT25h18oY947fX7bddQZg2R+iS4+PKaLXo134VPf
	zyhhrxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTFJ-00000007yeA-1bGO;
	Wed, 08 Jan 2025 10:25:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTA9-00000007xEO-3Cdv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:19:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13A6A5C077A;
	Wed,  8 Jan 2025 10:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACFDC4CEDF;
	Wed,  8 Jan 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331584;
	bh=2F1NrFzFunGtkEPuCgh3gTbxu8JlwOElD4NMwPMw67A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckOeQpx3w5mjprCv5AV/IH16AL96ahmq6Hj0lHRYHNlsrg/TbNLS60vqF2Mmy7X49
	 vlp12ql28ghZCV3hrVC9rzeHOZVSEP/bcALI7uU/FH2DEmAPKA1JVgPHkSrHG7Fcx4
	 pLgBfary+k6KLNV6iFIOpXzyA6JGqovw2VhHOPNliRbZRl9D75U5tt93omiZ/25QXi
	 GObV26ziRRStjVHELkFRDbZmw/sSG04ASlPwCJZVg5YquDmEMkvCrB6EQt/4FM2283
	 ac4io9IIsm0DGeyOUDLihHQ3+r7X7W5xcg/9bBqGxbSH/8ghmmJ1XI2giKA9ZJ9G38
	 RJXfZCXGYvIrw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tVTA6-00A65Z-C0;
	Wed, 08 Jan 2025 10:19:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: corbet@lwn.net,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3] Documentation: Update the behaviour of "kvm-arm.mode"
Date: Wed,  8 Jan 2025 10:19:38 +0000
Message-Id: <173633157442.11636.146865542234649551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241025093259.2216093-1-smostafa@google.com>
References: <20241025093259.2216093-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, smostafa@google.com, corbet@lwn.net, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_021945_839416_505ED892 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, 25 Oct 2024 09:32:59 +0000, Mostafa Saleh wrote:
> Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
> VHE support") modified the behaviour of "kvm-arm.mode=protected" without
> the updating the kernel parameters doc.
> 
> Update it to match the current implementation.
> 
> Also, update required architecture version for nested virtualization as
> suggested by Marc.
> 
> [...]

Applied to next, thanks!

[1/1] Documentation: Update the behaviour of "kvm-arm.mode"
      commit: e8440c1e2d23a9ca5e0af1a18be637cbd5a5d44f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



