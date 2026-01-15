Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0B4D46617
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHiV60RInJ4eituFivtzOayNDVgKZkDvtZ7bVjXaEgQ=; b=4ku7keDJsS8/+ylv6ft7RCeswZ
	2Ekh2Cz+c/L8aU7LctpmDg6biwGnk4xKl8Yllb+9TFErJnJ4ZApxp5/ke2ru7IG3dVlvX8yaMhQCt
	0A+ykTANWQ0KXWzFJpjuZWO8/luWF9n33RkS7FZaI4RlfbnYYYWRjsQ+iV5wy3MXjTKVMJ/YEvBIg
	UnOlpZVwdbA+iX1eHQfy+QGVSfMlFQYdgfPT59YDXBaSE0WXOJ0YDisgUHgNFyGK51l95TgeCiVXT
	XIT0z948X7xloroOTfFhal1HKlIa0lnzqYz+TJKXrPqN4DvVwpYWEuJmczVPpFZoH+etq7HqTSOrO
	+pxnXCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUEo-0000000DB8G-41Ke;
	Thu, 15 Jan 2026 20:46:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUEn-0000000DB7n-2oX3;
	Thu, 15 Jan 2026 20:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JHiV60RInJ4eituFivtzOayNDVgKZkDvtZ7bVjXaEgQ=; b=BMdtoQPQ8hyAbCpjH+VrX9zCBh
	AJgRYoeL5Xi/tWfaDSlO9F1cGnKzCX3r+0xsPKEDBsG08Z9vOmZ/z5EazSdmJFJtVxUIDRHbgRA1z
	geDml0x47uwc/BJLrXAycVEn/vZYZOSJUk0iHtHPglcka1jiPBCnx31hLKXAtzLlfk5B05KQwzA+c
	UOhEQb3VlXXzV15Drcd5ho+evd4EWvpeARm5lPY+BrX7jS+ZXRbOnfKh0AeQa67P4gOqVeCxMS1Am
	dXz9/OcguKKIGZqetOwLCdpeRzzsjN7ma4/PkFpXO0bQzuQ0JiXC6k+7b+xLDNm032fQQuSZTDBbq
	DDa7++9w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUDy-00000007chY-20g4;
	Thu, 15 Jan 2026 20:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1B2B40164;
	Thu, 15 Jan 2026 20:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144BAC116D0;
	Thu, 15 Jan 2026 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768509939;
	bh=TrVJ81gNlKGWflE9lzJbsnP9K0M2Q7j3JRWiu7197P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+snff/V7iHtCcygjYFJPTDIRB2va5QWcv2YTvthzYkkKO1dcLaPj0r1cWb+Qb0Ai
	 ZVpOJ/eQka5sAfYC6lulUHJjHAJpvcWXM+J1c9dpGfWO8QtlVm/Cw2UmGDfsxb+hb2
	 IyAaokiFcv3t0x5Ft7gH2uq7nPZ/1cVZRdTZbS2YPI+uHUJfIZ2X9X7c3kyukr5qNM
	 R+2zdGs48Km5Khd4oVNLQDGIKWfd0F+kukNy4BH3hlSFRi//OC1itB5pkumE0828um
	 nikeLbBlI0f+FnI5/oQ1XMHlgzziQOiqCsrTkLzNGbBUcWTeyZjD33D9GwKuEKNpfZ
	 SyUTiXJoNf48g==
Date: Thu, 15 Jan 2026 12:45:37 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH v2 00/35] AES library improvements
Message-ID: <20260115204537.GB3138@quark>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_204630_767650_549DA840 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mon, Jan 12, 2026 at 11:19:58AM -0800, Eric Biggers wrote:
> This series applies to libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v2
> 
> This series makes three main improvements to the kernel's AES library:

FYI, applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

As always, additional reviews still appreciated!

- Eric

