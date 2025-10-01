Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE1CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqHPjPKPy9WXc7LWfhaPv5d1kxbuOQhL8xG2bCvclTI=; b=gs2yCYmrC5aNf4YLX/+iJ5zIS6
	55Gt65Wuy94dcqd+SyG7Ytf56kU/i/Xpm53Tq72bP75v608OaF+I/lk6rs1/GdxIhSGui6bbbg1Be
	KWwQob9t5ldp9H+IaXT4S8gz/VUyegw4xJ9e7r+UUkOEqte1BFSVsKOE0iOSYQRCRYcozv+lmPFOD
	MwZFz54RPelO7Hj4G6OfXE5qWnxcqg7aUvyIkmE2DTjB/PPalb6XNqp2WDLSmJcfKg5lsQ1+qO/Rc
	BmksRdqI41GmMxrzY9lk2TeeO5vW5hsmEiSKp/4fm97TGFlfEftQqtTvkYMhH0vL9Up0NBTHU+E6P
	eEyi4tdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3toS-00000007Dxp-1vZL;
	Wed, 01 Oct 2025 10:11:56 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3toP-00000007Dwx-2xbO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 10:11:55 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 7418972C8CC;
	Wed,  1 Oct 2025 13:11:48 +0300 (MSK)
Received: by imap.altlinux.org (Postfix, from userid 705)
	id 6C02E36D070F; Wed,  1 Oct 2025 13:11:48 +0300 (MSK)
Date: Wed, 1 Oct 2025 13:11:48 +0300
From: Michael Shigorin <mike@altlinux.org>
To: Michael Shigorin <mike@altlinux.ru>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>,
	jeffbai@aosc.io, gregkh@linuxfoundation.org, wangyuli@uniontech.com,
	aospan@netup.ru, conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org,
	dushistov@mail.ru, fancer.lancer@gmail.com, geert@linux-m68k.org,
	hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
	ntb@lists.linux.dev, patches@lists.linux.dev,
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: Re: what about CoC? (was: [PATCH] Revert "MAINTAINERS: Remove some
 entries due to various compliance requirements.")
Message-ID: <20251001101148.GA30625@imap.altlinux.org>
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <20241024095339.GA32487@imap.altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024095339.GA32487@imap.altlinux.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_031153_915049_64699797 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, Oct 24, 2024 at 12:53:39PM +0300, I wrote
> It's not about the patch but rather about the attitude;
> Documentation/process/code-of-conduct-interpretation.rst:
> 
> "regardless of ... ethnicity, ... nationality, ... race"
> "Focusing on what is best for the community"
> 
> "Examples of unacceptable behavior ... insulting/derogatory
> comments ... Public or private harassment"
> 
> Get back to single-standard integrity for yor own's sake.

Glad to hear that ESR thinks -- and speaks! -- in a similar vein.

I believe that Linus -- whose daughter has been basically
kidnapped mentally[1][2] by the same hypicrites who speak "love"
but groom real hate -- has his own merits to rise against those.

But it does take leadership and guts in a "modern" world.

[1] http://reddit.com/r/linux/comments/9go8cp/linus_torvalds_daughter_has_signed_the/ [del, heh]
[2] http://unz.com/isteve/and-they-came-for-somebody-who-actually-gets-things-done-linus-torvalds/

-- 
Michael Shigorin
http://t.me/anna_news

