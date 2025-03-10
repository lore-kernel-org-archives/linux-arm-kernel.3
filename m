Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688EEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2gOgzmfRbVX9jzRFYnPzsmYLb1alN5wmz77em2bmV0=; b=kOGhRYJf8yRN1tT4O+2ATwAnRl
	0pZONjKtz8oQglzp3eRsy5BRg9M8KK+qAaPGFlHDm6l6qUUGVQs2ujzS/qfMT+rPzixVIXUF3X2Jj
	HcXOC36MtHk3H2AEHkdQwMjEdhtsGeqKE/bK+wXQYYnTWNSTEGYUXnv76aU8VKB2GR0Pw86P9QmDS
	AsqO4QVqmkH2Jt8d78k8ufTEVOe80l4tPUGVEIed9nIhJxHAb78FvTBuFS27Txh7ri1UYhXQJml36
	LSvLoLVuW0wrVz5IBhtTJnH1i8BuePwoDMXQpFMllhLyl1N1dyJg3JuD2qBf26RUv8h4S8sTaBp7v
	XT7q6uKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tri0e-00000003diA-0K2o;
	Mon, 10 Mar 2025 18:37:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhvz-00000003cDo-3r9D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A61B5C0104;
	Mon, 10 Mar 2025 18:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05A5C4CEE5;
	Mon, 10 Mar 2025 18:33:01 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH 0/3] Minor improvements for PIE/POE helpers
Date: Mon, 10 Mar 2025 18:32:59 +0000
Message-Id: <174163157306.3207771.13653726246249700352.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219164029.2309119-1-kevin.brodsky@arm.com>
References: <20250219164029.2309119-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_113304_011848_46C32D0C 
X-CRM114-Status: UNSURE (   8.64  )
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

On Wed, 19 Feb 2025 16:40:26 +0000, Kevin Brodsky wrote:
> This is a collection of minor cleanups and improvements for the PIE/POE
> macros in asm/sysreg.h and asm/por.h. Besides the readability
> improvement, it will also come in handy for the kpkeys series [1] that
> performs more calculations on POR_EL1.
> 
> - Kevin
> 
> [...]

Applied to arm64 (for-next/pie-poe-cleanup), thanks!

[1/3] arm64/sysreg: Improve PIR/POR helpers
      https://git.kernel.org/arm64/c/f91a3a6088ea
[2/3] arm64/sysreg: Rename POE_RXW to POE_RWX
      https://git.kernel.org/arm64/c/83d78bbfd2a4
[3/3] arm64/sysreg: Move POR_EL0_INIT to asm/por.h
      https://git.kernel.org/arm64/c/650701e4ead6

-- 
Catalin


