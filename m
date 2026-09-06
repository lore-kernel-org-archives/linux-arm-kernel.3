Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109C0C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HkFo0ybA+orVFH/u7Fk4Ze5CEEmhF31UK62O8mlgwM=; b=D83J7YsQ342AbpQlcXbS8xi1KY
	UCtvgfPbliW4qtGm+2FTS7y8bxzY5e/ekTUCtNlxUMAo+ii9/Xo60vhavsjb3C8gFgWxVlAJCZ5ty
	ahFl6NDiF/ifALPhJqTdAtpa2ilymprWkIM2GIQYoqpaHQq1yfRTkZtXFOrbC2Siz5lvoNT1YeHUf
	Ic7z/xjS+HkcwkKCEt/oPhaH5u7YkPMU34yH+ERlxpqLYlLbu6aLw2HejWNiWJ988zj9w2FcMo8Bz
	NrvzimI7un17JD2QiX8XVFtV1YxXey3Dv8TivhB/qE3XLRyl0AtccgtVnnhmxUQQIqybkmvZDW8ap
	8Q+7010w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x341p-00000004esn-1c6b;
	Sun, 06 Sep 2026 03:58:49 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x341k-00000004es3-2eE6;
	Sun, 06 Sep 2026 03:58:45 +0000
Message-ID: <f241beab-4c83-4f18-bb02-9d6e3fd5ecc3@infradead.org>
Date: Sat, 5 Sep 2026 20:58:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] docs: kernel-parameters: Remove ten entries for
 parameters that no longer exist
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Mike Travis <mike.travis@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Michael Schmitz <schmitzmic@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 9/5/26 2:46 AM, Karl Mehltretter wrote:
> kernel-parameters.txt still documents ten boot parameters whose parsing
> code was removed with the drivers or platforms that used them, one of
> them (atarimouse=) since before the git history. One patch per
> parameter, each with a Fixes: tag for the commit that removed the
> parser, so the maintainers of that area are on their own patch only;
> the two pata_legacy module parameters share the last one. Each entry
> was checked with git grep for its __setup(), early_param() and
> module_param() handler and with git log -S for the removing commit.
> 
> Changes in v2:
> - patch 9: drop the Fixes: tag for 0dcd0a76370a, which removed the
>   separate pata_qdi driver and not the pata_legacy parameter; both
>   parameters went away in 3c4d783f6922 alone
> - collect the Reviewed-by and Acked-by tags from v1
> 
> v1: https://lore.kernel.org/all/20260905070347.25902-1-kmehltretter@gmail.com/
> 
> Karl Mehltretter (9):
>   docs: kernel-parameters: Drop the atarimouse= entry
>   docs: kernel-parameters: Drop the bau= entry
>   docs: kernel-parameters: Drop the edac_report= entry
>   docs: kernel-parameters: Drop the enable_timer_pin_1 entry
>   docs: kernel-parameters: Drop the mini2440= entry
>   docs: kernel-parameters: Drop the nomfgpt entry
>   docs: kernel-parameters: Drop the omap_mux= entry
>   docs: kernel-parameters: Drop the pcmv= entry
>   docs: kernel-parameters: Drop the pata_legacy.qdi and
>     pata_legacy.winbond entries
> 
>  .../admin-guide/kernel-parameters.txt         | 67 -------------------
>  1 file changed, 67 deletions(-)

For patches 1/9, 2/9, 4/9, 5/9, 6/9, 7/9, and 8/9:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

