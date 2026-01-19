Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FB9D29C39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaB6L2UQ+ouxDH27XZpX2Rcvt0F/Hm9OsP2Y0g1VHA8=; b=CrFuLDFD5FxavSzVKWyztCMWho
	hUu9P47vaZZ3tH9WHYbMCf/hCMSSzmJPVBURlCQhX4+7sPXyprya/auOwJfvXL7D8mYLh1f7MhVjL
	qAHAoRWc4Klv+twdUEnf0JLWeENvNjgUmtDr7vplvCD/7CtBuTDng94w2Ff/l2RoHk7Sotuz4E1E/
	3ypd2shrbddVVZpbk+CwsvF9UamxSIXWsm933nHF8Jr5VvOqsAjQ/GPaeukyx5Gk1v9UTTa6SykMr
	jAyiPi0Vzd221QQ9Os3Z8tIuxjWSbZWQo8ve06n0csmyeJ+u/Lwhpl5Zjn6A9bt/kUOjpNvpuvXO4
	FIWO030Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrWs-00000002OVd-3LJk;
	Mon, 19 Jan 2026 15:50:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrWm-00000002OVD-005x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A998600C3;
	Mon, 19 Jan 2026 15:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ABFC116C6;
	Mon, 19 Jan 2026 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768837850;
	bh=8spVm2UWPNEikSMnnuFnl2MPKSCRmkDl/sho6yBQYTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQZR3dubIjy3jFPHfxwq4VtF8iq7w9U3jo7KQ5mdPrI6a79NWvOMUKPW8y76MqlFd
	 1OKdf0YDRgmaVqQucyxNpKkpu7RuPGh7/c/OsoEUBOeAqm8RHkCYTOLJQOjNdlUKIJ
	 33ykFO+doxlwNLEZYbry9yu08OvVtuRJgTIpeZgrv3ItljWttKA9KZUTHkJFXyjnXB
	 FG8wANrlUKO+9bKqaykc4OF38uCL/ce4+OxqH5fxdNsMauufRbomZ5BLbw1uVXTfc+
	 EUHopvX02iuhFxuqh+Pu0S2N/7fKTlXLSC4podyP1DdcZyhmDoh4/ooLpK/3lX+5qT
	 FisuSuTv/zoag==
Date: Mon, 19 Jan 2026 15:50:43 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 4/9] arm64: Kconfig: Detect toolchain support
 for LSUI
Message-ID: <aW5S04xS4FT0zvXv@willie-the-truck>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214112248.901769-5-yeoreum.yun@arm.com>
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

On Sun, Dec 14, 2025 at 11:22:43AM +0000, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> It's enough to add CONFIG_AS_HAS_LSUI only because the code for LSUI uses
> individual `.arch_extension` entries.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..36e87a1a1b5c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2227,6 +2227,11 @@ config ARM64_GCS
> 
>  endmenu # "ARMv9.4 architectural features"
> 
> +config AS_HAS_LSUI
> +	def_bool $(as-instr,.arch_extension lsui)
> +	help
> +	  Supported by LLVM 20+ and binutils 2.45+.

This is an internal Kconfig variable so please drop the help text.

Will

