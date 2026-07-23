Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F264AC531CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2M839mlvciwjP3qRllak7mRBXp2uaYGUn4kNGJ6a2w=; b=D8C7SDEPQzFCmlZf9Q2kRWE1ws
	e5sNDTBZfp4Zv9vvacz0dD2SmQ46PpkF7lLIX2BJ+WTmlf0CzJTYhJus9x2Ui7I2JRCjoMnYiX7dP
	qJl64OAltNavks5u3cAQ5utFO8C9uEO5bygOaZYo0G+JW8hz70VaIdAujb8S6vKpJeKCEDeK0WSXw
	bwhPfgNybHuVPsTMKn0M9gn3qyWnSJDhKO09DBsxShUnf5FvGV9zAqZkn3mLN8JefC1L4csTYRT5y
	GldRrl9a+KvDu6iKMZulS5VfNlzYL4MKM2HkpOBVyiyWyvTTtH/PlXXdNk6FAn1koKFlFDlahkUf6
	gU6QfbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmq7b-0000000Dwws-2tBz;
	Thu, 23 Jul 2026 09:53:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmq7Z-0000000Dwwh-3sjn;
	Thu, 23 Jul 2026 09:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56BC240681;
	Thu, 23 Jul 2026 09:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26EE1F000E9;
	Thu, 23 Jul 2026 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784800421;
	bh=I2M839mlvciwjP3qRllak7mRBXp2uaYGUn4kNGJ6a2w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=BQ09LaC0y2QDWFrL55/EejQ8lEXeYXrsPw9st3DpkbxnDeT+Q7wpIHzRGXeuE1Yzq
	 QNFrUkKQMMYaBkgoOPY168b8EfZQ0QyAs3ZgnZ5SOn9M3KO008luzFHN45PJR99m5F
	 fB3eZ0z1qpdPbgcZSzm/iDVi+voAGMU8I+bdr5rInwO7E5EoOHH5sbWV00lVUbuRY4
	 /1yLedEhnI+Q/C6CfO2xd0ffm+qgNHiR1rm1guNj00Nf4Lco+c5VQ5SxtNBENis5GF
	 0jfT1DkWcQLkUYGoA6iO5c5AKT6HV1FpIRVYqqZnp6yHjE3QrRpTzFrg4ser2ubKpe
	 ovwPsW2gYjLCw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7DD64F40078;
	Thu, 23 Jul 2026 05:53:34 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 23 Jul 2026 05:53:34 -0400
X-ME-Sender: <xms:nuRhal_UUsYSu4hxoIcW5tkU-5QAVkwhKGmuPhrqXHUqHqd3MPAc3w>
    <xme:nuRhakiaNOH2-kPOG7c1H2gGgQNNQE97r4PO8ILsr6FZbWMN-UTb8yV3V8gn-P-vp
    c1wzifr_EvqlYL63cZkSgQcI1RA-UDaRrBK9XdLeLELBHP6v-UVFQ>
X-ME-Proxy-Cause: dmFkZTFHZDEhc6/KMefjmMp4uMeeE3Zcb9mfs+V06mdxw3F5PEChH3KemwCyws3jce4Mqz
    r9y+127SMPJFdIWF1YwFK9JBClNfqxmhNrJQ3CTMT06b4ew2B6pnn1U7m2heye/pLt0t33
    yIacOoENbTlAHndzSlpi6MA6leuJWy0j4LK2nHoja1f+q81tI8AzboB88nxK/WQLxrC6II
    wdKaz7tgJFFljSrLD8ubTOg9ZnJu+g/yY7wxQzbg3uTDao4HSUgCTrKn6rM9DHR9mOFcXu
    9oB0yPjJUSpsqYCYYpyoxeyeJgzFa8aH18z40rAf2NyB80rrQzkBKeftHAn0RRwmQzYiUp
    nSsATbUjtnrbeX0DKpAklEn+h8bq5gK81uRfyV2eG7TgOHlvvj8nciPN9J8hQNFWPSqW+m
    F3ac8sjnNFwFwgu65VWvkX0UXJ32WuN5dY4Mwm8Nfk4HHHapIRnpX5ZbFHiTEr3c0NsYER
    38ffc/JDfh6MpEmr8ErH03NX+zrTWRKc3vIYZFiKwQCIknFJJd8bnV08Upe7NSZERj3G3p
    f4pBuNI/Xyjz04xloT4DpUf5IjYgnua5CY6zHjzCdcdRHBh0Zo+H4aciIU9j5cFve8MqLO
    vjmcxg5CpjW5NfFt3SQ8vyh+xCSkBzgbhDOPT7WrrpIg1zBA1o+tm0rgzVfw
X-ME-Proxy: <xmx:nuRhappbi0LEylwvyeq7Fkf4xAQ2NmUUkiC-dXydIGLJAgko6bvC-Q>
    <xmx:nuRhaqKaIGcfq-QXhiZ5ZrzcnzkDtJdUsBACQPgT0KeLVLAwAuUmrA>
    <xmx:nuRhatB-I7MJ0d0hafgvQ8lqdp_DVCZMdEDBYalBDjwFkbihmG63MQ>
    <xmx:nuRhak4qMkNrazX96NHh14lR3Nklsy3n_xbXQxTLI1j-ZwJ3-nkl_g>
    <xmx:nuRhahFVRSK-nkqJFeDnSEuTyJjTntoREXzbHJk_FIdsarhAhew9yYMX>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 610A3182007E; Thu, 23 Jul 2026 05:53:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ADJgN6ak6HcB
Date: Thu, 23 Jul 2026 11:53:14 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Nathan Chancellor" <nathan@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Yingjoe Chen" <yingjoe.chen@mediatek.com>,
 "moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
 stable@vger.kernel.org, "Ard Biesheuvel" <ardb@google.com>
Message-Id: <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>
In-Reply-To: <amHYO1c-5vzqSekt@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
 <amHYO1c-5vzqSekt@buffalo-ssd>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels with
 Clang
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 23, 2026, at 11:15, Akari Tsuyukusa wrote:
> On Wed, Jul 22, 2026 at 02:03:31PM -0700, Nick Desaulniers wrote:
>> On Wed, Jul 22, 2026 at 10:25=E2=80=AFAM Akari Tsuyukusa <akkun11.ope=
n@gmail.com> wrote:

>> Can you perhaps help test/verify that Akari?
>
> I tested your suggested patch and confirmed that it fixes the issue.
>
> Device: Lenovo YOGA Tablet 10 (Wi-Fi) (MT8125)
> Toolchain: Clang/LLVM 22.1.8-2 (cachyos-v3)
>
> Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> Can you send your fix as PATCH?
> I think your approach is better than mine.

I think we should wait for the llvm issue to be resolved first, to
document whether this is considered a bug in the kernel or the
assembler, and to see if any other kernel code may be affected
by the same thing.

Looking around other .S files, I see the same
pattern in stext(), cpu_resume_arm(), mcpm_entry_point(),
all of which start in arm mode but end in thumb.

     Arnd=20

