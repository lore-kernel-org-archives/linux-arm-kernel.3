Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AE4CFC516
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FWLWKPXhgbn9tQ4lf4/5KNG89sZqn7a1hjveRVRQRU=; b=tXJaAcNIOs9eiFPI+JAkbMBO3D
	Esju0Thd16gVWchOGYqLW6XKYVs6bdrPWnDmli/739iVdJUU3J8aHINcjttIhJueLS0S6gcBYi2b1
	dxq/ewR2+VX1aFHBWbrvMFdY0fDALqVk40LVISmKkpioQJKjzeT8oBcmCTprHRJ3jbSJFin7QPcnP
	/TBoUFaH4AfyCsqjZvkN6u07P3HKN/TsDXdiC9rxHDXgnm6AT5FBXowU3TQVy1i/SOoV0LUldGWlg
	L/pKodj2jv1L8Y1CLJxhKoB4KoL1aovq1I/LGFU+tmgmC7IyUCaKOYSZAdkNErz6jSzL9aPhNp/7w
	Q+BlusJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcXf-000000099Ne-1tyq;
	Sat, 22 Nov 2025 01:35:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcXc-000000099Mr-2NMQ;
	Sat, 22 Nov 2025 01:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E464540496;
	Sat, 22 Nov 2025 01:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C965EC4CEF1;
	Sat, 22 Nov 2025 01:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763775355;
	bh=nQkWOwaTw36gMDiYgxDhMlzpOTjcrAM2DF2QmNc8EMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l36EEGOjwua6msm41YR6/XW0HneEoFKcD817r2luDLPv4cwsDLsxpy/R7NtNuKVeV
	 YbZdTcJUSt0oqJPoFWsDo3DXphieyd3wKCultEzKQNX/aaS54ux2b7HFkcEkQ91GTt
	 Z4TxYiyuAIttgeCCHNCnFjL+M3UugXlvVaUdVcDZVg9AP0m56CqPdQkM1Qo4vDHzOp
	 vgXgzwEcZwEKliLOK2EMNNqlU9QRnRZafcBLqAuQDi9Ag3SRkBzgWNIuE8geiNWfCa
	 BH4qnKX2BA8ARE0zRYGiF/cKiU5r33tKYS5IV8B8+0iXr9pekgZ67+vWAvNGJ1b9Gk
	 m6p1Ii0z+3Euw==
Date: Fri, 21 Nov 2025 18:35:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Message-ID: <20251122013551.GA3928114@ax162>
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119042708.27658-1-yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_173556_649608_83E604DE 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, Nov 19, 2025 at 12:27:08PM +0800, Tiezhu Yang wrote:
...
> index 433849ff7529..e72d3254b93f 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -61,12 +61,11 @@ vmlinux_link()
>  	shift
>  
>  	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
> -		# Use vmlinux.o instead of performing the slow LTO link again.

Why is this comment getting removed?

>  		objs=vmlinux.o
> -		libs=
> +		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
>  	else
>  		objs=vmlinux.a
> -		libs="${KBUILD_VMLINUX_LIBS}"
> +		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
>  	fi
>  
>  	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> -- 
> 2.42.0
> 

