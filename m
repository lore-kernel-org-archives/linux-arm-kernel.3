Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCDC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiH+giKVjjHb4nMitfkxCsx1jEHHhU2+p+caJgN/xL0=; b=0otAaRZ+S7fpUmclri9z7sTL/j
	nfUIKHLiwfj6XiftCTg+DPcJf9WpMhcQNKkz0nQDtl6oyhAAwrDNlpTCyhR/ZS/rvZxYjasjw+S3s
	A+6hDvXtFrlsKB5SQ1+ui5ZuPGL43AXRFX6riRalhhGNeLVZ+NPCQ2b8Ldi+Ku56Kq1N0Lq26dGVZ
	BtaiIIwro2W+wIwBh5HBkUPORdNBGH9K/6wj6Yi0z/LBXY1GevqGs5Q9IHJPp37g9litxmljioepV
	MSbEeu7a1Stes7uk+CHu/Vj8QK6y8I5R2/RP++7tA6zAtANUOrbqewdrAuXTOMOHzZHRDPDamNhpQ
	q9W3ppzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupTI-00000008Rh0-34Yw;
	Wed, 19 Mar 2025 09:12:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupRc-00000008RSS-1YbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C11F615A5;
	Wed, 19 Mar 2025 09:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A2FC4CEE9;
	Wed, 19 Mar 2025 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742375435;
	bh=5A4dbLDyV/nTRWUH8Ca3qmdXR5GKU+r9taWr3MHSIYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+++vtEmBuPYGgUbdW1qWKiJKlcvRuuuD/MQozqvIyAvUKwV5jumG/klNi86i/nwH
	 GJQ8JYEG0P+fIVPC98fYuGmx3tcujYxE6a2FZZLOvP8zvh616R6MSF0ys2Dr2LGgB8
	 qQDOnu8VX4DtkRfvWNqk1lXCrqIlwI1fxVeh5YGYn93L8lpVEFoGPghSgESrwC26bF
	 K2LjNkO7WhTSgjB20TF1/bkAhsyCz6mAqSnKwbqHte0tVca/lDG8AJ2tDxWvNfGEFl
	 7QXIcGKAUWMeJtkQRWO++bqrwcCfe6HrgLCXo4ipxFsic2cCfWXHjOnySOF+isDfNz
	 UqspsmHjd/U2w==
Date: Wed, 19 Mar 2025 10:10:26 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, andersson@kernel.org, mturquette@baylibre.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, lumag@kernel.org, heiko@sntech.de, 
	biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, nfraprado@collabora.com, 
	elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, javier.carrasco@wolfvision.net, 
	ebiggers@google.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_varada@quicinc.com, 
	quic_srichara@quicinc.com
Subject: Re: [PATCH v12 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <qf36kofpouii3m5bdihy5fizmsnnd7pzxltuhorynql57ivvey@uxplo7joejsd>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
 <20250313110359.242491-5-quic_mmanikan@quicinc.com>
 <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
 <ef86ccad056bc03af7f01d5696787766.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef86ccad056bc03af7f01d5696787766.sboyd@kernel.org>
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

On Tue, Mar 18, 2025 at 03:50:31PM -0700, Stephen Boyd wrote:
> Quoting Marek Behún (2025-03-17 07:08:16)
> > On Thu, Mar 13, 2025 at 04:33:57PM +0530, Manikanta Mylavarapu wrote:
> > 
> > > +static struct clk_rcg2 nss_cc_clc_clk_src = {
> > > +     .cmd_rcgr = 0x28604,
> > > +     .mnd_width = 0,
> > > +     .hid_width = 5,
> > > +     .parent_map = nss_cc_parent_map_6,
> > > +     .freq_tbl = ftbl_nss_cc_clc_clk_src,
> > > +     .clkr.hw.init = &(const struct clk_init_data) {
> > > +             .name = "nss_cc_clc_clk_src",
> > > +             .parent_data = nss_cc_parent_data_6,
> > > +             .num_parents = ARRAY_SIZE(nss_cc_parent_data_6),
> > > +             .ops = &clk_rcg2_ops,
> > > +     },
> > > +};
> > 
> > This structure definition gets repeated many times in this driver,
> > with only slight changes. (This also happens in other qualcomm clock
> > drivers.)
> > 
> > Would it be possible to refactor it into a macro, to avoid the
> > insane code repetition?
> > 
> 
> We have this discussion every couple years or so. The short answer is
> no. The long answer is that it makes it harder to read because we don't
> know what argument to the macro corresponds to the struct members.
> 
> It could probably use the CLK_HW_INIT_PARENTS_DATA macro though.
> 
> static struct clk_rcg2 nss_cc_clc_clk_src = {
>      .cmd_rcgr = 0x28604,
>      .mnd_width = 0,
>      .hid_width = 5,
>      .parent_map = nss_cc_parent_map_6,
>      .freq_tbl = ftbl_nss_cc_clc_clk_src,
>      .clkr.hw.init = CLK_HW_INIT_PARENTS_DATA("nss_cc_clc_clk_src",
>                                               nss_cc_parent_data_6,
> 					      &clk_rcg2_ops, 0),
>      },
> };
> 
> but then we lose the const. Oh well.
> 
> The whole qcom clk driver probably needs an overhaul to just have
> descriptors that populate a bunch of clks that are allocated at probe
> time so that the memory footprint is smaller if you have multiple clk
> drivers loaded and so that we can probe the driver again without
> unloading the whole kernel module.

Okay then, in that case just ignore me :)

