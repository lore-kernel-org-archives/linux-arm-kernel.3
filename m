Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8478D277E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KuoYn24hYfeeff5YyFct0Sn9nW0ah7sBtXY2M+OG8o=; b=XmWyD6/GneThl17gsQI6tstABw
	gjv/R5bxt0gQQYfjm8RRw4fRLIWGTJwxAWHqkROBAuWAvsXpp9ZwP5kq11F53u5CxIMrkdY6QuDJU
	ZYJVanR4yww+SPxVxrcscXVkCeGiDlOcJFZtD1kE9mm6/7eA6sd0TUn+FV2JSL3En4pioNpVPcXre
	JeH93b/qJrsyblMkt2rfbBkMmRvCFcUgDA1OTX7vPJJzQHkp+oQBVnjm32wc33x8yNunuDbJCKf5Z
	NgPIhBGiMjlsZlPwgV7t4NUuQTR57ktAWf6phTU9gw+LwcD85JBC8jlj9QdFqWxWJNTWJHDbixF0H
	UvDRW0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veWO3-00000003P8U-1xlh;
	Sat, 10 Jan 2026 10:40:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veWO0-00000003P7i-3bjU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E22B600BB;
	Sat, 10 Jan 2026 10:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE128C4CEF1;
	Sat, 10 Jan 2026 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768041600;
	bh=zr3h/cXPfisO04N/W+Ln8th0Opzkj243Gue7txsalzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hDmy/XO6m642n5wRoU7wZnPIx3AuSsL6Hib8bS4/aRW5zBxTw5hLs/orrbVeLsBO1
	 6g0WxOHYX84ReBt6NtBhqzAFGMwil1my3ULU5n0RLFAd+ewX1UNgJK6VzT7+Qw9Ylq
	 vT9GsCF99h/V//4g2NTh9VVZe+X1xuWUF9klVOPP38PugTUK/wga60QXVOifQB6KJg
	 /G6X6KoewyTQpGRVBItbPQZZ2A1Gg4XtpQOAtyPTF6Z8/CkOx4qpKd6vFXdxFqcv1H
	 aQAD4fraujy/RTMFkkDFiTPimXcOzy6u512Jc0nKjoYECpX/XndqOrfxPgsqjssrlL
	 lo4bMqTvlO9cw==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
Date: Sat, 10 Jan 2026 11:39:37 +0100
Message-ID: <176804152716.3568.1765337883482997730.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 09 Jan 2026 16:25:42 +0100, Janne Grunau wrote:
> Add chassis-type properties for all Apple silicon Macs. "chassis-type"
> is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
> field. User space software uses this field to to determine if a device
> is an laptop. The exact use case eludes me unfortunately.
> 
> The Mac Pro uses "server" as chassis-type which is not entirely
> accurate. The tower and rack mount Mac Pro versions share the same .dts
> file and are identical except for the enclosure. I haven't found an
> obvious property in Apple's device tree to distinguish between those so
> both use "server" instead of the more accurate "tower" and "rack mount
> chassis". The latter chassis-types are not in dt-schema anyway.
> 
> [...]

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/4] arm64: dts: apple: Add chassis-type property for all Macbooks
      https://github.com/AsahiLinux/linux/commit/b73d48c14ad5
[2/4] arm64: dts: apple: Add chassis-type property for Apple desktop devices
      https://github.com/AsahiLinux/linux/commit/96b603324985
[3/4] arm64: dts: apple: Add chassis-type property for Mac Pro
      https://github.com/AsahiLinux/linux/commit/81a683f864a9
[4/4] arm64: dts: apple: Add chassis-type property for Apple iMacs
      https://github.com/AsahiLinux/linux/commit/8714184b7bcb

Best regards,
-- 
Sven Peter <sven@kernel.org>


