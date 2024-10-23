Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08522CDDE70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVmNqS9KfJ3I7K7T7HN4kNEYBXLZTf+GuBNcKVvfQDM=; b=XPyRhi+zNxraDjGO3fca6Gy13T
	jPLkAGDsxHok7xr8orUJVCBKKMw6oBWQbf28ABh5DgFdqXF2bYp3ErOVrftdnHwmgxuScDyjrX04h
	nhLfShNPmWiWAFD4WR22Ymb+UTtwhbs/t7ASxQEEPKA+SPXHgescJFIAQ2oRiWI/a6dFMsbRUbdly
	4mGEjFCUqZbezVo58EEfxOwTPl6KQ9dKju8Kt55F9ZC74A1Q7FWJTqtJk0WWSpN0vWDDsfsoltLA3
	gQ22dGCZ/HLnjQj+SsIQq1gdHyi6I7toxmHcT0JttiI7yvTeMjMWwCiUQcojQ2F0JrMX3XjDmYk57
	eDeAtFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zpm-0000000ECSH-2bpI;
	Wed, 23 Oct 2024 11:47:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZBZ-0000000E5Gf-24gM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C2755C5AD4;
	Wed, 23 Oct 2024 11:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15A0C4CEC6;
	Wed, 23 Oct 2024 11:05:50 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Drop _PROT_SECT_DEFAULT
Date: Wed, 23 Oct 2024 12:05:48 +0100
Message-Id: <172968153451.1430969.7795115918835596356.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241021063713.750870-1-anshuman.khandual@arm.com>
References: <20241021063713.750870-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040553_597381_13CE7451 
X-CRM114-Status: UNSURE (   6.84  )
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

On Mon, 21 Oct 2024 12:07:13 +0530, Anshuman Khandual wrote:
> 'commit db95ea787bd1 ("arm64: mm: Wire up TCR.DS bit to PTE shareability
> fields")' dropped the last reference to symbol _PROT_SECT_DEFAULT, while
> transitioning from PMD_SECT_S to PMD_MAYBE_SHARED for PROT_SECT_DEFAULT.
> Hence let's just drop that symbol which is now unused.

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Drop _PROT_SECT_DEFAULT
      https://git.kernel.org/arm64/c/0448a96e243d

-- 
Catalin


