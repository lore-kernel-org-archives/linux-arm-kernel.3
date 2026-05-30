Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E3CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 00:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioovfNICWi2m5cB3wAo6oQnvV/qiuXbbsOryce27SBc=; b=MtYa9F2gvecXB/varWwC8x9EN0
	S0PdJqrpmmI1YlfjHy4dQvoU/UEuvpBxA7+wLSdyMVaeigoIlpoFN4DHKG3IluhVvn3cRI/Xslr75
	xICXB4p8Hbk6FEAgokSYltliUZlVw4I+dHiRoSPinKFJbh2ku4Szfqi+c7Gu9vQ8UwuQaMrjoHH1v
	S277uMa9dY5wh1FHgLrsksAdGvBu1C56hFOeOTTXsHmw316VZONNPhsXT1E4ITQmmuzWHZk271Azb
	Ga+8S5hkPiyCfZu/1cbqUGE0EGSOUum5wphKoqXv8MeFwFIWq8t0z7oZvixO7AUX1LOUtj/gzvQJd
	A5CCo8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7rO-00000008LIG-0EkC;
	Sat, 30 May 2026 00:47:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7rM-00000008LIA-27PT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 00:47:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B302D60103;
	Sat, 30 May 2026 00:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286D41F00893;
	Sat, 30 May 2026 00:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102047;
	bh=ioovfNICWi2m5cB3wAo6oQnvV/qiuXbbsOryce27SBc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XntoT9fJpcZmUrd2j5nqvr6zdzqWla2cGzTEY6qk+/PafVO8drdJTy2xKbrfwhxl+
	 8mMOQTp5Ge5vHRxAN1k4cD76th/YW44nt0kXJBNFVAYJ5EZ43wrSDPvx6X/zcEQjP8
	 V3pAfwMRQG8fSnU3ExVOHXlUU/IQ/kQPwT7KiYQPj/BmtGp9e/F0U68FRgIViGhRT3
	 kG3CCtltTPf9IAkI1N1SR6GUXNs7ILn/V0X2X26vRTzPAdxKxkECPM83zt8XZceTsf
	 LYU2UIrMS3USCS/4gvzuDzH6Nvf+h1L5VrHnSVZHM/MzUy1M2HFPmxZOnTTnq+TrTq
	 uWsvX1SuHNoOQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] kconfig: Remove the architecture specific
 config for AutoFDO
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com
Cc: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, 
 Han Shen <shenhan@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-kernel@vger.kernel.org, 
 Juergen Gross <jgross@suse.com>, Helge Deller <deller@gmx.de>, 
 Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
 Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260527214510.3907973-2-xur@google.com>
References: <20260527214510.3907973-1-xur@google.com>
 <20260527214510.3907973-2-xur@google.com>
Date: Fri, 29 May 2026 17:47:11 -0700
Message-Id: <178010203121.3743687.8945076194906841190.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=779; i=nathan@kernel.org;
 h=from:subject:message-id; bh=C6cIDU8UrPAQoDBkDxooB5+2kbeAO4aKSea5P+VWQHk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlSxjO/m25r/3d/sZnJ2usTF8kLqszYdXXl5tcXLNasr
 /nyt5rzfkcpC4MYF4OsmCJL9WPV44aGc84y3jg1CWYOKxPIEAYuTgGYyOEGRoY1k4LiAy6U187c
 IezlPOvPOfn4BVNZhD98nZy70kKq0vczwz8bvQcz096FTL7Ut8ny+tSry5YeKLvN/vhSxSy3mPm
 ic1bxAwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

On Wed, 27 May 2026 14:45:07 -0700, xur@google.com <xur@google.com> wrote:
> The CONFIG_AUTOFDO_CLANG option currently depends on
> ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.
> 
> Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
> builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconfig
> and avoids potential confusion.

It is worth noting that not all architectures support
'-fsplit-machine-functions' but I guess that does not matter too much
because it will only be used if a profile is provided, which would
require an architecture that is supported by the AutoFDO tooling? The
documentation is x86_64 focused but aarch64 works as well, any others
that the kernel supports?

-- 
Cheers,
Nathan


