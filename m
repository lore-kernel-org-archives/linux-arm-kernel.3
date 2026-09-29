Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD5CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHjy9vO2aI54cq6YGq1VyrqssYfLjBHwVVMGd7Q6AHw=; b=xccgAuRBJia/lpmy3NqMxa/Dsc
	RVJQ4YV+CqIPSPB+pE+xNdpUjKXY3rSdyB9F3bzFf6TUYXVTrqZLW+GdHPSY++i+7Wm5n0/KZYixY
	BD7xKSJlyoLRr9o8GG63TbEsOKI7k1JRUsmmf8b4SxsWSBBApvwGqzxQC5boC3rjZu4Vw5tFfhIou
	ziEI0r2914exmUfKboxaQTxqHJOUYIFx2hFh1N0rcN9BTX29Xbhw6XLmhZ857ZwqmBhZNx6ZWj/6v
	0+cmiBGX5cpX1MaJEHBbhsFPDbCgDxMoUqnMsIURf6MFD6dhE7Z1gQUWS49BeI3FiZQ85GMhFVuuC
	x0pcYxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTXx-00000002rjg-2DRz;
	Tue, 29 Sep 2026 08:50:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTXv-00000002rjE-3wgp;
	Tue, 29 Sep 2026 08:50:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C5BE43CC0;
	Tue, 29 Sep 2026 08:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1352B1F00893;
	Tue, 29 Sep 2026 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671843;
	bh=iHjy9vO2aI54cq6YGq1VyrqssYfLjBHwVVMGd7Q6AHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ELMFc7Sr9rib/LSZVw9fEKfH5McI95NJK0hG/468hHgvfQOkVAIs9pFvTgrLWtnRG
	 nrRb+tm42KIDjLgP1x+A9EtB+GUy6dSJndgs6tQO+jrT2v0auzkR6Xbi7fXddw7Fwq
	 UxLoyygdRCSeQShV8ufrfoNzSsxS/zu6hLXptxINaMrCqt59CvMBGenKwihDKBRUki
	 x2NM/PcPNO8dOpqSFHs0mC710nSJvMD6kiyKTdIXHmrgz8VnwCpXAQPdpO6qQmI9ZJ
	 0cTpQcl/FMUMsIXLq/EBB0UudhqCwFjstRvS2ZDIx5qqYg1I/IhTb1CIkny7OO9Iqu
	 lxFV1hF2j3Z4g==
Date: Tue, 29 Sep 2026 10:50:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: add ALIENTEK
 QuarkPi-CA2
Message-ID: <20260929-ambitious-festive-orca-b59ffe@quoll>
References: <179051707448.31632.10412780322071844492@163.com>
 <179051708845.31632.10915026963421643453@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179051708845.31632.10915026963421643453@163.com>
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

On Sun, Sep 27, 2026 at 09:51:28PM +0800, BG9OXA wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.
> 
> Signed-off-by: BG9OXA <bg9oxa@163.com>

Please read submitting patches.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.

Best regards,
Krzysztof


