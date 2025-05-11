Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF86C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0vf+r4SgVS8P3BRP1UuumCtts1FPTgBpsRtvD5rM5s=; b=b/yHvAzjERi0oBEGHQ+d5x7XZI
	LtwGD5Hxd2gu6aAA39jkyDzGpDjYoKrP5fl5/bVxeT8TDtw2U2jsWhkdS1ouywbJU4jbDf6shOvs+
	3DZNumRA1v05I3bIZjzhC8wkmXo8Tu2lM+7EIC49yT464xdiF77jM7Q1xG/AWTgY7TMcKpjNeBPLY
	TZUDbIAkvY9EQ9wgOGEw1bOV0kcP1Z0xIPblOdoTJf8f334kjlwunE2mXzhwDFiNSaalCduv2NZWm
	IeACnkk89UqviCAcPpgPMeJRpVfDCo77eXXDoNaHBkxbeWtxSpPJqCpgEDFoOe/V9ZxIHL8DVwjt1
	0zZ1Lx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEEgm-00000007vsI-3rjM;
	Sun, 11 May 2025 21:58:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEEem-00000007vou-42rq;
	Sun, 11 May 2025 21:56:26 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uEEYY-000000006sM-1X1I;
	Sun, 11 May 2025 21:55:54 +0000
Date: Sun, 11 May 2025 22:55:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux@fw-web.de,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	lorenzo@kernel.org, nbd@nbd.name, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: Re: [PATCH v1 09/14] arm64: dts: mediatek: mt7988: add switch
 node
Message-ID: <aCEc5tYPivxvRVDK@makrotopia.org>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-10-linux@fw-web.de>
 <bfa0c158-4205-4070-9b72-f6bde9cd9997@lunn.ch>
 <trinity-0edcdb4e-bcc9-47bb-b958-a018f5980128-1746984591926@trinity-msg-rest-gmx-gmx-live-74d694d854-ls6fz>
 <74afe286-2adb-42d3-9491-881379053e36@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74afe286-2adb-42d3-9491-881379053e36@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_145625_003671_232471EF 
X-CRM114-Status: GOOD (  10.71  )
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

On Sun, May 11, 2025 at 11:25:27PM +0200, Andrew Lunn wrote:
> > i will move that into the board dtsi file in v2 because "normal" bpi-r4 and 2g5 variant are same here.
> 
> Maybe you just need to expand the commit message? What does this .dtsi
> actually represent? The SoC, or what is common across a number of
> boards?

mt7988a.dtsi represents the SoC, and thus there shouldn't be any
labels assigned to the DSA ports.

In case of the BananaPi R4 there are two different boards, one with 2x
SFP+ and one with 1x SFP+ + 1x 2500Base-T (with PoE-in), hence there is
a dtsi files for all the parts shared among the two boards. I suppose
Frank meant to move the labels to that board dtsi file, and that's
correct imho as the labels of the 1G switch ports are the same on BPi-R4
and BPi-R4-PoE.

