Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C383CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pt6fdbI51HnlsLiKVQpPu5I3HDVPxOkLiCUOACXNg4=; b=W2os5lOieQrnvdTVmwM+FlCS4P
	OZ0AkJsaDdrEDRI/hEP0NIWHxwDHkucZUreaD+RyjTmEq8ZueWdHy5pNF4tWdI/b1veywqtqo0qhh
	KiDvmx0I7FauVTL1ZmEuSmJjixzmqASQQ4LpRJVH7BNqf9Nhsp/ey2U98HrDjv6u1U+wgbi7vpN4A
	czWXUA95XJDNot0YmUXC+1nPEZ04dwJtMD5C/3yp4hw47/qBK5SNteLsxVW3Z5+qIGSeR7I4sgB0+
	O5MyNTPtOKEyWNW/kFh5AuawBi5EzNtAFPJ+p3BovGzfNQ6h6qTMCUvLn2YKfGwXxPVBhvs2tCOtf
	1sXRs/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yQ-00000008rhY-1VNj;
	Tue, 09 Sep 2025 17:17:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxnq-00000007BnP-3DXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6pt6fdbI51HnlsLiKVQpPu5I3HDVPxOkLiCUOACXNg4=; b=s9954l1uhglycDr4Wx0bZzwOyN
	86g/vyWbzQ/33j/pZ6FDJ3oAlbiLLPt8rVzNBWHyObqeudvGOE8ui9BfDC/mFSAT4oI6Rfgr4sa2u
	DCIUzmgDwixU6jVGC/lyMmmzQ3KnjORJ17WtFYFUeAtF7b+wru5DFLz4gilvnAVguMtkS90YAfcG5
	pTo4PSbKviF6JHJKNvaaZqdmr6ZWCoqMAB9oD7klg1nf1goqgaizlzwtiYJTGeM7J4uhfJoNbLIHF
	D946yRmCUhqK1aZXOz+kPoEgvSRd9CV0uJ211wJ5JJe/TxsgJF7CjI8z7Y7CcR/jracjqAikkslKK
	TBZ7s/jw==;
Received: from i53875b3d.versanet.de ([83.135.91.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvxnW-0001F3-Ee; Tue, 09 Sep 2025 14:50:10 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebin Francis <sebin.francis@ti.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@oss.nxp.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] pmdomain: core: Restore behaviour for disabling unused PM
 domains
Date: Tue, 09 Sep 2025 14:50:09 +0200
Message-ID: <6841173.4vTCxPXJkl@diego>
In-Reply-To: <20250909111130.132976-2-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <20250909111130.132976-2-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_055031_253104_F385A386 
X-CRM114-Status: GOOD (  12.60  )
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

Am Dienstag, 9. September 2025, 13:11:20 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Ulf Hansson:
> Recent changes to genpd prevents those PM domains being powered-on during
> initialization from being powered-off during the boot sequence. Based upon
> whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relies
> on the sync_state mechanism or the genpd_power_off_unused() (which is a
> late_initcall_sync), to understand when it's okay to allow these PM domai=
ns
> to be powered-off.
>=20
> This new behaviour in genpd has lead to problems on different platforms.
> Let's therefore restore the behavior of genpd_power_off_unused().
> Moreover, let's introduce GENPD_FLAG_NO_STAY_ON, to allow genpd OF
> providers to opt-out from the new behaviour.
>=20
> Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@lin=
aro.org/
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-=
c4a0c9daeb00@collabora.com/
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until la=
te_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

NPU on rk3588 now again correctly gets its supplying regulator and
running said npu does not end up in a kernel panic :-)

Tested-by: Heiko Stuebner <heiko@sntech.de>




