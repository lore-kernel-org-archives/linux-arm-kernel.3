Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B459C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57c8Q441YCTfAzPWDpB534N08KkDAY1tKDYFjbar4Sk=; b=nph+nI11a4PH2ib2B7jN38u4FN
	4hxEe0lTyz1tFXEhw1dhKXt6oKPoAf2XUZsiWEI0YY5u1uaXvuBjaYo9SMZGmWIbdVjbQTL0P12Af
	4aj/Crm6d5BVbaiXcply3vfGP5Bybo5gtGrDKzqtquqJZnRAhvzw/4giMGqVHFOf+r1i8NrYrfw/S
	QO0Z/G7X67CG1/hPWB875FGWXTx/PqD0rKrhMPu5TGxBhTJIlfDhTMqZPOB4d5MlGZqZR0Rztpm1C
	FPt24U19hbnL/jT7QqJ/RakvnAZQMYJCrF8qi31CF4/+UI7hiWr9iqB1uN4lKHj32I0yM9sI4p8ob
	jbWQjL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lKm-00000003pF1-1bfT;
	Sat, 05 Sep 2026 08:01:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lKk-00000003pE9-3nWt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:01:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7BF600E2;
	Sat,  5 Sep 2026 08:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCB91F00A3D;
	Sat,  5 Sep 2026 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788595266;
	bh=57c8Q441YCTfAzPWDpB534N08KkDAY1tKDYFjbar4Sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Tzd//Lv1GCVMF2Nk2OOIDP1wRyuNyZfaFTWI4T6yaczfAbrvD0reuhb9zmpb7goit
	 6vIQ30ma5hTbKi/gLlsU+4kONtUSwX3g7CuCUSasbdoOOankk+UMiqTrK/kc+TYrbi
	 ddthFwYT56YXbZv8ubzvemzBkWc8LSupkqT+vFrueABmEzQjZqSNY+3JfEBqX4nfeL
	 jjD2MROQP/ujoSRsa++wU6RwIHO8N7qKT3iEWR+ceEl5T5daV22LdAbX74WIOSAwVI
	 toUy0wNpPFAi1rT5fkmaDhVkw2AdhxjLJ4jUdS01NfUzDO4ust/xfs99g/Rz2mnhPm
	 f469vj6TKclnA==
Message-ID: <bfd2fd19-0671-44f0-a2b8-a159be6a1c7d@kernel.org>
Date: Sat, 5 Sep 2026 17:01:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and
 pata_legacy.winbond entries
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org
References: <20260905070347.25902-1-kmehltretter@gmail.com>
 <20260905070347.25902-10-kmehltretter@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260905070347.25902-10-kmehltretter@gmail.com>
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

On 9/5/26 16:03, Karl Mehltretter wrote:
> pata_legacy no longer has qdi or winbond module parameters. The QDI
> support went away with commit 0dcd0a76370a ("libata: remove no longer
> needed pata_qdi driver") and the Winbond VLB support with commit
> 3c4d783f6922 ("ata: pata_legacy: remove VLB support"). The entries also
> refer to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE,
> which do not exist either.
> 
> Drop both entries.
> 
> Fixes: 0dcd0a76370a ("libata: remove no longer needed pata_qdi driver")
> Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

