Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26198FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5i0ZYoicdL43WO2KoRtMaGT7H+4UnbTBh1N59iOnIc=; b=PLUzdKf5/tu+F/1kbS/zbbTGe8
	LXOWSoimvaM9wgfj0V2iGC+izjPifK+Gh5nRSlJ5gbKkLTGq5xpws3RUGk0G6c3YpbC0uiTYuh3pn
	KmY3F3TzXeIazIzWW91uLOMtTp015DiJiTap1KyDQwYK2CvXQMWIMgvcqgB2GaCcfJyNBIDE0cqid
	1iku166J/6uM9uPqsW5DztZ3zudF1J7shMx8556vjLF9hTsBKLxWGe/wZoHO5zt6OgGj3n9ZXyR2X
	qKCx40n8Vqej5ZY/E+7LfOjlRMjzbfX+sHJoXSkwErZsDeT7jc6hPDURWwLpPvMv1klNopQ0SZAdG
	p514alcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YX6-00000006y2z-3m5Y;
	Tue, 17 Mar 2026 17:48:44 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YX5-00000006y2L-00ET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:48:44 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 078C5C0000EC;
	Tue, 17 Mar 2026 10:48:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 078C5C0000EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773769722;
	bh=CGCxOFBSb231Uu15gV/g+PA99Lov3oSXV2BrPS9ckxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0lw+luyCSbekqdzw9yQUfWyjRDEuReTsBX2Q9wx98+ZKxjb+qcxSN2em0LH4gpC6
	 WgT0T6xRv+NS96KGr4LrxJW+QsaKrvNGAKFCUPJBJiOsGMAsbGtayA2T0ppNWaXY/m
	 1xp+Nvta158Zcmwa5JP5znoDiinVDKt8sze5f1lI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D4090A83;
	Tue, 17 Mar 2026 10:48:41 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] ARM: dts: bcm6846: Add I2C bus block
Date: Tue, 17 Mar 2026 10:48:41 -0700
Message-ID: <20260317174841.862136-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-3-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-3-5373ef82c50c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_104843_086171_4D6D6475 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Feb 2026 10:30:50 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The BCM6846 has a brcmper I2C block.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

