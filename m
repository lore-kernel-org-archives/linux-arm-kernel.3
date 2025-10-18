Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7574CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 03:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qw4YXAl9CtY6hAowDvx/pdZbXjPBYE782Swc9Cge1go=; b=cdglm7oiaIO64V56RwCdvmpDlw
	e++9ENyRlBTySaFE+dqVmfqmSSGhgBiSg2vvyJ6rYmtXY7oNwjPYIYgOFAaJlz8kxThusw06tkF/o
	twdg+9YWuJwuE+xFeLMwRU2AB43g5x0C+1YBULpTcPFUJmRm8T00nZ0Bf6WutN6kaVbRUT0xn8QRb
	g1/eTfDd6N0GuNL06PRTJVigRpFFZDmCQC3+QTXMsop4XtTppkKR7hcV3hLAoZbpDlcyBU+XqOyYw
	jf5zRIKc1550uT7PYuAbykrF+LPm+abNZUxpF2EUn391JdbEvbLtyu28UoPSyiq2i4NTQMn0kQW/h
	JJpnn2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9y63-00000009T7n-0aUl;
	Sat, 18 Oct 2025 03:59:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9y60-00000009T7N-2E4Y;
	Sat, 18 Oct 2025 03:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 225F941B3C;
	Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E640C4CEF8;
	Sat, 18 Oct 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760759947;
	bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=krIfENMfuFjiHhOD9R6DJZJbEI9qyq58vTH4tVORoQRTS2pGY5lkJEIZDY6cO/JsF
	 7rV4qf/QB3xJavBLHP0t1tOOd2ijiKeeH7r5PBJer2K+56mKaBeK4gxS6ShjW6W321
	 VkvkNEiUhE+GJg+MsRokLA9CNBFgs7U0v7KF5BOur/qWmLZ7DKTce6BLHyqQ3UmI3d
	 h3G0koy5DXW63vce1vAszW8CD0JUM4rwNfwwIrL7aT81malR9QIBv5/P/aZVWwdmzB
	 yRQW1/nRqFaZ64tNvz5lQ6FqKOjnXl5DoM5YdsFKHtq3AqF25dzypI1i46AMW/sKZH
	 62a7C0hJMLpqQ==
Date: Fri, 17 Oct 2025 21:59:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
cc: linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
    openbmc@lists.ozlabs.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] defconfig: cleanup orphaned CONFIG_SCHED_DEBUG
In-Reply-To: <20250828103828.33255-1-twoerner@gmail.com>
Message-ID: <e88ab2ff-dc16-dab7-0ff3-702f093563ce@kernel.org>
References: <20250828103828.33255-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_205908_589235_C948DA5D 
X-CRM114-Status: UNSURE (   6.29  )
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

On Thu, 28 Aug 2025, Trevor Woerner wrote:

> In commit b52173065e0a ("sched/debug: Remove CONFIG_SCHED_DEBUG") this
> Kconfig option was removed since CONFIG_SCHED_DEBUG was made unconditional
> by patches preceding it.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

[ ... ]

>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -

[ ... ]

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul

