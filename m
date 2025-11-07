Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C86CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9KaYrMC2bxDn1+p1ktrwywqckOZ6UJvNIfZfli5iAc=; b=KfrhGjmR9zMl6NPIsJLD6wSczT
	sLnw+W6szMAD/Pz3dUek9w1vnfsKqFmnXtvV9YyhWkKF3vonEGAVAvV/W7jnf6/qrTHGs8Ip46n62
	3de2P1ptvSZu0w37i2SLbZqvo2glPPncG7cIpULmwUJBhfxFamzTLs8EHjJWfUKAKBJXPxpB4UA7f
	lu8R1nqsQ36GE4AwaFul4CiUuZWHuphgyasJsUrl3QkvjzJ9YgMJGbhd7OXi9q8YmHQV6UURmGksJ
	/LiN62G6gXPLX6mSCuwu9BUCEpcoVLJkwQULsyEQt9Hp50AQoYfcd/M9qtlVj34cTgJ0Ez3X40Y34
	aIFcIWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTRu-0000000127M-1UhU;
	Fri, 07 Nov 2025 20:52:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTRt-00000001277-1FhM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6128C618E0;
	Fri,  7 Nov 2025 20:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EC8C4CEF5;
	Fri,  7 Nov 2025 20:52:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] kselftest/arm64: Align zt-test register dumps
Date: Fri,  7 Nov 2025 20:52:34 +0000
Message-ID: <176254875462.3846404.5369912226955297969.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103160417.1023545-1-mark.rutland@arm.com>
References: <20251103160417.1023545-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 03 Nov 2025 16:04:17 +0000, Mark Rutland wrote:
> The zt-test output is awkward to read, as the 'Expected' value isn't
> dumped on its own line and isn't aligned with the 'Got' value beneath.
> For example:
> 
>   Mismatch: PID=5281, iteration=3270249   Expected [00a1146901a1146902a1146903a1146904a1146905a1146906a1146907a1146908a1146909a114690aa114690ba114690ca114690da114690ea114690fa11469]
>           Got      [00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000]
>           SVCR: 2
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Align zt-test register dumps
      https://git.kernel.org/arm64/c/a7717cad615f

-- 
Catalin


