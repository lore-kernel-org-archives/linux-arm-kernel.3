Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C8ED711D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwTjXNpicq3Z//TocimHVZad0SS219XurM4vT4umAmg=; b=Oh9UnFQp2JzZH1s8hQquhURwP8
	cIczij2jOPOITtvD2sgavRDeape3OQJm6I4AjyLd4pjTugarsvIyzokIZnbImNM9bnEYEdk8qRXck
	2fs/YPL49ipKcNNhoSt7y/btSxBPfeqLBGKZI/nADoVS4XmiJOWG/AJIyYXuPzmVSygZm5ZjIB5ix
	9FBgGTM8qRhij1di86j25WJpUjyt/QjtrTybC3LFZtxL0Efiw+ZJsUBPzJV1LRWtJy5gt2vvQalDx
	nsBa2QIL5mOAK08i9C0+SnWeHP4jD0k4eTMtZa/fAKrcKrveTzDQ98OKRVS5AutPa7JPCHdNMemw6
	/9ssxhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDozu-0000000Fybc-3FOf;
	Wed, 20 Nov 2024 18:00:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoyy-0000000FyRV-1V4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 17:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39A475C5E07;
	Wed, 20 Nov 2024 17:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF26C4CECD;
	Wed, 20 Nov 2024 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732125554;
	bh=hwqWZQPgkK5ssNxl8O13LuYP+NTlv4KpZmZuEV2pLGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/MxMZGbR/dB1FwR52MyiCBnyZRDN0X/0LjDh19la/jGbGN2G6EWipPpYJYk+L8nG
	 ob/avAT+IaJwNfxrJv3s3WDRbqlKsbYfCF531DRDwtRCTz4Cr2B84+6F3ypHlfKmL8
	 X+FC78a9C1FeRfmCZffbPCYl3IJPCfdzjZCV58AVZlAAmvCSVkD2OZZC29RE07flBo
	 rf0b/mf+EJCutWy4uHCvMOajRXjJZpbZ7aoR9hJbllxkFYLMnwh1TKhG37ChgEy8m+
	 jGdaZE9PIL7Kiml3RI3UMGUELYdI2kJhJuh8SoH86zwYp03wpUPX4mPb8SJcWMsldo
	 bzaFomh3iBRLw==
Date: Wed, 20 Nov 2024 09:59:11 -0800
From: Kees Cook <kees@kernel.org>
To: Yabin Cui <yabinc@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
Message-ID: <202411200958.F8A656A080@keescook>
References: <20241118222540.27495-1-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118222540.27495-1-yabinc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_095916_434973_99E68516 
X-CRM114-Status: UNSURE (   9.45  )
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

On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> selected.
> 
> On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> Experiments on Android show 4% improvement in cold app startup time
> and 13% improvement in binder benchmarks.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>

This looks trivial enough to enable. ;) I expect this could go via the
kbuild tree (Masahiro) with an arm64 maintainer Ack.

FWIW:

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

