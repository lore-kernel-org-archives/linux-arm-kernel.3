Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050ABC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWBG6J2O/4jpTtaikZn0E2AacJFXwFE4jYJbysntSm0=; b=Qsd47pDTiG+IwyyHHFkKoYU4Vu
	d2Z2x4slycWCT7HVLy5/SRVnd3oQpIU77p2bK+1wjnTqAuxm1DJOgneDjktqobxsvO5wjo4S3A1LI
	4d7b14yi7djZ175QJRX2qdQA+BlmuAtstR4VuOKiMKChbhNqTtfc3WiWkD9QRzOmkIzmnmSB5BmkW
	sj/ra570puYJbUJVcjJHne84ouZNT/xp03m4axsjcAzpyoghuBOgtv+ROn8y+18DnX/djf2Nkaori
	4FAzCmo+7dS+LIWU+jI6hFY/z5Gg3ItFbz9JH2jqOQ1zKCpVlAIh0nyVXILo0AcrQxxXT4Pf23Fk5
	U7S5tdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBq-00000006243-2PpO;
	Tue, 15 Jul 2025 19:19:46 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjfc-00000005qSw-193X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:42:26 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C1414C0005E0;
	Tue, 15 Jul 2025 10:42:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C1414C0005E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1752601340;
	bh=szoPdU8t5HxV3+qu49EKJRl2lJmf68LJg4pDte/fGFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kT4Ewi0gvW8Ipq8NdA8VUvem2aII/sgJ6l8dGH1wH92aJnwlEqh+22j3tNHNJfUNz
	 LdM4clMG0Vd1AlGgKOEnFdeNdgH2hPN8XyzcB6pmIxHGZU6/GgzBGRK60uVnKy5vVh
	 NvivarNrIm9TTzeF1vSMwnkZ8YlD6NISJv2AAUbs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 56FB218000847;
	Tue, 15 Jul 2025 10:42:20 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: broadcom: Fix bcm7445 memory controller compatible
Date: Tue, 15 Jul 2025 10:42:19 -0700
Message-ID: <20250715174219.2421220-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701175538.1633435-1-florian.fainelli@broadcom.com>
References: <20250701175538.1633435-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_104224_408880_F9986F81 
X-CRM114-Status: GOOD (  10.19  )
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

On Tue,  1 Jul 2025 10:55:38 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The memory controller node compatible string was incompletely specified
> and used the fallback compatible. After commit 501be7cecec9
> ("dt-bindings: memory-controller: Define fallback compatible") however,
> we need to fully specify the compatible string.
> 
> Fixes: 501be7cecec9 ("dt-bindings: memory-controller: Define fallback compatible")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507011302.ZqNlBKWX-lkp@intel.com/
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

