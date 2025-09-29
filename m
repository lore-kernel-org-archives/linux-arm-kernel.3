Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E508CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kcv/etTmu566g+iKkCuZGN9x9L9mGLs382yOkVXLBc=; b=mRZar9ooCC9t1AmWhA1y6LjENc
	sIId/UMWIIhPk+5ftUsgT5cZNLuULavbd4y79ZZ214OEfEphmS1NHlIMb5doUtR2xEw1GmixvKte5
	cdFAo5r7mvqrd2QCgA0KBkTOAeRkPVNFI41vVEHExQikRJKvm7/ZvCBk9wNY6nr8/R3fRccWxv2nK
	i5HMs4Nc4gwP85OKwVUa/aRCVuIUQ6+OjppZm9sk41P2ov4fkt4u+d6f1R5AL41yuRwLaXOtRE+Vr
	4OJ6aL3XEGArDcHCh0dYlbN8sVh2aHAET7Kjn0m7EBTMAdtpGpUPQ0QCM3ET3sX9Ampmc7wW0is0w
	2DLvbwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BV4-00000002F0C-0hP0;
	Mon, 29 Sep 2025 10:52:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BV1-00000002Ezf-35Ch
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 10:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20EDD488F7;
	Mon, 29 Sep 2025 10:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39192C4CEF4;
	Mon, 29 Sep 2025 10:52:51 +0000 (UTC)
Date: Mon, 29 Sep 2025 11:52:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jens Reidel <adrian@mainlining.org>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Message-ID: <aNplAOAzJKOUigPC@arm.com>
References: <20250919184025.15416-1-will@kernel.org>
 <aNnQb9gH8pzwfRJ5@probook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNnQb9gH8pzwfRJ5@probook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_035255_793305_D3E3B247 
X-CRM114-Status: GOOD (  21.32  )
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

On Mon, Sep 29, 2025 at 02:18:55AM +0200, J. Neuschäfer wrote:
> On Fri, Sep 19, 2025 at 07:40:25PM +0100, Will Deacon wrote:
> > Big-endian arm64 configurations are vanishingly rare, yet we still claim
> > to support them in Linux despite very limited testing or visible
> > interest. Supporting big-endian adds unnecessary burden to reviewers and
> > contributors which, without any known active users, is hard to justify.
> > For example, recent work to improve our futex routines and to implement
> > nested virtualisation support is non-trivially complicated by having to
> > support both big- and little-endianness.
> > 
> > Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> > machines in their telecommunication products but I don't know whether
> > that's still the case and certainly haven't seen any patch contributions
> > to help support or maintain it.
> > 
> > Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> > towards its removal.
> 
> As of this month (September 2025) there's a new community project [1,2]
> to revive aarch64_be. Jens Reidel (CC'd) and I are involved in it. We've
> been fixing several aarch64_be-related bugs, but mostly[3] in userspace,
> because the kernel support is pretty solid.
> 
> So, just so it doesn't go unmentioned, there is interest in keeping
> big-endian ARM64 alive.

It's nice to see it gets testing but is there any actual beyond you and
Jens (i.e. in production somewhere like Huawei's case)? We want to
assess whether it's worth the kernel maintenance and testing hassle and
for how long.

-- 
Catalin

