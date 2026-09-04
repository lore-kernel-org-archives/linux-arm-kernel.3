Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7C2C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7pDuV/Jf/i3qKGKWxIBonJVYIXnOz5csNFqkw/ubSY=; b=nPvebCGmqbF3QzZ4zUCEUcsqyZ
	XqAlakuhUVJxo+70xVE2G3m9ax3ImXVnZU3ycQKGu5ilq5TeCXr56ACQv07Xl9fbJ4INZxdNHybpR
	FfQfuLhL9bYJbCH5vBTUFc/fKIIbbmiIQdsH9XnX9Y7sb6SoCK6B/Y6qgshuACSSm88600TAV2Wn9
	8ap6Hyd/nb11Pqt4NMlCcvOqGyZNZZJ/IoWL/nh9jQIRxXq6lUCrhZnNNUAvQgM1XthT060XlchKW
	7GMZB82Mw1GGWwt+szagS05AW3csLNoaNguBATrMRJS0SQN/xPP77evZziM5md2D/Q+b/e0NKhg8c
	d2y1z8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Trn-000000029Jo-0392;
	Fri, 04 Sep 2026 13:22:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Trm-000000029Jd-2SSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:22:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10636600C8;
	Fri,  4 Sep 2026 13:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991851F00A3D;
	Fri,  4 Sep 2026 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528121;
	bh=v7pDuV/Jf/i3qKGKWxIBonJVYIXnOz5csNFqkw/ubSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B6PmqizP828Mtb3D+WRROf1OoLbIhnqUF7IfT4QVq+fsaKr76SlAW0gD1lyLn/T+D
	 hkYjVHoyfGGocaIkvodwQ7F6OTFbNwWqk7ppOqPd6Z9ywbA3pbMbODWj5w5hkanzgL
	 hjRHc3mdn0oziY1EVmzm0G5/W7ztOKIvxSb+XhDishw+gMV6IvkY+tt6zgps7z7yTg
	 d4LNBT/5h4XHM4rL0imbIh0GPkqTuSl/ewJCl2M3qdJjn7WEKEwek9UT8tlwDg6jS8
	 uOvG7l5DNqyJGdomZ/f5rsMz/i2B1GjM4+gC6ir2jpp3gShYHaBKZdUr1ewl4OMH1T
	 nZLrTrIwJIh1A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: fix typo "upto" in comment
Date: Fri,  4 Sep 2026 14:21:55 +0100
Message-ID: <178852808698.331840.17304144326321992215.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103732.7320-1-hemanth.selam@gmail.com>
References: <20260904103732.7320-1-hemanth.selam@gmail.com>
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

On Fri, 04 Sep 2026 16:07:31 +0530, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix typo "upto" in comment
      https://git.kernel.org/sudeep.holla/c/44caf1844a25
-- 
Regards,
Sudeep


