Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F947CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 01:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uL75prvgW+wJB6okTWkfXgiVRAHI/46T0CBY4F1eUuY=; b=5AaNz09nNIhzICE1pdv9mgA2J2
	Qh5GcHnXCC++fgdkPEJvz9Ouk3ZN5HhdhZ1RAJIWyHNTyGlHgIADc0TORJseI1baCqVwZW4VfxpoD
	a77yufJUzGMB7ZBxdYV04BBe7J1wOGikMxXHfSLqQYrocDFLNe1G7nfOW2QHCfidfHh2SrlzGtHG4
	/SV5hQAO4xexUDGuBQ1KltwLApjm0icb9mKdltpja8NnJylmgKX1JDZQyfSrttS7I258VOVPf4qos
	6Z0CY8nCv5Fqf9hYoVHwySQj3Q+4uc7PO8Bl2QTdMK8SxEq642odm2EnL8JCwKuTFtN9v6qJ7TAzL
	15Djlmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xZK-0000000EmHJ-2shh;
	Fri, 26 Sep 2025 01:48:18 +0000
Received: from mail-m21466.qiye.163.com ([117.135.214.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xZH-0000000EmDW-3E6r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 01:48:17 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 241b800cb;
	Fri, 26 Sep 2025 09:48:08 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: adrian.hunter@intel.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	will@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH 0/9] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Fri, 26 Sep 2025 09:48:07 +0800
Message-ID: <20250926014807.2919409-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f64b0e00-1c30-47a1-b6b0-1bc28cc7f8ac@app.fastmail.com>
References: <f64b0e00-1c30-47a1-b6b0-1bc28cc7f8ac@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9983b4cc3a09cckunm02b014f18bacab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpCVk4ZSx5PTBkfGk5LTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dw80sa2cDL14SK4ldMNnUd3MPXuHA84uZtjN7fE0A7GNysxx1MCj/4tXyZeh8fFHSkI2wIYFXO8PFveocuCppX18lLF50mod2zj8AZn4RZDP4tRcH7BUrrkyRUszhdYd3iyKGdlpsEOGdI1Gw28c789g7ED83x2vuJyULwUzEqo=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=uL75prvgW+wJB6okTWkfXgiVRAHI/46T0CBY4F1eUuY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_184816_387435_F3746096 
X-CRM114-Status: GOOD (  21.62  )
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

On Thu, Sep 25, 2025 at 03:38:44PM +0200, Arnd Bergmann wrote:
> On Thu, Sep 25, 2025, at 15:34, Ulf Hansson wrote:
> > On Thu, 25 Sept 2025 at 14:12, Albert Yang <yangzh0906@thundersoft.com> wrote:
> >> On Thu, Sep 25, 2025 at 05:03:57PM +0800, Albert Yang wrote:
> >>
> >> Hi Arnd,
> >>
> >> I may have missed an important detail in my previous note. If I split
> >> out the MMC-related patches and submit only the SoC parts first, I
> >> cannot validate the SoC on real hardware: both the kernel and the root
> >> filesystem live on the MMC device. Without the MMC stack (DT bindings
> >> and the controller driver), the board does not boot to userspace, so I
> >> cannot properly verify the SoC/DT changes in isolation.
> >
> > At least to me, I would not consider that a problem. As long as you
> > can test the pieces together "manually" that's fine, I think.
> >
> > I mean, the platform was not supported in the first place, so it's not
> > like we would be introducing a regression - or break something, right?
>
> Agreed, it's rare for newly added platforms to immediately have
> everything working, and we can still fix things if they don't.
>
> It's also possible to test userspace by using a standalone
> initramfs with a login shell or an automated test suite, but
> I don't require that.

Hi Arnd, Ulf,

Thank you both for the clarifications.

Understood regarding validation expectations. I'll proceed with the split:
  * v5 SoC series (no MMC binding/driver, no mmc nodes in dtsi)
  * Separate MMC series (binding + driver) to linux-mmc
  * Follow-up enable patch once the driver lands


If any critical fix is found while iterating on the MMC series, I'll send
a follow-up patch depending on timing.

I'll move ahead with preparing v5 accordingly.

Thanks again for the guidance.

Best regards,
Albert Yang

