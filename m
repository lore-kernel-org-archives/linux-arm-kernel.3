Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40556CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9a7k6Swy3++FspoGSqoywdeqAsXbjHvdGqmU8ITUsE=; b=mr4XHuq5I7PCBBd0RRpZZrsDEg
	lYXqdKBiBe8iNDQpFJ5qWUb2e96/fwNywUoxV5vEoyqu8a8LJSazlotWQwaZZjyh1BT1gc+kGz2Qn
	ADnXfG+GE3B9QWm2k/yq3/CeGkJqUTp0WIpu4QrFxP46lMT3wUgnVHfumtqh1btdwf1V2wXZTRD6o
	jxPHXTK6spQIyJSx6SqPN7WVvq6gNWa5MS08FXZeEwSGa2VsxgS+hb1PfrPX0+O14hWUVb/J/DSWp
	9QJ6cUFWlHBkGv1eMOST+Z8E0o3hkQbTTsP5KrHvJ+hQQyq76CjEeXs2DoOHv917yftQI36fzOxG2
	n8jVu9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hmv-0000000AiDK-0p2V;
	Mon, 22 Sep 2025 14:45:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hms-0000000AiCb-1jzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85053438E2;
	Mon, 22 Sep 2025 14:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F36C4CEF0;
	Mon, 22 Sep 2025 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758552305;
	bh=D+LNgfJNYzCpnFJGwhR+lwXuJ0ILIQoGT35vh4i2XBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=dbZ8P5ogAQJxFbT4EfBs9j5q1ngbONMN+GPGjDS72pZp8K5Iu7yqjJzx8x50lU1Vr
	 PPcpXXiat/SkwL2/JWZ7dflR4RJQBQrwyVKAkh7pJ7K/UmpBgiKcs65+TwIATHeW9t
	 9MPbNQVtV2sVFRKFdG+9SLw5RPWb7xLiY8Ox8pzArKUr5SRrhkF7WuX6ThVcaGWL3A
	 /fHW211aJfaIA0Ttx8Lk3nowZIF+aQdUcEIZwWHMXF4rJvWDI+vGhXEuFTZSPJ8I+h
	 SO7+HOTB9X9vQsoDM1E5KtVw5bYfUyHi22g9eNVL52DROhD2zC277PW8XWd5gDwpTF
	 odCCKaXxNnU8w==
Received: by wens.tw (Postfix, from userid 1000)
	id B2EED5FC15; Mon, 22 Sep 2025 22:45:02 +0800 (CST)
Date: Mon, 22 Sep 2025 22:45:02 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [GIT PULL] Allwinner Device Tree changes for 6.18 part 2
Message-ID: <aNFg7iuBtyWkCZg6@wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_074506_472282_01767131 
X-CRM114-Status: GOOD (  10.21  )
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

Hi,

Here's a very late pull request, adding support for another board.
This is already included in linux-next, and doesn't show any issues.

The following changes since commit cca07ac2b5f7838b8ff612b53b9f82ac8cb58312:

  arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions (2025-09-15 00:04:32 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.18-2

for you to fetch changes up to 07c7f4f4e9504da240ef68adfd95a1150d3a6fd4:

  arm64: dts: allwinner: h313: Add Amediatech X96Q (2025-09-19 12:37:16 +0800)

----------------------------------------------------------------
Allwinner Device Tree changes for 6.18 - part 2

A new board, the Amediatech X96Q, was added.

----------------------------------------------------------------
J. Neuschäfer (2):
      dt-bindings: arm: sunxi: Add Amediatech X96Q
      arm64: dts: allwinner: h313: Add Amediatech X96Q

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 230 +++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts

