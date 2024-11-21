Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53259D6ED0E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17zSb8aYTcL4k10y5LSBGllYzpPsKz6juvWhNwQyQnY=; b=i3rq2BMBW0b39LoqxZjAo4P2zF
	rc4hp4nyTFr6biwDlyxXrxaj4rfiUlElBpV5u2O2lCO3Vb7Yuyo1t3X8TBLqMt7QV68fLNEbvv8r5
	plJrAYDb8GG1UEO7DgZz2yz9spbp0aczkc1jyzfW3RKEd4+ZvpdnWHOvvlhxajGl5KXIp3rZ9hwUi
	LHhRM8a1arc4ma2+me/3aLWyT9Z362R6X8mibwv+9nwOYko+pD4ofTAZAsmRHjDMtdyj5rz3IzTZb
	9ZnCp8IRt8DH5MHimf0AIEf1xQeLZ9Zk5frV597HVYDFRYm5h9I/94Af62q5hyR/ij9E6yeVXruT7
	WEqoCgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5j0-0000000HWqx-0UnG;
	Thu, 21 Nov 2024 11:51:54 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5hk-0000000HWgp-3ICE;
	Thu, 21 Nov 2024 11:50:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3D41B40E0263;
	Thu, 21 Nov 2024 11:50:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fLpGkduEaatw; Thu, 21 Nov 2024 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1732189827; bh=17zSb8aYTcL4k10y5LSBGllYzpPsKz6juvWhNwQyQnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCciykZIaXcSfax2oTiL/AHDcWp/6zwpmpENlLcBtPJi4PhXm3OzfyymJmZP+KPu/
	 FmkdsQpwEdzIB2K7HgMtHJj7h2xdGnhI/w/TZHxKtsqrfWiOjY6xVLTmzdjuqL8ZxQ
	 DpMNwJVWwxoU2C5sH7hcS27WezIsgqbQm2B7o60Qdl3h4bk4A6nVgbEF+vQl45pJ32
	 CUE0uNWztqnGHzq1M4OLof7vd+cuZSLAYdrExlyjLzPxVisP3nSUexKbTCPJrrYgGX
	 UifPUBFhiJhKORCt1X9TXfPYZI0r1a7ZeCr9DyV8muro6qDM48ykAeR45akz43MtoX
	 htNzCC+eCOE/d5r7HFAG1yGuOuuPtrxAJBXupgGBMPAFrakPz7v/jTkF2m9AzXPh0N
	 6DQC6aFSqVIxQVHHP5wCZKnETSsS3mzLbzcU4LTpXGiH49yyf0WDNarDcLarM178xG
	 oZyLDGO/7CJkIepMILrLDw79TFda3NH95waLQm4hUzTRvbMWA0VW7BukvQzO9Xl/9L
	 XX/EzBe84rC1FljjBmbKKqv8r9lyF3+Nf40N70ddYxs99pr346ng6730Bab/Rv1v5B
	 j21YIHV4iQBdDe64pBeSp4bAoF2xTBThj2c/5cDggmsZK65+M0YhYgh5Y6yCFNLh6U
	 BAAIlDE8V00NgOkoIWryTe2M=
Received: from zn.tnic (p200300ea9736a1a8329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9736:a1a8:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9954940E015F;
	Thu, 21 Nov 2024 11:49:57 +0000 (UTC)
Date: Thu, 21 Nov 2024 12:49:52 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kai Huang <kai.huang@intel.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_035036_976033_8862B871 
X-CRM114-Status: GOOD (  11.58  )
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

On Tue, Nov 19, 2024 at 10:21:05AM +0200, Kirill A. Shutemov wrote:
> Sure, we can workaround every place that touches such ranges.

Every place? Which every place? I thought this is only an EISA issue?

Then clearly your changelogs need to expand considerably more what we're
*really* addressing here.

> Or we can address problem at the root and make creating decrypted/shared
> mappings explicit.

What is the problem? That KVM implicitly converts memory to shared? Why does
KVM do that an can it be fixed not to?

Doesn't sound like the guest's problem.

Or maybe this needs a lot more explanation what we're fixing here.

> Such mappings have both functional (as we see here) and security
> implications (VMM can manipulate the guest memory range). We should not
> create decrypted mappings by default on legacy interfaces.

So we're getting closer.

The changes themselves are fine but your text is missing a lot about what
we're fixing here. When I asked, I barely scratched the surface. So can we
elaborate here pls?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

