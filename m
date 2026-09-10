Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD48C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPcCiBBITeASDRG4XzbQSWp2WzppaOy28h2ruAqwXi8=; b=B5n5ga/iQ3612XScINsS1y1XiI
	rwoN8+ws7xP5v9YKe4pAitvrpSCsPTGM9c0YOy5bBAKsMt03/eRqK1PLhA0GdNmssazMAZMUNJqKS
	FB3U9AMaj/8AZE7irmE7ThzVUEt7uAizfkBWXs+PplyShmoMalHGJOmLAe2hcK+xu8a2zD1aONVV8
	gxQr+H34FC1w/zGrz+CpWLkL3n+AqGJ8EFoRwr7ba5CMsoxKbvPxV1ksufJhkh95Ubuw3DxFHtt/o
	wBlZ9Sg6repnR4sgmP62367uhbrYsGW/FYriJNyY1EJeRDkvqAK1rgOIP0lLbtBbuMa52kpaRKhgL
	3kjGZ2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gtm-0000000Epfa-3fPD;
	Thu, 10 Sep 2026 15:41:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gtl-0000000Epex-2LSd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:41:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6E0160200;
	Thu, 10 Sep 2026 15:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675981F000FF;
	Thu, 10 Sep 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054872;
	bh=wPcCiBBITeASDRG4XzbQSWp2WzppaOy28h2ruAqwXi8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZPT1gMlQYCE5N332MSVM0S9U6d4FLGUsbQCPoHUb5X9ttBkjazudHOj9UQKHqJd9D
	 oCxLRURVb5tbXz224n1kpk9IHDZKYSVtYQLgyTtMMjylmSzWSojqj/lBSwJf/HCe10
	 8eK+ueByj4l9PPmFbUW99Ru6kp/Esl/vw0Jow4TK/QeBk7pNtQko/5Rzw55iFnQRCy
	 JpF435LHDVBZH2psN6u4pDeISC01VD3AFrU0Nt8kyUXTDMID7VVYLIU0mj9/Qyipnb
	 S4Y4lP/lzFr9Zd89xKt5hBEQanbRxpuXnz3U+wIwdzHcUBWviuJXTGM3h4In4P2Nn0
	 jqW8F+/u1JH4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B95380CEF9;
	Thu, 10 Sep 2026 15:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 00/10] net: fix typos and repeated words in
 comments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178905480977.1504082.16408401600046600222.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 15:40:09 +0000
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, bbhushan2@marvell.com,
 bcm-kernel-feedback-list@broadcom.com, chris.snook@gmail.com,
 edumazet@google.com, florian.fainelli@broadcom.com,
 GR-Linux-NIC-Dev@marvell.com, gakula@marvell.com, kuba@kernel.org,
 shenjian15@huawei.com, shaojijie@huawei.com, manishc@marvell.com,
 marcin.s.wojtas@gmail.com, pabeni@redhat.com, rahulv@marvell.com,
 rkannoth@marvell.com, linux@armlinux.org.uk, shshaikh@marvell.com,
 shuah@kernel.org, horms@kernel.org, sbhatta@marvell.com,
 skalluru@marvell.com, sgoutham@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Sep 2026 10:55:52 +0530 you wrote:
> Fix misspellings and repeated words in comments across the networking
> code, found with scripts/checkpatch.pl using the misspelling list in
> scripts/spelling.txt.  Comments only, no code changes.
> 
> Changes since v2:
>  - v2 put 184 changes in a single patch.  Andrew Lunn asked for it to be
>    split by vendor, which comes to 54 patches, so this is the first
>    batch.  maintainer-netdev.rst asks for no more than 15 patches
>    outstanding against a tree at a time and I have five in flight
>    already, so this batch is 10.  The rest will follow as these are
>    applied.
>  - patches 1 and 2 are unchanged from v2 and carry Andrew's
>    Reviewed-by.  They are resent because the v2 series was marked
>    superseded, so they would otherwise be dropped on the floor.
>  - dropped the sfc mcdi_pcol.h patch (v2 4/6) even though Andrew had
>    reviewed it.  Edward Cree pointed out that header and the Siena copy
>    are generated from the firmware definitions, so an edit here would be
>    overwritten the next time they are regenerated; he has forwarded the
>    typos to the firmware team instead.  The sfc changes outside pcol are
>    unaffected and will come in a later batch.
>  - dropped the 8390 patch, the driver is Orphan / Obsolete in
>    MAINTAINERS.
>  - dropped one octeontx2 hunk, in otx2_pf.c, because the comment holding
>    the typo has since been rewritten upstream.  The remaining octeontx2
>    typos are still fixed in the marvell patch.
>  - dropped an "amount of times" to "number of times" change in qed_dev.c.
>    That is a wording fix rather than a misspelling, so it does not belong
>    in this series.
>  - v2 6/6 (net: usb, "Medium Mode mode") is not in this batch.  Andrew
>    asked me to check the data sheet for that one, and I will answer on
>    that thread before resending it.
>  - rebased onto net-next.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/10] net: llc: fix repeated word 'all' in comment
    https://git.kernel.org/netdev/net-next/c/2d2c2ea6650e
  - [net-next,v3,02/10] selftests: net: fix repeated word 'use' in comment
    https://git.kernel.org/netdev/net-next/c/a2c9decb21b2
  - [net-next,v3,03/10] net: broadcom: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/a08b0a9e5e5f
  - [net-next,v3,04/10] net: cavium: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/405829119fdc
  - [net-next,v3,05/10] net: qlogic: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/12ae2a2b298a
  - [net-next,v3,06/10] net: fddi: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/ef7ed063b48f
  - [net-next,v3,07/10] net: marvell: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/36ca708b7cc7
  - [net-next,v3,08/10] net: hisilicon: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/1b4109e4a024
  - [net-next,v3,09/10] net: atheros: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/eeea715379b2
  - [net-next,v3,10/10] net: dec: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/f36cb539fd97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



