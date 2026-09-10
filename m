Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4372AC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc61jQ2p6vMPm9Sn/vjm/9Psk2xpnTlGysS95tscm7Q=; b=emxyA1mrnlnjn3V8myUEgxouX9
	BcvNgpJ+SYuBhvucVuXCz9/NtsDEWOXC+H+Mqc1pmq61PdwpUfLPlKWrBVYJFHVnOnqP/i4JvPTGw
	iRqa5C0f2f0bXXwuNe5TOtUMIZynsR99TlpNnPkjRbr8w+AdrXhUCTtzfquqPgKBxIApIMndb5CtV
	4jB5HDsHHZDxa4mgXc4kfzt2nDwqAgP8FeaKSSyqEB6RUMeX1nU4iGUL/H3bZgL7QPw+zvdxeQnqx
	k3Unk+x4HHVbQ5B0HCAykZHbToc5sIJVLYSAxOGy61zws336xbXJugNBrXXHShqMLEkJIyOSlPFt5
	fPz0itmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ieU-0000000F4oh-1gMj;
	Thu, 10 Sep 2026 17:33:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ieS-0000000F4oN-1u7y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 17:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC30B415F4;
	Thu, 10 Sep 2026 17:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A5A1F000FF;
	Thu, 10 Sep 2026 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061611;
	bh=mc61jQ2p6vMPm9Sn/vjm/9Psk2xpnTlGysS95tscm7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zr9RrxkgLuPZ7amTj6iAzMB56dHM0XLgFYwJmbnZPBjEbC0mWN3C+hPkJMCekYy0w
	 Fhe66bjAyi9wUJ1ryaP8OrJykX1XrnmuZFzPZB6YS7pWZRDw5jvSvnO72YjmRGYROH
	 z4Tm19zswYDqKxRW7mPSyzYnvVDtHi31P0rtyk7bOg4j79nYpu/6i5lJr+v7qPzOvj
	 A3NE9iZpFHlo2ONmbI1iz6sgHB5b94cRQ2nbAOjOMeecQzhwvn77Raj2xaf8vTh8H1
	 8rHrjkWj1dDEVB8CybNDdtDUta6Z0wvbXgS7xrbJ02/j1svRIcFXRpNL7Rm+ypvtuO
	 XHn2kXvUOeFNg==
Date: Thu, 10 Sep 2026 19:33:22 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi
 and pata_legacy.winbond entries
Message-ID: <aqLp4p-CCi9sVDlb@ryzen>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-10-kmehltretter@gmail.com>
 <apwKitEmOv3ZwLkd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apwKitEmOv3ZwLkd@gmail.com>
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

On Sat, Sep 05, 2026 at 02:29:46PM +0200, Karl Mehltretter wrote:
> On Sat, Sep 05, 2026 at 11:46:49AM +0100, Karl Mehltretter wrote:
> > pata_legacy no longer has the qdi and winbond module parameters:
> > commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
> > both together with the VLB controller support. The entries also refer
> > to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
> > not exist either.
> > 
> > Drop both entries.
> > 
> > Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > Acked-by: Damien Le Moal <dlemoal@kernel.org>
> 
> This one is actually a duplicate, I just found out. Ethan posted a more
> complete patch in June that removes all six pata_legacy entries which
> commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") left
> behind, this patch covers only two of them:
> 
>   https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/
> 
> It has a Reviewed-by tag from Randy, but does not seem to
> have been picked up yet. 
> 
> So I suggest: drop 9/9 and take Ethan's patch instead.
> The other patches of this series are not affected.

I have picked up the patch that you linked to above:

ata: pata_legacy: remove documentation for removed module parameters
https://git.kernel.org/libata/linux/c/a19d4f9b

Thank you for the ping!


Kind regards,
Niklas

