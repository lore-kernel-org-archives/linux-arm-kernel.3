Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD421D39422
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOW0L3XaVV3vYFTMqc4EpsZV2dtS9rU8WQqx5KOjvYI=; b=PirOOBQgpY1OBJC98x3PI91SoF
	0su/z2jx4FjTTZyk7+aJeGZdUzOOyGBoyFGRk74WKmvXrZDOQmybEyP+hAg+6ouXZo6vGVJgRaays
	UOymuAYZcnLHNAIJXKPWDUDQ79FAKhHnH/yBAOKtyzrEKCo5qnm/vyQkrTd1M6nNsMCVR+zQUNpzD
	UzA3wdpecH3YC0YdmP0m3SbZVOnFR6n6DTrUThA4RsZYnvMB0CWRQNyj4h/wOpbtYE5V2/OqV+Zqt
	AtF0J2ALdsSsRutEXBoe6umoR3ZLaXu1dNXcs9aYFTw4oJyxCT3VtJ996I1cSMJBn1X5cV5Y9pdcl
	zr3DgbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HyS-00000000AAz-2mSO;
	Thu, 02 Apr 2026 13:20:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HyR-00000000AAp-2aXA;
	Thu, 02 Apr 2026 13:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IOW0L3XaVV3vYFTMqc4EpsZV2dtS9rU8WQqx5KOjvYI=; b=Vg1AP2g+3BfskFSjJrzi4h98QD
	IXnfFEvtbhmz8RtOcitNnCSI/NsdqWjl2c6VnSVwQiewMxnPMr+dnwGT3PfqY2uDtrDDD3beoknjR
	xT/RaeVnTphf1F2zMlF0H8HtJ8mFC8lzUA7CbqLIeXVYk2B//T0PB2ULDWjisi33ZNcjagqosVVBR
	N5wqTFdtKkLsy0Pks3Zu1kuP9wxrB6UjKqc7M9Rt/UHjq5HTsOD2E2qMhhFZ6U09pj+fblpH36oU5
	NiyEkk3nI1r9jxYfLaeoM8f6VI63LN0q7neBC34ES/bTmE9n55zYqIh9xMgTQWg/DkAMagx2S6fbL
	rSbA0DmA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HyO-00000002Wj6-1sMR;
	Thu, 02 Apr 2026 13:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBFAD43D66;
	Thu,  2 Apr 2026 13:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A345C116C6;
	Thu,  2 Apr 2026 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775136032;
	bh=bdM5CpBSGBUjea2E0M0inYXAS7dXwzD2DrU4yvZg14g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LBPMJ4aKdUI5AFsTq8Jerr5MFJ0I7h5UqvC/VIkXr/u2gA++PjVmemeLAg1r7OYto
	 wVUfkBU0DMWIiFG4wjjTq8G9zge/ZBFOKBPTGDN8JI4/cL6TuCiSyCxIhCaURdVKiZ
	 nUSXg6t0FF0bN++7wPOGZe5Wj5EtXR8rHRpDtwdqPEDogopv2mrA7mws3N7cnfnFqn
	 9nors6N0UjocQo+nX9S5KH7fahpyIVSlj1CrOegvjjmvV/J32RNhykormoFOkRGK/b
	 E46PbUbDJ1AJ9bvAhs74MX+a6ul2BsDgNNwpaE6xhhdpzBbPUw1s7O3Py/qQjnSoQM
	 P6F6PizKqsJzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDC23809A05;
	Thu,  2 Apr 2026 13:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Set REG_RX_CPU_IDX() once in
 airoha_qdma_fill_rx_queue()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177513601478.26443.18083192170217288880.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 13:20:14 +0000
References: <20260331-airoha-cpu-idx-out-off-loop-v1-1-75c66b428f50@kernel.org>
In-Reply-To: <20260331-airoha-cpu-idx-out-off-loop-v1-1-75c66b428f50@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_142036_694344_3AB624B5 
X-CRM114-Status: UNSURE (   8.97  )
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 31 Mar 2026 12:33:24 +0200 you wrote:
> It is not necessary to update REG_RX_CPU_IDX register for each iteration
> of the descriptor loop in airoha_qdma_fill_rx_queue routine.
> Move REG_RX_CPU_IDX configuration out of the descriptor loop and rely on
> the last queue head value updated in the descriptor loop.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Set REG_RX_CPU_IDX() once in airoha_qdma_fill_rx_queue()
    https://git.kernel.org/netdev/net-next/c/269389ba5398

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



