Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBC3C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YvZ4kVt4dqBDxffzaLkFF722/OO9QJDhfAFiG7FZZM=; b=JQwKCgoxPDX838BqFEUiUm6TeB
	7u2/JTGmOPV9hUMw7nN2vrkg7NRU4FNgP7E623WhFKH+1WeH4L/YbaLTonYmFuDBBTPIjgYUKpdGn
	GqKJYWQdt0m/bIU5/nO2nHe/QUC1GSJDu4KGVf2A9X9Nk0rCzOdkjNTm0XI1sHllZ7c5CS10eO/Wf
	ibR9K2zRgLEpSGUwAuhlHXI8pjsL6asAcJPe/erZHZtaxXeMpARuVRh3xF3kcfhu089siL59FVT6o
	CBJErnE1dyWLEhPluOiydX5P68aET5SwYtcneXtHwdCaYMOySfVQiB2tvSuquHuhoDB318NrCyOaW
	VcwE888A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa9C-0000000BUtY-2eck;
	Thu, 30 Jul 2026 23:26:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa98-0000000BUrq-2N8b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:26:41 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7B732C0003F9;
	Thu, 30 Jul 2026 16:26:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7B732C0003F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453997;
	bh=x09/5qC7zCH4AEATkKJvdGKeAGwMUMYzOJHttrM4C7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gv/t0Rz4d8OcPOl3klbO9iWGRWy97ttHp1czKHv09xY42n48KHYGBs2smpaz3qx6M
	 B6VVXJ2ILCUSr5FK2mdf1c/UaP9cjaUUjqeR4OdrOJ/ZXps3ACE7xRkJyFW3o0Z9wb
	 GG/yH9sHGXYDhfxOEq2mp6WlLKZWCSNi7Wga0xFw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 28903AD9;
	Thu, 30 Jul 2026 16:26:37 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add missing phy-mode and fixed-link to DSA switch ports
Date: Thu, 30 Jul 2026 16:26:36 -0700
Message-ID: <20260730232636.2706946-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727221728.40811-1-rosenp@gmail.com>
References: <20260727221728.40811-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162638_670321_F4C34F1F 
X-CRM114-Status: GOOD (  11.80  )
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

On Mon, 27 Jul 2026 15:17:28 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Ports 5, 7 and 8 in the BCM5301x SRAB switch node carry an 'ethernet'
> property linking them to GMACs, but lack the required 'phy-mode' and
> 'fixed-link' properties. The DSA port schema (dsa-port.yaml) mandates
> that any port with an 'ethernet' property must also have 'phy-mode'
> and one of 'fixed-link', 'phy-handle', or 'managed'.
> 
> Add phy-mode = "internal" and a fixed-link subnode to ports 5, 7
> and 8, matching the properties already present on their respective
> GMAC nodes (gmac0, gmac1, gmac2). This resolves dtbs_check schema
> validation warnings for all BCM5301x-based board DTBs.
> 
> Assisted-by: Opencode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

