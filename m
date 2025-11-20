Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF870CFA442
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bB+bBUqluZS/Ek1S81UmMZQWY2PSjKpazcJhdOlQM0o=; b=EmJ57TByD6zbUTpAteD3uqiNJo
	Z4KNXUSHNB+l8zJ6Ux2AVXDiwND5TYUYUZ10lXCJTVXRJk6MZFJZzpox/6NpNLN7kaDThrN441yM9
	NSvc4URsB3Q02yRCWUHxI+wdKaJpqhlUfgEqHbS2C9xFT/xkVFg3RtcZVG7LO9m64uIDCiPgktL0G
	ghmhJO9N+yHTmEbzuOnYwkYukjozGM5c9RmdYYH3kpvtZz3Lyt0jrc1HKSbBSICKi6jv1HQ7v10uc
	1eraOeYbZXUvChb0q5kEKlvow0w2m51TKtpEK6RZON3MlR13RescrkI+vOPRqTNJNf9b1Ugm1npr3
	QXMTyyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBFw-00000007LSF-3Ju4;
	Thu, 20 Nov 2025 20:27:52 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBFt-00000007LRn-3LKb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 20:27:51 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dC8zk0spjz9smW;
	Thu, 20 Nov 2025 21:27:46 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Thu, 20 Nov 2025 21:27:39 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Henrik Grimler <henrik@grimler.se>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add Samsung Manta (Google Nexus 10)
Message-ID: <yrc7itk6yidsomznmvzcswvs7jhq3747vv677bjogoqji2bwrw@gfz7xelxkvrf>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-3-linux@timmermann.space>
 <20251120173120.GA10065@localhost>
 <a78e1277-4148-435a-9a69-042507fab308@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78e1277-4148-435a-9a69-042507fab308@kernel.org>
X-Rspamd-Queue-Id: 4dC8zk0spjz9smW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_122749_978308_1B35B3B1 
X-CRM114-Status: GOOD (  22.50  )
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

On Thu, Nov 20, 2025 at 06:36:29PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2025 18:31, Henrik Grimler wrote:
> > Hi Lukas,
> > 
> > On Thu, Nov 20, 2025 at 03:40:15PM +0100, Lukas Timmermann wrote:
> >> From: Alexandre Marquet <tb@a-marquet.fr>
> >>
> >> Manta is the code name for Google Nexus 10, and was manufactured by
> >> Samsung. This patch adds initial device-tree file for this board.
> >>
> >> Co-developed-by: Alexandre Marquet <tb@a-marquet.fr>
> >> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> >> Co-developed-by: Lukas Timmermann <linux@timmermann.space>
> >> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > 
> > Awesome! I think this series would benefit from a cover letter
> > explaining what features are working, and perhaps saying something
> > about other patches that will be sent separately (if any). The as3668
> > led driver and bindings for example has not been merged, right? Adding
> > the lore link in a cover letter would therefore help reviewers.
> 
> If "not merged" in the meaning of not taken by maintainer for next, then
> this is quite important because it not only blocks this patch but would
> cause failures in CI leading me to being grumpy.
> 
> Samsung SoC follows maintainer-soc-clean-dts profile. Please always
> explicitly document such stuff (bindings in fly).
> 
> Best regards,
> Krzysztof
> 
I just noticed, that my cover letter did not get send to the mailing.
That was unintentional. In there, I wrote that this patch depends on an
earlier patch which still needs some work. Should I also add that to the
individual patch in future mails?

I'm still quite new to the mailing list workflow. I'm sorry for any
misunderstandings.

Best regards,
Lukas Timmermann

