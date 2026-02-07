Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB08FEE0AC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8T3rZFpkqB2F2oOHjwuLu3hiLWr0/KRvABGeca17KM=; b=brHocqU6ur9xctwc7Q41EzJdiu
	CylerXpujRvT/ZaAYl5NeygFixkZ47P8jP/SjR3geXnmYtG+cFvdH81iqOvb6Wj1xrKBsZ++WP/T1
	kzqVQrxUxY9XcPmTJIHH6Bs4phfyoAOoyKpSQsRXBXcPImfMQDOUQO5nvB/93rcuah9OIOE/Z/P1M
	iHNaDAj/p+JJkPABqW3QEpcd0KZPe97OHPUBEU26kYYhs8scmcWskIovseLCNP8EYjZHZ0rQCJ5Kk
	yQ+aohY59TnoCXV6xlq8nkr5qlE2vPh1bDG0S4u6di+jyxlxvPAUFmyl87R7YofM+hzrOLgwYwxet
	bkZ2fUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofdh-0000000CLNc-2Jn9;
	Sat, 07 Feb 2026 10:34:09 +0000
Received: from mta1.formilux.org ([51.159.59.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofde-0000000CLMk-2RPp;
	Sat, 07 Feb 2026 10:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1770460441; bh=S8T3rZFpkqB2F2oOHjwuLu3hiLWr0/KRvABGeca17KM=;
	h=From:Message-ID:From;
	b=Y89Lr6mNMTu5WWD3DaAOwcrryNt65Q+P+SkniUBIC9nfpcSaEUxZW92EqKRBtdlq0
	 o+NlveY1pqvvBnblLRFsIT3WXzNvSsqAr6HdDiRxHvuwQvUQNG1GJxWLQrOqmKJZUA
	 kyIHfKRTSDcNRX/g9+/bwsrbVs9k6ysCauyB+Wt0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 0E7FDC0B88;
	Sat, 07 Feb 2026 11:34:01 +0100 (CET)
Date: Sat, 7 Feb 2026 11:33:59 +0100
From: Willy Tarreau <w@1wt.eu>
To: Heiko Stuebner <heiko@sntech.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, finley.xiao@rock-chips.com, jonas@kwiboo.se
Subject: Re: [PATCH v4 6/6] nvmem: rockchip-otp: Add support for RK3528
Message-ID: <aYcVF8DkVyH47i5x@1wt.eu>
References: <20260205211901.490181-1-heiko@sntech.de>
 <20260205211901.490181-7-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205211901.490181-7-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_023407_092964_4834C359 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Heiko,

On Thu, Feb 05, 2026 at 10:19:01PM +0100, Heiko Stuebner wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Add support for the OTP controller in RK3528. The OTPC is similar to the
> OTPC in RK3562 and RK3568, exept for a missing phy clock and reset.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

This time I'm making sure to respond to the right patch :-)

I applied your series on top of latest master and booted it on my
E20C (rk3528-based). It provides me with entries in which I can
read values, like when I applied Jonas' patch on 6.17, so I guess
that it's OK:

  # for i in /sys/devices/platform/soc/*/rockchip-otp0/cells/*; do echo ${i##*/}:;hexdump $i;done
  cpu-code@2,0:
  0000000 2835                                   
  0000002
  cpu-leakage@1a,0:
  0000000 000e                                   
  0000001
  cpu-version@8,3:
  0000000 0001                                   
  0000001
  gpu-leakage@1c,0:
  0000000 0003                                   
  0000001
  id@a,0:
  0000000 4e54 5532 3433 0000 0000 0000 0800 112d
  0000010
  logic-leakage@1b,0:
  0000000 0017                                   
  0000001
  tsadc-trim@44,0:
  0000000 0200                                   
  0000002

So feel free to add this if you want:

Tested-by: Willy Tarreau <w@1wt.eu>

Willy

