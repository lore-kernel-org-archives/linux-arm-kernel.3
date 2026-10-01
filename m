Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339FBCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJSNW1Nh+jeKu9IM53pNrbZjZk3Gu6JQhB6eRet0GVM=; b=KOqVtZEEBjZeBrRRKSmYH4Sk1k
	3oIYPzKfgPMQne91yl3ekqb4B1dLAclsAIZfQxsF0s2D2IeqfG8G4Jh52VLKrrTZccTFoeNlZV9Jf
	PoY6KAsNqjVj2KKvCZbriE5DdHrrikC3K442gLQLhsnJf5n1LRldAHrU5ts55Fzln2O6YStsSrv0Z
	a0/0FP7IZ7ca1TZZh2+Wqhy/jS21O7LjaeCNA1smNgdMdFk+C6x2dCFxoe2p4QWRAXCM3T+QjY9D7
	mblbluS6kPp7eEhkXLtbP9gDsiyDjufQYBAN/YmCLsmynRnFr7hVvM4ykWxLzv6o+ujPAJSu2j1C7
	Fd6TVNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIZP-00000009V2j-0ftJ;
	Thu, 01 Oct 2026 15:19:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIZM-00000009V1V-2TPo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:19:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 268D343257;
	Thu,  1 Oct 2026 15:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926F81F000FF;
	Thu,  1 Oct 2026 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867976;
	bh=jJSNW1Nh+jeKu9IM53pNrbZjZk3Gu6JQhB6eRet0GVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTkXppNFnfdRbneNk5ZQklG4UJeAYT9SsZ592rI0v4yG7RZdK+DO4uVF4luR+H12R
	 sacUYdV3ACLBd5CY+QGbC5NCl6vFJPhRRwFiivk4ZTl/hSiMwZmXLCP8VRZECq1CR8
	 8byqY7X7An/9ZTMSiYuKCP73XOPr4dDtEndKThhCIZ2hrOBVKcZhVI1cu/ZmEortri
	 t9EQOuyYKP7RSOnosSMnGNKMQOBj+B+gn8kSi1wNGMtkYsFzl6I8lEgnlDNqjM1Aos
	 jsVOjiwFvQwlI1WqI2+JMB6SqeQKSyO0UscPdjEx64eC91ZgmfBOC79o4zzqauqB52
	 P1iEZZVAqZQqw==
Date: Thu, 1 Oct 2026 16:19:32 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: kconfig: Select generic pinctrl helpers
 for scmi pinctrl
Message-ID: <20261001-steadfast-natural-agouti-fa7842@sudeepholla>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
 <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
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

On Thu, Sep 17, 2026 at 03:55:57PM -0700, Alex Tran wrote:
> Select the corresponding pinctrl and pinmux generic Kconfig symbols
> when PINCTRL_SCMI is enabled.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

