Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B62F44846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34In+kt78RQF6hzWY7RKWRem00VIHmq5CMGoioqJpTc=; b=HHY7sMpbhB6aKY+og7VuavYJ9W
	7EcV6zVhyxUPoPV7Ymd3E/akNEYH8K2/QzYMLi8r05fAZvnzGXDLyvqnTdMoe20+oVfxv07rOCSx7
	/5kgMa3FTkQujKiw/RUeEAMG2lfHSlYFXTJDQ7tQKKzuxo/aXR9X3XPh2S6H7u7E/RuL44WiFHxB5
	qAQY4KoaUm8cbNxVA1qu9LuWqEq367C05dXEuPH8pHxT3Gh1QtfhAlrV1F8XzwvW5hVs0JCvUrNBK
	y0q0+emqe56Q726GAHrwvG/k8IqN1C6QeFB7RF3WsTRIMsdS62Ql4mm0Smov/nGtdugMsVsS3YdUS
	1l+hl1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAVA-0000000C7Eo-3a9f;
	Fri, 10 Apr 2026 11:58:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAV8-0000000C7EB-3ODY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:58:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6449B1DB5;
	Fri, 10 Apr 2026 04:58:12 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4979C3FAF5;
	Fri, 10 Apr 2026 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775822298; bh=0w0HL86uaNTzfckUXm8H/W0S5REH58rZLeubHxKDJMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+mJUqnSEWt6iEikJXgF1BvEs2KmKwdcsPzJsp4h20ad3Lg4SOrPdi0uEiB4WTPrU
	 D92KM6EDG3N+Ornzaq6dkchc4lxQzqgELVLGi6ARIr0wn6DReZOWsGxDzPGRwAQ71y
	 Eu8xFqzL+mpQskFBmFwF+3ddVtiEynLtFbiUA+/4=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Michael Ugrin <mugrinphoto@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Kconfig: fix duplicate word in CMDLINE help text
Date: Fri, 10 Apr 2026 12:58:11 +0100
Message-ID: <177582225358.115239.9163221480295940306.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409162413.1120-1-mugrinphoto@gmail.com>
References: <20260409162413.1120-1-mugrinphoto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_045818_887304_EB72FC5D 
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

On Thu, 09 Apr 2026 09:24:12 -0700, Michael Ugrin wrote:
> Remove duplicate 'the' in the CMDLINE config help text.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Kconfig: fix duplicate word in CMDLINE help text
      https://git.kernel.org/arm64/c/74b63934abf5

