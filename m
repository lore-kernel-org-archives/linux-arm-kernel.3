Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DEAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvmSOSF1MVnKeepjo/sMYQLoHMKNGyA9Y1DivBKFHyI=; b=R3MoEAEpWR3YuP/P8q51lfjNwi
	3C0hz21ipL7fhyRXYoF+EciQcq0IfrUG0ViQUWDpiLYZUw2DzZcIE+yQYX+4w+1I9E/5huMUYmsvP
	S5vzPrz//AllZQQGdUHI8Y57ZuW6iU6r3CFg6XGtNZYcQngqiA+1bc8t/Eeg8B7kdf3EVJwJeRz7/
	c9sbZ10p/xBbWIGQSBHnajGtPqTqXJsnIj8TTHX9U6tw+cZtyR21Uly7PQuo3YOFarDgQz7us2+qJ
	rveTrCgfxb3jO87HNh+BGilcUXsXQtdekRNR3wzj1Tuz/V34DDJQ5grRxjJjq/GIg8pC3ZHb593K/
	r8PbJxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3lK-0000000CDK5-2SCh;
	Tue, 10 Dec 2024 17:11:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3kH-0000000CD4B-2Otf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D9095C5D8B;
	Tue, 10 Dec 2024 17:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783CAC4CED6;
	Tue, 10 Dec 2024 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733850600;
	bh=2Lcmq7SHHNoVqPiQ1a9keIwEUzJcb799Uq6YwdCactM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOUMN7Tc4of6hly92PWfFlwTA8xXM7VUYU4bNYDTSXF5sc6BM3VXU2Vig0QEc+AEe
	 B1bLwSJepN5c33ArBzRH/+2pfEq9bq/zGF3WIdULrNuXpP1H/DUZTn6BTurWdhn31k
	 lgmllm0L8VibP5t8qgXhC4Z5W443RodVG3Kh8Bfkaz6ttEMteL6rd+fiatbPoa3jit
	 zTzD5bHnDOW6C3AMOBf8ljeQk7bvJny9XNdkjva9Qx+j/8MPGE1Iv58QlOzoj6xPJV
	 WzOXQUuppv12EqtG5qRvWoW22GOh7S6MNxeGdySvWKax0o1KLpqnuF3pGZAb20h7hq
	 lhndv/N0MNHSg==
Date: Tue, 10 Dec 2024 17:09:55 +0000
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
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <20241210170953.GB16075@willie-the-truck>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_091001_651541_AFC4E817 
X-CRM114-Status: GOOD (  15.61  )
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

On Tue, Dec 03, 2024 at 12:39:21PM +0000, Mark Brown wrote:
> DDI0601 2024-09 defines several new feature flags in ID_AA64ISAR3_EL1,
> update our description in sysreg to reflect these.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 911f16c82ebd3ee98ffed965b02a5c6b153bc50c..c5af604eda6a721cedf5c9c68d6f7038156de651 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1566,7 +1566,23 @@ EndEnum
>  EndSysreg
>  
>  Sysreg	ID_AA64ISAR3_EL1	3	0	0	6	3
> -Res0	63:16
> +Res0	63:32
> +UnsignedEnum	31:28	FPRCVT
> +	0b0000	NI
> +	0b0010	IMP
> +EndEnum
> +UnsignedEnum	27:24	LSUI
> +	0b0000	NI
> +	0b0010	IMP
> +EndEnum
> +UnsignedEnum	23:20	OCCMO
> +	0b0000	NI
> +	0b0010	IMP
> +EndEnum
> +UnsignedEnum	19:16	LSFE
> +	0b0000	NI
> +	0b0010	IMP

These IMP encodings look wrong to me -- the document you reference in
the commit message uses 0b0001 for the "implemented" cases.

Can we _please_ just generate this stuff. It feels like we've been
making silly typos over and over again with the current approach so
either it's hard or we're not very good at it. Either way, it should be
automated.

Others have managed it [1], so it's clearly do-able.

Will

[1] https://github.com/ashwio/arm64-sysreg-lib

