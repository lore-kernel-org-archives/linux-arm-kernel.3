Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF59AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQvsb01xzlGHM7LKVKP1tOCkGZRrJOceq7UoklVtaK4=; b=k4Qv10L1b6JkFQ6kezn0jJaJea
	mJO7YrwXhViW9nAGekaTaG4gosu0PCq2Cj6q24NUEW3Z+egqrY8RsoObk4ynjTtX7v7+hT/lGetGN
	e+wCXHp5WVqJgxFMmsmAL8qpseXV7+Vg05ixYf7RlzOE2WZaOvkpuIhDNysbae35wZwp+MSVWv+1y
	r4icjPfKCBK+3nY5sydHDGR7VgNp8bgCbCq9rpmdhm+9Lft8CkK+EXxyntjxuh2lelVs1fU7wo2h6
	n3s3v3/VA+134jtRj2WbyD3EOA/x3Tgfzj1Z7fO1w2iWlOsP42ecx5sKko3KHVANqaimoGX5eMXuW
	ih2oj9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucouu-0000000DERg-1VI4;
	Fri, 18 Jul 2025 17:30:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucopQ-0000000DDEk-2QrG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0133F5C694F;
	Fri, 18 Jul 2025 17:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4F1C4CEEB;
	Fri, 18 Jul 2025 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752859499;
	bh=oVO5M0xi9nHuF2wLV5lZIwV9zZTHFOJINcZiTfuxVMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqXalVmJ44i3C1Q1lZX+O1wEI6wKjOoYPZ1t3bA8aoZ2FUaaVn3QiCetoUYw7m9z2
	 RnNt7q1ghLvXnreglbMakN+S+6i6Vo+Md/+RfrIEBGMIB3L0YjMvj7rjIHAumcK1R9
	 9caF4FditaprdNNusCfs1NjwrfpNJnd/1ABK79IzRnS/ijirZpAaAnWMd1bbUUmOY/
	 InjU+kV49p8Rn7kLevtJg+PcO8UqEbXm0VB38B+flHprmY7HaLtWIboKpi5+0S7CSL
	 I9eCKxE6pjSGWTgkub5pwV3502DeVWGGS78Y7zaHCRhdOWlOVrZz84wsLygXKNFy48
	 ldVY1/Ozd/Ctg==
Date: Fri, 18 Jul 2025 10:24:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/26] SHA-1 library functions
Message-ID: <20250718172457.GB8845@quark>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_102500_661994_1D4F884B 
X-CRM114-Status: UNSURE (   7.32  )
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

On Sat, Jul 12, 2025 at 04:22:51PM -0700, Eric Biggers wrote:
> For 6.17, I'd like to take patches 1-15 at the most.  Patches 16-26
> would be for later, and I'll probably resend them individually later for
> subsystem maintainers to take.

FYI, patches 1-15 have been in linux-next (via libcrypto-next) since
earlier this week, with no issues reported.  So I will include those in
6.17.  I'll resend patches 16-26 later for 6.18.

- Eric

