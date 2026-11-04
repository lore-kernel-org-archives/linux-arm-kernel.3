Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wqw7kE0j;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=opkYPVpU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K0rySmeszlwesNt+BpG1prftZ0qETmiHfQCf7mxwY+8=; b=Wqw7kE0j1xlwYN
	Oo4OgJ69hRXOCMwM+Z6q+MtFT6QL2gqQ6TzqIuoVG8dcBJm8x7UI/3a9TgNE+aMKhLuqJa/y1vshb
	GgX7Os/+EOLiLi7M1zpDYo42a+ossZPcSvNJ1s5CJkfERFZB1LMPnn/ndl/p33BF6sgBOqBjT4Gzu
	OrWPw3vKQBUKusgQ+4j2LiRa+27EEAU7ktVjirRanvjMjoLytUWbClsNhzh6K79L5zo1RFXDuXoA9
	UgtUde0vi/KHzoya55OxhLeshwi32h38qmnvrCgr9Fp+NJ7r4YqXkcJ9NtXy0Ohl2wBinWFz6nwtS
	HymX+M6MC4yOMYYAwvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWmb-00000004nON-3bH0;
	Wed, 04 Nov 2026 08:55:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWma-00000004nO0-00yI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:55:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16016602BE;
	Wed,  4 Nov 2026 08:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C701F000C1;
	Wed,  4 Nov 2026 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793782546;
	bh=K0rySmeszlwesNt+BpG1prftZ0qETmiHfQCf7mxwY+8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=opkYPVpUlkOBDt8qLmffe6p25djypjA6pghz5SMs1Do0LJfs/8nPU6+JOeOJM6pvU
	 21rCaZYpgo41OiplxfD4mg2rlKdoUZqG0rz4kzknNpDyKUO92Cf5IBXMWywNGB5oPc
	 +lxEYP8jrli7oT0gnzYu8y8+pug4WXmo4Zbac7iyXWqO8e/tQd6KCyMDErUN9vi/dm
	 K2t7PNRx8Yv2P7FjZq6L9AejwfPzx5nGXxOVidT56hb0N+MFP/nYhF39x9H6I7uJDH
	 1MIZsia5+Z4qgsPrlzdiJt7gLSdsSVMyc0iyRj2G03slNyC52lJ+xxnwMzGkm4k7ru
	 esRwa0SsdEtRA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7F3FF198003A;
	Wed,  4 Nov 2026 03:55:44 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 03:55:44 -0500
X-ME-Sender: <xms:DvPqalu4g4t_OfCvclUC1vu0OpYwG04KrLkfslEWLnm0qPdP0O2Saw>
    <xme:DvPqapQUKngd9sIDi1bLB5yMsa5ISeaIAtugBQ5kb0Wy3tNR04M7klFfwhzOS_7X-
    DFfxgpSwmMdmNEkyIE8WIZLOMl89mj88_QOjDq7kNkNngomELMKvg0>
X-ME-Proxy-Cause: dmFkZTFhdAZKbzPBszKDlHsnLD4XkdkVXbZmmJyXKrBR+/2QX1X0MZdbqtJKU0fBYdXfWV
    aaSCG/TiJd/5b3qTXDhBCQL5w90NYilX82VwtEN1/jX+9qvNlxgUBek+kYWInFAn9hEEi3
    p/WZfZfe9K7ChM6QV6pLY7QwnS0mwRrRF0aRKPTY7udMiaN133GtIO641dS1DNrAZjvwGZ
    QrQnLtpeEurG+qw2BVIiH2V0YxKMd24Vkf4FaBs+A0xCIxqwmeBUg0YVt7XyqbXLuhtAdA
    /NjAhsBF0j9s4HkzzatiFvLmFD7luXwl4O+mynzBGp2bmwwCers52P6291pAIzmiHkpqEz
    fJEdb0/J/h7llEeXvUJm5ykRMkFDpGmZZpu6pa2rVfrbnal6/ha6M7NlKosgkXMty6FLO4
    AKK7xNsMSXfSBVmj6nuDfluhI0Z/D8UUKERBgV2Qj0BWTRThgABc5D5plXENuZ8WMUDFAD
    vIzgJEGoA7m05IKlUZTPzAmqin0IpY/yG/yUWylPZdUPnxWi+dxikz9EXI8SXGGvzwyNGd
    R3LJ2jmyuDeejd4Ytn8ynl2paPHeKJi/MlP6fDdod4LcEkNJdXFVnRyOSdbKJpdvj48J07
    A4we8EGgfE6fkFor1dCce0qUSasETDcVFtZX4yIKJM8SHjyqz2pk11Kl/mzQ
X-ME-Proxy: <xmx:EPPqar9ClE9y2JX2cmnRJBOr03ypzl9nQ9GDfVMo7MHeTTIR_qN11g>
    <xmx:EPPqaoK7zVG1o881ohbMCsXXw6_rfJbrizA8YTTQogJRXIvrlSYfNQ>
    <xmx:EPPqapue7gstD7xiKQtfP-LD0D8-RID93wkeptombaqF4aDywMlh0w>
    <xmx:EPPqavCwyI8S4Z7ii3XGwD37Qfaze7dmroxOUrhFT1S1B4ykdGfVXw>
    <xmx:EPPqahMvUTivWGflbt2r2EFjRZ7Wza_d5o5T1GokHhv_c538AwIJrsAY>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A4B19F80093; Wed,  4 Nov 2026 03:55:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 09:55:22 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, linux-hardening@vger.kernel.org
Message-Id: <f3788c77-4e9e-4602-8c9a-654f9ea0a8e7@app.fastmail.com>
In-Reply-To: <20261005110511.157016-4-ardb+git@google.com>
References: <20261005110511.157016-4-ardb+git@google.com>
Subject: Re: [PATCH v2 0/2] arm64: Implement support for BTI veneers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 5 Oct 2026, at 13:05, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> [ Resending this with minimal changes even though some other approaches
>   were proposed as well. [1][2] Neither of those are appropriate for
>   backporting, while this series can reasonably be applied to older
>   kernels. ]
>
> Recent toolchains will omit BTI landing pads from functions with static
> linkage that never have their address taken. If a landing pad is needed
> nonetheless, it is up to the static linker to emit a BTI veneer withing
> direct branching range of the target, and direct the call to the veneer
> instead.
>
> Modules are partially linked objects, and so there is no static linker
> that can do this for us. Instead, the module loader must see to this.
>
> So implement this for the arm64 module loader. Patch #2 contains a test
> module that was used to validate the approach.
>
> Changes since v1:
> - make HAVE_LIVE_PATCH depend on !ARM64_BTI_KERNEL, as live patch has
>   other cases where landing pads may go missing
>
> [1] https://lore.kernel.org/all/cover.1786768375.git.jpoimboe@kernel.org/
> [2] https://lore.kernel.org/all/20260822135323.795946-11-ardb+git@google.com/
>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
>
> Ard Biesheuvel (2):
>   arm64: module: Emit BTI veneers for cross-section calls
>   DONOTMERGE: arm64: module: Test module for BTI veneers
>

Ping?

