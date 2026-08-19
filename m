Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D09C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsT5dUpowUwfV48p84bBBJHpjn5rT5djw6bOT8FiOVM=; b=IyAjb0zpFKjMSDqvWJjCSqBbw6
	GyNHtNFkeeKXopwHpdStox4mnlMK79XDdv/FXPg0Z9CI9+UmHp1Ct1YW7RV+rOZngI3O6rRK56Lhm
	t0XwoDoWCmgMf0ULcB3e3zUiNRRgt/Pohuysens8njvenRltYVqJK5YopdfPPfHSl7ubdGco0W9hu
	4tSWYEQiqpeDHL+IpzR/9o0z9DZDzlFmNbswniccBB0WsBL3JMsUkip4ZFNUIHifIMjmONJwCPgYY
	z+vX40ltdQvCGPArUzyqm9ZbbZ0fxOjSiwPpkIuv1d9jLo3hTn83AcMXfyk7aebE3ThUq6C8a1F3P
	H+mAcAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBh-0000000ABTu-2oDT;
	Wed, 19 Aug 2026 16:30:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBe-0000000ABT9-2NLJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:30:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 108624E412D3;
	Wed, 19 Aug 2026 16:30:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D27645FF42;
	Wed, 19 Aug 2026 16:30:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D7D411C7590C;
	Wed, 19 Aug 2026 18:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787157039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NsT5dUpowUwfV48p84bBBJHpjn5rT5djw6bOT8FiOVM=;
	b=LtQJ2AErDxv6YW+cmN+5RpZByvWZ9kFwRtyTHB2M8Zvfax0TxQOVEuFXkAqIpNIG2veB6T
	kE2MvT6ythFZax7MstE0Or81jG6leDKwK6exmUQViTK+Kqm8v5auuZU6f31t7Z6j9rVsLq
	/Ni9xDcv4z/B+uZnCDTUW2KDgC2N4LPDeaVW1TWWxKIaZ022NhR5UjTXorQgM3ZWV6reSX
	QvOYsH9JBkLAnCFnrd3aQDhECeGQaQx803P6O1I4NjCACjZXCMNiJJmXp7fHcwzhMWiUH8
	6AD7pWQvTSsUw6tMUIxeLgp6Co5WQOjY6kt8vljdpD1HGcet3zvJ52Gvn8nW1Q==
Date: Wed, 19 Aug 2026 18:30:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: brcmstb-waketimer: add missing MODULE_DEVICE_TABLE()
Message-ID: <178715693841.130787.17987818567876748858.b4-ty@b4>
References: <20260704121734.54941-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704121734.54941-1-pengpeng@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093046_747261_8741AF3A 
X-CRM114-Status: GOOD (  10.75  )
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

On Sat, 04 Jul 2026 20:17:34 +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> [...]

Applied, thanks!

[1/1] rtc: brcmstb-waketimer: add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/abelloni/c/402c89d28fec

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

