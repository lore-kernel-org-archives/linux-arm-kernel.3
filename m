Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D6E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvqHUhE7NaJrRBWo1dJORSmPZifSyvKYBmDUMxuTy3E=; b=gL7LwkgXIE0mdasnimCow743/D
	3/DS/IqEAz9PgnYnqpPFP3p8LmrRRDOUYetFBfHqJKh48ljFYm6C9tFzK3qi5L8kVamdCoQ5jeDc7
	d3Z5IhgvH8KsPNtLY9+fQRJcepK0WIbhDhVhayobLDLL7ZQuag6uQeFIYC/+APZ3JwLBZy6jiMOEx
	lXI6Sc3fV0x6FxX+XWOhM4ADld4XIy56risttlNIsAlVLjBPWf3LYvxnMY8WxzWor6VeKDNXnezzH
	0vFPLox40M8GzTAgzOYVeYsl4c9e2P9tMxu1/qh5C0uParkVAuH3ccb3et1K/NfmaeLyyPbO48Hac
	OY9ACB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vWY-00000007qr3-0Kyt;
	Fri, 01 Nov 2024 17:33:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vTV-00000007qUr-05fa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E6A65C572A;
	Fri,  1 Nov 2024 17:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48802C4CECD;
	Fri,  1 Nov 2024 17:30:14 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix encoding for SVE B16B16 test
Date: Fri,  1 Nov 2024 17:30:11 +0000
Message-Id: <173048220454.1105699.16636149578307021723.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028-arm64-b16b16-test-v1-1-59a4a7449bdf@kernel.org>
References: <20241028-arm64-b16b16-test-v1-1-59a4a7449bdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103017_153582_2AC147A5 
X-CRM114-Status: UNSURE (   6.75  )
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

On Mon, 28 Oct 2024 20:22:31 +0000, Mark Brown wrote:
> The test for SVE_B16B16 had a cut'n'paste of a SME instruction, fix it with
> a relevant SVE instruction.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Fix encoding for SVE B16B16 test
      https://git.kernel.org/arm64/c/69c0d8247798

-- 
Catalin


