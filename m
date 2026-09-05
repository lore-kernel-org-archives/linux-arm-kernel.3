Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4523C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5qV9YRKbU///+gaY6staRDNAJPfLuOO2/9JFJF8rhE=; b=usL5D/rK1QUmQn3MVCNUxZxHYx
	A+eAUe4OI1fQAvGWCZWJD9ZJmLxs/mDsnCjf5/V4aKqMcPvjrwiDbl9iOqu5QOMePUk5tpwQrz8pR
	m6tpNvn47sIsK8Z3EdRNWHRFls51FUgKHlbdZWT0D2DAvO86kuF54UrFef3IK889jqLazNUyWxap4
	75eb2rfMCfKlGOIZcGPSOMZxooFRfEt7RTWOsH5wTUiCdyQjMZrvO4VfD3FVVmurv6YCxY74Nq7DV
	Md4Q5oAUhTultpQW7kZa9JUo6E8E1zH1fPTS2cmvI/XbM1bzcd9ny/5Jnn42LpOQT+CtTQMGv36yt
	Cg+9GkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sPU-00000004DKy-0Lld;
	Sat, 05 Sep 2026 15:34:28 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sPR-00000004DKK-2p4O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:34:27 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 837B340E039E;
	Sat,  5 Sep 2026 15:34:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ULOSdY5268Q1; Sat,  5 Sep 2026 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788622452; bh=C5qV9YRKbU///+gaY6staRDNAJPfLuOO2/9JFJF8rhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGQCkVysyMXAB87/+ol43xmiMSwThSsWet9I4UIylepz0fV2xir/vYc2o4DQnINpi
	 4Vk4QVlAYCNhr22LajTQN71xRDL5fZpQDj8OOGMXA5iKczt27qYfb+OCqX6muSriKP
	 ywQBrjTJPehGG9DwpYm/KRlD3wBUi6UjgVq82SiJZNR/EAPMIiKycHSk/oH33tM4/k
	 116rLuX0d6+qAIHpe+WMrrmSO5QpdDXzCalcGGJPp330gQJ/f9q+8THqwfzZYOs3IW
	 q8rheoYvdHhHSuN6fLU1DU0aSwx4/rIuZQHhEqXWtSntzGBt9a+7RL6EPMjeFFvSJm
	 hjmUatERnV4DmZ1U99TGxewY8+zBAKUg2Zwv419UMnh8DzuZBvhokTa8mLmk7tQKNL
	 BkRP/8r+GpeK+ccBD6XPO2t+SeTsMaobf1Ae5docKjcwC1ygAG2GuE1zIfoPurg/g0
	 UiTn2mIkHpgKEgfl0ilxntuQfA5vEykAt9OXDIhs6eQiXcwRNbd++QEQUcrDv2zVja
	 vJggKDyAgK2aRTSpxNSPEkvGteH/47g5zbjcq10XJRvvKa9rNBnSbJMYTYUb84rrYB
	 3ZsBNc61jaopJ+j/I1afMVPDhfvXiG2dEpu6eZNvikLNVAaRDOMUHgkh7cLxGHa2jb
	 zxv+hR1sv0OpkE/XW5atFbFw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 950F140E03BE;
	Sat,  5 Sep 2026 15:33:39 +0000 (UTC)
Date: Sat, 5 Sep 2026 08:33:36 -0700
From: Borislav Petkov <bp@alien8.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
 <apwzmSr6b0WEkW86@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apwzmSr6b0WEkW86@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083425_885555_0B52E51E 
X-CRM114-Status: UNSURE (   8.07  )
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

On Sat, Sep 05, 2026 at 05:22:33PM +0200, Karl Mehltretter wrote:
> Good catch! I will send a v3.

Just don't send it immediately but wait a couple of days to gather review
feedback first.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

