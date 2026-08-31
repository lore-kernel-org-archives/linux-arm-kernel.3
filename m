Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bq5R9FFiEDojyvwVWbwB7Kn6wxZyxrobO4+TMgGULuo=; b=mshEP2T526bKbYeWmrCPtMmnos
	oUQ6p1AJVMPYxsGu+pIfzGG+7BXgIv0jNKGI1Ba4qfdytaAcXcfWWf3L9nLfnhvZ5mAc7/dCLiZQL
	e4MSDYiC/NjrDrDBJehY2KRiTxTPIGeQd1EJTw1uq9tdlJHSgjP2NCTjSTPwxfokmndsOVz+3nbKf
	Xz5EHfmjN7FsZRKO4/G5HzypWvCiuntp+KIPl/7Tb/W/LI4JUnhXvXzLDOWQpq1b1Ma+45DANGujD
	rBfBec3fMMv7dITscPwiyDRT8zZh8dOgNSi4YuknRSdsiBD2g+I06v17w/NAPsMEKsPgsnH3H4oNG
	0aMA7Lag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16DC-0000000AEyi-1LK4;
	Mon, 31 Aug 2026 17:54:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16D1-0000000AExA-29Im
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:54:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F24CE601FD;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B261F000E9;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198854;
	bh=bq5R9FFiEDojyvwVWbwB7Kn6wxZyxrobO4+TMgGULuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DSB8WQd+myAazv4wQLN4VD+RiDRAU6zTm3WH4J7M3YLSut9EY1womoqrVIqgGtjIr
	 C9l0rR5MW4rSSm8yFMT0QOft75l3WpKU/Fq0K7Dmxea/NaiUXFtiteGS8cOy3oo1aW
	 +3MxBzxvfhgtqKGQGm01/CVmd5UUhFL42bCszYed0NhvvqmSvDCA98RzVHc/Tt07VJ
	 yMuOqmhjfOPFl789bGVuMvUJcFpa4TE+vJS+LH7bUX4feheH0geuWmW1HcEiG9ZLen
	 N3Gp+WhtyjGNyq33ZwXVguSwWwXHDPEyXyFpe1xFTBTCYV30qOk0l4RuuRStm51q+M
	 +JChanX7wOGDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2
Date: Mon, 31 Aug 2026 12:53:44 -0500
Message-ID: <178819882998.1411250.15303424922068348805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-defconfigs-v3-1-bd8ef3322632@linaro.org>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-defconfigs-v3-1-bd8ef3322632@linaro.org>
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


On Mon, 31 Aug 2026 10:22:14 +0200, Neil Armstrong wrote:
> Enable the SGM3804 regulator, SY7758 backlight and Renesas 63419 panel
> drivers as module since used by the display on the Qualcomm SM8650 based
> Ayaneo Pocket S2 Gaming Console.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2
      commit: 6f422914412bde4c431706079525c581bf439e03

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

