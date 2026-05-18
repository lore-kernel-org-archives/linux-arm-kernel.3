Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0900CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxisyMCggDYIaossETg7VZiYfG22Sh1ZqKvPM0upvjA=; b=PiKxKUHwteIZh+VcBFeSfBBZwj
	DdkO1zYg3Rrbf3Rs9rrJX4cvbubQRFNd54wXczcMjFjHX7db1qfzYX1lIKTIb5wK3MRiNCqaRSCwQ
	E72KhvhA9cW48lCxzdj0Sreq4/U9T6dNldjE5W9rVhBdB72crQ4OfBjkPP0g628IajnB6XDcYw4Ht
	RPr9udqQk3P6Aaocx8VG2Swk7XWYccMCGNMJKl/yZ2AIxD1495w3nLVbdhgGQ2tqqTJ5OF/NGvjWY
	iUPqOLvgVd2trPuBE9cluW2i7gRr3T4UcBckqhAzBkbUd2wACEfO4J88S+wnVqfsv8iAJoh0lbBZW
	RAVq4jCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsR9-0000000EbIa-1t1g;
	Mon, 18 May 2026 07:30:51 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsR6-0000000EbGh-2rBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779089449; x=1810625449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UaRHwV1chvJbIFiNEZ7+ON4XkcfWZY443RzNN8Aa5wk=;
  b=Jw2qZ4bnfyVotQ54obV/LUs1K4OTCb78Ikm+DaYM27H8Mt+G1aUnONup
   1BPta4hTBk5ioTuKu6KlVSrIJGZ8HyeUig16tnN3vMxnuEQMHDgHkApPM
   GKEuMiKDqH3Xs8WAD6egb4pKh+l5Vp4SiDwedibkNxgES6XUjTMXd70X4
   ovUkwjilK7lR8nSYBbfMyrEPHGls95kLP9GeCTUNkQDE6iLCEF7ny1DDf
   oZyPeyGr8w5u8nWM5fvIazERL3ctw1reHqQYbbrCcLdWF+nQGHbm/Mlvp
   ag+iPdX5ks6+EvDca7wKin6n2pUrLCSzJd+STXhpaniQ/JzOPQHgNaBC6
   Q==;
X-CSE-ConnectionGUID: 1U5G3r5ITC2IqfymS7RC1A==
X-CSE-MsgGUID: 7VqLHFZBTZy1V0XqNtNNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79984143"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79984143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:30:47 -0700
X-CSE-ConnectionGUID: 9J+sJRDISnCHuXZHDNRNVg==
X-CSE-MsgGUID: vMqIh9JcQPuKrJHTNcXvBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="277446492"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:30:38 -0700
Date: Mon, 18 May 2026 10:30:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Anshul Dalal <anshulusr@gmail.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>,
	Job Noorman <job@noorman.info>,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Josua Mayer <josua@solid-run.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	David Heidelberg <david@ixit.cz>,
	Petr Hodina <petr.hodina@protonmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agrAG3cLjEAPV90B@ashevche-desk.local>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_003048_769041_F90A067D 
X-CRM114-Status: GOOD (  13.45  )
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

On Mon, May 18, 2026 at 09:24:35AM +0200, Geert Uytterhoeven wrote:
> Hi Uwe,
> 
> On Fri, 15 May 2026 at 18:48, Uwe Kleine-König (The Capable Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> > My additional motivation for this effort is CHERI[1]. This is a hardware
> 
> Nice!
> 
> > extension that uses 128 bit pointers but unsigned long is still 64 bit.
> > So with CHERI you cannot store pointers in unsigned long variables.
> 
> Good luck fixing all implicit assumptions about this in the kernel!
> Also, good luck convincing people to use uintptr_t instead ;-)
> 
> https://lore.kernel.org/all/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com

Yeah, I believe Linus will have a strong opinion about all this CHERI stuff :-)
But let see, it might be surprising turn around.

-- 
With Best Regards,
Andy Shevchenko



