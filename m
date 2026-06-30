Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D4C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3WZwEHEb85ZkRCrbpTyDX+sXwXVVXCmTst5tFt0WoU=; b=NW29RH3ajPZiYd5LgCNlxixemV
	fJYXZnc0ahPZ+oNQ3Mrmhg+Edr77l2ZD91BOw6l/XqNVKTeg7M44I4ZQ2t/lZcGvYXyL2rXCrbkqJ
	HEj+6GEwsn0kdmCh5crU0lIJktLHphPsECz4IWzmGLKQgI6oIpTgpnqBhmfFnxCkMhHKrgjPMDZup
	5n8LbyQR+8vUH2zMlMDU/6n2m5b3yzyUqT4qrbfnh1stwV8/mJatiD015VT5Ic+CjRpI6JzV1VpGl
	vw6z+CYOh/nQjJ9M0U6BIxi+2pYtRD5RRCaP74ijlRWaMkdy4qmlElAqbWlVusK+8M74WuXBqHyRJ
	PUT1YedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUxN-0000000GTu9-2U7B;
	Tue, 30 Jun 2026 09:40:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUxL-0000000GTte-3z9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:40:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0ECA4347E;
	Tue, 30 Jun 2026 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640781F00A3A;
	Tue, 30 Jun 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812439;
	bh=k3WZwEHEb85ZkRCrbpTyDX+sXwXVVXCmTst5tFt0WoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HC1tDAtQwTeLR20Q7tlypDNUahVsP6GoZML8KiCmjS2Bbh1qXa6ZdIRxfB/xxZPql
	 Ct35gO4cqBYt/+KBr7UwSf1MfTgcosVRAZDwBOnVa4wEKEzMm2ofFvia7O1L/Qo8HS
	 sGQFBpwGoTAO3ihceg7QTAkfbS/Mjy1vPUbVjH0JZ+xL23POZtDcAIm/EhA4w+dQR5
	 YxBDeKrc28Yc2ku/mE5ellBt4mkpcQc7jbzdY/EqQSamuSr1JucNh8b71x2uU3ZxFM
	 1sehHBhcBEDMwsroKZ1ZKWFnW9wW7NwAUTmgka3RFRt2hN+gsc7fi14uV/I18eAd1o
	 5/XOfsgW4Bdgg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Grammar s/may needed/may be needed/
Date: Tue, 30 Jun 2026 10:40:35 +0100
Message-ID: <178281184461.1094562.13812254750966468739.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
References: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
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

On Wed, 03 Jun 2026 17:17:51 +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_POWER_CONTROL symbol.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Grammar s/may needed/may be needed/
      https://git.kernel.org/sudeep.holla/c/05e5ffde9b666
-- 
Regards,
Sudeep


