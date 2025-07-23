Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A566C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OzaRMqUvouZ6E31Qa5pVqKmQ0H/5aEUOSPumNcJa8dE=; b=IVESQWL/yNbKYYjsW25iG4vpgg
	vQMCZ9BMFjDvi7GVFfyqZcXZep+597LB+oWsyz4PM7GBb+oVDwFqDIxvxxfixvZ0uFeum2q5Y/zBT
	saqvXL9BKJJwjcQjEMNAem5jlrM6GD/GP31fMEpEWR9hz6PE40BdZNNOJ52wOAe3XZ42l9tDyfOp4
	QWpuyYoh4E/VyMI+Mm/e/hYDEAOTtKTHKxbq7nAjhqQxPRhHQX45DMzfugLOPm2wN0OrqRiND994Z
	fda7yurNw917vOQs+8fiYlZdQpuGV7M/8uXJrIX/2wE3o7D8CHJbp/mkNCWTeJSzb8aVstVGYuVZj
	yRoJVbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegjM-00000005xct-1nNI;
	Wed, 23 Jul 2025 21:10:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueggv-00000005xSs-4Bim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 21:07:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A34D8601DC;
	Wed, 23 Jul 2025 21:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FF4C4CEE7;
	Wed, 23 Jul 2025 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753304875;
	bh=hGZi/sGJfyKViWvaeWB9IxwYAFMpegznJ3FoUdmRua4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gqi24YdzNvYMSEIuuWnPsO3qvZPiXiuqNjVcRfI3ca+QDOlIcQVctCxQVwASMg5RX
	 kKSN+++vsYRtkShZ2jIn7n9mnmWan0sWyf9+j+FcP1OtPuxskwkhbcBrudkhSfoBKM
	 MwmwBIod8AjBdQ/hY1VSFZgckrvCYWKj/O2in06m0I/WanJYb1r1IR60YOAcAziIdW
	 QYWA/wf2slXq8an5oX99umRK55OTSZfqqlK7svVQ7zZjSWH1qmRk8TZE8MxVKrW29C
	 cWzdu9fXmeqRxFHvDhtl27/CeRoyfGjJNhBAnXRLQMGg+xL3G10u4SszsT4uTcCqVc
	 G6X77xbTuvtGQ==
Date: Wed, 23 Jul 2025 16:07:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Bruel <christian.bruel@foss.st.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [RESEND PATCH 0/2] Add pinctrl_pm_select_init_state helper
 function
Message-ID: <20250723210753.GA2911683@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZHw8am05Qcjp7FJyo7D7bZcvzZKVjdB7BUCq3FuQCy8A@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 01:32:52PM +0200, Linus Walleij wrote:
> On Thu, Jul 17, 2025 at 8:33 AM Christian Bruel
> <christian.bruel@foss.st.com> wrote:
> 
> > We have the helper functions pinctrl_pm_select_default_state and
> > pinctrl_pm_select_sleep_state.
> > This patch adds the missing pinctrl_pm_select_init_state function.
> >
> > The STM32MP2 needs to set the pinctrl to an initial state during
> > pm_resume, just like in probe. To achieve this, the function
> > pinctrl_pm_select_init_state is added.
> >
> > This allows a driver to balance pinctrl_pm_select_sleep_state()
> > with pinctrl_pm_select_default_state() and
> > pinctrl_pm_select_init_state() in pm_runtime_suspend and pm_runtime_resume.
> >
> > Christian Bruel (2):
> >   pinctrl: Add pinctrl_pm_select_init_state helper function
> >   PCI: stm32: use pinctrl_pm_select_init_state() in
> >     stm32_pcie_resume_noirq()
> 
> If Bjorn Helgaas is OK with it I can apply this to the pinctrl tree.
> 
> Otherwise I can also just apply patch 1/2, but that doesn't solve
> any problem.

The stm32 driver has been posted and is on this branch of the PCI
tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dwc-stm32&id=5a972a01e24b

but it's not in mainline (or even in pci/next) yet, so you would only
be able to apply patch 2/2 if you took the whole driver, which is
probably more than you would want to do.

I haven't put it in pci/next yet because it doesn't build when
CONFIG_PINCTRL is not defined:

  https://lore.kernel.org/r/20250716192418.GA2550861@bhelgaas

I don't know enough about pinctrl to know why stm32 needs this when
nobody else seems to.  I doubt it's really unique, so maybe it's just
not doing the right thing here.

Bjorn

