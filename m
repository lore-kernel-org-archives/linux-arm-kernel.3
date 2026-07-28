Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3020C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SyQBSt2UdaYBX5LG330Ku8SMsXEvIX312QVbqRgjBM=; b=kjzXpxcGrstFXciTp4Zyjfh8jG
	EHA9L5lGJuOSSiEehrKQ8Lkjvd05QR/CxBkFCUrjgQtGRx8G5KVY4qLDrYdcTEBryDpE7rOW5IQ5g
	Lx78hv6TlTPbSBYaQRpH8Vm7jBDQOIZ2DbnO9KfKPGJZkpfHliCX9v1JBlOjg7YzN/69dak+vDtCQ
	xrgO/56LQXl4Yvt5lF8D77e2s+Bpm/JAzyJrFLrc0voPXQz8pLJnbHs0PSCoKqzSx0X9wTiMadUkj
	dWXhaTscbgfZT+1SrFC0dP0o3HFebktuegmxu+4CGtLzfAaYgYAdkjex6Mfz3CH9fXYIacB7ZIxgl
	fDixnG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizR-00000005WwN-47IU;
	Tue, 28 Jul 2026 14:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizM-00000005Wum-1WJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB53560A92;
	Tue, 28 Jul 2026 14:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73981F00A3F;
	Tue, 28 Jul 2026 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249659;
	bh=5SyQBSt2UdaYBX5LG330Ku8SMsXEvIX312QVbqRgjBM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=OpDDGcwdlCLdwrY9O0W4rCrBXN90iNw7yj0+9SNU5XIKbNUcmJ978Xb0DuAVdO4i4
	 4WGZOQuGzMiMbXQ6q6PGwQFaBYBt/t4GkHw6nFMBNn+FtoIGO5Fc7L/QzOlfM5w3AY
	 ctjQWeDn9xjhfQWAwFFJ/JagA/bKmWZurnAx7TTKhS9qRI+373Tww0ynzr+rY8841V
	 EIBQSuK3eyenw+fKVA/6EWuSPDifs+92S6EvPNIDjv7EMAE8n384NLw4gk5gdPuHer
	 HVLxK2L9QUpMBc4cMQhH2okuYh3aHc6TUSTEpNC71zHRTTQjmFCYoWGYqPzv3OX6MB
	 enER5CrC7dKIQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsson <per@palvencia.se>
In-Reply-To: <20260720174253.7686-1-per@palvencia.se>
References: <20260720174253.7686-1-per@palvencia.se>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
Message-Id: <178524965743.668575.17658013610158209404.b4-ty@kernel.org>
Date: Tue, 28 Jul 2026 22:40:57 +0800
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

On Mon, 20 Jul 2026 19:42:42 +0200, Per Larsson wrote:
> When spdif support was added for the Allwinner A523 family of SoCs, only
> two of the three possible pins were added to the dtsi, since the third
> would clash with the first ethernet port (emac0)
> However, some devices don't use emac0 and instead use emac1 for the only
> available ethernet port, leaving the pin free to use for spdif.
> 
> Add the missing pin to the dtsi so such devices can (later) use it
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
      https://git.kernel.org/sunxi/linux/c/3683d4f690b8
[2/2] arm64: dts: allwinner: a523: Add SPDIF to x96qpro+ device
      https://git.kernel.org/sunxi/linux/c/35ab38054011

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


