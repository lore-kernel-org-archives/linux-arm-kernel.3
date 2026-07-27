Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952DDC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bek5K8MpSEcPq0n8AmlhIm0UXmOy9Y9eeNOvMKm/NIA=; b=HQYtlEEG9MS+uRYavXTQd92Exf
	ToYkbbD3fxhS7MyMidfArCSMBS6gNvHEs60pDe6cfAdugqhgqhj5iDM2EprnukDfDxm5WkrDHqlA9
	4DtnBU7M8yXvQ5RPBFUply5g7lQgHf8C4MJU4XkeKQ6gYhDoKgWPM8cgvjpfwLS+2gerP4d/0utRc
	8AmTDeTopC7AXk2tQiczGY+Xr8gkx2yJjaIhfdz30fbpVE3pDz3cUi55IoRuIUPziAZ3hQ+hcyG8f
	bpIdTZnZ0jnxmnkzVIlobiQBjTZORC3vKZ75dL6ICx7Fr5cyenFFnuIYX/Ct1T0pC6cirQ3D8ygxs
	eRTi/gAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSHc-00000003tsv-2Xga;
	Mon, 27 Jul 2026 20:50:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSHb-00000003tsm-0zcU;
	Mon, 27 Jul 2026 20:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7FCA42D7E;
	Mon, 27 Jul 2026 20:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A76D1F000E9;
	Mon, 27 Jul 2026 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185442;
	bh=Bek5K8MpSEcPq0n8AmlhIm0UXmOy9Y9eeNOvMKm/NIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ShaxVeCIX/P0dn6AI9xK7iIKca/wqChDH+NUl4TooKyBYyhFAmyHGDVMZ0DIWSNOi
	 yZLbnn97y/OhzuLOtuKTnRSBwT7VYrfGRydZqEo/CM2t/0w2JlB9OZ7x3mJZWZHH5r
	 q9sMBLRsRL+p6JbMDcnbRbFLOK2ROd9OWoJMpRKvY2vL2FrW+6SAfkKbez9GTPhB/b
	 Vi7GYoaQmMR2xzWgGQXrhfeqg2hXP0jS1NwBfJvwwt+muYJHXRrTByagPL56Gw2Zfk
	 ZLIwol5O9RqrXvP/pMnN5aks/sqi3G52UaLPzhOEmEYveikpjHpLsz6ndYeMD2cfX4
	 c6qWmQsFXQn2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19866380664D;
	Mon, 27 Jul 2026 20:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Bluetooth: fix short read errors in usb_control_msg()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178518540763.1412337.1240855663216361705.git-patchwork-notify@kernel.org>
Date: Mon, 27 Jul 2026 20:50:07 +0000
References: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
In-Reply-To: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@kernel.org
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 27 Jul 2026 17:57:31 +0200 you wrote:
> There are two drivers in the bluetooth stack that suffer from possible
> "short reads" when sending USB control messages.  Fix that error up in
> them which allows the error handling to become even simpler.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Greg Kroah-Hartman (3):
>       Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
>       Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()
>       Bluetooth: btusb: Fix short read errors in btusb_qca_send_vendor_req()
> 
> [...]

Here is the summary with links:
  - [1/3] Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
    https://git.kernel.org/bluetooth/bluetooth-next/c/3501d7754c85
  - [2/3] Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()
    https://git.kernel.org/bluetooth/bluetooth-next/c/abcb881d99ad
  - [3/3] Bluetooth: btusb: Fix short read errors in btusb_qca_send_vendor_req()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



