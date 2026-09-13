Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C224EC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXU0FpJrrfRxjV/9XuJ2ILsuuq4iDXIkX/VBK1uBhLU=; b=2B3YShacg60Dea/1BK/XGo2vwT
	q4AcbXKaxDQyh8ymthVCb0BiRJTnF7akqHsn0iz8mvhA+xVDYwiBLmdmPKnAFGgZr5HmIo5ISiAnk
	4BZXh335gajyRcJw5t8ead0gcTVbSAKwnTAxOSXizADG0VTf+uj6fLeJX1SBBYlv2UEKV2DA1/N4W
	6PRPmCNJxaQVu0FTO6XIc+jAGNDUFwgU21A9H9mE4WYh/RluYc7v054N9b8l1kPLBzpgdaC4V5DR9
	IJiaHuha0bNW2L8WPpU0v/coHfs2NC11SxNqyKAPPuZpdJsGVhZd+7PDZ4KvsblfBsE66IKn4Qozj
	DKjUtbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5htD-00000001bbv-11cg;
	Sun, 13 Sep 2026 10:56:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5htC-00000001bbO-1JTa;
	Sun, 13 Sep 2026 10:56:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14FAF404DC;
	Sun, 13 Sep 2026 10:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AA81F000FF;
	Sun, 13 Sep 2026 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297010;
	bh=VXU0FpJrrfRxjV/9XuJ2ILsuuq4iDXIkX/VBK1uBhLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CbwG19Dr90iyMGAdA2iqv+xEBM5hdQaSqY1VBIEMQPUHoihasv8p6VcXDuOhHrI+r
	 Snc3eyxofnfD1/cPR7gqDRJlIDNI/arGd7yq0VR/zm+do0ylZ0LkcjR/btIzome9Vg
	 13vADLnO1b1tj3Vz0Q9rkEgA4CYFgli+wSZn+9XXEE7mIwkequTsMOdISaQ3UwaeB8
	 Uj53cty5/gx7TT/yUvZ+u+mhg55UG83glAzJUkRMXkz4eOL56L0DpetjNn4Aqd9QYt
	 s0cG1Q5yJ73Nf3517+24w1F1ddbQM9YcGVLlLS2xiMTDDD0V+cqKRAO5fM51ExInig
	 it0vWP8u0oHWA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909220810.52310-1-rosenp@gmail.com>
References: <20260909220810.52310-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] phy: apple: atc: remove stale kernel-doc for removed
 struct members
Message-Id: <178929700630.215437.14303908364654670254.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 09 Sep 2026 15:08:10 -0700, Rosen Penev wrote:
> The @sw and @mux members were never present in struct apple_atcphy,
> causing kernel-doc warnings.
> 
> 

Applied, thanks!

[1/1] phy: apple: atc: remove stale kernel-doc for removed struct members
      commit: 44e2000fe44bce2397b5be89cdafc28ee1bb0e66

Best regards,
-- 
~Vinod



