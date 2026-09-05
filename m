Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E097C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVISZRhqeUbbG63nkEbrVHxYxMTirBscwLs3Wje3fLI=; b=QJ8XlzbHZLdPFHWEAyQHfsZyyg
	VDrvrXdt9myKFBMfT1LGbZEkk4yEG7TDMEpXMCBSLnIyQg+rxCmkXxPeV8Xfpqu7ZlPqvuFoJ+WeH
	wnIhA8qZkbIOI6SihqkMUc57Z/OtUigltgzKqWENj6yGMDvpbYTB3SlsQqq3dlajpneNwlD6+benq
	jPBvJwaJpTy01IqIMyqMT51A7RoyXNZ0nsqW7jFcgCKMgEf+wvrjhm994ytHFr8CmsHIYyise1ktx
	j66a4AuzNEOUol+xSP2GaCY3XHSXVnsGH8xK3SFqQUx4B8zNvX+AsqiunWgDKbHcZu3S99JM81PRI
	sFJ4Ik1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lf5-00000003qx4-3PKU;
	Sat, 05 Sep 2026 08:22:07 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lf3-00000003qvy-1k7h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=pVISZRhqeUbbG63nkEbrVHxYxMTirBscwLs3Wje3fLI=; t=1788596525; x=1789806125; 
	b=Smkx/6o3Q2KZt8w6HwNFWQQv5+FwWHmgcpt0hpr2LEjd4Bl1EiWAEzGmHXVk4Oue8+0JOE3zGej
	JXkpLgiVJ8jmTn9b5lCL5vhuR2wp5jo4stL8+t1508ZdgC08pRekoJEOcSgARhDL3vG/ziRazhgD0
	rGM06VNkb2rmrgUvJY1S387XgPTL9qR79njwgOFYeOC+NJBHh+ghTqGR3GRuqwS3b8H2uyuWhX2GP
	WDnLf5qYyNz+g07csc6v5/HwYTBzy/MWCyjLPyLJFhXBFfoWlcLsbS67AUZ90qjO5OzyRCkeAtWWe
	wKAzvGN+XQC7fK+DGlP4hSKic24uSw/Rwa4g==;
Date: Sat, 5 Sep 2026 10:21:34 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl
 <steve.wahl@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Tony
 Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org
Subject: Re: [PATCH 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Message-ID: <20260905102134.69ef3092@kemnade.info>
In-Reply-To: <20260905070347.25902-8-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
	<20260905070347.25902-8-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_012205_461326_7CE6A2FA 
X-CRM114-Status: GOOD (  14.81  )
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

On Sat,  5 Sep 2026 09:03:45 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
> legacy mux code"); nothing parses it any more.
> 
> Drop the entry.
> 
> Found by cross-checking every documented name against the __setup(),
> early_param() and core_param() registrations in the tree.
> 
> Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d44728a45506..48dd273eaf6c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4765,11 +4765,6 @@ Kernel parameters
>  			waiting for the ACK, so if this is set too high
>  			interrupts *may* be lost!
>  
> -	omap_mux=	[OMAP] Override bootloader pin multiplexing.
> -			Format: <mux_mode0.mode_name=value>...
> -			For example, to override I2C bus2:
> -			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
> -
>  	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
>  
>  			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]


