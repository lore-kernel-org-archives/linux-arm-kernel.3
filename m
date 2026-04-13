Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DE6F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YH0mHltCpk09vpZSv6nIZp375YekbuGJG93Vt+2dp8Y=; b=DFWU1zrZzQkKWXtEjRwgM6b+a3
	jJJxmClMbSieCE9AbMcUsdcGjr/Ox/QFAp12ltlcFp1olpOahfe2BJwblqHwu2wHOvK/mxi9dxd73
	9e+jPEyEKkquq1Gt8ZLo4F4jdA9soNqDpvFFCXU5HwV4Ws7IBYeq23ZHPA4XD6jK2fzgXMyVGP3yO
	BgOgSHNw+fWtOwjz0GUoamgECp39a1A3Hg7/HHMehLWlUOMktFTAYUMkiA3Tf3vsw/zBQVT9ZCivz
	vu+Un6YBfjwMFy9yWxylhT7j5c9vMNs3u6M0lgxEm72xPpO2MsYOWjmQrWMY186K/CpKJPheusvHt
	0gCYLAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCK1e-0000000G39F-3Mgw;
	Mon, 13 Apr 2026 16:20:38 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCK1c-0000000G38e-0oDp;
	Mon, 13 Apr 2026 16:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=YH0mHltCpk09vpZSv6nIZp375YekbuGJG93Vt+2dp8Y=; b=ALkNiugEU9QiB3sJvasopnP1WS
	kPR56ItS7pU6bT5IH8rswElfE1WdMcdIDusm0jcm9/uDclmAMqs79cE2jmokMOPy2XWOhBC38obV7
	CY9jjmfZ5fa3Mf90rM4Lo9YhfnlZMMnfbwkT2BrOhU/+ApeCaJKd5hqCiVwMmJxvIGco=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wCK1R-0000000038Y-2Ca0;
	Mon, 13 Apr 2026 12:20:26 -0400
Date: Mon, 13 Apr 2026 12:20:24 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
 mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-Id: <20260413122024.0abf7e1da5e1e954edc52bc9@hugovil.com>
In-Reply-To: <abPXX1eWoq7C7J1R@ashevche-desk.local>
References: <20260312180304.3865850-1-hugo@hugovil.com>
	<20260312180304.3865850-5-hugo@hugovil.com>
	<abPXX1eWoq7C7J1R@ashevche-desk.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_092036_327287_205F18F7 
X-CRM114-Status: GOOD (  10.89  )
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

Hi Dmitry,

On Fri, 13 Mar 2026 11:22:39 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Mar 12, 2026 at 02:00:58PM -0400, Hugo Villeneuve wrote:
> > 
> > Add support for GPIO-based charlieplex keypad, allowing to control
> > N^2-N keys using N GPIO lines.
> > 
> > Reuse matrix keypad keymap to simplify, even if there is no concept
> > of rows and columns in this type of keyboard.
> 
> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I was just wondering if this will go into v7.1, as I am not seing the
patch series in your input/next tree/branch for the moment? Let me know
if you need me to rebase it on v7.0.

-- 
Hugo Villeneuve

