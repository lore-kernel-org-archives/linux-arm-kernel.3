Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CABC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 04:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diuf4Q6Qz1Ac77ejlgBsdm102NX+oVHubnbGNjCevZc=; b=ks1GBw+7qzpcoaPuOCUSBBQgE9
	+NQOFBB4BeeHErkTNmHpXDEDI4bTqI8ftH67mjMhWB/kEWsSgReFwsAqiIN2DrfauJBYHUhz73U9l
	nSYPmi8axtkk4qfU3wHQd000H6pMRu+BJ+4YBEAIRfErHpGz+dp9WNYnWPlLO0o+HtM76dVoDrc0a
	dsqi6fdEqx84gpX5HuILcdTtgfkTx2OsQxx3jrwcithyUtFYVndkTAEpflwczPyf66RvOmWQEKkpo
	xuY7bREu33reh5ku0SpR/Xy4aJeJd/nCKIGRaSrWpMQgm78OR5FoLEwIRNYdlXETjE1PLW/vvEgqX
	V+NRONdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWuu-00000002HjC-1Ora;
	Wed, 05 Feb 2025 04:21:36 +0000
Received: from mail-10626.protonmail.ch ([79.135.106.26])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWtV-00000002Hai-1IRd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 04:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=montleon.com;
	s=protonmail2; t=1738729202; x=1738988402;
	bh=diuf4Q6Qz1Ac77ejlgBsdm102NX+oVHubnbGNjCevZc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GzfIYBeDbxiwtT9P9AhqKrOEQWPqebRn1RC+8DgxW3bNL98oBUItDP2SMI8zPmJOs
	 lttBADT9wC8D/updemPL6obJ2ZwiEDb5UVRFowGoNMJ/Bkg43kTnr/aGj9pM/JX6iH
	 jYR50NQOUrNTPPPIYwhj0DpIjVsxG1DAhnQdqMAW33L1s+YTobyctWGSlR5fKljGcC
	 Q11EfD/woNXYOu0WR/QFg5bcKxUsoPvgxi5Bp38RU00jgAvsrJoHNKIN2hp46yJ3kt
	 HSOHosxW+99aePWoiS9c2GKXvueQwivAkfsvL4SWM54G4xIbPuf0R65Wu2pmHIXY4E
	 BBQ/hCRveLeNg==
Date: Wed, 05 Feb 2025 04:19:58 +0000
To: Domenico Andreoli <domenico.andreoli@linux.com>
From: Jason Montleon <jason@montleon.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "si.yanteng@linux.dev" <si.yanteng@linux.dev>, "pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [REGRESSION,6.14.0-rc1]: rk_gmac-dwmac: no ethernet device shows up (NanoPi M4)
Message-ID: <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>
In-Reply-To: <Z6CfoZtq7CBgc393@localhost>
References: <Z6CfoZtq7CBgc393@localhost>
Feedback-ID: 31263673:user:proton
X-Pm-Message-ID: 91cf9ed08671796c68fcff7b4943b9d063c50cc0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_202010_213106_7CCDDD99 
X-CRM114-Status: GOOD (  15.71  )
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

On Monday, February 3rd, 2025 at 5:51 AM, Domenico Andreoli <domenico.andre=
oli@linux.com> wrote:

>
>
> Hi,
>
> This morning I tried 6.14.0-rc1 on my NanoPi M4, the ethernet does not
> show up.

I am experiencing similar behavior on the Lichee Pi 4A with thead-dwmac. It=
 works fine on 6.12.12 and 6.13.1, but with 6.14-rc1 I don't see these last=
 several lines of output as in your case. I did also see the same new error=
:
+stmmaceth ffe7070000.ethernet: Can't specify Rx FIFO size

It looks like this message was introduced in the following commit and if I =
build with it reverted my ethernet interfaces work again.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/net/ethernet/stmicro?h=3Dv6.14-rc1&id=3D8865d22656b442b8d0fb019e6acb=
2292b99a9c3c

Thanks,
Jason

> This is the diff of the output of `dmesg | grep rk_gmac-dwmac` on 6.13.0
> and 6.14.0-rc1:
>
> --- m4.ok.log 2025-02-03 11:37:03.991757775 +0100
> +++ m4.nok.log 2025-02-03 11:37:17.249455484 +0100
> @@ -15,4 +15,13 @@
> rk_gmac-dwmac fe300000.ethernet: COE Type 2
> rk_gmac-dwmac fe300000.ethernet: TX Checksum insertion supported
> rk_gmac-dwmac fe300000.ethernet: Wake-Up On Lan supported
> -rk_gmac-dwmac fe300000.ethernet: Normal descriptors
> -rk_gmac-dwmac fe300000.ethernet: Ring mode enabled
> -rk_gmac-dwmac fe300000.ethernet: Enable RX Mitigation via HW Watchdog Ti=
mer
> -rk_gmac-dwmac fe300000.ethernet end0: renamed from eth0
> -rk_gmac-dwmac fe300000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> -rk_gmac-dwmac fe300000.ethernet end0: PHY [stmmac-0:01] driver [Generic =
PHY] (irq=3DPOLL)
> -rk_gmac-dwmac fe300000.ethernet end0: No Safety Features support found
> -rk_gmac-dwmac fe300000.ethernet end0: PTP not supported by HW
> -rk_gmac-dwmac fe300000.ethernet end0: configuring for phy/rgmii link mod=
e
> -rk_gmac-dwmac fe300000.ethernet end0: Link is Up - 1Gbps/Full - flow con=
trol rx/tx
> +rk_gmac-dwmac fe300000.ethernet: Can't specify Rx FIFO size
>
> The configration was updated with `make olddefconfig`, as usual. I
> could not find any new option that I might need to enable, if that is
> what went wrong.
>
> Is there anything I can do to help diagnose this?
>
> Thanks,
> Dom


