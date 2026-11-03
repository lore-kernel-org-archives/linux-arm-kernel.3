Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010FF606C58D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQBXB15F;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj4XtqB6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vyb8rBXQevAy02jk8h0gbZFOZmPCLNrIrkV1juknGEg=; b=zQBXB15Fj9i7Y1hSb7AaCpjkau
	qTobQFxBp70QcTH6YCB9LmI+dtRApYtIxtYvxj6WZLf8S4st33QVwISSH1M74KENoLNrriDXDdep8
	k4MUSYVx8+6upwLztEDbpr+w20WCvSSGkIU4qKoZeCBpGF5SKk7pSYgOildfxP3o2NBUmYx3gDWk9
	eU7GsHf0ppnsHmWAFun9mumWEA45Sp1SsICduS/SfVV4xC+Tj9Q15rupXKW/qylsAjUCmAhbXUXTT
	7u3m6pyL4FolzmHU9QKQWGFwXY9oLG1Zy6GkJv5qkYv2lYhy/59EmqtLHVMCVA01pEzyt/EAIYjeW
	ZSSFQxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCW1-00000002AB9-42yJ;
	Tue, 03 Nov 2026 11:17:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCW0-00000002AAh-2GZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:17:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E98FD40F81;
	Tue,  3 Nov 2026 11:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892151F000C1;
	Tue,  3 Nov 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704639;
	bh=Vyb8rBXQevAy02jk8h0gbZFOZmPCLNrIrkV1juknGEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zj4XtqB6kXc1VRzGIvaVl7uhmtGdWyLKr5ZsINr/ZG3fMeTsW1zn9IHvsDXepLh7k
	 Rm7eRVE3lfJ1A4xGHB9QsbnIVRhAWLYE4SiTlPry8FREICxLQNsQEg8WXfK8KbOyq7
	 jwYqw6rn/+KrcfD/+l/8CC71Fjs9GxoPKymz6DA6H87xM80xvBuwuqY8QdsbtzcK+f
	 5wLiT5rHVK8eQePGziy+yruR/vtvYOoqAXg+ep3RyaRWkdi94FoKBZaop50IEMocl3
	 ZhCkM5YMp0hkdVbsV5BSuO3vrTQL4p/SZEK0NnfpuLnIgCBzbbmePEKJU+YzrvmWwL
	 C0u8IY9ZOPDhg==
Date: Tue, 3 Nov 2026 11:17:15 +0000
From: Will Deacon <will@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
Message-ID: <aunCuysle9uzTRI1@willie-the-truck>
References: <20261103084140.7689-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084140.7689-1-paul.cercueil@bootlin.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 09:41:40AM +0100, Paul Cercueil wrote:
> Other archs have it, and it is supported in arch-independent code, so I
> see no reason why it is not provided on Aarch64. Add it there.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> ---
>  arch/arm64/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..f8542e532b50 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
>  	  the boot loader doesn't provide any, the default kernel command
>  	  string provided in CMDLINE will be used.
>  
> +config CMDLINE_EXTEND
> +	bool "Extend bootloader kernel arguments"
> +	help
> +	  The command-line arguments provided by the boot loader will be
> +	  appended to the default kernel command string.

We previously reverted this in cae118b6acc3 ("arm64: Drop support for
CMDLINE_EXTEND") and I think that reasoning still applies. The thing
that _has_ changed since then, is that I think bootconfig now has some
support for early params, so that's really what people should be using
here.

Will

