Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10222CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PGcZ609ASUkoNdD7qkyIUnsaVC30SmdUGzl2/Zy8Bug=; b=KDR1r74FgX7SkH2Cl37zR58D41
	nBTji+iSihpUcV3gJcVKYAdIbeag3ot23v/qHoOFcwxK3iX10WCyVzcupRODa9N+RKbaitJDL+f1T
	fN+NnlxtqY7kIkGVDIeKDDJ3m+x1VjtV/dSGJ84kTyxH4MAFe6zFB4xrEWD7cIkYyjAwOiAGrXonP
	S6UPEX6WfCkWkEq+dYv5aqlRo+lEtqciBhd/h8zwxMUd4Pcyw49kGm6kvkAfz2DuasMp7bZA1dnJ2
	o3BeV47P9+hwltN0GOMH2FpKkdCEXmOO2fCreLFCf2Lw6FQ3DepWeExtm13Crdo4VPa91k/2qZKh7
	UHsir8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbMF-0000000559z-3S2L;
	Thu, 30 Oct 2025 22:43:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbME-0000000559m-2b4F
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PGcZ609ASUkoNdD7qkyIUnsaVC30SmdUGzl2/Zy8Bug=; b=I64DLwl/GdWldMFQm0BbvmKQkc
	nWtLhO59JzBlPf/Bway2PfzKBmeMAsS9FsoWBHqHbek/L933CrGaEHJ2Uu28ILNeZf/moJ22PTo7C
	ivPoHPD0fBn0iyYfmfts59n+2SDnYcrVHLN9Kp3pjov9DWM3gtvw94UIrEFBvIu7SIL6Qg0PFTofS
	FE3Pg35iirNmsSWPoI1/K5H9hAflSw4cpuHntgJv07Suxz6HVgSiuOdelaclmUkJF9B3KFUCebNY0
	s3B/MtFWRZzsBxTagEn6GgIBTE0VsEjZjmD9F2GMBTYWXRUJuZY3PFCPPmjDAPTMF5fkslrrS5VXG
	TmBdnGFw==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaUR-0000000A8u0-3847
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 21:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761864163;
	bh=PGcZ609ASUkoNdD7qkyIUnsaVC30SmdUGzl2/Zy8Bug=;
	h=Subject:From:To:Cc:Date;
	b=aA/7kD3sm9oCzF5qsgyxJbyrX3wsi5wtluu6MaklvKPCKBJDIxqmCc0DX1EcJyHF+
	 gktPwE/58no3ApFkCtcNv8yEMM+ryE0mrK6TVBIcLLqvti4SoWrZcUl2JEE2nHW8dz
	 dXJ/5WdYgSH7S8llbvX1bThJCAtvrlMcEQEpkCLI/KGBEkcWogC7WFGKSdBdEoHMyL
	 UjxUukyTD+7ODEPJaXgXzuewd1V06yoaUG0FliGNne34xGI5vHFSUiqrO7MH2z2lpU
	 D3AM5UX1COUxnTkrqQWeHnBYjCM+4q54HE+kqjos4xxyiztlpCehukyddHWlCCjAKx
	 NDUh4IG5k008w==
Received: from [IPv6:2405:6e00:2421:7372:17cf:8b2f:ac7e:ac4d] (unknown [120.20.6.198])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E8E2C78C99;
	Fri, 31 Oct 2025 06:42:42 +0800 (AWST)
Message-ID: <d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of fixes for 6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Oct 2025 09:12:40 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_214728_439500_C9D3826C 
X-CRM114-Status: UNSURE (   4.69  )
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

Hello SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787=
:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.18-fixes-0

for you to fetch changes up to 85893094535cced32b33766e283240164a5b11f8:

  ARM: dts: aspeed: fuji-data64: Enable mac3 controller (2025-10-17 16:29:4=
0 +1030)

----------------------------------------------------------------
First batch of ASPEED fixes for 6.18

This time it's just the one fix addressing a PHY configuration regression i=
n the
Fuji (Meta) platform's mac3 devicetree node.

----------------------------------------------------------------
Tao Ren (1):
      ARM: dts: aspeed: fuji-data64: Enable mac3 controller

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts | 14 ++++++++=
++++++
 1 file changed, 14 insertions(+)

