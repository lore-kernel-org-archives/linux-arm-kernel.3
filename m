Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0F9C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGtNm/6Rj3M3I05SqA47GaE+4eGeDnYscf5oZXlZBIE=; b=sIQ+5nZQRtEP4ORGJfC0mnSHF1
	Czd4rCWDtbBYba4nAg7B4O2GqdokRuxkz1ZhJzdYH3xQr7pwsV+npM+jeRk92InGSQFAxkcQECOJ9
	+4Nqs+qIqwg+is1AFojK3tC3unglZJZAHuiYzWuFiMeU8SN4uQzCBghohveOg+9z4Tiy1vw8kTIhR
	pYDk7caSipQskpuVT/icTPIipSCWo4PDY+Q+P0KY2P8Bvo6pFdPDpDUt3ZD5Rf5NlgWTL+ezIp3Ll
	SOgP/9TWwT+af0b6nzaB6t915LH70WuPuygW8QY654eqHX4EskolL4FCGoXOWmjSXsoEBra/wiXu+
	3NqDGK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPDk-00000004u7i-26AX;
	Fri, 21 Feb 2025 09:21:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPCD-00000004tg3-2MC0;
	Fri, 21 Feb 2025 09:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DGtNm/6Rj3M3I05SqA47GaE+4eGeDnYscf5oZXlZBIE=; b=ONaMuAsVw2TZehARgoay6h+aKV
	n66zx596ZMTDByLqRXHEVGjS0zoW6ol1tXDDpbn3r+hqXRuKgygDp7CRNx7utn8uSZEcKPMCFHtfG
	1jv/dczkx4thJdat+4VkLsNE9XCP0uROKeJTu8dTb01eCGmVPLVunSbPkUD6kyN4ewu3Fkntyq/3q
	yBDAa8/Y5N6rh5FVEa/D8kzGbMtvCslrH9r66Z8E5JONl8e1Z7282RhJiqzObifsS51fjUyD+VlM2
	QxvBKj/X1Bk30U9d9pirnGBvZDzUo5S8q/gOatjRJak9VhcCg3eP+Jcr/D8WBreVVspP96PXn+QDc
	kTWS5PtQ==;
Received: from i53875a87.versanet.de ([83.135.90.135] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlPBe-000227-Sd; Fri, 21 Feb 2025 10:19:10 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Salvatore Bonaccorso <carnil@debian.org>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Valentin Kleibel <valentin@vrvis.at>, Vinod Koul <vkoul@kernel.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset with old
 DT
Date: Fri, 21 Feb 2025 10:19:09 +0100
Message-ID: <6647031.K2JlShyGXD@diego>
In-Reply-To: <D7XZZ70KM9NT.14VSJDFUTH0H5@cknow.org>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn> <Z7gosm7PJMR0zCg4@eldamar.lan>
 <D7XZZ70KM9NT.14VSJDFUTH0H5@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_011945_627893_FB163418 
X-CRM114-Status: GOOD (  28.13  )
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

Am Freitag, 21. Februar 2025, 09:57:14 MEZ schrieb Diederik de Haas:
> On Fri Feb 21, 2025 at 8:18 AM CET, Salvatore Bonaccorso wrote:
> > On Tue, Feb 18, 2025 at 12:45:34PM +0100, Diederik de Haas wrote:
> >> On Tue Feb 11, 2025 at 2:03 PM CET, Valentin Kleibel wrote:
> >> >>> Chukun Pan (1):
> >> >>>    phy: rockchip: naneng-combphy: compatible reset with old DT
> >> >> 
> >> >> Applied, thanks!
> >> >> 
> >> >> [1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
> >> >>        commit: bff68d44135ce6714107e2f72069a79476c8073d
> >> >
> >> > Thanks for your work!
> >> > We found your patch after NVMes stopped working on a rock 3A with newer 
> >> > kernels and successfully applied it to kernel 6.1.128 (currently in debian).
> >> 
> >> FTR: I've reported it in Debian here: https://bugs.debian.org/1098250
> >> 
> >> I confirmed it (also) broke on kernel 6.12.8-1.
> >
> > FWIW, we have several users in Debian reporting the problem, so if it
> > can be applied to mainline and then flow down to one of the next round
> > of stable series down to 6.1.y that would be highly appreicated.
> >
> > Diederik, if you were able to test the fix, you might contribute a
> > Tested-by (although as I undestsand its not strictly needed at this
> > point as commit should be on way to mainline and stable series)?
> 
> AFAIK a Tested-by could increase the chances of the maintainer accepting
> the patch, but that has already happened (commit date: 2025-02-04).
> The patch was already verified to fix the problem before submission:
> https://lore.kernel.org/all/20250103171109.2726312-1-liujianfeng1994@gmail.com/
> 
> So AFAICT another Tested-by would either have no effect or a delaying
> effect (adding it would change a bunch of commit IDs probably triggering
> various CIs to run again).
> I'm not aware of anything (else) I could do wrt this patch.

the patch already is in the fixes-branch of the phy-tree [0], sho should
make its way into 6.14-rc shortly.

Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes



