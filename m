Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AEDFED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EXJ9T5EFX0TUmq2tLTJ1WJLET29V+48U8i36pXmH9o=; b=F5u7PZcRJjGdv2y5EvhDgMeGID
	HdME6MfCo6i2t8NaEV6yX+uKV4bxhVnXSNLThWiTGn6746EIQT6dtSYqi3XUYQXDsmtCDbc6Uzprk
	ULkywKw9xmFM6QCsSo60bICfEb5yoPMauKbS7TQSTF3Dt4WrNd1/3fQ1ILyuYLQBDdhTjcKrPqZwe
	Smg9Hk0pMjOa6n7PTu6tOve6kj3sotnU7mWA/Rv/RVZ0e7JYKiJX/EiYSBPHMMthJURGz5CgK/rgS
	CN2fywqV2+MFIaO5zdWS2RxUQb0QoAbNuF3q0B2/VYBMJz6VMOaPsc2mjKV/T39ZHrRQGKAzt6HKX
	5dHkQRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YYD-00000006yL0-2GNW;
	Tue, 17 Mar 2026 17:49:53 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YYA-00000006yJz-2eTp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:49:52 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 966BBC0007FE;
	Tue, 17 Mar 2026 10:49:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 966BBC0007FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773769789;
	bh=UWvRAGAdrREilrupzMPu5+JpasSbVI1S0zcjCLMjW0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMCZ7psmdQEv0W60C80EWhkJQXEub6xHdUIqRgMMZ0PsdCVh2m1/E6Wwi6L1upZkO
	 iewgopVni+n577i/cVrDSTzfrf3CPVPg/M8ikJlxdBMcTBLfap0tsgXPNuZK68gT6k
	 lz2xgz3LDbAkEfKIttyJR1chSO5pFf/DUYzXI7W8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 4121CA83;
	Tue, 17 Mar 2026 10:49:49 -0700 (PDT)
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
Subject: Re: [PATCH v2 6/7] ARM: dts: bcm63138: Add I2C block
Date: Tue, 17 Mar 2026 10:49:48 -0700
Message-ID: <20260317174949.862517-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_104950_738968_34414035 
X-CRM114-Status: UNSURE (   9.73  )
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

On Wed, 18 Feb 2026 10:30:53 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The BCM63138 has a brcmper I2C block.
> 
> The interrupt is at INTERRUPT_ID_I2C whic is
> (ISR_TABLE3_OFFSET + 19) = 96+115, convert back
> to SPI interrupt 115-32 = 83.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

