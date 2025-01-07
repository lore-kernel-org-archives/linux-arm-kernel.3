Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B18BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQIdssgat/GZqQmqrdKSlPxK7uOGtfrPHsqIXqS1FKo=; b=LEQj5rkklYxH8oVaT0+Myg+3XA
	gUwenykTABwjVsjFh/dLYLEKeQWSCTj+sTXG4hV2RwgWZJBQ4h9XPBcXiby4JIcvLcTDmb/iUKWdk
	JQVzW0IeQS/5Gn4TZND5rSejgkCHHRjjavgxXcHQ5DeGQnBFEsmVwnDFo36Cg6YdPk2NMnYaeXcHM
	YgzR0aVCrU0RNIDzbM/h0GREHim9UNW7jCTuG8zKw7M+iBAe5IDMqhofHfLliA2FCqKCX2boB03TG
	GN674aiw5UTm5CZgcJ2eGjS7s4dzCbC+QHrdwvlBbGSmiyhC7nuEv3rnrJ8wA4o5VLIuikonT+HXq
	6Jk+wkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBIw-00000005OId-1eak;
	Tue, 07 Jan 2025 15:15:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBGt-00000005NjG-0DkL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A5A15C5F32;
	Tue,  7 Jan 2025 15:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B28C4CED6;
	Tue,  7 Jan 2025 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736262810;
	bh=KlzauW3PgDKVIWbsqXawXo+ipjiNK9vtMAkDOh4G9u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqI8oUkrsXt02ErcpWwCjOZ0+kwUPWOHvsmYw1hBh1mh2dbvvPVZ2Wan01b2RdMmq
	 Bw12CenQBYNbPpk04NSbiV5xzljPk2/wp7zk8S8ftSdWoxjXND1+v4YblHl6k5MH++
	 uNHKKh5lkGKTiLC++MtN7FoSCbfohmK1LakO9YkIpUsKb9wONt2LAlg9ChpZUQeCgC
	 gSTbiGy0gG/sFw3mPAOPbR2+B5pA6Axb3g0W5e0pQzVNJzKT9fnPA6kZCDwLAs5hes
	 77se1IHjYOYnoA4b3g75FNPn3IB0wloW5wxPW75rT1h/yQj2DgpMdq/V3o4HdF6Rzj
	 HviMJNifgFAPA==
Date: Tue, 7 Jan 2025 15:13:24 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
Message-ID: <20250107151323.GA7368@willie-the-truck>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
 <20241211-arm64-2024-dpisa-v4-5-0fd403876df2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-arm64-2024-dpisa-v4-5-0fd403876df2@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071331_130677_EA4805C2 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Dec 11, 2024 at 01:02:50AM +0000, Mark Brown wrote:
> DDI0601 2024-09 introduces SME 2.2 as well as a few new optional features,
> update sysreg to reflect the changes in ID_AA64SMFR0_EL1 enumerating them.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index c792bd3b0afbb5fb7e438a4d760d9f2d15621eee..d78b12c59658b480739ae797f5ea2c2f14d8d765 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1105,6 +1105,7 @@ UnsignedEnum	59:56	SMEver
>  	0b0000	SME
>  	0b0001	SME2
>  	0b0010	SME2p1
> +	0b0011	SME2p2
>  	0b0000	IMP
>  EndEnum
>  UnsignedEnum	55:52	I16I64
> @@ -1169,7 +1170,36 @@ UnsignedEnum	28	SF8DP2
>  	0b0	NI
>  	0b1	IMP
>  EndEnum
> -Res0	27:0
> +UnsignedEnum	27	SF8MM8
> +	0b0	NI
> +	0b1	IMP
> +EndEnum
> +UnsignedEnum	26	SF8MM4
> +	0b0	NI
> +	0b1	IMP
> +EndEnum

afaict, bits 27 and 26 are still RES0 in all the documentation I can
find...

Will

