Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A2DCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5TeRiFomRPiH2Rt1ToI5y/5WUyvgAV1QFHmdchXCwk=; b=0OimQJmyipRN+AFnx9+nVj4XyU
	Wcqk3EEDTBoSzzJF54hFUAKWuHyBQCiTCF2zNivAJKqaDW3AQ7Oz+JA/KAhK56W4FJ/BAY/3UHTWV
	WoesNwakiFJOTZI2wbh4GDFPO8ZVfv8nTGvzXh87v+zufVG1wysJFvDlVqKaaYlqauR+Ltq3fjGNy
	+a+X4sNbqlMotNQzriyQBebuU9i5szDdbSi0Phns2oByRmIX+bHDXn0izUau6FpTNe7gqEfgI9aOe
	vUp30IdwjFEHyrjnZ94ly20gS3kLvM/1L1AvNOb6H3tcEW2I1QbKb/a+iwFfD6H5Elkj4bkduQkbc
	CCgPkceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJmu-0000000Efya-13Sg;
	Sun, 04 Oct 2026 10:49:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJmt-0000000EfyP-3Srg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 10:49:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76BA060120
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 10:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3511F000FF;
	Sun,  4 Oct 2026 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791110986;
	bh=B5TeRiFomRPiH2Rt1ToI5y/5WUyvgAV1QFHmdchXCwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TiBiJu80QCaea3papgq64aZiw/5RamxmDxL/0LiFvpOG9T/37TwQ6A+5rAT49TsFO
	 D5/PkHj5RMgOrdD30PlCysTi2PH8XRnT6jkmO7CCsUxkpFMhdefR7ESNz7SdJjTRIA
	 zUSp7IkGuA2GvrceD0CvqpTZEgSpwpm/aaTbNNDhca9V6A4ZatZzNtYDwQahR7PXin
	 agx8ua6tt1lkMohqQDVb92frE5aMMWpog6wiYkv8Ywa98SlDync3xV86ECvBq4A0Y9
	 3k1L9x98qsuRsbDeoZwUcOGWavaKFxfk+F+INPYGumLkw0zeL593sMPDqv7DvXzXch
	 ciorDeOh9qPOg==
Date: Sun, 4 Oct 2026 12:49:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS changes for v7.4
Message-ID: <20261004-robust-quaint-cheetah-7a06e9@quoll>
References: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 07:38:44PM +0200, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> please pull these DTS changes for Ux500 for the v7.4 kernel
> cycle.
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/ux500-dts-for-7.4
> 
> for you to fetch changes up to 2eb92e6b94b612eccb53366f65018ae5e8d072d5:

Thanks, applied

Best regards,
Krzysztof


