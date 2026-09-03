Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE83C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCe9bDp36lcd1eUQbMT60hSWR+yVdKY6GLpVUvgz2Ec=; b=1GW6q78YsgvjIaFzeXh/t7Ej0W
	pbQQtynuu6lAmyZIggNGra54gou+L6rGEWAhSJqi8iWUhK8krg4ZG14w0YtX2sDC4pbPzMNL0cdrc
	dz75zTF0RRAl8Vim0najqCiSVbuyN6D7ARaQ6v9YlKrjSsi+SaMg94+BGxxXQxts1VtDDHfgweoCa
	XKU3NJRxV9noGFGIp/brjEoUsIQfQb83aosrlGuMnUaZk5/hW8G69uM5MryF/hbujWDx5MlGKqHGa
	BCocEzWO/PMeRV0+MhmQPiQgcP91wAax4yOhRuPw4/DsDoqpM+qKlydKAHfKfQArKz2s+/wkGyAdQ
	fCuOTKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DXD-00000000WCI-11Cf;
	Thu, 03 Sep 2026 19:55:43 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DXA-00000000WBy-321W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:55:42 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B201DC0000F8;
	Thu,  3 Sep 2026 12:55:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B201DC0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788465339;
	bh=+Y7LcAXasqCLrxXPAcBhJn6rf7lf3GRbJ/5cPb/kUSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DON0eii9hT72AJdLxhuaexdN6G15x5NoGxVZQGu37MV2oQ1fVPQNY+DxPWr6oV6iv
	 Mx8lsUQ/U49vt6H9Y8rRgj53fGJHcS/lnMAsqZ7/fZ6wvPhctJOEUws0WMkB8/TtWc
	 pp7Gtsvh8eeirFrmBaoiWW+hnrTSrDuquDJv3rUA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 58989A9A;
	Thu,  3 Sep 2026 12:55:39 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: panamera: remove reset-names
Date: Thu,  3 Sep 2026 12:55:39 -0700
Message-ID: <20260903195539.2040848-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805190846.8312-1-rosenp@gmail.com>
References: <20260805190846.8312-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_125540_819994_94E215E1 
X-CRM114-Status: UNSURE (   9.69  )
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

On Wed,  5 Aug 2026 12:08:46 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> reset-gpios does not use a name for GPIO acquisition. Fixes dtbs_check
> warning:
> 
> switch@0 (brcm,bcm53125): 'resets' is a dependency of 'reset-names'
> from schema $id: http://devicetree.org/schemas/reset/reset.yaml
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

