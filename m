Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A9CE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snPnfknbKiARKq16cFb/IgmwDlApn4F/tuHzHXSDZxU=; b=1VPXo6eikcywEj2rO4jNbWVrXv
	14MFpKj3+A9npgdNPH/uScNak6RcZ544MAY9c/gY5h2LhdUIWvPxHJVCt2LpKhUnuXRHWRvQKI8bP
	/u1HuEhz6OtcChnxB7dsEL5GTd3XA0Oh4vw+v753akbPiA0ymDQF+VC3OW48C7JcPymaBVIBgi+Fd
	SlnEEkgSIqHjsIAYBeTlVMZ9+f+OJNBuh3Vi+EjNq/1k5SD5r4F64A3OwHRR2e0YU4oTfM20rS56i
	4KJ8EnJ7wYTH5qZVPnrpijJHnOtsqmtQ4za9/Ov3AWAdqcoWsmMnWydvXLV8fQIazjs5MsHZYM8QE
	O2c0h6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSRjB-00000006JEk-2bBy;
	Tue, 31 Dec 2024 02:11:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSRi1-00000006J4S-15Cf;
	Tue, 31 Dec 2024 02:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FECEA41019;
	Tue, 31 Dec 2024 02:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9EAC4AF09;
	Tue, 31 Dec 2024 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735611011;
	bh=uACa4budD4RS8hP+CAygN8N3iO9gZnbLK8aHPZ2ufUw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kX8BGjuInzd+SfIEQNfwuCZBccnrLB04HKbzWsYEXgnO6CE2iGzZNuetr8EEumPDA
	 IwwaYNni15nUiM58igGW8ius69E8HQLV4ueRGuuYGkvitk6oDEHBi4ocue+o862TuU
	 JKXTX4tQAYSRW4QQsnlDpV0LL0vk/oCzCWdVjHfdKM0/S7kfHNMl16d2H2iHaTq2JA
	 k8j84JGcVIb5r2jiS4f/7rqLxOTsWr7ZgpOo79Hc0i/v80pFeSo6zc6/pzerm/JF/P
	 FJxOcp/YlKBbWGpyAmpbN6W/7enOfmuYH7n4BTw7jKkyBlW+t1jTBVj+TGvVJ19rkr
	 f96wOmjg2tzqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD9D380A964;
	Tue, 31 Dec 2024 02:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net v3] net: wwan: t7xx: Fix FSM command timeout issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173561103149.1487469.7896899204540542630.git-patchwork-notify@kernel.org>
Date: Tue, 31 Dec 2024 02:10:31 +0000
References: <20241224041552.8711-1-jinjian.song@fibocom.com>
In-Reply-To: <20241224041552.8711-1-jinjian.song@fibocom.com>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, corbet@lwn.net,
 linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_181013_363975_B74C752D 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 Dec 2024 12:15:52 +0800 you wrote:
> When driver processes the internal state change command, it use an
> asynchronous thread to process the command operation. If the main
> thread detects that the task has timed out, the asynchronous thread
> will panic when executing the completion notification because the
> main thread completion object has been released.
> 
> BUG: unable to handle page fault for address: fffffffffffffff8
> PGD 1f283a067 P4D 1f283a067 PUD 1f283c067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:complete_all+0x3e/0xa0
> [...]
> Call Trace:
>  <TASK>
>  ? __die_body+0x68/0xb0
>  ? page_fault_oops+0x379/0x3e0
>  ? exc_page_fault+0x69/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? complete_all+0x3e/0xa0
>  fsm_main_thread+0xa3/0x9c0 [mtk_t7xx (HASH:1400 5)]
>  ? __pfx_autoremove_wake_function+0x10/0x10
>  kthread+0xd8/0x110
>  ? __pfx_fsm_main_thread+0x10/0x10 [mtk_t7xx (HASH:1400 5)]
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x38/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> [...]
> CR2: fffffffffffffff8
> 
> [...]

Here is the summary with links:
  - [net,v3] net: wwan: t7xx: Fix FSM command timeout issue
    https://git.kernel.org/netdev/net/c/4f619d518db9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



