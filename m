Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D7CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT4kb2NC2GIwoaQlNND2e1KhaSxMkjUX4wrMV3NGkt0=; b=HDVJnMq96BuHHoc9cFzKng+Apl
	Y5QQZLKE/6hjbLV3/asgsdDaX6xlm35tJb0aP2leMuQFMitc3i0wu/If/m+n6ckBTapBJStKVbKvr
	GRHYthVVezdl9LvvYm1+sTq+6jzxWwiNzGDW3ssqeMyMa242/k515oNERPaJXMjgQrBt+HTkAZoGY
	0GOXeHkiJr4VIA+nJxm4CVzG1WDbDg/muImJQQWegOtpf6gGcYQyqdvPyaSuZqKDBoAq1w1j8zzTe
	cqVhHfhhXPwWtUTs/jKtTDomP02+ApY1OL86uOManZhQPyIbXWMLz+Cc4mN++PoSP3rBFbEhreuvL
	QEvfJGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFhZ-000000092e6-3HUd;
	Thu, 01 Oct 2026 12:15:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFhY-000000092dk-3hVq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:15:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DDFD60A52
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 12:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AEF1F00898;
	Thu,  1 Oct 2026 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856952;
	bh=CT4kb2NC2GIwoaQlNND2e1KhaSxMkjUX4wrMV3NGkt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNakY8Aa4wTesYELLOj6I5NEHRUu5JXo64JQKGBSaU+kVwvAJQm1htfFj6FsLUVb6
	 rWxVS9cNdDPm3zkGGZQXrZ1uZnPD+QUj1dZfzAAnss+uMmQRujEBPivdRB++w51/hQ
	 4EDN73hmPf3VWd2FGKILxh3tRSZq8bI9obV1C0hMQjglPM8NCtqwK+nLGMG2prMLVD
	 mC1ym7TEfjQ17d1Zh3SwmRYevJehpDRWenDHEQssJDUc90TZ7Fyo/p7KNr+OE+VUyF
	 BbqqiEz/eObzXughYz2BsDaW5nU8Ws7+llobBQYtKGW+LuDpcizUK6VtBMOx2W4M2Q
	 iGdSPhvrxEeRg==
Date: Thu, 1 Oct 2026 14:15:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS changes for v7.4
Message-ID: <20261001-striped-polar-tuatara-d66794@quoll>
References: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 07:38:44PM +0200, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> please pull these DTS changes for Ux500 for the v7.4 kernel
> cycle.

Please investigate your client so:

> 
> Yours,
> Linus Walleij
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/ux500-dts-for-7.4

this line won't be wrapped.

> 
> for you to fetch changes up to 2eb92e6b94b612eccb53366f65018ae5e8d072d5:
> 
>   ARM: dts: ux500: Add Samsung phone audio graphs (2026-09-23 19:26:12 +0200)
> 
> ----------------------------------------------------------------
> Ux500 DTS changed for the v7.4 kernel:
> 
> - Make panel regulators have unique names, duplicates found
>   when trying to use the DTS with U-Boot.
> 
> - Harmonize the GPIO key names, as U-Boot want to have a
>   device-neutral key name to look for.
> 
> - Add the Imagis ISA haptic feedback to the Gavini and
>   Janice DTS files.
> 
> - Add proper regulator defines found when working on the
>   proper power domains. (Bindings are in the regulator
>   tree.)
> 
> - Switch the audio to using the generic audio-graph-card2
>   binding and drop the old custom binding. (Binding patches
>   are ACKed and will get merged to ASoC and MFD trees.)
> 
> ----------------------------------------------------------------
> Linus Walleij (9):
>       ARM: dts: ux500: Make panel regulators have unique names
>       ARM: dts: ux500: Harmonize GPIO key names
>       ARM: dts: ux500: Add the Imagis ISA to Janice DTS
>       ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
>       ARM: dts: ux500: Add new AB8500/AB8505 regulators
>       ARM: dts: ux500: Fix up regulator assignments
>       ARM: dts: ux500: Add sound DAI provider cells
>       ARM: dts: ux500: Convert HREF audio to audio-graph-card2
>       ARM: dts: ux500: Add Samsung phone audio graphs

None of this was in next:

Days in linux-next:
----------------------------------------
 0 | +++++++++ (9)

Commits with 0 days in linux-next (9 of 9: 100.0%):

What happened?

Best regards,
Krzysztof


