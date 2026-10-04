Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99740CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvtwBHB/29za1lBzcRuhdIUCXU2ONAT7YGslVIQD3fI=; b=JI8f/5QscMx5fCQCyRxdAUeev0
	xg6y2CWRKabl4ZpeSTxJa3OiGB1Au+sUSvfMEBVsuJ/7z9orlmno5XFY+7nVrx27+w/dT2A+sKwCU
	fTF6subC3diqvF/Oi4kdOnASbXsGFGdVVcB3hTVHjFQNJe6QpIkmr4yXoZSRI/V88Y/y7EQkGOgCa
	pxKzuatPEA9cLLbVVKB/mqkbU4WqWl7TJCdAv8ph5SyXb1BaSbLXUmFLqHLhpYuPzh2BcT0bdEZNU
	q7mZXD9GTk0mZ0X4HomjvWTz8IsbviwjZiNYocGF+EOyjtxjc6EhUGgKvlXhU+a8MtZ6aare8wKRP
	ydDZgzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSv1-0000000FGsg-1QmS;
	Sun, 04 Oct 2026 20:34:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSuy-0000000FGsW-1UuB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:34:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17651601F7;
	Sun,  4 Oct 2026 20:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF7F1F000FF;
	Sun,  4 Oct 2026 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791146080;
	bh=wvtwBHB/29za1lBzcRuhdIUCXU2ONAT7YGslVIQD3fI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=KvZbKb5dyXgbImEhRmYvpxrdH5/N4/2vT4VGeSBFjhDf9OCOQudEgwZojC1zvKOXf
	 f8drGcZlGWFBewZ7aCSk6AywEI2EGsRNoYKYSGMqr6ynYaZJ7I8ipwy0cagfYdVP3b
	 cCw1MfXlFv2v9LMhJ589kVGjWb6UcRcRXEacJ2IwnmxiQn5WeybJDVUgoKTDJ/Plcg
	 bKdQkW8EwNXGGd5pOc2ShCEHWgx7qfNXdKzSowfcakItuE7Dv4keMsVZeH58BURb2t
	 5b+Tc+siPF6SvmR3Dk5dIon+98y/EJO4Tdc6Hg8ulG1FxZ+V4bDF0YD5YJQ5yTA1rM
	 +D5Tv5yMQ2RYw==
From: Chen-Yu Tsai <wens@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260927200820.795348-1-olek2@wp.pl>
References: <20260927200820.795348-1-olek2@wp.pl>
Subject: Re: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add
 ethernet LEDs
Message-Id: <179114607889.27465.17745402190793009878.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 04:34:38 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 27 Sep 2026 21:38:18 +0200, Aleksander Jan Bajkowski wrote:
> This patch adds support for Ethernet LEDs. Keep the default LED settings.
> 
> 

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[1/1] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
      https://git.kernel.org/sunxi/linux/c/265ffb8d8dfe

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


