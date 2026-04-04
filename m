Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641BBD7308D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeokfY81zDTGoMKsfsKuYQ0QSL7q5LjfiUcpRy4ytMk=; b=R+0p/9HPYgmf9pEOlKnkn1m30X
	zTUuoXquQsfF+GtuhR03wgXvvpS7R1WU0gM+a19NIe66D3rYrD841NuQgjIo0VbIhvK434M0ETJOO
	ipdcXad28FDX2LJc+5Xp7b63AmYeF/a4/qU6m8uChkf1pDEq+qeroT6hwmTm73bZ22x5xyBpAOyO5
	mK4QPXsUwbS4dvzCX2mHFEHQ3cCvK+fZhIExPKEbcfZabDZOEWZy87AlmrExa4HWtXzNTIxuBmB8l
	9SPsfOXy3QnoiTKqhHmVneAq5d6GHgdiPzql8UU/EWBzLZcxa2pbFzV0GotYf037Xu9qItaBkAUW5
	1BVDO0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9324-00000003ZVz-428J;
	Sat, 04 Apr 2026 15:35:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9323-00000003ZVt-2sCz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0204B60008;
	Sat,  4 Apr 2026 15:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB3AC19421;
	Sat,  4 Apr 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316930;
	bh=TXsjcJSJe7hvyAedd5gCRzSniMOLxr/pVGRppUex7cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPynoeXLborhBzyM9b4ZkPtvliUHIixnUsyQI8aroBObEDpxsdrzkJpKe4DfT1lYT
	 bDrc1INLbB1OEryGII09TDcS1y843N9n02CzyDUoVan4alVPHCiyyageA25r+hh4hs
	 h4LQk1atg/tnGXq6w6hNf8vp3Jz2uatM6jhWJqJEEDWiPwrQ4IODxRWPYLGMp/eOjH
	 RYvtBUKZZNsepFHpaG4APaD1UeZRBWQRCIcKMjK4D0KrNNkmsxSAFwvCw4VzbtrpvE
	 x22jSLSiVagve27GvXZlfrbp1wEza2IYm+zhgIz/3vhAPKXBpS1e/brT7ZRSLunC0t
	 MrLTu7FAKz0rg==
Date: Sat, 4 Apr 2026 17:35:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, conor@kernel.org, 
	nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip ARM64 SoC updates for v7.1
Message-ID: <20260404-huge-dormouse-of-engineering-5ccd0b@quoll>
References: <20260403070658.2554567-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070658.2554567-1-claudiu.beznea@tuxon.dev>
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

On Fri, Apr 03, 2026 at 10:06:58AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-soc-7.1
> 
> for you to fetch changes up to e4ffa98a02f4d16eda9a5faec6792493b41dab35:
> 
>   arm64: Kconfig: provide a top-level switch for Microchip platforms (2026-03-18 10:55:49 +0200)

Thanks, applied

Best regards,
Krzysztof


