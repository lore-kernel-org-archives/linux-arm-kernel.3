Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7CFC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCdjlu6veFR+y5k/v3QgTn5QssF/RwgEqtIG9n7nJW8=; b=WD5z9qnM2GYgpeeLcwOKb2gXiu
	9RJ2+aZCSabp9BIAvfuZ35FEGDoG5NBzrRY5OuMQLunKPWdRBrfDWJ3WahHItNCdyfcLjmnK4V8Bp
	K3a69eNF2BpTByiyZ7BSLPT9uhbNy/HFuuPWusBQ9zA4T2a4ZVSwRu65dITRP8/kpvZMWUgmTSvF7
	wVPQU+OrFWrZflUOITTCgvZAdLycZ+9UanYvX3uKLsQtwSYnqg3aRdomNWrGb5+J0UHTX0ekWpOO4
	1yncBD6HW2Tt9HcW1+k8Zq5vGHH/XI4wDa6lZFTBzs/RON7zufyaWXZ6MjVMpzBY7RTttHVkMjl8D
	5Nrw/y1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KzD-0000000BSaP-17J3;
	Tue, 01 Sep 2026 09:40:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KzA-0000000BSZt-3yHV;
	Tue, 01 Sep 2026 09:40:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C3C5601DB;
	Tue,  1 Sep 2026 09:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5832C1F000E9;
	Tue,  1 Sep 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788255655;
	bh=RCdjlu6veFR+y5k/v3QgTn5QssF/RwgEqtIG9n7nJW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c/tZMIfO1dYzA5Ce1FQlKO64f6WMas5U0fsaPiUzmRM37lG4yjdBnF7ecIvh/Twp/
	 i4a9P6uvi3hPYdX8UwIIKs1Os4lFOUNvNrrP7EwllwNBIqJnwH44JqQ0OIEUBDC4hH
	 RYEJRWbTwNauTm7O8TG8OPtLkqd21J40eBiMgwSbw/lIqfsW0hN3+Uq0jqj10xcFVN
	 RJMkAMuds3690w0L0AujrBxvLcb+m1GamHoQ0VLNikZ+p9mpzEzSjHxvrQXJoBN30Z
	 7L5CxuMgRmLjPQXYghUEpG7X1KNCFTdtrOcWb9B2Cc9VGHF7M5st64XtclshWPgLYR
	 DQpEw2dZCAMMA==
Date: Tue, 1 Sep 2026 11:40:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org
Subject: Re: [PATCH] clk: actions: Drop unneeded forward declarations for
 clk_fixed_factor_ops
Message-ID: <76y4cj3o3kdxeli23fd6jireem3rs7w5cnxd2pjl5repgqk6uz@o7bcry4w6ne7>
References: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
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

On Fri, Aug 14, 2026 at 04:43:30PM +0200, Geert Uytterhoeven wrote:
> This is already provided by <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

