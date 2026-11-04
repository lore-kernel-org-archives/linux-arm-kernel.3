Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB2606B20A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLetVDIM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P40ibt74
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=03p1pprZCSwUe6A7V6YqYouefYUwBS9DJ6ISTtsz/84=; b=gLetVDIMjuJVB1rnBGnhNYEumm
	Adq9eqOPHw2deIx3QQ12H9ZiiD87fvG+3ThsWVrYhZqMbqcyDeHz9+sfr0YheeXXwP/65FwUBg2Q3
	07R3+TYWgiyJW6LsQ5bfeMndNGwY1AhRuK4ovSciCAskCtzfUMag5VGMVyhGbFns4ATk5K+wTiEcA
	JqC9s4aNv1yyskhr0uLZxVz2hNl9kStgaK3CgN87B5MIxgOJn/D1BdjsyOk5MsYcyS+Dy8h41Sex5
	8x+ejHhycDMdW246qZ2fk/mg/MyHb/VoI6jVOMj/CkOqu7UOHdVaMIHvT87tQfkKHpx3mSG7RFpxX
	LUL0SYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfQi-00000006MA4-1OJp;
	Wed, 04 Nov 2026 18:09:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfQh-00000006M9r-0cQW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D01D043C84;
	Wed,  4 Nov 2026 18:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFE21F0093A;
	Wed,  4 Nov 2026 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815786;
	bh=03p1pprZCSwUe6A7V6YqYouefYUwBS9DJ6ISTtsz/84=;
	h=From:To:Cc:Subject:Date;
	b=P40ibt74tX9V+cLOU9Z3whZD79Y08FrrfffnO03aj+GiinK/r+XCC/h+d+2o8lJm/
	 bfBPEkEJP8d8SUA5nWtpsS+oUteb3327f5EBQTM6+l6wNsoEbdSltdwLCc9NCuPCGf
	 Awl5u2OYbGFD3vhzAtTPNVHlaxrWPgncNidU1+ei8RMhcf1HSR4beMWnolG5RlK7EB
	 3Dg0QZkdl+juSLgPkmxGyLkLIXnElCH8WSpxBuA2ToLsrwEJ9C0WyuBn4MrD4MIsvd
	 2P579NsW5/dsD4xmzgSzroJZm+Bjrv8jXTFU3Tp0OOsocuytCbp0F3mDL4Cz2Ayj2G
	 kuaJ8pTGHptIg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 2F1951980047;
	Wed,  4 Nov 2026 13:09:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 04 Nov 2026 13:09:44 -0500
X-ME-Sender: <xms:5nTram5bBE7hutd7_1QfYZpXqovXQ4WJhzIeZFy7_ykQ7-DS6QWsPQ>
    <xme:5nTralEJ6P_Le9QmrJ8tJ4-22vDz3bVmWtNee6kM47qa4EtPYlCNVyAQAAOxl8gix
    8ziheUZKmGw2yX2auCyecinzyvG1asdzzBvidAFzhSjUxpQ02ijYOK6>
X-ME-Received: <xmr:5nTrao1FQWK1jvDLjkYyZoOkuu1D5tNxFnVsVgd-RRNnAn2ooAI_kOUYaGo>
X-ME-Proxy-Cause: dmFkZTGqVitTKSMs3Zf23Cej3+TrPS6tOZBUqqz4f5OLVPy3ryplzwWG/tALWzDH6gtEiC
    fQx+R+7kN79HtReRvTyG38G9fX2asBXXmMl4SNOdZWP24Jimlh6/VJDMaEhwzmuHyHiZT0
    2OTxTfdeW5I7Pzmww01wdc3jkFHBRZuQnEvZD/DEPMalun2aXaaRhPaGSLHp+SZNrw4uCv
    Z0Wt9Hg6Rigg2ekRa62L3GkzzNcwZ44x+lWwHfz8ID7RscQ9YjJco53u6DJQdIrd1Js9xN
    eBgiRGSUa0GAlI5WJBjz11af9KminzpLRkuP2Cu3lkot9HKNfLXa8mXQRo10PYZybi73Ij
    yfp37iJRF+FLuQ3BHAKlk/oDb/JWLDxW4QXo3Xix740K/LtPJ12eDAecQHn+7studYBEMc
    hOAFstiNSAz55jhyyz4xvp6ReCg3OwLTfF6Q/LlkbPoL4P17ESTDYF1cL0g5PNxD1U6Zi1
    EL80pamnbUuKF/ePVXyoVIjrkfe+cy3amZAn+zNx0W1H8+oAjhraUyQdUuFaRCpkUiuyMN
    lNqiJy0urjwd4dTpzRj8RNG6ArU4eMz+IyX24uOp333Mpb6jzrYu+5RBIWKrGA2eqDVQwv
    eOu5Caa2KZsVnxzIt6Qv4PrIDRBS0foA7mogrtX9/DkxKEYCJkI1DAEwieEQ
X-ME-Proxy: <xmx:5nTraiqKYXxovMZDpyxJsCz_W3ATSCZrHLI0oQ27l6xZtBY5pp2rag>
    <xmx:5nTralMj3UTwCpoZ_--VkqfHLVinLbyFAKEelLLcVRd_mNyPjF8gnw>
    <xmx:5nTrakUcSctVgp_7-fl3IfFWGtda8jUPYodG6i0RYTSLezQO2sAlNg>
    <xmx:5nTraouY3mXRjssrHav6kO3-b3HmnDYSl8AQR1h-F6EluDlL6YnQow>
    <xmx:5nTrav3pLA6jnMiDVh7c92GvvBMzClkMvYwjmjU7MVc1q8DnHOxaqHht>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 13:09:42 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Usama Arif <usama.arif@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: sdei: Handle exceptions taken inside the event handler
Date: Wed,  4 Nov 2026 18:09:32 +0000
Message-ID: <20261104180936.2981070-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An SDEI event can land anywhere, and a synchronous exception taken by its
handler breaks the context it interrupted:

 - With KPTI, an event that lands in user space runs the handler on the
   trampoline vectors, whose current-EL half is empty. The exception
   loops there and the CPU is lost.

 - The exception overwrites ELR, SPSR, ESR and FAR. If the event landed
   in exception entry or return, the interrupted context runs on the
   handler's values: a task gets SIGILL, or the kernel oopses on a fault
   it never took.

Patch 1 runs the handler on the kernel vectors. Patch 2 saves and
restores the exception registers around it.

Handlers take such exceptions in normal operation now that SDEI delivers
NMI backtraces: show_regs() reads through _nofault() accessors that
fault, and a kprobe or WARN anywhere in the path takes a BRK.

Tested under QEMU TCG with TF-A, 4 CPUs, 20 x sysrq-l under load, with a
test-only copy_from_kernel_nofault() of address 0x10 in
sdei_nmi_handler():

 - v7.4-rc1, KPTI on: CPUs stuck in the trampoline vectors, RCU stalls.
 - v7.4-rc1, KPTI off: 60 "unsafe: exception during handler" warnings,
   SIGILL and SIGSEGV in user tasks, and an oops in execve().
 - With the series, KPTI on and off: no warnings, no stalls.

Patch 2 was also run on arm64 hardware with firmware SDEI, where a plain
sysrq-l was enough to trigger the warning without it.

Kiryl Shutsemau (Meta) (2):
  arm64: sdei: Run the event handler on the kernel vectors
  arm64: sdei: Preserve the interrupted context's exception registers

 arch/arm64/kernel/sdei.c | 83 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 9 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0


