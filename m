Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5296AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXlECd7J+41LiERFddC4gYEBHK4GZ/dwyIa1OMhDDw8=; b=KCTqq/4ubSVzMTSyMwMYMckKT3
	CxSeoLFeCbA55Z+0jzBc5D+MYRClCxr5pCvNoT7Y+tJ11F8IyGjjZS3IvZdUp/nW+28GJ1vS8sTnu
	3/SuQGLGBhTR8GACb0/J/KoxmiD6jz0avkTV/j8A/qILtnU5sLlR/bKSCEH06C2rg96JB/aVCaUgW
	fsadw+9jg46j9nQqLxpb5TvcpiGJO8yydfH+Sucr73OlnFDfrM9RiGWl4hayB151F/PMM2TMQrED5
	SIYH4tz3GZznIxj7SLtfNYEG6E57wikTf1lrVUpAd3cz+PIcZCGI4MnZqRIriy844keqRDwbhvBGA
	XX7sb7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHFR-00000000I4c-0xGX;
	Tue, 04 Feb 2025 11:37:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHE5-00000000HmW-1dsW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 128C65C6324;
	Tue,  4 Feb 2025 11:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BE6C4CEDF;
	Tue,  4 Feb 2025 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738668980;
	bh=9X+tis0IwLqTIYnFzk4iTIu76qprOrfcQ9DCye4RlTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDFnnhgZRME/U/EMXm/1x66WeaCmeSdJnJ6v/b7LyiLQffZ9w3y+huilybV2nktIY
	 dZ5kyDcHFThD5AYT171tSX/hcrIK2jcHGX4+YNmpu5e1MGV7wc9VFG3zo/aMxKTE5E
	 g8LeZvnFa7hcSOpd9S56sIw6FYD/y2d/4Ppas6SVD69JfrWn+HsF0km8nCz35aYrFW
	 GZ+niiNCBje6ffC9/SU/gNR8g3DUFj/MJ9hV1Wmp7jk4WDCshab49oEvR0u57Egi2x
	 PfpyeVuWy1I+J3xKZsdEUEHEseRvKPYJdZT8fb1VYweOn6eE5eriNkZ642woM0pgHM
	 kA5ptUCOzGx+g==
Date: Tue, 4 Feb 2025 11:36:15 +0000
From: Will Deacon <will@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] arm64: Kconfig: Remove selecting replaced
 HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <20250204113614.GD893@willie-the-truck>
References: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_033621_467751_6564CABA 
X-CRM114-Status: GOOD (  14.67  )
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

On Fri, Jan 17, 2025 at 07:55:22AM -0500, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
> replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
> HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in the
> various architecture Kconfig files. In the arm64 architecture, the commit
> adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
> 'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
> config.
> 
> Remove selecting the replaced config. No functional change, just cleanup.
> 
> Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  arch/arm64/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Hmm. There are still a couple of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL guards
kicking around:

include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL

so it's not clear we can just remove the option from arm64 without
breaking ftrace_return_to_handler(). What am I missing?

Will

