Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FA8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgaNPISvUn6xIAYsFHLCVHpW1RByn/TtLzeqOoZCRlo=; b=BvtrV/0iFnpmHawAb2COXJzkKi
	UaHhkdcqHy+7XUDkPc0LSUv98tmTJ1T1AFlU16o3/k/NOrQ5W7e3oHjp7RMO6x00sw0IibW4u29H3
	0+1sP11RoWaw1zx95b25eNgbq+uuXU2zAJrSWPQmSmh1BOAOyZDYXmWPH86xXK7XmIBahOuTocIZK
	CIxFOy7NO7pA9AEZjEbHM7i8EHPjcFzajzjqjYVPsV+pPwqN+8SrEBlGzzYgyoLGqHs1O09WcITCB
	WlK8ViOZ1tHhxqi16pbvE2HYXUmaEM0rRdSc2asYj1KhWNG8QVZwjWozvXjpn6Y3fAhgjT3Lxf2fz
	K6aR3C5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRCi6-0000000FM1i-1fzf;
	Sun, 24 May 2026 17:33:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRCi4-0000000FM1C-2Iuj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 17:33:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C52C340363;
	Sun, 24 May 2026 17:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F8A1F000E9;
	Sun, 24 May 2026 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779644035;
	bh=UgaNPISvUn6xIAYsFHLCVHpW1RByn/TtLzeqOoZCRlo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=mpDuxRgFPqmM5H1QBSmJ8JeLGQ3WvE/QCvAGe31qS9Ez4n4E8uAr6yaXl9OEaaXu2
	 Sn6O4ABq1/Onfp148WWtOy22tPRMdMxhLbt/y8v9oPu3Z8vLnvp9JoyENGNR/WphtW
	 PFp6q3SP7kG+dH9knIITW/VdvtIk+U6SLpSsZerf4MCeJyvQ+89DhyFQH9oRZ0SU5B
	 NnrsHutEC5DJWIQ2/Z8qXDVIspMy96RAT3/uYsDaHZ5Z1r7KbztLsEln/dtCYc/quy
	 bpBpN02/ubRabllJbovCo9WNBmHlJEwGTvlwkrHbnZkxbfvA4RcwUv8Y08MdAwrWpS
	 UbyN8seWrtyTg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20260518220455.156874-1-pbrobinson@gmail.com>
References: <20260518220455.156874-1-pbrobinson@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
Message-Id: <177964403378.111316.1064963381424258232.b4-ty@kernel.org>
Date: Mon, 25 May 2026 01:33:53 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_103356_611530_4E6C0F86 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mon, 18 May 2026 23:04:49 +0100, Peter Robinson wrote:
> Enable DT overlays on some of the Pine64 devices to enable
> use of addon accessories such as WiFi or audio modules.
> 
> 

Applied to sunxi/dt-for-7.2 in local tree, thanks!

[1/1] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
      commit: 3a6ffc1b4fcecd021361393d7294badb0d89e5b0

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


