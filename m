Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC2BD6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TNe7KOphq4nmfffBJtOaPDGpUKyHgke7/U8Ppzqydg=; b=h70ME30OQVQUKxKVOyrov/N1lI
	Y1ReoF7XKsWyAKmPDGJJDhTcMfc+HoveLfGVWhr6lKzquH8+j4U/133QW9KwRQlqkget/3DN3EV9W
	RuwdSfq+AcKU0Ubt/Zkjus3oK8taEHyZM8u3Z4T+vuj6O/b+clgDJAlRkfiW7U17gcxD95wh+P6ww
	Vs2zwYHTDu4uXOSamAEQ4YtFYlWRIBAXNagwfZ03nyYmiI0Ym5o7c0mBSBsU0YHcoB2oblP6bnNby
	9XnyrJFHGSFOMA6EWQ5pQSH3BHEw6V8qgEcW0Pc2rGAc6UeI/J2729yQfmogNNNkFdWiRFIH97xfp
	ElzYmQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8M1u-00000000bai-42yx;
	Thu, 02 Apr 2026 17:40:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8M1s-00000000ba5-0qjU;
	Thu, 02 Apr 2026 17:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF3644287;
	Thu,  2 Apr 2026 17:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A913EC116C6;
	Thu,  2 Apr 2026 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775151625;
	bh=YcixH2BvmAOf8OOf+4kOaHQ1GMq51oC/TB+8lPyEDEQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TtMPmxV5dbE0E2ebpGvdViEeW9cG3C+1AWqmi9bP0Wlze+nm35mKb+fwO3HwyW+kA
	 p4FkC7f9QfLWwbZrR5iT6qaOLovW8sYpIWP7cQVBDupp+QjbroThm+Tb5PaPsIvK/A
	 xcgaUYxhwqj4PAG+rIs/fFyuPMQ88ZqKcbhCXUHSIeJxk22BaCzI92hp+eIren8T1P
	 +h+hKvTKF0saAATsaza1vOttFAcTO5Zg7z0OrGIaYu/FQpTd3D89r64zlFaIGsgu/y
	 0s9q68Xyvasb8eN/QBTQeijcKRBKQRsrOfHY345JJTpWdlSChkt6SiRwnVTovrzsoY
	 DVunNSixyd6Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDA13809A08;
	Thu,  2 Apr 2026 17:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: hide unused  btmtk_mt6639_devs[] array
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177515160778.548768.5779863589943755468.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 17:40:07 +0000
References: <20260402141119.2732591-1-arnd@kernel.org>
In-Reply-To: <20260402141119.2732591-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, floss@jetm.me, arnd@arndb.de,
 chris.lu@mediatek.com, kees@kernel.org, johan@kernel.org,
 sean.wang@mediatek.com, jiande.lu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_104028_261795_6709484D 
X-CRM114-Status: UNSURE (   9.67  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu,  2 Apr 2026 16:11:15 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When USB support is disabled, the array is not referenced anywhere,
> causing a warning:
> 
> drivers/bluetooth/btmtk.c:35:3: error: 'btmtk_mt6639_devs' defined but not used [-Werror=unused-const-variable=]
>    35 | } btmtk_mt6639_devs[] = {
>       |   ^~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: hide unused btmtk_mt6639_devs[] array
    https://git.kernel.org/bluetooth/bluetooth-next/c/a6e00a811c87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



