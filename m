Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DDFC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRnIfNbxhhx5Tqb5oQsAhaefaRDojIjIkjiXQZ+CMZU=; b=RhVEF+hRzWXS8CimbLHMyvRPCc
	P9w3CexOPnaBJBOCpkCn7UcqpZ4G3mQDeZtZvuGFpvmbGA3Pyb/+P9Oq7PwDSkX9sBz7wgPIlTLdl
	nZEwmmEpvzW3qRLQ49BsIw9xblfYPZ/Wuj7NkDVX+rinsWfzCUSdZiqGP2jVhhRPuTmkozjqAR/4w
	1q5TSNlxFe14+88uHsQKIMWFUZJeHVPQB1jTOGVRVCxOdJUAf75BCT0cprB0Ft3Fv/Wapi0lbuMKz
	GRElESB/dUHEhtXgvOGUx1sM7sKMhJRqJNtz34SS9LIcFtfEJ9w04c7NbHzpyjL8Dw7NSEcUF6+u1
	hNVirV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnji5-00000008VZm-0AgZ;
	Thu, 27 Feb 2025 19:38:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tng7v-00000007xKB-0njE;
	Thu, 27 Feb 2025 15:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D75A5C1980;
	Thu, 27 Feb 2025 15:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C62C4CEDD;
	Thu, 27 Feb 2025 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740671320;
	bh=CLYYqdvqAO/1n/BWxTVd5NjOz2LQ7O10iJ3SeN8ieto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ig5dzZ8TAwZWWEUogbZOP0QgD1qHUzsLdbmSun7YoUzDjsEP0GthlUE9htneHutDB
	 VaGxjs5Zrax/HT0PddHlA1xYxsrIoWEPVMGSvtKu8iX8aetP+G/BehmXtmd3VEr4jk
	 emRqbvQnnJCENiFdXXZsm+8WqTtKpKvlCx8o47TyAoMyuHPGBQYtSqE1aKJZq9RpZ/
	 WcONZgDt4qBH8kT6NwAjrNzLFHRzpsp4BVFzb/zg/yQf5adlkKhmXNshvNnNtYLZSO
	 wdn7F9NnUAv9M0iagr6jCpFuQkB1xfD2XJ2VPQrTppcC3fOjc3M70M9VrFwyTk58oY
	 wxL5i48eqfGSA==
Date: Thu, 27 Feb 2025 15:48:33 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH 4/9] mfd: mt6397: Add support for MT6392 pmic
Message-ID: <20250227154833.GF824852@google.com>
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-5-val@packett.cool>
 <173920541986.1887800.1972669785800121190.b4-ty@kernel.org>
 <CAL_Jsq+PPYeFxr=utwZLemUVCzk5iabtMckOJmNy1-LO39cqeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+PPYeFxr=utwZLemUVCzk5iabtMckOJmNy1-LO39cqeQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_074843_271402_3F906023 
X-CRM114-Status: GOOD (  11.58  )
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

On Tue, 25 Feb 2025, Rob Herring wrote:

> On Mon, Feb 10, 2025 at 10:37 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Thu, 26 Dec 2024 01:58:04 -0300, Val Packett wrote:
> > > Update the MT6397 MFD driver to support the MT6392 PMIC.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [4/9] mfd: mt6397: Add support for MT6392 pmic
> >       commit: 896b1eb4ca771b37ea50feb4d90a78dd4e9cb388
> 
> This should be dropped. Missing the sender's S-o-b and the rest of the
> series has issues still.

Are you sure you're commenting on the correct patch?

> Signed-off-by: Fabien Parent <parent.f@gmail.com>

-- 
Lee Jones [李琼斯]

