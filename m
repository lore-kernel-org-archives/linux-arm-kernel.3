Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADA8C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abuYFGYRia4+Xt7E3cIF1sCR80N8Mc2JgdPW0EpZKLc=; b=tTKbQ8Z2P/cUxz6AhPNE/g2VUf
	Q8QfBb/OGpfJVKdFEvQ9uYgXGt9PwZu15Ab1GFNs5OLFqcxIeuArRFmO0TyKLRrycjuB9hu1jG712
	J93OHYvMJGt0xI//Jy7U4cFGlz+ZmDLydByw+f9In+CQaV7hUJSRmIFW5CLelFGkm/MkXGANL0/ss
	E5NEEPW3CqTMGi7QKaRsYs0whWtaAzhi5kTc4tKA1e0OV1tb8LqloI6EqLge3+qi1MbRN95BLPDDn
	P1i60HMW/jFvlp2466ARwDJu50RjDZwHM1sgh9yhDlDnGSHEHZmvILxmBnqvcY+Xg0aZ7zdwdEMO1
	hhWP/ToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vqw-00000002Wt5-35oY;
	Fri, 04 Sep 2026 15:29:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vqu-00000002Wrb-2lPT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:29:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFB57601DB;
	Fri,  4 Sep 2026 15:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABFC1F00A3D;
	Fri,  4 Sep 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535755;
	bh=abuYFGYRia4+Xt7E3cIF1sCR80N8Mc2JgdPW0EpZKLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eKUKFYJC2waKW/sqOTEYfDoM0C9rSMc7L+keAX5bmUktCZ1LmheLpP1PsTodXCMDt
	 xhpGJrP++feZeN+29PeYUpOv4rNIWZI0jVQ7xOwBRV5sKyq52YwLHIBalBgOpQwV04
	 1cpTJaTUjaK+HtbqtSpi98tBWhzUKwCyLIpR07A5qLHOk3bvErIseFyIYYTOBv9qoV
	 RRnBwUtRagXCz0cooRabp1uhzhTq2WNqHp3ehRpnKr6Z702mwAbT9aUVELvgW6dEa1
	 CtnCroCz3riOk0N2/yHPxrgwVMDEstlf8wP/TbzSU9cBOH5ZKoQtEsZCKfDl2HeTFS
	 GGPS5Zwww/Vdw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260821083251.194341-1-thuth@redhat.com>
References: <20260821083251.194341-1-thuth@redhat.com>
Subject: Re: [PATCH] ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-Id: <178853575367.59617.1421796645468160415.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:29:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 21 Aug 2026 10:32:51 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> [...]

Applied, thanks!

[1/1] ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
      https://git.kernel.org/krzk/linux/c/80c92d1f1a4e3000e6eb351ad8af16267b1d4e63

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


