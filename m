Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09AB606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kIOFd/zZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJrT2/1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bhOmEa952md/X2FxyjNFbUxSEKG6z2HGY2NSxyblu7s=; b=kIOFd/zZ3RN/Rd
	KFt9dnXmOmHXy+pLMZsbGHfSSCvJIlZMTJxsS/qHmMqKVOzFTb8f3ksU229ZOS4wiCyX4TiYO79Qr
	bUIyI6ENAUghD06m+YPJZbuYCGRSLSjqg3/qEjTXBkZqyqN3ox9OgEpj+2jE7YyVIWnEFoZaHnmT6
	FsL8Es/ITYWk/o3ljPYML26K/yW6avzuCDRJPd8VCebYJR2sbHwKniKl84GtXgoHpmaejTf4uol9Z
	0WLpw4/IqjG1ktLBGYkLz0+dwStQ9fXoXWyRhq6LIQkeXuv19SedYiM+YmYLDwbBX98UqpdqsmRvN
	RUrjecUjk06g5fyTwHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYWI-000000052Un-2IY5;
	Wed, 04 Nov 2026 10:47:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYWH-000000052UZ-0dIe;
	Wed, 04 Nov 2026 10:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 937AA43AD5;
	Wed,  4 Nov 2026 10:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDC51F00A16;
	Wed,  4 Nov 2026 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789224;
	bh=bhOmEa952md/X2FxyjNFbUxSEKG6z2HGY2NSxyblu7s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VJrT2/1QLEtsT7IAJHPVIQ2ISxt4hMdc3map/aD2+trIBN9mSj3nx2Q9bTpfMT3MF
	 cGNw4vlunjJnW2IgqkdannjrufnBjkEyqAdwxHFKLVUEMfE+G1hX5DaeWBXjmWX36S
	 imsPN3k2zFxiGZhrAEtQPYo34cnkB1wIfefgCgCRieHnN8ascqJ5oPN4Fh4QbYtHlq
	 7/wVgTJuM16kHNFu8An5p+QSkHTadJXmkvy+7t9tMNoYCB9OvYjalYNNGUIRajXJbd
	 YN4n/cPqhT0kWRFpjhDg6dKdJbl4dZ4IR8N3yu9oo0FcspYKIrDgWmd+hMBEXfPmLJ
	 lIvFousnuVg2A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id BE33A198003A;
	Wed,  4 Nov 2026 05:47:00 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 05:47:00 -0500
X-ME-Sender: <xms:Hw3ranMJL85RL35ZdIqlVZy7B5jeINP5BbPezeQrDi-SF2g1QOUblw>
    <xme:Hw3raswrF1gip8laAtOzF-VI-pmh8_xio3Iv18-kjvZb7gAJgZagRdgIgdR_Z9VpH
    3aGcEn9wEYZRA1vkqbcSrpJfGBueP2SI-2Ks1wLLANcLZGoARC6PFs>
X-ME-Proxy-Cause: dmFkZTFcPavaLWIfgpoRM8kguzVyv4s6FUkLYAQNGvkUHQVN3xVxVzv9NryfTRmBx2+1+T
    O8Nt36zML1hPcpqbZ31+TrK5u1pojcuEtJ4d9wGWUhJ3PA4GR64AER0KVm/mg5J8CEvDjb
    87JxU7ByEHQUkd87rjl5YJ6VpVGYEteXdzVHpDfaZbUb25I8yUXHEzXzvTki5YhHrX0+Ff
    dEw6DUI60ChXVG7qPis8rKSRSBjgm3FH41orMrqi8AzmwVObG7DSV0A/n08w8QClZ1o7l+
    535jOrxx7Ryk22b71pTU7piz9TOaOxspVPbT5mctmMzGlgM03lWJfWSB8QGDefxIJWbjYs
    SWRWaf8wtqVtG/y8VhcGvWaXz0LsELuUcWCWXl8uYz0FlppVOkjLlTI83jJnQvIsR6wW9A
    CHbjI9SRCOspRJI14AvVQ1gcqqNFg/aukBnzTQSgDXsMSAvOzAUMquE+WlSukqk5s0kWpa
    njVLPVqOL6PMp5x3IoZtBkRTGd/N3jxEy8pK1FCY/kEv9MN3SOjavcn9IuRnWmh/83Rc77
    6GG8VVWJng4fdcHXdysUYGD2mMNjsZxD/N6+r+yDqOve4t+C3EzK9VWq9skd3rDm5qfSyS
    0v1Q3nZRYNBxw1A74kxjY01EsAfvmnziAM0IIiwwBMPqwOU9vx9fO+TEwqTQ
X-ME-Proxy: <xmx:JA3rarOc2on3e1xb7iUIdCss_xeJ3zdgPplKMTBac8Yz3xu00QXGXA>
    <xmx:JA3rakancmdTtLZDM22WzdIgr8lJQn3ocDdsi_RjrSD_VtAdD8coHg>
    <xmx:JA3ras7McSax5611gqIhLQldHowrwdBi4-xbCgqokzbp7BU_VCYGyw>
    <xmx:JA3rarBd0hh0XKEJUgCfUXIrbQcvdDWVyz9bN0fiE8VImxPs8sd5Dg>
    <xmx:JA3rar7rbi7TJSfdSFS58Fu87suf-sHWjoQzGw8ON1-8MnFv5N6AUirL>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3A57AF8008E; Wed,  4 Nov 2026 05:46:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 11:46:33 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Arnd Bergmann" <arnd@arndb.de>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "David Sterba" <dsterba@suse.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 "Mark Rutland" <mark.rutland@arm.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <pjw@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Simon Glass" <sjg@chromium.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Nick Terrell" <terrelln@fb.com>, "Will Deacon" <will@kernel.org>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
 linux-integrity@vger.kernel.org, "Palmer Dabbelt" <palmer@rivosinc.com>,
 patches@lists.linux.dev, =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
 "Ross Philipson" <ross.philipson@gmail.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Song Shuai" <songshuaishuai@tinylab.org>
Message-Id: <cc4d09b6-a56b-44a2-a137-f27bc87e96e3@app.fastmail.com>
In-Reply-To: <20261103160138.GA3165945@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <20261103160138.GA3165945@nvidia.com>
Subject: Re: [PATCH v2 04/15] efi/libstub: Add a general way to get symbols from the
 vmlinux into zboot
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



On Tue, 3 Nov 2026, at 17:01, Jason Gunthorpe wrote:
> On Fri, Oct 02, 2026 at 08:31:41PM -0300, Jason Gunthorpe wrote:
>> Currently the zboot stub has no access to symbols in the vmlinux. In
>> contrast x86 has a voffsets.h header that allows the stub to know whatever
>> symbols it wants for the decompressed image. ARM DRTM needs another 4
>> symbol locations to work, and it also wants to compile the DRTM libstub
>> code once and have it work in both zboot and embedded.
>> 
>> The current solution in arm is "code_size" from commit 45dd403da851
>> ("efi/zboot: arm64: Inject kernel code size symbol into the zboot
>> payload"). This is neat, but it makes the zboot and embedded cases
>> work differently.
>> 
>> The x86 voffsets.h approach is also nice, but it can only work in zboot
>> since it relies on 'nm vmlinux' to extract the locations. That's a
>> circular dependency for the embedded stub.
>
> Ard,
>
> Did you have any further thoughts on this patch? Did the sketch you
> showed me at LPC turn into anything?
>

I will get back to you before the end of the week.


