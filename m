Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6361E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVXo9iIUuzBuU9sqp+HF6GKq1gmWzqc5DJDzvDSb0GM=; b=AUcpEpM2x44zUKzKz4qoXTiQnI
	QAx2YXNHVqOPS9fleSczGH5CAaUY76Jyu4ZFK4WUvYuvHiO+I9VRdngDR714KOsVpLtl1dicWXIYr
	ILkZJJxl9gDcvQ4XPA1sBRHTQk/eTu4iiHpOxMUTqagFfDdxBpojDAPQUPZ8wdalvYDIy4QQ882oz
	KsUubREOLfmzg/M40LP1D2Vh+wh1sO65j1OhgKSbqQ387DPzi+gZF0wppI3s8rYhGR8znoZZpUfyl
	KK3lb/B3QMKBzBjsP6Ak68SM4LkPquqvCuKoebUYfZ62tQ5eIuL1cqeQMHbbpACRgp8MHDOQ6dFFy
	+trc8iUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHzI-0000000GIM8-30vY;
	Fri, 10 Jan 2025 16:35:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHmu-0000000GDtP-04Ml
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E00945C0FE0;
	Fri, 10 Jan 2025 16:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309B5C4CED6;
	Fri, 10 Jan 2025 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526186;
	bh=k4SHxol0HmJf7U5mTkhel4hp1vEAy/7UhhMVMETkNtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j0BkInyaXYWR8O6HLbaV7Qs8XVteL706pkUNvRkV42Qswic1IFfwu9Ex4oTarIrxe
	 6ry739IcATWUXcj+2LBH9L1sHQnqbIl5mTa+2tDiNR2yMMaR6hHkqeUt/OUbx/1mWx
	 mJm6C1JsrMT+jZrInr2aP9PA22H7S07yPvyOOuvpkQuklDDngE+jxUg95BF0hOc/F6
	 SW2B1ENF6CeStb5yWLDex+hLCzkb09BVUgn/sqwlYx6YUa6f3WBzpZmkj013rxJu9S
	 w4NcElE//PSPhucYBLo71Nhl2VyI/BngKRJsVp/1nKzXIN7NS7x9moHr4Vq+PqqP+5
	 VFyAEDQ9lLEQw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Remove duplicate included header
Date: Fri, 10 Jan 2025 16:22:51 +0000
Message-Id: <173651666253.3233150.3175376410915680433.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250109104636.124507-2-thorsten.blum@linux.dev>
References: <20250109104636.124507-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_082308_095863_63F2E68A 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, 09 Jan 2025 11:46:34 +0100, Thorsten Blum wrote:
> The header asm/unistd_compat_32.h is included whether CONFIG_COMPAT is
> defined or not.
> 
> Include it only once and remove the following make includecheck warning:
> 
>   asm/unistd_compat_32.h is included more than once
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Remove duplicate included header
      https://git.kernel.org/arm64/c/965e9bbe025e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

