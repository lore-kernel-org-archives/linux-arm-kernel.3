Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D4E1099B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hEVYwxtph0pwMr0oHmpax6l8oDj4nM3kCx5vFpcKTg=; b=d4rXdmOD0732q1xJ9ExOr8uWdB
	ShqfprJ+j9rDzsovQowIx65MpnKNvAB1xHuFuDSrYV/RU1LTV+K294ncUmqj8YxXWvObVpiFR9THb
	EWszoRP7cjL/uuyTS8sdxINHq4S0MFv8qv7bNeo6GtYParfhE/drIdjEOUqhMbP0huMow1MbXnw+p
	uIpfdDSSI5SfAwxcIljH75Ul2Cz1bYK4rbKFx0XDCv409PTrsjnwd1T8C8n3w37lDtrsj+vDh1fgH
	T/W0fnixSO7Qawdhri6P3KED0QTqIKg/5OQan2J/YGqwz+b5bU6yd75eCKuk2RlDIry2NoELocGNd
	/LECywBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dcA-0000000DF5b-2pvU;
	Fri, 20 Mar 2026 17:26:26 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dc0-0000000DF2c-3VdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:26:21 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E8E9CC000521;
	Fri, 20 Mar 2026 10:26:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E8E9CC000521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027576;
	bh=zUA6Zz4yV8SPxqQ56DVLw5sDxp3oorgKmfkr1wknfMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXN5TWgGDEmucw3n5TdZQlQj6VrZ4gcPKnCLdpH4aqu2SoqHmQoLJ3sO8kN9TyazK
	 Fn0IJPKGBr0aN4nwyGZoXqxO2g2z2sU6SXsSEKd6ueszaqBifArto9feXVZrpg7EEi
	 UtxLuv1Ds3ToJRbGhARvQoeCmhVcQVvZshBMrDQg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id BF504A83;
	Fri, 20 Mar 2026 10:26:15 -0700 (PDT)
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
Subject: Re: [PATCH 3/6] ARM: dts: BCM5301X: EA9200: add LEDs
Date: Fri, 20 Mar 2026 10:26:15 -0700
Message-ID: <20260320172615.3072049-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-4-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-4-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102620_131160_BF3010EA 
X-CRM114-Status: UNSURE (   7.68  )
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

On Wed, 18 Mar 2026 20:53:21 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Allows control and configuration of device LEDs.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

