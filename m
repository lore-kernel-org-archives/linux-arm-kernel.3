Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11ABE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vpAb/pz7vgxjoP4wG4PUfeOng2V4P/xmCs9K//Sf6w=; b=f/4yvJ0o1XxxTbtMfm1Rb8wDFa
	ujAl5rLqJXsBxVxawlPNTtyQYW1Yg/L5OsWYrIBspA7v2REDI9Z3CzU0GtdMMzAj5neDCNkB5AnXH
	AXybvUGSxr2skPZSDTw5P60iG+BASm41PJV0GkKHzczSso2Lb5sXDIAOdW7P4kTVgp1uUP3E97HXE
	6YrAOqEAEOo753Q1O2H/NxSn5db+PAMnLW0GzSkeNbJF8i9gOPAiUlWmWU9Rdb0ch5OcyR15Jpew1
	wIq+WPxiKviLO96ugVZavvmX+7G+mVesNKNK1ZgHH3FLzrXF0yd/GB9osM5vKhfaQ2Tr7D/fhDjfH
	xji8d54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2P6-0000000BnCB-0mUb;
	Tue, 24 Dec 2024 10:44:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Mw-0000000Bmpl-0lGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 307C3A41494;
	Tue, 24 Dec 2024 10:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7BAC4CEDE;
	Tue, 24 Dec 2024 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735036949;
	bh=5Cxrf1mpeQlP/xWn7RoT5esd+s9F+bviYF/k+MUUJzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kgLaYMf8AHYU+htlhj548Ui1vPAqKVTqHUmL/iWSdJsPElGkHLofpbGEMAqqTqIij
	 TknIT0wk/gTNBeI5ci7LA7GE1npXcf8ewzwmIi/YoEE42oC+pxQKegdkl4hZY1Zmw7
	 /47S0GmI6XDSBuRkH4Y8EigI9HadUvFi6aO27vBGZsXsQMemepZ26mNXYnrnXhQTxw
	 BjjDcp8jWR2Sd2mIKSRGbYy7TwiPwshMPoyvIdCqZu04/Vz/JME4JZIVW37Z/ZzaHM
	 fkWuIzimh9AncZiw5uLZDH8UG6lJD0cb9A3A27v2qj53j7BjRg7H7a+YfUpLi2PZ+A
	 L5rb98Mp3cjDg==
From: Vinod Koul <vkoul@kernel.org>
To: Ken Sloat <ksloat@cornersoftsolutions.com>
Cc: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, dmaengine@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
References: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
Subject: Re: [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add description
 for dma-cell values
Message-Id: <173503694532.903491.10482380884670352908.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 16:12:25 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024230_303393_1A65A4B5 
X-CRM114-Status: UNSURE (   8.97  )
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


On Fri, 06 Dec 2024 06:50:18 -0500, Ken Sloat wrote:
> The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> for the actual controller. These values are currently undocumented
> leaving the user to reverse engineer the driver in order to determine
> their meaning. Add a basic description, while avoiding duplicating
> information by pointing the user to the associated DMA docs that
> describe the fields in depth.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: st-stm32-dmamux: Add description for dma-cell values
      commit: 54e09c8e2d3b0b7d603a64368fa49fe2a8031dd1

Best regards,
-- 
~Vinod



