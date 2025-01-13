Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE3DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7I2roNCv0cA2xwHwq/SdVFKPAdjkOPbUq+jG56LmT8=; b=YcGGsPDWfWMAHNQ6qBmkEdfbds
	KkUX2OV1B95ZguxvIBiZfi8AoOMdnZ1zpdU+ZTgeRGFAjLqxUZKvYHXaSrNjyj4XTHCABDfKsva7F
	arL0JBo3sNZWmlNglYN0SwoCMk7JFiPlqandxP02pr1cNIdpS6RSnphcu8ofjl4+yibNTjvGEHN2d
	KENkBa7rBHgdp45lFzjdzpO6WZAaLS663hEoKsd2nhhexZX8x1QqLMWsoI9wfcGVLX0HORh1fi9cq
	E7230AkWsYiALf1Db1ohJkfZQWD0iB52MxbQs1koILHqr5ShNDZ0UvX5p4gb9tGAra0EsapSQo0qz
	PDLxU9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRVF-00000006bgy-0if0;
	Mon, 13 Jan 2025 20:57:41 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRU0-00000006bWU-30b3;
	Mon, 13 Jan 2025 20:56:26 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1194540E016C;
	Mon, 13 Jan 2025 20:56:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aEH-oHTBFUf8; Mon, 13 Jan 2025 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1736801777; bh=F7I2roNCv0cA2xwHwq/SdVFKPAdjkOPbUq+jG56LmT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDwj56jIxyiwybo2fHKx30mPor7XD1jCyqIXo+pqTQJES3SShMGbYwv2jrmMqVKfg
	 F8wTtPcJpmgKDDAlnVZMSa5mcWl00K5w6XLio0AzgwETz1MhN+wCiH7FSIyi29tf5Y
	 LCE5H8V9K2NkBgDYzuTeoSndempNPu5H7oSYqPQA7IIG8g60IGeSHyCPvHXnUbEiDn
	 1DqGGQyRtHFMp7uJ3J+OuGag43VavVJtQEjXo0o6oTQCmDlKh6qzBvpVfckL6QP7CR
	 FD+Bio9azT6wLrpOc4GuXvqNQPY+vB6CqbUvKtAoMvX5HbhccclqGBafmzHdv7nwQ4
	 jSqTOUx9E1He3TBkVAh6pInUoU+665M/VPUJQp0S3mqqscBovzC4RhJbL1bUqZfqhu
	 zAsHC6uqWOxqppfPM+lGZvhf+If4AXPkyOjGOaaxe6zZ5su3U99iZXrbIJsrLvT67A
	 gXJ8ImkuLGf+YE5LrBeT1VuvdmmOmMwqGWTV2vS9WivObqUn3Z0a6o5PuAPjB0pJhS
	 ro50FLf6ILwTUJBLl697/ZFOfrB/ckunEM3A1no8NIUqVT4ruGSF0CQ58Oz0v9Mshx
	 t2EdNFrrYSiUvRsQ6de9JsSvAcyKhs0TAxb2vJFcBGwXNdpq1FN+pyjKsUKq0HLE86
	 VCsoJI9zvHpY/2ZJOzJqdM5A=
Received: from zn.tnic (p200300Ea971F9328329c23Fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971f:9328:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6C3F340E021A;
	Mon, 13 Jan 2025 20:55:47 +0000 (UTC)
Date: Mon, 13 Jan 2025 21:55:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
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
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv3 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <20250113205539.GIZ4V9y8qq-45uVEcV@fat_crate.local>
References: <20250113131459.2008123-1-kirill.shutemov@linux.intel.com>
 <20250113131459.2008123-3-kirill.shutemov@linux.intel.com>
 <1532becb-f2be-4458-5d34-77070f2c5e2d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1532becb-f2be-4458-5d34-77070f2c5e2d@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_125624_907443_99D4F0AD 
X-CRM114-Status: UNSURE (   8.23  )
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

On Mon, Jan 13, 2025 at 02:47:56PM -0600, Tom Lendacky wrote:
> This patch causes my bare-metal system to crash during boot when using
> mem_encrypt=on:
> 
> [    2.392934] efi: memattr: Entry type should be RuntimeServiceCode/Data
> [    2.393731] efi: memattr: ! 0x214c42f01f1162a-0xee70ac7bd1a9c629 [type=2028324321|attr=0x6590648fa4209879]
> [    2.394733] BUG: unable to handle page fault for address: ffffc900b4669017

A wild guess: looks like it tries to map EFI memory encrypted now...

Anyway, lemme zap. Those will have to go through the full motions of testing.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

