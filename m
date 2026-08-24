Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31916C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJStwZRbP99TYWbbAHbc3tE4EIKFHDtlxRh14wfhlS8=; b=o13lsHBLiDWU2x4n20PIVsArxI
	4oZh1976AOB+oX9JhRQ4NCSEW5koay/M3U6Yc+C+QdJgs/zZOIMs2uzyqw4bfBaXnsxHhese1x/LF
	FL/AXpXwvrkdY8eZanEta+ASpLcWvLLAxI4LHZUBu804K7G6FxEaPxcN7IMW6kheC4ybtjNu0o44s
	YPS79yAebATj4E84V6yri2HI/jC6cUQ2piMRGllSntoHD+cvJ1IkBCnGVzGWroNNZ2T/bc6n6Ipg4
	pwcr/duOC2GH5jt6CIV4V71scPW04/vKGr9AZDe9HkU5tZ7PsSpaTFqEr+1A2JakACemSubHtHmGa
	1ZwChyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXt2-0000000H54G-3SFA;
	Mon, 24 Aug 2026 16:51:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXt1-0000000H542-0y9V;
	Mon, 24 Aug 2026 16:51:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2E3943796;
	Mon, 24 Aug 2026 16:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66B41F000E9;
	Mon, 24 Aug 2026 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590262;
	bh=rJStwZRbP99TYWbbAHbc3tE4EIKFHDtlxRh14wfhlS8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=H+GqnKnMnAv3ysTMHpNn665+7WpzLFHlI7xXFGmnpERFQF4lJ/UnhffVbbw9f12It
	 YVFfti/NHFnJaAbPbdfP/auSA4fg2uLBHHpwM7/9IB8IkQj41rD3jz6V/5Y7qc/ZnS
	 0Ce3lroCK/sU1G5YlA3+OG8pIn44p5zzP/23hRub6UXaUTxAlMyP4rCTap2nkmP23s
	 yJ7cSl86ejVtGegflUJWs9ovhfnY72w202hjSQ5EuVsh95uUoC7cubAItHgbHbuwX0
	 SJOtd6VFeCskmzGw+PH7d546iKsavpTIp4aX4Spo/D84h0NpOuTyLmUYKU16KLmW3t
	 odkAVkomB9Gow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938F53924478;
	Mon, 24 Aug 2026 16:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC v2] Bluetooth: mt7925: trigger reset on WMT timeout
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178759021014.3014491.17750649359199343822.git-patchwork-notify@kernel.org>
Date: Mon, 24 Aug 2026 16:50:10 +0000
References: <20260822-mt7925-rfc-v2-1-c88e3bcf7eb8@gmail.com>
In-Reply-To: <20260822-mt7925-rfc-v2-1-c88e3bcf7eb8@gmail.com>
To: George Maraveyas <george.0xfff@gmail.com>
Cc: stern@rowland.harvard.edu, marcel@holtmann.org, luiz.dentz@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 acelan.kao@canonical.com
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

On Sat, 22 Aug 2026 01:37:33 +0200 you wrote:
> From: George Maraveyas <george.0xfff@gmail.com>
> 
> The MT7925 Bluetooth USB function can enumerate successfully after a warm
> reboot while the WMT function-control command remains unresponsive.
> 
> When that command times out, btmtk_usb_setup() currently returns
> -ETIMEDOUT without entering the existing MediaTek reset path. The existing
> USB reset and recovery machinery is therefore never reached.
> 
> [...]

Here is the summary with links:
  - [RFC,v2] Bluetooth: mt7925: trigger reset on WMT timeout
    https://git.kernel.org/bluetooth/bluetooth-next/c/a6491451f8b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



