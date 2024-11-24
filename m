Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB954D68BFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb6C0QotB+GhxMngHwpSBEIat8IU8D8Js/mlTgZEiZI=; b=YuaG6UppRU4/qokrUStY136vvS
	OTaubpk2pHBLC3HtCm3Nxu5chCbZI+PQWfokge5YxlA+eAbpUQCNTW2KsvElwU9H9VEvXijNUZsMb
	ai1KWcCQPMHNVVPhiWnRyxvnwmOm9sJmlMce9pQe5iN3z+t2PKp5/Bjx2REgyHIZ2vvt6o81Jq+Sb
	Dqj9wFoOuoU8l54pJZny7ZmpMsTQGRnYWyGyieu1pkJxy8Qp+p2wXpqglaqHHIyjNT0dk1KGUvZRF
	mghaUscVGmGv+z/RSJjCz2ztoKHQ5EgpprNroeBY9iFUvl6rNVrqRVWQwg00zQoRTMphEJ2cIIa7F
	FV4P81Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGvh-00000006TE5-2dpD;
	Sun, 24 Nov 2024 18:01:53 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGoP-00000006Rxh-0aDJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:54:22 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 626AAC000C64;
	Sun, 24 Nov 2024 09:54:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 626AAC000C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470860;
	bh=5B8SJwl+2MC5e0e+vdAMMkgrqinRJsXASoWZ93ePqgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rFiGsHubBNoBScdfkd/reykGXCZ4rEhhFxbg+Tt5ZrQPzECPVEsxUYAzPIXHiOQio
	 8JhJjTvmdPazQzQAJCzH45H04SgJ5hJCmc+ZfWMByAyI7ZHHAjigOKe+lnax3VC+wA
	 mCW9e4r2dNVGbKWnEZnFy8b1x1o0W51SWj0tKahk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id F135118041CAC6;
	Sun, 24 Nov 2024 09:54:19 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 9/9] ARM: dts: broadcom: Add Genexis XG6846B DTS file
Date: Sun, 24 Nov 2024 09:54:19 -0800
Message-ID: <20241124175419.718113-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241019-genexis-xg6846b-base-v3-9-8375a0e1f89f@linaro.org>
References: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org> <20241019-genexis-xg6846b-base-v3-9-8375a0e1f89f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095421_253911_5D51E558 
X-CRM114-Status: GOOD (  10.29  )
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

On Sat, 19 Oct 2024 22:39:38 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds a device tree for the Genexis XG6846B router.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

