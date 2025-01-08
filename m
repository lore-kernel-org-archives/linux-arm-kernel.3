Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA10EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAtYy/sN1+0JW6hDJCMsQQ7upfH2nvSdIQBirWnML24=; b=yg4iy++gGFWsN2pQHhRZnOQFdm
	b76Sn1t4hTxocAmS+xaoGY4RQfpyekOZQOZh25/x6v1TqokyI1Wcj7P6jjtNnx34IHTrBeJjk5P/v
	lO5XZRRnoG7ZXa4ANPOPVwPu0SipsmyMQ56y4JZi9CpwutlPdpWLOiAXe0ffgh2Zm2IGUhk5KFxNX
	44gsoFgxQa+aCzAFTHxmv2a98IlQt5A0iBqor1V0qQVZu9qkh1NbR8RCs0iE/RRYvZPQEt9V/uxS7
	ulZmpeqR8QrW7TKvVDtscAXM7I8lrW7VdWl1JvQ0eB07+vSztCF7yAE29sM8cAf7/TV07TXg4zZAI
	x+ja8tSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVoS-00000008YMT-1LLn;
	Wed, 08 Jan 2025 13:09:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV7s-00000008Pug-3B8W;
	Wed, 08 Jan 2025 12:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wAtYy/sN1+0JW6hDJCMsQQ7upfH2nvSdIQBirWnML24=; b=weF/wZSFpopwFxnBPdClG7lcFK
	d5jcJpgUuI5pwlbPMqmntwuJyl8MNRoyn3Pz096nX0888Ye2F5Xn7linw0ux+lyKZpsdx3nzlZrcm
	e4CWOIae6jIKSadka7WG4z22fbPl5xcR18ptPXRMY6Vlg0tPHjmOF0+sfkoF9kR+cRt4TENeK292T
	PnaLTDjwqKK7Xl2KtjBEqWJh1mxY/WL/n6oX17occKWsmEIS1QcXQIp5YXaP9n31Bbc2z7HkuNi+S
	kV6loFN0zti2X1f8izaMUkD/t4I4zvajec8QAovqAqd5+FbvxUtJ+DbhHk02QcHmO+B7WeycVGM2v
	XiXQop2w==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVV7p-0005gn-Ke; Wed, 08 Jan 2025 13:25:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: update wolfvision pf5 mainboard
Date: Wed,  8 Jan 2025 13:25:17 +0100
Message-ID: <173633908213.2779821.11342120037203795124.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218-b4-wolfvision-pf5-update-v1-0-1d1959858708@wolfvision.net>
References: <20241218-b4-wolfvision-pf5-update-v1-0-1d1959858708@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_042532_790439_6A1FF196 
X-CRM114-Status: GOOD (  11.37  )
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


On Wed, 18 Dec 2024 11:43:10 +0100, Michael Riesch wrote:
> Habidere,
> 
> Two updates for the WolfVision PF5 mainboard:
>  - The onboard microphone is mono, but needs to be treated as stereo
>    microphone due to restrictions of the RK3568 PDM block. Fix this.
>  - Enable the HDMI TX audio.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: fix num-channels property of wolfvision pf5 mic
      commit: 11d07966c83f5eccf6b927cb32862aef58488e23
[2/2] arm64: dts: rockchip: enable hdmi out audio on wolfvision pf5
      commit: 2859e1ac3110f2d428a794bda26ea0d90b2254c6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

